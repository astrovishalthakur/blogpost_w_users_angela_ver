FROM ubuntu

RUN apt-get update
RUN apt-get install -y python3 python3-pip

RUN mkdir /opt/app
WORKDIR /opt/app

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install -r requirements.txt



COPY . .
ENTRYPOINT FLASK_APP=/opt/app/main.py flask run --host 0.0.0.0


