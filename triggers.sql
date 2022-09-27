DELIMITER //
create trigger tgr_venda_item_insert after insert on venda_item
for each row
begin
	update produto set estoque = estoque - new.quantidade
	where id = new.id_produto;
end; //

DELIMITER //
create trigger tgr_venda_item_delete after delete on venda_item
for each row
begin
	update produto set estoque = estoque + old.quantidade
where id = old.id_produto;
end; //
