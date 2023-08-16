#!/bin/sh

startup.sh
echo "--------------------------- Tomcat started ---------------------------"
httrack  http://localhost:8080/home/posts -O /home/ali/Dropbox/Web/MrMoshkel/Publication/ +*localhost:8080* -n
echo "--------------------------- Copy site done ---------------------------"
if [ $? -eq 0 ]
then
	git commit -am "`date`" ; git push origin main
	echo "--------------------------- Publish done ---------------------------"
else
	echo "publish failed."
fi
shutdown.sh
echo "--------------------------- Tomcat shutdown ---------------------------"
