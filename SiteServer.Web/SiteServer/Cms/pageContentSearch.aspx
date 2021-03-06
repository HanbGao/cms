﻿<%@ Page Language="C#" Inherits="SiteServer.BackgroundPages.Cms.PageContentSearch" %>
  <%@ Register TagPrefix="ctrl" Namespace="SiteServer.BackgroundPages.Controls" Assembly="SiteServer.BackgroundPages" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <!--#include file="../inc/head.html"-->
      <script type="text/javascript">
        $(document).ready(function () {
          loopRows(document.getElementById('contents'), function (cur) {
            cur.onclick = chkSelect;
          });
        });
      </script>
    </head>

    <body>
      <form class="m-l-15 m-r-15" runat="server">
        <ctrl:alerts runat="server" />

        <div class="card-box">

          <div class="m-t-10">
            <div class="form-inline">
              <div class="form-group">
                <label class="col-form-label m-r-10">栏目</label>
                <asp:DropDownList ID="DdlChannelId" AutoPostBack="true" OnSelectedIndexChanged="Search_OnClick" class="form-control" runat="server"></asp:DropDownList>
              </div>

              <div class="form-group m-l-10">
                <label class="col-form-label m-r-10">状态</label>
                <asp:DropDownList ID="DdlState" AutoPostBack="true" OnSelectedIndexChanged="Search_OnClick" class="form-control" runat="server"></asp:DropDownList>
                <asp:CheckBox ID="CbIsDuplicate" class="checkbox checkbox-primary" Text="包含重复标题" runat="server"></asp:CheckBox>
              </div>
            </div>

            <div class="form-inline m-t-10">
              <div class="form-group">
                <label class="col-form-label m-r-10">时间：从</label>
                <ctrl:DateTimeTextBox id="TbDateFrom" class="form-control" Columns="12" runat="server" />
              </div>

              <div class="form-group m-l-10">
                <label class="col-form-label m-r-10">到</label>
                <ctrl:DateTimeTextBox id="TbDateTo" class="form-control" Columns="12" runat="server" />
              </div>

              <div class="form-group m-l-10">
                <label class="col-form-label m-r-10">目标</label>
                <asp:DropDownList ID="DdlSearchType" class="form-control" runat="server"> </asp:DropDownList>
              </div>

              <div class="form-group m-l-10">
                <label class="col-form-label m-r-10">关键字</label>
                <asp:TextBox id="TbKeyword" class="form-control" runat="server" />
              </div>

              <asp:Button class="btn btn-success m-l-10 btn-md" OnClick="Search_OnClick" ID="Search" Text="搜 索" runat="server" />
            </div>
          </div>

          <div class="panel panel-default m-t-20">
            <div class="panel-body p-0">
              <div class="table-responsive">
                <table id="contents" class="table tablesaw table-hover m-0">
                  <thead>
                    <tr class="thead">
                      <th>内容标题(点击查看) </th>
                      <th>栏目 </th>
                      <asp:Literal id="LtlColumnsHead" runat="server"></asp:Literal>
                      <asp:Literal id="LtlCommandsHead" runat="server"></asp:Literal>
                      <th width="80" class="text-center">状态</th>
                      <th width="20" class="text-center">
                        <input type="checkbox" onClick="selectRows(document.getElementById('contents'), this.checked);">
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <asp:Repeater ID="RptContents" runat="server">
                      <itemtemplate>
                        <tr>
                          <td>
                            <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                          </td>
                          <td>
                            <asp:Literal ID="ltlChannel" runat="server"></asp:Literal>
                          </td>
                          <asp:Literal ID="ltlColumns" runat="server"></asp:Literal>
                          <td class="text-center">
                            <asp:Literal ID="ltlCommands" runat="server"></asp:Literal>
                          </td>
                          <td class="text-center">
                            <asp:Literal ID="ltlStatus" runat="server"></asp:Literal>
                          </td>
                          <td class="text-center">
                            <asp:Literal ID="ltlSelect" runat="server"></asp:Literal>
                          </td>
                        </tr>
                      </itemtemplate>
                    </asp:Repeater>
                  </tbody>
                </table>

              </div>
            </div>
          </div>

          <ctrl:sqlPager id="SpContents" runat="server" class="table table-pager" />

          <hr />

          <asp:Button class="btn m-r-5" id="BtnAddContent" OnClick="AddContent_OnClick" Text="添加信息" runat="server" />
          <asp:Button class="btn m-r-5" id="BtnSelect" Text="选择显示项" runat="server" />
          <asp:Button class="btn m-r-5" id="BtnAddToGroup" Text="添加到内容组" runat="server" />
          <asp:Button class="btn m-r-5" id="BtnTranslate" Text="转 移" runat="server" />
          <asp:PlaceHolder ID="PhCheck" runat="server">
            <asp:Button class="btn m-r-5" id="BtnCheck" Text="审 核" runat="server" />
          </asp:PlaceHolder>
          <asp:Button class="btn m-r-5" id="BtnDelete" Text="删 除" runat="server" />

        </div>

      </form>
    </body>

    </html>
    <!--#include file="../inc/foot.html"-->