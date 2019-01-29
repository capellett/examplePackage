# You can inherit parameter descriptions from other functions
# using @inheritParams source_function. This tag will bring
# in all documentation for parameters that are undocumented
# in the current function, but documented in the source function.
# The source can be a function in the current package, via @inheritParams
# function, or another package, via @inheritParams package::function.
# For example the following documentation:

#' @title foo a thing
#' @param a_thing This is the first argument
example_foo <- function(a_thing) a_thing + 10

#' @title bar two things
#' @param another_thing This is the second argument
#' @inheritParams foo
example_bar <- function(a_thing, another_thing) {
  foo(a) * 10
}


