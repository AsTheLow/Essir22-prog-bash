date=$(date)
user=$(whoami)
whereami=$(pwd)
scriptemplacement="/home/tgautherot/Documents/Script/projet-1"
alias show='echo "$ip" '

sqlmap()
{
apt list sqlmap
sleep 5 
sudo apt install sqlmap
echo "Quel site php souhaitez vous injecter"
read -r url 
if [ -z "$url" ]
then echo "invalid url"
else 
sqlmap -u "$url"
fi
}

nmap ()
{

echo "Saisir adresse ip"
read -r ip
if [ -z "$ip" ]
#nous assurerons que l'utilisateur fournit une entrée valide 
then 
echo "nulle"
else

printf "\n----- NMAP -----\n\n" 

echo "Running Nmap..."
exec nmap -Pn "$ip"
fi
}

cat << EOF 
Bienvenue dans mon script 

EOF
gobusterdir()
{
apt list gobuster
sleep 5
sudo apt install gobuster
if [ -z "$url" ]
then echo "invalide url"
else 
gobuster dir -u "$url" -w /usr/share/directory.txt 
dig "$url"
fi
}
gobusterdns()
{
echo "si vous souhaitez scanner le même serveur ip est montrer ci-dessus ?"

if [ -z "$ip" ]
then echo "inavlide ip"
else
gobuster dns -d "$ip" -w /usr/share/directory.txt 
#Les commandes varie selon les versions il faut les faire depuis kali 
fi
}


Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|t|v|V]"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}

while getopts ":h:n:s:d:u:" choix; do
   case ${choix} in
      h) # display Help
         Help
         exit;;
      s) url=${OPTARG}
         sqlmap;;
      n) ip=${OPTARG}
         nmap;;
      d) ip=${OPTARG}
         gobusterdns;;
      u) url=${OPTARG}
         gobusterdir;;
      
     \?) # incorrect option
      
         echo "Error: Invalid option cdonnard"
         exit;;
   esac
done
shift $((OPTIND-1))
