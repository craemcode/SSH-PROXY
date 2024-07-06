#!/bin/bash

#This is a shell script for the proxy server. We want to make the server listen for ben's connection and accept it without a password.


#Find out whether the computer is running open SSH
echo "This is a shell script"

#first we check whether the keys file exist.


if [ -d "kiev" ];
then
    echo "Keys present"
else
    #Since there are no keys, let us create the key pair.
    echo "Keys Absent"
    mkdir kiev

    #generating ssh keys.
    sudo ssh-keygen -t rsa -b 2048 -f /kiev

    #We want to allow ben to connect to the SSH server.
fi

##########################################
######install the open ssh server########
#sudo apt update 
#sudo apt install openssh-server
##########################################

#once the server is open, get the IP to add to default users (passwordless logins)
echo "Enter IP adress for client"
read client_ip


config="sshd:$client_ip:ALLOW"
config_den="sshd:ALL:DENY"

##count the number of lines in the configuration file
count=$(sed -n "$=" text.txt)

##insert our rules at the end of the configuration file.
sed -i "${count}a ${config}\r${config_den}" text.txt


#sed -i "1 a/${config_den}" text.txt

#SSH_VERSION = ssh -v localhost | head -n 1

#Generating ssh keys.
