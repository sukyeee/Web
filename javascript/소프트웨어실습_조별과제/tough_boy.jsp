<%--tough_boy.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-migrate-1.4.1.min'/>"></script>
</head>
<style>

body{
background-color:#F5F6CE;
}

#bar
{
background-color:pink;
border: 2px dashed white;
width: 500px;
margin:auto;
}


#button1, #result{ 
text-align:center;
background-color:pink;
color:white;
padding:7px;
border:white;
border-style:dashed;
border-width: 2px;
border-radius:20px 20px 20px 20px;

}
#button1:hover, #result:hover{ 
text-align:center;
background-color:#FAAC58;
color:white;
padding:7px;
border:white;
border-style:dashed;
border-width: 2px;
border-radius:20px 20px 20px 20px;
}

</style>


<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String uid="system";
String pass="1234";
String sql = "select * from member where id= ? "; //type 가져오려고 select
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn=DriverManager.getConnection(url, uid, pass);
PreparedStatement pre = conn.prepareStatement(sql);
pre.setString(1,id);
ResultSet rs = pre.executeQuery();
rs.next();
String type = rs.getString("type");

%>	
<script>


var id = "<%=id%>";
var type = "<%=type%>";

document.write("<div id=bar align = center> <br>");
document.write(id +"님이 선호하시는 <font color=red>" + type +"</font> 타입 입니다!<br><br>");
document.write("</div>");

 $(function() {
     $('img').css('width', '250px').css('height', '270px');
     });//이미지 크기 설정

var time, i = 0;
var stop;
var tough;
var tough_ran;

function tough_change(){

tough = ['남자연예인/마동석.jpg','남자연예인/크리스햄.JPG','남자연예인/터프_정우성.jpg','남자연예인/터프_태양.jpg'];
tough_ran = Math.floor(Math.random()*tough.length);
$('#q img').attr('src', tough[tough_ran]);
var ab = document.getElementById("q");
ab.src = tough[tough_ran];


}

function heart_change()
{
	var heart = ['아이콘/빨간하트.png', '아이콘/분홍하트.png', '아이콘/연핑크하트.png'];
	var heart_ran = Math.floor(Math.random()*heart.length);
	$("#love img").attr('src',heart[heart_ran]);
	
	var abcd = document.getElementById("love");
	abcd.src = heart[heart_ran];
}

function button1() {
   if(i == 0) {
      time=setInterval(function() {
         tough_change();
         },100);
         i = 1;
         $('#button1').attr('value', 'stop');
   }
   else {
      stop=clearInterval(time);
      i = 0;
      $('#button1').attr('value', '마음에 안들어요!');
         
   }
}

function button2()
{
	time=setInterval(function() {
        heart_change();
        },100);
	
	var abc=document.getElementById("unknown");
	abc.src=tough[tough_ran];
	
	
}


</script>
<%

}catch (Exception e){
 out.print("죄송합니다, 오류가 발생했어요 "+e.getMessage());
}
%>



<div id="tough" align="center">
	<img id = "q" src="아이콘/물음표.jpg" alt=""><br>
	<input type="button" id="button1" value="랜덤매칭 시작" onclick="button1()"/>
	<input type="button" id="result" value="결정" onclick="button2()">
	
	<br>
	<img id="girl" src ="아이콘/여자.png">
	<img id="love" src="아이콘/빨간하트.png">
	<img id="unknown" src="아이콘/물음표.jpg">
</div>


</html>
