FROM ubuntu:18.04
RUN apt-get update 
RUN apt-get install -y curl nano vim net-tools ncdu  htop iputils-ping	


# Python 3.8
RUN apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && apt-get install -y python3.8
# Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
	nvm install node && \
	npm install -g pm2 && \
	pm2 install pm2-logrotate
	
CMD bash
