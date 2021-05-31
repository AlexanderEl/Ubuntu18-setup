#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.

# dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software

sudo apt update

sudo apt instal htop git vim nano gnome-tweaks terminator bpytop rofi zip unzip \
    software-properties-common apt-transport-https wget \
    python3-pip build-essential libssl-dev libffi-dev python3-dev python3-venv -yy

# Add me to any groups I might need to be a part of:

# sudo adduser $USER vboxusers

# Remove undesirable packages:

sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell whoopsie whoopsie-preferences -yy

# Remove snaps and get packages from apt:

sudo snap remove gnome-characters gnome-calculator gnome-system-monitor
sudo apt install gnome-characters gnome-calculator gnome-system-monitor \

# Install Chromium:
sudo apt install chromium-browser

## Disable auto updates
gsettings set com.ubuntu.update-notifier show-livepatch-status-icon false
#set icons to minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

## Remove junk
sudo apt-get remove thunderbird rhythmbox ubuntu-web-launchers -y

## Install VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

## Install Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo apt install atom

## Disable Apport (To stop sending report data)
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

## Install system backup tool
sudo add-apt-repository -y ppa:teejee2008/ppa
sudo apt install timeshift

# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
