.PHONY: gen-go

gen-go: gen-pb gen-pb-gw

gen-pb:
    rm -rf /goout;\
    for f in src/*/*.proto ; do \
            protoc -Isrc --go_out-plugins=grpc:/goout
gen-pb-gw:
    protoc -I/usr/local/include -I. \
      -I$GOPATH/src \
      -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
      --grpc-gateway_out=logtostderr=true:. \
      path/to/your_service.proto