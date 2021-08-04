## 1. this is a mirror of [https://carbon.now.sh](https://carbon.now.sh/)
## 2. use this, you can build your carbon website for API request

## 3. build your own carbon api server

### step 1: build docker images
```bash
docker build -t carbon-website .
docker build -t carbonara - < Dockerfile-carbonara
```

### step 2 start carbon website
```bash
docker run --name carbon-website -d carbon-website
```

### step 3 start carbonara
```bash
docker run -p 5030:3000 -e CARBON_URL=http://carbon/ --link carbon-website:carbon  --cap-add=SYS_ADMIN -d carbonara
```

### step 4 test
```bash
curl -L http://127.0.0.1:5030/api/cook  -X POST  -H 'Content-Type: application/json'  -d '{ "code": "export default const sum = (a, b) => a + b",  "backgroundColor": "#1F816D" }'> code.png
```