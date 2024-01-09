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
stadzie koty posiadajace prawo do polowan na calym oobslugiwanymo przez stado terenie.
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
/* -------------------------------------------------------------- L I S T A   T R Z E C I A ---------------------------------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



/*Zad. 34. Napisa? blok PL/SQL, kt�ry wybiera z relacji Kocury koty o funkcji podanej z klawiatury. Jedynym efektem dzia?ania bloku ma by? komunikat informuj?cy czy znaleziono,
czy te? nie, kota pe?ni?cego podan? funkcj? (w przypadku znalezienia kota wy?wietli? nazw? odpowiedniej funkcji).  */

SET SERVEROUTPUT ON;

DECLARE
    liczba NUMBER;
    fun Kocury.funkcja%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    SELECT COUNT(pseudo), MIN(funkcja) INTO liczba, fun
    FROM Kocury
    WHERE funkcja = TO_CHAR('&nazwa_funkcji');

    IF liczba > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Znaleziono kota pelniacego funkcje ' || fun);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Nie znaleziono');
    END IF;
END;
/


/* Zad. 35. Napisa? blok PL/SQL, kt�ry wyprowadza na ekran nast?puj?ce informacje o kocie o pseudonimie wprowadzonym z klawiatury (w zale?no?ci od rzeczywistych danych):
-	'calkowity roczny przydzial myszy >700'
-	'imi? zawiera litere A'
-	'maj jest miesiacem przystapienia do stada'
-	'nie odpowiada kryteriom'.
Powy?sze informacje wymienione s? zgodnie z ich hierarchi? wa?no?ci, nale?y wi?c wyprowadzi? pierwsz? prawdziw? informacj? o kocie pomijaj?c sprawdzanie nast?pnych. */

DECLARE 
    znaleziony BOOLEAN default false;
    calowity_przydzial_kota NUMBER;
    imie_kota Kocury.imie%TYPE;
    miesiac_dolaczenia_kota NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    SELECT (NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12, imie, EXTRACT(MONTH FROM w_stadku_od) 
    INTO calowity_przydzial_kota, imie_kota, miesiac_dolaczenia_kota
        FROM Kocury
        WHERE pseudo = TO_CHAR('&pseudo');
    
    IF calowity_przydzial_kota > 700 THEN
        DBMS_OUTPUT.PUT_LINE('Calkowity roczny przydzial kota wiekszy od 700, rowny = ' || calowity_przydzial_kota);
        znaleziony := true;
    END IF;
    
    IF imie_kota LIKE '%A%' THEN
        DBMS_OUTPUT.PUT_LINE('Imie kota zawiera litere A, imie =  ' || imie_kota);
        znaleziony := true;
    END IF;
    
    IF miesiac_dolaczenia_kota = 5 THEN
        DBMS_OUTPUT.PUT_LINE('Kot dolaczyl w maju, dokladna data =  ' || miesiac_dolaczenia_kota);
        znaleziony := true;
    END IF;
    
    IF NOT znaleziony THEN
        DBMS_OUTPUT.PUT_LINE('Kot nie odpowiada ani jednemu z kryterium');
    END IF;
    
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('Kot o podanym pseudo nie istnieje');  
END;
/


/* Zad. 36. W zwiazku z duza wydajno?ci? w ?owieniu myszy SZEFUNIO postanowi? wynagrodzi? swoich podw?adnych. 
Og?osi? wi?c, ?e podwy?sza indywidualny przydzia? myszy ka?dego kota o 10%, w kolejno?ci od kota o najni?szym przydziale pocz?wszy na kocie o najwy?szym przydziale sko?czywszy.
Ustali? te?, ?e proces zwi?kszania przydzia?u myszy nale?y zako?czy? gdy suma przydzia?�w wszystkich kot�w przekroczy liczb? 1050. 
Je?li dla jakiego? kota przydzia? myszy po podwy?ce przekroczy maksymaln? warto?? nale?n? dla pe?nionej funkcji 
(max_myszy z relacji Funkcje), przydzia? myszy po podwy?ce ma by? r�wny tej warto?ci. Napisa? blok PL/SQL z kursorem, kt�ry realizuje to zadanie.
Blok ma dzia?a? tak d?ugo, a? suma wszystkich przydzia?�w rzeczywi?cie przekroczy 1050 (liczba �obieg�w podwy?kowych� mo?e by? wi?ksza od 1 a wi?c i podwy?ka mo?e by? wi?ksza ni? 10%).
Wy?wietli? na ekranie sum? przydzia?�w myszy po wykonaniu zadania wraz z liczb? liczb? modyfikacji w relacji Kocury. Na ko?cu wycofa? wszystkie zmiany. */

DECLARE
    suma_przydzialow NUMBER;
    liczba_zmian NUMBER := 0;
    finalna_suma NUMBER := 1050;
    
    pm Kocury.przydzial_myszy%TYPE;
    mm Funkcje.max_myszy%TYPE;
  
    CURSOR przydzialy IS
        SELECT przydzial_myszy pm, max_myszy mm INTO  pm, mm
            FROM Kocury NATURAL JOIN Funkcje
            ORDER BY PRZYDZIAL_MYSZY 
            FOR UPDATE OF przydzial_myszy;

    wiersz przydzialy%ROWTYPE;
BEGIN
  SELECT SUM(przydzial_myszy) INTO suma_przydzialow FROM KOCURY;

    <<loop1>> LOOP
        OPEN przydzialy;
        
        LOOP
            FETCH przydzialy INTO wiersz; 
            EXIT loop1 WHEN suma_przydzialow > finalna_suma;
            EXIT WHEN przydzialy%NOTFOUND;
    
            IF (ROUND(1.1*wiersz.pm) < wiersz.mm) THEN
              UPDATE Kocury 
                  SET przydzial_myszy = ROUND(1.1 * wiersz.pm)
                  WHERE CURRENT OF przydzialy;
    
              liczba_zmian := liczba_zmian+1;
              suma_przydzialow:=suma_przydzialow + round(0.1*wiersz.pm);
                  
            ELSIF (wiersz.pm != wiersz.mm) THEN
              UPDATE Kocury
                  SET przydzial_myszy = wiersz.mm
                  WHERE CURRENT OF przydzialy;
                  
                  liczba_zmian:=liczba_zmian+1;
                  suma_przydzialow:=suma_przydzialow + (wiersz.mm - wiersz.pm);
            END IF;
            
        END LOOP;
        CLOSE przydzialy;
        
    END LOOP loop1;
  dbms_output.put_line('Calk. przydzial w stadku ' || suma_przydzialow || '. Zmian: ' || liczba_zmian );
END;
/

SELECT imie, NVL(przydzial_myszy,0) "Myszki po podwyzce" 
    FROM Kocury 
    ORDER BY przydzial_myszy DESC ;

rollback;


/* Zad. 37. Napisa? blok, kt�ry powoduje wybranie w p?tli kursorowej FOR pi?ciu kot�w o najwy?szym ca?kowitym przydziale myszy. Wynik wy?wietli? na ekranie. */
DECLARE 
    CURSOR przydzialy IS
        SELECT pseudo, NVL(przydzial_myszy,0) +  NVL(myszy_extra, 0) zjada
            FROM Kocury
            ORDER BY zjada DESC;
        
    wiersz przydzialy%ROWTYPE;
BEGIN
    OPEN przydzialy;
    DBMS_OUTPUT.PUT_LINE('Nr   Pseudonim   Zjada');
    DBMS_OUTPUT.PUT_LINE('----------------------');
    FOR i IN 1..5
    LOOP
        FETCH przydzialy INTO wiersz;
        EXIT WHEN przydzialy%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(i) ||'    '|| RPAD(wiersz.pseudo, 8) || '    ' || LPAD(TO_CHAR(wiersz.zjada), 5));
    END LOOP;
END;
/

/* Zad. 38. Napisa? blok, kt�ry zrealizuje wersj? a. lub wersj? b. zad. 19 w spos�b uniwersalny (bez konieczno?ci uwzgl?dniania wiedzy o g??boko?ci drzewa). 
Dan? wej?ciow? ma by? maksymalna liczba wy?wietlanych prze?o?onych. */

DECLARE
    max_poziom NUMBER := &poziom;
    poziom NUMBER;
    kot Kocury%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT(RPAD('Imie', 10));
    FOR i in 1..max_poziom
    LOOP
        DBMS_OUTPUT.PUT('|  '||RPAD('Szef '||i, 9));
    END LOOP;
        DBMS_OUTPUT.NEW_LINE();
        DBMS_OUTPUT.PUT('----------');
    FOR i in 1..max_poziom
    LOOP
        DBMS_OUTPUT.PUT('|-----------');
    END LOOP;
        DBMS_OUTPUT.NEW_LINE();
    FOR kot_bazowy IN (SELECT * FROM Kocury WHERE funkcja IN ('KOT', 'MILUSIA'))
    LOOP
        poziom := 0;
        kot := kot_bazowy;
        DBMS_OUTPUT.PUT(RPAD(kot.imie, 10));
        WHILE (poziom < max_poziom)
        LOOP
            IF kot.szef IS NULL
                THEN DBMS_OUTPUT.PUT('|           ');
            ELSE
                SELECT * INTO kot FROM Kocury WHERE pseudo = kot.szef;
                DBMS_OUTPUT.PUT('| '||RPAD(kot.imie, 10));
            END IF;
            poziom := poziom + 1;
        END LOOP;
        DBMS_OUTPUT.NEW_LINE();
    END LOOP;
END;
/

/* Zad. 39. Napisa? blok PL/SQL wczytuj?cy trzy parametry reprezentuj?ce nr bandy, nazw? bandy oraz teren polowa?.
Skrypt ma uniemo?liwia? wprowadzenie istniej?cych ju? warto?ci parametr�w poprzez obs?ug? odpowiednich wyj?tk�w. 
Sytuacj? wyj?tkow? jest tak?e wprowadzenie numeru bandy <=0. W przypadku zaistnienia sytuacji wyj?tkowej nale?y wyprowadzi? na ekran odpowiedni komunikat.
W przypadku prawid?owych parametr�w nale?y utworzy? now? band? w relacji Bandy. Zmian? nale?y na ko?cu wycofa?. */
DECLARE
    num_ban NUMBER:= &nr_bandy;
    naz_ban BANDY.NAZWA%TYPE := '&nazwa_bandy';
    ter_ban BANDY.TEREN%TYPE := '&teren_bandy';
    liczba_znalezionych NUMBER;
    istnieje EXCEPTION;
    ujemny EXCEPTION;
    wiadomosc_exc    VARCHAR2(30)         := '';
BEGIN
    IF num_ban < 0 THEN 
        RAISE ujemny;
    END IF;
    
    SELECT COUNT(*) INTO liczba_znalezionych
        FROM Bandy
        WHERE nr_bandy = num_ban;
    IF liczba_znalezionych <> 0 
        THEN wiadomosc_exc := 'Numer bandy ' || num_ban || ',';
    END IF;
    
    
    SELECT COUNT(*) INTO liczba_znalezionych
    FROM Bandy
    WHERE nazwa = naz_ban;
    IF liczba_znalezionych <> 0 
        THEN wiadomosc_exc := wiadomosc_exc || ' ' || naz_ban || ',';
    END IF;
    
    SELECT COUNT(*) INTO liczba_znalezionych
    FROM Bandy
    WHERE teren = ter_ban;
    IF liczba_znalezionych <> 0 
        THEN wiadomosc_exc := wiadomosc_exc || ' ' || ter_ban || ',';
    END IF;
    
    IF LENGTH(wiadomosc_exc) > 0 THEN
        RAISE istnieje;
    END IF;
    
    INSERT INTO BANDY(NR_BANDY, NAZWA, TEREN) VALUES (num_ban, naz_ban, ter_ban);
    
EXCEPTION
    WHEN ujemny THEN
        DBMS_OUTPUT.PUT_LINE('Numer bany musi byc liczba dodatnia calkowita');
    WHEN istnieje THEN
        DBMS_OUTPUT.PUT_LINE(TRIM(TRAILING ',' FROM wiadomosc_exc) || ' juz istnieje');
END;
/

ROLLBACK;

/* Zad. 40. Przerobi? blok z zadania 39 na procedur? umieszczon? w bazie danych. */
CREATE OR REPLACE PROCEDURE Add_Banda (numer_bandy Bandy.nr_bandy%TYPE, nazwa_bandy Bandy.nazwa%TYPE, teren_bandy Bandy.teren%TYPE)
AS
    num_ban Bandy.nr_bandy%TYPE:= numer_bandy;
    naz_ban Bandy.NAZWA%TYPE := UPPER(nazwa_bandy);
    ter_ban Bandy.TEREN%TYPE := UPPER(teren_bandy);
    liczba_znalezionych NUMBER;
    istnieje EXCEPTION;
    ujemny EXCEPTION;
    wiadomosc_exc    VARCHAR2(40)         := '';
BEGIN
    IF num_ban < 0 THEN 
        RAISE ujemny;
    END IF;
    
    SELECT COUNT(*) INTO liczba_znalezionych
        FROM Bandy
        WHERE nr_bandy = num_ban;
    IF liczba_znalezionych <> 0 
        THEN wiadomosc_exc := 'Numer bandy ' || num_ban || ',';
    END IF;
    
    
    SELECT COUNT(*) INTO liczba_znalezionych
    FROM Bandy
    WHERE nazwa = naz_ban;
    IF liczba_znalezionych <> 0 
        THEN wiadomosc_exc := wiadomosc_exc || ' ' || naz_ban || ',';
    END IF;
    
    SELECT COUNT(*) INTO liczba_znalezionych
    FROM Bandy
    WHERE teren = ter_ban;
    IF liczba_znalezionych <> 0 
        THEN wiadomosc_exc := wiadomosc_exc || ' ' || ter_ban || ',';
    END IF;
    
    IF LENGTH(wiadomosc_exc) > 0 THEN
        RAISE istnieje;
    END IF;
    
    INSERT INTO BANDY(NR_BANDY, NAZWA, TEREN) VALUES (num_ban, naz_ban, ter_ban);
    
EXCEPTION
    WHEN ujemny THEN
        DBMS_OUTPUT.PUT_LINE('Numer bany musi byc liczba dodatnia calkowita');
    WHEN istnieje THEN
        DBMS_OUTPUT.PUT_LINE(TRIM(TRAILING ',' FROM wiadomosc_exc) || ' juz istnieje');
END Add_Banda;
/

BEGIN
    Add_Banda(11, 'fd', 'ae');
END;
/
ROLLBACK;

/* Zad. 41. Zdefiniowa? wyzwalacz, kt�ry zapewni, ?e numer nowej bandy b?dzie zawsze wi?kszy o 1 od najwy?szego numeru istniej?cej ju? bandy.
Sprawdzi? dzia?anie wyzwalacza wykorzystuj?c procedur? z zadania 40. */

CREATE OR REPLACE TRIGGER nowy_numer_bandy
BEFORE INSERT ON Bandy
FOR EACH ROW
BEGIN
    SELECT MAX(nr_bandy)+1 INTO :NEW.nr_bandy FROM Bandy;
END;
/

DROP TRIGGER nowy_numer_bandy;
/

/* Zad. 42. Milusie postanowi?y zadba? o swoje interesy. Wynaj??y wi?c informatyka, aby zapu?ci? wirusa w system Tygrysa. 
Teraz przy ka?dej pr�bie zmiany przydzia?u myszy na plus (o minusie w og�le nie mo?e by? mowy - pr�ba takiej zmiany ma by? blokowana,
w ramach zaproponowanego mechanizmu, wyj?tkiem) o warto?? mniejsz? ni? 10% przydzia?u myszy Tygrysa ?al Milu? ma by? utulony podwy?k? ich przydzia?u o t? 10%�ow? warto??
oraz podwy?k? myszy extra o 5. Tygrys ma by? ukarany strat? wspomnianych 10%. Je?li jednak podwy?ka b?dzie satysfakcjonowa?a Milusie (podwy?ka o 10% i wi?cej), 
przydzia? myszy extra Tygrysa ma wzrosn?? o 5. 

Zaproponowa? dwa rozwi?zania zadania, kt�re omin? podstawowe ograniczenie dla wyzwalacza wierszowego aktywowanego poleceniem DML tzn. brak mo?liwo?ci odczytu lub zmiany relacji,
na kt�rej operacja (polecenie DML) �wyzwala� ten wyzwalacz. W pierwszym rozwi?zaniu (klasycznym) wykorzysta? kilku wyzwalaczy i pami?? w postaci specyfikacji dedykowanego zadaniu pakietu,
w drugim wykorzysta? wyzwalacz COMPOUND. 
Poda? przyk?ad funkcjonowania wyzwalaczy a nast?pnie zlikwidowa? wprowadzone przez nie zmiany.*/

CREATE OR REPLACE PACKAGE wirus AS
    ilosc_premii NUMBER := 0;
    ilosc_kar NUMBER := 0;
    procent_tygrysa NUMBER := 0;
END;
/

CREATE OR REPLACE TRIGGER odczyt_procentu_tygrysa
BEFORE UPDATE OF przydzial_myszy ON Kocury
BEGIN
    SELECT ROUND(przydzial_myszy*0.1) INTO wirus.procent_tygrysa FROM Kocury WHERE pseudo = 'TYGRYS';
END;
/

CREATE OR REPLACE TRIGGER trigger_wirusa
BEFORE UPDATE OF przydzial_myszy ON Kocury
FOR EACH ROW
DECLARE
    obnizenie_milusi EXCEPTION;
BEGIN
    IF :NEW.funkcja = 'MILUSIA' THEN
    
        IF :new.przydzial_myszy < :old.przydzial_myszy THEN
            :new.przydzial_myszy := :old.przydzial_myszy;
            RAISE obnizenie_milusi;
            
        ELSIF :new.przydzial_myszy < :old.przydzial_myszy + wirus.procent_tygrysa THEN
            :new.przydzial_myszy := :old.przydzial_myszy + wirus.procent_tygrysa;
            :new.myszy_extra := :old.myszy_extra + 5;
            wirus.ilosc_kar := wirus.ilosc_kar + 1;
            DBMS_OUTPUT.PUT_LINE('Zmieniono przydzial ' || :old.pseudo || ' z ' || :old.przydzial_myszy || ' na ' || :new.przydzial_myszy);
            
        ELSE
            wirus.ilosc_premii := wirus.ilosc_premii + 1;
            DBMS_OUTPUT.PUT_LINE('Madry  wladca uhonorowal ' || :old.pseudo || ' w postaci premii z ' || :old.przydzial_myszy || ' na ' || :new.przydzial_myszy || ' myszy');
        END IF;
        
    END IF;
EXCEPTION
    WHEN obnizenie_milusi THEN DBMS_OUTPUT.PUT_LINE('DZIWNY BLAD NIEWIADOMO CZYM SPOWODOWANY - prosze sprobowac wprowadzic inna premie!');
END;
/

CREATE OR REPLACE TRIGGER trigger_kar_i_nagrod
AFTER UPDATE OF przydzial_myszy ON Kocury
DECLARE
    premie NUMBER := 0;
    kary NUMBER := 0;
BEGIN
    IF wirus.ilosc_premii > 0 THEN
        premie := wirus.ilosc_premii;
        wirus.ilosc_premii := 0;
        DBMS_OUTPUT.PUT_LINE('Uczciwy wladca zasluzyl na podwyzke ' || 5*premie || ' myszy extra');
        UPDATE Kocury SET myszy_extra = (myszy_extra + 5*premie) WHERE pseudo = 'TYGRYS';
    END IF;
    IF wirus.ilosc_kar > 0 THEN
        kary := wirus.ilosc_kar;
        wirus.ilosc_kar := 0;
        DBMS_OUTPUT.PUT_LINE('Nieuczciwy wladca zostanie ukrany o ' || (wirus.procent_tygrysa*kary) || '% ');
        UPDATE Kocury SET przydzial_myszy = (przydzial_myszy - wirus.procent_tygrysa*kary) WHERE pseudo = 'TYGRYS';
    END IF;
END;
/

UPDATE Kocury SET przydzial_myszy = przydzial_myszy + 100 WHERE funkcja = 'MILUSIA';
UPDATE Kocury SET przydzial_myszy = przydzial_myszy - 1 WHERE funkcja = 'MILUSIA';
UPDATE Kocury SET przydzial_myszy = przydzial_myszy + 1 WHERE funkcja = 'MILUSIA';

ROLLBACK;

DROP PACKAGE wirus;
DROP TRIGGER odczyt_procentu_tygrysa;
DROP TRIGGER trigger_wirusa;
DROP TRIGGER trigger_kar_i_nagrod;


--42.2
CREATE OR REPLACE TRIGGER wirus 
FOR UPDATE OF przydzial_myszy ON Kocury
  COMPOUND TRIGGER
        procent_tygrysa NUMBER := 0;
        obnizenie_milusi EXCEPTION;
        ilosc_premii NUMBER := 0;
        ilosc_kar NUMBER := 0;
        
    BEFORE STATEMENT IS BEGIN
        SELECT ROUND(przydzial_myszy*0.1) INTO procent_tygrysa FROM Kocury WHERE pseudo = 'TYGRYS';
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS BEGIN
        IF :new.funkcja = 'MILUSIA' THEN
        
            IF :new.przydzial_myszy < :old.przydzial_myszy THEN
                :new.przydzial_myszy := :old.przydzial_myszy;
                RAISE obnizenie_milusi;
                
            ELSIF :new.przydzial_myszy < :old.przydzial_myszy + procent_tygrysa THEN
                :new.przydzial_myszy := :old.przydzial_myszy + procent_tygrysa;
                :new.myszy_extra := :old.myszy_extra + 5;
                ilosc_kar := ilosc_kar + 1;
                DBMS_OUTPUT.PUT_LINE('Zmieniono przydzial ' || :old.pseudo || ' z ' || :old.przydzial_myszy || ' na ' || :new.przydzial_myszy);
                
            ELSE
                ilosc_premii := ilosc_premii + 1;
            DBMS_OUTPUT.PUT_LINE('Madry  wladca uhonorowal ' || :old.pseudo || ' w postaci premii z ' || :old.przydzial_myszy || ' na ' || :new.przydzial_myszy || ' myszy');
            END IF;
            
        END IF;
        EXCEPTION
            WHEN obnizenie_milusi THEN DBMS_OUTPUT.PUT_LINE('DZIWNY BLAD NIEWIADOMO CZYM SPOWODOWANY - prosze sprobowac wprowadzic inna premie!');
    END BEFORE EACH ROW ;

    AFTER STATEMENT IS BEGIN
        IF ilosc_premii > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Uczciwy wladca zasluzyl na podwyzke ' || 5*ilosc_premii || ' myszy extra');
            UPDATE Kocury SET myszy_extra = (myszy_extra + 5*ilosc_premii) WHERE pseudo = 'TYGRYS';
            ilosc_premii := 0;
        END IF;
        IF ilosc_kar > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Nieuczciwy wladca zostanie ukrany o ' || (procent_tygrysa*ilosc_kar) || '% ');
            UPDATE Kocury SET przydzial_myszy = (przydzial_myszy - procent_tygrysa*ilosc_kar) WHERE pseudo = 'TYGRYS';
            ilosc_kar := 0;
        END IF;
    END AFTER STATEMENT ;
END;
/

UPDATE Kocury SET przydzial_myszy = przydzial_myszy + 100 WHERE funkcja = 'MILUSIA';
UPDATE Kocury SET przydzial_myszy = przydzial_myszy - 1 WHERE funkcja = 'MILUSIA';
UPDATE Kocury SET przydzial_myszy = przydzial_myszy + 1 WHERE funkcja = 'MILUSIA';

SELECT * FROM Kocury WHERE FUNKCJA IN ('MILUSIA', 'SZEFUNIO') ORDER BY funkcja, pseudo;

ROLLBACK;

DROP TRIGGER wirus;


/* ALTERNATYWNE 43 */
DECLARE
    CURSOR ILE_JEST (NAZWA_BANDY BANDY.NAZWA%TYPE, PODANA_PLEC KOCURY.PLEC%TYPE, PODANA_FUNKCJA FUNKCJE.FUNKCJA%TYPE) IS
        SELECT COUNT(*) 
            FROM KOCURY K JOIN BANDY B ON K.NR_BANDY = B.NR_BANDY 
            WHERE NAZWA = NAZWA_BANDY 
            AND PLEC=PODANA_PLEC 
            AND FUNKCJA = PODANA_FUNKCJA 
            GROUP BY NAZWA, PLEC, FUNKCJA;
        
    CURSOR FUNKCJA_W_BANDZIE (NAZWA_BANDY BANDY.NAZWA%TYPE, PODANA_PLEC KOCURY.PLEC%TYPE, PODANA_FUNKCJA FUNKCJE.FUNKCJA%TYPE) IS
        SELECT SUM(PRZYDZIAL_MYSZY) + SUM(NVL(MYSZY_EXTRA, 0)) SUMA 
            FROM KOCURY K JOIN BANDY B ON K.NR_BANDY = B.NR_BANDY 
            WHERE NAZWA = NAZWA_BANDY 
            AND PLEC=PODANA_PLEC 
            AND FUNKCJA = PODANA_FUNKCJA 
            GROUP BY NAZWA, PLEC, FUNKCJA;
    
    CURSOR SUMA_DLA_FUNKCJI IS
        SELECT F.FUNKCJA, SUM(NVL(PRZYDZIAL_MYSZY,0)) + SUM(NVL(MYSZY_EXTRA,0)) SUMA_DLA_FUNKCJI 
            FROM FUNKCJE F LEFT JOIN KOCURY K ON F.FUNKCJA = K.FUNKCJA 
            GROUP BY F.FUNKCJA 
            ORDER BY F.FUNKCJA;
    
    CURSOR KOTY_DANEJ_PLCI_W_BANDZIE IS
        SELECT NAZWA, PLEC, COUNT(*) ILE, SUM(PRZYDZIAL_MYSZY) + SUM(NVL(MYSZY_EXTRA, 0)) SUMA_BANDY 
            FROM KOCURY K JOIN BANDY B ON K.NR_BANDY = B.NR_BANDY
            GROUP BY NAZWA, PLEC
            ORDER BY NAZWA, PLEC;
        
    SUMA_BANDY NUMBER;
    SUMA_FUNKCJI NUMBER;
    SUMA NUMBER;
    ILE NUMBER:=0;
BEGIN
    DBMS_OUTPUT.PUT(RPAD('NAZWA',16) || RPAD('PLEC',8) || RPAD('ILE', 8));
    FOR FUNKCJA IN (SELECT DISTINCT FUNKCJA FROM FUNKCJE ORDER BY FUNKCJA)
    LOOP
        DBMS_OUTPUT.PUT(RPAD(FUNKCJA.FUNKCJA,16));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RPAD('SUMA',12));
    
    DBMS_OUTPUT.PUT(RPAD('----------------',16) || RPAD('--------',8) || RPAD('--------', 8));
    FOR FUNKCJA IN (SELECT DISTINCT FUNKCJA FROM FUNKCJE ORDER BY FUNKCJA)
    LOOP
        DBMS_OUTPUT.PUT(RPAD('----------------',16));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RPAD('------------',12));
    
    
    FOR BANDA_PODSUMOWANIE IN KOTY_DANEJ_PLCI_W_BANDZIE
    LOOP
        DBMS_OUTPUT.PUT(RPAD(BANDA_PODSUMOWANIE.NAZWA,16) || CASE WHEN BANDA_PODSUMOWANIE.PLEC = 'M' THEN RPAD('KOCUR',8) ELSE RPAD('KOTKA',8) END || RPAD(BANDA_PODSUMOWANIE.ILE, 8) );
        
        FOR FUNKCJA_L IN (SELECT DISTINCT FUNKCJA FROM FUNKCJE ORDER BY FUNKCJA)
        LOOP
            OPEN ILE_JEST ( BANDA_PODSUMOWANIE.NAZWA, BANDA_PODSUMOWANIE.PLEC, FUNKCJA_L.FUNKCJA);
            IF ILE_JEST%NOTFOUND THEN
                DBMS_OUTPUT.PUT(RPAD('', 16)); 
            ELSE
                OPEN FUNKCJA_W_BANDZIE (BANDA_PODSUMOWANIE.NAZWA, BANDA_PODSUMOWANIE.PLEC, FUNKCJA_L.FUNKCJA);
                FETCH FUNKCJA_W_BANDZIE INTO ILE;
                CLOSE FUNKCJA_W_BANDZIE;
                DBMS_OUTPUT.PUT(RPAD(ILE, 16)); 
                ILE := 0;
            END IF;
            CLOSE ILE_JEST;
            
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE(RPAD(BANDA_PODSUMOWANIE.SUMA_BANDY, 8));
    END LOOP;
    
    DBMS_OUTPUT.PUT(RPAD('----------------',16) || RPAD('--------',8) || RPAD('--------', 8));
    FOR FUNKCJA IN (SELECT DISTINCT FUNKCJA FROM FUNKCJE ORDER BY FUNKCJA)
    LOOP
        DBMS_OUTPUT.PUT(RPAD('----------------',16));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RPAD('------------',12));
    
    DBMS_OUTPUT.PUT(RPAD('ZJADA RAZEM',16) || RPAD('        ',8) || RPAD('        ', 8));
    FOR SUMA IN SUMA_DLA_FUNKCJI
    LOOP
        DBMS_OUTPUT.PUT(RPAD(SUMA.SUMA_DLA_FUNKCJI,16));
    END LOOP;
    SELECT SUM(PRZYDZIAL_MYSZY) + SUM(NVL(MYSZY_EXTRA, 0)) INTO SUMA FROM KOCURY;
    DBMS_OUTPUT.PUT_LINE(RPAD(SUMA,12));
    
END;
/


/* Zad. 44. Tygrysa zaniepokoi?o niewyt?umaczalne obni?enie zapas�w "myszowych". Postanowi? wi?c wprowadzi? podatek pog?�wny, kt�ry zasili?by spi?arni?.
Zarz?dzi? wi?c, ?e ka?dy kot ma obowi?zek oddawa? 5% (zaokr?glonych w g�r?) swoich ca?kowitych "myszowych" przychod�w. Dodatkowo od tego co pozostanie:
-  koty nie posiadaj?ce podw?adnych oddaj? po dwie myszy za nieudolno?? w   
   umizgach o awans,
-  koty nie posiadaj?ce wrog�w oddaj? po jednej myszy za zbytni?  ugodowo??,
    -  koty p?ac? dodatkowy podatek, kt�rego form? okre?la wykonawca zadania.
Napisa? funkcj?, kt�rej parametrem jest pseudonim kota, wyznaczaj?c? nale?ny podatek pog?�wny kota. 
Funkcj? t? razem z procedur? z zad. 40 nale?y umie?ci? w pakiecie, a nast?pnie wykorzysta? j? do okre?lenia podatku dla wszystkich kot�w.*/

CREATE OR REPLACE PACKAGE pakiet_podatkowy AS
    FUNCTION podatek (pseudonim Kocury.pseudo%TYPE) RETURN NUMBER;
    PROCEDURE Add_Banda (numer_bandy Bandy.nr_bandy%TYPE, nazwa_bandy Bandy.nazwa%TYPE, teren_bandy Bandy.teren%TYPE);
END pakiet_podatkowy;
/

CREATE OR REPLACE PACKAGE BODY pakiet_podatkowy AS
    FUNCTION podatek (pseudonim Kocury.pseudo%TYPE) RETURN NUMBER IS
        podatek NUMBER := 0;
        counter NUMBER := 0;
        dodatek NUMBER := 0;
    BEGIN
        SELECT CEIL((NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0))*0.05) INTO podatek
            FROM Kocury 
            WHERE pseudo = pseudonim;
        
        SELECT COUNT(*) INTO counter 
            FROM Bandy 
            WHERE szef_bandy = pseudonim;
        IF counter = 0 THEN 
            podatek := podatek + 2;
        END IF;
        
        SELECT COUNT(*) INTO counter 
            FROM Wrogowie_kocurow 
            WHERE pseudo = pseudonim;
        IF counter = 0 THEN
            podatek := podatek + 1;
        END IF;
            
        SELECT przydzial_myszy + NVL(myszy_extra, 0) INTO dodatek 
            FROM Kocury
            WHERE pseudo = pseudonim;
            
        podatek := podatek + CEIL(dodatek/10);
        
        RETURN podatek;
    END podatek;
    
    PROCEDURE Add_Banda (numer_bandy Bandy.nr_bandy%TYPE, nazwa_bandy Bandy.nazwa%TYPE, teren_bandy Bandy.teren%TYPE)
    AS
        num_ban Bandy.nr_bandy%TYPE:= numer_bandy;
        naz_ban Bandy.NAZWA%TYPE := UPPER(nazwa_bandy);
        ter_ban Bandy.TEREN%TYPE := UPPER(teren_bandy);
        liczba_znalezionych NUMBER;
        istnieje EXCEPTION;
        ujemny EXCEPTION;
        wiadomosc_exc    VARCHAR2(40)         := '';
    BEGIN
        IF num_ban < 0 THEN 
            RAISE ujemny;
        END IF;
        
        SELECT COUNT(*) INTO liczba_znalezionych
            FROM Bandy
            WHERE nr_bandy = num_ban;
        IF liczba_znalezionych <> 0 
            THEN wiadomosc_exc := 'Numer bandy ' || num_ban || ',';
        END IF;
        
        
        SELECT COUNT(*) INTO liczba_znalezionych
        FROM Bandy
        WHERE nazwa = naz_ban;
        IF liczba_znalezionych <> 0 
            THEN wiadomosc_exc := wiadomosc_exc || ' ' || naz_ban || ',';
        END IF;
        
        SELECT COUNT(*) INTO liczba_znalezionych
        FROM Bandy
        WHERE teren = ter_ban;
        IF liczba_znalezionych <> 0 
            THEN wiadomosc_exc := wiadomosc_exc || ' ' || ter_ban || ',';
        END IF;
        
        IF LENGTH(wiadomosc_exc) > 0 THEN
            RAISE istnieje;
        END IF;
        
        INSERT INTO BANDY(NR_BANDY, NAZWA, TEREN) VALUES (num_ban, naz_ban, ter_ban);
        
    EXCEPTION
        WHEN ujemny THEN
            DBMS_OUTPUT.PUT_LINE('Numer bany musi byc liczba dodatnia calkowita');
        WHEN istnieje THEN
            DBMS_OUTPUT.PUT_LINE(TRIM(TRAILING ',' FROM wiadomosc_exc) || ' juz istnieje');
    END Add_Banda;
END;
/

BEGIN
    FOR kot IN (SELECT * FROM Kocury) LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(kot.pseudo, 10) || ' - ' || RPAD(NVL(pakiet_podatkowy.podatek(kot.PSEUDO), 0), 20));
    END LOOP;
END;
/

DROP PACKAGE pakiet_podatkowy;



/* Zad. 45. Tygrys zauwa?y? dziwne zmiany warto?ci swojego prywatnego przydzia?u myszy (patrz zadanie 42). Nie niepokoi?y go zmiany na plus ale te na minus by?y,
jego zdaniem, niedopuszczalne. Zmotywowa? wi?c jednego ze swoich szpieg�w do dzia?ania i dzi?ki temu odkry? niecne praktyki Milu? (zadanie 42).
Poleci? wi?c swojemu informatykowi skonstruowanie mechanizmu zapisuj?cego w relacji Dodatki_extra (patrz Wyk?ady - cz. 2) dla ka?dej z Milu? -10
(minus dziesi??) myszy dodatku extra przy zmianie na plus kt�regokolwiek z przydzia?�w myszy Milu?, wykonanej przez innego operatora ni? on sam (Tygrys). 
Zaproponowa? taki mechanizm, w zast?pstwie za informatyka Tygrysa.
W rozwi?zaniu wykorzysta? funkcj? LOGIN_USER zwracaj?c? nazw? u?ytkownika aktywuj?cego wyzwalacz oraz elementy dynamicznego SQL'a. */

CREATE TABLE DODATKI_EXTRA 
    (id_dodatku     NUMBER(6)       GENERATED BY DEFAULT ON NULL AS IDENTITY CONSTRAINT dod_pk_id PRIMARY KEY,
    pseudo          VARCHAR2(15)    CONSTRAINT dod_ps_fk REFERENCES Kocury(pseudo),
    dod_extra       NUMBER(3)       NOT NULL
    );
    
    
CREATE OR REPLACE TRIGGER kontra_wirus
    BEFORE UPDATE OF przydzial_myszy ON Kocury
    FOR EACH ROW
DECLARE 
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF :NEW.przydzial_myszy > :old.przydzial_myszy  
    AND :NEW.funkcja = 'MILUSIA'
    AND LOGIN_USER <> 'TYGRYS' THEN
                DBMS_OUTPUT.PUT_LINE('Wykryto nieautoryzowana zmiane dokonana przez: ' || LOGIN_USER);        
                EXECUTE IMMEDIATE 
                'DECLARE
                    CURSOR milusie IS SELECT * 
                        FROM Kocury 
                        WHERE funkcja = ''MILUSIA''; 
                BEGIN
                    FOR milusia IN milusie LOOP
                        INSERT INTO DODATKI_EXTRA(pseudo, dod_extra) VALUES (milusia.pseudo, -10);
                        DBMS_OUTPUT.PUT_LINE(''Odjeto 10 myszek milusi '' || milusia.pseudo); 
                    END LOOP;
                END;';
            COMMIT;
    END IF;
END;
/

UPDATE Kocury SET przydzial_myszy = przydzial_myszy + 1 WHERE funkcja = 'MILUSIA';

SELECT * FROM Kocury WHERE funkcja = 'MILUSIA';

ROLLBACK;

DROP TRIGGER kontra_wirus;
DROP TABLE DODATKI_EXTRA;


/* Zad. 46. Napisa? wyzwalacz, kt�ry uniemo?liwi wpisanie kotu przydzia?u myszy spoza przedzia?u (min_myszy, max_myszy) okre?lonego dla ka?dej funkcji w relacji Funkcje.
Ka?da pr�ba wykroczenia poza obowi?zuj?cy przedzia? ma by? dodatkowo monitorowana w osobnej relacji (kto, kiedy, jakiemu kotu, jak? operacj?). */


CREATE TABLE OSZUSTWA
    (ID_WYKROCZENIA     NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY CONSTRAINT wy_pk PRIMARY KEY,
    KTO                 VARCHAR2(20)    NOT NULL,
    KIEDY               DATE            NOT NULL,
    KOTU                VARCHAR2(15)    CONSTRAINT wy_jk_fk REFERENCES Kocury(pseudo),
    OPERACJA            VARCHAR2(20)    NOT NULL);

CREATE OR REPLACE TRIGGER limit_przydzialu
    BEFORE UPDATE OF przydzial_myszy  OR INSERT ON Kocury
    FOR EACH ROW
DECLARE
    maxMyszy NUMBER;
    minMyszy NUMBER;
    przestepca VARCHAR2(20);
    operacja VARCHAR(20) := 'UPDATE';
    niedozwolony_przydzial EXCEPTION;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT max_myszy, min_myszy INTO maxMyszy, minMyszy FROM Funkcje WHERE funkcja = :new.funkcja;
    
    IF INSERTING THEN 
        operacja := 'INSERT';
    END IF;
    
    IF :new.przydzial_myszy > maxMyszy OR :new.przydzial_myszy < minMyszy THEN
        przestepca := LOGIN_USER;
        INSERT INTO OSZUSTWA(KTO, KIEDY, KOTU, OPERACJA) VALUES (przestepca, SYSDATE, :new.pseudo, operacja);
        COMMIT;
        RAISE niedozwolony_przydzial;
    END IF;
END;
/
UPDATE Kocury SET przydzial_myszy = 0 WHERE pseudo = 'LOLA';
SELECT * FROM Kocury WHERE pseudo = 'LOLA';

ROLLBACK;

DROP TRIGGER limit_przydzialu;
DROP TABLE OSZUSTWA;


 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------- L I S T A   C Z W A R T A ---------------------------------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Zad 47 */

-------------- K O C U R Y ---------------
CREATE OR REPLACE TYPE KocuryO AS OBJECT 
(
     imie               VARCHAR2(15),
     plec               VARCHAR2(1),
     pseudo             VARCHAR2(15),
     funkcja            VARCHAR2(10),
     szef               REF KocuryO,
     w_stadku_od        DATE,
     przydzial_myszy    NUMBER(3),
     myszy_extra        NUMBER(3),
     nr_bandy           NUMBER(2),
     MEMBER FUNCTION caly_przydzial RETURN NUMBER,
     MEMBER FUNCTION dni_w_stadku RETURN NUMBER,
     MEMBER FUNCTION opis_kota RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY KocuryO AS

    MEMBER FUNCTION caly_przydzial RETURN NUMBER IS
    BEGIN
        RETURN przydzial_myszy + NVL(myszy_extra, 0);
    END;
    
    MEMBER FUNCTION dni_w_stadku RETURN NUMBER IS
        dni NUMBER;
    BEGIN
        SELECT (trunc(sysdate) - w_stadku_od) INTO dni FROM dual;
        RETURN dni;
    END;
    
    MEMBER FUNCTION opis_kota RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Imie ' || imie || ' pseudo ' || pseudo || ' plec ' || plec || ' funkcja ' || funkcja || ' banda ' || nr_bandy;
    END;
END;
/

CREATE TABLE KocuryT OF KocuryO (
  imie CONSTRAINT kocuryo_imie_nn NOT NULL,
  plec CONSTRAINT kocuryo_plec_ch CHECK(plec IN ('M', 'D')),
  pseudo CONSTRAINT kocuryo_pseudo_pk PRIMARY KEY,
  funkcja CONSTRAINT ko_f_fk REFERENCES Funkcje(funkcja),
  szef SCOPE IS KocuryT,
  w_stadku_od DEFAULT SYSDATE,
  nr_bandy CONSTRAINT ko_nr_fk REFERENCES Bandy(nr_bandy)
);

DROP TYPE KocuryO;
DROP TABLE KocuryT;

-------------- P L E B S ---------------
CREATE OR REPLACE TYPE PlebsO AS OBJECT
(
    pseudo      VARCHAR2(15),
    kot         REF KocuryO,
    MEMBER FUNCTION opis_plebsa RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY PlebsO
AS
    MEMBER FUNCTION opis_plebsa RETURN VARCHAR2 IS
        opis VARCHAR2(400);
    BEGIN
        SELECT 'Opis plebsa ' || DEREF(kot).imie || ' o pseudonimie ' || DEREF(kot).pseudo INTO opis FROM dual;
        RETURN opis;
    END;
END;
/

CREATE TABLE PlebsT OF PlebsO(
    kot SCOPE IS KocuryT CONSTRAINT plebso_kot_nn NOT NULL,
    CONSTRAINT plebso_fk FOREIGN KEY (pseudo) REFERENCES KocuryT(pseudo),
    CONSTRAINT plebso_pk PRIMARY KEY (pseudo)
    );
/

DROP TYPE PlebsO;
DROP TABLE PlebsT;
-------------- E L I T A ---------------
CREATE OR REPLACE TYPE ElitaO AS OBJECT
(
    pseudo      VARCHAR2(15),
    kot         REF KocuryO,
    slugus      REF PlebsO,
    MEMBER FUNCTION get_sluga RETURN REF PlebsO,
    MEMBER FUNCTION opis_elity RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY ElitaO AS
    MEMBER FUNCTION get_sluga RETURN REF PlebsO IS
        BEGIN
            RETURN slugus;
        END;

    MEMBER FUNCTION opis_elity RETURN VARCHAR2 IS
            opis VARCHAR2(400);
        BEGIN
            SELECT 'Kot ' || pseudo || ' jest elita oraz posiada plebsa ' || DEREF(slugus).pseudo INTO opis FROM dual;
            RETURN opis;
        END;
END;
/

CREATE TABLE ElitaT OF ElitaO(
    pseudo CONSTRAINT elitao_pseudo_pk PRIMARY KEY,
    kot SCOPE IS KocuryT CONSTRAINT elitao_kot_nn NOT NULL,
    slugus SCOPE IS PlebsT
);

DROP TYPE ElitaO;
DROP TABLE ElitaT;

-------------- K O N T O ---------------
CREATE OR REPLACE TYPE KontoO AS OBJECT
(
    nr_myszy            NUMBER(5),
    data_wprowadzenia   DATE,
    data_usuniecia      DATE,
    kot                 REF ElitaO,
    MEMBER FUNCTION opis_konta RETURN VARCHAR2,
    MEMBER PROCEDURE usun_mysz(dat DATE)
);
/

CREATE OR REPLACE TYPE BODY KontoO 
AS
    MEMBER FUNCTION opis_konta RETURN VARCHAR2 IS
        elita ElitaO;
        kocur KocuryO;
        BEGIN
            SELECT DEREF(kot) INTO elita FROM DUAL;
            SELECT DEREF(elita.kot) INTO kocur FROM DUAL;
            RETURN 'Mysz numer ' || nr_myszy || ' wprowadzona w ' || TO_CHAR(data_wprowadzenia) || ' nalezy do  ' || kocur.PSEUDO;
        END;
        
    MEMBER PROCEDURE usun_mysz(dat DATE) IS
        BEGIN
          data_usuniecia := dat;
        END;
END;
/

CREATE TABLE KontoT OF KontoO (
    nr_myszy CONSTRAINT kontao_n_pk PRIMARY KEY,
    kot SCOPE IS ElitaT CONSTRAINT ko_w_nn NOT NULL,
    data_wprowadzenia CONSTRAINT ko_dw_nn NOT NULL,
    CONSTRAINT ko_dw_du_ch CHECK(data_wprowadzenia <= data_usuniecia)
);

DROP TYPE KontoO;
DROP TABLE KontoT;

----- T R I G G E R Y -----

CREATE OR REPLACE TRIGGER elita_trg
    BEFORE INSERT OR UPDATE
    ON ElitaT
    FOR EACH ROW
DECLARE
    countElita INTEGER;
    plebsot EXCEPTION;
    duplikat EXCEPTION;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT COUNT(PSEUDO) INTO countElita FROM PlebsT P WHERE P.kot = :NEW.kot;
    IF countElita > 0 THEN
        RAISE plebsot;
    END IF;

    EXECUTE IMMEDIATE 
    'SELECT COUNT(PSEUDO) FROM ElitaT E WHERE E.kot = :kot'
    INTO countElita
    USING :NEW.kot;
    
    
    IF countElita > 0 THEN
        RAISE duplikat;
    END IF;
    
    EXCEPTION
        WHEN plebsot THEN DBMS_OUTPUT.PUT_LINE('TEN KOT JEST JUZ PLEBSEM');
        WHEN duplikat THEN DBMS_OUTPUT.PUT_LINE('KOT JUZ JEST ELITA');
END;
/


CREATE OR REPLACE TRIGGER plebs_trg
    BEFORE INSERT OR UPDATE
    ON PlebsT
    FOR EACH ROW
DECLARE
    countPlebs NUMBER;
    elitsot EXCEPTION;
    duplikat EXCEPTION;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    
    SELECT COUNT(PSEUDO) INTO countPlebs FROM ElitaT E WHERE E.kot = :NEW.kot;
    IF countPlebs > 0 THEN
        RAISE elitsot;
    END IF;

    EXECUTE IMMEDIATE 
    'SELECT COUNT(PSEUDO) FROM PlebsT P WHERE P.kot = :kot'
    INTO countPlebs
    USING :NEW.kot;
    
    IF countPlebs > 0 THEN
        RAISE duplikat;
    END IF;
    
    EXCEPTION
        WHEN elitsot THEN DBMS_OUTPUT.PUT_LINE('TEN KOT JEST JUZ ELITA');
        WHEN duplikat THEN DBMS_OUTPUT.PUT_LINE('KOT JUZ JEST PLEBSEM');
END;
/

----- U Z U P E L N I A N I E     D A N Y M I ------

INSERT INTO KocuryT VALUES ('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1);
INSERT INTO KocuryT SELECT 'MICKA','D','LOLA','MILUSIA',REF(K),'2009-10-14',25,47,1 FROM KocuryT K WHERE K.pseudo = 'TYGRYS';
INSERT INTO KocuryT SELECT 'CHYTRY','M','BOLEK','DZIELCZY',REF(K),'2002-05-05',50,NULL,1 FROM KocuryT K WHERE K.pseudo = 'TYGRYS';
INSERT INTO KocuryT SELECT 'KOREK','M','ZOMBI','BANDZIOR',REF(K),'2004-03-16',75,13,3 FROM KocuryT K WHERE K.pseudo = 'TYGRYS';
INSERT INTO KocuryT SELECT 'BOLEK','M','LYSY','BANDZIOR',REF(K),'2006-08-15',72,21,2 FROM KocuryT K WHERE K.pseudo = 'TYGRYS';
INSERT INTO KocuryT SELECT 'RUDA','D','MALA','MILUSIA',REF(K),'2006-09-17',22,42,1 FROM KocuryT K WHERE K.pseudo = 'TYGRYS';
INSERT INTO KocuryT SELECT 'PUCEK','M','RAFA','LOWCZY',REF(K),'2006-10-15',65,NULL,4 FROM KocuryT K WHERE K.pseudo = 'TYGRYS';
INSERT INTO KocuryT SELECT 'JACEK','M','PLACEK','LOWCZY',REF(K),'2008-12-01',67,NULL,2 FROM KocuryT K WHERE K.pseudo = 'LYSY';
INSERT INTO KocuryT SELECT 'BARI','M','RURA','LAPACZ',REF(K),'2009-09-01',56,NULL,2 FROM KocuryT K WHERE K.pseudo = 'LYSY';
INSERT INTO KocuryT SELECT 'ZUZIA','D','SZYBKA','LOWCZY',REF(K),'2006-07-21',65,NULL,2 FROM KocuryT K WHERE K.pseudo = 'LYSY';
INSERT INTO KocuryT SELECT 'BELA','D','LASKA','MILUSIA',REF(K),'2008-02-01',24,28,2 FROM KocuryT K WHERE K.pseudo = 'LYSY';
INSERT INTO KocuryT SELECT 'SONIA','D','PUSZYSTA','MILUSIA',REF(K),'2010-11-18',20,35,3 FROM KocuryT K WHERE K.pseudo = 'ZOMBI';
INSERT INTO KocuryT SELECT 'PUNIA','D','KURKA','LOWCZY',REF(K),'2008-01-01',61,NULL,3 FROM KocuryT K WHERE K.pseudo = 'ZOMBI';
INSERT INTO KocuryT SELECT 'LATKA','D','UCHO','KOT',REF(K),'2011-01-01',40,NULL,4 FROM KocuryT K WHERE K.pseudo = 'RAFA';
INSERT INTO KocuryT SELECT 'DUDEK','M','MALY','KOT',REF(K),'2011-05-15',40,NULL,4 FROM KocuryT K WHERE K.pseudo = 'RAFA';
INSERT INTO KocuryT SELECT 'KSAWERY','M','MAN','LAPACZ',REF(K),'2008-07-12',51,NULL,4 FROM KocuryT K WHERE K.pseudo = 'RAFA';
INSERT INTO KocuryT SELECT 'MELA','D','DAMA','LAPACZ',REF(K),'2008-11-01',51,NULL,4 FROM KocuryT K WHERE K.pseudo = 'RAFA';
INSERT INTO KocuryT SELECT 'LUCEK','M','ZERO','KOT',REF(K),'2010-03-01',43,NULL,3 FROM KocuryT K WHERE K.pseudo = 'KURKA';
COMMIT;

INSERT INTO PlebsT
    SELECT PlebsO(K.pseudo, REF(K))
    FROM KocuryT K
    WHERE K.funkcja = 'KOT';
COMMIT;

INSERT INTO ElitaT
  SELECT ElitaO(K.pseudo, REF(K), NULL)
  FROM KocuryT K
  WHERE K.funkcja='SZEFUNCIO' OR K.szef=( SELECT REF(K2) FROM KocuryT K2 WHERE K2.pseudo='TYGRYS');
COMMIT;

--UPDATE ElitaT
--    SET slugus = (SELECT REF(T) FROM plebst T WHERE T.pseudo = 'UCHO')
--    WHERE DEREF(kot).pseudo = 'RAFA';
--COMMIT;

INSERT INTO KontoT
  SELECT KontoO(ROWNUM, ADD_MONTHS(CURRENT_DATE, TRUNC(DBMS_RANDOM.VALUE(0, 12))), NULL, REF(K))
  FROM ElitaT K;


------- P R Z Y K L A D Y  S Q L --------

-- realizacja z?aczen

-- wypisanie wszystkich kont oraz kotow z nimi powiazanymi
SELECT KN.nr_myszy, KN.data_wprowadzenia, KO.imie, KO.plec, KO.pseudo  
    FROM KontoT KN JOIN KocuryT KO ON KN.kot.kot = REF(KO)
    WHERE KN.data_wprowadzenia > TO_DATE('2023-05-10');

-- wypisanie wszystkich elit wraz z ich slugusami
SELECT E.pseudo || ' posiada slugusa o pseudonimie ' || P.pseudo "Lista elit"
    FROM ElitaT E JOIN PlebsT P ON E.slugus = REF(P);


-- podzapytania

-- wypisz elity ktorych plebsem jest kot o pseudonimie ZERO
SELECT E.pseudo 
    FROM ElitaT E
    WHERE DEREF(slugus).pseudo IN ( SELECT K.pseudo 
                                        FROM KocuryT K 
                                        WHERE K.pseudo = 'ZERO');

-- wypisanie kazdego plebsiaka 
SELECT DISTINCT ("sluga").opis_plebsa()
    FROM KocuryT K JOIN (SELECT DEREF(E.get_sluga()) "sluga" FROM ElitaT E) ON ("sluga").kot = REF(K);


-- grupowanie 
SELECT K.funkcja, SUM(K.caly_przydzial())
    FROM KocuryT K
    GROUP BY K.funkcja
    HAVING SUM(K.caly_przydzial()) > 100;


-- metody zdefiniowane w ramach typow

SELECT K.opis_kota() "Opis kota", K.caly_przydzial() "Calowity przydzial myszy", K.dni_w_stadku() "Liczba dni w stadku" FROM KocuryT K ORDER BY 2 DESC;

SELECT P.opis_plebsa() "Opis plebsa" FROM PlebsT P;

SELECT E.opis_elity(), DEREF(E.get_sluga()).pseudo "slugus" FROM ElitaT E;

SELECT K.nr_myszy, K.opis_konta() FROM KontoT K;

-- l2 zad 18
SELECT K1.imie, K1.w_stadku_od "Poluje od"
    FROM KocuryT K1 JOIN KocuryT K2 ON K2.imie = 'JACEK'
    WHERE K1.dni_w_stadku() < K2.dni_w_stadku()
    ORDER BY K1.w_stadku_od DESC;

-- l2 zad 23
SELECT K.imie, 12 * K.caly_przydzial(), 'ponizej 864'
    FROM KocuryT K
    WHERE K.myszy_extra IS NOT NULL
    AND 12 * K.caly_przydzial() < 864

UNION ALL

SELECT k.imie, 12 * k.caly_przydzial(), '864'
    FROM KocuryT k
    WHERE myszy_extra IS NOT NULL
    AND 12 * k.caly_przydzial() = 864

UNION ALL

SELECT k.imie, 12 * k.caly_przydzial(), 'powyzej 864'
    FROM KocuryT k
    WHERE k.myszy_extra IS NOT NULL
    AND 12 * k.caly_przydzial() > 864
ORDER BY 2 DESC;


-- l3 zad 34
SET serveroutput ON;

DECLARE
    liczba NUMBER;
    fun KocuryT.funkcja%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    SELECT COUNT(pseudo), MIN(funkcja) INTO liczba, fun
    FROM KocuryT
    WHERE funkcja = TO_CHAR('&nazwa_funkcji');

    IF liczba > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Znaleziono kota pelniacego funkcje ' || fun);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Nie znaleziono');
    END IF;
END;
/

/* Zad. 37. Napisa? blok, który powoduje wybranie w p?tli kursorowej FOR pi?ciu kotów o najwy?szym ca?kowitym przydziale myszy. Wynik wy?wietli? na ekranie. */
DECLARE 
    CURSOR przydzialy IS
        SELECT K.pseudo, K.caly_przydzial() zjada
            FROM KocuryT K
            ORDER BY 2 DESC;
        
    wiersz przydzialy%ROWTYPE;
BEGIN
    OPEN przydzialy;
    DBMS_OUTPUT.PUT_LINE('Nr   Pseudonim   Zjada');
    DBMS_OUTPUT.PUT_LINE('----------------------');
    FOR i IN 1..5
    LOOP
        FETCH przydzialy INTO wiersz;
        EXIT WHEN przydzialy%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(i) ||'    '|| RPAD(wiersz.pseudo, 8) || '    ' || LPAD(TO_CHAR(wiersz.zjada), 5));
    END LOOP;
END;
/




/* Zad 49 */
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE MYSZY(
        nr_myszy        NUMBER(7)       CONSTRAINT myszy_pk         PRIMARY KEY,
        lowca           VARCHAR2(15)    CONSTRAINT m_lowca_fk       REFERENCES Kocury(pseudo),
        zjadacz         VARCHAR2(15)    CONSTRAINT m_zjadacz_fk     REFERENCES Kocury(pseudo),
        waga_myszy      NUMBER(3)       CONSTRAINT waga_myszy_ogr   CHECK (waga_myszy BETWEEN 10 AND 85),
        data_zlowienia  DATE            CONSTRAINT dat_nn           NOT NULL,
        data_wydania    DATE,
        CONSTRAINT daty_popr CHECK (data_zlowienia <= data_wydania) 
    )';
END;
/

/* nasz counter */
CREATE SEQUENCE myszy_seq;
DROP SEQUENCE myszy_seq;

DECLARE
    data_start                  DATE            := '2004-01-01';
    aktualna_ostatnia_sroda     DATE            := NEXT_DAY(LAST_DAY(data_start) - 7, 'WEDNESDAY');
    data_koncowa                DATE            := '2024-01-22'; 
    myszy_mies                  NUMBER(5);

    TYPE tp IS TABLE OF Kocury.pseudo%TYPE;
    tab_pseudo           tp             := tp();
    TYPE tm IS TABLE OF NUMBER(4);
    tab_myszy            tm             := tm();
    TYPE myszy_rek IS TABLE OF Myszy%ROWTYPE INDEX BY BINARY_INTEGER;
    myszki               myszy_rek;
    
    nr_myszy             BINARY_INTEGER := 0;
    indeks_zjadacza      NUMBER(2);
BEGIN
    LOOP
        EXIT WHEN data_start >= data_koncowa;
        
            -- zabrane z zadania 9 wyszukiwanie ostatniej srody w miesiacu
            IF data_start < NEXT_DAY(LAST_DAY(data_start), 'WEDNESDAY') - 7 THEN
                aktualna_ostatnia_sroda := LEAST(NEXT_DAY(LAST_DAY(data_start), 'WEDNESDAY') - 7, data_koncowa);
            ELSE
                aktualna_ostatnia_sroda :=
                        LEAST(NEXT_DAY(LAST_DAY(ADD_MONTHS(data_start, 1)), 'WEDNESDAY') - 7, data_koncowa);
            END IF;

            --pobbranie sumy przydzialu dla kotow ktore wtedy byly juz w stadku
            SELECT SUM(NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0))
            INTO myszy_mies
            FROM KOCURY
            WHERE W_STADKU_OD < aktualna_ostatnia_sroda;

            -- pobranie pseudonimow oraz przydzialu myszy do odp tabel
            SELECT pseudo, NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            BULK COLLECT INTO tab_pseudo, tab_myszy
            FROM KOCURY
            WHERE W_STADKU_OD < aktualna_ostatnia_sroda;

            indeks_zjadacza := 1;

            myszy_mies := CEIL(myszy_mies / tab_pseudo.COUNT);

            FOR i IN 1..(myszy_mies * tab_pseudo.COUNT)
                LOOP
                    nr_myszy := nr_myszy + 1;
                    myszki(nr_myszy).NR_MYSZY := nr_myszy;
                    myszki(nr_myszy).LOWCA := tab_pseudo(MOD(i, tab_pseudo.COUNT) + 1);


                    IF aktualna_ostatnia_sroda != data_koncowa THEN
                        myszki(nr_myszy).DATA_WYDANIA := aktualna_ostatnia_sroda;

                        --przydzial myszy zgdonie z do??czeniem oraz z przydzialem mysz
                        IF tab_myszy(indeks_zjadacza) = 0 THEN
                            indeks_zjadacza := indeks_zjadacza + 1;
                        ELSE
                            tab_myszy(indeks_zjadacza) := tab_myszy(indeks_zjadacza) - 1;
                        end if;

                        --nadwyzki losowo
                        IF indeks_zjadacza > tab_myszy.COUNT THEN
                            indeks_zjadacza := DBMS_RANDOM.VALUE(1, tab_myszy.COUNT);
                        end if;
                        
                        myszki(nr_myszy).zjadacz := tab_pseudo(indeks_zjadacza);
                    end if;
                    
                    myszki(nr_myszy).waga_myszy := DBMS_RANDOM.VALUE(15, 35);
                    myszki(nr_myszy).data_zlowienia := data_start + MOD(nr_myszy, TRUNC(aktualna_ostatnia_sroda) - TRUNC(data_start));
                    
                end loop;
                
                data_start := aktualna_ostatnia_sroda + 1;
                aktualna_ostatnia_sroda := NEXT_DAY(LAST_DAY(ADD_MONTHS(data_start, 1)) - 7, 'WEDNESDAY');
            IF aktualna_ostatnia_sroda > data_koncowa THEN
                aktualna_ostatnia_sroda := data_koncowa;
            end if;
    END LOOP;

    FORALL i in 1..myszki.COUNT
        INSERT INTO Myszy(nr_myszy, lowca, zjadacz, waga_myszy, data_zlowienia, data_wydania)
        VALUES (myszy_seq.NEXTVAL, myszki(i).LOWCA, myszki(i).ZJADACZ, myszki(i).WAGA_MYSZY, myszki(i).DATA_ZLOWIENIA,
                myszki(i).DATA_WYDANIA);
END;
/

SELECT * FROM MYSZY;
TRUNCATE TABLE MYSZY;

SELECT *
    FROM MYSZY 
    WHERE DATA_ZLOWIENIA < TO_DATE('2004-02-01')
    ORDER BY nr_myszy;


BEGIN
   FOR kot in (SELECT pseudo FROM Kocury)
    LOOP
       EXECUTE IMMEDIATE 'CREATE TABLE Myszy_kota_' || kot.pseudo || '(' ||
           'nr_myszy        NUMBER(7)   CONSTRAINT myszy_kota_pk_'      || kot.pseudo || ' PRIMARY KEY,' ||
           'waga_myszy      NUMBER(3)   CONSTRAINT waga_myszy_'         || kot.pseudo || ' CHECK (waga_myszy BETWEEN 10 AND 85),' ||
           'data_zlowienia  DATE        CONSTRAINT data_zlowienia_nn_'  || kot.pseudo || ' NOT NULL)' ;
       END LOOP;
END;
/


--BEGIN
--    FOR kot IN (SELECT pseudo FROM Kocury)
--    LOOP
--        EXECUTE IMMEDIATE 'DROP TABLE Myszy_kota_' || kot.pseudo;
--        END LOOP;
--END;
--/

CREATE OR REPLACE PROCEDURE przyjmij_na_stan(kotPseudo Kocury.pseudo%TYPE, data_zlowienia DATE)
AS
    TYPE tw IS TABLE OF NUMBER(3);
        tab_wagi tw := tw();
    TYPE tn IS TABLE OF NUMBER(7);
        tab_nr tn := tn();
        
    ile_kotow NUMBER(2);
    
    nie_ma_kota EXCEPTION;
    zla_data EXCEPTION;
    brak_myszy_o_dacie EXCEPTION;
BEGIN
    IF data_zlowienia > SYSDATE  OR data_zlowienia = NEXT_DAY(LAST_DAY(data_zlowienia)-7, 'WEDNESDAY')
        THEN RAISE zla_data;
    END IF;

    SELECT COUNT(K.pseudo) INTO ile_kotow FROM KOCURY K  WHERE K.pseudo = UPPER(kotPseudo);
    IF ile_kotow = 0 THEN RAISE nie_ma_kota; END IF;

    EXECUTE IMMEDIATE 
        'SELECT nr_myszy, waga_myszy 
            FROM Myszy_kota_'|| kotPseudo || 
            ' WHERE data_zlowienia= ''' || data_zlowienia || ''''
        BULK COLLECT INTO tab_nr, tab_wagi;
        
    IF tab_nr.COUNT = 0 THEN
        RAISE brak_myszy_o_dacie;
    end if;

    FORALL i in 1..tab_nr.COUNT
        INSERT INTO Myszy VALUES (tab_nr(i), UPPER(kotPseudo), NULL, tab_wagi(i),DATA_ZLOWIENIA, NULL);

    EXECUTE IMMEDIATE 'DELETE FROM Myszy_kota_' || kotPseudo || ' WHERE data_zlowienia= ''' || data_zlowienia || '''';
    
    EXCEPTION
        WHEN nie_ma_kota THEN DBMS_OUTPUT.PUT_LINE('BRAK KOTA O PSEUDONIMIE Myszy_kota_'|| UPPER(kotPseudo));
        WHEN zla_data THEN DBMS_OUTPUT.PUT_LINE('ZLA DATA');
        WHEN brak_myszy_o_dacie THEN DBMS_OUTPUT.PUT_LINE('BRAK MYSZY W ZLOWIONEJ DACIE');
END;
/
--czy istnieja myszy ktore maj? ju? wyp?ate aktualnej srdu

CREATE OR REPLACE PROCEDURE Wyplata
AS
    TYPE tp IS TABLE OF Kocury.pseudo%TYPE;
        tab_pseudo tp := tp();
    TYPE tm is TABLE OF NUMBER(4);
        tab_myszy tm := tm();
    TYPE tn IS TABLE OF NUMBER(7);
        tab_nr tn := tn();
    TYPE tz IS TABLE OF Kocury.pseudo%TYPE INDEX BY BINARY_INTEGER;
        tab_zjadaczy tz;
    TYPE tw IS TABLE OF Myszy%ROWTYPE;
        tab_wierszy tw;
    liczba_najedzonych NUMBER(2) := 0;
    indeks_zjadacza NUMBER(2) := 1;
    ile NUMBER(5);
    powtorna_wyplata EXCEPTION;
BEGIN
    --wedlug hierarchi
    SELECT pseudo, NVL(przydzial_myszy,0) + NVL(myszy_extra, 0)
        BULK COLLECT INTO tab_pseudo, tab_myszy
    FROM Kocury CONNECT BY PRIOR pseudo = szef
    START WITH SZEF IS NULL
    ORDER BY level;

    SELECT COUNT(NR_MYSZY)
        INTO ile
    FROM MYSZY
    WHERE DATA_WYDANIA = NEXT_DAY(LAST_DAY(TRUNC(SYSDATE))-7, 'WEDNESDAY');

    IF ile > 0 THEN
        RAISE powtorna_wyplata;
    end if;

    SELECT *
        BULK COLLECT INTO tab_wierszy
    FROM Myszy
    WHERE DATA_WYDANIA IS NULL;

    FOR i IN 1..tab_wierszy.COUNT
        LOOP
            WHILE tab_myszy(indeks_zjadacza) = 0 AND liczba_najedzonych < tab_pseudo.COUNT
                LOOP
                    liczba_najedzonych := liczba_najedzonych + 1;
                    indeks_zjadacza := MOD(indeks_zjadacza + 1, tab_pseudo.COUNT) + 1;
                END LOOP;
            --jezeli wszyscy juz dostali to daj szefowi nad szefami
            IF liczba_najedzonych = tab_pseudo.COUNT THEN
                tab_zjadaczy(i) := 'TYGRYS';
            ELSE
                indeks_zjadacza := MOD(indeks_zjadacza + 1, tab_pseudo.COUNT) + 1;
                tab_zjadaczy(i) := tab_pseudo(indeks_zjadacza);
                tab_myszy(indeks_zjadacza) := tab_myszy(indeks_zjadacza) - 1;
            end if;

            IF NEXT_DAY(LAST_DAY(tab_wierszy(i).DATA_ZLOWIENIA)-7, 'WEDNESDAY') < tab_wierszy(i).DATA_ZLOWIENIA THEN
                tab_wierszy(i).DATA_WYDANIA := NEXT_DAY(LAST_DAY(ADD_MONTHS(tab_wierszy(i).DATA_ZLOWIENIA,1))-7, 'WEDNESDAY');
            ELSE
                tab_wierszy(i).DATA_WYDANIA := NEXT_DAY(LAST_DAY(tab_wierszy(i).DATA_ZLOWIENIA)-7, 'WEDNESDAY');
            end if;
        END LOOP;
    FORALL i IN 1..tab_wierszy.COUNT
            UPDATE Myszy SET data_wydania=tab_wierszy(i).DATA_WYDANIA , zjadacz=tab_zjadaczy(i)
            WHERE nr_myszy=tab_wierszy(i).NR_MYSZY;
    EXCEPTION
            WHEN powtorna_wyplata THEN DBMS_OUTPUT.PUT_LINE('POWOTRNA WYPLATA!');
END;
/


INSERT INTO Myszy_kota_DAMA VALUES(myszy_seq.nextval, 28, '2023-12-28');

INSERT INTO MYSZY_KOTA_TYGRYS VALUES(myszy_seq.nextval, 31, '2023-12-01');
INSERT INTO MYSZY_KOTA_TYGRYS VALUES(myszy_seq.nextval, 30, '2023-12-01');
INSERT INTO MYSZY_KOTA_TYGRYS VALUES(myszy_seq.nextval, 34, '2023-12-20');
INSERT INTO MYSZY_KOTA_TYGRYS VALUES(myszy_seq.nextval, 26, '2023-12-30');
INSERT INTO MYSZY_KOTA_TYGRYS VALUES(myszy_seq.nextval, 28, '2023-12-30');
BEGIN
    przyjmij_na_stan('Dama', '2023-12-28');
end;
/

BEGIN
    przyjmij_na_stan('TYGRYS', '2023-12-01');
end;
/

BEGIN
    Wyplata();
END;
/

SELECT COUNT(*) FROM MYSZY;
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------- D R O P   T A B L E ---------------------------------------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

--DROP TABLE Bandy CASCADE CONSTRAINTS;
--DROP TABLE Funkcje CASCADE CONSTRAINTS;
--DROP TABLE Wrogowie CASCADE CONSTRAINTS;
--DROP TABLE Kocury CASCADE CONSTRAINTS;
--DROP TABLE Wrogowie_kocurow CASCADE CONSTRAINTS;
--
--DROP TABLE KocuryT CASCADE CONSTRAINTS;
--DROP TABLE PlebsT CASCADE CONSTRAINTS;
--DROP TABLE ElitaT CASCADE CONSTRAINTS;
--DROP TABLE KontoT CASCADE CONSTRAINTS;
--DROP TABLE IncydentyT CASCADE CONSTRAINTS;
--DROP TYPE BODY KocuryO ;
--DROP TYPE KocuryO FORCE;
--DROP TYPE BODY ElitaO;
--DROP TYPE ElitaO FORCE;
--DROP TYPE BODY PlebsO;
--DROP TYPE PlebsO FORCE;
--DROP TYPE BODY KontoO;
--DROP TYPE KontoO FORCE;
--DROP TYPE BODY IncydentO;
--DROP TYPE IncydentO FORCE;






