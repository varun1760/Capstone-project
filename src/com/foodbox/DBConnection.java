package com.foodbox;
import java.sql.*;
public class DBConnection {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodbox","root","master");
			return connection;
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
