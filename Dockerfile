FROM codercom/code-server:latest
# COPY JDK和MAVEN
USER root

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install tar -y

#COPY jdk-11.0.9 /usr/local/jdk/
#COPY apache-maven-3.6.3 /usr/local/apache-maven/

# Env
#ENV JAVA_HOME=/usr/local/jdk \
#    JRE_HOME=$JAVA_HOME \
#    MAVEN_HOME=/usr/local/apache-maven
#ENV CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$MAVEN_HOME/lib:$CLASSPATH

#ENV PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$MAVEN_HOME/bin:$PATH

#RUN mkdir /root/.m2/
#RUN cp /usr/local/apache-maven/conf/settings.xml /root/.m2/
#RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
#RUN apt-get install -y nodejs
#RUN node -v
#RUN npm -v
#RUN npm install -g generator-jhipster
#RUN npm install -g yo

#WORKDIR /home/coder/project
# 容器启动code-server：指定插件目录，指定中文，指定免密登录
#ENTRYPOINT ["code-server","--locale","zh-cn","--host","0.0.0.0","--port","8080", "--user-data-dir", "/home/coder","--cert",""]
