Return-Path: <linux-arm-msm+bounces-90381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FhoHt7Hc2lZygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:11:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E317A0B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1093D305614B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494D8271469;
	Fri, 23 Jan 2026 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G41R9t1p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuV0z4O/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5193223328
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195396; cv=none; b=UGTdbJqa8XrbTStLeF7j1hGNGduteX5I0BzVnX7YpDxVp87iiCxVyV5V3Rj+1iPlrMn+YBvHmpfXg1u3e0xi3R78/ZmXlfeCtRx211lk79o0iRL8dur061P2UUzsmy53HvZSz0SEoF7eXq3qCpp06Zag51TJgUUBAodHVSJmkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195396; c=relaxed/simple;
	bh=BeoZj4Fl6JdDZ3Hlx3tkx4xppCnx5cXNsW1rw57SB1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBY3jPMFJTXTnm9wNTy8X6nL5MfjyVnWz/qamtEmKfZB/KTanp7oja23EyOdgrs2h4TnCy69JcbZRZ7Q4b/74E7LATUgdo8i1VedPMphFek382f1Lbz2q4IH4bqa2gutDR8F3ry7zNdmZxP/IfsuJG+WXVSg88yH9qdJNo9mUVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G41R9t1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuV0z4O/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NIs4PH2263503
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0T0XPnkEToV8Aufux3/ltEAf
	YbvRoDx8ubYhNQlQeks=; b=G41R9t1plK7A8osjs8Yin07n4LZzvI9bC24Nt3IN
	E3t9AxIlhN6/7Dn4d41PuykYqUl5rJTmC2C1fZGUNS7K0rFibDUBjg91rCgz9psW
	R94sotYzb1VxDjIvymBN1/gJXDVxg4NIw2YMDZhks//7hpAi9tTmsClOAnnL4tel
	0IKV80L/eyPfNDFgdbucNBIzv24Gl750ZVhk/0IAHrnv9Yd8DgiZ/B2dqf5vIU/f
	GAXSzw/kI9vOStsoQmugQJll3k/1ptQJvzJJLmEQWSOVfH9sYhuhWFymFRoE5jyg
	CBNm4QqtyvBt/zALv8IOZy5F2bCKjL30PXMgD+cowMy1bQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvep081m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:09:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f536124e01so5108841137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769195393; x=1769800193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0T0XPnkEToV8Aufux3/ltEAfYbvRoDx8ubYhNQlQeks=;
        b=HuV0z4O/hO0NC/konui1uYABi5G64qqNKjsp4C18JllxUc/zWJGoVSFjEoLjEtr4HH
         XHjDg3XBWV1GItfXWd2DXMI+A5kIRhZNWoNQWojvTzXc/lMRs1DHSI5CimciF1lU5o3I
         6g5h/1wP6fElWTfXFv4l8816f8tjqxbzzh7eCsvfLpE1U2C6Y8vG0NO2G7YNxSOABaSj
         FN2oDAFrxdP6W+hPM/Mdxg1tlT9VIB/bH1FbLca5u+5K9EpkKaKMq6wOB2g1dl4IYGh6
         b2JvcN42cTVwwD2ugW4cASqJjWdy8ll3ybkhMc3RIH+YSAttXrVqGHKG7AJV28jWlAH/
         xbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195393; x=1769800193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0T0XPnkEToV8Aufux3/ltEAfYbvRoDx8ubYhNQlQeks=;
        b=BqVN1K153aaMoZ4y/OWXMbWQXED+wMx2sg3seDBxgcs1zwtGD1tWNMHl/2UN6Qd/f/
         ouk9dtGvEP2mtN1VhkSvguPZHvV4cHwdzZc6fhmkpTgjz26ozQVFuQ2+IwnKMMQ5NaW9
         F6s3N0qq5UAnyNlGfeKsx3o+lPaOZvHcO3vRiRzEvOOwditW57xwfPEaFnNCknR18TiL
         DxiVpIN5qSG9AboCH1Vf0imEIYJrOGOoKRseosH2NbI8Db90ZdXWdcKyiiGg59qZpznk
         javYV4V15TnPZvyGHn7WKBjcsoIJrJvg6h+mCU66gQdcI8ea/xshowPJs3zknDT5OJDU
         AdUw==
X-Forwarded-Encrypted: i=1; AJvYcCU4f7rRdtY2qw/DlS5g1b8/uIFWQqJUrZRfF6UOf6G2WrvtX9E9SferNxlzzW/3FmqFGy+3wNLckPBpZvK0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf60DqxSJ+dlB6Fwl5hIUlX70l5W9bIFxBoqu6V+XX4Tabpq1F
	mzpZ75TPlRsrfEmOsIfq7awCzja5ipBtrDDkzlKr06FTFoJwYoCsYsJjPNjS0VHUqfh6V/5YM3t
	adA4vXR28VwrpCTC0cRrIQ9mfhkScaJBgrZ/1uZ4XuCKcuBFGWQFD7dHOtdDDfBs/cDGIE6kN8k
	QI
X-Gm-Gg: AZuq6aKEFwbmK626/2lzPj4U/U3PYbfoE35aNG7f1nbhhO/VLWHJncZwsPh34DRTWRy
	IccO94pJD+VWiD1Yfn+/wgQS7OQTUifnGqSUYUULGrzsAiSPd0ahK7Rgxi6BFt1Kcnunan2jPie
	8MDWgwyLBO1sHWOkj5CQhjtQkgSnKBuNTvK9jgqUGym3wQRIp//Ahzq3Z5aZ9XeRFI/hXLnl/nK
	MC82dCVdNp9HteoRidbzDttpSlBv16Jo+ugujXk1rBq5pgOtx15eBx/e5kgEk7rrbmTGZFi8FWa
	s5FOtrC7gXGiCp88hYFApFc1Zcxmf1EEW/kWfCdnTAj1NgCKAQGzvMmsmCSEosTwsyLrE0gMceP
	oYXBmAp4Oi+pcP/CJCCzHSDoOUELBf8YQY6JK4X4bXn+paOi4itVydZ4gKYevmtbdJwtfpdNWLY
	YIm2qfyJ8sJV6TafIGM5ibwL8=
X-Received: by 2002:a05:6102:2ac4:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5f54bd36d33mr1458102137.43.1769195393039;
        Fri, 23 Jan 2026 11:09:53 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5f54bd36d33mr1458089137.43.1769195392587;
        Fri, 23 Jan 2026 11:09:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de49189casm829979e87.47.2026.01.23.11.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:09:51 -0800 (PST)
Date: Fri, 23 Jan 2026 21:09:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <yrjdxfyfrslr4iflok7iqaq7lzm7lvq7quxquh3ge47bhsl3br@gm4y3usj7wfj>
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260123120016.3671812-5-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123120016.3671812-5-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0NiBTYWx0ZWRfX2ma9YORPGyln
 yCxbbIuP6BUUikfbQc9bWM7csXgZZz6sN5uecsc9yZvGtedfbJIsQDfeVGHchw53OygFnTnRN1r
 6CcCByGKIQEXPrzUq8AwmpYxky7yaSev+rwHThpFNJNZW36nzIAXqYkqoMs01tbL2mQVc6n5FiU
 S3hsYDjwwAsM/zbsTnmnhSPd+O6tmntqtclt8K/4DtgmntM1S7s4Xc59rxnUPImKhDkVEhc+HNF
 bCFaH4rcpgbvYD7joa+v4EykbIndLmJTL70CO3rjpeAOQwUdLyYyMddxbBgS7/KL5lehZXkTprr
 sL1gUJ43Wt2MELRe1zksL2u19M5HamrV1XtNb8VR1kPPbd+r4xVYpHjDjXkJTMA8srJLHwFdm/9
 b3NUOt6SJWUIHFDCjsyABcFpT01vDP7/gjWnJDguMdIOctzWT2BSB1ryqmwBVOhgIXYmzRLpPlu
 UVR/sNPtzkcV0Rn4t3g==
X-Proofpoint-GUID: qwzRlLWBoZDmQeHkY3ZkxEaFP2cGoPL8
X-Authority-Analysis: v=2.4 cv=DuZbOW/+ c=1 sm=1 tr=0 ts=6973c781 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=psUOJB6t_zCGlG3Wsw8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: qwzRlLWBoZDmQeHkY3ZkxEaFP2cGoPL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90381-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23E317A0B9
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:30:16PM +0530, Varadarajan Narayanan wrote:
> RDP433 can have NAND or eMMC based on a board level rework. Since the
> same GPIOS are used for both the interfaces, only one of them can be
> used. Add a new DTS file to disable NAND and enable eMMC.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v2: Instead of including ipq9574-rdp433.dts and disabling NAND, include
>     ipq9574-rdp433-common.dtsi and enable eMMC.
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
>  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..d5fe12ef4300 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> new file mode 100644
> index 000000000000..c4989d00b18a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * IPQ9574 RDP433 (eMMC variant) board device tree source
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq9574-rdp-common.dtsi"
> +#include "ipq9574-rdp433-common.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
> +	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
> +};
> +
> +&qpic_nand {
> +	status = "disabled";

Please disable nand in ipq9574-rdp-common.dtsi and enable it where
required.

> +};
> +
> +&sdhc_1 {
> +	pinctrl-0 = <&sdc_default_state>;
> +	pinctrl-names = "default";
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	max-frequency = <384000000>;
> +	bus-width = <8>;
> +	status = "okay";

empty line before status, please.

> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

