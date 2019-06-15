package main

import(
  "os"
  "log"
  "fmt"
  "github.com/gin-gonic/gin"
  "github.com/joho/godotenv"
)

func Env_load() {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error loading .env file")
    }
}


func main() {
    Env_load()
    message := fmt.Sprintf("user_name=%s password=%s", os.Getenv("USER_NAME"), os.Getenv("PASSWORD"))
    fmt.Println(message)
    r := gin.Default()
    r.GET("/", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "message": "Hello World!!!!!",
        })
    })

    r.GET("/get", func(c *gin.Context) {
      c.JSON(200, gin.H{
          "message": "Hello World Go!!!",
      })
    })

    r.POST("/post", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "post": "OK!!!",
        })
      })
    // ポートを設定しています。
    r.Run(":8081")
}