Return-Path: <linux-arm-msm+bounces-68040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1329B1DBE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC1D3A9ACC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DD32701C3;
	Thu,  7 Aug 2025 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RRrqPL7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB075695
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584722; cv=none; b=qmQEwLeq0IKDHzMpQJNrqnvmSEs9n9roDWnUXihqplDv3RDH30BgNskdzP/au6frKWgEzB0fI46/P0385AK0tvjIvlYcn2pSq7X4cYMkRSumzWZW2Rh1tGuNpwB40IF0mEPRKYPlcnfAYh8iPHy1nZgNoi4t27UCxF9E67LYcSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584722; c=relaxed/simple;
	bh=RNN38tsTm5gD4/5zcgMkN8UqPOSEJ3iJYtKGRjL3GEo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=iwT8ltR8slo8Pi4V3HJpC58IY3rnifiNBC84z2p0jvINNPpwfDHCCh31yTApcJXNd1xuUauo/wKQiAuCBOXfYZPd952lJ7U+9hdIDk+i3AXqDZ9JFSGym0+fwY50Z3Tvg93P9LGXS2/JKKFIcYolFvHxLBCrFx4rU0kYIvgfCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RRrqPL7I; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807163838epoutp0321e30a3b089c8a9cf3541c457ccad6a6~ZiYFj2VvR1120911209epoutp03P
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 16:38:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807163838epoutp0321e30a3b089c8a9cf3541c457ccad6a6~ZiYFj2VvR1120911209epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754584718;
	bh=RNN38tsTm5gD4/5zcgMkN8UqPOSEJ3iJYtKGRjL3GEo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RRrqPL7I1BR8u5+IhTUXbdIyg84Nu+3FtTbZUnq42fRt9nfCz4qBX8jq7bRhQw1Cp
	 HXl8wqC+o0ErtP2+pj3nL7GXvy7Y3/6R/zoQ9RDn2II6eYCK7HoVw1X3JIglDcjie9
	 XyvmQFvgk/CoFA/IYjMXP3eafxhjwdzFraUF48FE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807163837epcas5p14ae55f821c4afb408ac72af9bbb0e179~ZiYEvxws-1656116561epcas5p1h;
	Thu,  7 Aug 2025 16:38:37 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byXsn0gNKz2SSKX; Thu,  7 Aug
	2025 16:38:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807163836epcas5p15300402e991a5be93922a414f2bd3959~ZiYDPHN-30434604346epcas5p1M;
	Thu,  7 Aug 2025 16:38:36 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250807163833epsmtip1ba365b680e7c3d3c40d24d2656f73c35~ZiYA86Fky1962119621epsmtip1g;
	Thu,  7 Aug 2025 16:38:33 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Manivannan Sadhasivam'" <mani@kernel.org>
Cc: "'Konrad Dybcio'" <konrad.dybcio@oss.qualcomm.com>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, "'Ram Kumar Dwivedi'"
	<quic_rdwivedi@quicinc.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<andersson@kernel.org>, <konradybcio@kernel.org>,
	<James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
	<agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Thu, 7 Aug 2025 22:08:32 +0530
Message-ID: <0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQHWPm1h7sMntUE9BjOfqFdL0FvwlQKqKM9CAg+/nxMBCUK1JQJtFIHyAldjN/MB24cyRgGnpjwRAmX4p5MB936htgLh1QaLARPOx0SzsAOLcA==
X-CMS-MailID: 20250807163836epcas5p15300402e991a5be93922a414f2bd3959
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60
References: <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
	<061b01dc062d$25c47800$714d6800$@samsung.com>
	<i6eyiscdf2554znc4aaglhi22opfgyicif3y7kzjafwsrtdrtm@jjpzak64gdft>
	<061c01dc062f$70ec34b0$52c49e10$@samsung.com>
	<87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
	<061d01dc0631$c1766c00$44634400$@samsung.com>
	<3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
	<06d201dc0689$9f438200$ddca8600$@samsung.com>
	<wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
	<06f301dc0695$6bf25690$43d703b0$@samsung.com>
	<CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
	<nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>



> -----Original Message-----
> From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> Sent: Wednesday, August 6, 2025 4:56 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzysztof
=5B...=5D

> > >
> > > On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:
> > >
> > > =5B...=5D
> > >
> > > > > >> Introducing generic solutions preemptively for problems that
> > > > > >> are simple in concept and can occur widely is good practice
> > > > > >> (although it's sometimes hard to gauge whether this is a
> > > > > >> one-off), as if the issue spreads a generic solution will
> > > > > >> appear at some point, but we'll have to keep supporting the
> > > > > >> odd ones as well
> > > > > >>
> > > > > > Ok,
> > > > > > I would prefer if we add a property which sounds like =22poor
> > > > > > thermal dissipation=22 or =22routing channel loss=22 rather tha=
n
> > > > > > adding limiting UFS gear
> > > > > properties.
> > > > > > Poor thermal design or channel losses are generic enough and
> > > > > > can happen
> > > > > on any board.
> > > > >
> > > > > This is exactly what I'm trying to avoid through my suggestion -
> > > > > one board may have poor thermal dissipation, another may have
> > > > > channel losses, yet another one may feature a special batch of
> > > > > UFS chips that will set the world on fire if instructed to
> > > > > attempt link training at gear 7 - they all are causes, as
> > > > > opposed to describing what needs to happen (i.e. what the
> > > > > hardware must be treated as - gear N incapable despite what can
> > > > > be discovered at runtime), with perhaps a comment on the side
> > > > >
> > > > But the solution for all possible board problems can't be by
> > > > limiting Gear
> > > speed.
> > >
> > > Devicetree properties should precisely reflect how they are relevant
> > > to the hardware. 'limiting-gear-speed' is self-explanatory that the
> > > gear speed is getting limited (for a reason), but the devicetree
> > > doesn't need to describe the
> > > *reason* itself.
> > >
> > > > So it should be known why one particular board need to limit the ge=
ar.
> > >
> > > That goes into the description, not in the property name.
> > >
> > > > I understand that this is a static configuration, where it is
> > > > already known
> > > that board is broken for higher Gear.
> > > > Can this be achieved by limiting the clock? If not, can we add a
> > > > board
> > > specific _quirk_ and let the _quirk_ to be enabled from vendor
> > > specific hooks?
> > > >
> > >
> > > How can we limit the clock without limiting the gears? When we limit
> > > the gear/mode, both clock and power are implicitly limited.
> > >
> > Possibly someone need to check with designer of the SoC if that is poss=
ible
> or not.
>=20
> It's not just clock. We need to consider reducing regulator, interconnect
> votes also. But as I said above, limiting the gear/mode will take care of=
 all
> these parameters.
>=20
> > Did we already tried _quirk_? If not, why not?
> > If the board is so poorly designed and can't take care of the channel
> > loses or heat dissipation etc, Then I assumed the gear negotiation
> > between host and device should fail for the higher gear and driver can =
have
> a re-try logic to re-init / re-try =22power mode change=22 at the lower g=
ear. Is
> that not possible / feasible?
> >
>=20
> I don't see why we need to add extra logic in the UFS driver if we can ex=
tract
> that information from DT.
>=20
You didn=E2=80=99t=20answer=20my=20question=20entirely,=20I=20am=20still=20=
not=20able=20to=20visualised=20how=20come=20Linkup=20is=20happening=20in=20=
higher=20gear=20and=20then=20=0D=0ASuddenly=20it=20is=20failing=20and=20we=
=20need=20to=20reduce=20the=20gear=20to=20solve=20that?=0D=0AThat's=20why=
=20my=20suggestion=20is=20to=20go=20for=20a=20re-try=20at=20lower=20gear=20=
when=20problem=20happens.=0D=0AIt=20is=20not=20that=20since=20adding=20DT=
=20property=20is=20simple=20to=20just=20go=20that=20path,=20that=20is=20sol=
ving=20_just_=20this=20case,=20may=20be.=20=0D=0A=0D=0A=0D=0A=0D=0A>=20-=20=
Mani=0D=0A>=20=0D=0A>=20--=0D=0A>=20=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=
=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=AF=8D=20=E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=
=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=8D=0D=0A=0D=0A

