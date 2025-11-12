Return-Path: <linux-arm-msm+bounces-81500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95337C5497B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 22:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 38C814E057D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 21:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EBF2DE700;
	Wed, 12 Nov 2025 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keh42dv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVUxVMu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25429DB64
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762982217; cv=none; b=RqY439PZTts0vreLPtGwq4JDoYGln5poROH9zsMVhxo0e8G0TU3GgQFWg7nzS2hmt+F6jpewINQv9b/ByHFvNDbUyDB12yqcu540eIGB0TdBzHa+MaPqhcfh1q4Yw2sqxgyCI5RghKPUVB/gTwRPte30x8VGMPEX7xZhDQBYtN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762982217; c=relaxed/simple;
	bh=uoYVhExYnbof9LSxnCeZcfCxSRtSH4o3C+hFXV3ob/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDRMF8fUb1D5mh7WkArXwhwv7uwVTtcME2AQ/9tyUG0D5nwuokX+gRESblGw2XH6j3JV9VOt4zEEFY4xIjhM/lnT0JqQtOpN/1zXqwPbyfAjQ2AvwAWIHF7o+zBb89BF9yUO6AlNBzNwTb++ZwA1GRC5EsFfMjjUdo3PZYCtYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Keh42dv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVUxVMu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFvN3T510056
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 21:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=; b=Keh42dv6DiOMyBbz
	5Tbb1I2a55SDATcKLk323qMBe+6ZMJPIQLAMr1FFEzCZuoxZQzPUigsaBfmTl6OC
	LlcCJOFwX5oZ9HGoUA1JbcLVzd939kWrEogRs16f7lciqkrjMxDELr1QebNgRrga
	ctmGxyu0pLDW5RIUhCHdTPbuceAJ+je8pQ68eam4KBjvxOrUrGM+BDBdv82cNtj8
	Juakh5ix88e9JCvbkO0gU3USEDzkWklSVR8UQAxNXLc7tO2H+OzxkI4V5t55llu/
	fIt0cUV8F18JwwIvRHdlkkkT6Kpv5Bb/xaLctPAYXZzhk/yfhdzUQ0AayOS6I/Ga
	oRQLOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdgj9yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 21:16:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f48e81b8so2635215ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762982215; x=1763587015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=;
        b=VVUxVMu0NqHcLSwop4xFyHi4DK9/yV5eRd+MJm1COYrbkdMnRf/6p/VU7IPxntwURh
         n+fIyiUj5OvwLim9/63XFvO0Z4pUcyudtIzbbXJsrKNmjVSK7+SKIkvGCVkBm1H6pSYP
         mcS9+OIdZvmeVni7orhCOxmizXCBkPPtUtud5tMRObA6EDeQHX9WO+QcVeg9fkokTo+K
         ldILcAG3S6OH4p5iBkDoMAdrv4UBgmaYggNtZYE46KkDu56WcQVb03MO+ZRH3bprudWv
         CMdia1aJKAxMu8uZcfhctC0RdkNAIUcYBYzRBVkOtN0hKFjpYmREehOuhxFPZ4aXRu6c
         rfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762982215; x=1763587015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=;
        b=G1VVxgH4h+8NLFcidNRZQ+S/AjBQkyEzT+E8SQqE4l3IWXI16vDOnhbCDrpPqxJkSL
         LdmfETN6CjBb2RPmlIGSoPfsv/2kt7M+rW/bmb7Jl5zGZxNBgmLp5UWzXiUtzZ3EK0Gh
         vTtgrVR4OL+LqpaQT9o3w7XjlQAT3t2IjFQqcN+ghIk0NZK2soCEJnA/cB7yqoOYA/+r
         BLfx38WdLL2WTLylVqM69Vm2kmtU3m/v03sMmGzv2JCuBvhe8KPX7jCQONrmEcNF1CWH
         kDVFJMes+rjwiS7X/HtBIxsWskIpW3zzK6P1ryu/zU4W44iKwPMgwk31HvtXsWN89mOP
         /9NQ==
X-Gm-Message-State: AOJu0YzeyShjHvh563JVNIYvKBSvZbYlPdO09R2JF0ZGzPTkTtPBvNKo
	IprO3NcKzwi7r+6hDgPRMLcMfwo7BbKV8ELOAuFv1J+vZRB4exC9EQfYMmU2BP78dYSPnovzS6i
	YxDMVoaRjRlMPWDgA8QoakS3Y7Fc0Afb78M5p1SkkwkAw4gA3UcwPbIdBEB3rrU26IffT
X-Gm-Gg: ASbGncvjorYUmkGaoIiEK5Dd3+gs+aBvkN0iSBF3psHzJboUxnBwwd/eaCsSLU8zyPc
	xfqJCBLvhijJoL8I9SFTJgsWLFvk2gJnO+5XTPMHBe9pMKIu0mItsOjraCqfhFNrYM8WK3MdFbl
	/MMKNmGLUXUhebyC8+Hl1PdrHJzjsNRNSppOaLYdwFFwqeEK13fZr9bDrJ58Ql6Dm8c0IgnGn12
	6IRjoP0TyNd50s+Ah//scWkNnAuuz0G0NXDPwIpWZE5Zs4/3NXa4WCon/bA0R3MR+fT1p/w/6sY
	UAi6zVbJqZudfWYVs4yWN1aXGyY0f9k4TAqs7MKjo4KVgj0cfNMPZxLTZbrS/QRlr1owiYQlcXL
	Ut+U1aO9+Hb/H901weCRx5w==
X-Received: by 2002:a17:902:e951:b0:298:88:c006 with SMTP id d9443c01a7336-2985a4b366emr11201055ad.4.1762982214701;
        Wed, 12 Nov 2025 13:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfYCKhd6MQEsF06e3F32Ghk4Zj+VCRoijQ1Gh0yc34lnyP12H7UORYvh0CdBd1dlZ6GUpfaA==
X-Received: by 2002:a17:902:e951:b0:298:88:c006 with SMTP id d9443c01a7336-2985a4b366emr11200475ad.4.1762982214157;
        Wed, 12 Nov 2025 13:16:54 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c16a1sm916005ad.95.2025.11.12.13.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 13:16:53 -0800 (PST)
Message-ID: <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 02:46:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=6914f947 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1HEVVvjKVHWHBA54g4IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: LfdFnREFH93nKNBc9kkjcBLI78Js0tis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MiBTYWx0ZWRfX4gIXYLQnbWRQ
 D/ZZWARDOclokfn22bEGpoayxxhg2uVoJzsculTOod/6214H9hO4JRSW1ItJ7n5Utph9um6wFix
 R75pwJOWd5DTgNa7Hi/4KnewItTmK3OYcRpQb/QuAbIi/6s9JJHH67xvV3EvEX/kKiJwuCizQGH
 8Kj+EmjQgYO2fr94+GV31DTuJE5YYcCKETFdJVS4hIl3Ba4r7iJIeH28+2bKgo0oPSXfHT+hQGM
 ZqelhVAfpa2PEBxBFN+b7uE39dhaetmNCTK1rcKll4eRowaEv+DRm48RkqF9NK3HEKhhmFvJBji
 fEzR1Pto2OxjW6t5eyv4UFJT9tN9i2UW5WI9wMiTw6Js7iK8WUTrCBiKDoeApNuRnZO1kcy5eo7
 cM7DgP0wjL94+Fv3zkrMgCFrqlB6wA==
X-Proofpoint-ORIG-GUID: LfdFnREFH93nKNBc9kkjcBLI78Js0tis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120172

On 11/12/2025 4:37 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Since AQE engine has dependency on preemption context records, expose
>> Raytracing support to userspace only when preemption is enabled.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Side question: is the AQE fully functional on any gen7 targets?
> A750?

Yes. Only A750 has it in the A7x family.

> 
> [...]
> 
>> -		adreno_gpu->has_ray_tracing =
>> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>> +		/*
>> +		 * AQE requires preemption records, so disable raytracing
>> +		 * if preemption is not supported
>> +		 */
>> +		if (gpu->nr_rings == 1)
> 
> "nr_rings > 1"?

Ack.

> 
>> +			adreno_gpu->has_ray_tracing =
>> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>>  	} else if (adreno_is_a740(adreno_gpu)) {
>>  		/* Raytracing is always enabled on a740 */
>>  		adreno_gpu->has_ray_tracing = true;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index b507ff4e1756..7921b4a68937 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>>  
>>  	struct drm_gem_object *sqe_bo;
>>  	uint64_t sqe_iova;
>> +	struct drm_gem_object *aqe_bo;
>> +	uint64_t aqe_iova;
>>  
>>  	struct msm_ringbuffer *cur_ring;
>>  	struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 78dcb9bc3377..2ef69161f1d0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  		goto out;
>>  
>>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +	if (a6xx_gpu->aqe_iova)
>> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
> 
> I believe you should also set CP_AQE_APRIV_CNTL per-pipe

We already configure CP_APRIV_CNTL_PIPE for this.

> 
> Should we also enable AQE1 while at it, to reduce potential backwards
> compatibility issues? Would that require solving the iommu woes?
Yeah, AQE1 is strictly for LPAC workloads. So lets wait for LPAC support
first.

-Akhil

> 
> Konrad


