FROM python:3.10.3-slim-bullseye

ENV TF_ENABLE_ONEDNN_OPTS=0

RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    git \
    wget \
    curl \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN python -m pip install --upgrade pip

COPY ./requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt

RUN cd ~ && \
    git clone https://github.com/serengil/deepface.git && \
    cd deepface && \
    pip install -e .
