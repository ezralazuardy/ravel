<a href="https://github.com/ezralazuardy/ravel/actions/workflows/build.yml" target="_blank" rel="noopener noreferrer">
  <img src="https://github.com/ezralazuardy/ravel/actions/workflows/build.yml/badge.svg?branch=8.2" alt="Build">
</a>
<a href="https://github.com/ezralazuardy/ravel/blob/master/LICENSE" target="_blank" rel="noopener noreferrer">
  <img src="https://img.shields.io/github/license/ezralazuardy/ravel?color=yellow" alt="License">
</a>
<a href="https://hub.docker.com/r/ezralazuardy/ravel/tags" target="_blank" rel="noopener noreferrer">
  <img src="https://img.shields.io/docker/stars/ezralazuardy/ravel?color=blue" alt="Docker Stars">
</a>
<a href="https://hub.docker.com/r/ezralazuardy/ravel/tags" target="_blank" rel="noopener noreferrer">
  <img src="https://img.shields.io/docker/image-size/ezralazuardy/ravel/8.2?color=orange" alt="Docker Image Size">
</a>

## 🪶 ravel

A simplified, battery-included CI/CD Environment for the Laravel framework.

```bash
docker pull ezralazuardy/ravel:8.2
```

You can directly use the image on your CI/CD Platform you want, and let Ravel do the rest.

**Oh? you're a performance seeker? an Alpine flavor is available.**

> Heavily inspired by [Laravel Sail](https://github.com/laravel/sail), handcrafted using [Depot](https://depot.dev).

### 🍬 flavors

Currently available variant and architecture for Ravel:

| PHP Version      | linux/amd64        | linux/arm64/v8     | linux/386          |
| ---------------- | ------------------ | ------------------ | ------------------ |
| 7.4              | :heavy_check_mark: | :x:                | :x:                |
| 8.0              | :heavy_check_mark: | :x:                | :x:                |
| 8.1              | :heavy_check_mark: | :x:                | :x:                |
| **8.2**          | :heavy_check_mark: | :heavy_check_mark: | :x:                |
| 8.2-alpine       | :heavy_check_mark: | :heavy_check_mark: | :x:                |

The tag used by Ravel image indicates the PHP Version it uses.

> For the updated variant list, please refer to the [Docker Hub](https://hub.docker.com/r/ezralazuardy/ravel/tags).
