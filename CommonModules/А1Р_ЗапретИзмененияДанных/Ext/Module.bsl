﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("ФормаЭлементаПриСозданииНаСервере", Истина);
	Настройки.Обработчики.Вставить("ФормаСпискаПриСозданииНаСервере", Истина);
	Настройки.Обработчики.Вставить("ПередЗаписью", Истина);
	Настройки.Обработчики.Вставить("А1Э_ПриОпределенииПравДоступа", Истина);
	Настройки.ПорядокВыполнения = 10000;
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция ФормаЭлементаПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
		Если НЕ РольДоступна("А1Р_ЗапретИзмененияДанных") Тогда Возврат Неопределено; КонецЕсли;
		
		Форма.ТолькоПросмотр = Истина;
		Если Форма.КоманднаяПанель.ПодчиненныеЭлементы.Найти("ФормаСкопировать") <> Неопределено Тогда
			Форма.КоманднаяПанель.ПодчиненныеЭлементы.ФормаСкопировать.Доступность = Ложь;
		КонецЕсли;
	КонецФункции
	
	Функция ФормаСпискаПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
		Если НЕ РольДоступна("А1Р_ЗапретИзмененияДанных") Тогда Возврат Неопределено; КонецЕсли;
		//Список = Форма.Элементы.Найти("Список");
		//Если Список = Неопределено Тогда
		Форма.ТолькоПросмотр = Истина;
	КонецФункции
	
	Функция ПередЗаписью(Объект, Отказ, РежимЗаписи = Неопределено, РежимПроведения = Неопределено) Экспорт
		Если НЕ РольДоступна("А1Р_ЗапретИзмененияДанных") Тогда Возврат Неопределено; КонецЕсли;
		Отказ = Истина;
		Сообщить("Запись объекта запрещена - установлен глобальный запрет на изменение данных!");
	КонецФункции
	
	Функция А1Э_ПриОпределенииПравДоступа(ДоступРазрешен, Право, ОбъектМетаданных, ПользовательИБ) Экспорт 
		Если НЕ А1Э_Доступы.ЕстьРоль("А1Р_ЗапретИзмененияДанных", ПользовательИБ) Тогда Возврат Неопределено; КонецЕсли;
		Если А1Э_Общее.РавноОдномуИз(ВРЕГ(Право), "ДОБАВЛЕНИЕ", "ИЗМЕНЕНИЕ", "УДАЛЕНИЕ") Тогда
			ДоступРазрешен = Ложь;	
		КонецЕсли;
	КонецФункции
	
#КонецЕсли

