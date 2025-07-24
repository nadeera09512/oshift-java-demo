package com.example.demo;

import java.net.InetAddress;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoAPIController {

	@GetMapping("/hello")
	public String getIpAndHostname() {
		
		try {
			String ip = InetAddress.getLocalHost().getHostAddress();
			String hostname = java.net.InetAddress.getLocalHost().getHostName();
			return "Hello There from MIT, IP: " + ip + ", Hostname: " + hostname;
		} catch (java.net.UnknownHostException e) {
			return "Unable to retrieve IP address and hostname.";
		}
		
	}
}
