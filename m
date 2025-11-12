Return-Path: <linux-arm-msm+bounces-81393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 539C9C51E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8489D3A9F8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C2130C347;
	Wed, 12 Nov 2025 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbFmXmBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9Ft7HR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B1309DA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762945670; cv=none; b=EC6DkG0VDPRRwrKBIJKXIQsU1VoCoZgl3rnCLi6/gYSTrfbPmJSdni//ecxW99Pp1GZsXNpGaMeKDFBE5mFizMUQE1bgRSR48NzuqwwOu3LtyGKetCIH1CwQP3yPwDoKsVQmRcn7NL7barbb+x17P5Gxm66Fo8bGduFA+h/klk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762945670; c=relaxed/simple;
	bh=GHAbyl4yETBScmi+Spn18VZXHiQdet69r8rooFugvlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jn4627in+GDV9xw2G7/J5q/8vc3hDmRTOTZoVZqPDTUZEdhhDnesBdiGxazfQOn2zM1pZl1tmmZwD5JihYHaNLYBKDJYWwGE1rgSF1Oev59owDKJRhHdofXiSteN49WpLGaekrdNuvYWDKoO+2q0HvR3fjCT4QFNZdNIhLBWnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbFmXmBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9Ft7HR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9ggR21109094
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=; b=AbFmXmBTta7gKjns
	M54/EkecUo+B6cPlccmI4n5Aj9/wqRd2an+bzFJ+ms700a4OajXZeUEs0gXWQRLc
	etsB8+PdB0dKId8+lOeFMHY7TYoDx1ABopbYg7tBtpG6H6xL3S35HNvLdVM/zgAq
	yfYjYPBDelBKRb0j2yq5sVRydVg/9Wase8IyulhN4dEeUlmoH2zYiu39rd5AJymA
	5IfH9hlH087LSQuSPibn+jT/AI985QAaVn+au/GJ6aMhUMY+rDwa++KEfRyjYwxK
	dXGbWqcERW93lnoYSWvH1QxycRclRX0ECjE89dnAtVJyZcIgPp1aXQ1KNS+XJChv
	rcbN5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum083h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:07:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so757401cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762945666; x=1763550466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
        b=H9Ft7HR2e43dvOcW3wqk2JMmR6GSZqe8kUCXKq/LcDL22M8gF2iJ+IgYSqg8XHDkP1
         7wP3RmgHgdidmGODm39oP6mumFX2+sv4ODN/PtpmE4At4xO7FpbybqgLtMQTFf92T7y8
         OQ+c0s4BuH+Vz9H1mExiQsQax2RHhcY/iW+y0Rz76T/wYVzZRqySSR1/8BAbIuoS1Agt
         nnKCPj9bzryFJuKtyskr59TXTOPCg9QRYJD6eOPU6jZuk/V6PCTKdc763F/+mnDoDIX7
         AHh0lb2UW7iVI3XHVNfoaK/6wjKOYFh2Dhgvf10/xfmCpdimWcNdEDcZnvFilkr1KMRY
         FQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945666; x=1763550466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
        b=F49aekrwlwn+eKnHOR7aub/j1tcaXKPU1h1aYz6tFh2O96xBB0N4X+cFLnypizMecl
         wtEMBfsz/ztorEnRXLhJSSG6Fptxf2rGJEgDvQzGoyZAd0IDAeHEt6C0OV3o7JYNzaNn
         p6EAX5MZHgi4PCA+z7kY79vmAL1HPYSKUzWaDl5adPcblmzKQFAziGh3M21Rg4wS1jsL
         sLb6GQ0JhVwy2nvszvYM7sKHngwwi+CM4N5b5qsjJYuh01/tcz2VLJqJ5/S8GjCYVfrw
         3iy4algqOx4mvLLsD4XtLWtnNZmsrthkaqlINH2FVnyGL82SYPrBsV9wIlxgDF9eK8L6
         PXxQ==
X-Gm-Message-State: AOJu0Yywv9hNrZmvuUbd1972z79SDQvgURPIBkY7jqbV8f4hNdu0aaEi
	mIvr+4RsRgKbuwxU1e+hdTFrjszVWdCXN0YSKjaiMxGM45SYkDMsP+zQvFHU2jN1KTom3GjXEui
	xX7ZokQ0dUCYnHkIdfdSKD/vNp2IrAoqUGMYCwMA5pqdH++6kGHQKx3t8vmT5JVZWuAz9
X-Gm-Gg: ASbGncvBIOlE/dGye1HHLCcTOUx65WpLrCfbQAprJwrn6/M9G316bINkxzrOYkorf/2
	9LnrJGGGZrtbj3qDSq0VyI7mWPT5ldq3APELFp97HK68P0PTxeC1yXKuR5VnrdhEYSoq4vUCSRt
	Bx3gcnjSHLLhyCE/5FSA2no1OxlXJdT61VpzDmsHKKHAmg+LobhntgX5Lmcj1hZJSOtLc2GPaXi
	7CpnV8sV3yPrFVv6Fc/8VIQohjNEdSxqjRaTSm1YBD7CNBqWAlt/6E3mDKxGQU2XckPwfeCaf7f
	GyNTLoewLl5rS14AjyMrrku9x4UD/y1cEb9n33NbhuYODbQ/m1E+oQld8D60UquRfbN6QmktPIi
	12u792oBIMpAoqSXI6n9TEyYqJtzlXCGai24O0r9/tMBIN4FDQBRhFg27
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4eddbcc8ccbmr21834521cf.7.1762945666336;
        Wed, 12 Nov 2025 03:07:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsThee/kJ9PQlX1eMjNVcf3pwMggayYjNqOtdauF4RKz6aTdQHNiSCZ2A6kK70/XwvxAErjQ==
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4eddbcc8ccbmr21834301cf.7.1762945665887;
        Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64165b2aa03sm10031978a12.6.2025.11.12.03.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Message-ID: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4OSBTYWx0ZWRfX+/Mnduzdldr8
 xdR/SDZhckFbBa//aIQVzGhsijGntO5nDQ1NjltT3NRgRNiIcWmawep1NdaDuxtASyY4GDm64OJ
 i4cTzXhRJh9EhjiF1J01w2Le8HG8W8OzkACBy2pRZGj7GZDIplLris6vVPr4XwfP1MxQTXsy50z
 MQ/+BqS2Dn0nLBFCGixeH8cdscQsbjitcgkl5Kv4vkcyt3Ub5Rt1QoFdC1fICsywatSrtAfm6k1
 MI5RV8kh/DitYohZcKdfrknXNzjVMESWYs5TBdQlCCxuLEgrySm3d5Xfl+zuZcE0ReEQKtl7coO
 MJmX7HTX5APTFzDwa3i0u1SAbAGGP2p75/aA9U2daJfpEdHECuu5MNI3gfeCNXDtSQi3YRtbPEA
 kKfMD6lbBBPenCOOWV+8ariO+O1w/w==
X-Proofpoint-GUID: Uc_ccNqg16dr3pP-9huZV3pxCTPvKwPo
X-Proofpoint-ORIG-GUID: Uc_ccNqg16dr3pP-9huZV3pxCTPvKwPo
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69146a82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XSWwlsXGtsdNaMXbhvkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120089

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Side question: is the AQE fully functional on any gen7 targets?
A750?

[...]

> -		adreno_gpu->has_ray_tracing =
> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +		/*
> +		 * AQE requires preemption records, so disable raytracing
> +		 * if preemption is not supported
> +		 */
> +		if (gpu->nr_rings == 1)

"nr_rings > 1"?

> +			adreno_gpu->has_ray_tracing =
> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>  	} else if (adreno_is_a740(adreno_gpu)) {
>  		/* Raytracing is always enabled on a740 */
>  		adreno_gpu->has_ray_tracing = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index b507ff4e1756..7921b4a68937 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>  
>  	struct drm_gem_object *sqe_bo;
>  	uint64_t sqe_iova;
> +	struct drm_gem_object *aqe_bo;
> +	uint64_t aqe_iova;
>  
>  	struct msm_ringbuffer *cur_ring;
>  	struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 78dcb9bc3377..2ef69161f1d0 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>  		goto out;
>  
>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +	if (a6xx_gpu->aqe_iova)
> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);

I believe you should also set CP_AQE_APRIV_CNTL per-pipe

Should we also enable AQE1 while at it, to reduce potential backwards
compatibility issues? Would that require solving the iommu woes?

Konrad

