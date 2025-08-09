Return-Path: <linux-arm-msm+bounces-68154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD734B1F1CB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 03:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 513FFA06B76
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 01:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D76275B1C;
	Sat,  9 Aug 2025 01:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hYsHEB6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A11E515
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 01:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754701239; cv=none; b=RxsCCYz5QJvRTxbAcK+BG1CTiVMMkGNtH5PxcQyqoDtJ7ftAb4tbSYmzouN1QYRtVFPpP6jqvOszUsl/Jl6ra/6C2T6KEBsCtGu1SsaKY6VX3AW2+tqbPTOnn/GxyrDV06iML1Gf/BJnkHwY7b1q9PjnP/vkn0oVg3h16JDOfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754701239; c=relaxed/simple;
	bh=6p/S3Uy8iONxblxo0geDNCDWCY0lgXyojuuce9/ZByM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VWg0pUqe83hduj9LvL/Sfxtng9jlFghlHSwPCLCpBHDL92p5F/is0zjctpN2tW2QJ0qK5LXAuGBgBtNprvCNtRFCDsDmA6AhQDj87mB2Bz7bIQUQg43DSv9FB+zVUtLav3t0oEtA4zHUFwRTMu5uNe9j/kAzD1sRH+xr7Uc1QXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hYsHEB6Q; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250809010035epoutp036b520e7b09d997c98d5f60d916770fe7~Z83oNfBia2487424874epoutp03h
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 01:00:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250809010035epoutp036b520e7b09d997c98d5f60d916770fe7~Z83oNfBia2487424874epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754701235;
	bh=6p/S3Uy8iONxblxo0geDNCDWCY0lgXyojuuce9/ZByM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=hYsHEB6QCN+nowIyM2Qubws40bCgCvTHIDktQ1riCI1oXmPlWRG/JjlRMwCPsdk5D
	 opNWeecIHXlcDRVObPaP+JjeJVKvU59293rrSfHUBObUl7+5MEw2lp1lmtf0hp5kzU
	 taa8/yDk854cq0lTlmu81dnBg8h11dZ2V21XiFnY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250809010034epcas5p2b20e433ab4b992df5af089fb40c07e05~Z83nqean41843418434epcas5p2t;
	Sat,  9 Aug 2025 01:00:34 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bzMyV0FYsz6B9m4; Sat,  9 Aug
	2025 01:00:34 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250809010033epcas5p4a1713cca4f9cf13c787f3eff0306df4c~Z83mgOeja2999029990epcas5p42;
	Sat,  9 Aug 2025 01:00:33 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250809010031epsmtip25e04ecb69faaa19c1c0e7c11a912197b~Z83kQXCWo1963619636epsmtip2K;
	Sat,  9 Aug 2025 01:00:31 +0000 (GMT)
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
In-Reply-To: <xqynlabahvaw4cznbofkkqjr4oh7tf6crlnxoivhpadlymxg5v@a4b5fgf55nqw>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Sat, 9 Aug 2025 06:30:29 +0530
Message-ID: <10ae01dc08c9$022d8aa0$06889fe0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQJXYzfzcISGxNV+SWiRtdX8ICagoAHbhzJGAaemPBECZfinkwH3fqG2AuHVBosBE87HRAIPuDwLAYVAbPkA+s2sqAJmgJCqssxkDdA=
X-CMS-MailID: 20250809010033epcas5p4a1713cca4f9cf13c787f3eff0306df4c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60
References: <061d01dc0631$c1766c00$44634400$@samsung.com>
	<3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
	<06d201dc0689$9f438200$ddca8600$@samsung.com>
	<wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
	<06f301dc0695$6bf25690$43d703b0$@samsung.com>
	<CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
	<nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
	<0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
	<fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
	<0f8c01dc0876$427cf1c0$c776d540$@samsung.com>
	<xqynlabahvaw4cznbofkkqjr4oh7tf6crlnxoivhpadlymxg5v@a4b5fgf55nqw>



> -----Original Message-----
> From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> Sent: Friday, August 8, 2025 11:37 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzysztof
> Kozlowski' <krzk=40kernel.org>; 'Ram Kumar Dwivedi'
> <quic_rdwivedi=40quicinc.com>; avri.altman=40wdc.com;
> bvanassche=40acm.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; andersson=40kernel.org; konradybcio=40kernel.org;
> James.Bottomley=40hansenpartnership.com; martin.petersen=40oracle.com;
> agross=40kernel.org; linux-arm-msm=40vger.kernel.org; linux-
> scsi=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear and rate =
limit
> properties to UFS
>=20
> On Fri, Aug 08, 2025 at 08:38:09PM GMT, Alim Akhtar wrote:
> >
> >
> > > -----Original Message-----
> > > From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> > > Sent: Friday, August 8, 2025 6:14 PM
> > > To: Alim Akhtar <alim.akhtar=40samsung.com>
> > > Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzysztof
> > > Kozlowski' <krzk=40kernel.org>; 'Ram Kumar Dwivedi'
> > > <quic_rdwivedi=40quicinc.com>; avri.altman=40wdc.com;
> > > bvanassche=40acm.org; robh=40kernel.org; krzk+dt=40kernel.org;
> > > conor+dt=40kernel.org; andersson=40kernel.org; konradybcio=40kernel.o=
rg;
> > > James.Bottomley=40hansenpartnership.com;
> martin.petersen=40oracle.com;
> > > agross=40kernel.org; linux-arm-msm=40vger.kernel.org; linux-
> > > scsi=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> > > kernel=40vger.kernel.org
> > > Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear and r=
ate
> > > limit properties to UFS
> > >
> > > On Thu, Aug 07, 2025 at 10:08:32PM GMT, Alim Akhtar wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> > > > > Sent: Wednesday, August 6, 2025 4:56 PM
> > > > > To: Alim Akhtar <alim.akhtar=40samsung.com>
> > > > > Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzyszto=
f
> > > > =5B...=5D
> > > >
> > > > > > >
> > > > > > > On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:
> > > > > > >
> > > > > > > =5B...=5D
> > > > > > >
> > > > > > > > > >> Introducing generic solutions preemptively for
> > > > > > > > > >> problems that are simple in concept and can occur
> > > > > > > > > >> widely is good practice (although it's sometimes hard
> > > > > > > > > >> to gauge whether this is a one-off), as if the issue
> > > > > > > > > >> spreads a generic solution will appear at some point,
> > > > > > > > > >> but we'll have to keep supporting the odd ones as
> > > > > > > > > >> well
> > > > > > > > > >>
> > > > > > > > > > Ok,
> > > > > > > > > > I would prefer if we add a property which sounds like
> > > > > > > > > > =22poor thermal dissipation=22 or =22routing channel lo=
ss=22
> > > > > > > > > > rather than adding limiting UFS gear
> > > > > > > > > properties.
> > > > > > > > > > Poor thermal design or channel losses are generic
> > > > > > > > > > enough and can happen
> > > > > > > > > on any board.
> > > > > > > > >
> > > > > > > > > This is exactly what I'm trying to avoid through my
> > > > > > > > > suggestion - one board may have poor thermal
> > > > > > > > > dissipation, another may have channel losses, yet
> > > > > > > > > another one may feature a special batch of UFS chips
> > > > > > > > > that will set the world on fire if instructed to attempt
> > > > > > > > > link training at gear 7 - they all are causes, as
> > > > > > > > > opposed to describing what needs to happen (i.e. what
> > > > > > > > > the hardware must be treated as - gear N incapable
> > > > > > > > > despite what can be discovered at runtime), with perhaps
> > > > > > > > > a comment on the side
> > > > > > > > >
> > > > > > > > But the solution for all possible board problems can't be
> > > > > > > > by limiting Gear
> > > > > > > speed.
> > > > > > >
> > > > > > > Devicetree properties should precisely reflect how they are
> > > > > > > relevant to the hardware. 'limiting-gear-speed' is
> > > > > > > self-explanatory that the gear speed is getting limited (for
> > > > > > > a reason), but the devicetree doesn't need to describe the
> > > > > > > *reason* itself.
> > > > > > >
> > > > > > > > So it should be known why one particular board need to
> > > > > > > > limit the
> > > gear.
> > > > > > >
> > > > > > > That goes into the description, not in the property name.
> > > > > > >
> > > > > > > > I understand that this is a static configuration, where it
> > > > > > > > is already known
> > > > > > > that board is broken for higher Gear.
> > > > > > > > Can this be achieved by limiting the clock? If not, can we
> > > > > > > > add a board
> > > > > > > specific _quirk_ and let the _quirk_ to be enabled from
> > > > > > > vendor specific hooks?
> > > > > > > >
> > > > > > >
> > > > > > > How can we limit the clock without limiting the gears? When
> > > > > > > we limit the gear/mode, both clock and power are implicitly
> limited.
> > > > > > >
> > > > > > Possibly someone need to check with designer of the SoC if
> > > > > > that is possible
> > > > > or not.
> > > > >
> > > > > It's not just clock. We need to consider reducing regulator,
> > > > > interconnect votes also. But as I said above, limiting the
> > > > > gear/mode will take care of all these parameters.
> > > > >
> > > > > > Did we already tried _quirk_? If not, why not?
> > > > > > If the board is so poorly designed and can't take care of the
> > > > > > channel loses or heat dissipation etc, Then I assumed the gear
> > > > > > negotiation between host and device should fail for the higher
> > > > > > gear and driver can have
> > > > > a re-try logic to re-init / re-try =22power mode change=22 at the
> > > > > lower gear. Is that not possible / feasible?
> > > > > >
> > > > >
> > > > > I don't see why we need to add extra logic in the UFS driver if
> > > > > we can extract that information from DT.
> > > > >
> > > > You didn=E2=80=99t=20answer=20my=20question=20entirely,=20I=20am=20=
still=20not=20able=20to=0D=0A>=20>=20>=20>=20visualised=20how=20come=20Link=
up=20is=20happening=20in=20higher=20gear=20and=20then=0D=0A>=20>=20>=20>=20=
Suddenly=0D=0A>=20>=20>=20it=20is=20failing=20and=20we=20need=20to=20reduce=
=20the=20gear=20to=20solve=20that?=0D=0A>=20>=20>=0D=0A>=20>=20>=20Oh=20wel=
l,=20this=20is=20the=20source=20of=20confusion=20here.=20I=20didn't=20(also=
=20the=0D=0A>=20>=20>=20patch)=20claim=20that=20the=20link=20up=20will=20ha=
ppen=20with=20higher=20speed.=20It=20will=0D=0A>=20>=20>=20most=20likely=20=
fail=20if=20it=20couldn't=20operate=20at=20the=20higher=20speed=20and=0D=0A=
>=20>=20>=20that's=20why=20we=20need=20to=20limit=20it=20to=20lower=20gear/=
mode=20*before*=20bringing=20the=0D=0A>=20link=20up.=0D=0A>=20>=20>=0D=0A>=
=20>=20Right,=20that's=20why=20a=20re-try=20logic=20to=20negotiate=20a=20__=
working__=20power=20mode=0D=0A>=20change=20can=20help,=20instead=20of=20int=
roducing=20new=20binding=20for=20this=20case.=0D=0A>=20=0D=0A>=20Retry=20lo=
gic=20is=20already=20in=20place=20in=20the=20ufshcd=20core,=20but=20with=20=
this=20kind=20of=20signal=0D=0A>=20integrity=20issue,=20we=20cannot=20guara=
ntee=20that=20it=20will=20gracefully=20fail=20and=20then=20we=0D=0A>=20coul=
d=20retry.=20The=20link=20up=20*may*=20succeed,=20then=20it=20could=20blow=
=20up=20later=20also=0D=0A>=20(when=20doing=20heavy=20I/O=20operations=20et=
c...).=20So=20with=20this=20non-deterministic=0D=0A>=20behavior,=20we=20can=
not=20rely=20on=20this=20logic.=0D=0A>=20=0D=0AI=20would=20image=20in=20tha=
t=20case=20,=20PHY=20tuning=20/=20programming=20is=20not=20proper.=0D=0A=0D=
=0A>=20>=20And=20that=20approach=20can=20be=20useful=20for=20many=20platfor=
ms.=0D=0A>=20=0D=0A>=20Other=20platforms=20could=20also=20reuse=20the=20sam=
e=20DT=20properties=20to=20workaround=0D=0A>=20similar=20issues.=0D=0A>=20=
=0D=0A>=20>=20Anyway=20coming=20back=20with=20the=20same=20point=20again=20=
and=20again=20is=20not=20productive.=0D=0A>=20>=20I=20gave=20my=20opinion=
=20and=20suggestions.=20Rest=20is=20on=20the=20maintainers.=0D=0A>=20=0D=0A=
>=20Suggestions=20are=20always=20welcomed.=20It=20is=20important=20to=20hav=
e=20comments=20to=20try=0D=0A>=20out=20different=20things=20instead=20of=20=
sticking=20to=20the=20proposed=20solution.=20But=20in=20my=0D=0A>=20opinion=
,=20the=20retry=20logic=20is=20not=20reliable=20in=20this=20case.=20Moreove=
r,=20we=20do=20have=0D=0A>=20similar=20properties=20for=20other=20periphera=
ls=20like=20PCIe,=20MMC,=20where=20the=20vendors=0D=0A>=20would=20use=20DT=
=20properties=20to=20limit=20the=20speed=20to=20workaround=20the=20board=20=
issues.=0D=0A>=20So=20we=20are=20not=20doing=20anything=20insane=20here.=0D=
=0A>=20=0D=0A>=20If=20there=20are=20better=20solutions=20than=20what=20is=
=20proposed=20here,=20we=20would=20indeed=0D=0A>=20like=20to=20hear.=0D=0A>=
=20=0D=0AFor=20that,=20more=20_technical_=20things=20need=20to=20be=20discu=
ssed=20(e.g.=20Is=20it=20the=20PHY=20which=20has=20problem,=20or=20problem=
=20is=20happening=20at=20unipro=20level=20or=20somewhere=20else),=20=0D=0AI=
=20didn't=20saw=20any=20technical=20backing=20from=20the=20patch=20Author/S=
ubmitter=0D=0A(I=20assume=20Author=20should=20be=20knowing=20a=20bit=20more=
=20in-depth=20then=20what=20we=20are=20assuming=20and=20discussing=20here).=
=20=0D=0A=0D=0A>=20-=20Mani=0D=0A>=20=0D=0A>=20--=0D=0A>=20=E0=AE=AE=E0=AE=
=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=AF=8D=20=E0=AE=
=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=8D=0D=0A=0D=
=0A

