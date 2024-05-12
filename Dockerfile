FROM golang AS build
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o main main.go

FROM ubuntu
WORKDIR /app
COPY --from=build /app/main .
EXPOSE 8080
CMD ["./main"]