FROM golang:1.24 AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 CGOOS=linux GOARCH=amd64 go build -o queryweather src/main.go

FROM scratch
WORKDIR /app
COPY --from=build /app/queryweather .
ENTRYPOINT ["./queryweather"]
EXPOSE 8080