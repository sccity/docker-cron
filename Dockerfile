FROM python:3.11-slim-bookworm
RUN apt-get update && apt-get install cron -y -qq
COPY crontab /etc/cron.d/docker-cron
RUN chmod 0644 /etc/cron.d/docker-cron
RUN /usr/bin/crontab /etc/cron.d/docker-cron
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log