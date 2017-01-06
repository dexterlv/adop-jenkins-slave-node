FROM avsdeveng/jenkins-slave:0.2.1
MAINTAINER "Ilya Fourmanov" <ilya.fourmanov@accenture.com>

# Arguments
ENV NODE_VERSION=6.9.2

# Node
ENV NPM_CONFIG_LOGLEVEL info

RUN yum makecache fast

# Install pre-requisites
RUN yum install -y zip

RUN git config --global url."https://".insteadOf git://

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
#  && gpg --verify SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
  && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
  && npm install gulp bower -g

# Start Swarm-Client
CMD java -jar /bin/swarm-client.jar -master ${SWARM_MASTER} -username ${SWARM_USER} -password ${SWARM_PASSWORD} \
    -name "${SLAVE_NAME}" -labels "${SLAVE_LABELS}" -mode ${SLAVE_MODE}