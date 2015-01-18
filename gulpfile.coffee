gulp = require "gulp"
concat = require "gulp-concat"
rename = require "gulp-rename"
minifyHTML = require "gulp-minify-html"
minifyCSS = require "gulp-minify-css"
uncss = require "gulp-uncss"
uglify = require "gulp-uglify"


# HTML

gulpHtmlSrc = "./src/html/index.html"

gulp.task "html", ->
  options = {empty: true}

  gulp
    .src gulpHtmlSrc
    .pipe minifyHTML(options)
    .pipe gulp.dest("./public")


# CSS

gulpCssSrc = [
  "src/css/normalize.css"
  "src/css/main.css"
]

gulp.task "css", ->

  gulp
    .src gulpCssSrc
    .pipe concat("all.css")
    .pipe uncss({ html: ["./public/index.html"] })
    .pipe gulp.dest("./public/css")
    .pipe minifyCSS()
    .pipe rename("all.min.css")
    .pipe gulp.dest("./public/css")


# JS

gulpJsSrc = [
  "src/js/vendor/jquery-2.1.0.min.js"
  "src/js/webaudiohelpers.js"
  "src/js/input.js"
]

gulp.task "js", ->

  gulp
    .src gulpJsSrc
    .pipe concat("all.js")
    .pipe gulp.dest("./public/js")
    .pipe uglify()
    .pipe rename("all.min.js")
    .pipe gulp.dest("./public/js")


# Watchers

gulp.task "watch", ->
  gulp.watch gulpHtmlSrc, ["html"]
  gulp.watch gulpCssSrc, ["css"]
  gulp.watch gulpJsSrc, ["js"]


gulp.task "default", ["css", "html", "js", "watch"]
