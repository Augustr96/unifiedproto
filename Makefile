.PHONY: gen-go

gen-go:
	# update all proto out
	rm -rf /github.com/Augustr96/unifiedproto/goout ;\
	rm -rf goout ;\
	for f in src/*/*.proto ; do \
			protoc -I. -I$$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --go_out=plugins=grpc:. $$f ;\
			protoc -I. -I$$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --grpc-gateway_out=logtostderr=true:. $$f ;\
	done ;\
	mv ./github.com/Augustr96/unifiedproto/goout . ;\
	rm -rf /github.com/Augustr96/unifiedproto/goout