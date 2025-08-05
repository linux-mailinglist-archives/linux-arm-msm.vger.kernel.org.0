Return-Path: <linux-arm-msm+bounces-67809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FCB1B99D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 19:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00349170512
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 17:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB332957B6;
	Tue,  5 Aug 2025 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AFdkGlah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13066292936
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416376; cv=none; b=a2nFD8fKgYI69AlH7K1cZCddxdgUkT8bO0z635Vz3zYuHdiARciIZuJMutr5J8JPERLEzU5A8eWxfInGJU+FzUPvo373XbA7q8nB5/4PdguUasO86uIh/z2uS33oA6SH0VnFu8F+O5M32hoDHbcY1jy1OQEL7TlhPn5zEhOxjnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416376; c=relaxed/simple;
	bh=5MUadVaHGWCCq7FrAKqmnucwszJgzQvQi8cO+yh91iw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=WZJJSoATUyhiYEotgiQYMzkrKqG+9hajowX1dfSLgvthfXhbOEN0tNsd+hs3XJmv4TtstkAcAMso99Gxyz5G5D9ZJCtmhKYeUZElTcNXDf8NcAgUHOHQofVSTg+frUX3CBZYzHqSSOcP0fTeWfYEakpWIlZ4f3qWYhRrGETwPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AFdkGlah; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250805175251epoutp01350250e455bac7d69b31f9093f02a96e~Y8GUbWZ4d1068510685epoutp01U
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 17:52:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250805175251epoutp01350250e455bac7d69b31f9093f02a96e~Y8GUbWZ4d1068510685epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754416371;
	bh=5MUadVaHGWCCq7FrAKqmnucwszJgzQvQi8cO+yh91iw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=AFdkGlahhTx39saNIhODGHW/cfE1K4Ge/G8yCo08S16tOLpQu7u8PvqN2QaK1NA62
	 z1CtTylQ4hNvMlTDJxWIBFN8AK05fwH6kcsFPi7dVVlHn9NQ7WpEagE4hq0vQVPLPB
	 nUuyDi000jo+R39LxHwNqLHn7myHy7Ghtxznr/Mg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250805175250epcas5p486b669aaa074a9dd5a014a1737e3e987~Y8GTHHlyF0392303923epcas5p4X;
	Tue,  5 Aug 2025 17:52:50 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bxLcK5jqhz6B9m4; Tue,  5 Aug
	2025 17:52:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250805175248epcas5p1ac576a2bfa05ed08b0c6a35aaac46505~Y8GRMM1bY3243532435epcas5p1G;
	Tue,  5 Aug 2025 17:52:48 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805175246epsmtip12599070b04d8a6154696658672b8c423~Y8GO_GAql0790907909epsmtip13;
	Tue,  5 Aug 2025 17:52:45 +0000 (GMT)
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
In-Reply-To: <87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Tue, 5 Aug 2025 23:22:44 +0530
Message-ID: <061d01dc0631$c1766c00$44634400$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQGIhTOigFb9OSA/zLmmRAowhNFqCwJZOa1wAh4tdyIBxgZwxgI/ArKTAmrI7FMCp5bdBAEsJt2OAdY+bWECqijPQgIPv58TAQlCtSUCbRSB8rQ1S7YA
X-CMS-MailID: 20250805175248epcas5p1ac576a2bfa05ed08b0c6a35aaac46505
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



> -----Original Message-----
> From: Konrad Dybcio <konrad.dybcio=40oss.qualcomm.com>
> Sent: Tuesday, August 5, 2025 11:10 PM
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
> On 8/5/25 7:36 PM, Alim Akhtar wrote:
> >
> >
> >> -----Original Message-----
> >> From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> >> Sent: Tuesday, August 5, 2025 10:52 PM
> >> To: Alim Akhtar <alim.akhtar=40samsung.com>
> >> Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzysztof
> >> Kozlowski' <krzk=40kernel.org>; 'Ram Kumar Dwivedi'
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
> >> On Tue, Aug 05, 2025 at 10:49:45PM GMT, Alim Akhtar wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Konrad Dybcio <konrad.dybcio=40oss.qualcomm.com>
> >>>> Sent: Tuesday, August 5, 2025 10:36 PM
> >>>> To: Manivannan Sadhasivam <mani=40kernel.org>
> >>>> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Ram Kumar Dwivedi
> >>>> <quic_rdwivedi=40quicinc.com>; alim.akhtar=40samsung.com;
> >>>> avri.altman=40wdc.com; bvanassche=40acm.org; robh=40kernel.org;
> >>>> krzk+dt=40kernel.org; conor+dt=40kernel.org; andersson=40kernel.org;
> >>>> konradybcio=40kernel.org; James.Bottomley=40hansenpartnership.com;
> >>>> martin.petersen=40oracle.com; agross=40kernel.org; linux-arm-
> >>>> msm=40vger.kernel.org; linux-scsi=40vger.kernel.org;
> >>>> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org
> >>>> Subject: Re: =5BPATCH 2/3=5D arm64: dts: qcom: sa8155: Add gear and
> >>>> rate limit properties to UFS
> >>>>
> >>>> On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
> >>>>> On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
> >>>>>> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> >>>>>>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski
> wrote:
> >>>>>>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> >>>>>>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski
> >> wrote:
> >>>>>>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> >>>>>>>>>>>> Add optional limit-hs-gear and limit-rate properties to the
> >>>>>>>>>>>> UFS node to support automotive use cases that require
> >>>>>>>>>>>> limiting the maximum Tx/Rx HS gear and rate due to
> hardware
> >> constraints.
> >>>>>>>>>>>
> >>>>>>>>>>> What hardware constraints? This needs to be clearly
> >> documented.
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Ram, both Krzysztof and I asked this question, but you never
> >>>>>>>>>> bothered to reply, but keep on responding to other comments.
> >>>>>>>>>> This won't help you to get this series merged in any form.
> >>>>>>>>>>
> >>>>>>>>>> Please address *all* review comments before posting next
> >> iteration.
> >>>>>>>>>
> >>>>>>>>> Hi Mani,
> >>>>>>>>>
> >>>>>>>>> Apologies for the delay in responding.
> >>>>>>>>> I had planned to explain the hardware constraints in the next
> >>>> patchset=E2=80=99s=20commit=20message,=20which=20is=20why=20I=20didn=
=E2=80=99t=20reply=20earlier.=0D=0A>=20>>>>>>>>>=0D=0A>=20>>>>>>>>>=20To=20=
clarify:=20the=20limitations=20are=20due=20to=20customer=20board=20designs,=
=0D=0A>=20>>>>>>>>>=20not=20our=0D=0A>=20>>>>=20SoC.=20Some=20boards=20can'=
t=20support=20higher=20gear=20operation,=20hence=20the=0D=0A>=20>>>>=20need=
=20for=20optional=20limit-hs-gear=20and=20limit-rate=20properties.=0D=0A>=
=20>>>>>>>>>=0D=0A>=20>>>>>>>>=0D=0A>=20>>>>>>>>=20That's=20vague=20and=20d=
oes=20not=20justify=20the=20property.=20You=20need=20to=0D=0A>=20>>>>>>>>=
=20document=20instead=20hardware=20capabilities=20or=20characteristic.=20Or=
=0D=0A>=20>>>>>>>>=20explain=20why=20they=20cannot.=20With=20such=20form=20=
I=20will=20object=20to=20your=0D=0A>=20>>>>>>>>=20next=0D=0A>=20>>>>=20patc=
h.=0D=0A>=20>>>>>>>>=0D=0A>=20>>>>>>>=0D=0A>=20>>>>>>>=20I=20had=20an=20off=
line=20chat=20with=20Ram=20and=20got=20clarified=20on=20what=20these=0D=0A>=
=20>>>>>>>=20properties=0D=0A>=20>>>>=20are.=0D=0A>=20>>>>>>>=20The=20probl=
em=20here=20is=20not=20with=20the=20SoC,=20but=20with=20the=20board=20desig=
n.=0D=0A>=20>>>>>>>=20On=20some=20Qcom=20customer=20designs,=20both=20the=
=20UFS=20controller=20in=20the=0D=0A>=20>>>>>>>=20SoC=20and=20the=20UFS=20d=
evice=20are=20capable=20of=20operating=20at=20higher=20gears=0D=0A>=20>>>>>=
>>=20(say=0D=0A>=20>>=20G5).=0D=0A>=20>>>>>>>=20But=20due=20to=20board=20co=
nstraints=20like=20poor=20thermal=20dissipation,=0D=0A>=20>>>>>>>=20routing=
=20loss,=20the=20board=20cannot=20efficiently=20operate=20at=20the=20higher=
=0D=0A>=20>>=20speeds.=0D=0A>=20>>>>>>>=0D=0A>=20>>>>>>>=20So=20the=20custo=
mers=20wanted=20a=20way=20to=20limit=20the=20gear=20speed=20(say=20G3)=0D=
=0A>=20>>>>>>>=20and=20rate=20(say=20Mode-A)=20on=20the=20specific=20board=
=20DTS.=0D=0A>=20>>>>>>=0D=0A>=20>>>>>>=20I'm=20not=20necessarily=20saying=
=20no,=20but=20have=20you=20explored=20sysfs=20for=20this?=0D=0A>=20>>>>>>=
=0D=0A>=20>>>>>>=20I=20suppose=20it=20may=20be=20too=20late=20(if=20the=20d=
river=20would=20e.g.=20init=20the=0D=0A>=20>>>>>>=20UFS=20at=20max=20gear/r=
ate=20at=20probe=20time,=20it=20could=20cause=20havoc=20as=20it=0D=0A>=20>>=
>>>>=20tries=20to=20load=20the=20userland)..=0D=0A>=20>>>>>>=0D=0A>=20>>>>>=
=0D=0A>=20>>>>>=20If=20the=20driver=20tries=20to=20run=20with=20unsupported=
=20max=20gear=20speed/mode,=0D=0A>=20>>>>>=20it=20will=20just=20crash=20wit=
h=20the=20error=20spit.=0D=0A>=20>>>>=0D=0A>=20>>>>=20OK=0D=0A>=20>>>>=0D=
=0A>=20>>>>=20just=20a=20couple=20related=20nits=20that=20I=20won't=20bothe=
r=20splitting=20into=0D=0A>=20>>>>=20separate=20emails=0D=0A>=20>>>>=0D=0A>=
=20>>>>=20rate=20(mode?=20I'm=20seeing=20both=20names)=20should=20probably=
=20have=20dt-bindings=0D=0A>=20>>>>=20defines=20while=20gear=20doesn't=20ha=
ve=20to=20since=20they're=20called=20G<number>=0D=0A>=20>>>>=20anyway,=20wi=
th=20the=20bindings=20description=20strongly=20discouraging=20use,=0D=0A>=
=20>>>>=20unless=20absolutely=20necessary=20(e.g.=20in=20the=20situation=20=
we=20have=20right=0D=0A>=20>>>>=20there)=0D=0A>=20>>>>=0D=0A>=20>>>>=20I'd=
=20also=20assume=20the=20code=20should=20be=20moved=20into=20the=20ufs-comm=
on=20code,=0D=0A>=20>>>>=20rather=20than=20making=20it=20ufs-qcom=20specifi=
c=0D=0A>=20>>>>=0D=0A>=20>>>>=20Konrad=0D=0A>=20>>>=20Since=20this=20is=20a=
=20board=20specific=20constrains=20and=20not=20a=20SoC=20properties,=0D=0A>=
=20>>>=20have=20an=0D=0A>=20>>=20option=20of=20handling=20this=20via=20boot=
loader=20is=20explored?=0D=0A>=20>>=0D=0A>=20>>=20Both=20board=20and=20SoC=
=20specific=20properties=20*should*=20be=20described=20in=0D=0A>=20>>=20dev=
icetree=20if=20they=20are=20purely=20describing=20the=20hardware.=0D=0A>=20=
>>=0D=0A>=20>=20Agreed,=20what=20I=20understood=20from=20above=20conversati=
on=20is=20that,=20we=20are=20try=0D=0A>=20>=20to=20solve=20a=20very=20*spec=
ific*=20board=20problem=20here,=20this=20does=20not=20looks=20like=20a=0D=
=0A>=20generic=20problem=20to=20me=20and=20probably=20should=20be=20handled=
=20within=20the=20specific=0D=0A>=20driver.=0D=0A>=20=0D=0A>=20Introducing=
=20generic=20solutions=20preemptively=20for=20problems=20that=20are=20simpl=
e=20in=0D=0A>=20concept=20and=20can=20occur=20widely=20is=20good=20practice=
=20(although=20it's=20sometimes=20hard=0D=0A>=20to=20gauge=20whether=20this=
=20is=20a=20one-off),=20as=20if=20the=20issue=20spreads=20a=20generic=20sol=
ution=0D=0A>=20will=20appear=20at=20some=20point,=20but=20we'll=20have=20to=
=20keep=20supporting=20the=20odd=20ones=20as=0D=0A>=20well=0D=0A>=20=0D=0AO=
k,=20=0D=0AI=20would=20prefer=20if=20we=20add=20a=20property=20which=20soun=
ds=20like=20=22poor=20thermal=20dissipation=22=20or=20=0D=0A=22routing=20ch=
annel=20loss=22=20rather=20than=20adding=20limiting=20UFS=20gear=20properti=
es.=20=0D=0APoor=20thermal=20design=20or=20channel=20losses=20are=20generic=
=20enough=20and=20can=20happen=20on=20any=20board.=0D=0A=0D=0A>=20Konrad=0D=
=0A=0D=0A

