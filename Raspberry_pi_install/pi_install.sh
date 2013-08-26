#!/bin/bash


clear

#first lets update and upgrade the pi
sudo apt-get update -qy

sudo apt-get upgrade -qy


#git is ridiculously important to us

sudo apt-get install -qy git-core


#next to install openvnc

sudo apt-get install tightvncserver -qy



#now to make it so vnc auto starts 

sudo mkdir /home/pi/.config/autostart

sudo cp $instdir/server/config/tightvnc.desktop /home/pi/.config/autostart/tightvnc.desktop


#setup DNSDynamic

sudo apt-get install ddclient -qy

sudo cp $instdir/server/config/ddclient.conf /etc/


cd ~
sudo apt-get install python-pip python-dev git -qy
git clone https://github.com/foosel/OctoPrint.git
cd OctoPrint
sudo pip install -r requirements.txt


sudo usermod -a -G tty pi
sudo usermod -a -G dialout pi

sudo pip uninstall flask werkzeug
sudo pip install flask==0.9 werkzeug==0.8.3


cd ~/OctoPrint/
git pull
sudo pip install -r requirements.txt


cd ~
sudo apt-get install subversion libjpeg8-dev imagemagick libav-tools -qy

svn co https://mjpg-streamer.svn.sourceforge.net/svnroot/mjpg-streamer mjpg-streamer


cd mjpg-streamer/mjpg-streamer

make

# now to install haproxy




sudo apt-get install haproxy -qy


sudo apt-get update && sudo apt-get install avahi-daemon -qy



sudo apt-get clean