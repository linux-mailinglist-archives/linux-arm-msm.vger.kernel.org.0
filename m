Return-Path: <linux-arm-msm+bounces-31599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4071976747
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CB5BB21A21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 11:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD41A19047A;
	Thu, 12 Sep 2024 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIRou3R+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C509F145B14;
	Thu, 12 Sep 2024 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726139741; cv=none; b=hOXRKVpB+d2bZSw9t4C6M6ZLn+YmtTs4+PQ0hKKqTPA08rsn04IHUlky8rpxGQ6Gxr6lc9ks7qhxz2NRL+fXCOjJAcFPRnxki4yst95JTTp+fHpKtzSkps9wqZY76mPC7iUf3NZEUgPc3n1gTskuLMAJjONQm91YnPYyVffdkpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726139741; c=relaxed/simple;
	bh=1dG2ofcbzviwf869ky1/WusBWEj/h3lY05sDJ214txo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ld6zmy6M805uG4k/VVdJyo9DPE5d4ACSo7qvb0oU0HBMFJi4rh1kDG/IluNa/wIZFX2agNRHgRkQMFpz0KYdJKA0SF+C76oMjN78qohUuBUkZ34Jpc2j6bVPYlBYqAY1Vagw9uO9FhOIYjGSTgXIG8FF8feRx7xEfjSzk8V+oPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIRou3R+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a83562f9be9so88375366b.0;
        Thu, 12 Sep 2024 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726139738; x=1726744538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+4S6glc4Oo1QgS1kNnp0+BV6au00fwd4yWgTCcyo2DY=;
        b=MIRou3R+04rFuCrhHD/mqNkbxkNfIeSYDDu/XrwPkd8NPwAaBpNe6R4G8dRBv7vEVT
         eczYMug7TQVtHZxYl8Axi5AJ0dSj3QxY4JEkqsVhVJt4P+n8967l1z7/ReH2uOGhSeGO
         EtXZv6pcM45QR5zvexclVJjbgtdj7f1qtf2ZQNadyATKEI/+ncnl4mWC7mxL5vZrWxsK
         KjsUtHxwrH2uJfktZKc0YbBBGrCTpnFSkEIUAaxxzH9XBdC+N8daKQxNkU7M3V47zxJA
         jPXYMREjjO0xCmLxJF8E0bafBP/+l30sFzRJJbteSC1bQOpK/8sZIAymsI9z/N62bUsR
         NA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139738; x=1726744538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4S6glc4Oo1QgS1kNnp0+BV6au00fwd4yWgTCcyo2DY=;
        b=sgsuOIM3YI+ncVlxmXxrWSTjHfGr6FtxN9SvO4KtIRuBjfr36tBlz/Hx3xDdtSxHfm
         eykUhEk9rGaw0k7OyAj4iVQvKeFF3o/63CLuWV7iMUXLcTRkLCaZ6RX++N4vApg9nEDd
         MqOIYaji5VJ99iBVTFyNqbaW+93yKgUKSiHSxezfAnLdazxeVVUlw4zRzP+94jCdSnXw
         sMboZ9cCp43zpr14imq/1g1tpCQ7xrz2d9S6u1Quz6OQJHtWDK8ezuLt43SoLP21vKr8
         7sn6tJnKb2prYjzAN8enKghXAG5PG5mJj0t/muQLYpyhV2vp7WlPunksam4/rZInaJlH
         vPSA==
X-Forwarded-Encrypted: i=1; AJvYcCUUxOiYehpFeobGFwhO7LzJ6ca47VVJaDLaSN4gAX7wNaf1mA0ddWpkMvrgWKJKPINNTw3yo1EQCEDb@vger.kernel.org, AJvYcCWB+9rJYYCaAH2rpg8Dgbj9VjueJpt+vKIX46DtczDj1Mez00O0ZFm2CikXBHHK5F2cyM18M8D2YlnTsYAn@vger.kernel.org, AJvYcCWoTbHnY2vQ0RoTQ69fug5TTuB7F9hAsyHkOOcqU6xbLdeIJp7n9DHCoBNlFWP1f8uTxGb4uMNsDF8tX0/M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+op9aKo/QI84qAEM1Mng8kdrc77KA1yj+94hhAiyS7jphaptm
	zbLJOwDc06bxEblHKQteTTDD6MafaUYd+9Oc9Z8xLwrVxXGVLtZKYyBQnw35
X-Google-Smtp-Source: AGHT+IGkGCSxpk0LKAatd+cPpkKSDrM50h5JJoqpXNZ1v5+cvzLmxSTsmgPFoentcNzIjGcrVQc0pQ==
X-Received: by 2002:a17:907:948c:b0:a71:ddb8:9394 with SMTP id a640c23a62f3a-a902961794emr235436766b.40.1726139737206;
        Thu, 12 Sep 2024 04:15:37 -0700 (PDT)
Received: from [192.168.1.17] (host-87-20-168-161.retail.telecomitalia.it. [87.20.168.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835d16sm725470066b.36.2024.09.12.04.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 04:15:36 -0700 (PDT)
Message-ID: <4df30c9e-8604-42aa-bf48-c8bb508429ad@gmail.com>
Date: Thu, 12 Sep 2024 13:15:34 +0200
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
 <39d9e3bf-ad37-43f0-a7d9-edbfdedede8e@gmail.com>
 <20240912071235.cuhe6nhd6gufsmpm@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240912071235.cuhe6nhd6gufsmpm@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 9:12 AM, Akhil P Oommen wrote:
> On Wed, Sep 11, 2024 at 12:35:08AM +0200, Antonino Maniscalco wrote:
>> On 9/10/24 11:34 PM, Akhil P Oommen wrote:
>>> On Mon, Sep 09, 2024 at 05:07:42PM +0200, Antonino Maniscalco wrote:
>>>> On 9/6/24 10:08 PM, Akhil P Oommen wrote:
>>>>> On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
>>>>>> Use the postamble to reset perf counters when switching between rings,
>>>>>> except when sysprof is enabled, analogously to how they are reset
>>>>>> between submissions when switching pagetables.
>>>>>>
>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>>>>>     4 files changed, 61 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index ed0b138a2d66..710ec3ce2923 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>>>     static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>>>>>     		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>>>>>     {
>>>>>> -	u64 preempt_offset_priv_secure;
>>>>>> +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>>>>>> +	u64 preempt_offset_priv_secure, preempt_postamble;
>>>>>>     	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>>>>> @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>>>>>     	/* seems OK to set to 0 to disable it */
>>>>>>     	OUT_RING(ring, 0);
>>>>>>     	OUT_RING(ring, 0);
>>>>>> +
>>>>>> +	/* if not profiling set postamble to clear perfcounters, else clear it */
>>>>>> +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
>>>
>>> Setting len = 0 is enough to skip processing postamble packets. So how
>>> about a simpler:
>>>
>>> len = a6xx_gpu->preempt_postamble_len;
>>> if (sysprof)
>>> 	len = 0;
>>>
>>> OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>> OUT_RING(ring, lower_32_bits(preempt_postamble));
>>> OUT_RING(ring, upper_32_bits(preempt_postamble));
>>> OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(len) |
>>> 		CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>
>>>>>> +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
>>>>>> +
>>>>>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>>>>> +		OUT_RING(ring, lower_32_bits(preempt_postamble));
>>>>>> +		OUT_RING(ring, upper_32_bits(preempt_postamble));
>>>>>> +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>>>>>> +					a6xx_gpu->preempt_postamble_len) |
>>>>>> +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>>>> +	} else {
>>>>>
>>>>> Why do we need this else part?
>>>>
>>>> Wouldn't the postmable remain set if we don't explicitly set it to 0?
>>>
>>> Aah, that is a genuine concern. I am not sure! Lets keep it.
>>>
>>>>
>>>>>
>>>>>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>>>>> +		OUT_RING(ring, 0);
>>>>>> +		OUT_RING(ring, 0);
>>>>>> +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>>>> +	}
>>>>>>     }
>>>>>>     static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>> index da10060e38dc..b009732c08c5 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>> @@ -71,6 +71,11 @@ struct a6xx_gpu {
>>>>>>     	bool uses_gmem;
>>>>>>     	bool skip_save_restore;
>>>>>> +	struct drm_gem_object *preempt_postamble_bo;
>>>>>> +	void *preempt_postamble_ptr;
>>>>>> +	uint64_t preempt_postamble_iova;
>>>>>> +	uint64_t preempt_postamble_len;
>>>>>> +
>>>>>>     	struct a6xx_gmu gmu;
>>>>>>     	struct drm_gem_object *shadow_bo;
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>>>> index 1caff76aca6e..ec44f44d925f 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>>>> @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>>>>>     	return 0;
>>>>>>     }
>>>>>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>>>>>> +{
>>>>>> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>>>>>> +	u32 count = 0;
>>>>>> +
>>>>>> +	postamble[count++] = PKT7(CP_REG_RMW, 3);
>>>>>> +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>>>>>> +	postamble[count++] = 0;
>>>>>> +	postamble[count++] = 1;
>>>>>> +
>>>>>> +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>>>>>> +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>>>>>
>>>>> Isn't it better to just replace this with NOP packets when sysprof is
>>>>> enabled, just before triggering preemption? It will help to have an
>>>>> immediate effect.
>>>>>
>>>>> -Akhil
>>>>>
>>>>
>>>> Mmm, this being a postamble I wonder whether we have the guarantee that it
>>>> finishes execution before the IRQ is called so updating it doesn't race with
>>>> the CP executing it.
>>>
>>> Yes, it will be complete. But on a second thought now, this suggestion from me
>>> looks like an overkill.
>>
>> Thanks for confirming! I have actually already implemented something similar
>> to what you proposed https://gitlab.com/pac85/inux/-/commit/8b8ab1d89b0f611cfdbac4c3edba4192be91a7f9
>> so we can chose between the two. Let me know your prefence.
> 
> That looks fine. Can we try to simplify that patch further? We can lean
> towards readability instead of saving few writes. I don't think there
> will be frequent sysprof toggles.
> 

Sure yeah, I removed the patch argument on preempt_prepare_postamble so 
when we enable the postamble we just re-emit the entire IB.

> -Akhil
> 
>>
>>>
>>> -Akhil.
>>>
>>>>
>>>>>> +
>>>>>> +	a6xx_gpu->preempt_postamble_len = count;
>>>>>> +}
>>>>>> +
>>>>>>     void a6xx_preempt_fini(struct msm_gpu *gpu)
>>>>>>     {
>>>>>>     	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>> @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>>>>>     	a6xx_gpu->uses_gmem = 1;
>>>>>>     	a6xx_gpu->skip_save_restore = 1;
>>>>>> +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
>>>>>> +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
>>>>>> +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
>>>>>> +			&a6xx_gpu->preempt_postamble_iova);
>>>>>> +
>>>>>> +	preempt_prepare_postamble(a6xx_gpu);
>>>>>> +
>>>>>> +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>>>>>> +		goto fail;
>>>>>> +
>>>>>>     	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
>>>>>>     	return;
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> index 6b1888280a83..87098567483b 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>>>>>     	OUT_RING(ring, PKT4(regindx, cnt));
>>>>>>     }
>>>>>> +#define PKT7(opcode, cnt) \
>>>>>> +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>>>>>> +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>>>>>> +
>>>>>>     static inline void
>>>>>>     OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>>>>>     {
>>>>>>     	adreno_wait_ring(ring, cnt + 1);
>>>>>> -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>>>>>> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>>>>>> +	OUT_RING(ring, PKT7(opcode, cnt));
>>>>>>     }
>>>>>>     struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>>>>>>
>>>>>> -- 
>>>>>> 2.46.0
>>>>>>
>>>>
>>>> Best regards,
>>>> -- 
>>>> Antonino Maniscalco <antomani103@gmail.com>
>>>>
>>
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


