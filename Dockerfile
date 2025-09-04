FROM python:3.10-slim-bullseye

# सिस्टम dependencies install करो
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python3-pip \
       git \
       gcc \
       ffmpeg \
       libffi-dev \
       libssl-dev \
       make \
    && rm -rf /var/lib/apt/lists/*

# pip upgrade करो
RUN pip3 install --upgrade pip

# Project folder बनाओ
RUN mkdir /Insta-DL
WORKDIR /Insta-DL

# Requirements install करो
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt

# बाकी code copy करो
COPY . .

# Start command
CMD ["python3", "bot.py"]
