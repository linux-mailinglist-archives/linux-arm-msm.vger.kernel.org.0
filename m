Return-Path: <linux-arm-msm+bounces-53265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28305A7C664
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 00:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14BE13B7C91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 22:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C1E1A3147;
	Fri,  4 Apr 2025 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOhfj/0z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B42CA6
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743806348; cv=none; b=kgwOzjEBhfgVlQ/pYJRVGMn2vQITZ5hpxtrMkcmhwqdCVILDQA8HxoVWxkhDYE18yZyz4p0cGOrfyqXfS7D2T2Gdw5s6sxTouUm9IRyk2hopIQAyRucntE4D3dMv/ytTHZzxvp6Hnz8Ftvg7dPpiQQTi+UGwRMY7epsq4Tt4JeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743806348; c=relaxed/simple;
	bh=T/MCyJIHRMBfFYIprBnwBWLv+76jEvvXlt9IoNC6Q98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2jdfkZv79U0XfoLRRGHbAW4kf47UDrlW0OY8jpu2XSUOHYzwS8DyDkFHmsA3ZpWDRZp36jaL6g/qZV0T9a0aYCR4M1ufvEicvFyuSg0fEqhqOxqo194bw+Y/RqdpOKQBfQ1LbUMWA84cvbK9pEJaoJ/9GIm3nSYmypFbMT4W5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOhfj/0z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEX1j012639
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oAQPPAwHz4E9W2g7oqIWAj/qTk23uygOmdFEWxol8hk=; b=jOhfj/0zRCcAbJQe
	qFeozMfMur4+mg0GLAWSsq/qWByJ10Zn03FKYICtyOqJ7DehQikQ8TOuqhBixExJ
	qxm3qFcRlkD6ry99hrq+4CiY7ydxVWN0gLiYpvPZ6gAg6+RaUIZeEmwJJn5vVdF7
	hkQxR9J3+JLhWhbXzcNHegkIDOyB6f54PSiOLrd5vapiiw/3oB4bqvAdqPx9l4hg
	W8cSl2mPs8VwYSFCkGHNuHXR6CSyaLtP2mi5JfyjxqFnbrEuuzIQhz16bbSkhJOE
	vXB8vcrhSCLAhAj6dnExSJHsKIyqWH5HOqnsJYmEVZZg4KFTX60kxRZ/7ZQBKchK
	BTdAsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d733mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 22:39:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-477608e8e4aso1179621cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 15:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806345; x=1744411145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAQPPAwHz4E9W2g7oqIWAj/qTk23uygOmdFEWxol8hk=;
        b=wDPm47kS1FqM9SEo7YEgigQEiwBhKVh2r1K3XJSnH92EcabigZh+zYUgKmXueKUsgc
         vlQc2VPu8dF/kH9PXmj8STBcRFUAt0KyUkgYmPThgJQdEA230QyAeg45dZXjiErvn/hs
         o9+7dAuFL0dHcZlqcEyBGYEGLdI5bB1SvC9v1LQJLlBKj4XldvUFpfSlStUN9rQy04b7
         3nf3oQoIlkpxI86jpvxi3noMb6EnYCeLI8bMJuhbA6pvIBgF5r/FiIn8dhvq1XXGSZEy
         H4qHLFZSZsxMP725doUaHf33LM0V6de+uLShtix2Pk62l++VRAXRP2ZDyZPwUS/fczGj
         Cwwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYpHci11aRM1cBrLDm5bZULCOITJTmr6xO6B3WFhMBIeLdHNzqLaGT/FHUmfjN9AfkRyfL7unuGJTsa8qk@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOX0Rr2kglQZGGDsoSX0XuskkhlNRhH7rS4rZZDU4tPst1ltg
	VuihSYrQcK854NowDVpJC6mpePWcijP44REGDTeQPTqoE7H4ifWjQT2kkhaL46gL9cyRZi1md64
	2PVthG/NtDq++6/ZQZTGV383dktKqwJqKd0EGw+qQ065ZusZ04hR8PEVNTH+PFRqR
X-Gm-Gg: ASbGncseVczpX8aoQegcNxoH6+PmcaVTktk0B5gFwZ8x9gxX0V+ORG/qYu0Rr8jMrIo
	yvGumR2DHi8pTE8drq7Cku39iAiq24ugOVYpi7D1CnD43UnxLNBx9yTyE6Y8smGhoL2k7Kevp/t
	nOq16h47kKHintQZVYev9zyuQSMHt4A7B7LmP7MEYDwB0lkhFPz4ahtNPI7EvbsdvefVX3v2bpo
	kMvxj/HNz+2ePPxkN0Ilo13qEuugyb4wbq1q1I7eAvj+izctrLGd7P/PLVq1roJF1XjpOomzRae
	E/YJQUbzvJVB7vVe+l4G4gD8TUJYDyVD3KDgzo4SwEbpsOqS2UiB24jreQJ1AUGkQ1IZaw==
X-Received: by 2002:a05:622a:1898:b0:475:876:ac3d with SMTP id d75a77b69052e-479249e2cd1mr26006391cf.13.1743806345082;
        Fri, 04 Apr 2025 15:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+NzcEKIjX/Q355mfL2t7DYQXJRcMD6VxP8/NFF8Z5Gmr/gnpuijoylXIpLqB0qI6DVbx04w==
X-Received: by 2002:a05:622a:1898:b0:475:876:ac3d with SMTP id d75a77b69052e-479249e2cd1mr26006291cf.13.1743806344699;
        Fri, 04 Apr 2025 15:39:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a9c9sm3106401a12.41.2025.04.04.15.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:39:04 -0700 (PDT)
Message-ID: <79c9ab2d-f970-4dfb-9170-ac3dd8b1c772@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:39:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfwI5Krl c=1 sm=1 tr=0 ts=67f05f89 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GLHRRWOWZVtnXAxWSSAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HN0bQAdlKlnxBZCLejp2xBy8y9kgzKkm
X-Proofpoint-GUID: HN0bQAdlKlnxBZCLejp2xBy8y9kgzKkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=711 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040156

On 4/4/25 1:55 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		gpio2-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi0_int_pin";

Are you sure hogging is what you need here? Aren't those GPIOs only
required to be in a certain state when the connected devices are active?

Konrad

