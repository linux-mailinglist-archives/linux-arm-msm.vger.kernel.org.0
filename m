Return-Path: <linux-arm-msm+bounces-30734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB696BEF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4213CB2746B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929671DA627;
	Wed,  4 Sep 2024 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzFPOXVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479A1DA31E;
	Wed,  4 Sep 2024 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457146; cv=none; b=SymsAkUolsr/eTefepBqRe0q9BCg1eWoQbCxMBPZ4ULNpyHMO4DdkfeXatkTpW9uesyarvo+RJ/3x4jFz8anK9tP9Bi/aBXQOMUtPHKt0dv4+uDe+6B0p3i8UUpmPttGvzjf/0LIZeQxQHdy9GLaJ/cS/VZTdO81frdE8ZUNkhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457146; c=relaxed/simple;
	bh=cXxmv6sbc76sr7GnGPhYPeHVaZNdsZNbl7PWSeHmgyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnT74utq0jpHLKZ9wo9IUnGsQIp5BHSqfElz2P/SN5vZSEIwhhuyu+qL7+SJm+IdRMHGgSt8KrQUxZibT1VN+x0ldkagCwgt5X/zYC2q5IOdgR28IhwFcF/T9yrkud6G0c/2wn0PgxptOG8JKkzFmLihn5qO3GudePi5y9kjMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzFPOXVA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c251ba0d1cso3590024a12.3;
        Wed, 04 Sep 2024 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725457143; x=1726061943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08yJDMGUC5nJvNhwZc+qx2S6bd96dFeBgNvhyQY1m4Y=;
        b=RzFPOXVART6U0hzMpb8mwLVf+azLmBZfCZJSZrOvzQd2LOd758KOYz3syMtwMkW1Um
         3Onzfjt6BBLCVi3zuna6MeSF3GLZ1Yb/2uUensCZwN4qgdfG0IWcMyrnVt90eicZs19x
         8bP97W8AhXA6WqvO3px3EXOBjDFQnO1quTbcRRTq196fUVSaaq6GRNOCEHN9TN4amENw
         bWa/WwCO1kzQ4TXy0CbJei94Ak36oLLjSJUaSl6tu5oxHpUVTOkPafFEWwkJv33FVZfU
         g1rzxTFmhLzagiExLdo1rtIT07xjU+EkkW2ER6uiRTJHqXuwdSrpjyMK0J6IasA2qB26
         4skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725457143; x=1726061943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08yJDMGUC5nJvNhwZc+qx2S6bd96dFeBgNvhyQY1m4Y=;
        b=aULRwVn2lGfAFNQm/kb9K1BRFdaHNrUuXazSz5W+JyU6MfdUoS/QXem8Nw7hmkfhUl
         mt4zVEJbfZEYvpED0f6wnk8/7+vW5j3V2e4NmGR2hwQ/MQtKtaNBHNAvKzODRKNj8z69
         WwjJWfiPIV/lNxWiDQdIkxgIcZ7RHsFn8YVMlS4C7FBWnhMPr2bunC0ybmI4gRW5tH4s
         R+g2AHH2mGqNL0Ki9qRmp154oULtUoNWch23LTCLCPUmcKlD8fR+XCVakHkjcBZbHsmg
         Y6wHJSqGvoRh58XB59ME+0/3U3+SmGB8LfHPbLx03l6/rnkf9nn9fFcyq3gNUItLXxtR
         y45g==
X-Forwarded-Encrypted: i=1; AJvYcCVJU+ZzWkFhqRhurkq9RC6THbOXnyghVpaaSMGlSBsqRXES3X9Xpxre/r34s/0ldKMZPytEV7G00K6iCemF@vger.kernel.org, AJvYcCXUFe9R+KMEzfEnR6uab2m2FAoYvtLyfPKpdyjtrNzGiHvQMQTw5Bvf2cWkjpM6L6a68TT+qdnPip7dNaZu@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAdWDErJo7H4awtVCjzcapJIQObO9x5rwivua6sBz2ns/l1cs
	UkQjQWbkzoN131p8QKhG7dnIFLzy+sxOGitad8LY8GyVhDEvxSR+
X-Google-Smtp-Source: AGHT+IFMURDKJcnkYF+8eavXj8ZUdnqa5cQaVjvuPu8moS+BA4V7/R/3KDv+62gvdYtT1mL3oEKeIQ==
X-Received: by 2002:a05:6402:2110:b0:5bf:c8:78a with SMTP id 4fb4d7f45d1cf-5c25f244d2cmr7313938a12.17.1725457141638;
        Wed, 04 Sep 2024 06:39:01 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a36fsm7611564a12.16.2024.09.04.06.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 06:39:01 -0700 (PDT)
Message-ID: <b899d35a-fedf-4748-ac23-6389a8742160@gmail.com>
Date: Wed, 4 Sep 2024 15:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/A6xx: Use posamble to reset counters on
 preemption
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
 <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/30/24 8:32 PM, Rob Clark wrote:
> On Fri, Aug 30, 2024 at 8:33 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> Use the postamble to reset perf counters when switching between rings,
>> except when sysprof is enabled, analogously to how they are reset
>> between submissions when switching pagetables.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>   4 files changed, 49 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 1a90db5759b8..3528ecbbc1ab 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>                  struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>   {
>> -       u64 preempt_offset_priv_secure;
>> +       bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>> +       u64 preempt_offset_priv_secure, preempt_postamble;
>>
>>          OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>
>> @@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>          /* seems OK to set to 0 to disable it */
>>          OUT_RING(ring, 0);
>>          OUT_RING(ring, 0);
>> +
>> +       if (!sysprof && a6xx_gpu->preempt_postamble_len) {
>> +               preempt_postamble = SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu);
>> +
>> +               OUT_PKT7(ring, CP_SET_AMBLE, 3);
>> +               OUT_RING(ring, lower_32_bits(preempt_postamble));
>> +               OUT_RING(ring, upper_32_bits(preempt_postamble));
>> +               OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>> +                                       a6xx_gpu->preempt_postamble_len) |
>> +                               CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>> +       }
> 
> Hmm, ok, we set this in the submit path.. but do we need to clear it
> somehow when transitioning from !sysprof to sysprof?
> 

We can always emit the packet and 0 fields out when sysprof is enabled. 
Would that be ok for you? Only emitting it when needed might be 
nontrivial given that there are multiple rings and we would be paying 
the overhead for emitting it in the more common case (not profiling) anyway.

> Also, how does this interact with UMD perfctr queries, I would expect
> they would prefer save/restore?

Right so my understanding given previous discussions is that we want to 
disable preemption from userspace in that case? The vulkan extension 
requires to acquire and release a lock so we could use that to emit the 
packets that enable and disable preemption perhaps.

> 
> BR,
> -R
> 
>>   }
>>
>>   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 652e49f01428..2338e36c8f47 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -66,6 +66,7 @@ struct a6xx_gpu {
>>          atomic_t preempt_state;
>>          spinlock_t eval_lock;
>>          struct timer_list preempt_timer;
>> +       uint64_t preempt_postamble_len;
>>
>>          unsigned int preempt_level;
>>          bool uses_gmem;
>> @@ -99,6 +100,11 @@ struct a6xx_gpu {
>>   #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
>>          (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
>>
>> +#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
>> +
>> +#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
>> +       (a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
>> +
>>   /*
>>    * In order to do lockless preemption we use a simple state machine to progress
>>    * through the process.
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 4b61b993f75f..f586615db97e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>          return 0;
>>   }
>>
>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +       u32 *postamble = a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POSTAMBLE_OFFSET;
>> +       u32 count = 0;
>> +
>> +       postamble[count++] = PKT7(CP_REG_RMW, 3);
>> +       postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>> +       postamble[count++] = 0;
>> +       postamble[count++] = 1;
>> +
>> +       postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>> +       postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>> +       postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>> +                               REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>> +       postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>> +       postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>> +       postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>> +       postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>> +
>> +       a6xx_gpu->preempt_postamble_len = count;
>> +}
>> +
>>   void a6xx_preempt_fini(struct msm_gpu *gpu)
>>   {
>>          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>          a6xx_gpu->skip_save_restore = 1;
>>
>>          a6xx_gpu->scratch_ptr  = msm_gem_kernel_new(gpu->dev,
>> -                       gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
>> +                       PAGE_SIZE, MSM_BO_WC,
>>                          gpu->aspace, &a6xx_gpu->scratch_bo,
>>                          &a6xx_gpu->scratch_iova);
>>
>> +       preempt_prepare_postamble(a6xx_gpu);
>> +
>>          if (IS_ERR(a6xx_gpu->scratch_ptr))
>>                  goto fail;
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6b1888280a83..87098567483b 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>          OUT_RING(ring, PKT4(regindx, cnt));
>>   }
>>
>> +#define PKT7(opcode, cnt) \
>> +       (CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>> +               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>> +
>>   static inline void
>>   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>   {
>>          adreno_wait_ring(ring, cnt + 1);
>> -       OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>> +       OUT_RING(ring, PKT7(opcode, cnt));
>>   }
>>
>>   struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>>
>> --
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


