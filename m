Return-Path: <linux-arm-msm+bounces-71709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC465B41360
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 06:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F43A481C07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 04:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0059C2D0C67;
	Wed,  3 Sep 2025 04:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C5VJWHil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FF02D0637
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 04:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756872401; cv=none; b=pnCBeRY2nGbZJewKUY0OZuJjAeroKsVH2IfK23oEnQuiUqiKHyjHyEhz1mv1C+K6XQ/hHjEQAEQoCsK5C+yPyUuL9HHschgeH0Oyh/LoCu95bWl6/23ysD792xPzZEtoou5st3JgL6zo3oZuvo/3IGBfzyZhM9CGsA0agMDUfwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756872401; c=relaxed/simple;
	bh=kII2ZAad1eEm551IWkEqDnKbBmwiyhsU3D/ajxKTL+U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=TxffFqTZylpJW6ETX0IuaoiQJHp/ygPG4awh4+EKtqe4c1meyQNeuV9fgvA9f+MP07UdBKrSMZwM0b17fun5gqqosku+Pdw7alc9wCa/YNtopo8QuQ5owPa/byOCqKtp59B8QCWiPk0d21sNgXGg3/9GEdkxStYEin5wBSVW6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=C5VJWHil; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250903040637epoutp03bae76767da27060f678ebb933230b2ca~hqiMZlU-O2692626926epoutp03J
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 04:06:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250903040637epoutp03bae76767da27060f678ebb933230b2ca~hqiMZlU-O2692626926epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756872397;
	bh=kII2ZAad1eEm551IWkEqDnKbBmwiyhsU3D/ajxKTL+U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=C5VJWHil8oVqZEYJ+DArtLd06gbQ8qfStQzMwsIAQGp563b3A8cid5oPd3rWKOSYN
	 1FqHCS7JWmXVyMSwhLFPymMBM01PKApjvnhLT4PvrYS6PBOMP/IJUssEzcDFcjqUQF
	 mmdqdVSmPhuSS+dvKpqJ2ZZoQfdM8kqAkeu7wgno=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250903040636epcas5p2b9f11d156e8391b8e77ffcfc22707a72~hqiLrQEjs1472614726epcas5p2w;
	Wed,  3 Sep 2025 04:06:36 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cGpvb6Lngz6B9mG; Wed,  3 Sep
	2025 04:06:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250903040635epcas5p333aa12e3a607d72bb027166b00a242d8~hqiKZ9T0U1719917199epcas5p3t;
	Wed,  3 Sep 2025 04:06:35 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903040632epsmtip28a860a282dae40d1a0ffd8f60b641ba6~hqiIFtFas3046730467epsmtip2R;
	Wed,  3 Sep 2025 04:06:32 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Nitin Rawat'" <quic_nitirawa@quicinc.com>, "'Manivannan Sadhasivam'"
	<mani@kernel.org>
Cc: "'Konrad Dybcio'" <konrad.dybcio@oss.qualcomm.com>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, "'Ram Kumar Dwivedi'"
	<quic_rdwivedi@quicinc.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<andersson@kernel.org>, <konradybcio@kernel.org>,
	<James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
	<agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <f5b4580c-4e68-405f-95fb-21fa1b105711@quicinc.com>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Wed, 3 Sep 2025 09:36:31 +0530
Message-ID: <3a8a01dc1c88$23734880$6a59d980$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGnpjwRT6EYpkeInvmjX4F0QHyKRAJl+KeTAfd+obYC4dUGiwETzsdEAg+4PAsBhUBs+QD6zayoAmaAkKoBhVchmwEE4NNAAwOStYK0QwdQkA==
Content-Language: en-us
X-CMS-MailID: 20250903040635epcas5p333aa12e3a607d72bb027166b00a242d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60
References: <06d201dc0689$9f438200$ddca8600$@samsung.com>
	<wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
	<06f301dc0695$6bf25690$43d703b0$@samsung.com>
	<CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
	<nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
	<0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
	<fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
	<0f8c01dc0876$427cf1c0$c776d540$@samsung.com>
	<xqynlabahvaw4cznbofkkqjr4oh7tf6crlnxoivhpadlymxg5v@a4b5fgf55nqw>
	<10ae01dc08c9$022d8aa0$06889fe0$@samsung.com>
	<o2lnzaxurshoyyxtdcyiyphprumisggd6m2qvcoeptvnkvh4ap@dm2nc4krinja>
	<f5b4580c-4e68-405f-95fb-21fa1b105711@quicinc.com>



> -----Original Message-----
> From: Nitin Rawat <quic_nitirawa=40quicinc.com>
> Sent: Tuesday, August 12, 2025 3:16 AM
> To: 'Manivannan Sadhasivam' <mani=40kernel.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>
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
>=20
>=20
> On 8/9/2025 4:43 PM, 'Manivannan Sadhasivam' wrote:
> > On Sat, Aug 09, 2025 at 06:30:29AM GMT, Alim Akhtar wrote:
> >
> > =5B...=5D
> >
> >>>>>>>>>> I understand that this is a static configuration, where it is
> >>>>>>>>>> already known
> >>>>>>>>> that board is broken for higher Gear.
> >>>>>>>>>> Can this be achieved by limiting the clock? If not, can we
> >>>>>>>>>> add a board
> >>>>>>>>> specific _quirk_ and let the _quirk_ to be enabled from vendor
> >>>>>>>>> specific hooks?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> How can we limit the clock without limiting the gears? When we
> >>>>>>>>> limit the gear/mode, both clock and power are implicitly
> >>> limited.
> >>>>>>>>>
> >>>>>>>> Possibly someone need to check with designer of the SoC if that
> >>>>>>>> is possible
> >>>>>>> or not.
> >>>>>>>
> >>>>>>> It's not just clock. We need to consider reducing regulator,
> >>>>>>> interconnect votes also. But as I said above, limiting the
> >>>>>>> gear/mode will take care of all these parameters.
> >>>>>>>
> >>>>>>>> Did we already tried _quirk_? If not, why not?
> >>>>>>>> If the board is so poorly designed and can't take care of the
> >>>>>>>> channel loses or heat dissipation etc, Then I assumed the gear
> >>>>>>>> negotiation between host and device should fail for the higher
> >>>>>>>> gear and driver can have
> >>>>>>> a re-try logic to re-init / re-try =22power mode change=22 at the
> >>>>>>> lower gear. Is that not possible / feasible?
> >>>>>>>>
> >>>>>>>
> >>>>>>> I don't see why we need to add extra logic in the UFS driver if
> >>>>>>> we can extract that information from DT.
> >>>>>>>
> >>>>>> You didn=E2=80=99t=20answer=20my=20question=20entirely,=20I=20am=
=20still=20not=20able=20to=0D=0A>=20>>>>>>=20visualised=20how=20come=20Link=
up=20is=20happening=20in=20higher=20gear=20and=20then=0D=0A>=20>>>>>>=20Sud=
denly=0D=0A>=20>>>>>=20it=20is=20failing=20and=20we=20need=20to=20reduce=20=
the=20gear=20to=20solve=20that?=0D=0A>=20>>>>>=0D=0A>=20>>>>>=20Oh=20well,=
=20this=20is=20the=20source=20of=20confusion=20here.=20I=20didn't=20(also=
=20the=0D=0A>=20>>>>>=20patch)=20claim=20that=20the=20link=20up=20will=20ha=
ppen=20with=20higher=20speed.=20It=0D=0A>=20>>>>>=20will=20most=20likely=20=
fail=20if=20it=20couldn't=20operate=20at=20the=20higher=20speed=0D=0A>=20>>=
>>>=20and=20that's=20why=20we=20need=20to=20limit=20it=20to=20lower=20gear/=
mode=20*before*=0D=0A>=20>>>>>=20bringing=20the=0D=0A>=20>>>=20link=20up.=
=0D=0A>=20>>>>>=0D=0A>=20>>>>=20Right,=20that's=20why=20a=20re-try=20logic=
=20to=20negotiate=20a=20__working__=20power=0D=0A>=20>>>>=20mode=0D=0A>=20>=
>>=20change=20can=20help,=20instead=20of=20introducing=20new=20binding=20fo=
r=20this=20case.=0D=0A>=20>>>=0D=0A>=20>>>=20Retry=20logic=20is=20already=
=20in=20place=20in=20the=20ufshcd=20core,=20but=20with=20this=0D=0A>=20>>>=
=20kind=20of=20signal=20integrity=20issue,=20we=20cannot=20guarantee=20that=
=20it=20will=0D=0A>=20>>>=20gracefully=20fail=20and=20then=20we=20could=20r=
etry.=20The=20link=20up=20*may*=20succeed,=0D=0A>=20>>>=20then=20it=20could=
=20blow=20up=20later=20also=20(when=20doing=20heavy=20I/O=20operations=0D=
=0A>=20>>>=20etc...).=20So=20with=20this=20non-deterministic=20behavior,=20=
we=20cannot=20rely=20on=20this=0D=0A>=20logic.=0D=0A>=20>>>=0D=0A>=20>>=20I=
=20would=20image=20in=20that=20case=20,=20PHY=20tuning=20/=20programming=20=
is=20not=20proper.=0D=0A>=20>=0D=0A>=20>=20I=20don't=20have=20the=20insight=
=20into=20the=20PHY=20tuning=20to=20avoid=20this=20issue.=0D=0A>=20>=20Mayb=
e=20Nitin=20or=20Ram=20can=20comment=20here.=20But=20PHY=20tuning=20is=20mo=
stly=20SoC=0D=0A>=20specific=20in=20the=20PHY=20driver.=0D=0A>=20>=20We=20d=
on't=20have=20board=20level=20tuning=20sequence=20AFIAK.=0D=0A>=20=0D=0A>=
=20Hi=20Alim=20and=20Mani,=0D=0A>=20=0D=0A>=20Here's=20my=20take:=0D=0A>=20=
=0D=0A>=20There=20can=20be=20multiple=20reasons=20for=20limiting=20the=20ge=
ar/rate=20on=20a=20customer=20board=0D=0A>=20beyond=20PHY=20tuning=20issues=
:=0D=0A>=20=0D=0A>=201.=20Board-level=20signal=20integrity=20concerns=202.=
=20Channel=20or=20reference=20clock=0D=0A>=20configuration=20issues=203.=20=
Customer=20board=20layout=20not=20meeting=20layout=20design=0D=0A>=20guidel=
ines=0D=0A>=20=0D=0A>=20This=20becomes=20especially=20critical=20in=20autom=
otive=20platforms=20like=20the=20SA8155,=20as=0D=0A>=20mentioned=20by=20Ram=
.=20In=20such=20safety-critical=20applications,=20customer=20prioritize=0D=
=0A>=20reliability=20over=20peak=20performance,=20and=20hence=20customers=
=20are=20generally=0D=0A>=20comfortable=20operating=20at=20lower=20gears=20=
if=20stability=20is=20ensured.=0D=0A>=20=0D=0ASorry=20for=20delay=20in=20re=
ply=20(lost=20this=20email=20in=20my=20inbox),=20Thanks=20Nitin=20for=20det=
ailed=20explanations=20=0D=0ALooks=20like=20board=20has=20too=20many=20issu=
es=20for=20=22safety-critical=20applications=22=0D=0AAnyway,=20looks=20like=
=20there=20is=20consensus=20to=20have=20this=20property=20in,=20as=20adopte=
d=20by=20PCIe=20and=20other=20subsystem.=0D=0A=0D=0A=0D=0A

