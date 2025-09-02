
## PURPOSE:   Convert plain shiny app into plain shinylive; run locally  (no quarto)
## do_first.R

## To run shiny in the browser (ie shinylive)


# work in shiny_live_project
setwd("~/code/shiny_live_project")


## jr manually copied all folers and files in examplesfrom shiny pkg to shiny_live_project/examples/nn_app/*

# ------------------------  copy shiny apps to shiny_live_project (jr:  do manually)

# shiny_live method:
# Copy an existing plain shiny app, to directory shinylive/myapp

# Example: Copy "Hello World" from `{shiny}`

# In installed pkg = shiny, finds shiny/examples/01_hello/app.R 
path = system.file("examples", "01_hello", package="shiny") 
path

the_dir = "./myapp"
the_dir = "./examples"
# copy it  (~/code/shiny_live_project/<the_dir>) creates `the_dir` for you and calls it `app.R`
fs::dir_copy(path, the_dir, overwrite = TRUE)
# ------------------------  


# `convert` and download web `assets` - wait!  (both myapp, site/ under shinylive)
# "myapp" directory must exist
# export(<from_dir>, <to_dir>, subdir = )

shinylive::export("examples/01_hello/", "site", subdir = "01_hello")
shinylive::export("examples/02_text/", "site", subdir = "02_text")


# To preview:  all is running inside browser (must use index.html 01_hello/index.html)
httpuv::runStaticServer("site")

# To deply, copy site/ to host


# workflow - to deploy to gh pages
usethis::use_github_action(url="https://github.com/posit-dev/r-shinylive/blob/actions-v1/examples/deploy-app.yaml")
