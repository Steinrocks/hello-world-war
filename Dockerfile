FROM tomcat

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME

RUN apt-get update && apt-get install -y nano

RUN wget -O /usr/local/tomcat/webapps/HelloWorld.war \
     "https://experience.jupitercloud.de/nexus/service/local/artifact/maven/redirect?r=snapshots&g=berry_hello_ww1&a=hello-world-war&e=war&v=LATEST"

RUN /usr/local/tomcat/bin/shutdown.sh
RUN /usr/local/tomcat/bin/startup.sh    

VOLUME ["/usr/local/tomcat/webapps"]

EXPOSE 8080