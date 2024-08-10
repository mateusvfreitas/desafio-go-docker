FROM golang:1.17.0-alpine AS build

WORKDIR /go/src/app

COPY . .

RUN go mod init fullcycle
RUN go build -o /fullcycle

# CMD [ "/fullcycle" ]

FROM scratch

COPY --from=build /fullcycle /fullcycle

CMD [ "/fullcycle" ]



