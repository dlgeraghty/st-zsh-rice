#repo:
cd
#git clone https://github.com/dlgeraghty/st-zsh-rice.git &&

#fonts:
cd st-zsh-rice &&
sudo mkdir /usr/local/share/fonts/misc
sudo cp IosevkaNerdFontComplete.ttf /usr/local/share/fonts/misc/ &&
fc-cache &&
[ $(fc-list | grep "Iosevka Nerd" | wc -l) -lt 1 ] && echo "Nerd Font installed Correctly" &&
sudo apt-get install fonts-inconsolata -y || sudo pacman -S ttf-inconsolata

#zsh:
sudo pacman -S zsh -y || sudo apt install zsh -y ;
[ "$SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh $(whoami) &&
cd &&
[ $(ls ~/.zshrc | wc -l) -lt 0 ] && mv ~/.zshrc ~/.zshrc.old
cp st-zsh-rice/.zshrc ~/ ;
[ $(ls /usr/share/ | grep "zsh" | wc -l) -eq 0 ] && sudo mkdir /usr/share/zsh 
[ $(ls /usr/share/zsh/ | grep "plugins" | wc -l) -eq 0] && sudo mkdir /usr/share/zsh/plugins 
cd /usr/share/zsh/plugins ;
	[ $(ls | grep "zsh-syntax-highlighting" | wc -l) -eq 0 ] && sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
cd &&

#st:

wget https://dl.suckless.org/st/st-0.8.2.tar.gz &&
tar -xvf st-0.8.2.tar.gz && 
cd st-0.8.2 &&
cd &&
cd st-zsh-rice  &&
cp config.h ../st-0.8.2/ &&
cd ~/st-0.8.2/
patch -p1 < ~/st-zsh-rice/set-alpha-0.8.2.diff
patch -p1 < ~/st-zsh-rice/xresources.diff
sudo make install

#set transparency via the .Xresources file, the example that will be copied is the Xdefaults file present in this repo :) you can then change some values as color, transparency level (0-1), fonts...and issue xrdb file to make it change

cp ~/st-zsh-rice/Xdefaults ~/
mv ~/Xdefaults ~/.Xresources
xrdb ~/.Xresources


