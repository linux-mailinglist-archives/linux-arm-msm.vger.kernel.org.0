Return-Path: <linux-arm-msm+bounces-12897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907A86B5DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 18:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1EF51F2750A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 17:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B83FBB2;
	Wed, 28 Feb 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XzxWW4hd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D7B15A4A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709141022; cv=none; b=EEYK99lyAf46iaZDvibMWLc2VKrpStvASSU0VtQ5iz9YzcQykrv78JSANy3Xsd73tTa1wgm0ltotf7FedXhWWJV/LotJ1ct4L6XgG6fYWXbC5Z3fPD2iryQIsiha30ffQbDgI5WQFXudEiIQu7xhD4rMwdUGUKcJaV2peks4mRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709141022; c=relaxed/simple;
	bh=ydy0a9LLp3WBCc2ZHEg+eZ2nQTJljKX+3YQk7iu1f6E=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=QmmtU2KsaUBX5+UM69o6sj1Ximf9NgJnF0thAKLZkcQRjUxu7oorXqy2ayClg7sCwn31Oz/2zIDvETMcNMpHBsahR9zbqQ2ncvf3pFYeogcTw1p9jwMz4OcYUnpdIkRYS/pWzfmO/QZOTEyw2d+1VLqBeNsxXswxEQ+JLNQXel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XzxWW4hd; arc=none smtp.client-ip=185.70.40.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1709141012; x=1709400212;
	bh=ydy0a9LLp3WBCc2ZHEg+eZ2nQTJljKX+3YQk7iu1f6E=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XzxWW4hdKPpAAjWcl4Zmuaxmvrnb2Qx7Qp0dldmgWZ+CAg/n6g1vWir3FJy2HRsqg
	 EGhM9jSwNOL+A5ksilNl4lPk1OPk1Ql9yx9jViLB9MEbna1CWMjGK1/f3feBXSvhVq
	 r9OwRHZCWZeKkDduAygKin4rdNH5yuh497oSRsecaP9ryfFe15LnjFR0sLnXK1Iwzy
	 qdBvNM5m9FFvhxtB4zj5OZYNqga0m445vFhsK+J+anqbWvER0KfAHdw/VCm1We0VCQ
	 IThmYnrNkOCE/o0jAfqJWYcjsr7iKqeDgnLTBjJBI4crUq2uOxnkhVfFzA4l7m48ce
	 b9r+tv28e7YiA==
Date: Wed, 28 Feb 2024 17:23:26 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: presearcher <presearcher@protonmail.com>
Subject: Snapdragon 8cx gen 2 support
Message-ID: <d3ctvhpb0WNaeDOCRTcYJFY062hU4s6WzxMaUkfVVaaLHFHBlp8Ncwp3rSuAKNu-Bxz1iYle8QpE5elXKReVbZnUoz0g6fxbTeJv5Z0s6-g=@protonmail.com>
Feedback-ID: 8079224:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------338e22a54eab40477e11e9dd69efffab98907c94d5dce64366e9658271e925b8"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------338e22a54eab40477e11e9dd69efffab98907c94d5dce64366e9658271e925b8
Content-Type: multipart/mixed;boundary=---------------------8bcf73e5d2574f95beea5274b065bfa0

-----------------------8bcf73e5d2574f95beea5274b065bfa0
Content-Type: multipart/alternative;boundary=---------------------bc753ea006ec961b0a36a1230e4ef4be

-----------------------bc753ea006ec961b0a36a1230e4ef4be
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,I am writing here at the suggestion of a developer=C2=A0https://bugzill=
a.kernel.org/show_bug.cgi?id=3D218512=C2=A0and to know if you plan to add =
support for the snapdragon 8cx gen 2 sc8180xp.
Currently kernel 6.5 supports the snapdragon 8cx gen 1 sc8180x available i=
n the Lenovo Flex 5G=C2=A0https://cdn.kernel.org/pub/linux/kernel/v6.x/Cha=
ngeLog-6.5. This SoC is only slightly different from the snapdragon 8cx ge=
n 2 sc8180xp available for example in the lenovo IdeaPad 5G 14Q8X05. In fa=
ct, the 8cx gen 1 and gen 2 have the same CPU-GPU with different frequency=
, while the former has BT 5.1 and WiFi 6 instead of BT 5 and WiFi 5.
In addition, the 6.0 kernel supports the snapdragon 8cx 3 sc8280xp availab=
le in the Lenovo Thinkpad X13s=C2=A0https://cdn.kernel.org/pub/linux/kerne=
l/v6.x/ChangeLog-6.0=C2=A0and the upcoming 6.8 kernel will support the sna=
pdragon 8cx gen 4/elite x1e80100 a SoC that is expected to go mainstream.
Thanks
-----------------------bc753ea006ec961b0a36a1230e4ef4be
Content-Type: multipart/related;boundary=---------------------052c4fc09c4ad52a8482e35df8ce96cb

-----------------------052c4fc09c4ad52a8482e35df8ce96cb
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48L2Rpdj48c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41O3Njcm9sbGJhci13aWR0aDp0
aGluO2ZvbnQtZmFtaWx5OnN5c3RlbS11aSwgc2Fucy1zZXJpZiI+SGksPC9zcGFuPjxkaXYgc3R5
bGU9ImxpbmUtaGVpZ2h0OjEuNTtzY3JvbGxiYXItd2lkdGg6dGhpbjtmb250LWZhbWlseTpzeXN0
ZW0tdWksIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJzY3JvbGxiYXItd2lkdGg6dGhpbiI+SSBh
bSB3cml0aW5nIGhlcmUgYXQgdGhlIHN1Z2dlc3Rpb24gb2YgYSBkZXZlbG9wZXI8c3Bhbj4mbmJz
cDs8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNn
aT9pZD0yMTg1MTIiIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29wZW5lciIgdGFyZ2V0PSJf
YmxhbmsiIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO2N1cnNvcjpwb2ludGVyO3Nj
cm9sbGJhci13aWR0aDp0aGluIj5odHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxODUxMjwvYT48c3Bhbj4mbmJzcDs8L3NwYW4+YW5kIHRvIGtub3cgaWYgeW91IHBs
YW4gdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBzbmFwZHJhZ29uIDhjeCBnZW4gMiBzYzgxODB4cC48
L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41O3Njcm9sbGJhci13aWR0aDp0
aGluO2ZvbnQtZmFtaWx5OnN5c3RlbS11aSwgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9InNjcm9s
bGJhci13aWR0aDp0aGluIj5DdXJyZW50bHkga2VybmVsIDYuNSBzdXBwb3J0cyB0aGUgc25hcGRy
YWdvbiA4Y3ggZ2VuIDEgc2M4MTgweCBhdmFpbGFibGUgaW4gdGhlIExlbm92byBGbGV4IDVHPHNw
YW4+Jm5ic3A7PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vY2RuLmtlcm5lbC5vcmcvcHViL2xpbnV4
L2tlcm5lbC92Ni54L0NoYW5nZUxvZy02LjUiIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29w
ZW5lciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO2N1
cnNvcjpwb2ludGVyO3Njcm9sbGJhci13aWR0aDp0aGluIj5odHRwczovL2Nkbi5rZXJuZWwub3Jn
L3B1Yi9saW51eC9rZXJuZWwvdjYueC9DaGFuZ2VMb2ctNi41PC9hPi4gVGhpcyBTb0MgaXMgb25s
eSBzbGlnaHRseSBkaWZmZXJlbnQgZnJvbSB0aGUgc25hcGRyYWdvbiA4Y3ggZ2VuIDIgc2M4MTgw
eHAgYXZhaWxhYmxlIGZvciBleGFtcGxlIGluIHRoZSBsZW5vdm8gSWRlYVBhZCA1RyAxNFE4WDA1
LiBJbiBmYWN0LCB0aGUgOGN4IGdlbiAxIGFuZCBnZW4gMiBoYXZlIHRoZSBzYW1lIENQVS1HUFUg
d2l0aCBkaWZmZXJlbnQgZnJlcXVlbmN5LCB3aGlsZSB0aGUgZm9ybWVyIGhhcyBCVCA1LjEgYW5k
IFdpRmkgNiBpbnN0ZWFkIG9mIEJUIDUgYW5kIFdpRmkgNS48L3NwYW4+PC9kaXY+PGRpdiBzdHls
ZT0ibGluZS1oZWlnaHQ6MS41O3Njcm9sbGJhci13aWR0aDp0aGluO2ZvbnQtZmFtaWx5OnN5c3Rl
bS11aSwgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9InNjcm9sbGJhci13aWR0aDp0aGluIj5JbiBh
ZGRpdGlvbiwgdGhlIDYuMCBrZXJuZWwgc3VwcG9ydHMgdGhlIHNuYXBkcmFnb24gOGN4IDMgc2M4
MjgweHAgYXZhaWxhYmxlIGluIHRoZSBMZW5vdm8gVGhpbmtwYWQgWDEzcyZuYnNwOzxhIGhyZWY9
Imh0dHBzOi8vY2RuLmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92Ni54L0NoYW5nZUxvZy02
LjAiIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29wZW5lciIgdGFyZ2V0PSJfYmxhbmsiIHN0
eWxlPSJ0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO2N1cnNvcjpwb2ludGVyO3Njcm9sbGJhci13
aWR0aDp0aGluIj5odHRwczovL2Nkbi5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9D
aGFuZ2VMb2ctNi4wPC9hPjxzcGFuPiZuYnNwOzwvc3Bhbj5hbmQgdGhlIHVwY29taW5nIDYuOCBr
ZXJuZWwgd2lsbCBzdXBwb3J0IHRoZSBzbmFwZHJhZ29uIDhjeCBnZW4gNC9lbGl0ZSB4MWU4MDEw
MCBhIFNvQyB0aGF0IGlzIGV4cGVjdGVkIHRvIGdvIG1haW5zdHJlYW0uPC9zcGFuPjwvZGl2Pjxk
aXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNTtzY3JvbGxiYXItd2lkdGg6dGhpbjtmb250LWZhbWls
eTpzeXN0ZW0tdWksIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJzY3JvbGxiYXItd2lkdGg6dGhp
biI+VGhhbmtzPC9zcGFuPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Js
b2NrIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1wcm90b24iPgogICAg
PC9kaXY+CjwvZGl2Pgo=
-----------------------052c4fc09c4ad52a8482e35df8ce96cb--
-----------------------bc753ea006ec961b0a36a1230e4ef4be--
-----------------------8bcf73e5d2574f95beea5274b065bfa0--

--------338e22a54eab40477e11e9dd69efffab98907c94d5dce64366e9658271e925b8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmXfa/kJkOgI3fxxMdOTFiEEYzc9SJhqa6dHUiGk6Ajd/HEx
05MAACByAP9HZJqs9G/OOfpemG/bESXx9DfdHugghMYmJ9sl1ll09gD9G6Sm
JPgQtY9o/9teuWD6IpD1KO9QEvYgJ86nkPWoAQU=
=TxU4
-----END PGP SIGNATURE-----


--------338e22a54eab40477e11e9dd69efffab98907c94d5dce64366e9658271e925b8--


