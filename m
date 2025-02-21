Return-Path: <linux-arm-msm+bounces-48989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56EA40007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F177019E0D2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415AD205AC7;
	Fri, 21 Feb 2025 19:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYe1LYof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9721FC7E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740167487; cv=none; b=QjVKhZ75Sse5E0UGcY5OAqLHRKiUBo+uQHirh5F74hQiqQ/cbD5/1kE1o6Dl+EtwYP4hkQ+a4hipLs6sbnozB6u6V1GsEGZxEgc6bqE3pGDZRAxq55ANpTRXvcrHKzijy6L1sBybQmvzHjGby8ddumEmP1jXv6auhiaYGu5PfGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740167487; c=relaxed/simple;
	bh=uyiF/QHDt3ei/5eDvHIAfJrbglGWLmfExHnZHGY8eE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=js31vShMbR6M4HAO0x8/8x4ymYrvzyjJRUzaEVWp3JPQZNHRpimp4NlPRx3k4TLeBapgSM8G1QERQ4ZNRSLDAMGETOmDBGiCW9GZTNS6xA4D8HbR7gA+DRb1GdYiLYWj8BU2XJLKoqb8mgZzy2vx9i+/Qubz8Gq5IpYqSe8pPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYe1LYof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LBM32j011647
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slCnnx3Ju6AXQtgwn1/8Fq3BnRvUMWgyzQWIGQVJ7rE=; b=mYe1LYofpZxGtTo2
	PZR8vjH+2x2+Pa2T/nsiyynsYjx1MYLgVpzf/PUE9XhmCpx7IudhsQBreSAPr5a1
	b14qv6WOrBY2e3MGlyTxtI+1P3HNGH7QR1ajn6G/UZ5q+sPJxYCv2VMhXaBzMSor
	ZGVmcX7yCWjGCz9qXgYXH+8cQcrEqGU1oylu/tiils4aPAI3rmp1L7GwP2a2tU4W
	M+8mPpRX7M3EHsu0Zrf0RHvvq8TgpazbjtmqqeyUooncrXZspE6W7Oy8uhr4rX31
	K2lbn2B9G+WR6XBBQmUFyi5htbEuIkP/ZxUCqvEK1tKcjf0UAzuMKCDS/2rC+22E
	unwRKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3u1dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:51:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-471f426fe28so5923861cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740167483; x=1740772283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slCnnx3Ju6AXQtgwn1/8Fq3BnRvUMWgyzQWIGQVJ7rE=;
        b=wdktNtjaa8wmYCAPrpfzdtwxsKH/QjdE4mB06bVZxRCMz+z/2kbxTjLeVxAWYQ74W0
         dS4+UoWUUIl6XBx2G0d4U/nqkkgEK3Mkxhf68Y/u1GD856OGDBIylwsZd5wgAc1b8XLK
         jN3k4yfA6WFfAc9qTK5SvBgzisH4ssLkmQikoKikqQ6KiGRqLH6Hr8h033xAbLpAB38L
         Ez9dBjQBZKJXC1yVD7Vx59MLzYOqc6+CiDqClkxYFIKKyqbK1IW0pBgrIfxMNnOZtgtK
         nVnrwj/DOF3DFZ8kv0xC8OtWMnVvkhFdwGOE22f9RjEQj5NQqeMgtU0peSInzhJ7qaBa
         Nu1A==
X-Gm-Message-State: AOJu0YzMWwxpf+haTGX800zIB/cECRuq7f1YpueAYxi2bNpyrfFEk8Rx
	aF3dkjX+dSBNjvXRHcbN2M0tkTocyO2OMzavuEGIOOsBDgLTWo+czvYtW6hlAf16c/xgnbRTtjx
	C+1Q5iGIrKwLGf3k2Y6rTjYGOrd784BQQfP35b9Goo0JJVhmv2rFPbhdQmbsT1Bcv
X-Gm-Gg: ASbGnctm+YoEMmt8eC+Tigj7L/VRewi1Su/KMJ2qFJXfZgswlQSH4WWMxtDjsIAXzg5
	g+quTM1PSNT09/z0nu5Jk73BpcFu4QYsV6hPa1z0t28D3w2jjXZ4Q3PHI5D3PZQhR2n4DJ2SuzS
	8PYmnz7eNIlY140FooIw1tNpyrdg7c/5Dyqj4SV+p6qQyWD2/Txms0U1bS781ItqLa6HkvprOCl
	Hf7nZcNXX5L4m5r+7PH787mNeHImZFv9RTgJtNzU/SyIoFBDC3EEmDwHlo2z5WEfzFGOWmY3dgu
	BztNHxnt0f8p8fHuocBFlggh+12NWoQMjV53tvhRX3L/F9h9Cka3c1T8aJXkMQn2HCEaDA==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr23685761cf.13.1740167483227;
        Fri, 21 Feb 2025 11:51:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkR63TPCM61UzrS8r5cdu4GiDJKbAb4BpmgRg1ZST/E8eZwpjn3gXn09+LIotX9lkdJBHVdA==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr23685481cf.13.1740167482783;
        Fri, 21 Feb 2025 11:51:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbad297430sm867677566b.5.2025.02.21.11.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:51:22 -0800 (PST)
Message-ID: <638f05f4-3a0e-459d-aec0-b925ca7f657c@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 20:51:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix cluster hierarchy for idle
 states
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_lsrao@quicinc.com
References: <20250218-sm8750_cluster_idle-v1-1-5529df00f642@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250218-sm8750_cluster_idle-v1-1-5529df00f642@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1eBxk2GEsdBJWGtc96eSldhFSu0CGkm0
X-Proofpoint-GUID: 1eBxk2GEsdBJWGtc96eSldhFSu0CGkm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=861 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210135

On 18.02.2025 7:58 AM, Maulik Shah wrote:
> SM8750 have two different clusters. cluster0 have CPU 0-5 as child and
> cluster1 have CPU 6-7 as child. Each cluster requires its own idle state
> and power domain in order to achieve complete domain sleep state.
> 
> However only single cluster idle state is added mapping CPU 0-7 to the
> same power domain. Fix this by correctly mapping each CPU to respective
> cluster power domain and add domain idle state for cluster1.
> 
> Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..3af928be5b68b47988dd55f4add8e3712f07d5ab 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -178,7 +178,15 @@ cluster1_c4: cpu-sleep-1 {
>  		};
>  
>  		domain-idle-states {
> -			cluster_cl5: cluster-sleep-0 {
> +			cluster0_cl5: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x01000054>;
> +				entry-latency-us = <2150>;
> +				exit-latency-us = <1983>;
> +				min-residency-us = <9144>;
> +			};

I don't think this is necessary, you should be gtg with just creating the
new power domain for cluster 0/1 and pointing both to the same cluster idle
state (unless they both need different latency numbers

Konrad

