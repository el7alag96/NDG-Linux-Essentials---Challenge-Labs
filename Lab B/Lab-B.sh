#!/bin/bash

set_username(){
    printf "Enter a username \n"
    read -r USERNAME

    if getent passwd "$USERNAME"; then
    printf " username \'$USERNAME\' already exists. Choose a different username. \n"
    set_username
    fi
}

set_group(){
    printf "Enter a group \n"
    read -r GROUP

    if getent group "$GROUP"; then
    printf " group \'$GROUP\' already exists. Choose a different group. \n"
    set_group
    fi
}

set_username
set_group

sudo groupadd "$GROUP"; printf "$GROUP group created. \n"
sudo useradd -m -s /bin/bash -g $GROUP $USERNAME; printf "$USERNAME username created. \n "
sudo passwd $USERNAME
sudo mkdir /$USERNAME
sudo chown $USERNAME:$GROUP /$USERNAME
sudo chmod 1770 /$USERNAME

echo "Successfully completed script!!! ;)"