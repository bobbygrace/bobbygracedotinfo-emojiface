# `convert` is part of imagemagick, Will need to install that for this to work.
# See https://github.com/audreyr/favicon-cheat-sheet for more info.
optipng ./src/images/favicon-*.png
convert ./src/images/favicon-16.png ./src/images/favicon-24.png ./src/images/favicon-32.png ./src/images/favicon-48.png ./src/images/favicon-64.png ./public/favicon.ico
