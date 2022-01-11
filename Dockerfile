FROM python
RUN apt-get update && apt-get -y install cron
WORKDIR /app
COPY . /app

RUN echo "*/2 * * * * /usr/bin/python /app/rpi-cpu2mqtt.py" > /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab
CMD ["cron", "-f"]
