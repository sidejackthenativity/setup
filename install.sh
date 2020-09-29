#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt install openvpn

sudo snap install jq  

sudo apt  install golang-go
git clone https://github.com/tomnomnom/httprobe.git



echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/sidejackthenativity/recon.git
cd recon
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"


go get -u github.com/tomnomnom/httprobe


#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local/go
					export GOROOT=/usr/local/go
					export PATH=$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile			
					echo 'export PATH=$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

echo "installing httprobe"
sudo wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go get -u github.com/tomnomnom/httprobe
cd ~/tools/
echo "done"

echo "installing snap"
sudo apt install snapd


echo "installing amass"
sudo snap install amass

echo "installing gospider"
go get -u github.com/jaeles-project/gospider

echo "installing wfuzz"
pip install wfuzz
sudo apt install wfuzz

echo "installing LineEnum"
git clone https://github.com/rebootuser/LinEnum.git

echo "massDns"
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make


echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
