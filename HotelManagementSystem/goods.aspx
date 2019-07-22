﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Goods.aspx.cs" Inherits="Goods" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
    <link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="scripts/authority/commonAll.js"></script>
    <script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
    <script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
    <script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
    <title>商品信息</title>
    <script type="text/javascript">
        $(document).ready(function () {
            /** 新增   **/
            $("#addBtn").fancybox({
                'href': 'house_edit.html',
                'width': 733,
                'height': 530,
                'type': 'iframe',
                'hideOnOverlayClick': false,
                'showCloseButton': false,
                'onClosed': function () {
                    window.location.href = 'house_list.html';
                }
            });

            /** 导入  **/
            $("#importBtn").fancybox({
                'href': '/xngzf/archives/importFangyuan.action',
                'width': 633,
                'height': 260,
                'type': 'iframe',
                'hideOnOverlayClick': false,
                'showCloseButton': false,
                'onClosed': function () {
                    window.location.href = 'house_list.html';
                }
            });

            /**编辑   **/
            $("a.edit").fancybox({
                'width': 733,
                'height': 530,
                'type': 'iframe',
                'hideOnOverlayClick': false,
                'showCloseButton': false,
                'onClosed': function () {
                    window.location.href = 'house_list.html';
                }
            });
        });

        /** 模糊查询来电用户  **/
        function search() {
            $("#submitForm").attr("action", "house_list.html?page=" + 1).submit();
        }

        /** 新增   **/
        function add() {
            $("#submitForm").attr("action", "/xngzf/archives/luruFangyuan.action").submit();
        }

        /** 普通跳转 **/
        function jumpNormalPage(page) {
            $("#submitForm").attr("action", "house_list.html?page=" + page).submit();
        }

        /** 输入页跳转 **/
        function jumpInputPage(totalPage) {
            // 如果“跳转页数”不为空
            if ($("#jumpNumTxt").val() != '') {
                var pageNum = parseInt($("#jumpNumTxt").val());
                // 如果跳转页数在不合理范围内，则置为1
                if (pageNum < 1 | pageNum > totalPage) {
                    art.dialog({ icon: 'error', title: '友情提示', drag: false, resize: false, content: '请输入合适的页数，\n自动为您跳到首页', ok: true, });
                    pageNum = 1;
                }
                $("#submitForm").attr("action", "house_list.html?page=" + pageNum).submit();
            } else {
                // “跳转页数”为空 /*DataSourceID="goodsSqlDataSource"*/ OnRowDataBound="user_RowDataBound"OnRowCreated="user_RowCreated"
                art.dialog({ icon: 'error', title: '友情提示', drag: false, resize: false, content: '请输入合适的页数，\n自动为您跳到首页', ok: true, });
                $("#submitForm").attr("action", "house_list.html?page=" + 1).submit();
            }
        }
    </script>
    <style>
        .alt td {
            background: black !important;
        }

        .auto-style1 {
            font-style: italic;
        }
    </style>
</head>
<body>
    <form runat="server">
        <input type="hidden" name="allIDCheck" value="" id="allIDCheck" />
        <input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName" />
            <div id="container" runat="server">
            <div class="ui_content" runat="server">
                <div class="ui_text_indent">
                    <div id="box_border">
                        <div id="box_top">搜索</div>
                        <div id="box_center">
                            <asp:Label ID="Label1" runat="server" Text="身份证号："></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="ui_input_txt02"></asp:TextBox>
                        </div>  
                    </div>
                </div>  
                </div>  
             <div class="ui_content" runat="server">
                  <div class="ui_tb" runat="server">

                    <asp:GridView ID="goods" runat="server" align="center" Width="100%"
                        AutoGenerateColumns="False" DataKeyNames="Gno"
                        AllowPaging="True" CellPadding="5" ForeColor="#333333" OnRowDataBound="goods_RowDataBound">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Gno" HeaderText="商品编号" ReadOnly="True" SortExpression="Gno" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gname" HeaderText="商品名" SortExpression="Gname" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gprice" HeaderText="单价" SortExpression="Gprice" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gdesc" HeaderText="备注" SortExpression="Gdesc" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="选择">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                                        <asp:ListItem Text="0" Value="0" Selected="true" />
                                        <asp:ListItem Text="1" Value="1" />
                                        <asp:ListItem Text="2" Value="2" />
                                        <asp:ListItem Text="3" Value="3" />
                                        <asp:ListItem Text="4" Value="4" />
                                        <asp:ListItem Text="5" Value="5" />
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>



                    <div class="ui_frt">
                        <asp:Button ID="lnkbtnFrist" runat="server" OnClick="lnkbtnFrist_Click" Text="首页" CssClass="ui_input_btn01"></asp:Button>
                        <asp:Button ID="lnkbtnPre" runat="server" OnClick="lnkbtnPre_Click" Text="上一页" CssClass="ui_input_btn01"></asp:Button>
                        <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                        <asp:Button ID="lnkbtnNext" runat="server" OnClick="lnkbtnNext_Click" Text="下一页" CssClass="ui_input_btn01"></asp:Button>
                        <asp:Button ID="lnkbtnLast" runat="server" OnClick="lnkbtnLast_Click" Text="尾页" CssClass="ui_input_btn01"></asp:Button>
                        跳转到第<asp:DropDownList ID="ddlCurrentPage" CssClass="ui_select02" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>页
                        <asp:Button ID="submit" runat="server" Text="购买" CssClass="ui_input_btn01" OnClick="submit_Click" />
                                </div> 
                    </div>   
        </div>        
        </div>   
    </form>
        <div style="display: none">
            <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
            </div>
        

</body>
</html>
