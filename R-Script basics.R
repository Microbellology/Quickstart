# analysis with gapminder data
# A Clarke

library(tidyverse)

gapminder <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv')


# Automation with for loops

# plot gdpPercap for each country 

# lets start with just one country

# filter the country to plot
c <-  "Afghanistan"
to_plot <-  gapminder %>% 
  filter(country == c)

# plot
my_plot <-  ggplot(data = to_plot, aes(x = year, y = gdpPercap)) +
  geom_point() +
  labs(title = paste(c, "GDP per capita", sep = " "))
# save
ggsave(filename = paste("Figures/", c, "_gdpPercap.png", sep = ""), plot = my_plot)



# now lets make that a for loop

#Could make a list of all the countries in gapminder

country_list <-  unique(gapminder$country)

for( i in country_list ){

to_plot <-  gapminder %>% 
  filter(country == i)

# plot
my_plot <-  ggplot(data = to_plot, aes(x = year, y = gdpPercap)) +
  geom_point() +
  labs(title = paste(i, "GDP per capita", sep = " "))
# save, in the Figures/ directory
ggsave(filename = paste("Figures/", i, "_gdpPercap.png", sep = ""), plot = my_plot)

}

# or you could put the function in the for loop

for( i in unique(gapminder$country) ){
  
  to_plot <-  gapminder %>% 
    filter(country == i)
  
  # plot
  my_plot <-  ggplot(data = to_plot, aes(x = year, y = gdpPercap)) +
    geom_point() +
    labs(title = paste(i, "GDP per capita", sep = " "))
  # save, in the Figures/ directory
  ggsave(filename = paste("Figures/", i, "_gdpPercap.png", sep = ""), plot = my_plot)
  
}

# But say we wanted to look only at European countires, 
# It is easier to make a new list and then iterate through that list

gap_Europe <- gapminder %>% 
  filter(continent == "Europe")

for( i in unique(gap_Europe$country) ){
  
  to_plot <-  gapminder %>% 
    filter(country == i)
  
  # plot
  my_plot <-  ggplot(data = to_plot, aes(x = year, y = gdpPercap)) +
    geom_point() +
    labs(title = paste(i, "GDP per capita", sep = " "))
  # save, in the Figures/ directory
  ggsave(filename = paste("Figures/", i, "_gdpPercap.png", sep = ""), plot = my_plot)
  
}


# if and else

est <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')
gapminder_est <- left_join(gapminder, est)


#using and if/else statement to add a subtitlegap_Europe <- gapminder %>% 
gap_Europe_est <- gapminder_est %>% 
  filter(continent == "Europe")

for( i in unique(gap_Europe_est$country) ){
  
  to_plot <-  gapminder_est %>% 
    filter(country == i)
  
  print(paste("Plotting", i))
  
  # plot
  my_plot <-  ggplot(data = to_plot, aes(x = year, y = gdpPercap)) +
    geom_point() +
    labs(title = paste(i, "GDP per capita", sep = " "))
  
  
  if (any(to_plot$estimated == "yes")) {
    
    print(paste("Data estimated"))
  
    my_plot <- my_plot +
      labs(subtitle = "Estimated data")
    
    }else{
      
      my_plot <- my_plot +
      labs(subtitle = "Reported data")
    
  }
  # save, in the Figures/ directory
  ggsave(filename = paste("Figures/", i, "_gdpPercap.png", sep = ""), plot = my_plot)
  
}

# If there are more than two varialbes, can use "else if" to give another option
# say another option was "unknown". Could have:

#  if (any(to_plot$estimated == "yes")) {

#(paste("Data estimated"))

#my_plot <- my_plot +
  #labs(subtitle = "Estimated data")

#}else if (any(gap_to_plot$estimated == unknown{
  
 # my_plot <- my_plot +
    #labs(subtitle = "Unknown Data collection")
# }else{

#my_plot <- my_plot +
 # labs(subtitle = "Reported data")


