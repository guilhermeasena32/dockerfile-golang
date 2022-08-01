FROM golang:bullseye AS builder

WORKDIR /go

COPY ./src/hello.go .

RUN go build hello.go


FROM scratch

WORKDIR /go
COPY --from=builder /go .

CMD [ "./hello" ]