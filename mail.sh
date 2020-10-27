#!/bin/bash

# file mail.sh
# brief Script to create user accounts from a list of emails
# author william.kloppenberg
# project 2 - user provisioning
# date 10/19/2020

#variables

password=$(openssl rand -base64 12)

#functions

#main
if [[ $(id -u) = 0 ]]; then #user is root
  echo "Enter the file name"
  read fname
  if [[ -f $fname ]]; then
    for user in $(more $fname | cut -d "@" -f 1)
    do
      grep $user /etc/passwd > /dev/null 2>&1
      if [[ $? -eq 0 ]]; then #user exists, change password
        echo "User $user already exists. A password change will be required next login."
        sudo passwd -e $user
        sudo chage -l $user
      else  #user does not exist, create
        sudo useradd -m $user -p $password -s /bin/bash
        sudo usermod -g CSI230 $user
        sudo passwd -e $user
        sudo chage -l $user
        echo "User $user created."
        for email in $(more $fname)
        do
          echo "Username is $user, password is $password" | mail -s "User Information" $email
        done
      fi
    done
  fi
else
  echo "Root access required."
fi
