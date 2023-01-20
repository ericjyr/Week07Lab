<%-- 
    Document   : users
    Created on : 19-Jan-2023, 1:23:57 PM
    Author     : ericr
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        
        <c:if test="${users.size() == 0 || users eq null}">
            <p><strong>No users found. Please add a user.</strong></p>
        </c:if>
        
        <c:if test="${users.size() > 0}">
            <table border="1">
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.role.roleName}</td>
                        <td><a href="User?action=edit">Edit</a></td>
                        <td><a href="User?action=delete">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        
        <h2>Add User</h2>
        <form action="User" method="POST">
            Email: <input type="email" name="email"><br>
            First name: <input type="text" name="firstname"><br>
            Last name: <input type="text" name="lastname"><br>
            
            Role:  
            <select name="role">
                <option value="2">regular user</option>
                <option value="1">system admin</option>
            </select><br>
            
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add user">
        </form>


    </body>
</html>