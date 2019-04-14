########################################################################################################################
# PURPOSE AND NOTES
########################################################################################################################

# I remember hearing about how the Mars Rover selects a sample of rocks given that it has limited battery life.  It
# could just accept the first sample, but the quality, on a scale of 0-100%, is probabilistic and it might find a better
# one if it keeps looking.  If, however, it looks too long for a 100%er, then it'll never select a sample.  It occurs
# to me that the same principle applies to selecting a partner and I want to explore that via simulation to see if I can
# model it.

########################################################################################################################
# PREP
########################################################################################################################

setwd("C:/Users/Will/Documents/optimized-wife-selector")
set.seed(20190413)
library(dplyr)


########################################################################################################################
# CREATE DATA
########################################################################################################################

# Lets say we expect to live to 80.  What is the optimal strategy for partner selection if we want to choose the very
# best partner. Let's assume that, like with real life, we don't know what the maximum level of "good" is (i.e. we
# don't know if we've met the best that we're going to meet). 

# create a large sample of women that one could meet.  Let's assume that quality of women is normally distributed
women <- rnorm(1000000)

# Let's assume we meet 1 woman per day and the quality of the woman is randomly selected, without replacement, from the
# population
daysAlive <- 365*62
womenPerDay <- 1

metWomen <- data.frame(day = 1:daysAlive, womanQuality = sample(women, size = daysAlive * womenPerDay, replace = FALSE))

# from what I remember, the mars rover got 1/3 just testing samples to see what quality is like, then, during the 
# second 1/3, it selects the first sample better than the ones prior

# TODO: make the women quality more unknown (i.e. when you meet, you're only probabilistically close to assessing their
# actual quality and your ability to assess quality quickly comes with age and intuition).
# also, if you're dating someone (to assess true quality), you shouldn't be able to "meet" new women
# also, what about divorce? howbout impact on well-being of selecting a partner that causes pain
# also the quality of the women you meet should, on average, increase since you tend to spend your time with like-minded
# people (e.g. meeting at a tech conference vs church)
# also, the good ones tend to get snapped up while younger so what I really need is to simulate a universe of males and
# females with varying degrees of quality where each entity wants to maximize their partner's quality and some people
# simply fail to marry due to being low quality
# also, not everyone will have an optimized strategy.  Some will marry the first person they date and others will never
# settle down, despite a great partner

marryWho <- function() {
  bestDate <- max(metWomen$womanQuality[1:daysAlive/3])
  meetWifeDay <- metWomen$day[first(which(metWomen$day > (daysAlive/3) & metWomen$womanQuality > bestDate))]
  
}
