Return-Path: <linux-arm-msm+bounces-62470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 007DAAE8483
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7D26A042F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3260C262FD5;
	Wed, 25 Jun 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="v7Jle7XQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97309263C8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857702; cv=none; b=k2g71I+re1JP36/mmnPfeTzrVmTtfQaUhzXkC0AmSZb4sMXFiXl0c6yENmUy1Ne3cyDTaQO1WVsYeOCcbTpb7s40+617tXFu792+opgFjLBsY1BS61O50Sb6q85hbYXJW4Lau5NqxuSng5T3lIg+CeFpoefkqfgTRL31DqzQzFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857702; c=relaxed/simple;
	bh=XmvkOnLcSLOA5wRY2raNtw7X2c4Qoh+J6tjA3O9LepE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=pCCp58hR+hnM0Vm6ftRBpmCo1Esvebu/oTKWijCoPKTJdJ2+XbkorvqK6lU9j1DcsFphZ2oOIzZrkeBpe7tdbcCEYiQSkYgqaNMj/+nMhXg6PSAKgz35Y9C4sg8ZF/VjmGf21vqhbvaZVjKEsTQoxeIqy3+jpKKRpPYailmyJC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=v7Jle7XQ; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750857688; x=1751116888;
	bh=CzQtmU7JCNnhBbxBH7NymXOfsBTPoMsAPhfxgdIRkks=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=v7Jle7XQf9DYrcj6qcY6epkUBeT7+hgiY5tEib/wgStygEUBdbYViwWAgLrdDZIdH
	 7EFgYNHgqtr68WLMLKcZpUV/1zWkHGQ9TCVhlPlpF4Feuyg8Td6rcOUlxucQxYA1DO
	 AvJxPiVsfLEFd273GnKuasK6Tie6Z25T69/cTA2LLMsH7ywMRCbpe3OSAWixBBgOLL
	 qHEn5rfJfJDZPbfYTRYQXsk5R45ujNJ/vwhawwNCdfoWgNmTu71YJESse9DQWTK6WN
	 aTa1mt6w6buDh9dOEnMQGMKBkxi2W0jT7AR2vJuDT78XXHG962Fs+kJACj5dbnUqrZ
	 A3Jl9Ax8x76fg==
Date: Wed, 25 Jun 2025 13:21:24 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: "alfredo.nodo" <alfredo.nodo@protonmail.com>
Subject: Support Qualcomm Snapdragon 8cx Gen 2 (SC8180XP)
Message-ID: <xAOMDw6RIPBRl1NwaOZsLwoNu1l9Rs88XkbvK0P85jVRSKAakqWbTlrjEWljCJFmEXplwDa9e4MippQ-DPD1XFy_LjPTly9dUxC8NVfT7UA=@protonmail.com>
Feedback-ID: 25470066:user:proton
X-Pm-Message-ID: b148024c2b44af1f4e56a4eee1b58be5b191440e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------54767c682df1162113fd7fd91c521e6fe19d7a42b6afce69fa2a4f84989eaf9b"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------54767c682df1162113fd7fd91c521e6fe19d7a42b6afce69fa2a4f84989eaf9b
Content-Type: multipart/mixed;boundary=---------------------4efc586a905c4dd49a6db4aabbaa7200

-----------------------4efc586a905c4dd49a6db4aabbaa7200
Content-Type: multipart/alternative;boundary=---------------------2d3c9ad12a0de02b161fb5a14cd65b15

-----------------------2d3c9ad12a0de02b161fb5a14cd65b15
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,

at the moment this is the current status of Snapdragon 8cx SoC support:

-   Gen 1 SC8180X (https://linaro.github.io/msm/soc/sc8180x) supported
-   Gen 2 SC8180XP not supported
    =


-   Gen 3 SC8280XP (https://linaro.github.io/msm/soc/sc8280xp) supported
    =


-   Gen 4 or X Elite X1E80100 (https://linaro.github.io/msm/soc/x1e80100) =
supported
    =



Unfortunately, Gen 2, which is only slightly different from Gen 1, is not =
supported (same CPU-GPU, but at a higher frequency, with BT 5.1 and WiFi 6=
 instead of BT 5 and WiFi 5).

I have a Lenovo IdeaPad 5G 14Q8X05 with Gen 2 and I am forced to use windo=
ws 11 with a virtual machine to be able to use GNU/linux. This is my dump =
https://github.com/aarch64-laptops/build/files/14700163/ACPI.zip

Here you can find the ACPI of other user https://bugzilla.kernel.org/attac=
hment.cgi?id=3D306011

Is there any hope to see such a device supported?

Thank you
-----------------------2d3c9ad12a0de02b161fb5a14cd65b15
Content-Type: multipart/related;boundary=---------------------54fe12d6c0b230b5c6b5eb06b344172b

-----------------------54fe12d6c0b230b5c6b5eb06b344172b
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IFRpbWVzIE5ldyBSb21hbiwgc2VyaWY7IGZvbnQtc2l6
ZTogMTRweDsiPjwvZGl2PjxwcmUgc3R5bGU9ImZvbnQtc2l6ZTptZWRpdW07d2lkdGg6NTBlbTtm
b250LWZhbWlseTptb25vc3BhY2U7d2hpdGUtc3BhY2U6cHJlLXdyYXAiPjxwcmUgc3R5bGU9ImZv
bnQtc2l6ZTptZWRpdW07d2lkdGg6NTBlbTt3aGl0ZS1zcGFjZTpwcmUtd3JhcCI+PC9wcmU+PC9w
cmU+PHA+SGksPC9wPjxwPmF0IHRoZSBtb21lbnQgdGhpcyBpcyB0aGUgY3VycmVudCBzdGF0dXMg
b2YgU25hcGRyYWdvbiA4Y3ggU29DIHN1cHBvcnQ6PC9wPjxwPjwvcD48dWwgZGF0YS1lZGl0aW5n
LWluZm89InsmcXVvdDtvcmRlcmVkU3R5bGVUeXBlJnF1b3Q7OjEsJnF1b3Q7dW5vcmRlcmVkU3R5
bGVUeXBlJnF1b3Q7OjF9IiBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAw
cHg7Ij48bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTogZGlzYzsiPkdlbiAxIFNDODE4MFggKGh0
dHBzOi8vbGluYXJvLmdpdGh1Yi5pby9tc20vc29jL3NjODE4MHgpIHN1cHBvcnRlZDwvbGk+PGxp
IHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6IGRpc2M7Ij48cD5HZW4gMiBTQzgxODBYUCBub3Qgc3Vw
cG9ydGVkPC9wPjwvbGk+PGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6IGRpc2M7Ij48cD5HZW4g
MyBTQzgyODBYUCAoaHR0cHM6Ly9saW5hcm8uZ2l0aHViLmlvL21zbS9zb2Mvc2M4MjgweHApIHN1
cHBvcnRlZDwvcD48L2xpPjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOiBkaXNjOyI+PHA+R2Vu
IDQgb3IgWCBFbGl0ZSBYMUU4MDEwMCAoaHR0cHM6Ly9saW5hcm8uZ2l0aHViLmlvL21zbS9zb2Mv
eDFlODAxMDApIHN1cHBvcnRlZDwvcD48L2xpPjwvdWw+PHA+PC9wPjxwPlVuZm9ydHVuYXRlbHks
IEdlbiAyLCB3aGljaCBpcyBvbmx5IHNsaWdodGx5IGRpZmZlcmVudCBmcm9tIEdlbiAxLCBpcyBu
b3Qgc3VwcG9ydGVkIChzYW1lIENQVS1HUFUsIGJ1dCBhdCBhIGhpZ2hlciBmcmVxdWVuY3ksIHdp
dGggQlQgNS4xIGFuZCBXaUZpIDYgaW5zdGVhZCBvZiBCVCA1IGFuZCBXaUZpIDUpLjwvcD48cD5J
IGhhdmUgYSBMZW5vdm8gSWRlYVBhZCA1RyAxNFE4WDA1IHdpdGggR2VuIDIgYW5kIEkgYW0gZm9y
Y2VkIHRvIHVzZSB3aW5kb3dzIDExIHdpdGggYSB2aXJ0dWFsIG1hY2hpbmUgdG8gYmUgYWJsZSB0
byB1c2UgR05VL2xpbnV4LiBUaGlzIGlzIG15IGR1bXAgaHR0cHM6Ly9naXRodWIuY29tL2FhcmNo
NjQtbGFwdG9wcy9idWlsZC9maWxlcy8xNDcwMDE2My9BQ1BJLnppcDwvcD48cD5IZXJlIHlvdSBj
YW4gZmluZCB0aGUgQUNQSSBvZiBvdGhlciB1c2VyIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9y
Zy9hdHRhY2htZW50LmNnaT9pZD0zMDYwMTE8L3A+PHA+SXMgdGhlcmUgYW55IGhvcGUgdG8gc2Vl
IHN1Y2ggYSBkZXZpY2Ugc3VwcG9ydGVkPzwvcD48cD5UaGFuayB5b3U8L3A+PGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2siIHN0eWxlPSJmb250LWZhbWlseTogVGltZXMgTmV3
IFJvbWFuLCBzZXJpZjsgZm9udC1zaXplOiAxNHB4OyI+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9z
aWduYXR1cmVfYmxvY2stcHJvdG9uIj4KICAgIDwvZGl2Pgo8L2Rpdj4K
-----------------------54fe12d6c0b230b5c6b5eb06b344172b--
-----------------------2d3c9ad12a0de02b161fb5a14cd65b15--
-----------------------4efc586a905c4dd49a6db4aabbaa7200--

--------54767c682df1162113fd7fd91c521e6fe19d7a42b6afce69fa2a4f84989eaf9b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmhb97kJkF1i2al9j+o/FiEEOQQUhB+JdKOcPnOCXWLZqX2P
6j8AAL4gAP92EUmyL7hlQNKYRHXJWOc3uECOVQJFklDkoXaQxXzwQAEAtaB+
bLr/fFZZkbOkun1JAc2nob5UqGw9bpNOn9Dewg0=
=MAme
-----END PGP SIGNATURE-----


--------54767c682df1162113fd7fd91c521e6fe19d7a42b6afce69fa2a4f84989eaf9b--


