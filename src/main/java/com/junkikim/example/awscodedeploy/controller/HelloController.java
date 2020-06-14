package com.junkikim.example.awscodedeploy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@ResponseBody
	@RequestMapping("/hello")
	public String hello() {
		String result;
		result = "CI/CD 도입 다음 개발을 시작하시오!";
		return  result;
	}
}
