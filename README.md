## this is a mirror of [https://carbon.now.sh](https://carbon.now.sh/)
## use this, you can build your carbon website for API request

## build your own carbon api server

### step 1: build docker images
```bash
docker build -t carbon-website .
docker build -t carbonara -f Dockerfile-carbonara
```

### step 2 start carbon website
```bash
docker run -d -p 5080:80 carbon-website
```

### step 3 start carbonara
```bash
docker run -p 5030:3000 -e CARBON_URL=http://127.0.0.1:5080  --cap-add=SYS_ADMIN -d carbonara
```

### step 4 test
```bash
curl -L https://http://127.0.0.1:5030/api/cook  -X POST  -H 'Content-Type: application/json'  -d '{ "code": "export default const sum = (a, b) => a + b",  "backgroundColor": "#1F816D" }'> code.png
```