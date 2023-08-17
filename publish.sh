#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/jdk-17;
export CATALINA_HOME=/home/ali/java/apache-tomcat-9.0.41;
export PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin;


cd /home/ali/Dropbox/Web/MrMoshkel/Publication/;

startup.sh;
sleep 4
if [ $? -eq 0 ]
then
	echo "--------------------------- Tomcat started ---------------------------"
	httrack --update http://localhost:8080/home/posts -O /home/ali/Dropbox/Web/MrMoshkel/Publication/ +*localhost:8080* -n
	echo "--------------------------- Copy site done ---------------------------"
	if [ $? -eq 0 ]
	then
		git add -A ; git commit -m "`date`" ; git push origin main
		echo "--------------------------- Publish done ---------------------------"
	else
		echo "publish failed."
	fi
shutdown.sh
echo "--------------------------- Tomcat shutdown ---------------------------"
else
	echo "Problem in start Tomcat"
fi
