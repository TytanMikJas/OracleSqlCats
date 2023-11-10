ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

CREATE TABLE Bandy 
    (nr_bandy       NUMBER(2)       CONSTRAINT bd_nr_pk PRIMARY KEY,
     nazwa          VARCHAR2(20)    CONSTRAINT bd_na_nn NOT NULL,
     teren          VARCHAR2(15)    CONSTRAINT bd_te_un UNIQUE,
     szef_bandy     VARCHAR2(15)    CONSTRAINT bd_sz_un UNIQUE
    );
    
CREATE TABLE Funkcje
    (funkcja        VARCHAR2(10)    CONSTRAINT fn_fu_pk PRIMARY KEY,
     min_myszy      NUMBER(3)       CONSTRAINT fn_mi_gt CHECK(min_myszy > 5),
     max_myszy      NUMBER(3)       CONSTRAINT fn_ma_lt CHECK(200 > max_myszy),
     CONSTRAINT fn_ma_bt CHECK(max_myszy >= min_myszy)
    );

CREATE TABLE Wrogowie
    (imie_wroga     VARCHAR2(15)    CONSTRAINT wr_im_pk PRIMARY KEY,
     stopien_wrogosci NUMBER(2)     CONSTRAINT wr_sw_bt CHECK(stopien_wrogosci BETWEEN 0 AND 10),
     gatunek        VARCHAR2(15),
     lapowka        VARCHAR2(20)
    );

CREATE TABLE Kocury
    (imie           VARCHAR2(15)    CONSTRAINT kc_im_ob NOT NULL,
     plec           VARCHAR2(1)     CONSTRAINT kc_pl_md CHECK(plec IN ('M','D')),
     pseudo         VARCHAR2(15)    CONSTRAINT kc_ps_pk PRIMARY KEY,
     funkcja        VARCHAR2(10)    CONSTRAINT kc_fu_fk REFERENCES Funkcje(funkcja),
     szef           VARCHAR2(15)    CONSTRAINT kc_sz_fk REFERENCES Kocury(pseudo),
     w_stadku_od    DATE            DEFAULT(SYSDATE),
     przydzial_myszy NUMBER(3),
     myszy_extra    NUMBER(3),
     nr_bandy       NUMBER(2)       CONSTRAINT kc_nr_fk REFERENCES Bandy(nr_bandy)
    );

CREATE TABLE Wrogowie_kocurow
    (pseudo         VARCHAR2(15)    CONSTRAINT wr_ps_fk REFERENCES Kocury(pseudo),
     imie_wroga     VARCHAR2(15)    CONSTRAINT wr_im_fk REFERENCES Wrogowie(imie_wroga),
     data_incydentu DATE            CONSTRAINT wr_da_nn NOT NULL,
     opis_incydentu VARCHAR2(50),
     CONSTRAINT ps_im_pk  PRIMARY KEY (pseudo, imie_wroga)
    );


ALTER TABLE Bandy
ADD CONSTRAINT bd_sz_fk
FOREIGN KEY (szef_bandy) REFERENCES Kocury(pseudo);

ALTER TABLE Kocury
DISABLE CONSTRAINT kc_nr_fk
DISABLE CONSTRAINT kc_fu_fk
DISABLE CONSTRAINT kc_sz_fk;


INSERT ALL
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('JACEK','M','PLACEK','LOWCZY','LYSY','2008-12-01',67,NULL,2)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BARI','M','RURA','LAPACZ','LYSY','2009-09-01',56,NULL,2)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MICKA','D','LOLA','MILUSIA','TYGRYS','2009-10-14',25,47,1)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('LUCEK','M','ZERO','KOT','KURKA','2010-03-01',43,NULL,3)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('SONIA','D','PUSZYSTA','MILUSIA','ZOMBI','2010-11-18',20,35,3)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('LATKA','D','UCHO','KOT','RAFA','2011-01-01',40,NULL,4)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('DUDEK','M','MALY','KOT','RAFA','2011-05-15',40,NULL,4)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('CHYTRY','M','BOLEK','DZIELCZY','TYGRYS','2002-05-05',50,NULL,1)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('KOREK','M','ZOMBI','BANDZIOR','TYGRYS','2004-03-16',75,13,3)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BOLEK','M','LYSY','BANDZIOR','TYGRYS','2006-08-15',72,21,2)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('ZUZIA','D','SZYBKA','LOWCZY','LYSY','2006-07-21',65,NULL,2)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('RUDA','D','MALA','MILUSIA','TYGRYS','2006-09-17',22,42,1)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('PUCEK','M','RAFA','LOWCZY','TYGRYS','2006-10-15',65,NULL,4)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('PUNIA','D','KURKA','LOWCZY','ZOMBI','2008-01-01',61,NULL,3)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BELA','D','LASKA','MILUSIA','LYSY','2008-02-01',24,28,2)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('KSAWERY','M','MAN','LAPACZ','RAFA','2008-07-12',51,NULL,4)
    INTO Kocury (imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MELA','D','DAMA','LAPACZ','RAFA','2008-11-01',51,NULL,4)
SELECT DUMMY FROM dual;

INSERT ALL
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (1,'SZEFOSTWO','CALOSC','TYGRYS')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (2,'CZARNI RYCERZE','POLE','LYSY')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (3,'BIALI LOWCY','SAD','ZOMBI')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (4,'LACIACI MYSLIWI','GORKA','RAFA')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (5,'ROCKERSI','ZAGRODA',NULL)
SELECT DUMMY FROM dual;

INSERT ALL
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('SZEFUNIO',90,110)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('BANDZIOR',70,90)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('LOWCZY',60,70)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('LAPACZ',50,60)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('KOT',40,50)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('MILUSIA',20,30)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('DZIELCZY',45,55)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES ('HONOROWA',6,25)
SELECT DUMMY FROM dual;

INSERT ALL
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('KAZIO',10,'CZLOWIEK','FLASZKA')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('GLUPIA ZOSKA',1,'CZLOWIEK','KORALIK')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('SWAWOLNY DYZIO',7,'CZLOWIEK','GUMA DO ZUCIA')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('BUREK',4,'PIES','KOSC')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('DZIKI BILL',10,'PIES',NULL)
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('REKSIO',2,'PIES','KOSC')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('BETHOVEN',1,'PIES','PEDIGRIPALL')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('CHYTRUSEK',5,'LIS','KURCZAK')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('SMUKLA',1,'SOSNA',NULL)
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES ('BAZYLI',3,'KOGUT','KURA DO STADA')
SELECT DUMMY FROM dual;

INSERT ALL
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('TYGRYS','KAZIO','2004-10-13','USILOWAL NABIC NA WIDLY')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('ZOMBI','SWAWOLNY DYZIO','2005-03-07','WYBIL OKO Z PROCY')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('BOLEK','KAZIO','2005-03-29','POSZCZUL BURKIEM')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('SZYBKA','GLUPIA ZOSKA','2006-09-12','UZYLA KOTA JAKO SCIERKI')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('MALA','CHYTRUSEK','2007-03-07','ZALECAL SIE')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('TYGRYS','DZIKI BILL','2007-06-12','USILOWAL POZBAWIC ZYCIA')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('BOLEK','DZIKI BILL','2007-11-10','ODGRYZL UCHO')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('LASKA','DZIKI BILL','2008-12-12','POGRYZL ZE LEDWO SIE WYLIZALA')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('LASKA','KAZIO','2009-01-07','ZLAPAL ZA OGON I ZROBIL WIATRAK')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('DAMA','KAZIO','2009-02-07','CHCIAL OBEDRZEC ZE SKORY')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('MAN','REKSIO','2009-04-14','WYJATKOWO NIEGRZECZNIE OBSZCZEKAL')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('LYSY','BETHOVEN','2009-05-11','NIE PODZIELIL SIE SWOJA KASZA')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('RURA','DZIKI BILL','2009-09-03','ODGRYZL OGON')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('PLACEK','BAZYLI','2010-07-12','DZIOBIAC UNIEMOZLIWIL PODEBRANIE KURCZAKA')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('PUSZYSTA','SMUKLA','2010-11-19','OBRZUCILA SZYSZKAMI')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('KURKA','BUREK','2010-12-14','POGONIL')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('MALY','CHYTRUSEK','2011-07-13','PODEBRAL PODEBRANE JAJKA')
    INTO Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES ('UCHO','SWAWOLNY DYZIO','2011-07-14','OBRZUCIL KAMIENIAMI')
SELECT DUMMY FROM dual;

ALTER TABLE Kocury
ENABLE CONSTRAINT kc_nr_fk
ENABLE CONSTRAINT kc_fu_fk
ENABLE CONSTRAINT kc_sz_fk;


/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------- L I S T A   P I E R W S Z A -------------------------------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Zad. 1. Znajdz imiona wrogow, ktorzy dopuscili sie incydentow w 2009r. */
SELECT imie_wroga "WROG", opis_incydentu "PRZEWINA"
    FROM Wrogowie_kocurow
    WHERE EXTRACT(YEAR FROM data_incydentu) = 2009;


/* Zad. 2. Znajdz wszystkie kotki (plec damska), ktore przystapily do stada miedzy 1 wrzesnia 2005r. a 31 lipca 2007r. */
SELECT imie "IMIE", funkcja "FUNKCJA", w_stadku_od "Z NAMI OD"
    FROM Kocury
    WHERE plec = 'D'
        AND w_stadku_od >= '2005.09.01'
        AND w_stadku_od <= '2007.07.31';


/* Zad. 3. Wyswietl imiona, gatunki i stopnie wrogo?ci nieprzekupnych wrogow. Wyniki maja byc uporzadkowane rosnaco wedlug stopnia wrogosci. */
SELECT imie_wroga "WROG", gatunek "GATUNEK", stopien_wrogosci "STOPIEN WROGOSCI"
    FROM Wrogowie
    WHERE lapowka IS NULL
    ORDER BY stopien_wrogosci;


/* Zad. 4. Wyswietlic dane o kotach p?ci m?skiej zebrane w jednej kolumnie postaci:
JACEK zwany PLACEK (fun. LOWCZY) lowi myszki w bandzie2 od 2008-12-01
Wyniki nalezy uporzadkowac malejaco wg daty przyst?pienia do stada. W przypadku tej samej daty przyst?pienia wyniki uporzadkowac alfabetycznie wg  pseudonimow. */
SELECT imie||' zwany '||pseudo||' (fun. '||funkcja||') lowi myszki w bandzie'||nr_bandy||' od '||TO_CHAR(w_stadku_od, 'YYYY-MM-DD')||' ' "WSZYSTKO O KOCURACH"           
    FROM Kocury
    WHERE plec = 'M'
    ORDER BY w_stadku_od DESC, pseudo;


/* ZAD. 5 Znalezc pierwsze wystapienie litery A i pierwsze wystapienie litery L w kazdym pseudonimie a nastepnie zamienic znalezione litery na odpowiednio # i %.
Wykorzystac funkcje dzialajace na lancuchach. Brac pod uwage tylko te pseudonimy, w ktorych wystepuja obie litery. */
SELECT pseudo "PSEUDO", REGEXP_REPLACE(REGEXP_REPLACE(pseudo,'A','#',1,1),'L','%',1,1) "Po wymianie A na # oraz L na %" 
    FROM Kocury 
    WHERE pseudo LIKE '%A%'
      AND pseudo LIKE '%L%';


/* ZAD. 6 Wyswietlic imiona kotow z co najmniej czternastoletnim stalem (ktore dodatkowo przystapowaly do stada od 1 marca do 30 wrzesnia),
daty ich przystapienia do stada, poczatkowy przydzial myszy (obecny przydzial, ze wzgledu na podwyzke po po roku czlonkostwa,
jest o 10% wyzszy od poczatkowego), date wspomnianej podwyzki o 10% oraz aktualny przydzial myszy.
Wykorzystac odpowiednie funkcje dzialajace na datach. W ponizszym rozwiazaniu data biezaca jest 29.06.2023.  */
SELECT imie, TO_DATE(w_stadku_od, 'YYYY-MM-DD') "W stadku", CEIL(NVL(przydzial_myszy, 0) * 0.9)  "Zjadl",  ADD_MONTHS(w_stadku_od, 6)  "Podwyzka", NVL(przydzial_myszy, 0) "Zjada"
    FROM Kocury
    Where ADD_MONTHS(w_stadku_od, 168) <= TO_DATE('2023-06-29') AND EXTRACT(month FROM w_stadku_od) BETWEEN 3 AND 9 ;

    
/* ZAD. 7 Wyswietlic imiona, kwartalne przydzialy myszy i kwartalne przydzialy dodatkowe dla wszystkich kotow,
u ktorych przydzial myszy jest wiekszy od dwukrotnego przydzialu dodatkowego ale nie mniejszy od 55. */
SELECT imie, przydzial_myszy * 3 "MYSZY KWARTALNIE", NVL(myszy_extra, 0) * 3 "KWARTALNE DODATKI"
    FROM Kocury 
    WHERE przydzial_myszy >=55 
        AND przydzial_myszy>2 * NVL(myszy_extra, 0)
    ORDER BY przydzial_myszy DESC, imie; 

    
/* Zad. 8. Wyswietlic dla kazdego kota (imie) nastepujace informacje o calkowitym rocznym spozyciu myszy: wartosc calkowitego spozycia jesli przekracza 660,
oLimito jesli jest rowne 660, oPonizej 660o jesli jest mniejsze od 660. Nie uzywac operatorow zbiorowych (UNION, INTERSECT, MINUS). */

SELECT imie, 
    CASE 
        WHEN przydzial_myszy * 12 + NVL(myszy_extra, 0) * 12 = 660 THEN 'limit'
        WHEN przydzial_myszy * 12 + NVL(myszy_extra, 0) * 12 > 660 THEN TO_CHAR(przydzial_myszy * 12  + NVL(myszy_extra, 0) * 12)
        ELSE 'Ponizej 660'
    END "Zjada Rocznie"
    FROM Kocury
    ORDER BY imie;


/* Zad. 9. Po kilkumiesiecznym, spowodowanym kryzysem, zamrozeniu wydawania myszy Tygrys z dniem biezacym wznowic wyplaty zgodnie z zasada,
ze koty, ktore przystapily do stada w pierwszej polowie miesiaca (lacznie z 15-m) otrzymuja pierwszy po przerwie przydzial myszy w ostatni? srode biezacego miesiaca,
natomiast koty, ktore przystapily do stada po 15-ym, pierwszy po przerwie przydzial myszy otrzymuja w ostatnia srode nastepnego miesiaca.
W kolejnych miesiacach myszy wydawane sa wszystkim kotom w ostatnia srode kazdego miesiaca. Wyswietlic dla kazdego kota jego pseudonim,
date przystapienia do stada oraz date pierwszego po przerwie przydzialu myszy, przy zalozenu, ze  data biezaca jest 24 i 26 pazdziernik 2023 r.*/
SELECT pseudo, w_stadku_od,
    CASE WHEN NEXT_DAY(LAST_DAY('2023-10-24') - 7, 'WEDNESDAY') >= '2023-10-24' THEN
    
        CASE WHEN EXTRACT(DAY FROM w_stadku_od) <= 15 THEN NEXT_DAY(LAST_DAY('2023-10-24') - 7, 'WEDNESDAY')
             ELSE NEXT_DAY(LAST_DAY(ADD_MONTHS('2023-10-24', 1)) - 7, 'WEDNESDAY')
        END
        
        ELSE NEXT_DAY(LAST_DAY(ADD_MONTHS('2023-10-24', 1)) - 7, 'WEDNESDAY')
    END "WYPLATA"
    FROM Kocury
    ORDER BY w_stadku_od;
  
SELECT 
NEXT_DAY(LAST_DAY('2023-10-24') - 7, 'WEDNESDAY') 
FROM DUAL;

SELECT pseudo, w_stadku_od,
    CASE WHEN NEXT_DAY(LAST_DAY('2023-10-26') - 7, 'WEDNESDAY') >= '2023-10-26' THEN
    
        CASE WHEN EXTRACT(DAY FROM w_stadku_od) <= 15 THEN NEXT_DAY(LAST_DAY('2023-10-26') - 7, 'WEDNESDAY')
             ELSE NEXT_DAY(LAST_DAY(ADD_MONTHS('2023-10-26', 1)) - 7, 'WEDNESDAY')
        END
        
        ELSE NEXT_DAY(LAST_DAY(ADD_MONTHS('2023-10-26', 1)) - 7, 'WEDNESDAY')
    END "WYPLATA"
    
    FROM Kocury
    ORDER BY w_stadku_od;

/* Zad. 10. Atrybut pseudo w tabeli Kocury jest kluczem goownym tej tabeli. Sprawdzic, czy rzeczywiscie wszystkie pseudonimy sa wzajemnie rozne. Zrobic to samo dla atrybutu szef. */
SELECT pseudo||' - '||
    CASE WHEN COUNT(pseudo) = 1 THEN 'Unikalny'
        ELSE 'nieunikalny'
    END || ' ' "Unikalnosc atr. PSEUDO"
    FROM Kocury
    GROUP BY pseudo;

SELECT szef||' - '||
    CASE WHEN COUNT(pseudo) = 1 THEN 'Unikalny'
        ELSE 'nieunikalny'
    END || ' ' "Unikalnosc atr. SZEF"
    FROM Kocury 
    WHERE szef IS NOT NULL
    GROUP BY szef
    ORDER BY szef;


/* Zad. 11. Znalezc pseudonimy kotow posiadajacych co najmniej dwoch wrogow. */
SELECT pseudo "Pseudonim", COUNT(imie_wroga) "Liczba wrogow"
    FROM Wrogowie_kocurow
    HAVING COUNT(pseudo) > 1
    GROUP BY pseudo;


/* Zad. 12. Znalezc maksymalny calkowity przydzial myszy dla wszystkich grup funkcyjnych (z pomini?ciem SZEFUNIA i kotow plci meskiej)
o srednim calkowitym przydziale(z uwzglednieniem dodatkowych przydzialow o myszy_extra) wiekszym  od 50.  */
SELECT 'Liczba kotow: '|| COUNT(*) || ' lowi ryby jako ' || funkcja || ' i zjada max. ' || TO_CHAR(MAX(przydzial_myszy + NVL(myszy_extra,0)), '999.99') || ' myszy miesiecznie.'
    FROM Kocury
    WHERE plec != 'M' AND funkcja != 'szefunio'
    GROUP BY Funkcja
    HAVING AVG( przydzial_myszy + NVL(myszy_extra,0) ) > 50;


/* Zad. 13. Wyswietlic minimalny przydzial myszy w kazdej bandzie z podzia?em na plcie. */
SELECT nr_bandy "Nr bandy", plec "Plec", MIN(przydzial_myszy) "Minimalny przydzial"
    FROM Kocury
    GROUP BY plec, nr_bandy;


/* Zad. 14. Wyswietlic informacje o kocurach (plec meska) posiadajacych w hierarchii przelozonych szefa plci meskiej pelniacego funkcje BANDZIOR 
(wyswietlic takze dane tego przelozonego). Dane kotow podleglych konkretnemu szefowi maja byc wyswietlone zgodnie z ich miejscem w hierarchii podleglosci. */
SELECT level "Poziom", pseudo "Pseudonim", funkcja "Funkcja", nr_bandy "Number bandy"
    FROM Kocury
    WHERE plec = 'M'
    CONNECT BY PRIOR pseudo = szef
    START WITH funkcja = 'BANDZIOR';


/* Zad. 15. Przedstawic informacje o podleg?o?ci kotow posiadajacych dodatkowy przydzial myszy tak,
aby imie kota stojacego najwyzej w hierarchii bylo wyswietlone z najmniejszym wcieciem a pozostale imiona z wcieciem odpowiednim do miejsca w hierarchii. */
SELECT REGEXP_REPLACE(SYS_CONNECT_BY_PATH('', '===>'), '(===>)', '', 1, 1) || (CAST(level AS INTEGER)-1) ||'                '||imie||' ' AS "Hierarchia",
    NVL(szef, 'Sam sobie panem') "Pseudo szefa",
    funkcja "Funkcja"
    FROM Kocury
    WHERE myszy_extra IS NOT NULL
    CONNECT BY PRIOR pseudo = szef
    START WITH szef IS NULL;


/* Zad. 16.  Wyswietlic okreslona pseudonimami droge sluzbowa (przez wszystkich kolejnych przelozonych do glownego szefa)
kotow plci meskiej o stazu dluzszym niz czternascie lat  nie posiadajacych dodatkowego przydzialu myszy. */
SELECT REGEXP_REPLACE(SYS_CONNECT_BY_PATH('', '    '), '    ', '', 1, 1) || pseudo "Droga sluzbowa"  
    FROM Kocury
    CONNECT BY pseudo = PRIOR szef
    START WITH plec='M'
        AND MONTHS_BETWEEN(TO_DATE('2023-06-29'), w_stadku_od) > 168
        AND myszy_extra IS NULL;
    
    
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------- L I S T A   D R U G A -------------------------------------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Zad. 17. Wyswietlic pseudonimy, przydzialy myszy oraz nazwy band dla kotow operuj?cych
na terenie POLE posiadajacych przydzial myszy wiekszy od 50. Uwzglednic fakt, ze sa w
stadzie koty posiadaj?ce prawo do polowa? na calym oobslugiwanymo przez stado terenie.
Nie stosowac podzapytan.*/

SELECT pseudo "POLUJE W POLU", przydzial_myszy "PRZYDZIAL MYSZY", nazwa "BANDA"
    FROM Kocury JOIN Bandy USING(nr_bandy)
    WHERE (teren = 'POLE' OR teren = 'CALOSC') AND przydzial_myszy > 50
    ORDER BY 2 DESC;


/* Zad. 18. Wyswietlic bez stosowania podzapytania imiona i daty przystapienia do stada
kotow, ktore przystapily do stada przed kotem o imieniu oJACEKo. Wyniki uporzadkowac
malejaco wg daty przystapienia do stadka.  */

SELECT K1.imie, K1.w_stadku_od
    FROM Kocury K1, Kocury K2
    WHERE K2.imie = 'JACEK' AND K1.w_stadku_od < K2.w_stadku_od
    ORDER BY K1.w_stadku_od DESC;
    

/* Zad. 19. Dla kotow pelniacych funkcje KOT i MILUSIA wyswietlic w kolejnosci hierarchii
imiona wszystkich ich szefow. Zadanie rozwiazac na trzy sposoby:
a. z wykorzystaniem tylko zlaczen,
b. z wykorzystaniem drzewa, operatora CONNECT_BY_ROOT i tabel przestawnych,
c. z wykorzystaniem drzewa, funkcji SYS_CONNECT_BY_PATH
i operatora CONNECT_BY_ROOT.
 */

/* a */
SELECT K1.imie "Imie", K1.funkcja "Funkcja", NVL(K2.imie, ' ') "Szef 1", NVL(K3.imie, ' ') "Szef 2", NVL(K4.imie, ' ') "Szef 3"
    FROM Kocury K1 FULL JOIN Kocury K2 ON K1.szef=K2.pseudo
    FULL JOIN Kocury K3 ON K2.szef=K3.pseudo
    FULL JOIN Kocury K4 ON K3.szef=K4.pseudo
    WHERE K1.funkcja = 'KOT' OR K1.funkcja = 'MILUSIA';

/* b */
SELECT i "Imie", f "Funkcja", NVL(s1, ' ') "Szef 1", NVL(s2, ' ') "Szef 2", NVL(s3, ' ') "Szef 3"
    FROM ( SELECT CONNECT_BY_ROOT imie i, CONNECT_BY_ROOT funkcja f, level lvl, imie 
                FROM Kocury
                CONNECT BY pseudo = PRIOR szef 
                START WITH funkcja IN ('KOT', 'MILUSIA'))
    PIVOT ( MAX(imie)
            FOR lvl 
            IN (2 s1, 3 s2, 4 s3)
          );

SELECT *
    FROM ( SELECT CONNECT_BY_ROOT imie i, CONNECT_BY_ROOT funkcja f, level lvl, imie 
                FROM Kocury
                CONNECT BY pseudo = PRIOR szef 
                START WITH funkcja IN ('KOT', 'MILUSIA'));
/* c */
SELECT imie "Imie", funkcja "Funkcja", SUBSTR(MAX(szefowie), LENGTH(imie) + 10) "Imiona kolejnych szefow"  
    FROM(SELECT CONNECT_BY_ROOT imie imie, CONNECT_BY_ROOT funkcja funkcja, SYS_CONNECT_BY_PATH(imie, '    |' ) szefowie
         FROM Kocury
         CONNECT BY PRIOR szef = pseudo 
         START WITH funkcja IN ('KOT', 'MILUSIA'))
    GROUP BY funkcja, imie;
        

/* Zad. 20. Wyswietlic imiona wszystkich kotek, ktore uczestniczyly w incydentach po
01.01.2007. Dodatkowo wyswietlic nazwy band do ktorych naleza kotki, imiona ich wrogow
wraz ze stopniem wrogo?ci oraz date incydentu. */

SELECT imie "Imie kotki", nazwa "Nazwa bandy", imie_wroga "Imie wroga", stopien_wrogosci "Ocena wroga", data_incydentu "Data inc."
    FROM Kocury NATURAL JOIN Wrogowie_kocurow NATURAL JOIN Bandy NATURAL JOIN Wrogowie
    WHERE data_incydentu > '2007-01-01' AND plec='D'
    ORDER BY imie, data_incydentu;


/* Zad. 21. Okreslic ile kotow w kazdej z band posiada wrogow. */

SELECT nazwa "Nazwa bandy", COUNT(DISTINCT pseudo) "Koty z Wrogami"
    FROM Kocury 
    NATURAL JOIN Wrogowie_kocurow 
    NATURAL JOIN Bandy
    GROUP BY nazwa;

/* Zad. 22. Znalezc koty (wraz z pelniona funkcja), ktore posiadaja wiecej niz jednego wroga. */

SELECT funkcja "Funkcja", pseudo "Pseudonim kota", COUNT(imie_wroga) "Liczba wrogow"
    FROM Kocury JOIN Wrogowie_kocurow USING(pseudo)
    GROUP BY pseudo, funkcja
    HAVING COUNT(imie_wroga)>1;

/* Zad. 23. Wyswietlic imiona kotow, ktore dostaja "mysza" premie wraz z ich calkowitym
rocznym spozyciem myszy. Dodatkowo jesli ich roczna dawka myszy przekracza 864
wyswietlic tekst 'powyzej 864', jesli jest rowna 864 tekst '864', jesli jest mniejsza od 864
tekst 'ponizej 864'. Wyniki uporzadkowac malejaco wg rocznej dawki myszy. Do
rozwiazania wykorzystac operator zbiorowy UNION. */

SELECT imie "Imie", (NVL(myszy_extra, 0) + przydzial_myszy) * 12 "Dawka roczna", 'Powyzej 864' "DAWKA"
    FROM Kocury
    WHERE (NVL(myszy_extra, 0) + przydzial_myszy) * 12 > 864 AND myszy_extra IS NOT NULL
UNION
SELECT imie "Imie", (NVL(myszy_extra, 0) + przydzial_myszy) * 12 "Dawka roczna", '864' "DAWKA"
    FROM Kocury
    WHERE (NVL(myszy_extra, 0) + przydzial_myszy) * 12 = 864 AND myszy_extra IS NOT NULL
UNION 
SELECT imie "Imie", (NVL(myszy_extra, 0) + przydzial_myszy) * 12 "Dawka roczna", 'Ponizej 864' "DAWKA"
    FROM Kocury
    WHERE (NVL(myszy_extra, 0) + przydzial_myszy) * 12 < 864 AND myszy_extra IS NOT NULL
    ORDER BY 2 DESC;


/* Zad. 24. Znalezc bandy, ktore nie posiadaja czlonkow. Wyswietlic ich numery, nazwy i
tereny operowania. Zadanie rozwiazac na dwa sposoby: bez podzapytan i operatorow
zbiorowych oraz wykorzystujac operatory zbiorowe. */

/* BEZ OPERATORA ZBIOROWEGO */
SELECT B.nr_bandy, B.nazwa, B.teren
    FROM Bandy B left join Kocury K on B.nr_bandy = K.nr_bandy
    where K.pseudo is null;

/* Z OPERATOREM ZBIOROWYM */
SELECT nr_bandy, nazwa, teren
    FROM Bandy
MINUS
SELECT nr_bandy, nazwa, teren
    FROM Bandy JOIN Kocury USING(nr_bandy);
    

/* Zad. 25. Znalezc koty, ktorych przydzial myszy jest nie mniejszy od potrojonego
najwyzszego przydzialu sposrod przydzialow wszystkich MILUS operujacych w SADZIE.
Nie stosowac funkcji MAX. */

SELECT imie, funkcja, przydzial_myszy
    FROM Kocury
    WHERE przydzial_myszy >= 3 * ( SELECT przydzial_myszy
                FROM (SELECT * FROM Kocury ORDER BY przydzial_myszy DESC) NATURAL JOIN Bandy
                            WHERE funkcja = 'MILUSIA' AND  teren IN ('SAD', 'CALOSC') AND ROWNUM=1);
        

/* Zad. 26. Znalezc funkcje (pomijajac SZEFUNIA), z ktorymi zwiazany jest najwyzszy i
najnizszy sredni calkowity przydzial myszy. Nie uzywac operatorow zbiorowych (UNION,
INTERSECT, MINUS). */

SELECT funkcja "Funkcja", ROUND(AVG( NVL(myszy_extra, 0) + przydzial_myszy )) "Srednio najw. i najm. myszy"
    FROM Funkcje NATURAL JOIN Kocury
    WHERE funkcja != 'SZEFUNIO'
    GROUP BY funkcja 
    HAVING ROUND(AVG( NVL(myszy_extra, 0) + przydzial_myszy )) IN ((SELECT MAX(ROUND(AVG( NVL(myszy_extra, 0) + przydzial_myszy )))
                                                                        FROM Kocury                                   
                                                                        WHERE funkcja != 'SZEFUNIO'
                                                                        GROUP BY funkcja),
                                                                    (SELECT MIN(ROUND(AVG( NVL(myszy_extra, 0) + przydzial_myszy )))
                                                                        FROM Kocury                                   
                                                                        WHERE funkcja != 'SZEFUNIO'
                                                                        GROUP BY funkcja));
                                                                        


/* Zad. 27. Znalezc koty zajmujace pierwszych n miejsc pod wzgledem calkowitej liczby
spozywanych myszy (koty o tym samym spozywaniu zajmuja to samo miejsce!). Zadanie
rozwiazac na cztery sposoby:
a. wykorzystujac podzapytanie skorelowane,
b. wykorzystujac pseudokolumne ROWNUM,
c. wykorzystujac zlaczenie relacji Kocury z relacja Kocury
d. wykorzystujac funkcje analityczne. N = 6*/

/* a */
SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) zjada
    FROM Kocury K1
    WHERE (SELECT COUNT(DISTINCT(NVL(K2.przydzial_myszy, 0) + NVL(K2.myszy_extra, 0)))
            FROM Kocury K2
            WHERE K2.przydzial_myszy + NVL(K2.myszy_extra, 0) > K1.przydzial_myszy + NVL(K1.myszy_extra, 0) ) < &N
    ORDER BY zjada DESC, pseudo;


/*  b */
SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) "zjada"
FROM Kocury
WHERE przydzial_myszy + NVL(myszy_extra, 0) IN 
    (SELECT *
        FROM (SELECT DISTINCT(NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) zjada
                    FROM Kocury
                    ORDER BY zjada DESC )
        WHERE ROWNUM <= &N);


/* c */
SELECT K1.pseudo, MAX(NVL(K1.przydzial_myszy, 0) + NVL(K1.myszy_extra, 0)) AS ZJADA
    FROM Kocury K1 
    JOIN Kocury K2 ON K1.przydzial_myszy + NVL(K1.myszy_extra, 0) <= K2.przydzial_myszy + NVL(K2.myszy_extra, 0)
    GROUP BY K1.pseudo
    HAVING COUNT(DISTINCT K2.przydzial_myszy + NVL(K2.myszy_extra, 0)) <= &N 
    ORDER BY ZJADA DESC;


/* d */
SELECT pseudo, zjada "Zjada"
    FROM (SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) zjada,
                DENSE_RANK()
                OVER (ORDER BY (przydzial_myszy + NVL(myszy_extra, 0)) DESC) pozycja
            FROM Kocury)
    WHERE pozycja <= &N;
    


SELECT K1.pseudo, K1.przydzial_myszy + NVL(K1.myszy_extra, 0), K2.pseudo Zjada
    FROM Kocury K1 
    JOIN Kocury K2 ON (K1.przydzial_myszy + NVL(K1.myszy_extra,0)) <= (K2.przydzial_myszy + NVL(K2.myszy_extra,0))
    ORDER BY 2 DESC;
/* Zad. 28. Okreslic lata, dla ktorych liczba wstapien do stada jest najblizsza (od gory i od dolu)
sredniej liczbie wstapien dla wszystkich lat (srednia z wartosci okreslajacych liczbe wstapien
w poszczegolnych latach). Nie stosowac widoku (perspektywy). */

SELECT TO_CHAR(EXTRACT(YEAR FROM w_stadku_od)) "ROK", COUNT(pseudo) "Liczba wstapien"
    FROM Kocury
    GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    HAVING count(pseudo) IN (
                                ( SELECT MIN(COUNT(pseudo))
                                    FROM Kocury
                                    GROUP BY EXTRACT(YEAR FROM w_stadku_od)
                                    HAVING COUNT(pseudo) > (
                                            SELECT AVG(COUNT(pseudo))
                                            from Kocury
                                            group by EXTRACT(YEAR FROM w_stadku_od) 
                                            ))
                                ,
                                ( SELECT MAX(COUNT(pseudo))
                                    FROM Kocury
                                    GROUP BY EXTRACT(YEAR FROM w_stadku_od)
                                    HAVING COUNT(pseudo) < (
                                            SELECT AVG(COUNT(pseudo))
                                            from Kocury
                                            group by EXTRACT(YEAR FROM w_stadku_od) 
                                            ))
                                )
UNION ALL
SELECT 'SREDNIA' "ROK", ROUND(AVG(COUNT(*)), 3)
    FROM Kocury
    GROUP BY EXTRACT(YEAR FROM w_stadku_od)
ORDER BY 2;


/* Zad. 29. Dla kocurow (plec meska), dla ktorych calkowity przydzial myszy nie przekracza
sredniej w ich bandzie wyznaczyc nastepujace dane: imie, calkowite spozycie myszy, numer
bandy, srednie calkowite spozycie w bandzie. Nie stosowac widoku (perspektywy). Zadanie
rozwiazac na trzy sposoby:
a. ze zlaczeniem ale bez podzapytan,
b. ze zlaczeniem i z jedynym podzapytaniem w klauzurze FROM,
c. bez zlaczen i z dwoma podzapytaniami: w klauzurach SELECT i WHERE. */

/* a */
SELECT K1.imie, NVL(K1.myszy_extra, 0) + K1.przydzial_myszy "ZJADA", K1.nr_bandy, AVG((NVL(K2.myszy_extra, 0) + K2.przydzial_myszy)) "SREDNIA BANDY"
    FROM Kocury K1 JOIN Kocury K2 ON K1.nr_bandy = K2.nr_bandy
    WHERE K1.plec='M'
    GROUP BY K1.imie, K1.przydzial_myszy, K1.myszy_extra, K1.nr_bandy
    HAVING (NVL(K1.myszy_extra, 0) + K1.przydzial_myszy) <= AVG((NVL(K2.myszy_extra, 0) + K2.przydzial_myszy))
    ORDER BY k1.nr_bandy DESC;
    
/* b */
SELECT imie, NVL(myszy_extra, 0) + przydzial_myszy "ZJADA", nr_bandy, srednia "SREDNIA BANDY"
    FROM (SELECT nr_bandy, AVG((NVL(myszy_extra, 0) + przydzial_myszy)) srednia
                FROM Kocury
                GROUP BY nr_bandy)
          JOIN Kocury USING (nr_bandy)
    WHERE srednia >= NVL(myszy_extra, 0) + przydzial_myszy AND plec='M'
    ORDER BY nr_bandy DESC;
    
/* c */
SELECT imie, NVL(myszy_extra, 0) + przydzial_myszy "ZJADA", nr_bandy, (SELECT AVG((NVL(myszy_extra, 0) + przydzial_myszy)) FROM Kocury K2 WHERE K1.nr_bandy = K2.nr_bandy) "SREDNIA BANDY"
    FROM Kocury K1
    WHERE plec='M' AND NVL(myszy_extra, 0) + przydzial_myszy <= (SELECT AVG((NVL(myszy_extra, 0) + przydzial_myszy)) FROM Kocury K2 WHERE K1.nr_bandy = K2.nr_bandy)
    ORDER BY nr_bandy DESC;
    

/* Zad. 30. Wygenerowac liste kotow z zaznaczonymi kotami o najwyzszym i o najnizszym 
stazu w swoich bandach. Zastosowac operatory zbiorowe. */

SELECT imie, w_stadku_od || ' <--- NAJSTARSZY STAZEM W BANDZIE ' || nazwa "WSTAPIL DO STADKA"
    FROM Kocury K1 JOIN Bandy B ON K1.nr_bandy = B.nr_bandy
    WHERE w_stadku_od = (SELECT MAX(w_stadku_od) FROM Kocury K2 WHERE K1.nr_bandy = K2.nr_bandy)
    
UNION ALL

SELECT imie, w_stadku_od || ' <--- NAJMLODSZY STAZEM W BANDZIE ' || nazwa "WSTAPIL DO STADKA"
    FROM Kocury K1 JOIN Bandy B ON K1.nr_bandy = B.nr_bandy
    WHERE w_stadku_od = (SELECT MIN(w_stadku_od) FROM Kocury K2 WHERE K1.nr_bandy = K2.nr_bandy)
        
UNION ALL

SELECT imie, TO_CHAR(w_stadku_od) "WSTAPIL DO STADKA"
    FROM Kocury K1 JOIN Bandy B ON K1.nr_bandy = B.nr_bandy
    WHERE w_stadku_od != (SELECT MIN(w_stadku_od) FROM Kocury K2 WHERE K1.nr_bandy = K2.nr_bandy)
    AND w_stadku_od != (SELECT MAX(w_stadku_od) FROM Kocury K2 WHERE K1.nr_bandy = K2.nr_bandy)
ORDER BY 1;


/* Zad. 31. Zdefiniowac widok (perspektywe) wybierajacy nastepujace dane: nazwe bandy,
sredni, maksymalny i minimalny przydzial myszy w bandzie, calkowita liczbe kotow w
bandzie oraz liczbe kotow pobierajacych w bandzie przydzialy dodatkowe. Poslugujac sie
zdefiniowanym widokiem wybrac nastepujace dane o kocie, ktorego pseudonim podawany
jest interaktywnie z klawiatury: pseudonim, imie, funkcja, przydzial myszy, minimalny i
maksymalny przydzial myszy w jego bandzie oraz date wstapienia do stada. */

CREATE VIEW bandy_info (nazwa, srednio, max, min, koty, koty_z_dod)
    AS
    SELECT nazwa, AVG(przydzial_myszy), MAX(przydzial_myszy), MIN(przydzial_myszy), COUNT(pseudo), COUNT(myszy_extra)
        FROM Kocury NATURAL JOIN Bandy
        GROUP BY nazwa;
    

SELECT * FROM bandy_info;


SELECT pseudo, imie, funkcja, przydzial_myszy, 'Od ' || min || ' do ' || max "Granice Spozycia", w_stadku_od
    FROM Kocury JOIN Bandy USING(nr_bandy) JOIN bandy_info USING(nazwa)
    WHERE pseudo = '&pseudo';
    
/* Zad. 32. Dla kotow o trzech najdluzszych stazach w polaczonych bandach CZARNI
RYCERZE i LACIACI MYSLIWI zwiekszyc przydzial myszy o 10% minimalnego
przydzialu w calym stadzie lub o 10 w zaleznosci od tego czy podwyzka dotyczy kota plci
zeniskiej czy kota plci meskiej. Przydzial myszy extra dla kotow obu plci zwiekszyc o 15%
sredniego przydzialu extra w bandzie kota. Wyswietlic na ekranie wartosci przed i po
podwyzce a nastepnie wycofac zmiany. */

SELECT pseudo, plec, przydzial_myszy "Myszy przed podw.", NVL(myszy_extra, 0)  "Extra przed podw."
    FROM Kocury NATURAL JOIN Bandy
    WHERE pseudo in (SELECT * FROM 
                        (SELECT pseudo 
                            FROM Kocury NATURAL JOIN Bandy 
                            WHERE nazwa = 'CZARNI RYCERZE' 
                            ORDER BY w_stadku_od ASC)
                     WHERE ROWNUM <= 3
                     UNION ALL
                     SELECT * FROM 
                        (SELECT pseudo 
                            FROM Kocury NATURAL JOIN Bandy
                            WHERE nazwa = 'LACIACI MYSLIWI' 
                            ORDER BY w_stadku_od ASC)
                    WHERE ROWNUM <= 3
                        );
                        
                        
UPDATE Kocury
SET przydzial_myszy = 
    CASE plec
        WHEN 'M' THEN przydzial_myszy + 10
        ELSE (przydzial_myszy + (Select MIN(przydzial_myszy) FROM Kocury)*0.1) 
    END,
    myszy_extra = NVL(myszy_extra, 0) + ((SELECT AVG(NVL(myszy_extra, 0)) FROM Kocury K2 WHERE Kocury.nr_bandy = K2.nr_bandy) * 0.15)
    WHERE pseudo in (SELECT * FROM 
                        (SELECT pseudo 
                            FROM Kocury NATURAL JOIN Bandy 
                            WHERE nazwa = 'CZARNI RYCERZE' 
                            ORDER BY w_stadku_od ASC)
                     WHERE ROWNUM <= 3
                     UNION ALL
                     SELECT * FROM 
                        (SELECT pseudo 
                            FROM Kocury NATURAL JOIN Bandy
                            WHERE nazwa = 'LACIACI MYSLIWI' 
                            ORDER BY w_stadku_od ASC)
                    WHERE ROWNUM <= 3
                        );



SELECT pseudo, plec, przydzial_myszy "Myszy po podw.", NVL(myszy_extra, 0)  "Extra po podw."
    FROM Kocury NATURAL JOIN Bandy
    WHERE pseudo in (SELECT * FROM 
                        (SELECT pseudo 
                            FROM Kocury NATURAL JOIN Bandy 
                            WHERE nazwa = 'CZARNI RYCERZE' 
                            ORDER BY w_stadku_od ASC)
                     WHERE ROWNUM <= 3
                     UNION ALL
                     SELECT * FROM 
                        (SELECT pseudo 
                            FROM Kocury NATURAL JOIN Bandy
                            WHERE nazwa = 'LACIACI MYSLIWI' 
                            ORDER BY w_stadku_od ASC)
                    WHERE ROWNUM <= 3
                        );
/* distinct zjada */
rollback;


/* Zad. 33. Napisa? zapytanie, w ramach ktorego obliczone zostan? sumy calkowitego spozycia
myszy przez koty sprawujace kazda z funkcji z podzialem na bandy i plcie kotow.
Podsumowac przydzialy dla kazdej z funkcji. Zadanie wykona? na dwa sposoby:
a. z wykorzystaniem funkcji DECODE i SUM (ew. CASE i SUM),
b. z wykorzystaniem tabel przestawnych. */

/* a */
SELECT DECODE(plec, 'Kocor', ' ', nazwa) nazwa, plec, ile, szefunio, bandzior, lowczy, lapacz, kot, milusia, dzielczy, suma
FROM (SELECT nazwa,
             DECODE(plec, 'M', 'Kocor', 'Kotka') plec,
             to_char(count(pseudo)) ile,
             to_char(sum(decode(FUNKCJA,'SZEFUNIO', przydzial_myszy + NVL(myszy_extra,0),0))) szefunio,
             to_char(sum(decode(FUNKCJA, 'BANDZIOR', przydzial_myszy + NVL(myszy_extra,0),0))) bandzior,
             to_char(sum(decode(FUNKCJA, 'LOWCZY', przydzial_myszy + NVL(myszy_extra,0),0))) lowczy,
             to_char(sum(decode(FUNKCJA, 'LAPACZ', przydzial_myszy + NVL(myszy_extra,0),0))) lapacz,
             to_char(sum(decode(FUNKCJA, 'KOT', przydzial_myszy + NVL(myszy_extra,0),0))) kot,
             to_char(sum(decode(FUNKCJA, 'MILUSIA', przydzial_myszy + NVL(myszy_extra,0),0))) milusia,
             to_char(sum(decode(FUNKCJA, 'DZIELCZY', przydzial_myszy + NVL(myszy_extra,0),0))) dzielczy,
             to_char(sum(przydzial_myszy + NVL(myszy_extra,0))) suma
    FROM Kocury NATURAL JOIN Bandy
    GROUP BY nazwa, plec
    
UNION

SELECT 'Z----------------', '--------', '----------', '-----------', '-----------', '----------', '----------', '----------', '----------', '----------', '----------'
FROM dual

UNION 
SELECT 'ZJADA RAZEM' nazwa, ' ' plec, ' ' ile,
             to_char(sum(decode(FUNKCJA, 'SZEFUNIO', przydzial_myszy + NVL(myszy_extra,0),0))) szefunio,
             to_char(sum(decode(FUNKCJA, 'BANDZIOR', przydzial_myszy + NVL(myszy_extra,0),0))) bandzior,
             to_char(sum(decode(FUNKCJA, 'LOWCZY', przydzial_myszy + NVL(myszy_extra,0),0))) lowczy,
             to_char(sum(decode(FUNKCJA, 'LAPACZ', przydzial_myszy + NVL(myszy_extra,0),0))) lapacz,
             to_char(sum(decode(FUNKCJA, 'KOT', przydzial_myszy + NVL(myszy_extra,0),0))) kot,
             to_char(sum(decode(FUNKCJA, 'MILUSIA', przydzial_myszy + NVL(myszy_extra,0),0))) milusia,
             to_char(sum(decode(FUNKCJA, 'DZIELCZY', przydzial_myszy + NVL(myszy_extra,0),0))) dzielczy,
             to_char(sum(przydzial_myszy + NVL(myszy_extra,0))) suma
FROM Kocury NATURAL JOIN Bandy
ORDER BY 1, 2 DESC);

/* b */

SELECT  nazwa,
        plec,
        TO_CHAR(ile) "ILE",
        TO_CHAR(NVL(SZEFUNIO, 0)) "SZEFUNIO", TO_CHAR(NVL(BANDZIOR, 0)) "BANDZIOR", TO_CHAR(NVL(LOWCZY, 0)) "LOWCZY",
        TO_CHAR(NVL(LAPACZ, 0)) "LAPACZ", TO_CHAR(NVL(KOT, 0)) "KOT", TO_CHAR(NVL(MILUSIA, 0)) "MILUSIA", TO_CHAR(NVL(DZIELCZY, 0)) "DZIELCZY",
        TO_CHAR(suma) "SUMA"
        
        FROM (SELECT nazwa, DECODE(plec, 'M', 'Kocor', 'Kotka') plec, funkcja, (NVL(przydzial_myszy,0) + nvl(myszy_extra, 0)) przydzial
                    FROM Kocury NATURAL JOIN Bandy)
        PIVOT ( SUM(NVL(przydzial, 0))
                FOR funkcja
                IN ('SZEFUNIO' SZEFUNIO, 'BANDZIOR' BANDZIOR, 'LOWCZY' LOWCZY, 'LAPACZ' LAPACZ, 'KOT' KOT, 'MILUSIA' MILUSIA, 'DZIELCZY' DZIELCZY))
                
        JOIN ( SELECT nazwa, DECODE(plec, 'M', 'Kocor', 'Kotka') plec, SUM(NVL(przydzial_myszy,0) + nvl(myszy_extra, 0)) suma, COUNT(pseudo) ile
                FROM Kocury NATURAL JOIN Bandy
                GROUP BY nazwa, plec) USING(nazwa, plec)
                
    
UNION ALL

SELECT 'Z--------------', '------', '--------', '---------', '---------', '--------', '--------', '--------', '--------', '--------', '--------' FROM DUAL

UNION ALL

SELECT nazwa, plec, ile, TO_CHAR(s1), TO_CHAR(s2), TO_CHAR(s3), TO_CHAR(s4), TO_CHAR(s5), TO_CHAR(s6), TO_CHAR(s7), TO_CHAR(suma)

    FROM (SELECT 'ZJADA RAZEM ' nazwa, ' ' plec, ' ' ile , funkcja, (przydzial_myszy + NVL(myszy_extra, 0)) przydzial
              FROM Kocury NATURAL JOIN Bandy)
    PIVOT ( SUM(NVL(przydzial,0))   
            FOR funkcja                       
            IN ('SZEFUNIO' s1, 'BANDZIOR' s2, 'LOWCZY' s3, 'LAPACZ' s4, 'KOT' s5, 'MILUSIA' s6, 'DZIELCZY' s7))
            
    JOIN ( SELECT 'ZJADA RAZEM ' nazwa, SUM(NVL(przydzial_myszy,0) + nvl(myszy_extra, 0)) suma FROM Kocury) USING(nazwa)
ORDER BY 1, 2 DESC;


/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------- D R O P   T A B L E ---------------------------------------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*
DROP TABLE Bandy CASCADE CONSTRAINTS;
DROP TABLE Funkcje CASCADE CONSTRAINTS;
DROP TABLE Wrogowie CASCADE CONSTRAINTS;
DROP TABLE Kocury CASCADE CONSTRAINTS;
DROP TABLE Wrogowie_kocurow CASCADE CONSTRAINTS;
*/






