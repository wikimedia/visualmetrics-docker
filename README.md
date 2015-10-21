# visual metrics

This is the Docker version of the [visual metrics](https://github.com/WPO-Foundation/visualmetrics) created by [Pat Meenan](https://twitter.com/patmeenan) and the people working with WebPageTest. The visual metrics is the command line port for calculating visual performance metrics from a video (as made famous by WebPageTest).

Use the container to get metrics like **First Visual Change**,
**Last Visual Change**, **Speed Index**, **Perceptual Speed Index** and the
**Visual Progress**.

## Build the container
If you make changes and want to test them locally, you can build the container like this:
<pre>
docker build -t wikimedia/visualmetrics .
</pre>

## Download the container
<pre>
docker pull wikimedia/visualmetrics
</pre>

## Help
You an check what you can do with visualmetrics by using help:
<pre>
docker run wikimedia/visualmetrics python visualmetrics.py --help
</pre>

## Run
Fetch metrics, converting a video located in the current directory:
<pre>
docker run -v "$(pwd)":/tmp wikimedia/visualmetrics python visualmetrics.py --video /tmp/myvideo.mov --perceptual -o
</pre>

## Record a video
To record a video you can follow the same procedure as WebPageTest. First go to a blank page by adding the URL **data:text/html;charset=utf-8,** then set the background color to orange. That will help the visual metrics to know when we start doing the test.

<pre>
document.body.style.background = "#DE640D"
</pre>

When you have started the video recording of the browser, change the background and the URL.
<pre>
document.body.style.background = "#FFFFFF"; document.location.href="https://en.wikipedia.org/wiki/Facebook";
</pre>

For more information checkout https://github.com/WPO-Foundation/visualmetrics
