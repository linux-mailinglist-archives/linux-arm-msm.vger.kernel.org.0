Return-Path: <linux-arm-msm+bounces-31440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6B974603
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 00:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDCDE287E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 22:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4FE1AAE15;
	Tue, 10 Sep 2024 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaDmHEiq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B01A38EB;
	Tue, 10 Sep 2024 22:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726007715; cv=none; b=l+00qs/BKw98gCJu3MdKKVZDmEXdqZ9FMHEMXHtbqVGmXXJTkirBWQiEQm1SvFrgeZaJc2uMzW+YLwsMUUlW5N8gSdO0tJ3+1CMZuxiu8eazGk/VoLxoqFbgqseLE7i74fGHQi4RutlM9gnDurqgGKfVeN+k5b12Lz5ivjt61UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726007715; c=relaxed/simple;
	bh=CJjZ39SBVxoooP0w9iWWEPNxkNhslFv5nhECi2asX7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMANDuNXbtAeIvUaSAE+m6gwaUsvW8hUnWDswfGn5K5LHR8PTywUNQUjrWMDRFxz/+qGQfUFsSoUQQYbGSpAuo/gu0sYvdmBDKLJAFiCf53HH9etx4u9/7JRW+M2MAj8uYHqYmDHB8rahQ2FtcJ8TZJgylIPAd5ipJu+tkVTudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaDmHEiq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d24f98215so526536066b.1;
        Tue, 10 Sep 2024 15:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726007712; x=1726612512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PZyMFqCcCCU3JCu341UNxOBS24LijJpBd9mnSqwiJY=;
        b=ZaDmHEiqGu9EtLsfJIUQqk0Ou58Y1z9auR/PD2rABNi/FHQQaPCJ2dKvAfNGvy/MDV
         d+UayV2Qr+dU/q/3S3NM5NO+zcofjAQevrvH6fAJZ6WRRNF0DRgxLTBGp2GIVSmSkyMz
         KbJzyGa/ZqBUep/6u7CvfASIQ63JTZ55zU0aTdLOPDWUCO3oxyKiuvLuem5/ZD9UctJk
         NYH0p8k48PZx0gQrlEYS+/WBHj9SH4PNS+SUpjPaA0CumUAMbqVaYBgguMxJ9JgFzkeG
         goOiLnooMNgcMODSE6uz/bGWB+5Xain7Bf2ps01xU8bLKPy7OO+f6ySuW2alP5J2Afv9
         Fcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726007712; x=1726612512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PZyMFqCcCCU3JCu341UNxOBS24LijJpBd9mnSqwiJY=;
        b=wwqP1ZXe+JviKjqmdegVm/mkqhDkM1GUZxO9wAXTELm/aOQHMR9fb4USEcBzKDwQ96
         wSuHsJnAoDEvKYIEIkx9u2xesmD3ASXPYi2MXpScqEvrK1JWvqHMksjZgJ4ov4Mn7f01
         5d3mp1Vr+kgTIxyXR9A11mARFrLe+rmXQ7FmC3wlZrjRxgNmQ88IUeEx6KfYnkVa7uu/
         yxoifebqynAUU/a0/gdHquYLWUVnXH6jr88025fmiunVJCqLsu8VnOZGWiwTQ7DokIgf
         AcUxl/jxw9RWRQoSNmb5AD5TL2IigV50ciXOBGXvYAqYliRFiZoF7LAMfuygCdFtnub1
         aNmw==
X-Forwarded-Encrypted: i=1; AJvYcCURz6k21MVUU0kASlL2lBIVLoF55tlXOIP9B6VhWq3xY64+fYcss/oNpElC8D2PFV9BNeteOWAtgitP@vger.kernel.org, AJvYcCW7azNTBek+1Zj50FfhEP4lbvM9b5N7O0M/8J9mkiLg+lLp0rpEgwDfr/nPlnATGPaweGY5laXgbXXXf4Kq@vger.kernel.org, AJvYcCXnkt4+X+q+pR/fivjZrVLe68fM44DW2EKNLzQErFdv/N3qe3cjE9JQIbfSw56IKHEzh+wAaJRgjgPOjM3H@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/c8LJhdvLIkUB06SOHTICxE7UrRKJx3E/djEnXYpzAxuXdXnK
	l8rpQN2ocup1k5erKPFR0CVUeG9THqrphdlRS3zLSgXw2T0K7qo7
X-Google-Smtp-Source: AGHT+IEz9qex4LBtwAvhL42QRLmXdhXQLzAhof/gOwjN+/taZT+fcLqjo+RhGaI2bG8vYsF4yl+c4g==
X-Received: by 2002:a17:907:97d3:b0:a86:812a:d2ca with SMTP id a640c23a62f3a-a8ffaae075bmr223754166b.25.1726007711429;
        Tue, 10 Sep 2024 15:35:11 -0700 (PDT)
Received: from [192.168.1.17] (host-79-53-170-144.retail.telecomitalia.it. [79.53.170.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d63c0fsm535771666b.213.2024.09.10.15.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 15:35:11 -0700 (PDT)
Message-ID: <39d9e3bf-ad37-43f0-a7d9-edbfdedede8e@gmail.com>
Date: Wed, 11 Sep 2024 00:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/msm/A6xx: Use posamble to reset counters on
 preemption
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
 <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
 <69efbf90-7ce1-429f-bf3a-d19acd7d649d@gmail.com>
 <20240910213412.xfw6abex5aqp7b66@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240910213412.xfw6abex5aqp7b66@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/24 11:34 PM, Akhil P Oommen wrote:
> On Mon, Sep 09, 2024 at 05:07:42PM +0200, Antonino Maniscalco wrote:
>> On 9/6/24 10:08 PM, Akhil P Oommen wrote:
>>> On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
>>>> Use the postamble to reset perf counters when switching between rings,
>>>> except when sysprof is enabled, analogously to how they are reset
>>>> between submissions when switching pagetables.
>>>>
>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
>>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
>>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>>>    4 files changed, 61 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index ed0b138a2d66..710ec3ce2923 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>    static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>>>    		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>>>    {
>>>> -	u64 preempt_offset_priv_secure;
>>>> +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>>>> +	u64 preempt_offset_priv_secure, preempt_postamble;
>>>>    	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>>> @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>>>    	/* seems OK to set to 0 to disable it */
>>>>    	OUT_RING(ring, 0);
>>>>    	OUT_RING(ring, 0);
>>>> +
>>>> +	/* if not profiling set postamble to clear perfcounters, else clear it */
>>>> +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
> 
> Setting len = 0 is enough to skip processing postamble packets. So how
> about a simpler:
> 
> len = a6xx_gpu->preempt_postamble_len;
> if (sysprof)
> 	len = 0;
> 
> OUT_PKT7(ring, CP_SET_AMBLE, 3);
> OUT_RING(ring, lower_32_bits(preempt_postamble));
> OUT_RING(ring, upper_32_bits(preempt_postamble));
> OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(len) |
> 		CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> 
>>>> +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
>>>> +
>>>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>>> +		OUT_RING(ring, lower_32_bits(preempt_postamble));
>>>> +		OUT_RING(ring, upper_32_bits(preempt_postamble));
>>>> +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>>>> +					a6xx_gpu->preempt_postamble_len) |
>>>> +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>> +	} else {
>>>
>>> Why do we need this else part?
>>
>> Wouldn't the postmable remain set if we don't explicitly set it to 0?
> 
> Aah, that is a genuine concern. I am not sure! Lets keep it.
> 
>>
>>>
>>>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>>> +		OUT_RING(ring, 0);
>>>> +		OUT_RING(ring, 0);
>>>> +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>> +	}
>>>>    }
>>>>    static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> index da10060e38dc..b009732c08c5 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> @@ -71,6 +71,11 @@ struct a6xx_gpu {
>>>>    	bool uses_gmem;
>>>>    	bool skip_save_restore;
>>>> +	struct drm_gem_object *preempt_postamble_bo;
>>>> +	void *preempt_postamble_ptr;
>>>> +	uint64_t preempt_postamble_iova;
>>>> +	uint64_t preempt_postamble_len;
>>>> +
>>>>    	struct a6xx_gmu gmu;
>>>>    	struct drm_gem_object *shadow_bo;
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> index 1caff76aca6e..ec44f44d925f 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>>>    	return 0;
>>>>    }
>>>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>>>> +{
>>>> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>>>> +	u32 count = 0;
>>>> +
>>>> +	postamble[count++] = PKT7(CP_REG_RMW, 3);
>>>> +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>>>> +	postamble[count++] = 0;
>>>> +	postamble[count++] = 1;
>>>> +
>>>> +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>>>> +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>>>> +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>>>> +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>>>> +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>>>> +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>>>> +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>>>> +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>>>
>>> Isn't it better to just replace this with NOP packets when sysprof is
>>> enabled, just before triggering preemption? It will help to have an
>>> immediate effect.
>>>
>>> -Akhil
>>>
>>
>> Mmm, this being a postamble I wonder whether we have the guarantee that it
>> finishes execution before the IRQ is called so updating it doesn't race with
>> the CP executing it.
> 
> Yes, it will be complete. But on a second thought now, this suggestion from me
> looks like an overkill.

Thanks for confirming! I have actually already implemented something 
similar to what you proposed 
https://gitlab.com/pac85/inux/-/commit/8b8ab1d89b0f611cfdbac4c3edba4192be91a7f9 
so we can chose between the two. Let me know your prefence.

> 
> -Akhil.
> 
>>
>>>> +
>>>> +	a6xx_gpu->preempt_postamble_len = count;
>>>> +}
>>>> +
>>>>    void a6xx_preempt_fini(struct msm_gpu *gpu)
>>>>    {
>>>>    	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>>>    	a6xx_gpu->uses_gmem = 1;
>>>>    	a6xx_gpu->skip_save_restore = 1;
>>>> +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
>>>> +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
>>>> +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
>>>> +			&a6xx_gpu->preempt_postamble_iova);
>>>> +
>>>> +	preempt_prepare_postamble(a6xx_gpu);
>>>> +
>>>> +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>>>> +		goto fail;
>>>> +
>>>>    	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
>>>>    	return;
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index 6b1888280a83..87098567483b 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>>>    	OUT_RING(ring, PKT4(regindx, cnt));
>>>>    }
>>>> +#define PKT7(opcode, cnt) \
>>>> +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>>>> +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>>>> +
>>>>    static inline void
>>>>    OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>>>    {
>>>>    	adreno_wait_ring(ring, cnt + 1);
>>>> -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>>>> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>>>> +	OUT_RING(ring, PKT7(opcode, cnt));
>>>>    }
>>>>    struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>>>>
>>>> -- 
>>>> 2.46.0
>>>>
>>
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


