export GO15VENDOREXPERIMENT=1

all: scycli scyserver

scycli: prep
	go build -o build/bin/scycli github.com/alexbakker/scytale/cmd/scycli

scyserver: prep scyserver-assets
	go build -o build/bin/scyserver github.com/alexbakker/scytale/cmd/scyserver

scyserver-assets:
	go run vendor/github.com/alexbakker/go-embed/*.go -pkg=server -input=cmd/scyserver/server/assets -output=cmd/scyserver/server/assets.go

prep:
	mkdir -p build/bin

clean:
	rm -rf build
	rm -f cmd/scyserver/server/assets.go
