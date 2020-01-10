#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Course 9 Week 4 Project  This app estimates the mpg for three cars using the lm function and either a simple model mpg ~ wt or a multiple model using mpg ~ .  Just click the buttons and you'll see the estimate in the main page"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons("LMType","Simple means mpg ~ wt and Multiple means mpg ~ .",
                   c("Simple","Multiple")),
      radioButtons("TypeOfCar","Choose the type of Car ",
                   c("Duster 360","Lotus Europa","Ferrari Dino"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Predicted Miles Per Gallon:"),
      textOutput("predictedData")
    )
  )
))
