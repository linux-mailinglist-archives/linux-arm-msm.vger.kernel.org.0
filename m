Return-Path: <linux-arm-msm+bounces-91755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGD2HhWygmn/YAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:42:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE8E0F14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C005930C628A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE252D541B;
	Wed,  4 Feb 2026 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNB8Ndma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3IEZ3ch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69B2D6E70
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172918; cv=none; b=NB6VxDLFAMnRZsjEuIS2acfRZkoBa8y0/w4CRNQr0G7tT8FfSR4ChR7N3uje5qnZCygYLg1ajmAGtbfJDpv463BNuxpm15wgUw7rVMzBcQsWGqib6DiH/cCO+TPiiWo7y7xVrkD8BsEmYP5J9j5Lcra2jSrxjzdLCH7y7SBHtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172918; c=relaxed/simple;
	bh=TBX04Jy1iiLGjZltx3LTI5sSaM7rsKoGjOnME8QpLlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv/ozdnSYHTvqGiLMSGk/bRp+JLVBNpwlgavfnpcKly9qxdu4GhtNZy10pVzX8E5R8RAoJJ5qvtSDvmzEsKhivPVM7qaJIdoD9hmjhaqfOFt5jcs+MsmOntS9xNsjJ1QFJxXvjZcUsPwtWqncJ8RAHK/TcMWXNFVSZ7ZhAmWPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNB8Ndma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3IEZ3ch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlksA4122714
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h7mQd81VhLeW0+zRdhQIuVBX
	ZHIMRKI/aLoY3tx5Sy8=; b=PNB8NdmakNneC2FNU6uLD40CbMgisUg2Qafti659
	/YoYbSzKG+M8MpJ4JoDFpcKtF6bxgAqazz0/aWKhxjS29v+86ONKKz88IsQWdx89
	FE3D6JTRvZakntwT5GyJdcdcfYpQp9COaSCXbIIJJ+cLJEouCJErQj0YokgVTJCq
	lacRevBGJq1v+h3N1s8vdOlF5fOwYoygq28/a/O5nnIj412AiS3+91pOoTLA/+zU
	bfjLfG/KiJU561nyMQ6lZA3KNnYvO9WvRFkoReoSDI470qaEzheEsCh/2rRtGLTo
	l7bly10N/lqLPZj12gPbZwmkcNqIPSjbdXLiNGntx98Suw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkj7mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:41:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso979945985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770172915; x=1770777715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7mQd81VhLeW0+zRdhQIuVBXZHIMRKI/aLoY3tx5Sy8=;
        b=F3IEZ3chCT7Q+nYFiiRsu8vuEIjkXUEoNO1nOnhAhi2GkCesG79QCmu8DaESujNTF4
         pBna3P+wIPgd1Mb8QQj5WPX583TtfWjWzD8TlUEBhNke6BC8Hr6Tc2l/Pq4ZKdWsDSZL
         b9aRbF9+cwKRfDcjwhOfttMT1dnBA4atIncCYNxrQDM3OTs16+Pq5NAjWHnxmHoXbCgA
         JSF/hR5avY/XJBQ0pT3usnTv2pgP0kR2iU2GKr7h24lhzvg7XwRRVN/RLJDZm5kkt82H
         JNGYHPSmbMeox+9SVQ0THx4qhysmgn3Nsft9F8yuNvgdDjZNeOldS4i82QCRp1LiSDI+
         ZvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770172915; x=1770777715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7mQd81VhLeW0+zRdhQIuVBXZHIMRKI/aLoY3tx5Sy8=;
        b=INke2AwtgIN2Bm1PRzMqvCWC6wMn/ng1kGn+Do8lLiiLSTo5ggn4v2S7aEsEb8myFX
         QrG0r5641x/obMnHDqHiQ7v8G6B7qP1orSU9Qh53A/EvnuJHB6etWC56LOAjVECu19Cg
         LmcG8BS7IZKQYC5a44s0ORbhhOTZidPKMLuCmJiS6GE5VunvZlFLPybf/KatreY7a6Wj
         mCPwKnCEHYwulZO1X9m/4DcONtFiJwbPBffelemCyA0hhToHjqVMz/bxM4L56GjORpIe
         Lr7gqOeDdL/adXU+kh8Qz+aRQMbHClPFboiHS8zH5/cDA1hR0M8Zt7dShSJY22CS8L2H
         bcXA==
X-Forwarded-Encrypted: i=1; AJvYcCVB++D2JLVcfRrHdB/PtG5i0RAaqxRK74uY7tHpaFzUcs5hCtXYZdMWJ7zYGkCRQpYVj2JsiD+FNg2VKpYV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8mwGEkaYpd3dYt7jG3dPDGSyGnLsLg8ksdfn8PvVE2a7lZlEz
	eY4ZrZaARv205E93TFsnTfCNH4wy+RHGTh8qElhR0VJ8x67xHGrKxLiZVTS4xS61yZmwGlI4ipU
	1UI5hrVAArLDxFYDXjAJPdWtMvDi54cAqUxLxkwhFXMiGok8PRI7V+MuQfNKKch4gpRMM
X-Gm-Gg: AZuq6aJTe2nJSMbfyPsaLlJYMqN/EBmEgDSQH8mhM/k1Qt5CzOvgCcKnIKySDCchfIc
	o3qXi/KpfvYyzjdmesMnJL0tKdIfbIbIq26CctZRBc7057B7yl3c+GYjy9NpaQsUYV5osjgZo85
	5/lo96awFj6udiYSgALEyPVVIMSnQMCf1E5TdQ4fiLPnl+ty/+seeJ1PSTKCG/FlXwk+8Z1TEp/
	CdrneJOEjmIGxOIGO4J4/nJ1kDA4v9l/h8qhLTAhrR/JJktfWe1ho+3n0+dUDQNc1sbrELa6qRA
	wMkbUV1o2ivfKEnKqEAKjFXfQ2l383MTannwVOO8yBViUSEElk3Bge2Tx4wjU7tdn4WclQtHLm+
	VJ0rJsTPyVKeraDJh3g6jCfTmCVu36BohWnNjgvK+IoPIEI4ShIg6no8P85CBI2V0oKfK/lf+TV
	SmBsevCQPNuO0GCfffOgHxr2E=
X-Received: by 2002:a05:620a:408f:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8ca2fa6b7bamr203780985a.84.1770172915271;
        Tue, 03 Feb 2026 18:41:55 -0800 (PST)
X-Received: by 2002:a05:620a:408f:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8ca2fa6b7bamr203779485a.84.1770172914826;
        Tue, 03 Feb 2026 18:41:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38830afcsm291713e87.98.2026.02.03.18.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:41:53 -0800 (PST)
Date: Wed, 4 Feb 2026 04:41:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sumit.garg@oss.qualcomm.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <jipdrrshukblcwbybahxtbnlwillvmejqx2dnt5h2goqnkgypu@6bov3xicg62n>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
 <f5af2b4f-e2dc-4aec-99c1-f06ef0eaa000@oss.qualcomm.com>
 <aYBUG7ixvuTAUJW5@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYBUG7ixvuTAUJW5@hu-varada-blr.qualcomm.com>
X-Proofpoint-ORIG-GUID: A4EErgZUqhDmkHq9wAj81eqasDoxXz5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNyBTYWx0ZWRfX3+pT/JQMRgCJ
 raTS9rLmWkxAvhvAd5uUwdrSfkzspTN/yRZGL9/SUWjvYGSXgKg5zEd1JMYvqMktO46+zZ5G80U
 fHb8IGTslEihMTF6vtvasbiHycgXgaR5HJYiCcUrNv4abAkqHc1Z6TzROZLTOzkxNv50aeSr9cw
 NYdXDyc9dq/cv+KZG/zDJi0JDMWH0Xo5VNbv5/2vla7SKR1/dMw94VkKx1hmsUglkpS/pyTxhxq
 XBL3tkrEkeR6OyxGeocDjkWJxGcvrHKY9hJF+VWUhZ/gT8+BkAGDznC0iT8D85YarjKO8ocdgQc
 uXltDdqnLtWFOnmLKM8qWPuclE0HKMcIbPaZUeM6Pr2pzNkD2bwNUO1QD9fXZWF83w4tmmHPhlv
 MVXdxPCd7tD8ats+l89OHizrzYqBHkgn6tapAd+eUqsh1NKw4cRJRR/bFY0cACTyAoGKtDcj9l1
 wZBfz5shr57hsm+wcnQ==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982b1f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPejI7s2h_x11JoyKgQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: A4EErgZUqhDmkHq9wAj81eqasDoxXz5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91755-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9CE8E0F14
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 01:06:59PM +0530, Varadarajan Narayanan wrote:
> On Thu, Jan 29, 2026 at 01:25:44PM +0100, Konrad Dybcio wrote:
> > On 1/29/26 7:28 AM, Varadarajan Narayanan wrote:
> > > RDP433 can have NAND or eMMC based on a board level rework. Since the
> > > same GPIOS are used for both the interfaces, only one of them can be
> > > used. Add a new DTS file to disable NAND and enable eMMC.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > > v3: As qpic_nand is disabled in ipq9574-rdp-common.dtsi, no need to disable
> > >     it here. Just enable eMMC.
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
> > >  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 29 +++++++++++++++++++
> > >  2 files changed, 30 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 6f34d5ed331c..d5fe12ef4300 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
> > > -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > > new file mode 100644
> > > index 000000000000..249b8e07db8f
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > > @@ -0,0 +1,29 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause-Clear
> > > +/*
> > > + * IPQ9574 RDP433 (eMMC variant) board device tree source
> > > + *
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "ipq9574-rdp-common.dtsi"
> > > +#include "ipq9574-rdp433-common.dtsi"
> > > +
> > > +/ {
> > > +	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
> > > +	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
> > > +};
> > > +
> > > +&sdhc_1 {
> > > +	pinctrl-0 = <&sdc_default_state>;
> > > +	pinctrl-names = "default";
> > > +	mmc-ddr-1_8v;
> > > +	mmc-hs200-1_8v;
> > > +	mmc-hs400-1_8v;
> > > +	mmc-hs400-enhanced-strobe;
> > > +	max-frequency = <384000000>;
> >
> > These are all properties of the controller, which the mmc core
> > later validates against the properties of the card, please move them
> > to the SoC DTSI
> >
> > > +	bus-width = <8>;
> >
> > This is arguably a property of the board, but in reality it's so
> > common that it may as well reside in the SoC dtsi too
> >
> > I'm a little surprised to see no power supplies, are they always-on?
> 
> Checked with the board person. He confirmed that they are always-on.
> 
> Have posted v4 [1] addressing the above comments. Please take a look.

It would be nice at least to have a comment or, better, describe the
fixed regulators.

> 
> Thanks
> 
> 1 - https://lore.kernel.org/linux-arm-msm/20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com/

-- 
With best wishes
Dmitry

