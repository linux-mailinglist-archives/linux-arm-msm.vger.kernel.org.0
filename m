Return-Path: <linux-arm-msm+bounces-78853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B8C0C87E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 793DE4F6F14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83142F49FF;
	Mon, 27 Oct 2025 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7aPEElT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A02F39DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555284; cv=none; b=Zj8UKwNGqTX9ofoCOg1Bmyhj4LbbT7h3MMexIN7De1MpoZnboSxzE9JkYSOL8rv+iJoZxoz3hHmoGu1XO9kcGFq15Qj0NstKyRgp2+ekw8JV//zJ+xba+uSxId/EXu+TKv6pdq8htuHRs0wCL2rlVV1hI2HtuwAo9FTjhECRqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555284; c=relaxed/simple;
	bh=T3wiDzCS8Cx2yECDwJLg4DR2PLGzEmuefrc+tf4FsdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRWPuu5q0+iptQDy3aY1y70KUg1gM/59BFtHoxhPhlnwYx9ntdYSiEWVvf/v+qJ5xw0/Lpfgim6JXjVeF98dLjkBu4JKmCinEKGDtXKjXLrlOMxJ5ahS9wTUMwqV2+yMSY7J6ykBOIL99EVgRRtYkCXPzoYU5A7g/sjBr1s/Eps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7aPEElT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8aVZA1064012
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OoULc+URpmAWlFcWdA1+PXx4DH1SpECI7395nut0v2Q=; b=W7aPEElTWRi+7kM4
	auGXstipGxx2h55w0mNZ9Xph91szY+gjfCWp8fguU6FSmoh2WD5TFRGw2bE04dif
	/1puXIbwOI9AKitKwp6tWC3Grbqmqc/xt8Q+00CE++/yUPhV9ovE7FwjieBZY5Al
	CqhY4gCzQxEh/S+bSP1jhZ8ST/aUlnsFi5EpFnihcV6BIn41XQ8Hq6zgBWDgHt1c
	IibjEuav1evJWCMn7zyXL1lNUXbPJdSa1hBJNATe4zcxiYR74ow4qWxNmNQLcx1H
	VoM0P0MhuzdTenmLAP70x1ofNxxciKvCNWR+PZE+zyuCDIaps0olSivY/DRZsO9/
	v7+ZTg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0px6kv47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:54:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7f5798303b3so11226826d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555281; x=1762160081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoULc+URpmAWlFcWdA1+PXx4DH1SpECI7395nut0v2Q=;
        b=MTcRjQrs9vlTOzFZ3adQ0iFdLxBjkaolkSf9tEZWv3hmy4PuF3CRQzcXDiybx920oW
         Vhjc8hMLiHK04iC09cxhMjJdfhqagnZNHec2NWXwnfdJizisMw8Ij4/V+H50FhBRwWWV
         23g880vtnbMQXkxTu1iN88BjSg3i6y1SiZJOT1XNvCrG6C++wEEFLY8uMjDXeR+8WAEJ
         jSIH6iEOuBMd7zs0HQilokdfOYv2bUJWlPzwcG79XI2zq12r+d0w39BxB5kVMOQSzGnW
         6vQwy19aofvC22/+T0empu6N2xm2haaYjEMYDvSbQlwRQvX70B6y61rSDRQd3MtE6Guk
         lLPg==
X-Gm-Message-State: AOJu0YxnIOVRMQGlvvecvq138n8qfTn3qw3CR3RJxEoGVPzzm6A6a4JY
	UdboTj7tI1IVHeZWRBqK+Y4AnfVsr8XTxBfKwVciteiGL4UBU4/qJl/1GCs+KZYN9z5KQzO5qEA
	MyxSofmAYmN54JCQSBAJeMYsmj/kl0Hb3ymLyaxeudGIeSL40npkgWB42NTHEm8GHyWoA
X-Gm-Gg: ASbGncuiLXICAOsArxufzjKbIBDoLFq9o7XQibc1QqUdwM9K9gIAks9iFBqC42mozgG
	wmgS3ypWv0Gna9g1P3n06V2/x7w0FMr192hcP7SKT5OQKKo+uhNkZ/wnRF9S6AyxMyTtBstPDlB
	5N7Oxarc/gmZiaMlNXpCGxQ/LSaAB3O3hZrZoTs+7+jw9nCnMtD/Y6wHG7Z4P3dDYSZ8gY+rHbM
	+jGFbePznQwbsZ+fxLJhAAz4I9nXi5bQ7zTVHBgQr5V2DfuR7IBBCiqhMIZJ5DWokKO1TpWoItp
	6ecrounhYdX5mowGKfKsstQLBluB2JY8/yW0p3895toPDbZSzOzaRYw/O8CWZt3NTtABq2kG7qz
	aevgIR79LO+PvQ/+eZwYbL3yBvWZdhaHz+EFq3c/9kOiSEBH/MUvq6P3b
X-Received: by 2002:ad4:5c4b:0:b0:87c:cec:70c8 with SMTP id 6a1803df08f44-87c2068e2f2mr303759546d6.7.1761555281273;
        Mon, 27 Oct 2025 01:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsD82goqIriQhooYA1UI8N5XkNryp5MmcrzsMjrad5PP3m5SwFja48sBzlrZf8IGQYcKJ5Tg==
X-Received: by 2002:ad4:5c4b:0:b0:87c:cec:70c8 with SMTP id 6a1803df08f44-87c2068e2f2mr303759426d6.7.1761555280776;
        Mon, 27 Oct 2025 01:54:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077c7sm703606866b.7.2025.10.27.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:54:40 -0700 (PDT)
Message-ID: <bef7c78c-2257-47ff-bccc-a9422afb1c42@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:54:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: Add HWKM v1 support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251026164708.2771213-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251026164708.2771213-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4MiBTYWx0ZWRfX1aoRXV1EokDM
 2SiUtPfSI0QtN/PiO/MpgDvQ+Eb89S79mMQGicX8TL1dp/6YX6NypjMjrM9L0qprY43yrHbqtvD
 UzckogdSA1OjhXLYR5r9D/V8UH1RIeKoa2hnDlfJ9OqnVe2ZTgA9g80xxovLimKB57aU4MPkh2r
 UjWVEAj+/Cg78nnW27g5+PM+FLVr3vjS0EwHajfVB2pYlYpD4Ym+NJnoI4avhwqo9Dcy2zJ26rI
 IPR6c6/HTw4OblhP/GPwP5coavavLIO3u+Rs9AarUrebbd79yL4XBq3Ujz1BENbXrPmEGf5mpYG
 yvAd2xV3KA6yQxqWey+0/mzf4GRqmV27+EPUqETcEqMgXLRNvWfvwgqrpC2EB+ztwMu6ITjW6rK
 UN6m+8d/NcHXd/2B7enSzZfsLwdh+w==
X-Proofpoint-ORIG-GUID: bpLABqOVlOIyTs2ofIrf8uBfvPedeG1p
X-Proofpoint-GUID: bpLABqOVlOIyTs2ofIrf8uBfvPedeG1p
X-Authority-Analysis: v=2.4 cv=WqMm8Nfv c=1 sm=1 tr=0 ts=68ff3352 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Gubjpvm8v4gaY5oPTcYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270082

On 10/26/25 5:47 PM, Neeraj Soni wrote:
> HWKM v1 and v2 differ slightly in wrapped key size and the bit fields for
> certain status registers and operating mode (legacy or standard).
> 
> Add support to select HWKM version based on the major and minor revisions.
> Use this HWKM version to select wrapped key size and to configure the bit
> fields in registers for operating modes and hardware status.
> 
> Support for SCM calls for wrapped keys is being added in the TrustZone for
> few SoCs with HWKM v1. Existing check of qcom_scm_has_wrapped_key_support()
> API ensures that HWKM is used only if these SCM calls are supported in
> TrustZone for that SoC.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> ---

The subject must say "ice:"

[...]

>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> @@ -114,9 +126,26 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
>  		return false;
>  	}
>  
> +	/* HWKM version v2 is present from ICE 3.2.1 onwards while version v1
> +	 * is present only in ICE 3.2.0.

What about before v3.2.0?

> +	 */
> +	if (major == 4 ||
> +	   (major == 3 && (minor >= 3 || (minor == 2 && step >= 1))))
> +		ice->hwkm_version = QCOM_ICE_HWKM_V2;
> +	else if ((major == 3) && (minor == 2))
> +		ice->hwkm_version = QCOM_ICE_HWKM_V1;
> +	else
> +		ice->hwkm_version = 0;

"if major > 3" is more future-proof than "== 4", unless you know for
a fact major == 5 etc. will have an incompatible software interface

>  	dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
>  		 major, minor, step);
>  
> +	if (!ice->hwkm_version)
> +		dev_info(dev, "QC Hard Ware Key Manager (HWKM) not supported\n");

"Hard Ware" looks *really* poor

[...]

> -	BUILD_BUG_ON(QCOM_ICE_HWKM_WRAPPED_KEY_SIZE >
> +	BUILD_BUG_ON(QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version) >
>  		     BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE);

This is not going to work how you want it to..

>  	/*
>  	 * When ICE is in HWKM mode, it only supports wrapped keys.
> @@ -238,9 +266,18 @@ static void qcom_ice_hwkm_init(struct qcom_ice *ice)
>  	 *
>  	 * Put ICE in HWKM mode.  ICE defaults to legacy mode.
>  	 */
> -	regval = qcom_ice_readl(ice, QCOM_ICE_REG_CONTROL);
> -	regval &= ~QCOM_ICE_LEGACY_MODE_ENABLED;
> -	qcom_ice_writel(ice, regval, QCOM_ICE_REG_CONTROL);
> +	if (ice->hwkm_version == QCOM_ICE_HWKM_V2) {
> +		regval = qcom_ice_readl(ice, QCOM_ICE_REG_CONTROL);
> +		regval &= ~QCOM_ICE_LEGACY_MODE_ENABLED;
> +		qcom_ice_writel(ice, regval, QCOM_ICE_REG_CONTROL);
> +	} else if (ice->hwkm_version == QCOM_ICE_HWKM_V1) {
> +		regval = qcom_ice_readl(ice, QCOM_ICE_REG_HWKM_TZ_KM_CTL);
> +		regval &= ~QCOM_ICE_HWKM_ICE_LEGACY_MODE_ENABLED;
> +		qcom_ice_writel(ice, regval, QCOM_ICE_REG_HWKM_TZ_KM_CTL);
> +	} else {
> +		dev_err(ice->dev, "Invalid HWKM version\n");
> +		return;
> +	}

The else path is impossible to reach

>  
>  	/* Disable CRC checks.  This HWKM feature is not used. */
>  	qcom_ice_writel(ice, QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL,
> @@ -298,7 +335,8 @@ EXPORT_SYMBOL_GPL(qcom_ice_suspend);
>  
>  static unsigned int translate_hwkm_slot(struct qcom_ice *ice, unsigned int slot)
>  {
> -	return slot * 2;
> +	/* The slot offset depends upon HWKM version */
> +	return (ice->hwkm_version == QCOM_ICE_HWKM_V1) ? (slot) : (slot * 2);

The parentheses are unnecessary

Konrad

