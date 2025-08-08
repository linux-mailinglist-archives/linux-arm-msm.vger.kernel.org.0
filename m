Return-Path: <linux-arm-msm+bounces-68129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 521ADB1EB21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 17:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D990E7A1508
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 15:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A387F280037;
	Fri,  8 Aug 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YeblZxfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1778F36
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754665699; cv=none; b=Yc26YVcLGYf/HHBEnCr4LwSmDF5yKHid+8Qn/2029rDZwGLrEdNS1KTaup+fHAqZNjSAhuqZxxKxpYVcTIBQm/W66VUZYYCB7T57S/C3dKts99qTvA+sB8FOn/YGaGqPhy/klfK2B/HYllpRyl0WNoE6ltvzs4j2fRMFRzYLPpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754665699; c=relaxed/simple;
	bh=KbyBa2RMxGvUa2qTjS8DYpX+dKFyENEXQ3F7PVCsezM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=iYBY0VdxNbImQBsA39zTMLyZGmOqKPrGcr2QkdNhw/m9KBcrUtCexD43QoY8UbYcrvtcWRM3NEdNvHR7U7D4bQGfMHuLZERBjf9xFJ+RZOq4j1PtyTfYsHg1Mc9+z22ryGyWuokUxHDbo7kzXvqDbvg8YocghTXzcUH0QAUzMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YeblZxfC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250808150815epoutp030a0f08917e433fb8fe4689f4630a97f5~Z0ydH2XpV1198611986epoutp03w
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 15:08:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250808150815epoutp030a0f08917e433fb8fe4689f4630a97f5~Z0ydH2XpV1198611986epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754665695;
	bh=KbyBa2RMxGvUa2qTjS8DYpX+dKFyENEXQ3F7PVCsezM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YeblZxfCRgVAJ8Yhk6OeVGS4jBSJVQgSw4NoEDq8vypGi4G2OIvH2FK8R3EIsbqW0
	 G0LfWv9ovZUUVCvze7Y/PaFncOSoG0USMMFQ8E4IulrWrPa+MBCmsy7axwL2pW/jBl
	 FPwN/1wvT/oa73OJ5G5pzr6sEWjKivAIMB+0Xn0w=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250808150814epcas5p1819cab380f954c265dfc00d7557e35e9~Z0ycfsPfM2113721137epcas5p1t;
	Fri,  8 Aug 2025 15:08:14 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bz6q20zKBz3hhT3; Fri,  8 Aug
	2025 15:08:14 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250808150813epcas5p3eb081f2f6e90a15593e545ced68435f1~Z0ya_Ijdo2389323893epcas5p3J;
	Fri,  8 Aug 2025 15:08:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250808150810epsmtip1f6ba1f6f143b53b5c12bf28410693323~Z0yYxxj3c1978819788epsmtip1Y;
	Fri,  8 Aug 2025 15:08:10 +0000 (GMT)
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
In-Reply-To: <fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
Subject: RE: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Date: Fri, 8 Aug 2025 20:38:09 +0530
Message-ID: <0f8c01dc0876$427cf1c0$c776d540$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEJQrUlLhd2k13YhwqtNcYaDataOQJtFIHyAldjN/MB24cyRgGnpjwRAmX4p5MB936htgLh1QaLARPOx0QCD7g8CwGFQGz5tVzi6iA=
X-CMS-MailID: 20250808150813epcas5p3eb081f2f6e90a15593e545ced68435f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60
References: <061c01dc062f$70ec34b0$52c49e10$@samsung.com>
	<87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
	<061d01dc0631$c1766c00$44634400$@samsung.com>
	<3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
	<06d201dc0689$9f438200$ddca8600$@samsung.com>
	<wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
	<06f301dc0695$6bf25690$43d703b0$@samsung.com>
	<CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
	<nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
	<0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
	<fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>



> -----Original Message-----
> From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> Sent: Friday, August 8, 2025 6:14 PM
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
> On Thu, Aug 07, 2025 at 10:08:32PM GMT, Alim Akhtar wrote:
> >
> >
> > > -----Original Message-----
> > > From: 'Manivannan Sadhasivam' <mani=40kernel.org>
> > > Sent: Wednesday, August 6, 2025 4:56 PM
> > > To: Alim Akhtar <alim.akhtar=40samsung.com>
> > > Cc: 'Konrad Dybcio' <konrad.dybcio=40oss.qualcomm.com>; 'Krzysztof
> > =5B...=5D
> >
> > > > >
> > > > > On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:
> > > > >
> > > > > =5B...=5D
> > > > >
> > > > > > > >> Introducing generic solutions preemptively for problems
> > > > > > > >> that are simple in concept and can occur widely is good
> > > > > > > >> practice (although it's sometimes hard to gauge whether
> > > > > > > >> this is a one-off), as if the issue spreads a generic
> > > > > > > >> solution will appear at some point, but we'll have to
> > > > > > > >> keep supporting the odd ones as well
> > > > > > > >>
> > > > > > > > Ok,
> > > > > > > > I would prefer if we add a property which sounds like
> > > > > > > > =22poor thermal dissipation=22 or =22routing channel loss=
=22
> > > > > > > > rather than adding limiting UFS gear
> > > > > > > properties.
> > > > > > > > Poor thermal design or channel losses are generic enough
> > > > > > > > and can happen
> > > > > > > on any board.
> > > > > > >
> > > > > > > This is exactly what I'm trying to avoid through my
> > > > > > > suggestion - one board may have poor thermal dissipation,
> > > > > > > another may have channel losses, yet another one may feature
> > > > > > > a special batch of UFS chips that will set the world on fire
> > > > > > > if instructed to attempt link training at gear 7 - they all
> > > > > > > are causes, as opposed to describing what needs to happen
> > > > > > > (i.e. what the hardware must be treated as - gear N
> > > > > > > incapable despite what can be discovered at runtime), with
> > > > > > > perhaps a comment on the side
> > > > > > >
> > > > > > But the solution for all possible board problems can't be by
> > > > > > limiting Gear
> > > > > speed.
> > > > >
> > > > > Devicetree properties should precisely reflect how they are
> > > > > relevant to the hardware. 'limiting-gear-speed' is
> > > > > self-explanatory that the gear speed is getting limited (for a
> > > > > reason), but the devicetree doesn't need to describe the
> > > > > *reason* itself.
> > > > >
> > > > > > So it should be known why one particular board need to limit th=
e
> gear.
> > > > >
> > > > > That goes into the description, not in the property name.
> > > > >
> > > > > > I understand that this is a static configuration, where it is
> > > > > > already known
> > > > > that board is broken for higher Gear.
> > > > > > Can this be achieved by limiting the clock? If not, can we add
> > > > > > a board
> > > > > specific _quirk_ and let the _quirk_ to be enabled from vendor
> > > > > specific hooks?
> > > > > >
> > > > >
> > > > > How can we limit the clock without limiting the gears? When we
> > > > > limit the gear/mode, both clock and power are implicitly limited.
> > > > >
> > > > Possibly someone need to check with designer of the SoC if that is
> > > > possible
> > > or not.
> > >
> > > It's not just clock. We need to consider reducing regulator,
> > > interconnect votes also. But as I said above, limiting the gear/mode
> > > will take care of all these parameters.
> > >
> > > > Did we already tried _quirk_? If not, why not?
> > > > If the board is so poorly designed and can't take care of the
> > > > channel loses or heat dissipation etc, Then I assumed the gear
> > > > negotiation between host and device should fail for the higher
> > > > gear and driver can have
> > > a re-try logic to re-init / re-try =22power mode change=22 at the low=
er
> > > gear. Is that not possible / feasible?
> > > >
> > >
> > > I don't see why we need to add extra logic in the UFS driver if we
> > > can extract that information from DT.
> > >
> > You didn=E2=80=99t=20answer=20my=20question=20entirely,=20I=20am=20stil=
l=20not=20able=20to=0D=0A>=20>=20visualised=20how=20come=20Linkup=20is=20ha=
ppening=20in=20higher=20gear=20and=20then=20Suddenly=0D=0A>=20it=20is=20fai=
ling=20and=20we=20need=20to=20reduce=20the=20gear=20to=20solve=20that?=0D=
=0A>=20=0D=0A>=20Oh=20well,=20this=20is=20the=20source=20of=20confusion=20h=
ere.=20I=20didn't=20(also=20the=20patch)=20claim=0D=0A>=20that=20the=20link=
=20up=20will=20happen=20with=20higher=20speed.=20It=20will=20most=20likely=
=20fail=20if=20it=0D=0A>=20couldn't=20operate=20at=20the=20higher=20speed=
=20and=20that's=20why=20we=20need=20to=20limit=20it=20to=0D=0A>=20lower=20g=
ear/mode=20*before*=20bringing=20the=20link=20up.=0D=0A>=20=0D=0ARight,=20t=
hat's=20why=20a=20re-try=20logic=20to=20negotiate=20a=20__working__=20power=
=20mode=20change=20can=20help,=20instead=20of=20introducing=20new=20binding=
=20for=20this=20case.=0D=0AAnd=20that=20approach=20can=20be=20useful=20for=
=20many=20platforms.=0D=0AAnyway=20coming=20back=20with=20the=20same=20poin=
t=20again=20and=20again=20is=20not=20productive.=0D=0AI=20gave=20my=20opini=
on=20and=20suggestions.=20Rest=20is=20on=20the=20maintainers.=0D=0A=0D=0A>=
=20As=20you=20can=20see,=20the=20driver=20patch=20is=20parsing=20the=20limi=
ts=20in=20its=0D=0A>=20ufs_hba_variant_ops::init()=20callback,=20which=20ge=
ts=20called=20during=0D=0A>=20ufshcd_hba_init().=0D=0A>=20=0D=0A>=20-=20Man=
i=0D=0A>=20=0D=0A>=20--=0D=0A>=20=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=
=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=AF=8D=20=E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=
=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=8D=0D=0A=0D=0A

