Matrix spec builder
===================

This image can be used to build the specification documentation for the Matrix
communications protocol, which can be found at
https://github.com/matrix-org/matrix-doc.

Run it as:

```
docker run --rm -v [full-path-to-matrix-doc-dir]:/spec -u [your-userid] uhoreg/matrix-doc-build
```

See also `uhoreg/matrix-doc-watch` for an image that will automatically rebuild
the HTML when a file changes, and serve over HTTP.
