
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(ISLR)
data(Auto)
library(markdown)
list <- as.list(names(Auto))
colorList <- as.list(c("mpg", "horsepower", "origin", "year", "cylinders"))

shinyUI(fluidPage(

titlePanel("Application for Creating plots with the Auto Data set in the ISLR package"),
  includeMarkdown("About.md"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel( h4(strong("Configure Plot Options")),
                 br(),
                 
                 selectInput( "X",
                             label = strong("Choose X-Axis Variable"),
                             choices = as.list(names(Auto)),
                             selected = 'mpg'
                             ),
                 
                 selectInput("Y",
                              label = strong("Choose Y-Axis Variable"),
                              choices = as.list(names(Auto)),
                              selected = 'horsepower'
                              ),
                 
                 selectInput("C",
                             label = strong("Select Color Variable"),
                             choices = colorList,
                             selected = 'cylinders'
                             
                
    ),       
    br(),
    strong("How to use the App: "),
    br()
   
    ),
   
   
   
  
   
    mainPanel(
      plotOutput("Auto_plot"), 
      br(),
      
     strong("Correlation between the selected x and y variables - using Reactive Function"),
    textOutput("Auto_text")
    
    )
    
    
    
    

))


)