#include <stdio.h>

int roznica(int* odjemna, int** odjemnik);
int* kopia_tablicy(int tab[], unsigned int n);
char* komunikat(char* tekst);
int* szukaj_elem_min(int tablica[], int n);
unsigned int kwadrat(unsigned int a);
unsigned int NWD(unsigned int a, unsigned int b);
float avg_wd(int n, void* tablica, void* wagi);
float obj_stozka_sc(float r, float R, float h);
void float_to_half(float a);
unsigned __int64 sortowanie(unsigned __int64* tabl, unsigned int n);
unsigned __int64 sort(unsigned __int64* tabl, unsigned int n);
float szereg(unsigned int n);
float szeregV2(unsigned int n);
double ciag(unsigned int* x);
float* XYZ2R(float* tab, int n);
double float2miesz(float* q);
float miesz2float(unsigned int p);
wchar_t* ASCII_na_UTF16(char* znaki, int n);
unsigned char iteracja(unsigned char a);
unsigned int zamiana_na_binary(wchar_t* znaki);
void zeruj(unsigned __int64 liczby[], float tablica, int n);
int main() {
	/*
	int a, b, * wsk, wynik;
	wsk = &b;
	a = 21; b = 25;
	wynik = roznica(&a, x,&wsk);
	printf("\nWynik = %d\n", wynik);
	*/
	// --------------------- ZAD 2 ------------------------
	/*
	int tab[] = { 1,5,4,8,6,3 };
	unsigned int n = 6;
	int* wynik;
	wynik = kopia_tablicy(tab, n);
	*/

	// --------------------- ZAD 3 ------------------------
	/*
	char* wsk;
	wsk = komunikat("Tekst testowy");
	*/

	// --------------------- ZAD 4 ------------------------
	/*
	int pomiary[7] = {11,2,0,88,15,3,1}, * wsk;
	wsk = szukaj_elem_min(pomiary, 7);
	printf("\nElement minimalny = %d\n", *wsk);
	*/

	// --------------------- ZAD 6 ------------------------
	
	unsigned int wynik;
	wynik = kwadrat(8);
	printf("\nWynik = %u\n", wynik);
	

	// --------------------- ZAD 15 ------------------------
	/*
	float k;
	printf("\nProszê podaæ promieñ: ");
	scanf_s("%f", &k);
	pole_kola(&k);
	printf("\nPole ko³a wynosi %f\n", k);
	*/

	// --------------------- ZAD 17 ------------------------
	/*
	float tab[] = { 5.12,6,7.5,11 };
	float wagi[] = { 4.0,1,2,3 };
	int n = 4;
	float wynik;
	wynik = avg_wd(n, &tab, &wagi);
	printf("%f", wynik);
	*/
	// --------------------- ZAD 18 ------------------------
	/*
	unsigned int wynik;
	wynik = NWD(125, 88);
	printf("%u", wynik);
	*/

	// -----------------------------------------------------
	/*
	float wynik;
	wynik = obj_stozka_sc(4, 5, 8);
	printf("%f", wynik);
	*/

	// -----------------------------------------------------
	/*
	float_to_half(-2.75);
	*/
	
	// -----------------------------------------------------
	/*
	unsigned __int64 tabl []= {1, 4545444544,215454541,54774446464,5444,5744 };
	unsigned int n = 6;
	unsigned __int64* wsk = &tabl;
	unsigned __int64 wynik;
	wynik = sort(tabl, n);
	*/

	// -----------------------------------------------------
	/*
	float wynik;
	wynik = szereg(6);
	*/

	// -----------------------------------------------------
	/*
	double wynik;
	unsigned int dana = 4;
	wynik = ciag(&dana);
	*/

	// -----------------------------------------------------
	/*
	float tab[] = { 5.12, 6, 7.5, 11, 22.55, 1.2, 54.5, 14, 16.8, 15, 12.2, 11.5 };
	int n = 4;
	float *wynik;
	wynik = XYZ2R(&tab, n);
	*/

	// -----------------------------------------------------
	/*
	float q = 58.78125;
	double wynik;
	wynik = float2miesz(&q);
	*/

	// -----------------------------------------------------
	/*
	unsigned int p = 1974721;
	float wynik;
	wynik = miesz2float(p);
	*/

	// -----------------------------------------------------
	/*
	char p[] = { 'l','o','l' };
	int n = 3;
	ASCII_na_UTF16(&p, n);
	*/
	
	// -----------------------------------------------------
	/*
	unsigned char w;
	w = iteracja(32);
	*/

	// -----------------------------------------------------
	/*
	float wynik;
	wynik = szeregV2(5);
	*/

	// -----------------------------------------------------
	
	/*
	wchar_t znaki[] = { '3031','3030','32','0033' };
	zamiana_na_binary(&znaki);
	*/

	// -----------------------------------------------------
	/*
	unsigned __int64 liczby[] = { 41515456786786744,102,36646564466646446,4665444,635444646,64464448,4546546469,45,23,0,0,0 };
	float tablica[] = { 4.5,1.22,45.78,333.4 };
	int n = 3;
	znaki(liczby, tablica, n);
	*/
	return 0;
}