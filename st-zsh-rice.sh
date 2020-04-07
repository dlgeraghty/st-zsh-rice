#repo:
cd
git clone https://github.com/dlgeraghty/st-zsh-rice.git &&

#fonts:
cd st-zsh-rice &&
cp IosevkaNerdFont.ttf ~/usr/share/fonts/misc/ &&
fc-cache &&
[ $(fc-list | grep "Iosevka Nerd" | wc -l) -lt 1 ] && echo "Nerd Font installed Correctly" &&
sudo apt-get install fonts-inconsolata -y || sudo pacman -S ttf-inconsolata

#zsh:
sudo pacman -S zsh -y || sudo apt install zsh -y &&
sudo chsh -s $(whereis zsh) &&
cd &&
mv ~/.zshrc ~/.zshrc.old
mv st-zsh-rice/.zshrc ~/ &&
mkdir /usr/share/zsh &&
mkdir /usr/share/zsh/plugins &&
cd /usr/share/zsh/plugins &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git &&
cd &&

#st:
git clone https://github.com/LukeSmithxyz/st &&
cd st &&
sudo make install &&
cd .local/src/st.git/st.git &&
mv config.h config.old.h
cp ~/st-zsh-rice/config.h .
sudo make install &&

sudo rm -r ~/st-zsh-rice/
