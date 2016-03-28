
# This is the server logic for a Shiny web application.
# 
library(ggplot2)
library(ISLR)
data(Auto)
library(shiny)
library(ggthemes)

Auto$cylinders <- as.factor(Auto$cylinders)
Auto$displacement <- as.factor(Auto$displacement)
Auto$horsepower <- as.factor(Auto$horsepower)
Auto$weight <- as.factor(Auto$weight)
Auto$acceleration <- as.factor(Auto$acceleration)
Auto$year <- as.factor(Auto$year)
Auto$origin <- as.factor(Auto$origin)
x = c("")

shinyServer(function(input, output) {
  Xvar <- reactive(Auto[, c(input$X)])
  Yvar <- reactive(Auto[, c(input$Y)])
  
 output$Auto_text <- renderText({
 
    cor(Xvar(), Yvar())
   
 })
 

  output$Auto_plot <- renderPlot({
    
ggplot(data = Auto, aes_string(y = input$X, x = input$Y)) + geom_point(aes_string(color = input$C), size = 8, alpha = 0.6 ) + stat_smooth(alpha = .3, lty = 3) + labs(title = paste('Plot:', input$X, "vs.", input$Y), x = input$X, y = input$Y)


  })

}
)

