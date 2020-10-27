# Project Notes

### Getting Started

For the test emails, I used my student email and an old email that I still
have access to. I avoided using my main email, as it is exactly the same
as my username on my Pop! VM, which could lead to unintended consequences.

I used openssl for the random password generator.

Creating users from the emails.txt file was initially confusing for me,
but I managed to figure it out through various online resources. The main
resource I used was [2daygeek's bulk users tutorial.](https://www.2daygeek.com/linux-bulk-users-creation-useradd-newusers/)

To check if a user already existed, I used a command similar to the one in [this](https://stackoverflow.com/questions/14810684/check-whether-a-user-exists)
stackoverflow post.

For some reason when trying to enter the given password in order to change it, I keep
getting an authentication error. I was unable to solve this, but I do know that at least
the part about requiring the user to change their password works.

### Sending Emails

This was the part I struggled the most with. I tried just about every method
there was out there to get it working, but to no avail. That was when I
realized I had to ssh into Pop! VM for it to actually even work in the first
place. For some reason it never dawned upon me until much later, even though
every other service that requires online connectivity requires one to ssh.

After properly setting ssmtp up, I used the mail command to send emails.
[InterServer.net's tutorial](https://www.interserver.net/tips/kb/linux-mail-command-usage-examples/) for using the mail
command was my main resource here.
