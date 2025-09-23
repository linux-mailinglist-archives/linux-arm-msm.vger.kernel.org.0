Return-Path: <linux-arm-msm+bounces-74542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E040B9751B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 21:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32915169AED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 19:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2913303A07;
	Tue, 23 Sep 2025 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="l9mwWuzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE65272E5A;
	Tue, 23 Sep 2025 19:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655284; cv=none; b=FMjrN02T7DY9hzULquIXEcp6Ivhi0bxWNoigIXUrWRxLkouaBX+cS/kIlmhP5GI0EV1sIWcZuafyXpJgDfRvNom4oyqIWJFvbCsp4nSS7sI4/98VZrHiC87R4gjgLpeSyn9G4ffuI7JZfFNbiwrWfrHyPld0HIo44AD90hhOgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655284; c=relaxed/simple;
	bh=HDn2G/3gGiCHnuMHHgteEinUK8Sz4555CP9qgYozpS4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUOQaTfDI9rJQoo2Z/LDQGx1J+Mn/L86oEnXx/3WIjZob2oVJQzkANAAKLhpMZr7EsT+LdWB4kqFK1q2ItMx915S+Uga85760oQ+pqV3KjZ+a/Ti3IMG0gBLEWj25ea9uszBUACl1DxlkG+kGIHjU6XIjWCfH/dxiY2GjWzJmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=l9mwWuzr; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758655273; x=1758914473;
	bh=HDn2G/3gGiCHnuMHHgteEinUK8Sz4555CP9qgYozpS4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l9mwWuzrbUfL1NTSJeFvkKFPVE4eSQwgZPjOIO/tOvawTfk8httXLi9PH9cpyHpHB
	 RDS8F5L5jZv8CQHR7LsIh7tqGJPcZlr/IUf1wJmIPnpmiS5TXhJGCLeV0JUdtAugKt
	 C9SDOJAQyJajWq9FCYbnMWgLkSi9UQLW9DgCD51Koo5NW+eXDWZutAgvmlxMZeajxh
	 YORX0J2DsBdZcNFIGETbTFqxr2Ux8atqnBLNQRYkdrOfDkvh/JerUDxeItyOM2q/Nt
	 E1ZARmaDlMzJTTSB8Jsu/7jO09uA53WoPLFgO9UAWhbPjEzJnXRPkyctAN/yJSqqsc
	 9d6WotM/4Ae5w==
Date: Tue, 23 Sep 2025 19:21:10 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
Message-ID: <blMLYZBNCKa8x50Dd-zdFPdx7wZNor45QRJeeqjVautVqCR3aIoVAUrxacXkYNAlrC6p6npHSU_ZMfUDvZzoUzXg_2iiXMJPFmW85P-B3HU=@vinarskis.com>
In-Reply-To: <X5l7eScrcspQe6JfPyx8VCIZXmCmq-VBlAoNmIuAAmwfp1z-yNAG5GyIEnp4ByyPOEfJHEtewC0uOgrc0GiLlaz433Gheubseb-pXH1ZfUw=@vinarskis.com>
References: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com> <20250908-zenbook-improvements-v1-2-43ecbbf39c60@vinarskis.com> <e54daa39-ffb1-4f0e-82c6-42e45efe5044@oss.qualcomm.com> <X5l7eScrcspQe6JfPyx8VCIZXmCmq-VBlAoNmIuAAmwfp1z-yNAG5GyIEnp4ByyPOEfJHEtewC0uOgrc0GiLlaz433Gheubseb-pXH1ZfUw=@vinarskis.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: a3ab3237e5d9dce4fe5fd0114118c126a6ef5003
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Friday, September 12th, 2025 at 18:52, Aleksandrs Vinarskis <alex@vinars=
kis.com> wrote:

>=20
>=20
>=20
>=20
>=20
>=20
>=20
> On Friday, September 12th, 2025 at 12:44, Konrad Dybcio konrad.dybcio@oss=
.qualcomm.com wrote:
>=20
> > On 9/8/25 8:45 PM, Aleksandrs Vinarskis wrote:
> >=20
> > > The laptop comes in two variants:
> > >=20
> > > * UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
> > > * UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels
> > >=20
> > > Even though all three panels work with "edp-panel", unfortunately the
> > > brightness adjustmenet of LCD panel is PWM based, requiring a dedicat=
ed
> > > device-tree. Convert "x1p42100-asus-zenbook-a14.dts" into ".dtsi" to
> > > allow for this split, introduce new LCD variant. Leave current varian=
t
> > > without postfix and with the unchanged model name, as some distros
> > > (eg. Ubuntu) rely on this for automatic device-tree detection during
> > > kernel installation/upgrade.
> > >=20
> > > As dedicated device-tree is required, update compatibles of OLED
> > > variants to correct ones. Keep "edp-panel" as fallback, since it is
> > > enough to make the panels work.
> > >=20
> > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > Co-developed-by: Jens Glathe jens.glathe@oldschoolsolutions.biz
> > > Signed-off-by: Jens Glathe jens.glathe@oldschoolsolutions.biz
> > > ---
> >=20
> > [...]
> >=20
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
> > > @@ -0,0 +1,141 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights re=
served.
> > > + * Copyright (c) 2025 Aleksandrs Vinarskis alex@vinarskis.com
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "x1p42100.dtsi"
> > > +#include "x1-asus-zenbook-a14.dtsi"
> > > +
> > > +/delete-node/ &pmc8380_6;
> > > +/delete-node/ &pmc8380_6_thermal;
> > > +
> > > +/ {
> > > + model =3D "ASUS Zenbook A14 (UX3407QA)";
> >=20
> > 'model' in .dtsi is 'eeeeh'
>=20
>=20
> Followed example of Thinkpad t14s and CRD, as they set it to
> 'default' in .dtsi, and overwrite in .dts. Could fix it starting
> with Zenbook here, but in this case probably makes sense to also
> drop 'model' from higher level 'x1-asus-zenbook-a14.dtsi' as well?

Hi Konrad,

Any comments on this?

Alex

>=20
> > [...]
> >=20
> > > +&remoteproc_adsp {
> > > + firmware-name =3D "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn=
",
> > > + "qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> > > +
> >=20
> > are both of the aforementioned variants' firmwares the same?
>=20
>=20
> Yes, Asus doesn't distinguish BSP packages between options (displays
> in this case) but only X1E (UX3407RA) vs X1(P) (UX3407QA).
>=20
> > Konrad

