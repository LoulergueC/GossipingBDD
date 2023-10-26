# Gossip DDB : c'est pour un remake de la série ?

First of all, reset the database and seed it :
`rails db:reset`

## Features of seed

-   Create cities
-   Create users
-   Create gossips associated with users
-   Create tags and associate them randomly to gossips
-   Create private messages associated to a user
-   Allocate randomly recipients for those messages

## Test features :

note : due to the low amount of data, some requests may return empty results. Feel free to execute it again in the `rails console` to see if that works.

### Cities

-   Select a city `City.find(rand(1..10))`
-   See users associated to the city `City.find(rand(1..10)).users`
-   See gossips associated to the city `City.find(rand(1..10)).gossips`

### Users

-   Select a user `User.find(rand(1..10))`
-   See gossips associated to the user `User.find(rand(1..10)).gossips`
-   See message received `User.find(rand(1..10)).received_messages`
-   See message sent `User.find(rand(1..10)).sent_messages`

### Gossips

-   Select a gossip `Gossip.find(rand(1..20))`
-   See tags associated to the gossip `Gossip.find(rand(1..20)).tags`

### Private messages

-   Select a private message `PrivateMessage.find(1..50)`
-   See the user who sent it `PrivateMessage.find(1..50).sender`
-   See the user or the users who received it `PrivateMessage.find(1..50).receivers`
