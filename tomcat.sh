#!/bin/bash
if  [ "$1" = "start" ]; then
        echo "启动中..."
        sh /usr/local/tomcat7/bin/startup.sh
        echo "启动成功..."
elif [ "$1" = "stop" ]; then 
        echo "停止中..."
        sh /usr/local/tomcat7/bin/shutdown.sh
        echo "停止成功..."
elif [ "$1" = "restart" ]; then
				echo "重启中..."
				pid=`ps -ef|grep tomcat7|grep -v "grep"|awk '{print $2}'`
				if [ "$pid" ]; then
								ps -ef|grep tomcat7|grep -v "grep"|awk '{print $2}'|xargs kill -9
								echo "停止旧程序成功..."
								sh /usr/local/tomcat7/bin/startup.sh
								echo "重启成功..."
				fi
else
  echo "Usage: $0 {start|stop|version} [server-id]"
  exit 1
fi
