Return-Path: <linux-arm-msm+bounces-98452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kf/FBiTumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:57:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 010332BB29D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 446D7301114B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD473D34A2;
	Wed, 18 Mar 2026 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="X8X7rT7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B643D34A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835029; cv=none; b=RmkqWJTfjImYj7YMB5XfRD+iTMC6Ub5X3a8tVPoVmtVTeK7+xKFmpY7VKrOrFx2LzGWCaFSzMB1R1L4aHnXkwYowihsu7gCLmKPR0zeiIVtTwo88EVAsxi9D8hNYwMdGWPvsL24gzaSpgNi04+pDnRHNRflJFGmOyBkSB1akqVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835029; c=relaxed/simple;
	bh=h5042D6FtwKxOp4pqRRPKGCt7+r9a6hd9NJvM1oUl4k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXugA9Aft3E9mhdZY0ra/QW+efxFfv15KtgSMVmLFRO2HTbxLCrDDgRPtcr96iweZGfHAMniZwqpCv52Jc8dcEZrW+vd5in3irG0xD2AHIPBG/kjO/sH80rTL7RtUYx4ULemqjtx4TVv5rHA+7znUICUEKN0I+2RH2IJbZ57tXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=X8X7rT7V; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773835025; x=1774094225;
	bh=loCSzPOOCFTF/1whMBDynxUknydOWUHYj1aPchF9BNs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X8X7rT7VBXU6ewKU3sBXhygQCMRoP8iKvmMzt/l5wteHUApD1bAorcgDjpqV7+C1y
	 9snQw1tjOftgTAGhmdx/Z0/4ze1WpLwsCKVXF8PQJquENYCHPgAr+EPaPJd8hHomZL
	 +a9H/TYuODXdmUap2Eu4zQzNpldMDdmV9M2v/1tv6hghLhwj9dLIj9lFMbrzYlksvD
	 j+rGESoARzBjdXBPrvnM7atLlBSMtRyVzynXKj5FtSultF0sLVsaPtttGPMGCUfB26
	 5NkSERUGvzfDsyfGCq6/JfOOfNJy3LXxQWKmW7K7eKMC4d/0U8SFJNZB2tLl5IbGj8
	 2ZQLz3JjKTMEw==
Date: Wed, 18 Mar 2026 11:56:59 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <YUh0x0EbjEVDtKJ-osNM_rBJw1qSc6XM4CkS5w-rOewb_ZvsIlZ-sJXELcysAuPwmtx-M5CN08UfGJWUCqlWQJgxIPpQCU3PMNkD4d7NnVM=@pm.me>
In-Reply-To: <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me> <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me> <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com> <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me> <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 19b3892b2d4d2118f0b394cccd58be3a12a198ef
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98452-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 010332BB29D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 18th, 2026 at 7:29 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:
=20
> >>> +=09=09source-pdos =3D <PDO_FIXED(5000, 900,
> >>> +=09=09=09=09=09 PDO_FIXED_DUAL_ROLE |
> >>> +=09=09=09=09=09 PDO_FIXED_USB_COMM |
> >>> +=09=09=09=09=09 PDO_FIXED_DATA_SWAP)>;
> >>> +
> >>> +=09=09sink-pdos =3D <PDO_FIXED(5000, 3000,
> >>> +=09=09=09=09       PDO_FIXED_DUAL_ROLE |
> >>> +=09=09=09=09       PDO_FIXED_USB_COMM |
> >>> +=09=09=09=09       PDO_FIXED_DATA_SWAP)
> >>> +=09=09=09     PDO_FIXED(9000, 3000, 0)
> >>> +=09=09=09     PDO_FIXED(12000, 2250, 0)>;
> >>
> >> Both ports have the same PDOs - will this kaboom if you plug in two ch=
argers?
> >
> > Good catch, from what I can see there is zero hardware isolation. Downs=
tream
> > prevents dual sink by only allowing one port to negotiate sink at a tim=
e (seems
> > to always prefer usb_1 if both are plugged in, guessing because its use=
d for
> > the dock), but there is no upstream mechanism to handle this as far as =
I know
> > (not sure if this could even be done cleanly as it'd require cooperatio=
n
> > between pm8150b_typec and rt1715).
>=20
> Could you please remind me how the two were connected? Maybe we can work
> something out. Sounds like it would make sense for the two to have *some*
> sort of relationship described
>=20

Both USB-C connectors have their own OVP chip, and both OVP outputs feed in=
to
the same USB_IN rail on the PM8150B, there's no switch or mux on the power =
path
just the OVP chips that are always passing through. The GPIOs on the OVPs a=
re
just for notification of what one is providing VBUS into USB_IN.

Here's a diagram from my understanding of the power setup:
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90
=E2=94=82 USB-C1 =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98
    =E2=94=82
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
=E2=94=82  OVP  =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80 vbus-detect (=
GPIO 60)
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
    =E2=94=82
    =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80 PM8150B (USB_IN)
    =E2=94=82
    =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80 NXP PCA9468 (direct charg=
er)
    =E2=94=82
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
=E2=94=82  OVP  =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80 vbus-detect (=
GPIO 13)
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
    =E2=94=82
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90
=E2=94=82 USB-C2 =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98

> >
> > Will just drop the sink PDOs from usb_2 and have it be only source to a=
void
> > this issue.
>=20
> SG as a workaround
>=20
> Konrad
>=20

Thanks,
Alex

