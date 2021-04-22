library(tidyverse)
library(gganimate)

#Data downloaded as a .csv file at : https://www.v-dem.net/en/analysis/VariableGraph/

p <- pol %>%
  ggplot() +
  geom_line(aes(x=Year, y=`*Balkans`, color="Balkans")) +
  geom_line(aes(x=Year, y=`*East-Central Europe`, color="East-Central Europe")) +
  geom_line(aes(x=Year, y=`*Nordic countries`, color="Nordic Europe")) +
  geom_line(aes(x=Year, y=`*Southern Europe`, color="Southern Europe")) +
  geom_line(aes(x=Year, y=`*Western Europe`, color="Western Europe")) +
  
  scale_color_manual(guide = "legend",
                     values = c("Balkans" = "#CA36B1",
                                "East-Central Europe" = "#FFC02D",
                                "Nordic Europe" = "#566EFF",
                                "Southern Europe" = "#FF6600",
                                "Western Europe" = "#69DCBE")) + 
  ylim(c(0,4)) +
  
  labs(y ="",
       x = "Year",
     title = "Political Polarization, 1900-2020",
       subtitle = "Is society polarized into antagonistic, political camps?\n\n\n",
       tag = "\n0 Not at all | 1 Mainly not | 2 Somewhat | 3 Yes, to noticeable extent | 4 Yes, to a large extent \n",
       caption = "\nData : V-Dem Institute | @j_marlier") +
  
  theme_minimal() + 
  theme(
    panel.grid.major = element_line(color ="#40475B"),
    panel.grid.minor = element_blank(),
    plot.margin = margin(t = 0.5, r = 0.5, b = 0.5, l = 0.5, unit = "cm"),
    panel.background = element_rect(fill = "#232732", color = "#232732"),
    plot.background = element_rect(fill = "#232732"),
    legend.position="right",
    legend.title = element_blank(),
    legend.text = element_text(family="Chivo", size = 14, color="white"),
    axis.text = element_text(family="Chivo", size = 13, color="#B4B4B4"),
    axis.title.x = element_text(family="Chivo", size = 14, vjust=-3, hjust=0.5, color="white"),
    plot.title = element_text(family="Chivo", face="bold", size=20, color="white"),
    plot.subtitle = element_text(family="Chivo", size = 13, color="white"),
    plot.caption = element_text(family="Chivo", size = 8, hjust=0, vjust=-1, color="#838383"),
    plot.tag = element_text(family="Chivo", size = 10, color ="white"),
    plot.tag.position = c(0.34,0.90)
  )

plot_POL <- p +
  geom_point(pol, mapping = aes(x=Year, y=`*Balkans`, color="Balkans")) +
  geom_point(pol, mapping = aes(x=Year, y=`*East-Central Europe`, color="East-Central Europe")) +
  geom_point(pol, mapping = aes(x=Year, y=`*Nordic countries`, color="Nordic Europe")) +
  geom_point(pol, mapping = aes(x=Year, y=`*Southern Europe`, color="Southern Europe")) +
  geom_point(pol, mapping = aes(x=Year, y=`*Western Europe`, color="Western Europe")) +
  
  scale_color_manual(guide = "legend",
                     values = c("Balkans" = "#CA36B1",
                                "East-Central Europe" = "#FFC02D",
                                "Nordic Europe" = "#566EFF",
                                "Southern Europe" = "#FF6600",
                                "Western Europe" = "#69DCBE")) + 
  transition_reveal(Year)

animate(plot_POL, height = 7, width = 10, units ="in", res=150)

anim_save("D22_polar.gif")



