#!/bin/bash

# My version of Up forked to do other things called JCB -- Debian/Ubuntu Update+ Tool (Version 1.0)
# By Carlton Bryan w4jcb.com (GNU/General Public License version 2.0)

# Set BASH to quit script and exit on errors:

set -e

# Functions:

clear #Clears the screen

update() {
echo "Starting full system update..."
sudo apt update
sudo apt dist-upgrade -yy
}

clean() {
echo "Cleaning up..."
sudo apt autoremove -yy
sudo apt autoclean
}

leave() {
clear
echo "--------------------"
echo "- Exiting JCB… Goodbye! -"
echo "--------------------"
exit
}

up-help() {
clear #Clears the screen
cat << _EOF_

Up is a tool that automates the update procedure for Debian and Ubuntu based
Linux systems.

By Carlton Bryan www.w4jcb.com (GNU/General Public License version 2.0)

_EOF_
}

system_info()
{
# Temporary function stub
    echo "function system_info"
    lscpu
}

show_uptime()
{
# Temporary function stub
    echo "function show_uptime"
uptime
}

drive_space()
{
# Temporary function stub
    echo "function drive_space"
df
}

home_space()
{
# Temporary function stub
    echo "function home_space"
    echo "Home directory space by user"
    echo "Bytes Directory"
    sudo du -s /home/* | sort -nr
}

pas()
{
sleep 2
echo
echo
read -p "Press Enter to continue"
}

# Execution.

selection="1"
until [ $selection = " " ]; do

cat << _EOF_
Press the number of your choice:

1 – Update.
2 – Clean.
3 - Help.
4 - System Info.
5 - Show Uptime.
6 - Drive Space.
7 - Home Space.
0 – Exit JCB.


Each number corresponds to a script function or a set of simple commands.
_EOF_

read selection  #read -n 1 -s selection;
case $selection in
1) update leave;pas;clear;;
2) clean update leave;pas;clear;;
3) up-help;pas;clear;;
4) system_info;pas;clear;;
5) show_uptime;pas;clear;;
6) df;pas;clear;;
7) home_space;pas;clear;;
0) leave;pas;clear;;
*) echo "Not a valid choice: Please try again.";pas;clear;;
esac
done
