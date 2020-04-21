FROM golang as builder
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN go build main.go


FROM scratch
COPY --from=builder /usr/src/myapp/main /
CMD ["/main"]