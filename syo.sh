clear
bold=$(tput bold)
endbold=$(tput sgr0)

if ((RANDOM%2 == 0))
then
toilet -f slant --filter border:gay ScrapYouOut///
elif (( RANDOM%2 == 1 ))
then
toilet -f slant --filter border:metal ScrapYouOut///
else
toilet -f slant --filter border ScrapYouOut///
fi 

echo ""
echo "${bold}THE NO-NONSENSE Vulnerability Analysis & INFORMATION GATHERING TOOL${endbold}"
echo "${bold}Designed by:${endbold} Sachin Verlekar (the_int3rceptor.exe)"
echo "Current Date: " && date
echo "================================================================================================="
echo "================================================================================================="

echo "[*] Enter the URL or IP address: "
read addr
echo ""
echo "[!] Based on your input, We have Recieved the Following IP Address(s)"
dig +short $addr
echo ""
echo "${bold}=== Main Menu (Use Numericals for Option Selection)${endbold}"
echo "1 >> DNS Lookup"
echo "2 >> Reverse DNS Lookup"
echo "3 >> IP Geolocation Lookup"
echo "4 >> Reverse IP Lookup"
echo "5 >> Fetch HTTP Headers"
echo "6 >> Site Banner Grabbing"
echo "7 >> Pull robots.txt"
echo "8 >> Check IP Origin"
echo "9 >> Whois Lookup"
echo "10 >> Aggressive Port Scan"
echo "11 >> Web Vulnerability Scanner"
echo "12 >> Local Ports & Running Service Check"
echo "13 >> Web Full-Screen Capture"
echo "14 >> Exit Script"
echo ""

echo "Choose your option:"
read options

case $options in
1) echo "=== DNS Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/dnslookup/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
2) echo "=== Reverse DNS Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/reversedns/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
3) echo "=== IP Geolocation Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/ipgeo/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
4) echo "=== Reverse IP Lookup Information ==="
   echo ""
   curl https://api.scrapestack.com/scrape?access_key=6c1b98133d719f0ab4ff6a6136c41b99&url=https://api.hackertarget.com/reverseiplookup/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
5) echo "=== HTTP Response Headers ==="
   echo ""
   curl -i $addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
6) convaddr=$(echo -e "$(dig +short $addr)" | awk '{print ; exit}')
   curl https://api.hackertarget.com/bannerlookup/?q=$convaddr/24 
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;; 
7) echo "=== Robots.txt ==="
   echo ""
   curl https://$addr/robots.txt
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
8)echo "=== IP Origin Identifier ==="
  convaddr=$(echo -e "$(dig +short $addr)" | awk '{print ; exit}') 
  curl https://ipinfo.io/$convaddr/json
  echo ""
  echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
9) echo "=== WHOIS Lookup ==="
   whois $addr
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac

;;
10) echo "=== Aggressive Port Scan ==="
    sudo nmap -A -sS -Pn $addr
    echo ""
    echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
    read exopt
    case $exopt in
    y) bash syo.sh
    ;;
    n) echo "[!] Exiting Script!"
    ;;
    esac
;;
11)echo "=== Web Vulnerability Scanner ==="
   echo "1 >> Launch Nikto Web Scanner"
   echo "2 >> Launch WAPITI Web Scanner"
   echo "3 >> Back to Main Menu"
   read opts
   case $opts in 
   1) sudo nikto -h $addr
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
    read exopt 
    case $exopt in
     y) bash syo.sh
     ;;  
     n) echo "[!] Exiting Script!"
     ;;
    esac
   ;;
   2) sudo wapiti -u https://$addr
      echo ""
      echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
      read exopt 
      case $exopt in
       y) bash syo.sh
       ;;  
       n) echo "[!] Exiting Script!"
       ;;  
       esac
      ;;
    3) bash syo.sh
     ;; 
   esac
;;
12) echo "=== Local Port Running Service Checker ==="
    sudo lsof -i -P -n
    allports=$(sudo lsof -i -P -n)
    if [ -z "$allports" ]
    then
    echo "[ALERT] No Running Services Found on your System"
    echo ""
    echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
    read exopt 
    case $exopt in
       y) bash syo.sh
       ;;  
       n) echo "[!] Exiting Script!"
       ;;  
    esac
    fi
    echo ""
    echo "[!] Enter the number of times you want to check for running port services"
    read n
    for(( i=0; i<n; i++ ))
    do
    echo "[!] Enter the Port Number to check for Running Service:"
    read portnum
    service=$(sudo lsof -i:$portnum)
    if [ -z "$service" ];
    then
    echo "[ALERT] No Running service found"
    else
    sudo lsof -i:$portnum
    fi
done
      echo ""
      echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
      read exopt 
      case $exopt in
       y) bash syo.sh
       ;;  
       n) echo "[!] Exiting Script!"
       ;;  
      esac
;;
13) echo "=== Web Screen Capture ==="
    echo "[!] Name of the file to be saved:"
    read fname
    cutycapt --url=$addr --out=$fname.png
    echo "[*] Please wait...Capturing!"
    echo ""
    echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
    read exopt 
    case $exopt in
       y) bash syo.sh
       ;;  
       n) echo "[!] Exiting Script!"
       ;;  
    esac
;;
14) echo "[!] Exiting Script"
    echo "Bye!"
;;
*) echo "[X] Invalid Input!"
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
esac
