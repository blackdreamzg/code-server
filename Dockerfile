# docker build --no-cache -t registry.cn-hangzhou.aliyuncs.com/zhaog/cdr:4.9.1 --network="host" .
FROM codercom/code-server:4.10.1

USER root

# RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
# COPY assets/sources.list.aliyun /etc/apt/sources.list
RUN apt-get update && apt-get install wget -y

# jdk-11.0.12
# COPY assets/jdk /usr/local/jdk/
RUN wget -O openjdk11.tar.gz https://mirrors.huaweicloud.com/openjdk/11.0.2/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar -zxvf openjdk11.tar.gz -C /usr/local/ && mv /usr/local/jdk-11.0.2 /usr/local/jdk

ENV JAVA_HOME=/usr/local/jdk/
ENV CLASSPATH=$JAVA_HOME/lib
ENV PATH=$PATH:$JAVA_HOME/bin
RUN java -version

# apache-maven-3.8.4
# COPY assets/apache-maven /usr/local/apache-maven/
# COPY assets/settings.xml /usr/local/apache-maven/conf/
RUN wget -O maven.tar.gz https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
RUN tar -zxvf maven.tar.gz -C /usr/local/ && mv /usr/local/apache-maven-3.8.4 && /usr/local/apache-maven && cp resource/settings.xml /usr/local/apache-maven/conf/

ENV MAVEN_HOME=/usr/local/apache-maven
ENV CLASSPATH=$CLASSPATH:$MAVEN_HOME/lib
ENV PATH=$PATH:$MAVEN_HOME/bin
RUN echo $MAVEN_HOME
# RUN mvn -v
RUN mkdir /root/.m2/
COPY assets/settings.xml /root/.m2/

# node
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@9.2.0
# RUN wget -O node.tar.xz https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.tar.xz
# RUN tar -xvf node.tar.xz -C /usr/local/ && mv /usr/local/node-v18.12.1-linux-x64 /usr/local/node
# COPY assets/node /usr/local/node/
# ENV PATH=$PATH:/usr/local/node/bin
# RUN ln -s /usr/local/node/bin/node /usr/local/bin/ && ln -s /usr/local/node/bin/npm /usr/local/bin/

RUN npm install -g npm@9.2.0
RUN node -v
RUN npm -v
RUN npm config set registry https://registry.npmmirror.com

# jhipster
RUN npm install -g generator-jhipster
# yo
RUN npm install -g yo
# python2
#RUN apt install python -y
