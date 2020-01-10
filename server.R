#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  simpleModel <- lm(mpg ~ wt,data = mtcars)
  multipleModel <- lm(mpg ~ ., data = mtcars)
  
  model1Pred <- reactive({
    
    modelChoice <- input$LMType
    typeOfCar <- input$TypeOfCar
    
    
    if (modelChoice == 'Simple') {
      predictions <- predict(simpleModel, mtcars)
    } else {
      predictions <- predict(multipleModel, mtcars)
    }
    tmp1 <- paste(" Miles Per Gallon = ", predictions[typeOfCar]) 
    tmp2 <- paste("A ",typeOfCar,"'s ")
    paste(tmp2, tmp1)
    
  })
  
  output$predictedData <- renderText({
    model1Pred()
    
  })
  
})
