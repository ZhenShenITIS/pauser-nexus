#!/bin/bash

while true
do
    for start in {1..26..5}
    do
        end=$((start+4))
        containers=$(seq -f "nexus-prover%g" $start $end)

        docker unpause $containers
        echo "Включил в работу контейнеры с $start по $end"
        echo "Жду 1 час..."
        sleep 3600


        docker pause $containers
        echo "Поставил на паузу контейнеры с $start по $end"
        sleep 10
    done
done
