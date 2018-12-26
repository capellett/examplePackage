# How to properly include data for users of a package:
# save data in data/ . You can use this function to do that: usethis::use_data(data)
# document the name of the dataset and save it in R/

#' @title A sample example of a very good dataset.
#' @description A tidy table of things
#' @format a dataframe with two awesome columns and some really cool rows.
#' \describe{
#'   \item{Awesome}{awesomeness, in liters of blood, sweat, and tears}
#'   \item{Cool}{coolness, in kilocool points}
#'   ...
#' }
#' @source I found it on the floor.
"exampleData"

## Some functions use pre-computed data tables which
## should not be readily available to package users.
## Instead, you can save them in R/sysdata.rda.
## devtools::use_data(data, internal=TRUE)
## include code used to generate internal data in data-raw/
## Objects in R/sysdata.rda are not exported,
## so they don’t need to be documented.
## They’re only available inside your package.

## Put raw data for examples in inst/extdata.
## Everything in inst/ is moved up to the top
## level directory of the package when the package is installed.
## (so they can’t have names like R/ or DESCRIPTION).
## To refer to files in inst/extdata (whether installed or not):
# system.file("extdata", "example.csv", package = "examplePackage",
#             mustWork=TRUE) # throws error if file is not found.
## [1] "/home/user/R/Library/WaterPlanningTools/extdata/example.csv"

## If you want to show how to work with an already loaded dataset,
## put that data in data/.
## If you want to show how to load raw data,
## put that data in inst/extdata.

## Generally, package data should be smaller than a megabyte -
## if it’s larger you’ll need to argue for an exemption.
## This is usually easier to do if the data is in its own
## package and won’t be updated frequently.
## You should also make sure that the data has been optimally compressed:
# tools::checkRdaFiles() ## to determine the best compression for each file.
# devtools::use_data() ## with compress set to that optimal value.
## If you’ve lost the code for recreating the files, use
# tools::resaveRdaFiles() ## to re-save in place.

## always include LazyData: true in your DESCRIPTION.
## devtools::create() does this for you.
