<% require 'csv' %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Seu Relatório</title>
  </head>
  <body>
    <p>Segue em anexo o relatório de saldo</p>
    <% csv_data = CSV.generate(headers: true) do |csv| %>
      <% csv << ['Name', 'Balance'] %>
      <% @people.each do |person| %>
        <% csv << [person.name, person.balance] %>
      <% end %>
    <% end %>
    <%= attachments['balance_report.csv'] = { mime_type: 'text/csv', content: csv_data } %>
  </body>
</html>