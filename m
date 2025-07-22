Return-Path: <linux-arm-msm+bounces-66160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0FB0E567
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34F0A7A870E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC1528640C;
	Tue, 22 Jul 2025 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl1N3gdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F11B285C8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753219510; cv=none; b=F8or3ND3SCSMMpYsvvhBk9mNX4TvzDnY83ZsMupSI1b/thlOVZnhZl7ZcPwkslfagwHeMWkLYwKFuL1gvxBewdOYDWLgcM+zOmVysTPdDmLpXNfh1rp3BhVMWQsh8HxjxNJ4pPAWG0PqSEhKzFhNAVCLblz2aHVUJU3gTp6Mw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753219510; c=relaxed/simple;
	bh=d8wE+Gd4VtxWp/t9KIB2BMTuDrtaRYD3N8rVvy96Bas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTOtriNiOlE4rIza60EfJHkcbQ9ePtt+thN16XZ8Fpkb1Nf35DfDUjAl1dSTcdfq/N+h5U/+5wW0oo/QqzFIAUB5Diam9tLWJwaNab7QX4JbqVcoG2YDPTGGAx4T6B5Rq2O7+uTguW8iGEZ2iMdx5lCg5D4XFNEoB2RcAlKDy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fl1N3gdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTLCm026556
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bx6AND6qIidWf5n32E4fzkLDfQp167XjFiENx1umcI8=; b=fl1N3gdFbnbW6zs3
	xthlnmmIcSvU+LS0IMa6qXorJtBVRpZb82HziDrZHY0Vjv0f3K14l1g+zxiCZ6hm
	BEB//nuFQI2n9o7/I1MEBSn6efFU7sfSeI4aTzTM/vCI0ux5KAFWChrSx0+JR2l6
	SJGkHOQJ6YdfiAdcp8AL6y6qPuPJF3eVq0JrD9YI/6c6cBrSbACDOnyF3TjHxpSZ
	z5w7OENt8aK/hXWans789scPyLlC7dhT5+Xs0uXCmeZJV8wqJM+3ED1L939p/awg
	Vb2byiVFQmvDuZ4Al+UDUmbDdl+zOxRQuDLtfphP7nYd5F7WRJAI2cpnMR+H5Xvv
	fS5Nrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qaxec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:25:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235c897d378so56457805ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219505; x=1753824305;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx6AND6qIidWf5n32E4fzkLDfQp167XjFiENx1umcI8=;
        b=BjljqrWAw1Sm6ifqvAxlokKgr6sTJlz+xHXc0afhRXi0cr0etwmoY4ukD1WhHdH3ri
         TKCJ0QVTcjjcjsfg/8KJ+QmX9rBZtTf+w+IacwJHg3SHj+1TkDu1dHusd6EnebGTSA74
         bu9jPQ5YHgnD1w6L8oNURxXHmzjLK0qdBhrcoJX/rsx7TkVY2ITC02sHSDlBL2/VDdk/
         pa5aWEyBbEBs6xS0jElSwxfbh9mklh9MDWVx9dKZl4ODtuzGf+W68mPDbeb9EfwMt9UO
         ky/EFL7Te3MjB0vKlStRI7kjMVJzA+w5SqazUDDYvVpTOfYz0JFPZR7mjVnKn6Zk1/lY
         eTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0qqh4WVpDSGorUEt5PF72R516eVb/SXIpcyE8PtzwFE/pwH0RUSNdi9+C/oyGcYb4v+BnJl/LQnBqt/Oq@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0yjHCpJwr+zhaPZTC1v2lK9JqBVpIr7o6qakpx/oUBFjqmUY
	SdXldIqBRczaVW8Ufi4yLsb4IfnUAaCB0gXdEiHG/DKIv05qG5BAg+AHdlRxl1IzVrwqgpwZ2q8
	+6wsFv5lbjExNm6EympcJvIXA52GKPKbY/8xXBUKQoBcEiY9V0FDbYFBs5z8uFugzGBnR
X-Gm-Gg: ASbGncuIl7dw/8Y9kU65TBhzvZYC57WI8riMASDiAol2t4egJGsz+dyb2D9sGG9kExY
	asuyQILlWbiBLNfMQU2UMOY6wF7rVM/xGiBniMP18eeKGuy+nFfA9f7Sa66BmAbgApmDGGyaH2k
	4xoENQbqA3svs1YSdONLU9vmqaJMi5dluI6aSixzgn+QIKx5fvaq4gko+JJAnC0vChOT/WsK91w
	TNyEwgvcZMcKgnBLNeqOThy8JqlPRxi/2aDepNZ/OWNfjC4XVD73qr/X3ux30oyf1u8bKiIwVpW
	cuaynG+vFIM9ovr3od/nr8Y+dNqpGplnjQcT1DH6wEk5YtT1lsy4Vyc4BvbLKeZC
X-Received: by 2002:a17:903:fa6:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23f98087878mr6681835ad.0.1753219505436;
        Tue, 22 Jul 2025 14:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFps9jaK7xU+IcaPx+PU7yuB+q3TWSjyxzOi5zTDgaE+nkIXF7XgkGNIc87COjEka46a4qGHw==
X-Received: by 2002:a17:903:fa6:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23f98087878mr6681445ad.0.1753219504988;
        Tue, 22 Jul 2025 14:25:04 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef82esm82325845ad.209.2025.07.22.14.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 14:25:04 -0700 (PDT)
Message-ID: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 02:54:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NSBTYWx0ZWRfX6UFKvXHGU++u
 wf4rn7OyB5ugKngSN+0Wdvh5k+Cn9drQIv9ZLDgFuyFRwGz9ux0Y//tZ/7Viq1XYU/tVkLUKsx7
 Tfg1ShTXcg+He453C5JWxucHoKy0B1bC9Wh8oFDDJFQiPi0syKqrG5jq4IpZu6cnpe0pZCKiriL
 qfhJDQBbR3/OmICDDbYvHQYIX5hLaTVZl/a7ozk2eoL++UENT90QywxbiAjQ+KFiOy7vMmM5Pkp
 A3dFKvz38w6HNMmntTefG/pUDNaqOF8YqiikOGtpGOKfu1EnqKaYc+j+8YOzR8d3xBzdNG9GKN0
 pnPYw4T1rJ22o+noUgmJDqvIe6JkFucs3XmmgnpAc7Dm8bW8FtuNdXKRV+BWz+y5sJgAVQN+k5F
 fgQY8Pfxap/yNV8+1SZHCaZOSj95yPI90kssVi5A9/6pnzp6XF5Dg+dv1mJ+RxCo7eEjlOB2
X-Proofpoint-ORIG-GUID: KbzXHLxl1Q9lt3-WGV3u33WbzpLX-cl7
X-Proofpoint-GUID: KbzXHLxl1Q9lt3-WGV3u33WbzpLX-cl7
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688001b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=54dI5dBpyKhlXk0ovUwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220185

On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>> Set Keepalive votes at appropriate places to block IFPC power collapse
>> until we access all the required registers. This is required during gpu
>> IRQ handling and also during preemption.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
>>  2 files changed, 37 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
>>  
>>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>  {
>> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>>  
>>  	/*
>> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
>>  		return;
>>  
>> -	/*
>> -	 * Force the GPU to stay on until after we finish
>> -	 * collecting information
>> -	 */
>> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
>> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>> -
>>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
>> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>>  	}
>>  }
>>  
>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> 
> a6xx_set_keepalive_vote()

static fn! Why do we need prefix here?

-Akhil

> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
>> +
>> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
>> +}
>> +
>>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>  {
>>  	struct msm_drm_private *priv = gpu->dev->dev_private;
>> +
>> +	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
>> +	set_keepalive_vote(gpu, true);
>> +
>>  	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>>  
>>  	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>> @@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>  	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
>>  		a6xx_preempt_irq(gpu);
>>  
>> +	set_keepalive_vote(gpu, false);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>>  	a6xx_gpu->postamble_enabled = false;
>>  }
>>  
>> +/*
>> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
>> + * a6xx_irq()
>> + */
>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> 
> a6xx_set_preempt_keepalive_vote();
> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
>> +
>> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
>> +}
>> +
>>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>>  {
>>  	uint32_t status;
>> @@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>  
>>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>  
>> +	set_keepalive_vote(gpu, false);
>> +
>>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>>  
>>  	/*
>> @@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>  
>>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>  
>> +	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
>> +	set_keepalive_vote(gpu, true);
>> +
>>  	a6xx_fenced_write(a6xx_gpu,
>>  		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
>>  		BIT(1), true);
>>
>> -- 
>> 2.50.1
>>
> 


