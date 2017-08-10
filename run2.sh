#!/bin/bash


#USER CREATION
adduser  -u $OWNER_UID  $OWNER_NAME --force-badname --disabled-password --shell /bin/bash --home /home/$OWNER_NAME --gecos ''
usermod -p `perl -e "print crypt("$OWNER_PASSWD","Q4")"` $OWNER_NAME




#cat > /home/$OWNER_NAME/.bash_login << EOF
cat > /etc/profile.d/checker.sh << EOF
#!/bin/bash
set -o ignoreeof

checker=\$(screen -list | grep -Eo  htop | wc -l)

if [[ "\$checker" == 0 ]]
then
screen -S htop -md /usr/bin/htop
screen -x htop
else
screen -x htop
fi
EOF
chmod +x /etc/profile.d/checker.sh

#cat >/opt/start_jupyter.sh<< EOF
#!/bin/bash
#sudo -u satori /usr/bin/shellinaboxd -t --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css --service /:satori:satori:/home/satori:screen\ -r
#/usr/bin/shellinaboxd -t --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css --background=/var/run/shellinabox.pid
sudo -u satori screen -S htop -md /usr/bin/htop
node /opt/wetty/app.js -p 3000
#/usr/bin/shellinaboxd -t --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css

#EOF

#chmod +x /opt/start_jupyter.sh

#sudo  /opt/start_jupyter.sh
