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

if [ -z "$ip" ]
#nous assurerons que l'utilisateur fournit une entrée valide 
then echo "invalid ip"
else 

printf "\n----- NMAP -----\n\n" > results

echo "Running Nmap..."
nmap "$ip" | tail -n +5 | head -n -3 >> results
fi
}

gobuster ()
{
apt list gobuster
sleep 5
sudo apt install gobuster
echo "Qu'elle url souhaite tu utilisé ?"
read -r url 
if [ -z "$url" ]
then echo "invalide url"
else 
gobuster dir -u "$url" -w /usr/share/directory.txt 
dig "$url"
fi
echo "si vous souhaitez scanner le même serveur ip est montrer ci-dessus ?"
read -r ip 
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
   echo "Faire -s pour le sqlmap"
   echo "Faire -g pour le gobuster"
   echo "Faire -n pour le nmap"
   echo "Faire -h pour le help"
   echo
}


while getopts ":hsgn" choix; do
   case $choix in
      h) # display Help
         Help
         exit;;
      s) # sqlmap
         sqlmap;;
      g) #gobuster 
         gobuster;;
      n) 
         nmap;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done