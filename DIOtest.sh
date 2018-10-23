#!/bin/bash

echo "Installing updates..."
sudo apt-get update

sudo adduser mtsnlinux --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo password | sudo chpasswd

echo "Installing DIO test software..."
sudo git clone https://github.com/rsenegor-bpc/finalDIO.git /home/mtsnlinux/Desktop

cd /home/mtsnlinux/Desktop
cd powerdaq-3.6.26

echo "Installing drivers..."
echo password | sudo -S make install
clear

echo "Compiling tests..."
sudo make
sudo make test
clear

echo "Navigating to test..."
cd examples
cd SingleDIO
sudo ./SingleDIO
