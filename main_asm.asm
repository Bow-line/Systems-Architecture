.686
.model flat
public _roznica
public _kopia_tablicy
public _komunikat
public _szukaj_elem_min
public _kwadrat
public _pole_kola
public _NWD
public _avg_wd
public _obj_stozka_sc
public _float_to_half
public _sortowanie
public _szereg
public _ciag
public _XYZ2R
public _float2miesz
public _miesz2float
public _ASCII_na_UTF16
public _iteracja
public _szeregV2
public _zamiana_na_binary
public _znaki
extern _malloc : PROC
.data
liczby dd 3.069,1.393,0.476
cos dq 0AAAABBBBCCCCDDDDh
.code
_roznica PROC ; --------------------- ZAD 1 ------------------------
	push ebp
	mov ebp,esp
	push esi
	push edi
	mov edi,[ebp+12]
	mov esi,[edi]
	mov edx,[esi]

	mov edi,[ebp+8]
	mov eax,[edi]

	sub eax,edx
	
	pop edi
	pop esi
	pop ebp
	ret
_roznica ENDP
_kopia_tablicy PROC ; --------------------- ZAD 2 ------------------------
	push ebp
	mov ebp,esp
	push ebx
	push edi
	
	mov ecx,[ebp+12]
	
	push ecx
	call _malloc
	pop ecx
	cmp eax,0
	je koniec 
	push eax

	mov edx,[ebp+8]
	mov edi,ecx

	ptl:
		mov ebx,[edx]
		bt ebx,0
		jc nieparzysta 
		mov [eax],ebx
		add eax,4
		dec edi

		nieparzysta:
			add edx,4
	loop ptl

	petla:
		mov [eax],dword ptr 0
		add eax,4
		dec edi
	cmp edi,0
	jne petla

	pop eax
	
koniec:
	pop edi
	pop ebx
	pop ebp
	ret
_kopia_tablicy ENDP
_komunikat PROC  ; --------------------- ZAD 3 ------------------------
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi

	mov esi,[ebp+8]
	mov ecx,0
	push esi

	liczenie:
		mov al,[esi]
		inc ecx
		inc esi
		cmp al,0
	jne liczenie

	add ecx,5
	push ecx
	call _malloc
	pop ecx
	pop esi
	cmp eax,0
	je koniec
	push eax


	wpisz:
		mov dl,[esi]
		cmp dl,0
	jne nie_blad
		mov [eax],dl
		inc eax
		mov [eax],byte ptr "B"
		inc eax
		mov [eax],byte ptr "³"
		inc eax
		mov [eax],byte ptr "¹"
		inc eax
		mov [eax],byte ptr "d"
		inc eax
		mov [eax],byte ptr "."
	jmp koniec
		nie_blad:
			mov [eax],dl
			inc esi
			inc eax
	jmp wpisz


	comment |
	sub ecx,6

	wpisz2:
		mov dl,[esi]
		mov [eax],dl
		inc esi
		inc eax
		loop wpisz2

		
		
		mov [eax],byte ptr "B"
		inc eax
		mov [eax],byte ptr "³"
		inc eax
		mov [eax],byte ptr "¹"
		inc eax
		mov [eax],byte ptr "d"
		inc eax
		mov [eax],byte ptr "."
		inc eax
		mov [eax],byte ptr 0
	|

	koniec:
		pop eax
		pop edi
		pop esi
		pop ebx
		pop ebp
		ret	
_komunikat ENDP
_szukaj_elem_min PROC ; --------------------- ZAD 4 ------------------------
	push ebp
	mov ebp,esp
	push esi
	push ebx
	mov esi,[ebp+8]
	mov ecx,[ebp+12]
	
	mov edx,[esi]
	mov eax,esi
	add esi,4
	dec ecx

	petla:
		cmp edx,dword ptr [esi]
		jl edx_mniejsze
			mov edx,[esi]
			mov eax,esi
		edx_mniejsze:
			add esi,4
			dec ecx
			cmp ecx,0
			jnz petla

	pop ebx
	pop esi
	pop ebp
	ret
_szukaj_elem_min ENDP
_kwadrat PROC ; --------------------- ZAD 6 ------------------------
	push ebp
	mov ebp,esp
	push ebx

	mov eax,[ebp+8]
	cmp eax,1
	jb zero
	je jeden
	ja wieksza

jeden:
	jmp koniec

zero:
	jmp koniec

wieksza:
	sub eax,2
	push eax
	call _kwadrat
	pop edx
	add edx,2
	lea edx,[4*edx]
	add eax,edx
	sub eax,4
	jmp koniec

koniec:
	pop ebx
	pop ebp
	ret
_kwadrat ENDP
_pole_kola PROC ; --------------------- ZAD 15 ------------------------
	push ebp
	mov ebp,esp
	mov eax,[ebp+8]

	finit
	fld dword ptr [eax]
	fld dword ptr [eax]
	fmulp st(1),st(0)
	fldpi
	fmulp st(1),st(0)
	fstp dword ptr [eax]

	pop ebp
	ret
_pole_kola ENDP
_avg_wd PROC ; --------------------- ZAD 17 ------------------------
push ebp
	mov ebp,esp

	mov ecx,[ebp+8]
	mov eax,[ebp+12]
	mov edx,[ebp+16]
	push edx
	push ecx
	
	finit

	fld dword ptr [eax]
	fld dword ptr [edx]
	fmulp st(1),st(0)
	add eax,4
	add edx,4
	dec ecx

petla:
	fld dword ptr [eax]
	fld dword ptr [edx]
	fmulp st(1),st(0)
	faddp st(1),st(0)
	add edx,4
	add eax,4
loop petla
	
	pop ecx
	pop edx

	fld dword ptr [edx]
	add edx,4
	dec ecx

ptl:
	fld dword ptr [edx]
	faddp st(1),st(0)
	add edx,4
loop ptl
	
	fdivp st(1),st(0)

	pop ebp
	ret
_avg_wd ENDP 
_NWD PROC ; --------------------- ZAD 18 ------------------------
	push ebp
	mov ebp,esp
	mov eax,[ebp+8] ; a
	mov edx,[ebp+12] ; b

	cmp eax,edx
	je rowne
	ja a_wieksze
	sub edx,eax
	push edx
	push eax
	call _NWD
	add esp,8
	jmp koniec

rowne:
	jmp koniec

a_wieksze:
	sub eax,edx
	push edx
	push eax
	call _NWD
	add esp,8

koniec:
	pop ebp
	ret
_NWD ENDP
_obj_stozka_sc PROC
	push ebp
	mov ebp,esp

	finit
	fldpi
	mov ecx,3
	push ecx
	fild dword ptr [esp]
	add esp,4
	fdivp st(1),st(0)
	fld dword ptr [ebp+16]
	fmulp st(1),st(0)
	fld dword ptr [ebp+12]
	fmul st(0),st(0)
	fld dword ptr [ebp+12]
	fld dword ptr [ebp+8]
	fmulp st(1),st(0)
	fld dword ptr [ebp+8]
	fmul st(0),st(0)
	faddp st(1),st(0)
	faddp st(1),st(0)
	fmulp st(1),st(0)
	pop ebp
	ret
_obj_stozka_sc ENDP
_float_to_half PROC
	push ebp
	mov ebp,esp
	push ebx

	mov edx,[ebp+8]
	mov ebx,edx
	mov eax,0
	bt edx,31
	jnc dodatnia
	bts ax,15
dodatnia:
	shl edx,1
	shr edx, 24
	sub edx,127
	add dx,15
	shl dx,10
	add ax,dx
	shl ebx,9
	shr ebx,9
	shr ebx,13
	add ax,bx
	
	pop ebx
	pop ebp
	ret
_float_to_half ENDP
_sort PROC
	push ebp 
	mov ebp,esp
	push ebx
	push edi
	push esi

	mov ecx,[ebp+12]
	mov ebx,[ebp+8]

	ptl:
		push ecx
		mov ebx,[ebp+8]
		dec ecx
		cmp ecx,0
		je omin
		ptl2:
			mov edx,[ebx+4]
			mov edi,[ebx+12]
			cmp edx,edi
			ja wiekszy
			jb mniejszy
			je rowny

		wiekszy:
			mov [ebx+12],edx
			mov [ebx+4],edi
			mov edx,[ebx+8]
			mov edi,[ebx]
			mov [ebx+8],edi
			mov [ebx],edx
			jmp koniec

		mniejszy:
			jmp koniec

		rowny:
			mov eax,[ebx]
			mov esi,[ebx+8]
			cmp eax,esi
			ja wiekszy
			jb mniejszy
			je koniec

		koniec:
			add ebx,8
		loop ptl2
	omin:
		pop ecx
		loop ptl

	mov ebx,[ebp+8]

	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_sort ENDP
_sortowanie PROC
	push ebp
	mov ebp,esp
	push ebx
	push edi
	push esi

	mov ebx,[ebp+8]
	mov ecx,[ebp+12]
	;dec ecx
	ptl:
		push ecx
		mov ecx,[ebp+12]
		mov ebx,[ebp+8]
		dec ecx
		petla:
			mov edx,[ebx+4]
			mov edi,[ebx+12]
			cmp edx,edi
			jb mniejsze
			je rowne
			add ebx,8
		loop petla
		jmp koniec_tab

		mniejsze:
			mov [ebx+4],edi
			mov [ebx+12],edx
			mov eax,[ebx]
			mov esi,[ebx+8]
			mov [ebx],esi
			mov [ebx+8],eax
			add ebx,8
		loop petla
		jmp koniec_tab

		rowne:
			mov eax,[ebx]
			mov esi,[ebx+8]
			cmp eax,esi
			jb mniejsze
			add ebx,8
		loop petla
		jmp koniec_tab

	koniec_tab:
		pop ecx
	loop ptl

	mov ebx,[ebp+8]
	mov edx,[ebx+4]
	mov eax,[ebx]

	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_sortowanie ENDP
_szereg PROC
	push ebp
	mov ebp,esp
	mov ecx,[ebp+8]

	finit
	mov edx,2
	fldz
	petla:
		fld1
		push edx
		fild dword ptr [esp]
		add esp,4
		fdivp st(1),st(0)
		faddp st(1),st(0)
		inc edx
		cmp edx,ecx
	jna petla

	pop ebp
	ret
_szereg ENDP
_ciag PROC
	push ebp
	mov ebp,esp
	push ebx
	push edi
	push esi

	mov edx,[ebp+8]
	mov eax,[edx]
	cmp eax,2
	jb jeden
	ja wiekszy

	finit 
	mov edx,0
	mov eax,6
	push edx
	push eax
	fild qword ptr [esp]
	pop eax
	pop edx
	jmp koniec

jeden:
	finit
	mov edx,0
	mov eax,5
	push edx
	push eax
	fild qword ptr [esp]
	pop eax
	pop edx
	jmp koniec

wiekszy:
	dec eax
	push eax
	mov eax,esp
	push eax
	call _ciag
	pop eax
	pop eax
	sub esp,8
	fistp qword ptr [esp]
	pop ecx
	pop edx
	inc eax
	finit
	mov esi,0
	mov edi,3
	push esi
	push edi
	fild qword ptr [esp]
	add esp,8
	push edx
	push ecx
	fild qword ptr [esp]
	add esp,8
	fsubp st(1),st(0)
	mov edx,0
	push edx
	push eax
	fild qword ptr [esp]
	add esp,8
	fdivp st(1),st(0)
	jmp koniec

koniec:
	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_ciag ENDP
_XYZ2R PROC
	push ebp
	mov ebp,esp
	push esi
	push edi
	mov ecx,[ebp+12]
	shl ecx,2
	push ecx
	call _malloc
	pop ecx
	shr ecx,2
	cmp eax,0
	je blad 
	mov edi,[ebp+8]
	push eax
	mov esi,offset liczby
	ptl:
		mov edx,[esi]
		push edx
		fld dword ptr [esp]
		add esp,4
		fld dword ptr [edi]
		add edi,4
		fmulp st(1),st(0)
		mov edx,[esi+4]
		push edx
		fld dword ptr [esp]
		add esp,4
		fld dword ptr [edi]
		add edi,4
		fmulp st(1),st(0)
		fsubp st(1),st(0)
		mov edx,[esi+8]
		push edx
		fld dword ptr [esp]
		add esp,4
		fld dword ptr [edi]
		add edi,4
		fmulp st(1),st(0)
		fsubp st(1),st(0)
		sub esp,4
		fstp dword ptr [esp]
		pop edx
		mov [eax],edx
		add eax,4
	loop ptl
	pop eax
blad:
	pop edi
	pop esi
	pop ebp
	ret	
_XYZ2R ENDP
_float2miesz PROC
	push ebp
	mov ebp,esp
	push ebx
	push edi
	push esi


	mov edx,[ebp+8]
	mov eax,edx
	shl eax,1
	shr eax,24
	sub eax,127
	cmp eax,0
	;jl ujemne

	add eax,8
	mov ebx,0
	bts ebx,eax

	shl edx,9
	shr edx,9
	mov edi,23
	sub edi,eax
	cmp edi,0
	jl mniejsze
	;shr edx,edi
	;jmp dalej
mniejsze:
	neg edi
;	shl edx,edi
	comment |
	push ebp
	mov ebp,esp
	push ebx
	push edi
	push esi
	mov edx,[ebp+8]
	mov eax,[edx]
	mov ebx,eax

	shl eax,1
	shr eax,24
	sub eax,127

	shl ebx,9
	shr ebx,9
	bts ebx,23

	mov ecx,23
	sub ecx,eax
	mov edx,ebx
	shr ebx,cl
	mov edi,0
	mov edi,ebx

	shl ebx,cl
	sub edx,ebx
	mov esi,ecx
	mov ecx,32
	sub ecx,esi
	shl edx,cl
	mov esi,edx
	mov edx,edi
	mov eax,esi
	pop esi
	pop edi
	pop ebx
	pop ebp
	ret	
	|
_float2miesz ENDP
_miesz2float PROC
	push ebp
	mov ebp,esp
	push ebx

	mov eax,[ebp+8]
	mov ecx,31

	ptl:
		bt eax,ecx
		jc bit
		dec ecx
		cmp ecx,-1
	jne ptl

bit:
	btr eax,ecx
	mov ebx,8
	sub ebx,ecx
	neg ebx
	add ebx,127
	shl ebx,23
	mov edx,23
	sub edx,ecx
	cmp edx,0
	ja dodatnie
	je dalej
	neg edx
	mov ecx,edx
	shr eax,cl
	jmp dalej

dodatnie:
	mov ecx,edx
	shl eax,cl

dalej:
	add ebx,eax
	mov eax,ebx

	finit
	push eax
	fld dword ptr [esp]
	add esp,4

	pop ebx
	pop ebp
	ret
_miesz2float ENDP
_ASCII_na_UTF16 PROC
	push ebp
	mov ebp,esp
	push ebx

	mov ecx,[ebp+12]
	inc ecx
	shl ecx,1

	push ecx
	call _malloc
	pop ecx
	cmp eax,0
	je blad

	mov ecx,[ebp+12]
	mov edx,[ebp+8]
	push eax
	mov ebx,0

	ptl:
		mov [eax],byte ptr 0
		inc eax
		mov bl,[edx]
		inc edx
		mov [eax],bl
		inc eax
	loop ptl

	mov [eax],word ptr 0
	add eax,2
	pop eax

blad:
	pop ebx
	pop ebp
	ret
_ASCII_na_UTF16 ENDP
_iteracja PROC
	push ebp
	mov ebp,esp
	mov al,[ebp+8]
	sal al,1
	jc zakoncz
	inc al
	push eax
	call _iteracja
	add esp,4
	pop ebp
	ret

zakoncz:
	rcr al,1
	pop ebp
	ret
_iteracja ENDP
_szeregV2 PROC
	push ebp
	mov ebp,esp
	mov eax,[ebp+8]
	cmp eax,1
	je jeden
	ja rekurencja
	jb koniec

jeden:
	finit
	fld1
	mov ecx,2
	push ecx
	fild dword ptr [esp]
	add esp,4
	fdivp st(1),st(0)
	jmp koniec

rekurencja:
	dec eax
	push eax
	call _szeregV2
	pop eax
	sub esp,4
	fstp dword ptr [esp]
	pop ecx
	finit 
	fld1
	inc eax
	inc eax
	push eax
	fild dword ptr [esp]
	pop eax
	fdivp st(1),st(0)
	push ecx
	fld dword ptr [esp]
	pop ecx
	faddp st(1),st(0)

koniec:
	pop ebp 
	ret
_szeregV2 ENDP
_zamiana_na_binary PROC
	push ebp 
	mov ebp,esp
	push ebx
	push esi
	push edi
	mov esi,[ebp+8]

	pop ebp
	ret
_zamiana_na_binary ENDP
_znaki PROC
	push ebp
	mov ebp,esp
	push esi
	push edi
	push ebx

	mov ecx,[ebp+16]
	mov esi,[ebp+12]
	mov edi,[ebp+8]

	ptl:
		finit
		fld dword ptr [esi]
		sub esp,8
		fistp qword ptr [esp]
		mov ebx,7

		ptl2:
			mov edx,[edi+4*ebx]
			cmp edx,0
			ja petla
			dec ebx
			cmp ebx,1
			je outing
		jmp ptl2

	outing:
		mov edx,[edi+4]
		mov eax,[esp+4]
		cmp edx,eax
		ja petla
		jb wyzeruj
		mov edx,[edi]
		mov eax,[esp]
		cmp edx,eax
		ja petla

	wyzeruj:
		mov ebx,7

		et:
			mov [edi+4*ebx],dword ptr 0
			dec ebx
			cmp ebx,-1
		jne et

	petla:
		add esp,8
		add edi,32
		add esi,4
	loop ptl

	pop ebx
	pop edi
	pop esi
	pop ebp
	ret
_znaki ENDP
END