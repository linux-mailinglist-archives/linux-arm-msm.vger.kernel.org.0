Return-Path: <linux-arm-msm+bounces-75343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7DBA52C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 23:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0740C1BC51AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 21:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80F7298CC9;
	Fri, 26 Sep 2025 21:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDDFbfx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F1283FE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 21:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758921157; cv=none; b=VNlnJU9JIr+9obiB39SJnOnz9jQQmsf4uGlDr0qB5um7Buz3mWRbmHzjei8GocHG0kHRFZz5CW2i6DUBUXAYjEolZyxizESMUsfeeor3lV8q5v0GKbPnvc1agVLjb4lx7RVfZJ3uUDQ5tWrt81aMevdpNRg+AUa3mXRFf6z80dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758921157; c=relaxed/simple;
	bh=zRikhu4p0xmY1+mK8LiOtN5W7Yp3Wyo5AIaoHyWsD9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRRFmSS57ITtOsdfBeXRB5p5VDOfN7HzUtx1sJhWB0cdnU9lLQp7rUjU+93lbR9K1I5PGtzmPBkEa5bcu5ZVz/mxhUihag65AdPlZNpscdoEclccQVZdCSac5uRBfd1RRagEmv4JIc03gXjyRxOXYLzwiB2sxd+qNSkl+kpWqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDDFbfx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX4iB031900
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 21:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FOyFoPQNijD2l+0dqxJ33W6HdiVGtsE/7Ls91CPmQo=; b=oDDFbfx6DRr/0ZJP
	O0/L5MxcHSzURoB3UrXPrXp2gTY9ldY6YwY7OAli6NutHlw23vhAgRwsIxKMnczc
	XecNH5yNI2rYA4ZAfHI0uQz2Tfa5qUF2pemdyYq89zcM6JcjVu9iZPwU3jIQ4iix
	4KiimxM0EU/i32a5jGhgK5GgvQlr9rOol1K0feTuLMjJB3Mbbp9J9DcB/mkqyLJN
	FFbqnFPmPlOW0NViHHQjL/h/esEmkMfwrCWMLtV23t+h4rLBvJ2qf9HAePv232Xm
	0HyG67ELhxsQl8lmF1yhz4hugfK8N7j/kKsuZzW10sIz+Iop4XWXFGgLEeGksFtb
	pKLBAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tc68a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 21:12:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befb83so3197012a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758921152; x=1759525952;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FOyFoPQNijD2l+0dqxJ33W6HdiVGtsE/7Ls91CPmQo=;
        b=cIzklnaa/TKAadOryBy8b12kLRM/Y5YUx8in37ByN7rL8OJCiBgRe/AcpMC3PXWy23
         Y6YY47iTjNqhEtCHof2tcR9NK0FgnJUGIvVfWTAEULcrnDuKbebAgz1Evf0zPvwLmpir
         aorRT7IwX1iot2NAVV5DX2btrgkcUlAi9hnaazXT31YlMTW3akNyw/9LZhcZfNydJu/r
         R52IYEXFB9iQmt9BiYA8Gfx1C/4ivdfuH4/daD19FH2+lSijKTk8zhbgA/5s0h78Obgp
         9YmM4YBh/zP4z+lJHYp6SJa9SfuMzqFcvnOobD49Os4b6X3DpuswqIL0Krwaj+nHESLB
         gShA==
X-Gm-Message-State: AOJu0Yy2rgEZ0fPeBqud59oeqBV6+eQZOpGpPu0u1cPVnp3HE9x3Rb1r
	iekz4mJH4mY34HnINo2P1Kd2QKgpAYyOQ5nhc6+/68POBHB/wMo4WZEBRzS6AhV5MoigOFFgLWf
	6uq+AG4jSf+L3bMlJ0hLbYjOutdA2bYPeKqaaP/p/vvPrD4hvKCSBOkKpclABIuDVKLSG
X-Gm-Gg: ASbGnctl7qBOB6dPcGASy+I1gOTNLnWsoC8nNznNMTJZxATZdAqk58rARKWqDhq++eC
	zsLzcUozNI/E8GYRYOaSKW45ACNGlM4iLjibidVEzs/rx5Gres64sM16dE8v1zOXlsdV8nItkQZ
	+ClTgbHc3EqRKo0FmXsaKLs4/lkCzf6xgAEAiF5rSJLOFFgO7D6pLjE90FDPTaLqXl/yW+x4pq/
	+XyXzxoC75R6TVequaBqMAmOR0nJVuHzwRV5yD7YYKkNuUFr7C2c7WmfjB2DmH+zBFW3zyU4NTR
	W04y12srKkNv3DeLdaENbIhIWtxaaKrN0dE6iO404H8dBAnIJsM75FhVz9nOAw==
X-Received: by 2002:a17:90b:4f82:b0:32b:6820:6509 with SMTP id 98e67ed59e1d1-3342a2477f2mr8809514a91.9.1758921151691;
        Fri, 26 Sep 2025 14:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB82tk94U/8a7SWw2K1U0SpxFbehv0nYG9imfe5zV1lN1Ud9FmdwNwRgs9qRQmPIacdedC2Q==
X-Received: by 2002:a17:90b:4f82:b0:32b:6820:6509 with SMTP id 98e67ed59e1d1-3342a2477f2mr8809505a91.9.1758921151033;
        Fri, 26 Sep 2025 14:12:31 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.78.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm6270580a91.4.2025.09.26.14.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 14:12:30 -0700 (PDT)
Message-ID: <d3490029-f532-48c2-a44a-9a7049ecea4d@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 02:42:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm: preemption aware hangcheck
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
 <20250911-preemption_aware_hangcheck-v1-2-974819876819@gmail.com>
 <c08872c9-cdad-4e62-827b-7985cb3b18de@oss.qualcomm.com>
 <7876a7c5-4b40-4760-bb59-3fbeb5d63f67@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7876a7c5-4b40-4760-bb59-3fbeb5d63f67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wIw-czsyWxkEEBefR6Bt96LWcV8nnRbL
X-Proofpoint-GUID: wIw-czsyWxkEEBefR6Bt96LWcV8nnRbL
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d701c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=KU03pyq4eEOZfaT5og2c8g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=hWF9MM9DaS2j8YbFhQAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6c5Lq/CeTHgK
 HZhjvXE+2gQY/+khwC+7mLj5o4jyLd1dQEteXvuMlQMobfBvxxtx+Nn0sPyl+eL91cRgj6ssAL2
 l/aKNPsu7S6s4fG9bvwuWmXfCXLJOQ5VTWLVPJfWlz4ykzAyqYdcdMMj9ZJYYV72riMKfDzvIJF
 XPETc6h9g0Xat+bysuH1uevoVx6iwFuIdBLpiaC1JQ4edJiBjxmyy/9Ds7ROkuOS5TjfceGkFdt
 4hSPwxJQT27kHqUbDN+IYQ4cLnUV4/dVSegMJmjQ4u5RMKRR1FNi+f/ZmAuMQBCed4hxAxn1o6i
 dd0eIJE7I9qFlbA/D3hxZG17+isJRLP/Jy8P+ed3CoIMmVpr3Z0Yijmlq04OyYQFsmLeo9N/BJG
 WTxaarXoKL8tyg38+Q36HRYs16+hGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/18/2025 8:15 PM, Anna Maniscalco wrote:
> On 9/17/25 5:23 PM, Akhil P Oommen wrote:
>> On 9/11/2025 10:31 PM, Anna Maniscalco wrote:
>>> Rework hangcheck code to work well toghether with preemption.
>>>
>>> Track the time a job has spent in a ring by storing timestamps of the
>>> `CP_ALWAYS_ON_CONTEXT` register at the beginning of a job and when
>>> switching rings as well as reading it back if the ring is currently
>>> active.
>>>
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  3 +-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 28 +++++++++++++++--
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 25 +++++++++++----
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c   |  3 +-
>>>   drivers/gpu/drm/msm/msm_gpu.c             | 51 ++++++++++++++++++++
>>> +++++------
>>>   drivers/gpu/drm/msm/msm_gpu.h             |  3 ++
>>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |  6 ++++
>>>   9 files changed, 102 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/
>>> msm/adreno/a5xx_gpu.c
>>> index
>>> 4a04dc43a8e6764a113d0ade3dee94bd4c0083af..cb4775a35da0706e571eb27ce617044de84ca118 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>> @@ -1255,7 +1255,8 @@ static void a5xx_fault_detect_irq(struct
>>> msm_gpu *gpu)
>>>           gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
>>>         /* Turn off the hangcheck timer to keep it from bothering us */
>>> -    timer_delete(&gpu->hangcheck_timer);
>>> +    for (int i = 0; i < gpu->nr_rings; i++)
>>> +        timer_delete(&gpu->rb[i]->hangcheck_timer);
>>>         kthread_queue_work(gpu->worker, &gpu->recover_work);
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gmu.c
>>> index
>>> fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..103c19fa8669f06a6c1627ced1daf2bcd60415db 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -28,7 +28,8 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
>>>       gmu->hung = true;
>>>         /* Turn off the hangcheck timer while we are resetting */
>>> -    timer_delete(&gpu->hangcheck_timer);
>>> +    for (int i = 0; i < gpu->nr_rings; i++)
>>> +        timer_delete(&gpu->rb[i]->hangcheck_timer);
>>>         /* Queue the GPU handler because we need to treat this as a
>>> recovery */
>>>       kthread_queue_work(gpu->worker, &gpu->recover_work);
>> I think a helper routine makes sense. We have to disable hangcheck
>> whenever recover_worker is queued.
>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gpu.c
>>> index
>>> b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..7647e3dfd50db7446589e67949ed08d0a422f543 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -465,6 +465,9 @@ static void a7xx_submit(struct msm_gpu *gpu,
>>> struct msm_gem_submit *submit)
>>>       get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>>           rbmemptr_stats(ring, index, alwayson_start));
>>>   +    get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>> +        rbmemptr(ring, last_job_start_ctx));
>>> +
>>>       OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>>>       OUT_RING(ring, CP_SET_THREAD_BOTH);
>>>   @@ -1816,7 +1819,8 @@ static void a6xx_fault_detect_irq(struct
>>> msm_gpu *gpu)
>>>           gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
>>>         /* Turn off the hangcheck timer to keep it from bothering us */
>>> -    timer_delete(&gpu->hangcheck_timer);
>>> +    for (int i = 0; i < gpu->nr_rings; i++)
>>> +        timer_delete(&gpu->rb[i]->hangcheck_timer);
>>>         /* Turn off interrupts to avoid triggering recovery again */
>>>       gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
>>> @@ -1839,7 +1843,8 @@ static void a7xx_sw_fuse_violation_irq(struct
>>> msm_gpu *gpu)
>>>        */
>>>       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
>>>                 A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
>>> -        timer_delete(&gpu->hangcheck_timer);
>>> +        for (int i = 0; i < gpu->nr_rings; i++)
>>> +            timer_delete(&gpu->rb[i]->hangcheck_timer);
>>>             kthread_queue_work(gpu->worker, &gpu->recover_work);
>>>       }
>>> @@ -2327,6 +2332,22 @@ static int a6xx_get_timestamp(struct msm_gpu
>>> *gpu, uint64_t *value)
>>>       return 0;
>>>   }
>>>   +static int a6xx_get_ctx_timestamp(struct msm_ringbuffer *ring,
>>> uint64_t *value)
>>> +{
>>> +    struct msm_gpu *gpu = ring->gpu;
>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +    struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>> +
>>> +    guard(spinlock_irqsave)(&a6xx_gpu->eval_lock);
>> Is eval_lock initialized anywhere? Also why do we need this?
> 
> Yeah eval_lock was introduced in the preemption series. It is
> initialized in `a6xx_preempt_hw_init`.
> 
>>
>>> +
>>> +    if (a6xx_in_preempt(a6xx_gpu) || ring != a6xx_gpu->cur_ring)
>> This will race with preemption. I think we should wrap the preempt state
>> check and the regread under the preempt lock.
> 
> Continuing. The idea is that if in_preempt returns true then it doesn't
> matter that reading cur_ring might race because we exit early.
> 
> On the other end, if it returns false, since we are holding `eval_lock`
> and the only place where we can go from the PREEMPT_NONE state to any
> other state is also guarded by that lock, then we are guaranteed that no
> preemption will occur so long as we are within this function.
> 
>>
>>> +        return -EBUSY;
>>> +
>>> +    *value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);With
>>> IFPC, we cannot access a GX domain register (CP, RBBM etc) unless
>> we are certain that the GX is powered up. Could you please test this
>> series along with the IFPC series? If we hit the right timing, there
>> should be a GMU fence error in the dmesg. Not sure how easy it is to hit
>> that timing, but I believe there is a problem here conceptually.
> 
> Right. I'll fix this although we don't have a fenced_read helper and I
> wonder if reading behaves like writing when it comes to waking up the gpu.
> 
> So would it work to try the read and poll REG_A6XX_GMU_AHB_FENCE_STATUS
> like we do when writing?
Unfortunately, only fenced write is supported as per the hw spec and
that too for a specific region or registers.

> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
>>>   {
>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> @@ -2555,6 +2576,7 @@ static const struct adreno_gpu_funcs funcs = {
>>>           .get_rptr = a6xx_get_rptr,
>>>           .progress = a6xx_progress,
>>>           .sysprof_setup = a6xx_gmu_sysprof_setup,
>>> +        .get_ctx_timestamp = a6xx_get_ctx_timestamp,
>>>       },
>>>       .get_timestamp = a6xx_gmu_get_timestamp,
>>>   };
>>> @@ -2584,6 +2606,7 @@ static const struct adreno_gpu_funcs
>>> funcs_gmuwrapper = {
>>>           .create_private_vm = a6xx_create_private_vm,
>>>           .get_rptr = a6xx_get_rptr,
>>>           .progress = a6xx_progress,
>>> +        .get_ctx_timestamp = a6xx_get_ctx_timestamp,
>>>       },
>>>       .get_timestamp = a6xx_get_timestamp,
>>>   };
>>> @@ -2616,6 +2639,7 @@ static const struct adreno_gpu_funcs funcs_a7xx
>>> = {
>>>           .get_rptr = a6xx_get_rptr,
>>>           .progress = a6xx_progress,
>>>           .sysprof_setup = a6xx_gmu_sysprof_setup,
>>> +        .get_ctx_timestamp = a6xx_get_ctx_timestamp,
>>>       },
>>>       .get_timestamp = a6xx_gmu_get_timestamp,
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gpu.h
>>> index
>>> 0b17d36c36a9567e6afa4269ae7783ed3578e40e..7248d3d38c6d8a06cb4a536043bf4877179447cc 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> @@ -80,6 +80,7 @@ struct a6xx_gpu {
>>>       struct drm_gem_object *preempt_postamble_bo;
>>>       void *preempt_postamble_ptr;
>>>       uint64_t preempt_postamble_iova;
>>> +    uint64_t preempt_postamble_cntreset_end;
>>>       uint64_t preempt_postamble_len;
>>>       bool postamble_enabled;
>>>   diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/
>>> gpu/drm/msm/adreno/a6xx_preempt.c
>>> index
>>> afc5f4aa3b17334027f3c20072cc3f059a9733b7..88a65549fa8038d4836eb5aeaea775d679415315 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>> @@ -99,11 +99,15 @@ static void a6xx_preempt_timer(struct timer_list *t)
>>>       kthread_queue_work(gpu->worker, &gpu->recover_work);
>>>   }
>>>   -static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu,
>>> struct msm_ringbuffer *ring)
>>>   {
>>>       u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>>> +    uint64_t last_active_ctxcycles;
>>>       u32 count = 0;
>>>   +    if (ring)
>>> +        last_active_ctxcycles = rbmemptr(ring, last_active_ctxcycles);
>>> +
>>>       postamble[count++] = PKT7(CP_REG_RMW, 3);
>>>       postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>>>       postamble[count++] = 0;
>>> @@ -118,6 +122,15 @@ static void preempt_prepare_postamble(struct
>>> a6xx_gpu *a6xx_gpu)
>>>       postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>>>       postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>>>   +    a6xx_gpu->preempt_postamble_cntreset_end = count;
>>> +
>>> +    postamble[count++] = PKT7(ring ? CP_REG_TO_MEM : CP_NOP, 3);
>>> +    postamble[count++] =
>>> CP_REG_TO_MEM_0_REG(REG_A6XX_CP_ALWAYS_ON_CONTEXT) |
>>> +        CP_REG_TO_MEM_0_CNT(2) |
>>> +        CP_REG_TO_MEM_0_64B;
>>> +    postamble[count++] = lower_32_bits(last_active_ctxcycles);
>>> +    postamble[count++] = upper_32_bits(last_active_ctxcycles);
>>> +
>>>       a6xx_gpu->preempt_postamble_len = count;
>>>         a6xx_gpu->postamble_enabled = true;
>>> @@ -129,9 +142,9 @@ static void preempt_disable_postamble(struct
>>> a6xx_gpu *a6xx_gpu)
>>>         /*
>>>        * Disable the postamble by replacing the first packet header
>>> with a NOP
>>> -     * that covers the whole buffer.
>>> +     * that skips the counters reset part.
>>>        */
>>> -    *postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
>>> +    *postamble = PKT7(CP_NOP, (a6xx_gpu-
>>> >preempt_postamble_cntreset_end - 1));
>>>         a6xx_gpu->postamble_enabled = false;
>>>   }
>>> @@ -338,8 +351,8 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>>       /* Enable or disable postamble as needed */
>>>       sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>>>   -    if (!sysprof && !a6xx_gpu->postamble_enabled)
>>> -        preempt_prepare_postamble(a6xx_gpu);
>>> +    if (!sysprof)
>>> +        preempt_prepare_postamble(a6xx_gpu, ring);
>>>         if (sysprof && a6xx_gpu->postamble_enabled)
>>>           preempt_disable_postamble(a6xx_gpu);
>>> @@ -454,7 +467,7 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>>               gpu->vm, &a6xx_gpu->preempt_postamble_bo,
>>>               &a6xx_gpu->preempt_postamble_iova);
>>>   -    preempt_prepare_postamble(a6xx_gpu);
>>> +    preempt_prepare_postamble(a6xx_gpu, NULL);
>>>         if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>>>           goto fail;
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/
>>> drm/msm/adreno/adreno_gpu.c
>>> index
>>> afaa3cfefd357dc0230994c8b5830a14c6d7a352..58f1e2a95bbfb00feb5a3bb91853e6bb533ec631 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -334,7 +334,8 @@ int adreno_fault_handler(struct msm_gpu *gpu,
>>> unsigned long iova, int flags,
>>>           struct msm_gpu_fault_info fault_info = {};
>>>             /* Turn off the hangcheck timer to keep it from bothering
>>> us */
>>> -        timer_delete(&gpu->hangcheck_timer);
>>> +        for (int i = 0; i < gpu->nr_rings; i++)
>>> +            timer_delete(&gpu->rb[i]->hangcheck_timer);
>>>             fault_info.ttbr0 = info->ttbr0;
>>>           fault_info.iova  = iova;
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/
>>> msm_gpu.c
>>> index
>>> 17759abc46d7d7af4117b1d71f1d5fba6ba0b61c..a3c5073aca1f65e450e0673262e8ca4bc7a5be6f 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -463,7 +463,9 @@ static void recover_worker(struct kthread_work
>>> *work)
>>>       struct drm_device *dev = gpu->dev;
>>>       struct msm_drm_private *priv = dev->dev_private;
>>>       struct msm_gem_submit *submit;
>>> -    struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>>> +    struct msm_ringbuffer *cur_ring = gpu->hung_ring ?
>>> +        gpu->hung_ring : gpu->funcs->active_ring(gpu);
>>> +    gpu->hung_ring = NULL;
>>>       char *comm = NULL, *cmd = NULL;
>>>       struct task_struct *task;
>>>       int i;
>>> @@ -613,11 +615,17 @@ void msm_gpu_fault_crashstate_capture(struct
>>> msm_gpu *gpu, struct msm_gpu_fault_
>>>       mutex_unlock(&gpu->lock);
>>>   }
>>>   -static void hangcheck_timer_reset(struct msm_gpu *gpu)
>>> +static void hangcheck_ring_timer_reset(struct msm_gpu *gpu, struct
>>> msm_ringbuffer *ring)
>>>   {
>>>       struct msm_drm_private *priv = gpu->dev->dev_private;
>>> -    mod_timer(&gpu->hangcheck_timer,
>>> -            round_jiffies_up(jiffies + msecs_to_jiffies(priv-
>>> >hangcheck_period)));
>>> +    mod_timer(&ring->hangcheck_timer,
>>> +              round_jiffies_up(jiffies + msecs_to_jiffies(priv-
>>> >hangcheck_period)));
>>> +}
>>> +
>>> +static void hangcheck_timer_reset(struct msm_gpu *gpu)
>>> +{
>>> +    for (int i = 0; i < gpu->nr_rings; i++)
>>> +        hangcheck_ring_timer_reset(gpu, gpu->rb[i]);
>> It triggers my OCD a bit that there are multiple timers flying around
>> waking up CPU clusters. But this is okay for now I guess. :)
>>
>>>   }
>>>     static bool made_progress(struct msm_gpu *gpu, struct
>>> msm_ringbuffer *ring)
>>> @@ -635,11 +643,33 @@ static bool made_progress(struct msm_gpu *gpu,
>>> struct msm_ringbuffer *ring)
>>>       return true;
>>>   }
>>>   +static bool check_ring_timeout(struct msm_ringbuffer *ring,
>>> unsigned long timeout)
>>> +{
>>> +    struct msm_gpu *gpu = ring->gpu;
>>> +    struct msm_ringbuffer *curr_ring = gpu->funcs->active_ring(gpu);
>>> +    u64 start, end;
>>> +    int ret;
>>> +
>>> +    if (!gpu->funcs->get_ctx_timestamp)
>>> +        return !made_progress(gpu, ring);
>>> +
>>> +    start = ring->memptrs->last_job_start_ctx;
>>> +
>>> +    if (!gpu->funcs->get_ctx_timestamp(ring, &end))
>> I suppose you want the other way. ie, if get_ctx_timestamp() returns
>> -EBUSY, which means gpu is either under preemption or in a different
>> ring, use the memptr data.
> You are right, that `!` does not belong there!
>>
>>> +        end = ring->memptrs->last_active_ctxcycles;
>> Assuming my above comment is correct, if GPU is under preemption, there
>> is a chance that the postamble might not have got executed. So with a
>> stale 'end' value, the below calc may go wrong?
>>
>>> +
>>> +    if (end >= start)
>>> +        return (end - start) < timeout;
>>> +    else
>>> +        return false;
>> In case of an infinite shader blocking preemption, wouldn't we always
>> return false here?
> Right. Once we fix the above condition this shouldn't be a problem
> because hangcheck timer will fire on the ring that is stuck so `end`
> will be read from the register and it should detect the hang.

You mean the timer on the outgoing ring? But we won't read the register
as the preemption is active, right? We read the memptr which has a stale
'end' value. Since 'end' < 'start', this code will continously report
"no timeout" to the caller.

>>
>> -Akhil> +}
>>> +
>>>   static void hangcheck_handler(struct timer_list *t)
>>>   {
>>> -    struct msm_gpu *gpu = timer_container_of(gpu, t, hangcheck_timer);
>>> +    struct msm_ringbuffer *ring = timer_container_of(ring, t,
>>> hangcheck_timer);
>>> +    struct msm_gpu *gpu = ring->gpu;
>>> +    struct msm_drm_private *priv = gpu->dev->dev_private;
>>>       struct drm_device *dev = gpu->dev;
>>> -    struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>>>       uint32_t fence = ring->memptrs->fence;
>>>         if (fence != ring->hangcheck_fence) {
>>> @@ -647,7 +677,7 @@ static void hangcheck_handler(struct timer_list *t)
>>>           ring->hangcheck_fence = fence;
>>>           ring->hangcheck_progress_retries = 0;
>>>       } else if (fence_before(fence, ring->fctx->last_fence) &&
>>> -            !made_progress(gpu, ring)) {
>>> +            check_ring_timeout(ring, priv->hangcheck_period *
>>> 192000)) {
>>>           /* no progress and not done.. hung! */
>>>           ring->hangcheck_fence = fence;
>>>           ring->hangcheck_progress_retries = 0;
>>> @@ -658,6 +688,7 @@ static void hangcheck_handler(struct timer_list *t)
>>>           DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
>>>                   gpu->name, ring->fctx->last_fence);
>>>   +        gpu->hung_ring = ring;
>>>           kthread_queue_work(gpu->worker, &gpu->recover_work);
>>>       }
>>>   @@ -911,7 +942,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct
>>> msm_gem_submit *submit)
>>>       submit->ring->cur_ctx_seqno = submit->queue->ctx->seqno;
>>>         pm_runtime_put(&gpu->pdev->dev);
>>> -    hangcheck_timer_reset(gpu);
>>> +    hangcheck_ring_timer_reset(gpu, submit->ring);
>> Should we reset hangcheck whenever there is a submission to a random
>> ring?
> The idea is that we only reset the timer for that ring. If that ring is
> stuck presumably whatever applications are running on it will stop
> submitting eventually since fences won't be signaled and so the timer
> should run.
> 
> That isn't really guaranteed but previously that was assumed.
> 
> Do you think this isn't a good assumption to make?

I missed that this was per-ring. If there are continous submissions at
the right interval to the same ring, it can delay the hang check
detection. I agree that this is an edge case.

It makes sense to reset the timer during the first submit to a ring.
After that it can reset itself from the timer handler until all submits
are retired. Would that require a lot of plumbing?

Anyway, since we are reworking the hangcheck, probably we can revisit
every aspect of it in this series. Up to you.

-Akhil

> 
>>
>> -Akhil
>>
>>>   }
>>>     /*
>>> @@ -1011,8 +1042,6 @@ int msm_gpu_init(struct drm_device *drm, struct
>>> platform_device *pdev,
>>>       if (funcs->progress)
>>>           priv->hangcheck_period /= 2;
>>>   -    timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
>>> -
>>>       spin_lock_init(&gpu->perf_lock);
>>>     @@ -1097,6 +1126,8 @@ int msm_gpu_init(struct drm_device *drm,
>>> struct platform_device *pdev,
>>>               goto fail;
>>>           }
>>>   +        timer_setup(&gpu->rb[i]->hangcheck_timer,
>>> hangcheck_handler, 0);
>>> +
>>>           memptrs += sizeof(struct msm_rbmemptrs);
>>>           memptrs_iova += sizeof(struct msm_rbmemptrs);
>>>       }
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/
>>> msm_gpu.h
>>> index
>>> a597f2bee30b6370ecc3639bfe1072c85993e789..7bf1b7f4bc4b61338bfa4c1463eb549f8c22d5c3 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>> @@ -93,6 +93,7 @@ struct msm_gpu_funcs {
>>>        */
>>>       bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer
>>> *ring);
>>>       void (*sysprof_setup)(struct msm_gpu *gpu);
>>> +    int (*get_ctx_timestamp)(struct msm_ringbuffer *ring, uint64_t
>>> *value);
>>>   };
>>>     /* Additional state for iommu faults: */
>>> @@ -257,6 +258,8 @@ struct msm_gpu {
>>>       /* work for handling GPU recovery: */
>>>       struct kthread_work recover_work;
>>>   +    struct msm_ringbuffer *hung_ring;
>>> +
>>>       /** retire_event: notified when submits are retired: */
>>>       wait_queue_head_t retire_event;
>>>   diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/
>>> drm/msm/msm_ringbuffer.h
>>> index
>>> d1e49f701c8176e50d2b9a5cca35acee67f75209..316247fb089f26bd657ccf8464a5039e1cd1ac45 100644
>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
>>> @@ -37,6 +37,8 @@ struct msm_rbmemptrs {
>>>       volatile struct msm_gpu_submit_stats
>>> stats[MSM_GPU_SUBMIT_STATS_COUNT];
>>>       volatile u64 ttbr0;
>>>       volatile u32 context_idr;
>>> +    volatile u64 last_job_start_ctx;
>>> +    volatile u64 last_active_ctxcycles;
>>>   };
>>>     struct msm_cp_state {
>>> @@ -73,6 +75,10 @@ struct msm_ringbuffer {
>>>       uint64_t memptrs_iova;
>>>       struct msm_fence_context *fctx;
>>>   +    /* Hang and Inactivity Detection:
>>> +     */
>>> +    struct timer_list hangcheck_timer;
>>> +
>>>       /**
>>>        * hangcheck_progress_retries:
>>>        *
>>>
> 
> Best regards,


