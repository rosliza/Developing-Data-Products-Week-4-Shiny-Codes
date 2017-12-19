# Define server logic required to draw a histogram ----
server <- function(input, output) {
      
      # Histogram of the Old Faithful Geyser Data ----
      # with requested number of bins
      # This expression that generates a histogram is wrapped in a call
      # to renderPlot to indicate that:
      #
      # 1. It is "reactive" and therefore should be automatically
      #    re-executed when inputs (input$bins) change
      # 2. Its output type is a plot
      output$distPlot <- renderPlotly({
            df <- diamonds[sample(1:nrow(diamonds), size =paste0(input$saiz[2])),]
            plot_ly(df, x = df$x, y = df$price, mode = "markers", color = df$cut,colors=c("pink","purple","red","blue"), size = df$z) %>%
                  layout(title = "Diamonds")
       })
 
      output$mytable = DT::renderDataTable({
            diamonds
      })
           
      output$selected_var <- renderText({ 
            paste("My name is", input$text)
      })
      
      output$min_max <- renderText({ 
            paste("My age range is :",
                  input$range[1], "to", input$range[2])
      })
   
      
      #menubar3
      output$input_order <- renderInfoBox({ 
            infoBox(
                  "Your Order", paste0(input$order), icon = icon("shopping-cart"),
                  color = "blue",fill = TRUE
            )
      })
      output$price <- renderInfoBox({
            infoBox(
                  "Payment", "RM ", paste0(paste0(input$order * 100), input$price  ), icon = icon("list"),
                  color = "red", fill = TRUE
            )
      })
      output$value <- renderPrint({ input$radio })
      output$payment <- renderInfoBox({
            infoBox(
                  "DELIVERY", input$radio, icon = icon("thumbs-up", lib = "glyphicon"),
                  color = "yellow", fill = TRUE
            )
      })
}