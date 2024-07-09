#!/bin/bash
COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[0;34m'
COLOR_YELLOW='\033[1;33m'


echo "==================================="
echo "|                                  |"
echo "|         Mail Migrationi          |"
echo "|                       Mahmud Khan|"
echo "==================================="

echo -e "${COLOR_BLUE} [-] The system is updating."
sudo apt update &> /dev/null 
echo -e "${COLOR_GREEN} [+] System update done."


LIBARR=( libauthen-ntlm-perl libclass-load-perl libcrypt-ssleay-perl libdata-uniqid-perl libdigest-hmac-perl libdist-checkconflicts-perl libencode-imaputf7-perl libfile-copy-recursive-perl libfile-tail-perl libio-compress-perl libio-socket-inet6-perl libio-socket-ssl-perl libio-tee-perl libmail-imapclient-perl libmodule-scandeps-perl libnet-dbus-perl libnet-ssleay-perl libpar-packer-perl libreadonly-perl libregexp-common-perl libsys-meminfo-perl libterm-readkey-perl libtest-fatal-perl libtest-mock-guard-perl libtest-mockobject-perl libtest-pod-perl libtest-requires-perl libtest-simple-perl libunicode-string-perl liburi-perl libtest-nowarnings-perl libtest-deep-perl libtest-warn-perl )

for lib in ${LIBARR[*]}
do
    echo -e "${COLOR_BLUE} [-] Installing $lib"
    sudo apt install -y $lib &> /dev/null
    echo -e "${COLOR_GREEN} [+] $lib install done"
done


echo -e "${COLOR_GREEN} [+] Downloading imapsync"
git clone https://github.com/imapsync/imapsync.git &> /dev/null
echo -e "${COLOR_YELLOW} [!]===> Don't remove imapsync folder"
cd imapsync

sudo ln -s ~/imapsync/imapsync /usr/bin/imapsync

echo -e "${COLOR_GREEN} [+] Install done."