Return-Path: <linux-arm-msm+bounces-67843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E765B1BF91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 06:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6D217FE9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 04:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49E81D6194;
	Wed,  6 Aug 2025 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="M/LkTTgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB60189905
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 04:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754454113; cv=none; b=ecXnz3DszPyWEGwJTlThI7mSlMpiJ7pYnEtPGZQ1Voakr6FJmk/Xsccysnt159dXfX/mg+ByE1CpGMXEQOilZzLuOdA+ayeXk8M0iLiXczzsp0W2mzX/4sIxgFU5hu/IB8Ydlpe2jeoUlJI/QCCTCAJ+9s51l1XhoPyYCwxk4L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754454113; c=relaxed/simple;
	bh=Q+WwfsmqyK18aGrw010aWHG+ueVZzlwCeBv3AsnNMK8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=oAHAcLiggotHFwz1AY52YRw17iMdB8K3bDt1QMeLKhE/tg4vUGoBnv9Ym7jfBlEfo3Ja/LChZ/n6RZi2gPJxU1X95VpgJBtR3RW8zXbdzySCrtVqFxgHeRwke+uTt0XtPUN8xHYcOFyOIxBNKJFz9bNL+HOHIHfggNJZFGIFFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=M/LkTTgE; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250806042149epoutp0218f7e7a8f2ce985a4e88062f1a2e18d9~ZEreCp3ND0903209032epoutp02O
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 04:21:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250806042149epoutp0218f7e7a8f2ce985a4e88062f1a2e18d9~ZEreCp3ND0903209032epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754454109;
	bh=Q+WwfsmqyK18aGrw010aWHG+ueVZzlwCeBv3AsnNMK8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=M/LkTTgE2FVN0s2EumZHHpK2fkwRX0w7Yp8FJWl4AR+/VI8/DBJ1DJqizpQn/FhsD
	 uzbQpp3bRu81LYWlai05+4/QKDw3gdnBokKJMjvZ3qLGtKfkWBn0Hf1Wd11SlTiE4z
	 FKkYQhdd6OE2MFy1yRd3siCE/odxHuFVkoAUtoJ4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250806042148epcas5p363f8fc2a2264eace4792d16949ff0a1f~ZErdWDwME2685826858epcas5p3F;
	Wed,  6 Aug 2025 04:21:48 +0000 (GMT)
Received: from epdlp11prp1 (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bxcZ35KBNz2SSKd; Wed,  6 Aug
	2025 04:21:47 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250806042146epcas5p4d916e621212bc881b130d1ceb67bbc19~ZErb4eJEK1040110401epcas5p4C;
	Wed,  6 Aug 2025 04:21:46 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250806042144epsmtip2b93f14d13914d3066c3780cb4ac44956~ZErZnZ5cc2224922249epsmtip2T;
	Wed,  6 Aug 2025 04:21:44 +0000 (GMT)
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
In-Reply-To: <3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Wed, 6 Aug 2025 09:51:43 +0530
Message-ID: <06d201dc0689$9f438200$ddca8600$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQGIhTOigFb9OSA/zLmmRAowhNFqCwJZOa1wAh4tdyIBxgZwxgI/ArKTAmrI7FMCp5bdBAEsJt2OAdY+bWECqijPQgIPv58TAQlCtSUCbRSB8gJXYzfzAduHMka0FGM9kA==
X-CMS-MailID: 20250806042146epcas5p4d916e621212bc881b130d1ceb67bbc19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d
References: <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
	<jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
	<fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
	<1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
	<2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
	<11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
	<jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
	<CGME20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d@epcas5p4.samsung.com>
	<b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
	<061b01dc062d$25c47800$714d6800$@samsung.com>
	<i6eyiscdf2554znc4aaglhi22opfgyicif3y7kzjafwsrtdrtm@jjpzak64gdft>
	<061c01dc062f$70ec34b0$52c49e10$@samsung.com>
	<87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
	<061d01dc0631$c1766c00$44634400$@samsung.com>
	<3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>



> -----Original Message-----
> From: Konrad Dybcio <konrad.dybcio=40oss.qualcomm.com>
> Sent: Tuesday, August 5, 2025 11:57 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Manivannan Sadhasivam'
> <mani=40kernel.org>
> Cc: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Ram Kumar Dwivedi'
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
> On 8/5/25 7:52 PM, Alim Akhtar wrote:
> >
> >
> >> -----Original Message-----
> >> From: Konrad Dybcio <konrad.dybcio=40oss.qualcomm.com>
> >> Sent: Tuesday, August 5, 2025 11:10 PM
> >> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Manivannan Sadhasivam'
> >> <mani=40kernel.org>
> >> Cc: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Ram Kumar Dwivedi'
> >> <quic_rdwivedi=40quicinc.com>; avri.altman=40wdc.com;
> bvanassche=40acm.org;
> >> robh=40kernel.org; krzk+dt=40kernel.org;
> >> conor+dt=40kernel.org; andersson=40kernel.org; konradybcio=40kernel.or=
g;
> >> James.Bottomley=40hansenpartnership.com;
> martin.petersen=40oracle.com;
> >> agross=40kernel.org; linux-arm-msm=40vger.kernel.org; linux-
> >> scsi=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> >> kernel=40vger.kernel.org
> >> Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear and ra=
te
> >> limit properties to UFS
> >>
> >> On 8/5/25 7:36 PM, Alim Akhtar wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> >>>> Sent: Tuesday, August 5, 2025 10:52 PM
> >>>> To: Alim Akhtar <alim.akhtar=40samsung.com>
> >>>> Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzysztof
> >>>> Kozlowski' <krzk=40kernel.org>; 'Ram Kumar Dwivedi'
> >>>> <quic_rdwivedi=40quicinc.com>; avri.altman=40wdc.com;
> >> bvanassche=40acm.org;
> >>>> robh=40kernel.org; krzk+dt=40kernel.org;
> >>>> conor+dt=40kernel.org; andersson=40kernel.org;
> konradybcio=40kernel.org;
> >>>> James.Bottomley=40hansenpartnership.com;
> >> martin.petersen=40oracle.com;
> >>>> agross=40kernel.org; linux-arm-msm=40vger.kernel.org; linux-
> >>>> scsi=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> >>>> kernel=40vger.kernel.org
> >>>> Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear and
> >>>> rate limit properties to UFS
> >>>>
> >>>> On Tue, Aug 05, 2025 at 10:49:45PM GMT, Alim Akhtar wrote:
> >>>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Konrad Dybcio <konrad.dybcio=40oss.qualcomm.com>
> >>>>>> Sent: Tuesday, August 5, 2025 10:36 PM
> >>>>>> To: Manivannan Sadhasivam <mani=40kernel.org>
> >>>>>> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Ram Kumar Dwivedi
> >>>>>> <quic_rdwivedi=40quicinc.com>; alim.akhtar=40samsung.com;
> >>>>>> avri.altman=40wdc.com; bvanassche=40acm.org; robh=40kernel.org;
> >>>>>> krzk+dt=40kernel.org; conor+dt=40kernel.org; andersson=40kernel.or=
g;
> >>>>>> konradybcio=40kernel.org;
> James.Bottomley=40hansenpartnership.com;
> >>>>>> martin.petersen=40oracle.com; agross=40kernel.org; linux-arm-
> >>>>>> msm=40vger.kernel.org; linux-scsi=40vger.kernel.org;
> >>>>>> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org
> >>>>>> Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear an=
d
> >>>>>> rate limit properties to UFS
> >>>>>>
> >>>>>> On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
> >>>>>>> On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
> >>>>>>>> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> >>>>>>>>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski
> >> wrote:
> >>>>>>>>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> >>>>>>>>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski
> >>>> wrote:
> >>>>>>>>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> >>>>>>>>>>>>>> Add optional limit-hs-gear and limit-rate properties to
> >>>>>>>>>>>>>> the UFS node to support automotive use cases that
> require
> >>>>>>>>>>>>>> limiting the maximum Tx/Rx HS gear and rate due to
> >> hardware
> >>>> constraints.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> What hardware constraints? This needs to be clearly
> >>>> documented.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Ram, both Krzysztof and I asked this question, but you
> >>>>>>>>>>>> never bothered to reply, but keep on responding to other
> comments.
> >>>>>>>>>>>> This won't help you to get this series merged in any form.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Please address *all* review comments before posting next
> >>>> iteration.
> >>>>>>>>>>>
> >>>>>>>>>>> Hi Mani,
> >>>>>>>>>>>
> >>>>>>>>>>> Apologies for the delay in responding.
> >>>>>>>>>>> I had planned to explain the hardware constraints in the
> >>>>>>>>>>> next
> >>>>>> patchset=E2=80=99s=20commit=20message,=20which=20is=20why=20I=20di=
dn=E2=80=99t=20reply=20earlier.=0D=0A>=20>>>>>>>>>>>=0D=0A>=20>>>>>>>>>>>=
=20To=20clarify:=20the=20limitations=20are=20due=20to=20customer=20board=0D=
=0A>=20>>>>>>>>>>>=20designs,=20not=20our=0D=0A>=20>>>>>>=20SoC.=20Some=20b=
oards=20can't=20support=20higher=20gear=20operation,=20hence=20the=0D=0A>=
=20>>>>>>=20need=20for=20optional=20limit-hs-gear=20and=20limit-rate=20prop=
erties.=0D=0A>=20>>>>>>>>>>>=0D=0A>=20>>>>>>>>>>=0D=0A>=20>>>>>>>>>>=20That=
's=20vague=20and=20does=20not=20justify=20the=20property.=20You=20need=20to=
=0D=0A>=20>>>>>>>>>>=20document=20instead=20hardware=20capabilities=20or=20=
characteristic.=20Or=0D=0A>=20>>>>>>>>>>=20explain=20why=20they=20cannot.=
=20With=20such=20form=20I=20will=20object=20to=20your=0D=0A>=20>>>>>>>>>>=
=20next=0D=0A>=20>>>>>>=20patch.=0D=0A>=20>>>>>>>>>>=0D=0A>=20>>>>>>>>>=0D=
=0A>=20>>>>>>>>>=20I=20had=20an=20offline=20chat=20with=20Ram=20and=20got=
=20clarified=20on=20what=20these=0D=0A>=20>>>>>>>>>=20properties=0D=0A>=20>=
>>>>>=20are.=0D=0A>=20>>>>>>>>>=20The=20problem=20here=20is=20not=20with=20=
the=20SoC,=20but=20with=20the=20board=20design.=0D=0A>=20>>>>>>>>>=20On=20s=
ome=20Qcom=20customer=20designs,=20both=20the=20UFS=20controller=20in=20the=
=0D=0A>=20>>>>>>>>>=20SoC=20and=20the=20UFS=20device=20are=20capable=20of=
=20operating=20at=20higher=0D=0A>=20>>>>>>>>>=20gears=20(say=0D=0A>=20>>>>=
=20G5).=0D=0A>=20>>>>>>>>>=20But=20due=20to=20board=20constraints=20like=20=
poor=20thermal=20dissipation,=0D=0A>=20>>>>>>>>>=20routing=20loss,=20the=20=
board=20cannot=20efficiently=20operate=20at=20the=0D=0A>=20>>>>>>>>>=20high=
er=0D=0A>=20>>>>=20speeds.=0D=0A>=20>>>>>>>>>=0D=0A>=20>>>>>>>>>=20So=20the=
=20customers=20wanted=20a=20way=20to=20limit=20the=20gear=20speed=20(say=20=
G3)=0D=0A>=20>>>>>>>>>=20and=20rate=20(say=20Mode-A)=20on=20the=20specific=
=20board=20DTS.=0D=0A>=20>>>>>>>>=0D=0A>=20>>>>>>>>=20I'm=20not=20necessari=
ly=20saying=20no,=20but=20have=20you=20explored=20sysfs=20for=0D=0A>=20this=
?=0D=0A>=20>>>>>>>>=0D=0A>=20>>>>>>>>=20I=20suppose=20it=20may=20be=20too=
=20late=20(if=20the=20driver=20would=20e.g.=20init=20the=0D=0A>=20>>>>>>>>=
=20UFS=20at=20max=20gear/rate=20at=20probe=20time,=20it=20could=20cause=20h=
avoc=20as=20it=0D=0A>=20>>>>>>>>=20tries=20to=20load=20the=20userland)..=0D=
=0A>=20>>>>>>>>=0D=0A>=20>>>>>>>=0D=0A>=20>>>>>>>=20If=20the=20driver=20tri=
es=20to=20run=20with=20unsupported=20max=20gear=20speed/mode,=0D=0A>=20>>>>=
>>>=20it=20will=20just=20crash=20with=20the=20error=20spit.=0D=0A>=20>>>>>>=
=0D=0A>=20>>>>>>=20OK=0D=0A>=20>>>>>>=0D=0A>=20>>>>>>=20just=20a=20couple=
=20related=20nits=20that=20I=20won't=20bother=20splitting=20into=0D=0A>=20>=
>>>>>=20separate=20emails=0D=0A>=20>>>>>>=0D=0A>=20>>>>>>=20rate=20(mode?=
=20I'm=20seeing=20both=20names)=20should=20probably=20have=0D=0A>=20>>>>>>=
=20dt-bindings=20defines=20while=20gear=20doesn't=20have=20to=20since=20the=
y're=0D=0A>=20>>>>>>=20called=20G<number>=20anyway,=20with=20the=20bindings=
=20description=20strongly=0D=0A>=20>>>>>>=20discouraging=20use,=20unless=20=
absolutely=20necessary=20(e.g.=20in=20the=0D=0A>=20>>>>>>=20situation=20we=
=20have=20right=0D=0A>=20>>>>>>=20there)=0D=0A>=20>>>>>>=0D=0A>=20>>>>>>=20=
I'd=20also=20assume=20the=20code=20should=20be=20moved=20into=20the=20ufs-c=
ommon=0D=0A>=20>>>>>>=20code,=20rather=20than=20making=20it=20ufs-qcom=20sp=
ecific=0D=0A>=20>>>>>>=0D=0A>=20>>>>>>=20Konrad=0D=0A>=20>>>>>=20Since=20th=
is=20is=20a=20board=20specific=20constrains=20and=20not=20a=20SoC=0D=0A>=20=
>>>>>=20properties,=20have=20an=0D=0A>=20>>>>=20option=20of=20handling=20th=
is=20via=20bootloader=20is=20explored?=0D=0A>=20>>>>=0D=0A>=20>>>>=20Both=
=20board=20and=20SoC=20specific=20properties=20*should*=20be=20described=20=
in=0D=0A>=20>>>>=20devicetree=20if=20they=20are=20purely=20describing=20the=
=20hardware.=0D=0A>=20>>>>=0D=0A>=20>>>=20Agreed,=20what=20I=20understood=
=20from=20above=20conversation=20is=20that,=20we=20are=0D=0A>=20>>>=20try=
=20to=20solve=20a=20very=20*specific*=20board=20problem=20here,=20this=20do=
es=20not=0D=0A>=20>>>=20looks=20like=20a=0D=0A>=20>>=20generic=20problem=20=
to=20me=20and=20probably=20should=20be=20handled=20within=20the=0D=0A>=20>>=
=20specific=20driver.=0D=0A>=20>>=0D=0A>=20>>=20Introducing=20generic=20sol=
utions=20preemptively=20for=20problems=20that=20are=0D=0A>=20>>=20simple=20=
in=20concept=20and=20can=20occur=20widely=20is=20good=20practice=20(althoug=
h=0D=0A>=20>>=20it's=20sometimes=20hard=20to=20gauge=20whether=20this=20is=
=20a=20one-off),=20as=20if=20the=0D=0A>=20>>=20issue=20spreads=20a=20generi=
c=20solution=20will=20appear=20at=20some=20point,=20but=20we'll=0D=0A>=20>>=
=20have=20to=20keep=20supporting=20the=20odd=20ones=20as=20well=0D=0A>=20>>=
=0D=0A>=20>=20Ok,=0D=0A>=20>=20I=20would=20prefer=20if=20we=20add=20a=20pro=
perty=20which=20sounds=20like=20=22poor=20thermal=0D=0A>=20>=20dissipation=
=22=20or=20=22routing=20channel=20loss=22=20rather=20than=20adding=20limiti=
ng=20UFS=20gear=0D=0A>=20properties.=0D=0A>=20>=20Poor=20thermal=20design=
=20or=20channel=20losses=20are=20generic=20enough=20and=20can=20happen=0D=
=0A>=20on=20any=20board.=0D=0A>=20=0D=0A>=20This=20is=20exactly=20what=20I'=
m=20trying=20to=20avoid=20through=20my=20suggestion=20-=20one=20board=0D=0A=
>=20may=20have=20poor=20thermal=20dissipation,=20another=20may=20have=20cha=
nnel=20losses,=20yet=0D=0A>=20another=20one=20may=20feature=20a=20special=
=20batch=20of=20UFS=20chips=20that=20will=20set=20the=20world=0D=0A>=20on=
=20fire=20if=20instructed=20to=20attempt=20link=20training=20at=20gear=207=
=20-=20they=20all=20are=20causes,=20as=0D=0A>=20opposed=20to=20describing=
=20what=20needs=20to=20happen=20(i.e.=20what=20the=20hardware=20must=0D=0A>=
=20be=20treated=20as=20-=20gear=20N=20incapable=20despite=20what=20can=20be=
=20discovered=20at=20runtime),=0D=0A>=20with=20perhaps=20a=20comment=20on=
=20the=20side=0D=0A>=20=0D=0ABut=20the=20solution=20for=20all=20possible=20=
board=20problems=20can't=20be=20by=20limiting=20Gear=20speed.=0D=0ASo=20it=
=20should=20be=20known=20why=20one=20particular=20board=20need=20to=20limit=
=20the=20gear.=0D=0AI=20understand=20that=20this=20is=20a=20static=20config=
uration,=20where=20it=20is=20already=20known=20that=20board=20is=20broken=
=20for=20higher=20Gear.=0D=0ACan=20this=20be=20achieved=20by=20limiting=20t=
he=20clock?=20If=20not,=20can=20we=20add=20a=20board=20specific=20_quirk_=
=20and=20let=20the=20_quirk_=20to=20be=20enabled=20from=20vendor=20specific=
=20hooks?=20=0D=0A=0D=0A>=20Konrad=0D=0A=0D=0A

