#!/bin/bash
#Name of the Script: privateMac.sh
#Created Date: 11/09/2022
#Author: peterdawsonsw
#LINKS:
#https://www.cyberciti.biz/faq/how-to-check-network-adapter-status-in-linux/
#https://www.baeldung.com/linux/unary-operator-expected-error
#https://www.youtube.com/watch?v=wNzuvl6_NSY
#https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4
#https://www.tecmint.com/assign-linux-command-output-to-variable/

COLOR="\e[31m"
ENDCOLOR="\e[0m"

echo "This script turns off Wifi adapter sets a random MAC address and turns it back on."
echo "Please install: [pacman -S macchanger] before running this script"
echo "Select one of the following commands to list the interface name :"
echo ""
echo "Press [1] for: #down"
echo "Press [2] for: #randomize"
echo "Press [3] for: #up"
echo "Press [4] for: #down, randomize, up"
echo "Press [5] for: #exit"
echo ""

while [ true ]
do

echo "This is may be your WiFi adapter:"
deviceMac=$(iw dev | awk '$1=="Interface"{print $2}')
echo -e "${COLOR}$deviceMac${ENDCOLOR}"

echo "Press enter if you want to use adapter: "
echo $device


echo "Enter the Adapter's name:"
read ADAPTER
echo ""
echo "Enter number 1-5 for options:"
read NUMBER

if [ "$NUMBER" = 1 ];
then
echo $(ip link set $ADAPTER down)
echo "NETWORK DEVICE HAS BEEN TURNED OFF!"
elif [ "$NUMBER" = 2 ];
then
echo $(sudo macchanger -r $ADAPTER)
echo "NETWORK DEVICE HAS BEEN RANDOMIZED!"
elif [ "$NUMBER" = 3 ];
then
echo $(ip link set $ADAPTER up)
echo "NETWORK DEVICE HAS BEEN TURNED ON!"
elif [ "$NUMBER" = 4 ];
then
echo -e "${COLOR}$(ip link set $ADAPTER down)${ENDCOLOR}"
echo -e "${COLOR}$(sudo macchanger -r $ADAPTER)${ENDCOLOR}"
echo -e "${COLOR}$(ip link set $ADAPTER up)${ENDCOLOR}"
echo "MAC ADDRESS HAS BEEN CHANGED!"
elif [ "$NUMBER" = 5 ];
then
    break;
fi

done
