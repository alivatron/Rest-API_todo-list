package main

import (
	"log"

	todo "github.com/alivatron/Rest-API"
	"github.com/alivatron/Rest-API/pkg/handler"
)

func main() {
	handlers := new(handler.Handler)
	srv := new(todo.Server)
	if err := srv.Run("8080", handlers.InitRoutes()); err != nil {
		log.Fatalf("error occured while running http server %s", err.Error())
	}
}
