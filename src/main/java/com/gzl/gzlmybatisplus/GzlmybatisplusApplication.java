package com.gzl.gzlmybatisplus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.gzl.gzlmybatisplus")
public class GzlmybatisplusApplication {

  public static void main(String[] args) {
    SpringApplication.run(GzlmybatisplusApplication.class, args);
  }

}
