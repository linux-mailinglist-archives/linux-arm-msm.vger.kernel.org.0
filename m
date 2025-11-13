Return-Path: <linux-arm-msm+bounces-81704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C0C59E81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10BD74E3325
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE0030E82A;
	Thu, 13 Nov 2025 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBXyI0gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZ6aQ7Fv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB572C2357
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064607; cv=none; b=LJMoCjB2x9P2mp01gfmNnj0dEGlHtZLBYfClkX2tYls9wanUdF8NVvpjWuQF6Zka2DKhzEZfxzFx3v1+mTWA6yZynJwYn0XrbmSx4gAj2YtTp8QbeIy1iUXTMhTkuqZzXybX9CbxtF6/QP7ETxfRQU/njtCob60Ti6/9KCEIm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064607; c=relaxed/simple;
	bh=EBHCvOjhq4ypRbbHuMgmE9YiEOZDb5Z2mRmWCl8wBkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tn3y1/p4HrpO49DNKnF4EPRf1P3QzhWsoYLJTVcp3tWXKVbdfVOIEoGbneZU8ANhMlOO7JHgxTZMrxodxeGLSk8iN21oCfYhfq59IP0afz+eG/dnp4HojkIuxaBr3s0IlFBIzIRRX09jRyhM2pYAZbUL9Zzb9aM7W5OKETmQlPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBXyI0gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZ6aQ7Fv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADH2lwm861267
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=; b=oBXyI0gwG2mzWFPb
	YLePrDX9GYEoRrOR05DxjZbPT55KcIzhujqTdpUg2R5vrrBa96yTX3gmie+BPUC8
	rclPgOmmc0RHKknAodh9cYAEDO6o2LcSLLWqaNNvtY8Y53c6d2tE3x9t5gKItNrK
	LJ3K08GgCBaCJ2N9gfUiP9EGwVx3h3ZmZMx8RjjKB8mNV6/AfDZvLJeieKn3J0yQ
	0TOiYYT0ckAKVQErNFW7zyu/+l3lVoGrl5Teqpj5874jr/BmDKQLG4iMunAWFCuG
	ySmI7Tj+Yvyqc4/VVvdxloQeexx8kftl+PMqAiQp+M6a7J07mw1gJG4H/QKXCqhc
	xPI7eQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adkcw0jac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so712743b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064604; x=1763669404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=;
        b=QZ6aQ7FvN2bj7iiHavK+9u8XQCQdkLo2LCj/wdITbo76PyTDKjsYH842XfT+Dtc3XV
         hli3Dq8ptVQXcEUKGQ5Vj7tYVD6REAI8I1GnC+YwFZwJx6SYTtj0yHYIwn2qLsEejUif
         GH21EVvX0J7NTqo12Ykp3nUUf5s1PZv5hzTFRcOSOaRlk8YeZ6hk963n0Aikv3Y11b3G
         qag9vs4q00b+rAvPuL22igjL+8duAU4AUCnYdOoyTuWwSMJ6pbFAUySn00I7lYBpw6sF
         v0jmc5nFa5K7dtfHab8c4bOSa76xYJb/Xhn/EGZyc1DkU3TnxmOiVkvfH24Dm005kyvj
         lBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064604; x=1763669404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=;
        b=jHsBDTFSwWdFRVtifeg1ynwiM5dR5BElvviFgBTTlm8FPb7mV/Lbv/Y3VCtCZVFheC
         uHC45+DjhGyfsL+R2sTxjhzKt/mA1NdTHyWrew687gmzZUBAZrfs76qUyNFJlihvmG0T
         xoACZJ+AUMw9Gy9nPhmIsa7i4H7KASX/X7yDKjHODfsC33hihn2ccbtu7csGvTV5sdek
         UU5PO/rA8eZQKTkIXfLv+DEULgfUgOE5RwnIAJbAn9pwH2vZSoT5TeBf8iOwIwjKFNF4
         LZMGiQ+ZNZXEbaz/kiJeyFr/rChtAu+GZn7IDkLRNY5sHRO0ELf3oV9MHpJNBRnCpygU
         ux5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG5T3I1+R6JFHDb7MMi0MWo6VVof5hO+jnABMkxgIFYAV8OdUg2NhosYkYAVg34VroJEQTiF4NTBz3Cgzn@vger.kernel.org
X-Gm-Message-State: AOJu0YyefNsjEwDJykThJ3OeHjMQwQqQozt3rzReesY16WIBKZDq09JI
	9QvxCFm5zd9KXnAmRjAepDcTELU97GtqGEY68YCSXDGRtPbw3YOPjLlFD1+XuuzVJ2ZNTS0FqOh
	DLAkNqvlMSXgODMG7SQcdYpV1frHBuoMKvScxehU5fBv2n/z1u9NGT97HCWOIu7pvrLHP
X-Gm-Gg: ASbGncubKoXnLwyywalOXVukD1KA2gF7d4mqZxY1RJnrZxMEZybCYwPI+giM1OkvANj
	yvrxmHHqH0anlHKpboX/h0OBwTPCsEW6AOTP382hsj9TwO4UDHWxoFi5ZtCYb7HUSbQooFjFWS+
	F3Wozt1TCIpyxC0r1YdaXx5A8Trg9L//Kj7t38nxRn1eFQ5GZ4LgRBls3fwNaApEpp9rPGSs9fF
	oaQ9qFtaHtaa8MBfqvuduzy8z8ZZPthRcTgJiskjVYvG8q0W4h8QgdjWf20wfqiC4yvsmlWHuww
	TLIDiJhBcqGAZRV4gIjzNTqezI44ml27JK2vUmvC2Xv6yIicj7FMJxIoxYFrv0OAvACkWs4xcAt
	aEtdNOCB7o7rqDLWa3aNGsw==
X-Received: by 2002:a05:6a00:18a9:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7ba379a7b0cmr708771b3a.0.1763064603702;
        Thu, 13 Nov 2025 12:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXw02RGuW9FGIDBukM/HjJLOOcWHafS/kj+OCLzdcZqwqyZ3wk2YYJnz5mKp+Dfeu3fQ0m6A==
X-Received: by 2002:a05:6a00:18a9:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7ba379a7b0cmr708721b3a.0.1763064602969;
        Thu, 13 Nov 2025 12:10:02 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aea005sm3129109b3a.3.2025.11.13.12.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 12:10:02 -0800 (PST)
Message-ID: <5b841c60-cac9-4def-928c-33cbf3d908f5@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 01:39:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] drm/msm/adreno: Introduce A8x GPU Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-13-bef18acd5e94@oss.qualcomm.com>
 <aff7043c-0029-433c-9340-22718909e583@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aff7043c-0029-433c-9340-22718909e583@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K8kv3iWI c=1 sm=1 tr=0 ts=69163b1c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=53R2tzsCfDe74MVAKjgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: L3wsj24ksbm_zozVoSd1cLZLbZWU_GTA
X-Proofpoint-ORIG-GUID: L3wsj24ksbm_zozVoSd1cLZLbZWU_GTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NyBTYWx0ZWRfX4jeUcB80cOfe
 iMIeRQNV4tTltM/5L6Z/2/E9TsrcUvQUb5wkEjh4iPyHxeBh1oOnRH8IPkSpXbBHKGt4MaVNiAm
 XciPU3w7K3lPaxzxB6Gve77UZ61IiHwYfe9UD46jGFr/B5peG61xt4u9iQR/fHi17b5jZ37e2Sp
 vbxohCP8jU3F+oadjgjv2vQTLdle9suvbawntZxzri3Gn5/gQmNR6VKqJu0o6fsBgLaq7/GbRWd
 laDARl/8eOIFSLdA67cyWoJaDVPGOvCVp+EllDiSgVTWNDbcqTXo9QtqXem9v417aMtWLzlDrBb
 VV2GBt7DI50tUwdbOFsfixMmn1XM8600jlf32ZpXLaW4c0mXrIT5LSiSMiAYNThgjZLRoGWSeDT
 z/NEcb0m2nivgLoWkv04Rg0qhGAlgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130157

On 11/13/2025 3:45 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> A8x is the next generation of Adreno GPUs, featuring a significant
>> hardware design change. A major update to the design is the introduction
>> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
>> are more independent in processing Graphics and compute workloads. Also,
>> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
>> with additional pipes.
>>
>> From a software interface perspective, these changes have a significant
>> impact on the KMD side. First, the GPU register space has been extensively
>> reorganized. Second, to avoid  a register space explosion caused by the
>> new slice architecture and additional pipes, many registers are now
>> virtualized, instead of duplicated as in A7x. KMD must configure an
>> aperture register with the appropriate slice and pipe ID before accessing
>> these virtualized registers.
>>
>> This patch adds only a skeleton support for the A8x family. An A8x GPU
>> support will be added in an upcoming patch.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	u32 val;
>> +
>> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
> 
> There's also a BIT(23) value here which is seemingly never set, but
> perhaps may come in useful for the bigger GPU
> 
>> +
>> +	if (a6xx_gpu->cached_aperture == val)
>> +		return;
>> +
>> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);
>> +
>> +	a6xx_gpu->cached_aperture = val;
>> +}
>> +
>> +static void a8xx_aperture_aquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
> 
> "acquire"

Oops!

> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
>> +
>> +	a8xx_aperture_slice_set(gpu, pipe, 0);
> 
> Maybe we can add "unsigned long flags[MAX_NUM_SLICES]" to a6xx_gpu
> to make the API a little more ergonomic.. but maybe that's too much
> IDK
> 
> [...]
> 
>> +	a6xx_gpu->slice_mask = a6xx_llc_read(a6xx_gpu,
>> +			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL) & GENMASK(3, 0);
> 
> Please define that field in the XML
This should be more clear in the next rev

> 
> [...]
> 
>> +}
>> +
>> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +	return ffs(a6xx_gpu->slice_mask) - 1;
>> +}
>> +
>> +static inline bool _a8xx_check_idle(struct msm_gpu *gpu)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	/* Check that the GMU is idle */
>> +	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
>> +		return false;
>> +
>> +	/* Check that the CX master is idle */
>> +	if (gpu_read(gpu, REG_A8XX_RBBM_STATUS) &
>> +			~A8XX_RBBM_STATUS_CP_AHB_BUSY_CX_MASTER)
>> +		return false;
>> +
>> +	return !(gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS) &
>> +		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);
> 
> Odd parenthesis-alignment (couple times in the file), checkpatch
> usually mumbles at that
Not sure about the issue here, but I do run b4 prep --check and didn't
see any complaints.

> 
> [...]
> 
>> +
>> +void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	uint32_t wptr;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ring->preempt_lock, flags);
>> +
>> +	/* Copy the shadow to the actual register */
>> +	ring->cur = ring->next;
>> +
>> +	/* Make sure to wrap wptr if we need to */
>> +	wptr = get_wptr(ring);
>> +
>> +	/* Update HW if this is the current ring and we are not in preempt*/
>> +	if (!a6xx_in_preempt(a6xx_gpu)) {
>> +		if (a6xx_gpu->cur_ring == ring)
>> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> 
> I think this should use _fenced too, but I guess the preempt detail
> is just a harmless copypasta
I have reused a6xx_flush here in next rev.

> 
> [...]
> 
>> +static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	u32 val;
>> +
>> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
>> +			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
>> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
>> +			state ? 0x110111 : 0);
> 
> a840 sets this, a830 sets 0x10111, please confirm which way x2 skews
This is correct for X2.

> 
>> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
>> +			state ? 0x55555 : 0);
>> +
>> +	gpu_write(gpu, REG_A8XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
>> +	gpu_write(gpu, REG_A8XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
> 
> !!state
> 
> [...]
> 
>> +static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>> +	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
>> +	unsigned int pipe_id, i;
>> +	unsigned long flags;
>> +
>> +	for (pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
>> +		/* We don't have support for LPAC yet */
>> +		if (pipe_id == PIPE_LPAC)
>> +			continue;
> 
> This seems arbitrary - one because there are no defines targetting PIPE_LPAC
> specifcally in the reg lists you shared and two because it would almost
> certainly not hurt to configure these registers and otherwise not power up
> the LPAC pipeline
> 
>> +
>> +		a8xx_aperture_aquire(gpu, pipe_id, &flags);
>> +
>> +		for (i = 0; regs[i].offset; i++) {
>> +			if (!(BIT(pipe_id) & regs[i].pipe))
>> +				continue;
>> +
>> +			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
>> +				*gmem_protect = regs[i].value;
>> +
>> +			gpu_write(gpu, regs[i].offset, regs[i].value);
>> +		}
>> +
>> +		a8xx_aperture_release(gpu, flags);
>> +	}
>> +
>> +	a8xx_aperture_clear(gpu);
>> +}
>> +
>> +static int a8xx_cp_init(struct msm_gpu *gpu)
>> +{
>> +	struct msm_ringbuffer *ring = gpu->rb[0];
>> +	u32 mask;
>> +
>> +	/* Disable concurrent binning before sending CP init */
>> +	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>> +	OUT_RING(ring, BIT(27));
>> +
>> +	OUT_PKT7(ring, CP_ME_INIT, 4);
>> +
>> +	/* Use multiple HW contexts */
>> +	mask = BIT(0);
>> +
>> +	/* Enable error detection */
>> +	mask |= BIT(1);
>> +
>> +	/* Set default reset state */
>> +	mask |= BIT(3);
>> +
>> +	/* Disable save/restore of performance counters across preemption */
>> +	mask |= BIT(6);
>> +
>> +	OUT_RING(ring, mask);
>> +
>> +	/* Enable multiple hardware contexts */
>> +	OUT_RING(ring, 0x00000003);
>> +
>> +	/* Enable error detection */
>> +	OUT_RING(ring, 0x20000000);
>> +
>> +	/* Operation mode mask */
>> +	OUT_RING(ring, 0x00000002);
> 
> Should we include the pwrup reglist from the get-go too? I don't think
> you used the ones you declared in patch 15 (or at least my ctrl-f can't
> find the use of it)

yeah. I should remove that for now.

> 
> [...]
> 
>> +#define A8XX_CP_INTERRUPT_STATUS_MASK_PIPE \
>> +	(A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFRBWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB1WRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB2WRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB3WRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFSDSWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFMRBWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFVSDWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VSDPARITYERROR | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_ILLEGALINSTRUCTION | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_SMMUFAULT | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESP | \
> 
> kgsl also enables VBIFRESTP(TYPE/READ/LIENT)

Ack

> 
> [...]
> 
>> +	/* Setup GMEM Range in UCHE */
>> +	gmem_range_min = SZ_64M;
> 
> this doesn't seem to ever change, you can inline it

fwiw, this documents the magic number. ;)

-Akhil

> 
> [...]
> 
>> +static void a8xx_dump(struct msm_gpu *gpu)
>> +{
>> +	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
>> +			gpu_read(gpu, REG_A8XX_RBBM_STATUS));
> 
> This can be a single line
> 
> Konrad



