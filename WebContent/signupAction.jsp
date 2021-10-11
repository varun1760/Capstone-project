<%@ page import="com.foodbox.DBConnection"  %>
<%@ page import="java.sql.*"  %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city = "";
String state = "";
String country = "";

try{
	Connection connection = DBConnection.getCon();
	PreparedStatement statement = connection.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	statement.setString(1, name);
	statement.setString(2, email);
	statement.setString(3, mobileNumber);
	statement.setString(4, securityQuestion);
	statement.setString(5, answer);
	statement.setString(6, password);
	statement.setString(7, address);
	statement.setString(8, city);
	statement.setString(9, state);
	statement.setString(10, country);
	
	statement.executeUpdate();	
	response.sendRedirect("signup.jsp?msg=valid");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}

%>