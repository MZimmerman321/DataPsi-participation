number <- 3

number <- 5

times <- c(17, 30, 25, 35, 25, 30, 40 ,20)

mean(times)

time_hours <- times/60

mean(times)
range(times)
sqrt(times)


times > < == >= <= !=
  
times > 30
times = 17


which(times > 30)


all(times > 30)
any(times > 30)


help()
?any
?mean


times[times > 30]

times[times = 3]
times[3]
times[-3]
times[3:5]
times[c(2,4)]
times[-c(2,4)]
times[times > 30]
times > 30



times
times[1] <- 47
times



Na <- times[times > 30]
times[times > 30] <- c(0, 1)


#times[times > 30] <- Na


times <- c(17, 30, 25, 35, 25, 30, 40 ,20)
times[1]
times[times > 30] <- Na
times 

mean(times)
mean(times,na.rm = TRUE)

#mean of values betweeen 20 and 35

mean(times[times > 20 
           &
           times < 35],
    na.rm = TRUE) 

#or = | 


mean(times, na.rm = TRUE)
mean(times, trim = .2, na.rm = TRUE)


mtcars
?mtcars
head(mtcars)
names(mtcars)
