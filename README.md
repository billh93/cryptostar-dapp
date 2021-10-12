# Star Notary DApp

This is an example of how a Decentralized Application using the Ethereum blockchain and ERC-721 Tokens can be implemented in astronomy allowing visitors to register stars and track the ownership.

## Star Info
* Name: Bills First Token
* Symbol: BFT

## Prerequisites

In order to run this program you will need the following:

1. Computer(Windows or Mac OS)
2. Node ^v14.17.6
3. NPM ^6.14.15
4. truffle-hdwallet-provider: ^1.0.17
5. openzeppelin-solidity: ^2.5.0

## Note
I have removed the following personal information from the following files.
It is expected that you provide your own information to run the program.

1) Infura key in truffle-config.js
2) Metamask 12 secret words in the .secret file

## Install Dependencies

## Project's root directory
```bash
npm install
```

## App directory
```bash
cd app
npm install
```

## Start Truffle

```bash
truffle develop
```

## For compiling the contract, inside the development console, run:
```bash
compile
```

## For migrating the contract to the locally running Ethereum network, inside the development console
```bash
migrate --reset
```

## For running unit tests the contract, inside the development console, run:
```bash
test
```

## Start web server
```bash
cd app
```

## Enter the url => http://localhost:8080/ in your browser
```bash
npm run dev
```