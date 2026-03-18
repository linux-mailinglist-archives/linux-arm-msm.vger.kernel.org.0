Return-Path: <linux-arm-msm+bounces-98432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGOOFVKJumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:15:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B72BAA38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08F503002D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7AC396D17;
	Wed, 18 Mar 2026 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="kzSYeymI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64527CCE0;
	Wed, 18 Mar 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832510; cv=none; b=aJjoDVqbEPvCU+WgK8/xl54j425EvJDuZ6kWO/HLkhlmKoNcg8XkYMzwHLkjrVUSAypQ7jykKekED6Fdnv1Wt7a3aPe4YuZbajGGPcIMamAY2+mjlyW64kSm03lYJ1PkU1Rq5Jeu/qem1QkDwGMytrsM4RWQI4KNFmDAQguS3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832510; c=relaxed/simple;
	bh=qMX1sqIgxnqjgrV/+uHdJ563D7QzIPTWzdtlRoIlGeI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VblDYrsD1VcPnqtW7dILQ2S8dhJq50wh6LJZlu49qC8PX0CuCLw8yehS+ADzukFfpUE8UYyMUETyhx9iqExAkDEuozidbuFRRal4pMukNZHKN7XXYpEKN5XaGCrwknkP+PrJm2uZh7wgQtKVxmpr7Uk5CeilUBbvhwryzvxivvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=kzSYeymI; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773832504; x=1774091704;
	bh=mMAxBKv8xyN7ZirHQcaWH4oLyE9/z6QJLwjnz8Forz8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kzSYeymInLCErm1ZnqaLB5C1x1mFvQUSK6d3T4V3tQkmFjYJnrCkipGfhy0yxdtBL
	 B8a1nlvJzN+Injd0n5FOcI9/Cy6AIs+dR3F615az2k1T6XidG0WDbToBbdtJwjmrAC
	 gO5iQ8WtcOAewq+QB9eInJi3kwQhnd5zyzxwyRzoUaGX9J5mhP1zN9yJvcMqfpf4na
	 AD1lHeKXQxELDeEE4HmUUz71Ra+cAwgAUJIBg1mjGLQHB4+C+x9Hxfcsj3zXP8M1tY
	 35O0IkEH68eq3HLbjk18rA0dJEEVk485a9FgR9HoMJ77C2IdbBfpYd3pUP7bcC7slp
	 NlG1nGxfw+5fA==
Date: Wed, 18 Mar 2026 11:14:56 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me>
In-Reply-To: <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me> <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me> <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9cb090c4ef26cbf31aa503e1918544226aa3e4bf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98432-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 380B72BAA38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 18th, 2026 at 6:28 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:

> > +=09/*
> > +=09 * There are also ER & EVB boards, but those have meaningful hardwa=
re
> > +=09 * differences that make them not compatible with this devicetree.
> > +=09 */
> > +=09qcom,board-id =3D <31 0>, /* ER2 */
> > +=09=09=09<40 0>, /* PR */
> > +=09=09=09<41 0>, /* PR2 */
> > +=09=09=09<50 0>; /* MP */
>=20
> I would guesstimate MP is Mass Production and everything before that is
> engineering samples.. perhaps that doesn't hurt - maybe some curious Asus
> engineer swings by one day!

Actually the unit I have is 'PR', it's one I got from ASUS when they were s=
till
sending out phones to developers. I guess the units they shipped out were p=
reprod.

> > +=09=09source-pdos =3D <PDO_FIXED(5000, 900,
> > +=09=09=09=09=09 PDO_FIXED_DUAL_ROLE |
> > +=09=09=09=09=09 PDO_FIXED_USB_COMM |
> > +=09=09=09=09=09 PDO_FIXED_DATA_SWAP)>;
> > +
> > +=09=09sink-pdos =3D <PDO_FIXED(5000, 3000,
> > +=09=09=09=09       PDO_FIXED_DUAL_ROLE |
> > +=09=09=09=09       PDO_FIXED_USB_COMM |
> > +=09=09=09=09       PDO_FIXED_DATA_SWAP)
> > +=09=09=09     PDO_FIXED(9000, 3000, 0)
> > +=09=09=09     PDO_FIXED(12000, 2250, 0)>;
>=20
> Both ports have the same PDOs - will this kaboom if you plug in two charg=
ers?

Good catch, from what I can see there is zero hardware isolation. Downstrea=
m
prevents dual sink by only allowing one port to negotiate sink at a time (s=
eems
to always prefer usb_1 if both are plugged in, guessing because its used fo=
r
the dock), but there is no upstream mechanism to handle this as far as I kn=
ow
(not sure if this could even be done cleanly as it'd require cooperation
between pm8150b_typec and rt1715).

Will just drop the sink PDOs from usb_2 and have it be only source to avoid
this issue.

> > +&usb_2 {
> > +=09pinctrl-0 =3D <&rt1715_mux_en>, <&usb2_mux_en>;
> > +=09pinctrl-names =3D "default";
> > +
> > +=09/*
> > +=09 * Disable USB3 clock requirement as the bottom port only supports =
USB2.
> > +=09 * The USB3 lanes are routed through the pogo connector on this boa=
rd for
> > +=09 * use with accessories, so will need to revisit this when we start=
 to add
> > +=09 * support for those.
> > +=09 */
> > +=09qcom,select-utmi-as-pipe-clk;
>=20
> So, is that right?
>=20
>                                   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                                   =E2=94=82 POGO  =E2=94=82
>                                   =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=98
>                    superspeed        =E2=94=82  =E2=94=82
>        =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98  =
=E2=94=82
>        =E2=94=82                                =E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=90      highspeed               =E2=94=82
> =E2=94=82 DWC3_2 =E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=
=E2=94=80=E2=94=80=E2=94=90
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98                     =E2=94=94=E2=94=80=E2=94=80=
=E2=94=80=E2=94=A4  MUX  =E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80PM8150_GPIO9
>                  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90       =E2=94=94=E2=94=
=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>                  =E2=94=82 GPIO170 =E2=94=82          =E2=94=82
>                  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98          =E2=94=82
>                       =E2=94=82               =E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90 RXTX   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=
=B4=E2=94=80=E2=94=80=E2=94=90        =E2=94=8C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82 UART   =E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=82 MUX  =E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4USB-C2=
=E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98        =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98        =E2=94=94=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>                      =E2=94=82
>                      =E2=96=BC
>                     GND

I misspoke in v3, UART is not controlled via a mux it's just a gate. Was
looking at the board previously and it seemed it either went to test points=
 on
the board, or USB. But the enable GPIO controls both. Have it renamed in v4
staging atm.

But yeah that is accurate otherwise wrt the USB 2 mux.

>=20
> Konrad
>=20
>=20

Thanks,
Alex

