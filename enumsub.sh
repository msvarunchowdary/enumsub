#!/bin/bash

if ! type figlet > /dev/null; then
sudo apt install figlet;
fi

if [ -z $1 ]; then
figlet enumsub;
echo "";
echo "      [+] by vulnerableboy";
echo "      [+] http://learn.xploit.in";
echo "";
echo "Subdomain Scrapper from Crt.sh";
echo "Usage: $0 <hostname> [-o <output_filename>]";
echo "";
exit 0;
fi

figlet enumsub;
echo "      [+] by vulnerableboy";
echo "      [+] http://learn.xploit.in";
echo "";

if [[ $2 == "-o" ]]; then
curl "https://crt.sh/?q=%25.$1" |grep "$1"|cut -d ">" -f2|cut -d "<" -f1|tail -n +10|sort -u > $3;
echo "";
echo " [+] Sub-domains are saved to $3";
else
curl "https://crt.sh/?q=%25.$1" |grep "$1"|cut -d ">" -f2|cut -d "<" -f1|tail -n +10|sort -u > $1.txt;
echo "";
echo " [+] Sub-domains are saved to $1.txt";
fi
