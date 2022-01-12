FROM python
RUN apt-get update && apt-get -y install cron
WORKDIR /app
COPY . /app

RUN pip install paho-mqtt
RUN echo "*/2 * * * * root python /app/src/rpi-cpu2mqtt.py" > /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab
CMD ["cron", "-f"]
