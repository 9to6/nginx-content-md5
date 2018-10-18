# nginx-content-md5

## Usage

```
docker run -p 8080:80 -v /Users/9to6/privates/nginx-content-md5:/var/www/app/static -v /Users/9to6/tmp/nginx/default.conf:/etc/nginx/conf.d/default.conf -v /Users/9to6/tmp/nginx/nginx.conf:/etc/nginx/nginx.conf -v /Users/9to6/tmp/nginx/perl/lib:/etc/nginx/perl/lib nginx:1.15.5-perl
```

## Test

```
curl -i localhost:8080/static/github-mark.png
```
