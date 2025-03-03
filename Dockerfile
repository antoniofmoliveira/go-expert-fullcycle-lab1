FROM golang:1.24 AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 CGOOS=linux GOARCH=amd64 go build -o queryweather src/main.go

FROM scratch
WORKDIR /app
COPY --from=build /app/queryweather .
ENV API_KEY=c879a0c2c48a42cbbae184703250303
ENTRYPOINT ["./queryweather"]
EXPOSE 8080