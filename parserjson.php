<?php
$content=file_get_contents('./registro-speedtest.log');
echo '[';
$content=str_replace("'", '"', $content);
//echo $content;
echo substr( $content,0, strlen($content)-2);
echo ']';