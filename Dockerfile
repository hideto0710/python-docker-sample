FROM python:3.6
MAINTAINER INAMURA Hideto <h.inamura0710@gmail.com>

ENV LANG C.UTF-8
RUN groupadd -r dev && useradd -r -g dev dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r ./requirements.txt

COPY main.py ./

RUN ["chown", "-R", "dev:dev", "."]

USER dev
CMD [ "python", "./main.py" ]
