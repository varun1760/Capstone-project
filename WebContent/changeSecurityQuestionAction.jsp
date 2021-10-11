<%@ page import="com.foodbox.DBConnection"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String securityQuestion = request.getParameter("securityQuestion");
String newAnswer = request.getParameter("newAnswer");
String password = request.getParameter("password");
int check = 0;
try{
	Connection connection = DBConnection.getCon();
	Statement statement = connection.createStatement();
	ResultSet rSet = statement.executeQuery("select * from users where email='"
			+ email + "' and password='" + password + "'");
	while(rSet.next()){
		check=1;
		statement.executeUpdate("update users set securityQuestion='"+ securityQuestion +", answer='" + newAnswer
				+ "' where email='" + email + "'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(check == 0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}
}catch(Exception e){
	System.out.println(e);
}
%>