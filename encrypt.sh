#!/bin/bash
##Built and maintained by Webhost.sh##
##Version 1.0##
##Required packages for install.##
##function 2##
if [ $(dpkg-query -W -f='${Status}' shc 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo You are missing required files, we will aquire them now. This may take a while. 
  read -p 'Press enter to continue.'
  sudo apt-get install npm nodejs
  sudo apt-get install shc
  ln -s /usr/bin/nodejs /usr/bin/node
  npm install -g bash-obfuscate
  sudo apt-get install shc
  sudo apt-get update
fi
if [ $(dpkg-query -W -f='${Status}' npm nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo You are missing required files, we will aquire them now. This may take a while. 
  read -p 'Press enter to continue.'
  sudo apt-get install npm nodejs
  sudo apt-get install shc
  ln -s /usr/bin/nodejs /usr/bin/node
  npm install -g bash-obfuscate
  sudo apt-get install shc
fi
clear

##Add $!/bin/bash to top of file
echo "Name of file to encrypt?"
ls
read -p '' -e NAME

fileExtension=${NAME: -3}
while [[ "$fileExtension" = '.sh' ]]; do
clear
echo "Sorry, I was too lazy to figure this out, please enter it again without the file extension."
echo "Name of file to encrypt?"
ls
read -p '' -e NAME
fileExtension=${NAME: -3}
clear
done
bash-obfuscate "$NAME".sh -o "$NAME"ob1.sh
sed -i '1i #!/bin/bash' "$NAME"ob1.sh
##Add $!/bin/bash to top of file
bash-obfuscate "$NAME"ob1.sh -o "$NAME"ob2.sh
rm "$NAME"ob1.sh
sed -i '1i #!/bin/bash' "$NAME"ob2.sh
sudo shc -v -r -U  -f "$NAME"ob2.sh
rm "$NAME"ob2.sh
sleep 1;
cp "$NAME"ob2.sh.x "$NAME"
rm "$NAME"ob2.sh.x
rm "$NAME"ob2.sh.x.c






