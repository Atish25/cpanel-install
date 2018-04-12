#!/bin/bash
#echo -e "\n############### CHECK CPANEL IS INSTALLED OR NOT  ###################\n"
# Display welcome messages!
clear
echo -e "\e[31m|-----------------------------[\e[96mWHM Install With Tweakings\e[0m\e[31m]------------------------------|\e[0m"
echo -e "\e[31m|                                                                              |\e[0m"
echo -e "\e[31m|  #####      ##     #####   #####     #####     #######       #######         |\e[0m"
echo -e "\e[31m|   #####    ####   #####    #####     #####     #### ###     ### #### \e[96m{}\e[0m\e[31m |\e[0m"
echo -e "\e[31m|    ##### ### ### #####     ###############     ####  #### ####  ####         |\e[0m"
echo -e "\e[31m|     ######## ########      ###############     ####   ########  ####         |\e[0m"
echo -e "\e[31m|      ######   ######       #####     #####     ####    ######   ####         |\e[0m"
echo -e "\e[31m|       ####     ####        #####     #####     ####     ####    ####         |\e[0m"
echo -e "\e[31m|                                                                              |\e[0m"
echo -e "\e[31m|                            \e[96m (c) (Written in Shell By Atish ) \e[0m\e[31m|\e[m"
echo -e "\e[31m|------------------------------------------------------------------------------|\e[0m"
echo -e "\e[34m Verifying You Are Root ...."
sprout
echo -e "\e[0m"
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[41mERROR! You are not root! Installation aborted!\e[0m" 1>&2
   exit 1
fi

# size o
grep -q "Congratulations! Your installation of cPanel & WHM" /var/log/cpanel-install.log
if [ $? -ne 0 ]; then
        echo '##CPANEL IS NOT ISTALLED###'
# Asking to set FQDN hostname
 
#if [ -z "${hostname}" ]; then
#        read -p "Please enter FQDN hostname  [${hostname}]: " hostname
#    fi
 # Asking for confirmation to proceed
#    read -p 'Would you like to continue with that domain name [y/n]: ' answer
#    if [ "$answer" != 'y' ] && [ "$answer" != 'Y'  ]; then
#        echo 'Goodbye'
#        exit 1
#    fi
 ## INstall Cpanel ##
#        hostnamectl set-hostname ${hostname}
if [ -z "$servername" ]; then
    servername=$(hostname -f)
fi


for h in $servername
do
    if [[ ${h//[^.]} != "" ]]
    then
        echo "Criteria Matched For FQDN"
    else
        echo "Criteria Not Matched, Use Proper Domain Name"
    exit 1
    fi
done

	cd /home/ && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
else
        echo 'CPANEL IS ALREADY INSTALLED / NO CHANGES MADE'
fi
exit

