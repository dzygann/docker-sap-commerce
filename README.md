# docker-sap-commerce
Demo Docker for SAP CX (aka Hybris)  

# Getting Started
1. Get the SAP Commerce solution and put it next to the `Dockerfile`
2. Rename the `zip` file to commerce.zip
3. Build the Docker image

```
docker build -t commerce .
```

4. Run the Docker image
```
docker run --name sap-cx -p 9002:9002 -p 8983:8983 commerce
```
5. Wait until SAP Commerce is up and running. You will see the entry `INFO: Server startup in x ms` in the logs.
6. Open the browser and check out the demo stores e.g. `https://localhost:9002/yacceleratorstorefront/?site=apparel-de`
