#!/data/data/com.termux/files/usr/bin/env bash
termux-setup-storage
termux-change-repo
pkg update -y && pkg upgrade -y && pkg install root-repo x11-repo unstable-repo proot proot-distro git wget curl zip unzip tar tsu openssh pulseaudio android-tools -y && pkg clean
clear 

#this script will configure a graphical user interface 
#(xfce4) in termux
#creator: @anngodamagepc
cd $HOME

echo -e '\e[1;36m installing packages, it is necessary  \e[1m'
echo -e '''
\e[1;31m Download speed depends on
 your internet connection \e[1m'''

sleep 3

clear

echo -e '\e[1;36m installing xfce4 and basic apps...\e[1m'

sleep 1

apt update && apt upgrade -y
apt install -y wget
apt install -y x11-repo 
apt update
wget https://github.com/anngodamagepc/termux-desktop-xfce/releases/download/5.0.3/termux-desktop-xfce_5.0.3_all.deb
wget https://github.com/anngodamagepc/termux-desktop-xfce/releases/download/5.0.3/ttf-microsoft-cascadia_4.0.2.all.deb
wget https://github.com/anngodamagepc/termux-desktop-xfce/releases/download/5.0.3/breeze-cursor-theme_5.20.5-4_all.deb
apt install -y xfce4 tigervnc xfce4-goodies kvantum audacious leafpad pavucontrol-qt hexchat geany synaptic firefox
apt install -f ./breeze-cursor-theme_5.20.5-4_all.deb -y
apt install -f ./termux-desktop-xfce_5.0.3_all.deb -y
apt install -f ./ttf-microsoft-cascadia_4.0.2.all.deb -y

echo "boostrap data..."
rm -rf $HOME/.backup
mkdir $HOME/.backup
mv $HOME/.config $HOME/.backup
mv $HOME/.vnc $HOME/.backup
cd $HOME

echo "Downloading wallpapers and xstartup..."
wget https://github.com/anngodamagepc/termux-desktop-xfce/releases/download/5.0.3/termux_desktop_lxqt_data.tar.xz
tar -xvf termux_desktop_lxqt_data.tar.xz
rm termux_desktop_lxqt_data.tar.xz
rm .vnc/xstartup
wget https://github.com/anngodamagepc/termux-desktop-xfce/releases/download/5.0.3/data.tar.xz
tar -xvf data.tar.xz
rm data.tar.xz

echo "setup folders..."

mkdir $HOME/Desktop 
mkdir $HOME/Downloads 
mkdir $HOME/Templates 
mkdir $HOME/Public 
mkdir $HOME/Documents 
mkdir $HOME/Pictures 
mkdir $HOME/Videos 
termux-setup-storage

ln -s $HOME/storage/music Music 

cd $HOME/Desktop
wget https://raw.githubusercontent.com/anngodamagepc/termux-desktop-xfce/refs/heads/main/LEAME.txt
wget https://raw.githubusercontent.com/anngodamagepc/termux-desktop-xfce/refs/heads/main/README.txt
rm LEAME.txt README.txt
cd $HOME

mv $PREFIX/share/kvantum/* $PREFIX/share/Kvantum

echo -e """\e[1;32menjoy!!
To start the vnc server, use the command: vncserver to stop it, use the command: vncserver -kill: 1 Replace the: 1 with the port on which the vnc service is running\e[1m"""
pkg clean
exit
