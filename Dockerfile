FROM steinrock/websphere-liberty_arm_bf:latest

VOLUME ["/opt/ibm/wlp/usr/servers/defaultServer/dropins"]
VOLUME ["/opt/tomcat/webapps"]

RUN apt-get update && apt-get install -y nano && apt-get install -y tomcat7

RUN wget -O /opt/ibm/wlp/usr/servers/defaultServer/dropins/WorldWar.war \
    "https://experience.jupitercloud.de/nexus/service/local/artifact/maven/redirect?r=snapshots&g=berry_hello_ww1&a=hello-world-war&e=war&v=LATEST"
   
RUN /etc/init.d/tomcat7 restart    
RUN /opt/ibm/wlp/bin/server start

EXPOSE 8080


