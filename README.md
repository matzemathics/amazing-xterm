
# Run X-Term inside a container!

This docker image provides runs an instance of x-term, which you can connect to via
xpra, or even cooler via your browser:

Just build ...
```
docker build -t amazing-xterm .
```

... and run ...
```
docker run -it --rm -p 10000:10000 amazing-xterm
```

... and now you should just be able to point your browser to `localhost:10000` and
to connect to the terminal inside the container.
