FROM golang:1.18-bullseye

WORKDIR /app

RUN apt-get update
RUN apt-get install -y vim git

# RUN git config --global user.name "SPO Web Team"
# RUN git config --global user.email "pas@iitk.ac.in"

# RUN git clone https://github.com/spo-iitk/ras-cdn.git .

RUN go install github.com/cosmtrek/air@latest

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .

CMD [ "./scripts/prod.sh" ]
