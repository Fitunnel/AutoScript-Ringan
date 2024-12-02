#!/bin/bash
MYIP=$(curl -sS ifconfig.me)
echo "Checking VPS"
clear
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'

BREDMENU='\033[1;31m'*
NCMENU='\033[0m'*
bblueMENU="\033[1;34m"*
greenMENU='\033[0;32m'*
YELLMENU='\033[0;33m'*
bwhiteMENU='\033[1;37m'*

# // Log account
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2

a="ACCOUNT PREMIUM" 
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m${NCMENU}"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m${NCMENU}"

#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# user
Exp2=$"Lifetime"
Name=$"Dev-Alfi"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org?token=ce3da57536810d | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city?token=ce3da57536810d )
#WKT=$(curl -s ipinfo.io/timezone?token=ce3da57536810d )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
DATEVPS=$(date +'%d-%m-%Y')
TIMEZONE=$(printf '%(%H-%M-%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
IPVPS=$(curl -s ipv4.icanhazip.com)

LOC=$(curl -s ifconfig.co/country )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
echo -e " "                                                           
echo -e " ${NCMENU} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NCMENU}"
echo -e " ${NCMENU} │${bwhiteMENU}\033[41m        WELCOME TO AUTOSCRIPT PREMIUM AlfiStoreVPN       ${NCMENU}│${NCMENU}"
echo -e " ${NCMENU} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NCMENU}"
echo -e " ${NCMENU} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}SYSTEM VPS ${YELLMENU} : ${NCMENU}$MODEL${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}RAM SERVER ${YELLMENU} : ${NCMENU}$uram / $tram MB ${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}DATE ${YELLMENU}       : ${NCMENU}$DATEVPS${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}TIME ${YELLMENU}       : ${NCMENU}$TIMEZONE${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}UPTIME ${YELLMENU}     : ${NCMENU}$SERONLINE${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}IP VPS ${YELLMENU}     : ${BREDMENU}$IPVPS${NCMENU}"
echo -e " ${NCMENU} │$BREDMENU » ${bblueMENU}DOMAIN ${YELLMENU}     : ${greenMENU}$domain${NCMENU}"
echo -e " ${NCMENU} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$NCMENU"
echo -e " ${NCMENU}                     ${KIRI} INFORMATION ACCOUNT ${KANAN}"
echo -e " ${NCMENU}         ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCMENU}" | lolcat
echo -e "               ${BREDMENU} SSH/OPENVPN/UDP  $YELLMENU:$NCMENU $ssh1  ${YELLMENU}$a"
echo -e "               ${BREDMENU} VMESS/WS/GRPC    $YELLMENU:$NCMENU $vma  ${YELLMENU}$a"
echo -e "               ${BREDMENU} VLESS/WS/GRPC    $YELLMENU:$NCMENU $vla  ${YELLMENU}$a"
echo -e "               ${BREDMENU} TROJAN/WS/GRPC   $YELLMENU:$NCMENU $trb  ${YELLMENU}$a"
echo -e "               ${BREDMENU} SHADOW/WS/GRPC   $YELLMENU:$NCMENU $ssa  ${YELLMENU}$a"
echo -e " ${NCMENU}         ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCMENU}" | lolcat
echo -e " ${NCMENU}              ${KIRI} MENU AUTOSCRIPT BY AlfiStoreVPN  ${KANAN}"
echo -e " ${NCMENU} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NCMENU}"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}1$NCMENU]${YELLMENU} MENU SSH  $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}2$NCMENU]${YELLMENU} MENU VMESS $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}3$NCMENU]${YELLMENU} MENU VLESS $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}4$NCMENU]${YELLMENU} MENU TROJAN $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}5$NCMENU]${YELLMENU} MENU SHADOW $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}6$NCMENU]${YELLMENU} MENU SETTING $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}7$NCMENU]${YELLMENU} RUNNING CEK $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}8$NCMENU]${YELLMENU} CLEAR CACHE $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}9$NCMENU]${YELLMENU} REBOOT VPS $NCMENU"
echo -e " ${NCMENU} │$NCMENU [${BREDMENU}10$NCMENU]${YELLMENU} EXIT SCRIPT $NCMENU"
echo -e " ${NCMENU} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NCMENU}"
echo -e " ${NCMENU} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NCMENU}"
echo -e " ${NCMENU} │$bblueMENU Script Version $YELLMENU:$NCMENU v1.0 (New)"
echo -e " ${NCMENU} │$bblueMENU Client Name    $YELLMENU:$NCMENU $Name"
echo -e " ${NCMENU} │$bblueMENU Developer        $YELLMENU:$greenMENU AlfiStoreVPN "
echo -e " ${NCMENU} │$bblueMENU Expired script $YELLMENU:$NCMENU $Exp2" ${NCMENU}"
echo -e " ${NCMENU} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NCMENU}"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-system ;;
7) clear ; running ;;
8) clear ; clearcache ;;
9) clear ; reboot ; /sbin/reboot ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu ;;
esac

