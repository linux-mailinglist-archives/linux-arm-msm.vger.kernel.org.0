Return-Path: <linux-arm-msm+bounces-95239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOo5LGeXp2nciQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 03:22:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2F1F9D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 03:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603E03059F3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 02:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9155927A10F;
	Wed,  4 Mar 2026 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ke5b95JG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOXoiaxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C5D258EE0
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772590948; cv=none; b=NeuffWWGVnSe3x2F433uWgY4xS6FDTprlfuyBpgN5JmcluXbUycgm0WnAoTSM2QTGwUoM4+aiW3IIxFPCXR/iEGqEiL/D32LE0n3WjVbhtx7eUhZsuDO56dV4buFx3bm0J9wJXGY5IAhm0KxTNY2OE8cYRKJ+MJp1gtBqa/+/CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772590948; c=relaxed/simple;
	bh=VdtpYHZjRS/j9qu2wAdVCGilkVqNkfCteNZkmARxS9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eU1TzncS7Ube8PdyPwl30UXzaLfMRU2GrCaTmez1u/BobaykFRcQRk+0jt9J0yTyN4sXhcwFWvJ2qvNB+Ispmi27Dofpx8LYwXhIcnl0mCMwNunDtehfmzDHjnR58LWg/FravprHiJxj79cP91lSZZt3gISZGq2Z4cIzwgZyQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ke5b95JG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOXoiaxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6242Jgrt1258168
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 02:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTkudy4+sy+74CFSvijB/wVzib3CXdeWnXukOKNbJTM=; b=Ke5b95JGiQUNjjA0
	XWH67Iih6U+jCa470pgiqw4R/ALebk8WnDKZ/jRQ8oIHoud2DKS5TW169lGqZjCW
	J1koIVV9ooc/c65UL9ETvnnZ1AsJTzQ5V/4RyF5ScudQbyiSm9mP/tM0LCJxfnG3
	a8ePV+/GgayaCY2dl29G9T7jJY0SiP3kVjEmjrN7q92UJMr69oOKtuDQ3lls65+5
	s7qUlT9Jw7rjiM3QviIcjATjyVAt6TDg0abHltheNJUEXeKOu6lmOXWlpb/rRHa6
	M5w5AMh3irdxdXjE+kEKoHwYf3h56tflGRQtolCV9wLUnoC0gYPRkcvU7SGb+g1p
	KJTVoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9j1nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 02:22:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4a241582so3689252385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772590945; x=1773195745; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTkudy4+sy+74CFSvijB/wVzib3CXdeWnXukOKNbJTM=;
        b=gOXoiaxqn1fLXazgGhgJLsu65GFb6V9JlGVSRiRxY8Q3yMbRD5P2GtRdSpXLmyE53W
         2YmghNNDTMLtguhlY4wQ0/0eSE5ZA851uOpWaZ2nYVE2vNEr6nJvU09aSuo0dm08Jio9
         GhQmXW7/IXQGSbg6cUPp1R1ybE5fIBgiXESY+6h5PRSGC+QC4HzYZxlHi2kgIqqsyuUv
         hEhduiMWFwm78SJehVkLkjob+Dd4r/8/j5JKhxdrBnhUySrVpAqjOWbh8E+uqn9q86Cy
         HmcOs85VHueRWiY6+iOxqk7haYXFe+IjEfNs7HQG3FAyCToKOtPJJgduE4p5Tz6jkvj2
         QLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772590945; x=1773195745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTkudy4+sy+74CFSvijB/wVzib3CXdeWnXukOKNbJTM=;
        b=BdBl1gg3WCCtCwxICBJzclv6dkKQMD0BWSAbTMYC21f8w0lHXKQqlgMxRIwOYADzHK
         ByCOEC3qCjBXAsSJrEm+ywa+9kUk4Sym6X1VmlSG0uMa2FjP0E/3mvV/q4BrP+PMqw8i
         lRFtIPEb9WZ+AfH55048kjKF4wplyhkgaLRBVz5QJ6suZdyNwE1PrWCS7I1v0p1DqTf7
         d6i3CSfm60yAwTM26NhktDCQJ55ONV30Dr5oUpEtNLRdzRhY2pr4A2eF5fFlQgZg69Rx
         YntbjkUhoFZg5c0FhHdhAj8IKDe/lWbZImR21bFiFtyv5Tu5y2RVzN1KC3o9JxJxZwFo
         YwSg==
X-Forwarded-Encrypted: i=1; AJvYcCVElnUzBs2qJdVGGhHpvPAQWb8nG/b1rcKzOrM+nKoqghfwePvGtyAOxtqY1N9kwhSf8l+k5Hje8FQ4KnoH@vger.kernel.org
X-Gm-Message-State: AOJu0YyN5VjJxCMGyU/1vsmki/oe9Nj26CLVHoffoQNj8wQDtY7wVBbV
	1YzX8g1S6I7n6OYDi7okJzC6EGoxYF/gjNGTAU2luV7edaw4p7AhSXNcwKB1+JAQStAAHfXmusG
	i8+z80+dAV2yg6jrnCycKQiVeGPxSLL5zPEU73XRgdpLDdz7gIznxyA3wM3xxyFmr2MC8
X-Gm-Gg: ATEYQzwQ17+cqSc3R7e3F5MJn14wOxdocncIMNnQ3qMRmXQUgwUh7nwuwd3MAp29esE
	mVhXI74mnuVuRV0XOVYLQYG05HbxDI91tIwzbC2MRMghGBCAsTYFgz8/K6xoKQo1eW341OCONZH
	yusahQx/wmm/1gRLJ4bHbXp1hyLKNYQP43Wial3/vZTDLLA/Bv2BDMazkF+e/F9Qh52V5YBvQCo
	itQeu8P6P95jUXF+uoH2+RX41SKGlvS0yGvf1XdU/gGkoVSsQovGuf8BVF3y021mIIXSdD1OXL3
	cSdXKFVUTLltd/JBD7bgyLIA0b/6XGtkoEa1956aqBihDBCjGmanPQx2laAFQg/tdlyOV6BCJ9c
	NVL0ZrSXvjVKKu5xUVb4DGTVKYT62V41p7v2vZmARMyJ1nApGxGD9j6lxjRf2HvpZT0JzkUO8FN
	kvQxbEUxfwi08X2Po+C55yFQ79c004/CikXts=
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cd5aebf056mr67335385a.8.1772590945245;
        Tue, 03 Mar 2026 18:22:25 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cd5aebf056mr67332385a.8.1772590944646;
        Tue, 03 Mar 2026 18:22:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235700dbsm953678e87.84.2026.03.03.18.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 18:22:23 -0800 (PST)
Date: Wed, 4 Mar 2026 04:22:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable the tertiary
 USB controller
Message-ID: <2jcrdz7tj7cuo5j77n7d6nfxlo72s35njdig6lytbta3vzo4m7@wegza7xjgcxo>
References: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
 <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com>
 <CAFEp6-1+t+672=Oh8nvjMAEJrV_sz2SMzh1WeDNowsVzdXu8LA@mail.gmail.com>
 <CAHz4bYsyZyWrC1t_osVDFrKDX7Wsc8mdcr6bMiigUDUnkOSQ9Q@mail.gmail.com>
 <CAFEp6-08BQZKGeW2P4WPqYq3V69um6QTnE5Gpd+cvT9D-zsj-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-08BQZKGeW2P4WPqYq3V69um6QTnE5Gpd+cvT9D-zsj-A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAxOCBTYWx0ZWRfX3cAkN3kGqErI
 D7O+hw65oZqf0bz3+olXDUZ0LpmQtx3fs2aCb8kiJrHXTwz1EHoVUyyqOn24K5geuB/REMHu/fw
 EN6IbMvQT0UMZG9ND2EXmfFCeZpavBtkPyubQ1pS+7Z2YahYAqWtqb+AfaYAxxeovvAsp14DIak
 wre8YWLdYFDIH87M2/w53wuR4xeftcTtx6XqvMJfveLgQSGXIUjuy3ru7EihF+fRcOE2gSZstcz
 RB8TlSHHCMxtK6Np53cAH1i1aBTnWUYu9oJCzXx+iSn0jHb0xCf5MdSkTVjTWa8bmPZQ2g4uMX2
 J8FGPez1updVnVhupZx/B7pX663fAURIBy95rrQcc/s2zkgk9ZwyWG9q62mSjMzQPVIuuumtB/Q
 rdlu7YXfW+glhOMxWcZ68/lFIsKb4Huud6yBJZFhiFjVQ37i8x21isTI9TA7yEKeUvE4nKDW6V9
 GZHeTomfRox8xCTZnyg==
X-Proofpoint-ORIG-GUID: zX42A9jGdFdU502Fe7JfaQBZquVd8huE
X-Proofpoint-GUID: zX42A9jGdFdU502Fe7JfaQBZquVd8huE
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a79762 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=t1zFo2V53FLrBF1tY_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040018
X-Rspamd-Queue-Id: 13F2F1F9D4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95239-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:32:36PM +0100, Loic Poulain wrote:
> On Tue, Mar 3, 2026 at 9:25 AM Swati Agarwal
> <swati.agarwal@oss.qualcomm.com> wrote:
> >
> > On Fri, Feb 13, 2026 at 4:15 PM Loic Poulain
> > <loic.poulain@oss.qualcomm.com> wrote:
> > >
> > > Hi Swati,
> > >
> > > On Tue, Feb 10, 2026 at 4:54 PM Swati Agarwal
> > > <swati.agarwal@oss.qualcomm.com> wrote:
> > > >
> > > > Enable the tertiary usb controller connected to micro usb port in OTG mode
> > > > on Monaco EVK platform.
> > > >
> > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 53 +++++++++++++++++++++++++
> > > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  7 ++++
> > > >  2 files changed, 60 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > > > index 03af9bbcacc9..e6fc6f6a52e1 100644
> > > > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > > > @@ -27,6 +27,25 @@ chosen {
> > > >                 stdout-path = "serial0:115200n8";
> > > >         };
> > > >
> > > > +       connector-2 {
> > > > +               compatible = "gpio-usb-b-connector", "usb-b-connector";
> > > > +               label = "micro-USB";
> > > > +               type = "micro";
> > > > +
> > > > +               id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
> > > > +               vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
> > > > +               vbus-supply = <&vbus_supply_regulator_2>;
> > > > +
> > > > +               pinctrl-names = "default";
> > > > +               pinctrl-0 = <&usb2_id>;
> > > > +
> > > > +               port {
> > > > +                       usb2_con_hs_ep: endpoint {
> > > > +                               remote-endpoint = <&usb_2_dwc3_hs>;
> > > > +                       };
> > > > +               };
> > > > +       };
> > > > +
> > > >         dmic: audio-codec-0 {
> > > >                 compatible = "dmic-codec";
> > > >                 #sound-dai-cells = <0>;
> > > > @@ -77,6 +96,15 @@ platform {
> > > >                         };
> > > >                 };
> > > >         };
> > > > +
> > > > +       vbus_supply_regulator_2: vbus-supply-regulator-2 {
> > > > +               compatible = "regulator-fixed";
> > > > +               regulator-name = "vbus_supply_2";
> > > > +               gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
> > > > +               regulator-min-microvolt = <5000000>;
> > > > +               regulator-max-microvolt = <5000000>;
> > > > +               enable-active-high;
> > > > +       };
> > > >  };
> > > >
> > > >  &apps_rsc {
> > > > @@ -484,6 +512,16 @@ &pcieport1 {
> > > >         wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > > >  };
> > > >
> > > > +&pmm8620au_0_gpios {
> > > > +       usb2_id: usb2-id-state {
> > > > +               pins = "gpio9";
> > > > +               function = "normal";
> > > > +               input-enable;
> > > > +               bias-pull-up;
> > > > +               power-source = <0>;
> > > > +       };
> > > > +};
> > > > +
> > > >  &qupv3_id_0 {
> > > >         firmware-name = "qcom/qcs8300/qupv3fw.elf";
> > > >         status = "okay";
> > > > @@ -690,3 +728,18 @@ &usb_qmpphy {
> > > >
> > > >         status = "okay";
> > > >  };
> > > > +
> > > > +&usb_2 {
> > > > +       status = "okay";
> > > > +};
> > > > +
> > > > +&usb_2_dwc3_hs {
> > > > +       remote-endpoint = <&usb2_con_hs_ep>;
> > > > +};
> > > > +
> > > > +&usb_2_hsphy {
> > > > +       vdda-pll-supply = <&vreg_l7a>;
> > > > +       vdda18-supply = <&vreg_l7c>;
> > > > +       vdda33-supply = <&vreg_l9a>;
> > > > +       status = "okay";
> > > > +};
> > >
> > > I noticed that usb_2/hs doesn’t work properly unless refgen is
> > > supplied. It may appear to work on your setup if another PHY or
> > > subsystem enables refgen, either explicitly in software (e.g. DSI) or
> > > indirectly, such as through DP, which might be voting for it behind
> > > the scenes.
> >
> > Hi Loic,
> >
> > Are you facing issues with this patch set? or your patch set that was
> > raised as below?
> 
> Both. I'm basically running Debian with kernel mainline and your
> series, booting from eMMC.
> Usb seems to enumerate a boot time but is then unusable.
> 
> # lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 002: ID 0781:5580 SanDisk Corp. SDCZ80 Flash Drive
> #  dd if=/dev/zero of=/dev/sda bs=1MB count=10
> [  225.248307] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to
> stop endpoint command
> [  225.290186] xhci-hcd xhci-hcd.0.auto: xHCI host controller not
> responding, assume dead
> [  225.298385] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> [  225.307748] usb 1-1: USB disconnect, device number 2
> 
> It starts to work if I add the following in the monaco-evk devicetree:
> &refgen{
>     regulator-always-on;
> };

Interesting. Could you please verify that PHY is not being reset or
powered down at any point? Unlike the DSI, USB should be voting directly
on the refgen.

> 
> # dd if=/dev/zero of=/dev/sda bs=1MB count=10
> 10+0 records in
> 10+0 records out
> 10000000 bytes (10 MB, 9.5 MiB) copied, 0.7521 s, 13.3 MB/s
> # No more USB errors...
> 
> Regards,
> Loic

-- 
With best wishes
Dmitry

