Return-Path: <linux-arm-msm+bounces-67805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9154CB1B934
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 19:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1210818A00DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 17:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00C2296161;
	Tue,  5 Aug 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bTJ+Ll8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D0293C4D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414401; cv=none; b=IfmF9EGMh89rxcaOtx5xYv2fgUEGXJeHuI1GdoAfJBY9ZBfo2pZ9VFd9QemRFb90dcWE5dXsM3O9Hvim6vXfqvbDCAF5xkrKAI2Iwohw0P84BbdueYv04Z989lonhOMxZ1cX5Pwbbfs4+usQWVEUC/f8Q5icblCZ4fPMGaRNJ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414401; c=relaxed/simple;
	bh=wXk7AXwYUilCzs6h7m2OKQQRTWnaTbHCa5F4w44YHJ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=CWImKbH+U3TEavnMZWoJAnwswQmzgavJzdYZgsRqM/4E2XnDAVATxL7g4rfL+8vLJsSbTcvAf1I136fn8KNZJT8tTDJKpVA2VEBqrAIQ+D+tUboPuNPBVNl2zi9qDWmVP+qM8CeIi5fX4WKiUpmRJ2AOpXdhGReLQ5Yjn9dGqIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bTJ+Ll8i; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250805171951epoutp0229a09ce3beb20a07dde6348893c06bf2~Y7pgdkhRh2127621276epoutp02K
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 17:19:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250805171951epoutp0229a09ce3beb20a07dde6348893c06bf2~Y7pgdkhRh2127621276epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754414391;
	bh=wXk7AXwYUilCzs6h7m2OKQQRTWnaTbHCa5F4w44YHJ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bTJ+Ll8iCG5gbMfodw4A8Fwup93QAVqCdqc7W6ZJyTjSDDuZyJ0W3tvib2U5NQRZP
	 x35RMlkFSXMWCS+DvqkB68ojlK8YQPBVlZ2ldf/oiFR2sKjijeasHTxtIyaZQui/1N
	 YWkDDDGv+QsMlR8zZNRu/kXYyN1n0O6G+nbZdxmQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250805171950epcas5p42b2fd0f1f2586a9b20f77a611c78d496~Y7pfTi66b0183001830epcas5p4U;
	Tue,  5 Aug 2025 17:19:50 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxKtG0H8Gz3hhT3; Tue,  5 Aug
	2025 17:19:50 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250805171949epcas5p30c43bd9ea6a12814fad1be7988dc2bc7~Y7pd5c16_1679116791epcas5p3H;
	Tue,  5 Aug 2025 17:19:49 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805171946epsmtip13608ef786b01f6568760f2030e4f31e3~Y7pbsftBi1987919879epsmtip13;
	Tue,  5 Aug 2025 17:19:46 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Konrad Dybcio'" <konrad.dybcio@oss.qualcomm.com>, "'Manivannan
 Sadhasivam'" <mani@kernel.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Ram Kumar Dwivedi'"
	<quic_rdwivedi@quicinc.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<andersson@kernel.org>, <konradybcio@kernel.org>,
	<James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
	<agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Tue, 5 Aug 2025 22:49:45 +0530
Message-ID: <061b01dc062d$25c47800$714d6800$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEsDrE8JRCAsHRairxCtqkF8AWYdgJ3dE0KAYiFM6ICWTmtcAIeLXciAcYGcMYCPwKykwJqyOxTAqeW3QQBLCbdjgHWPm1htQ+xfrA=
X-CMS-MailID: 20250805171949epcas5p30c43bd9ea6a12814fad1be7988dc2bc7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
	<20250722161103.3938-3-quic_rdwivedi@quicinc.com>
	<2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
	<jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
	<fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
	<1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
	<2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
	<11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
	<jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
	<CGME20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d@epcas5p4.samsung.com>
	<b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>



> -----Original Message-----
> From: Konrad Dybcio <konrad.dybcio=40oss.qualcomm.com>
> Sent: Tuesday, August 5, 2025 10:36 PM
> To: Manivannan Sadhasivam <mani=40kernel.org>
> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Ram Kumar Dwivedi
> <quic_rdwivedi=40quicinc.com>; alim.akhtar=40samsung.com;
> avri.altman=40wdc.com; bvanassche=40acm.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; andersson=40kernel.org;
> konradybcio=40kernel.org; James.Bottomley=40hansenpartnership.com;
> martin.petersen=40oracle.com; agross=40kernel.org; linux-arm-
> msm=40vger.kernel.org; linux-scsi=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear and rate =
limit
> properties to UFS
>=20
> On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
> > On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
> >> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> >>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
> >>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> >>>>>
> >>>>>
> >>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> >>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
> >>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> >>>>>>>> Add optional limit-hs-gear and limit-rate properties to the UFS
> >>>>>>>> node to support automotive use cases that require limiting the
> >>>>>>>> maximum Tx/Rx HS gear and rate due to hardware constraints.
> >>>>>>>
> >>>>>>> What hardware constraints? This needs to be clearly documented.
> >>>>>>>
> >>>>>>
> >>>>>> Ram, both Krzysztof and I asked this question, but you never
> >>>>>> bothered to reply, but keep on responding to other comments. This
> >>>>>> won't help you to get this series merged in any form.
> >>>>>>
> >>>>>> Please address *all* review comments before posting next iteration=
.
> >>>>>
> >>>>> Hi Mani,
> >>>>>
> >>>>> Apologies for the delay in responding.
> >>>>> I had planned to explain the hardware constraints in the next
> patchset=E2=80=99s=20commit=20message,=20which=20is=20why=20I=20didn=E2=
=80=99t=20reply=20earlier.=0D=0A>=20>>>>>=0D=0A>=20>>>>>=20To=20clarify:=20=
the=20limitations=20are=20due=20to=20customer=20board=20designs,=20not=20ou=
r=0D=0A>=20SoC.=20Some=20boards=20can't=20support=20higher=20gear=20operati=
on,=20hence=20the=20need=20for=0D=0A>=20optional=20limit-hs-gear=20and=20li=
mit-rate=20properties.=0D=0A>=20>>>>>=0D=0A>=20>>>>=0D=0A>=20>>>>=20That's=
=20vague=20and=20does=20not=20justify=20the=20property.=20You=20need=20to=
=0D=0A>=20>>>>=20document=20instead=20hardware=20capabilities=20or=20charac=
teristic.=20Or=0D=0A>=20>>>>=20explain=20why=20they=20cannot.=20With=20such=
=20form=20I=20will=20object=20to=20your=20next=0D=0A>=20patch.=0D=0A>=20>>>=
>=0D=0A>=20>>>=0D=0A>=20>>>=20I=20had=20an=20offline=20chat=20with=20Ram=20=
and=20got=20clarified=20on=20what=20these=20properties=0D=0A>=20are.=0D=0A>=
=20>>>=20The=20problem=20here=20is=20not=20with=20the=20SoC,=20but=20with=
=20the=20board=20design.=20On=0D=0A>=20>>>=20some=20Qcom=20customer=20desig=
ns,=20both=20the=20UFS=20controller=20in=20the=20SoC=20and=0D=0A>=20>>>=20t=
he=20UFS=20device=20are=20capable=20of=20operating=20at=20higher=20gears=20=
(say=20G5).=0D=0A>=20>>>=20But=20due=20to=20board=20constraints=20like=20po=
or=20thermal=20dissipation,=20routing=0D=0A>=20>>>=20loss,=20the=20board=20=
cannot=20efficiently=20operate=20at=20the=20higher=20speeds.=0D=0A>=20>>>=
=0D=0A>=20>>>=20So=20the=20customers=20wanted=20a=20way=20to=20limit=20the=
=20gear=20speed=20(say=20G3)=20and=0D=0A>=20>>>=20rate=20(say=20Mode-A)=20o=
n=20the=20specific=20board=20DTS.=0D=0A>=20>>=0D=0A>=20>>=20I'm=20not=20nec=
essarily=20saying=20no,=20but=20have=20you=20explored=20sysfs=20for=20this?=
=0D=0A>=20>>=0D=0A>=20>>=20I=20suppose=20it=20may=20be=20too=20late=20(if=
=20the=20driver=20would=20e.g.=20init=20the=20UFS=0D=0A>=20>>=20at=20max=20=
gear/rate=20at=20probe=20time,=20it=20could=20cause=20havoc=20as=20it=20tri=
es=20to=0D=0A>=20>>=20load=20the=20userland)..=0D=0A>=20>>=0D=0A>=20>=0D=0A=
>=20>=20If=20the=20driver=20tries=20to=20run=20with=20unsupported=20max=20g=
ear=20speed/mode,=20it=0D=0A>=20>=20will=20just=20crash=20with=20the=20erro=
r=20spit.=0D=0A>=20=0D=0A>=20OK=0D=0A>=20=0D=0A>=20just=20a=20couple=20rela=
ted=20nits=20that=20I=20won't=20bother=20splitting=20into=20separate=20emai=
ls=0D=0A>=20=0D=0A>=20rate=20(mode?=20I'm=20seeing=20both=20names)=20should=
=20probably=20have=20dt-bindings=0D=0A>=20defines=20while=20gear=20doesn't=
=20have=20to=20since=20they're=20called=20G<number>=20anyway,=0D=0A>=20with=
=20the=20bindings=20description=20strongly=20discouraging=20use,=20unless=
=20absolutely=0D=0A>=20necessary=20(e.g.=20in=20the=20situation=20we=20have=
=20right=20there)=0D=0A>=20=0D=0A>=20I'd=20also=20assume=20the=20code=20sho=
uld=20be=20moved=20into=20the=20ufs-common=20code,=20rather=0D=0A>=20than=
=20making=20it=20ufs-qcom=20specific=0D=0A>=20=0D=0A>=20Konrad=0D=0ASince=
=20this=20is=20a=20board=20specific=20constrains=20and=20not=20a=20SoC=20pr=
operties,=20have=20an=20option=20of=20handling=20this=20via=20bootloader=20=
is=20explored?=0D=0AOr=20passing=20such=20properties=20via=20bootargs=20and=
=20handle=20the=20same=20in=20the=20driver?=0D=0A=0D=0A

