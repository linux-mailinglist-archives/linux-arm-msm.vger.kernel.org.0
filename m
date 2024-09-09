Return-Path: <linux-arm-msm+bounces-31317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB78971A99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7821F237BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67B51B86DB;
	Mon,  9 Sep 2024 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSI/Tq8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07A1B78F3;
	Mon,  9 Sep 2024 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887757; cv=none; b=Q/BGUnK3/RNcDU4ww1P2WiI/pf8sLXwJ8F+OZa4HSXL9kaqhySANOU8e2EuVSvkxnCginIqff3U5EU2g1mYJVv+zsWuhcioKZTiGNjHyP3plmiBgFQib324SsTPGAUmb2hEZWlh0Qw1JGpK57L+9dK/DuCIhGJnNxDA8Thbpe5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887757; c=relaxed/simple;
	bh=Uez7NMTuT0WM2kZIIpZ8ADHwHBh3bf3xYBsPyrz0j1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFtEOiLYAyrTxgqw6HQQQ8LHBPKSVPI2lKs+tKUpSl26tn31vOagSIXIfX/z3F2vPGVD9rT9d4WWybPsbf2aGTUsxSUu+yt9Kmc9RPIzvSxkNRNWJFD8gNAgtkC+KS78bPDryrZwAR5u/7aG7BgkApdpGsK/1MYe/UdJRkxI8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSI/Tq8D; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c3c3b63135so4560551a12.3;
        Mon, 09 Sep 2024 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725887754; x=1726492554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0szTpntTikg706FgJTsH1S+zClPIdKgVR1ySeBMMIEA=;
        b=SSI/Tq8D2cisDcND4mSqGhpFn8ito/MSJZQnVpNi0Y6f63SGckAZHp/mx6XEC05+Js
         9DyFlFC2hG6j44d/n5tE2JBecFl4Bs37SLqCSegDxoJMEDi7FIajB+sXJZPIwCqskyIL
         jtAtXxjUTWba+PhLXhBi6Wb69tV5B39QOMw1W8HmmuntZj66drsjgDCWgIqcwQCQq7Gu
         JjsYf6MjtsR3UcY96m2NHcBRJnl94SF4eah11UZ7YsDLRNeori5haNm//J4QeNCjalLO
         +0mP2fI7sRyR9nNuWWVVNZtWW0yGukhKsuZvb7yrh8cxMHDhMPLDWpvj4I4g9irrUIVl
         QRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887754; x=1726492554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0szTpntTikg706FgJTsH1S+zClPIdKgVR1ySeBMMIEA=;
        b=h+KsOSJOH6QHMcqAU2IyXVB/Y0hzeZdipjz8Pr8+ESR1dPwZf1AimoZPIuEM0GUkeF
         rZmVCujmUOsZopeAUmhpNA1XVepdhIBH0miVCKBJHyZMau1X1+X97ncBhfrqveLg86fC
         +UOuk1y+Cyh2ugmX12bBmNUFKFnM25lHxR/epncvbfeCgJ8cTN25VbuebK8lIPQFLyt5
         ZGno6P7LsyYi2QEvj2spcvG/ziA2zIp36jQvMPFA5ojizyDoJJjmQlYl+lI1/NICkDYo
         QVOvTqs1XghgseN+yVec7vQy92JpPWC38716erSZIAC/jBEQN61CWeNlvWB92diRKTJ6
         NdaA==
X-Forwarded-Encrypted: i=1; AJvYcCUcEQdZ9C9uZHsSbYXFWMF2JxMSgI8rqNMqzMUYRxDiyjpaLfuyoIG7rMBI0xhkLZGcRGMHlfLtEK0vbbki@vger.kernel.org, AJvYcCVv9+VhFScMW7x/hygzbIwkr4eqQh+VkcgpY/CloW4wQ0LLdw3Pp//5UiNyYPk+CgTGoPdHjFPRuJuj@vger.kernel.org, AJvYcCXmbR+eDiNwQNJ6MXAE6KRNoLV5akxJH1cs4aScENtcH3X7GvHik76c3J+rjv9wKpVXpFbpu7tEbGje/6mw@vger.kernel.org
X-Gm-Message-State: AOJu0YzezKEloZI5WvT82CZks8c74LRQEG4H0TtvVTXu7RnmFtziXbtf
	+cnv/apvK/fFHo5OzGkNzpkA72UYhrmGPWq6yozYfpQcKQg9HhTg
X-Google-Smtp-Source: AGHT+IF/r30Dk3ePhvp2ter/2dqTi0m3U1rU/oX1maS5tjBZG1A0aRxKAkqme9+zXHINhvtdF0T8dA==
X-Received: by 2002:a05:6402:5193:b0:5c3:c520:b019 with SMTP id 4fb4d7f45d1cf-5c3dc7c7154mr8327573a12.34.1725887752685;
        Mon, 09 Sep 2024 06:15:52 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it. [95.246.172.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd468a1sm2988829a12.26.2024.09.09.06.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:15:52 -0700 (PDT)
Message-ID: <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
Date: Mon, 9 Sep 2024 15:15:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
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
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
>> This patch implements preemption feature for A6xx targets, this allows
>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>> hardware as such supports multiple levels of preemption granularities,
>> ranging from coarse grained(ringbuffer level) to a more fine grained
>> such as draw-call level or a bin boundary level preemption. This patch
>> enables the basic preemption level, with more fine grained preemption
>> support to follow.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> ---
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
...
> 
> we can use the lighter smp variant here.
> 
>> +
>> +		if (a6xx_gpu->cur_ring == ring)
>> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
>> +		else
>> +			ring->skip_inline_wptr = true;
>> +	} else {
>> +		ring->skip_inline_wptr = true;
>> +	}
>> +
>> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>   }
>>   
>>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> 
> set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> not. This is currently not tracked separately for each ring. Can you
> please check that?

I totally missed that. Thanks for catching it!

> 
> I wonder why that didn't cause any gpu errors in testing. Not sure if I
> am missing something.
> 

I think this is because, so long as a single context doesn't submit to 
two different rings with differenr priorities, we will only be incorrect 
in the sense that we emit more page table switches than necessary and 
never less. However untrusted userspace could create a context that 
submits to two different rings and that would lead to execution in the 
wrong context so we must fix this.

>>   
>>   	/*
>>   	 * Write the new TTBR0 to the memstore. This is good for debugging.
>> +	 * Needed for preemption
>>   	 */
>> -	OUT_PKT7(ring, CP_MEM_WRITE, 4);
>> +	OUT_PKT7(ring, CP_MEM_WRITE, 5);
>>   	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
>>   	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
>>   	OUT_RING(ring, lower_32_bits(ttbr));
>> -	OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
>> +	OUT_RING(ring, upper_32_bits(ttbr));
>> +	OUT_RING(ring, ctx->seqno);
>>   
>>   	/*
>>   	 * Sync both threads after switching pagetables and enable BR only
>> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   	a6xx_flush(gpu, ring);
>>   }
...
>> +	struct a6xx_preempt_record *record_ptr =
>> +		a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE;
>> +	u64 ttbr0 = ring->memptrs->ttbr0;
>> +	u32 context_idr = ring->memptrs->context_idr;
>> +
>> +	smmu_info_ptr->ttbr0 = ttbr0;
>> +	smmu_info_ptr->context_idr = context_idr;
>> +	record_ptr->wptr = get_wptr(ring);
>> +
>> +	/*
>> +	 * The GPU will write the wptr we set above when we preempt. Reset
>> +	 * skip_inline_wptr to make sure that we don't write WPTR to the same
>> +	 * thing twice. It's still possible subsequent submissions will update
>> +	 * wptr again, in which case they will set the flag to true. This has
>> +	 * to be protected by the lock for setting the flag and updating wptr
>> +	 * to be atomic.
>> +	 */
>> +	ring->skip_inline_wptr = false;
>> +
>> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>> +
>> +	gpu_write64(gpu,
>> +		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
>> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_INFO);
>> +
>> +	gpu_write64(gpu,
>> +		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
>> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE);
>> +
>> +	preempt_offset_priv_secure =
>> +		PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_record_size);
>> +	gpu_write64(gpu,
>> +		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
>> +		a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure);
> 
> Secure buffers are not supported currently, so we can skip this and the
> context record allocation. Anyway this has to be a separate buffer
> mapped in secure pagetable which don't currently have. We can skip the
> same in pseudo register packet too.
>

Mmm it would appear that not setting it causes an hang very early. I'll 
see if I can find out more about what is going on.

>> +
>> +	a6xx_gpu->next_ring = ring;
>> +
...
>>   
>>   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>
>> -- 
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


