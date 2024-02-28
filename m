Return-Path: <linux-arm-msm+bounces-12886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B149586B32E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 16:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54DF1C235A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 15:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BCA2CCDF;
	Wed, 28 Feb 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="n58UNRCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F515CD6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709134384; cv=none; b=CGAoUtsfJnfXnwpglNltryA3Yl1YkPXUiitx5bajsqWNJva3wl7A6NfiJEkE0NVTD6oIEX0O/2GMUXwtwlnFXX0A+q6ODw37TYuq3iV9lh0/JzFy4QmfFF+C/5ESX31k1eP1DTM+G2Z6NYymubiDjcCVQzAjIv972BkJ7zpdrAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709134384; c=relaxed/simple;
	bh=GmUBOZ7DaQm65Qmidd1Lr9LGQMy1htqyTWhoVDx5i2Y=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=ik4xvYQpEJoUVkJr4dKwvyeF4NC3mtv0PcMFKWjlEQmblLloUEsG9Rg4EGJjXuAqiC6SrE7KgSk+EntPDwVuzszZVm78163TCEFHFn8JqUFu6OZyEY9Qd/xHUmDTG981NEhKcxehgK9pejtdg8+ure2W0wBJtuTvfrASQyz3UFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=n58UNRCz; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1709134379; x=1709393579;
	bh=GmUBOZ7DaQm65Qmidd1Lr9LGQMy1htqyTWhoVDx5i2Y=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=n58UNRCzUfkldeOw90ASblGmtY7HhZmUPuB8xwdVeHGW0EA8b3Ggxwhf6Fbc727PF
	 fV3G9xe3SXNIHOyVKrRcjVC362yzIdh3XaZmJXxYM9qDpOGYJ1yOME+LzKZ/eEKqYq
	 Zc4FtwuOtgbAQEaVOG6iE0sZTc7b9iTQJOffdcXOunkFXqx97PSqPLVXQRaY7u/+IS
	 JEN1Hd5wDu6nSqbZutrZ2mPkey4dU2QjZiJDI5U9eavZdKTvhl7VkS3fJ1vCAcgJtN
	 iVHi3WWEU/FnLkmlZ5HmLMw59b8s2M9kg9b0BZaF/SePIhPlaNJZ03g5hWhMb9x/yr
	 g7kahYxBGMlgA==
Date: Wed, 28 Feb 2024 15:32:50 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: presearcher <presearcher@protonmail.com>
Subject: Snapdragon 8cx gen 2 support
Message-ID: <ivufeZf8ZYR9gmSkao0jylGzZHAETJ849RzBG2IdqjuRPGgnhIf66Ls2mnBJSb5iwcCWowbcR-rrvSxO0OLExXihcs6RtNHACmFv1pjB9ew=@protonmail.com>
Feedback-ID: 8079224:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------d3c2dfba8901bcbdd7fa24b783e28827bcfb6f47d893c1e5ac4107f9538dd47b"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------d3c2dfba8901bcbdd7fa24b783e28827bcfb6f47d893c1e5ac4107f9538dd47b
Content-Type: multipart/mixed;boundary=---------------------6d09672456761c4d3618ea72a9ab5f39

-----------------------6d09672456761c4d3618ea72a9ab5f39
Content-Type: multipart/alternative;boundary=---------------------38936e47d09d055d3619230eb684602d

-----------------------38936e47d09d055d3619230eb684602d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,I am writing here at the suggestion of a developer https://bugzilla.ker=
nel.org/show_bug.cgi?id=3D218512 and to know if you plan to add support fo=
r the snapdragon 8cx gen 2 sc8180xp.
Currently kernel 6.5 supports the snapdragon 8cx gen 1 sc8180x available i=
n the Lenovo Flex 5G https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLo=
g-6.5. This SoC is only slightly different from the snapdragon 8cx gen 2 s=
c8180xp available for example in the lenovo IdeaPad 5G 14Q8X05. In fact, t=
he 8cx gen 1 and gen 2 have the same CPU-GPU with different frequency, whi=
le the former has BT 5.1 and WiFi 6 instead of BT 5 and WiFi 5.
In addition, the 6.0 kernel supports the snapdragon 8cx 3 sc8280xp availab=
le in the Lenovo Thinkpad X13s=C2=A0https://cdn.kernel.org/pub/linux/kerne=
l/v6.x/ChangeLog-6.0 and the upcoming 6.8 kernel will support the snapdrag=
on 8cx gen 4/elite x1e80100 a SoC that is expected to go mainstream.
Thanks
-----------------------38936e47d09d055d3619230eb684602d
Content-Type: multipart/related;boundary=---------------------eba022890be340fed50e5e5753be6c66

-----------------------eba022890be340fed50e5e5753be6c66
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48L2Rpdj48c3Bhbj5IaSw8L3NwYW4+PGRpdj48c3Bhbj5JIGFtIHdyaXRpbmcgaGVyZSBh
dCB0aGUgc3VnZ2VzdGlvbiBvZiBhIGRldmVsb3BlciA8YSB0YXJnZXQ9Il9ibGFuayIgcmVsPSJu
b3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiBocmVmPSJodHRwczovL2J1Z3ppbGxhLmtlcm5l
bC5vcmcvc2hvd19idWcuY2dpP2lkPTIxODUxMiI+aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMTg1MTI8L2E+IGFuZCB0byBrbm93IGlmIHlvdSBwbGFuIHRvIGFk
ZCBzdXBwb3J0IGZvciB0aGUgc25hcGRyYWdvbiA4Y3ggZ2VuIDIgc2M4MTgweHAuPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+Q3VycmVudGx5IGtlcm5lbCA2LjUgc3VwcG9ydHMgdGhlIHNuYXBkcmFn
b24gOGN4IGdlbiAxIHNjODE4MHggYXZhaWxhYmxlIGluIHRoZSBMZW5vdm8gRmxleCA1RyA8YSB0
YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiBocmVmPSJo
dHRwczovL2Nkbi5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9DaGFuZ2VMb2ctNi41
Ij5odHRwczovL2Nkbi5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9DaGFuZ2VMb2ct
Ni41PC9hPi4gVGhpcyBTb0MgaXMgb25seSBzbGlnaHRseSBkaWZmZXJlbnQgZnJvbSB0aGUgc25h
cGRyYWdvbiA4Y3ggZ2VuIDIgc2M4MTgweHAgYXZhaWxhYmxlIGZvciBleGFtcGxlIGluIHRoZSBs
ZW5vdm8gSWRlYVBhZCA1RyAxNFE4WDA1LiBJbiBmYWN0LCB0aGUgOGN4IGdlbiAxIGFuZCBnZW4g
MiBoYXZlIHRoZSBzYW1lIENQVS1HUFUgd2l0aCBkaWZmZXJlbnQgZnJlcXVlbmN5LCB3aGlsZSB0
aGUgZm9ybWVyIGhhcyBCVCA1LjEgYW5kIFdpRmkgNiBpbnN0ZWFkIG9mIEJUIDUgYW5kIFdpRmkg
NS48L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5JbiBhZGRpdGlvbiwgdGhlIDYuMCBrZXJuZWwgc3Vw
cG9ydHMgdGhlIHNuYXBkcmFnb24gOGN4IDMgc2M4MjgweHAgYXZhaWxhYmxlIGluIHRoZSBMZW5v
dm8gVGhpbmtwYWQgWDEzcyZuYnNwOzxhIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIg
bm9mb2xsb3cgbm9vcGVuZXIiIGhyZWY9Imh0dHBzOi8vY2RuLmtlcm5lbC5vcmcvcHViL2xpbnV4
L2tlcm5lbC92Ni54L0NoYW5nZUxvZy02LjAiPmh0dHBzOi8vY2RuLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2tlcm5lbC92Ni54L0NoYW5nZUxvZy02LjA8L2E+IGFuZCB0aGUgdXBjb21pbmcgNi44IGtl
cm5lbCB3aWxsIHN1cHBvcnQgdGhlIHNuYXBkcmFnb24gOGN4IGdlbiA0L2VsaXRlIHgxZTgwMTAw
IGEgU29DIHRoYXQgaXMgZXhwZWN0ZWQgdG8gZ28gbWFpbnN0cmVhbS48L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5UaGFua3M8L3NwYW4+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1
cmVfYmxvY2siIHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6
ZTogMTRweDsiPgo8L2Rpdj4K
-----------------------eba022890be340fed50e5e5753be6c66--
-----------------------38936e47d09d055d3619230eb684602d--
-----------------------6d09672456761c4d3618ea72a9ab5f39
Content-Type: application/pgp-keys; filename="publickey - presearcher@protonmail.com - 0x63373D48.asc"; name="publickey - presearcher@protonmail.com - 0x63373D48.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - presearcher@protonmail.com - 0x63373D48.asc"; name="publickey - presearcher@protonmail.com - 0x63373D48.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWlgza0V4WUpLd1lCQkFI
YVJ3OEJBUWRBTU5GVjNBcE42bVNvQ09COGRGZm9ENHZFRkp3UUlxMHAKenA0ZG5QcERoazdOTjNC
eVpYTmxZWEpqYUdWeVFIQnliM1J2Ym0xaGFXd3VZMjl0SUR4d2NtVnpaV0Z5ClkyaGxja0J3Y205
MGIyNXRZV2xzTG1OdmJUN0NqQVFRRmdvQVBnV0NaWDNrRXdRTENRY0lDWkRvQ04zOApjVEhUa3dN
VkNBb0VGZ0FDQVFJWkFRS2JBd0llQVJZaEJHTTNQVWlZYW11blIxSWhwT2dJM2Z4eE1kT1QKQUFC
Y253RUFsZFpLRVlhdm5BQ3hOUmdpWjBicnRVSHhPdmVhMWpCV3JPZ2QyZC9TNUlNQS8xbyt6QmU2
CkZwZTJpSzlCQktVaXF2bWk1WW5rYitkM2JvQmhnNXJ4ditzQXpqZ0VaWDNrRXhJS0t3WUJCQUdY
VlFFRgpBUUVIUUNLNDVLMWVhT1Q4ams1R3NmcVZNenRQQkNJdVAwZzQxZS9VVVBlazBrNGhBd0VJ
QjhKNEJCZ1cKQ0FBcUJZSmxmZVFUQ1pEb0NOMzhjVEhUa3dLYkRCWWhCR00zUFVpWWFtdW5SMUlo
cE9nSTNmeHhNZE9UCkFBRER2QUQvVTh1RW80N281bGE4clpXZ2ZXOFpjZ245cDRkQVRQR0dzZ2dr
NGpPNFZSSUJBTFExakxGTApBU2JRQjJFV1FldEplZGRaQ0NEUjMxYSsyemsvTW96Sk9HRUYKPXVH
ME0KLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQo=
-----------------------6d09672456761c4d3618ea72a9ab5f39--

--------d3c2dfba8901bcbdd7fa24b783e28827bcfb6f47d893c1e5ac4107f9538dd47b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmXfUg0JkOgI3fxxMdOTFiEEYzc9SJhqa6dHUiGk6Ajd/HEx
05MAAIwiAQDdn47h2qMyRDWLaMUOzmY/lUvfKUc6BwO2dajYuvVzOAD/cviG
QXBuRUdYsDu1rgy3JFilZHWYRraYXGiOFokMmgU=
=08yH
-----END PGP SIGNATURE-----


--------d3c2dfba8901bcbdd7fa24b783e28827bcfb6f47d893c1e5ac4107f9538dd47b--


