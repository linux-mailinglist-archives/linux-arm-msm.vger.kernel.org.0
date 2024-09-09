Return-Path: <linux-arm-msm+bounces-31364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027C972066
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 19:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4E51F24654
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 17:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76395176252;
	Mon,  9 Sep 2024 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ2l1zNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A2E178CC8;
	Mon,  9 Sep 2024 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902664; cv=none; b=RnTyghTsYTP7AO+mwvcGPurb5bn3GaZiCi8X3cWzKbGoFBFGezIYQBH/GRJtnEkk5/43EAAW2+E8kAT/CesgQ6rFZ8wHMaQCt7HVl/r7Hka6VsGYvo4lWKBimNqFyrW2Sem7M82O/QbTCPeRgsg/6PXK/y/AWEQ6WNauF6WqBaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902664; c=relaxed/simple;
	bh=7jiSeWv8650EDek+o8j6WiWCPM2M1ozrJNSg8x76fhs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kd93qcDm9mvSPnuUwSVOi95raQkceBIjoSWnY2U431YboNXsuJqNw+0QrUBIfjo5VUFU50FmuqIDN4Ps2YHzwv+f7vW0d52pm6q02/Rk7uLkamt0fvXY228OrJPG9Y/+D48QrFe8/jtbQivlL/4kCxtRayjldt7OKJbuZdNaviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ2l1zNU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365c512b00so3913269e87.3;
        Mon, 09 Sep 2024 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725902660; x=1726507460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzINnm2Ya0afTbpAAfgnl7iTn2CTj7St4+vT2jNDuJQ=;
        b=DZ2l1zNUlOYQzUy7ZPy99rFnxiwb3SPEs2pkP61q+f7IppUlOQhj7ITkzgz91BBUY7
         jCk5WLHM4/VT6gxleDKOGj6MIJk5GMiQ6NkpLha+FgS6jdaYN0tRrn74pkU0vnXlZUqd
         qn9U6EwZPw7SqDUBDaKP7a1WsbOoii9Ys5fwbfsxZeOkXAldZMAAgkh7v5PEkeqq/tPD
         hyrDadJdXISmFmlZN+jM0B8efMtELRQTHjJiWEAQC68RDf/o4MXYq0r/swRNCHu2fQj0
         UlWj6L7DUR+VLQeC433klcUfjXHEWH2OsQP5KYcqjPhbryeZut/L7xE8LLEBVQPFiPLf
         NMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725902660; x=1726507460;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzINnm2Ya0afTbpAAfgnl7iTn2CTj7St4+vT2jNDuJQ=;
        b=MRpBTfLqNI/k3Lf5qbWHqNN+BaztcHjGKH5YhWrGSjK6ARE17L9EQTrhjvGvDBy068
         zjebBqqBAAUWxrYo+UXho/HF4HEMo2ijorT6BEsUj+SEXhOtUqzS1UNxoiBinN5RBgsY
         i7mHdPnfOiRBZ9+C8JpcgprA/6Oww94HoiJSdhkuXRR+Wqwr/XmtyTuSPgH5SsR29N9n
         TvXg2dwLu6xEnaYe/uZBEBF9esv55vFIWnE5w/Mu0vwYXJSytcHn5wycm05thI4o3xg+
         xGjAElH7zvJTs62NEbQQGxmayD3keycjXz6odmJVaUb9L+Q/DdyYXT/0x2QeJqHkTNTq
         bmMg==
X-Forwarded-Encrypted: i=1; AJvYcCV1V5AGnBJHTtybw2zJi5HrDQEhAInR+FR866AVxpLqJ1xdgW7yepYQ02FQuaQRkFKKIn9HeeG9IUHzeobh@vger.kernel.org, AJvYcCX7Na98hunSYXus5/kbVzGkDH2ZoZG37Sv9kfPdVdWcmBJl1TNAQN1Nddy3qyQduesxarzu+fDb47G+@vger.kernel.org, AJvYcCXTsq0gfnTeNKvaj3z99wEnnEvZbWxw81W2CopfHgPbpcymt5ipLmZYOYlGylcade4VLm8ej2vHetnpEsp7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+y7prkY6tuNU01LS22aYlw2HZEe+xKRlTpGZJVl5Ii5QRFvXU
	WNdfTCHrECWkxBtBGWalhPzGA8FcaEiKoLrDQNANiGAC/rscSnAC
X-Google-Smtp-Source: AGHT+IFkmOYlKeogDazf8XMnSUXgNmiAwvfoh3FwHyhTcsMIT75dT3NSUUQNHfQeSC4vcrbssokFxg==
X-Received: by 2002:a05:6512:b24:b0:535:3d15:e718 with SMTP id 2adb3069b0e04-536587fcf0fmr8663373e87.50.1725902659411;
        Mon, 09 Sep 2024 10:24:19 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it. [95.246.172.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd52010sm3275587a12.43.2024.09.09.10.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:24:17 -0700 (PDT)
Message-ID: <86b02057-3e25-45c4-afaf-597394132a37@gmail.com>
Date: Mon, 9 Sep 2024 19:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
From: Antonino Maniscalco <antomani103@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
 <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
Content-Language: en-US
In-Reply-To: <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/24 3:15 PM, Antonino Maniscalco wrote:
> On 9/6/24 9:54 PM, Akhil P Oommen wrote:
>> On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
>>> This patch implements preemption feature for A6xx targets, this allows
>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>> hardware as such supports multiple levels of preemption granularities,
>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>> such as draw-call level or a bin boundary level preemption. This patch
>>> enables the basic preemption level, with more fine grained preemption
>>> support to follow.
>>>
>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>>> ---
>>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 +++++++++++++++++++++-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> ...
>>
>> we can use the lighter smp variant here.
>>
>>> +
>>> +        if (a6xx_gpu->cur_ring == ring)
>>> +            gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
>>> +        else
>>> +            ring->skip_inline_wptr = true;
>>> +    } else {
>>> +        ring->skip_inline_wptr = true;
>>> +    }
>>> +
>>> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>>   }
>>>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 
>>> counter,
>>> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu 
>>> *a6xx_gpu,
>>
>> set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
>> not. This is currently not tracked separately for each ring. Can you
>> please check that?
> 
> I totally missed that. Thanks for catching it!
> 
>>
>> I wonder why that didn't cause any gpu errors in testing. Not sure if I
>> am missing something.
>>
> 
> I think this is because, so long as a single context doesn't submit to 
> two different rings with differenr priorities, we will only be incorrect 
> in the sense that we emit more page table switches than necessary and 
> never less. However untrusted userspace could create a context that 
> submits to two different rings and that would lead to execution in the 
> wrong context so we must fix this.
> 
>>>       /*
>>>        * Write the new TTBR0 to the memstore. This is good for 
>>> debugging.
>>> +     * Needed for preemption
>>>        */
>>> -    OUT_PKT7(ring, CP_MEM_WRITE, 4);
>>> +    OUT_PKT7(ring, CP_MEM_WRITE, 5);
>>>       OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
>>>       OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
>>>       OUT_RING(ring, lower_32_bits(ttbr));
>>> -    OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
>>> +    OUT_RING(ring, upper_32_bits(ttbr));
>>> +    OUT_RING(ring, ctx->seqno);
>>>       /*
>>>        * Sync both threads after switching pagetables and enable BR only
>>> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, 
>>> struct msm_gem_submit *submit)
>>>       a6xx_flush(gpu, ring);
>>>   }
> ...
>>> +    struct a6xx_preempt_record *record_ptr =
>>> +        a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE;
>>> +    u64 ttbr0 = ring->memptrs->ttbr0;
>>> +    u32 context_idr = ring->memptrs->context_idr;
>>> +
>>> +    smmu_info_ptr->ttbr0 = ttbr0;
>>> +    smmu_info_ptr->context_idr = context_idr;
>>> +    record_ptr->wptr = get_wptr(ring);
>>> +
>>> +    /*
>>> +     * The GPU will write the wptr we set above when we preempt. Reset
>>> +     * skip_inline_wptr to make sure that we don't write WPTR to the 
>>> same
>>> +     * thing twice. It's still possible subsequent submissions will 
>>> update
>>> +     * wptr again, in which case they will set the flag to true. 
>>> This has
>>> +     * to be protected by the lock for setting the flag and updating 
>>> wptr
>>> +     * to be atomic.
>>> +     */
>>> +    ring->skip_inline_wptr = false;
>>> +
>>> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>> +
>>> +    gpu_write64(gpu,
>>> +        REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
>>> +        a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_INFO);
>>> +
>>> +    gpu_write64(gpu,
>>> +        REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
>>> +        a6xx_gpu->preempt_iova[ring->id] + 
>>> PREEMPT_OFFSET_PRIV_NON_SECURE);
>>> +
>>> +    preempt_offset_priv_secure =
>>> +        
>>> PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_record_size);
>>> +    gpu_write64(gpu,
>>> +        REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
>>> +        a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure);
>>
>> Secure buffers are not supported currently, so we can skip this and the
>> context record allocation. Anyway this has to be a separate buffer
>> mapped in secure pagetable which don't currently have. We can skip the
>> same in pseudo register packet too.
>>
> 
> Mmm it would appear that not setting it causes an hang very early. I'll 
> see if I can find out more about what is going on.

Actually it was a mistake I had made when testing. The secure record 
will be gone from the next revision.

> 
>>> +
>>> +    a6xx_gpu->next_ring = ring;
>>> +
> ...
>>>   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>
>>> -- 
>>> 2.46.0
>>>
> 
> Best regards,

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


