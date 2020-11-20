From ajoergensen/baseimage-alpine

ENV DATA_DIRECTORY /data
ENV PASSWORD_FILE /data/.htpasswd


RUN \
	curl -sSL `curl -s https://api.github.com/repos/restic/rest-server/releases/latest | grep 'browser_' | cut -d\" -f4 | grep "linux_amd64"` | tar xvfz - --strip-components=1 -C /tmp && \
	mv /tmp/rest-server /usr/local/bin && \
	apk add --no-cache --update apache2-utils && \
	rm -rf /tmp/*

ADD \
	root/ /
	
RUN \
	chmod +x -v /etc/services.d/*/run /usr/local/bin/*

EXPOSE 8000

VOLUME [ "/data" ]
