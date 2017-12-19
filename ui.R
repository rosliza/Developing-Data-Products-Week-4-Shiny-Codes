library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
      dashboardHeader(title = "My Dashboard"),
      
      dashboardSidebar(
            sidebarMenu(
                  menuItem("Slider With Graph", tabName = "dashboard", icon = icon("dashboard")),
                  menuItem("Slider with Text", tabName = "widgets", icon = icon("th")),
                  menuItem("Slider with Infobox", tabName = "infobox", icon = icon("th"))
            )     
      ),
      dashboardBody(
            h1 ( "Course 9 Week 4 Peer Graded Assignment"),
            tabItems(
                  # First tab content
                  tabItem(tabName = "dashboard",
                          h3("Slider & Graph"),
                          fluidRow(
                                sliderInput("saiz", 
                                            label = "Choose your data range:",
                                            min = 0, max = 2000, value = c(0, 2000)),
                                plotlyOutput(outputId = "distPlot")
                                
                          ),
                          fluidRow(
                                h2("The Diamonds data"),
                                DT::dataTableOutput("mytable")
                               
                          )
                          
                  ),       

                  # Second tab content
                  tabItem(tabName = "widgets",
                      h3("Slider & Text"),
                      fluidRow(
                            box(
                              textInput("text", "Please key in your name:"),
                              sliderInput("range", 
                              label = "Choose your age range:",
                              min = 0, max = 100, value = c(0, 100)),
                              textOutput("selected_var"),
                              textOutput("min_max")
                            )
                      )
                    ),
                  
                  #3rd tab content
                  tabItem(tabName = "infobox",
                          h3 ("Slider & Infobox"),
                          #HTML('<p><img src="bycycle.jpg"/></p>'),
                                                    
                          # infoBoxes with fill=FALSE
                          fluidRow(

                                # A static infoBox
                                box(
                                      title = "Price per item is RM 100, Please Log Your Order", status = "warning",
                                      sliderInput("order", 
                                                  label = "Put your order here:",
                                                  min = 0, max = 1000, value = c(0))
                                )
                          ),
                          
                          # Copy the line below to make a set of radio buttons
                          radioButtons("radio", label = h3("DELIVERY METHOD"),
                                       choices = list("Self Pick Up" = "Self Pick Up", "Postage" = "Postage"), 
                                       selected = 1),
                          
                        
                          # infoBoxes with fill=TRUE
                          fluidRow(
                                infoBoxOutput("input_order"),
                                infoBoxOutput("price"),
                                infoBoxOutput("payment")
                          )

                          
                  )
            )
            
      )
)
   