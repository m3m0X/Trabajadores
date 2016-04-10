﻿ <%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="FijarSeguimiento1.aspx.cs" Inherits="PortalTrabajadores.Portal.FijarSeguimiento1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Css para la fecha -->
    <link href="../CSS/CSSCallapsePanel.css" rel="stylesheet" type="text/css" />
    <!-- Js De Los campos de Textos -->
    <script src="../Js/funciones.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContainerTitulo" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblTitulo" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Container" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="Container_UpdatePanelObservaciones" runat="server" visible="false">
                <asp:Label ID="lblObservaciones" runat="server" CssClass="ObservacionesCSS"></asp:Label>
            </div>
            <div id="Container_UpdatePanel1" runat="server" visible="true" style="margin-top:15px">
                <asp:GridView ID="gvObjetivosCreados" runat="server" AutoGenerateColumns="false" OnRowCommand="gvObjetivosCreados_RowCommand" OnRowDataBound="gvObjetivosCreados_RowDataBound">
                    <AlternatingRowStyle CssClass="ColorOscuro" />
                    <Columns> 
                        <asp:BoundField DataField="Descripcion" HeaderText="Objetivos" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Ano" HeaderText="Año"/>
                        <asp:BoundField DataField="SegDescripcion" HeaderText="Descripción seguimiento"/>
                        <asp:TemplateField HeaderText="Acciones" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnSeguimiento" runat="server" ImageUrl="~/Img/edit.gif" CommandArgument='<%#Eval("id_obj") + ";" + Eval("Seguimiento") + ";" + Eval("SegDescripcion")%>' CommandName="Seguimiento" />
                                <asp:ImageButton ID="btnOk" runat="server" ImageUrl="~/Img/ok.gif" Enabled="false"/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="BtnEnviar" runat="server" Text="Enviar Objetivos a jefe" Visible="false" OnClick="BtnEnviar_Click"/>
            </div>
            <div id="Container_UpdatePanelBloqueado" runat="server" visible="false">
                <asp:GridView ID="gvObjetivosBloqueados" runat="server" AutoGenerateColumns="false">
                    <AlternatingRowStyle CssClass="ColorOscuro" />
                    <Columns> 
                        <asp:BoundField DataField="Descripcion" HeaderText="Objetivos" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Ano" HeaderText="Año"/>
                        <asp:BoundField DataField="SegDescripcion" HeaderText="Descripción seguimiento"/>
                    </Columns>
                </asp:GridView>
            </div>      
            <div id="Container_UpdatePanel2" runat="server" visible="false">
                <br />
                <table id="TablaDatos">
                    <tr>
                        <th colspan="2">Digite su seguimiento</th>
                    </tr>
                    <tr>
                        <td class="CeldaTablaDatos"><asp:Label ID="lblSeguimiento" runat="server" Text="Seguimiento:" /></td>
                        <td class="CeldaTablaDatos">
                            <asp:TextBox ID="txtSeguimiento" runat="server" TextMode="MultiLine" MaxLength="200" Height="60px" Width="180px"/>
                        </td>
                    </tr>                
                    <tr class="ColorOscuro">
                        <td class="BotonTablaDatos"><asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/></td>
                        <td class="BotonTablaDatos"><asp:Button ID="BtnCancel" runat="server" Text="Cancelar" OnClick="BtnCancel_Click"/></td>
                    </tr>
                </table>
            </div>
            <div id="Container_UpdatePanel3" runat="server" visible="false">
                <br />
                <table id="TablaDatos2">
                    <tr>
                        <th>Observaciones</th>
                    </tr>
                    <tr>
                        <td class="CeldaTablaDatos">
                            <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine" MaxLength="200" Height="60px" Width="180px"/>
                        </td>
                    </tr>                
                    <tr class="ColorOscuro">
                        <td class="BotonTablaDatos"><asp:Button ID="BtnGuardarObs" runat="server" Text="Enviar" OnClick="BtnGuardarObs_Click"/></td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvObjetivosCreados" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Errores" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
             <asp:Label ID="LblMsj" runat="server" Text="LabelMsjError" Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
