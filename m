Return-Path: <linux-arm-msm+bounces-91440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wILpKClVgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5ACC9439
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C131D30048DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ECF296BCC;
	Mon,  2 Feb 2026 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZhxtvRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgQ0/BrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866AF28AB0B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017828; cv=none; b=QiRSx+FApJVzNAPUbHgorliUz7fbxEZFxErtPgT4DLZQtNLaeZe/t01eKPL1eXJNRSFzUlDArOCO6xl0+kTRZnJrIUbzY+HXL1jDHSuwmJeajWAiZsV3/DbXEQhGsv0xCfAbXfY2DT6m5jmA0S7kjCu0apjtjeMc2ZLUSSlUK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017828; c=relaxed/simple;
	bh=JchN1HTfWKzcSZkNmVlOJxj6OoEKbRDmLsShWIFsexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdqxDlfpJNm0TO7GjfeuZKOnoAtT1uW0xJZOIQaM53tHGGU/0tkX+M+CYVe8qW+PxzzygH4yzF4o9ATF/Mxb750XOfvaMt865ju6wCaDsGLzv1KXFilIUQDNbhwJxXHqTgiuEd97wqB+wGBu/4mrGfpW64ymj0qoWwQyTWzrEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZhxtvRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgQ0/BrY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NbdpO1571988
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rD0/krDKTbOy3n4rVKSe8Spt
	la74b0imf2GFeN1Mx7A=; b=SZhxtvRI9+mVLdalOyxOhNZ0XHQ2gB+zdjuPZtWw
	ZJo8vInAVqdrNSwO7ah5He4Gl5AsXZtIbPJbLu5iouv6eAqf5Ik5PuC7sGyJqdEb
	RvmQwu78db8o7BElQBmiGH7ux8UD5spI2D+MaWAqw5z7+YHWbpqyLSnRXP0jdPA9
	fVy+FWKYrLXR1jkrXFBD0g9XrfuJtP1raYMWCia08cC/8ylMwirCBXntkpSiuOFO
	Fw7kitmr5HzyRyV6YQZb270kZpXaMpRCTGc6Sc+nxAgrnIabu8/aeltnFCre4QBI
	xPZwg6nCKzmb8F7snS3Ik9ccXLPlawSy2JknivrrRDSMbw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2megh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:37:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ec823527eso7717425a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017826; x=1770622626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rD0/krDKTbOy3n4rVKSe8Sptla74b0imf2GFeN1Mx7A=;
        b=IgQ0/BrYCElB+bSF4AbUtYmIge65tQMSnUNDe/T0rgVro66mUABH/gE+0Sa2dfb2nf
         LGP4pcj2VlmHNZ8UzoFv4nRWIBNbHDnXekKH7jWDJKMtM4YZZJfiZdOqAD4e9DGhN/mw
         Z4wvdOHMHPyYJJCxmZbYxCTe/8UCzP6/vwwaEaWMuiO0wbW1U5MJlGiU//cTuDRkK7X2
         gm+0QlCXDEKb1vaR8q8DREkddZrVzB2I9ZtxnWkmGVCNx5vohxEdWMLbpJt8o2Em/EVA
         dMCCG9DuS3lqPKUsgC1lXRQE6s4RJbkYCm9k2LD5hv2QeMJ8egO16iTfPaKX6W63ksFG
         x4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017826; x=1770622626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rD0/krDKTbOy3n4rVKSe8Sptla74b0imf2GFeN1Mx7A=;
        b=Y4BZymLY9pMb99KAJSa4cK8liieFOTXkN9e3Dx9dHbn5pXGD4qUPMy0YVhylcc1anB
         a/w/W2VXzoZ1H2UdUegDO95XQ5nZdXk8KWdx0BDWfYE++6j5veZ25ic7XcrfiLwCzwnJ
         RMPHDo8BMMZr6eC2YtVbmqMU8El9NL9imyEMqOI5fYCHR6gyCj4sn1OQq5m9oW55twyC
         /DHpdKIFD2s991lu9PagiXefv1z5/vAEFf1H7zGP8JpeHZIznAurC5yeB89KYZMRoGtE
         ODfgodXhi1bAX5kcx8L9j/wbRyvFlw85wJD8xPnNbHNhkPNwB34TrRHMlGX+jxD8jFix
         kNrA==
X-Forwarded-Encrypted: i=1; AJvYcCUoRVoi/1zy6Tp7TTrEZkKEQcNsJD+ntWrfd0DLNX8+GwZ8tpk1EyPd7LOOAuM6TvzkDmqorBoSd+Gxz0GX@vger.kernel.org
X-Gm-Message-State: AOJu0YyJNNXm0bGKSUtbolXIY24FCWCPAqfM8/G8DrFwGw7evdrC4pHj
	20ZSBQGhiIOzR4CEVdVS43daqW3G3i5XQPn/1VfTYLrOQqJr57va2QMx13YEv21QQugIUH68Sh5
	fTStCe8VkNQq5SI4J7rhHNrqoIoJKCu8Lu6zfv77GYH9SiM47ei2ScxF+zA9xWp9DKdsL
X-Gm-Gg: AZuq6aLVqHlMfyNH+IePlDHkbh7TVlFxsxwmkg9JoN8bxhMTymYiAJr29SDS4w/f+Wv
	5G5n5cV2waKaap8emTsrwm5bCnTbcWRBWHfMo1SKvH33QefoTKDXXsMw2fxFZwIaVQjhLcDGQDH
	MVJ3568rqTWwwK50IR+DhyznCUriHX08NErrFgruUGofKC3CGV7S4DnehKPVUxF4d5/nwJL4raq
	kWoHXA/h/Fn53Ml38keQM60opyKWzcksnJOD9VkMv/AJ52pc9Wnn9yuxSkOk15Ug1DpTCjciWt/
	lrOJc3XApQobkj+7LJCC/FUaX0T4vRq/QABZYUUmQfCWF7zy3dN0BkN8wIrXg0BmkgV8XEpzzHP
	gPdGkCMTv79784tDHaN3EmKAENeboHJnIcb3jzqriGPG2Z2aIds40mqYTODoJnmkCZTIACB6vMM
	kCRaEyRSl6q7v+dJFe5a8ZZvoM/NwdTXv1L8Wtw1w=
X-Received: by 2002:a17:90b:1e02:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-3543b2dc6cbmr9558957a91.8.1770017826112;
        Sun, 01 Feb 2026 23:37:06 -0800 (PST)
X-Received: by 2002:a17:90b:1e02:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-3543b2dc6cbmr9558949a91.8.1770017825669;
        Sun, 01 Feb 2026 23:37:05 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276efd8asm13744067a12.7.2026.02.01.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:37:05 -0800 (PST)
Date: Mon, 2 Feb 2026 13:06:59 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <aYBUG7ixvuTAUJW5@hu-varada-blr.qualcomm.com>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
 <f5af2b4f-e2dc-4aec-99c1-f06ef0eaa000@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5af2b4f-e2dc-4aec-99c1-f06ef0eaa000@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LXFGJ_-EYL2y8AFFgFhNvQ_Ri3DZYKYk
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=69805422 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Vhrj7KzolLSZUphf82AA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: LXFGJ_-EYL2y8AFFgFhNvQ_Ri3DZYKYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2NCBTYWx0ZWRfXzrfDSXRZbmv2
 qq7DyqNlQmD1WVQs1qH4HDtcR1RPLyo5YRYhc/NLXpqpDXdJ7+Cp9gYTRpnjWS0bXI4Z4DweGPO
 jQL5ECExEh1Et+hiCu7zWYqsCz68UYnJihHDK/bWXxQ88pfFOX/jKnvCdUlamidpGFWFB689wNZ
 C+r+HM+6Uk3hB1G2pZughnx0LXJo8uF0ad2MBzAQcq6vSJKKPgHv8OcSiRmkOeOvVkBtUDRFHXy
 V2fFfoYd1ssr8oDAVb1p//L6qJvb89cCWHt/05EKFXQJl+Mcu6dwhBA4IPtFAZ/nfOt8pIg9IK0
 AYdNY1NmMXEnRfHNYmZFT96EODkohvXfw8FnogUDhmhrtqeXWNBZEyJyFcQLmSvKlMqL6DwQEds
 Ugg4X6Utx9L2owGsqVwNBQENvbwktbBcz9lE2ijbwGg7tR+G8DkDEq9bVB0Vrx5AK54O/Lv3zyK
 TcB3puOMYB36ARMrlYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91440-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C5ACC9439
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:25:44PM +0100, Konrad Dybcio wrote:
> On 1/29/26 7:28 AM, Varadarajan Narayanan wrote:
> > RDP433 can have NAND or eMMC based on a board level rework. Since the
> > same GPIOS are used for both the interfaces, only one of them can be
> > used. Add a new DTS file to disable NAND and enable eMMC.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > v3: As qpic_nand is disabled in ipq9574-rdp-common.dtsi, no need to disable
> >     it here. Just enable eMMC.
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
> >  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 29 +++++++++++++++++++
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6f34d5ed331c..d5fe12ef4300 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > new file mode 100644
> > index 000000000000..249b8e07db8f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: BSD-3-Clause-Clear
> > +/*
> > + * IPQ9574 RDP433 (eMMC variant) board device tree source
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "ipq9574-rdp-common.dtsi"
> > +#include "ipq9574-rdp433-common.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
> > +	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
> > +};
> > +
> > +&sdhc_1 {
> > +	pinctrl-0 = <&sdc_default_state>;
> > +	pinctrl-names = "default";
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	mmc-hs400-1_8v;
> > +	mmc-hs400-enhanced-strobe;
> > +	max-frequency = <384000000>;
>
> These are all properties of the controller, which the mmc core
> later validates against the properties of the card, please move them
> to the SoC DTSI
>
> > +	bus-width = <8>;
>
> This is arguably a property of the board, but in reality it's so
> common that it may as well reside in the SoC dtsi too
>
> I'm a little surprised to see no power supplies, are they always-on?

Checked with the board person. He confirmed that they are always-on.

Have posted v4 [1] addressing the above comments. Please take a look.

Thanks

1 - https://lore.kernel.org/linux-arm-msm/20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com/

