Return-Path: <linux-arm-msm+bounces-31348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0733971D81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 17:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242381F23881
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E84E19BB7;
	Mon,  9 Sep 2024 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dP2uS1O3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7AA17588;
	Mon,  9 Sep 2024 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894469; cv=none; b=aGhQcZzoX/g8nrYLeKvgGXQ+8l2d4kvKCCA+rXuRNYqfcKtcmdLmACTFbmJgFzFXu47WYV9ygJCG0GxzfB04n9/HEmMzg2BKcvNY758eRm6tEgDTAxbOvuRAnA3VO4itgODkti5kDOcQQ27yPokTOJ/WLOoomAjsUF6iT+m1+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894469; c=relaxed/simple;
	bh=875Y4VjyHmXMs+IK0RMM4p2xYMb4iej5Rh1Oje6xBFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZORuryfoNIwsrYgGYco4TKOTaDRaWuZc1TyoAdiagsoJJIL83DzUlbZ6qByUGaO0r5pI3YwO2sWwxApdIRZ8t97m50n7cFxurzHlyeW3kN0PobXoDoflY2/xk8Vg2ANHcVmkBiDryptAttUa5Iv7+lqw+Yc29e8b1rBsx9QmRDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dP2uS1O3; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c3c3b63135so4736830a12.3;
        Mon, 09 Sep 2024 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725894466; x=1726499266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0e3VQB4mtZmgnW0q+EBl348gw10/94LT4bRkiM7OfK4=;
        b=dP2uS1O3OdOApWueEWUvhzFlIZ0jTX8XfzynFSAN+Qku2MoXtrcvYIwLsSUXfyxCEv
         4sQ6Yc8jkHMu3hS8usJCH5SXRgCriGpgpOPHDZiXz2zgoHQYjR4A5SUPsXIQuTxYwarh
         iNkWVw5/ep2+cLGOr6w9jvxcLmVBwmtPSHKninCV/r2iWZlovs987NbxLbKUxGT/a37J
         bsky+zBXq4PePJ/JmmYJONYdxeoaN3g4HJDwpTUpkeyz3K5m3dluMquzN6Vtm74GGXp0
         B+UsxRHNH6jDvOSIMlbRxg2SO8WrjibZrnxBy/f9xw3eVr3MuSk/z/SvmeXIN2uMXC8M
         yjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894466; x=1726499266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e3VQB4mtZmgnW0q+EBl348gw10/94LT4bRkiM7OfK4=;
        b=UN8NBEN7VByLIz27AqN5veqDRdJpEgfdWwTVZ2a0QvEwdFUAXVY0C7/HfFZP5dGR3U
         eCZJ5i9eyUZvG5VMQQW9CEkzT207XIf5hcgcwszxbCn87Ws2M3znqQJEu8nkwOkh5cg+
         gjzyDZd2FtGuTCmdTfccnM7za1qS78Czg7Sl4Qcq7ckq4dD7cBW39PDKka8awiX75SjK
         4m/8SbYGzb4hkNDCFgAdbvO24/YVW+T3w0z9EYtpnayEPfjQrO1tSlI9pkMqG6+/usQK
         dNf6IVZtT7DRl/CbG0BNq+9Ha2iAj4G8s1qp2ihD8m9fmZZDS5N2/a1JGkez5/Mo0HVe
         93NA==
X-Forwarded-Encrypted: i=1; AJvYcCUBxrkdSzJMPTHGg21JRCBoNFyqdMVnY36LEVDd1zNHPXIt/AyXcCJQ+iuRrJknSTdHcZdYNCvj03zGK+8+@vger.kernel.org, AJvYcCUQl+/tLKfxmhlGjsliHe3wHN37/zqkL8+i4fMiMQQAJp1JWClrk43L6scxBngUabXEWruMZ+D09pncwagG@vger.kernel.org, AJvYcCXIU19t0Rgr9BMPGwX05xxA2y4PNDtQNw3PxB74/GN8r0UBjWCeJqiXow1RnNE99xT1KZwGCTt+9lPI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi17Yt3eujers9ZzOF2wsWvZPV/KgOShfBW3aqyTUzOknLIwRL
	b4G62HUYY8svGgIZPAuYqkBd95Y/PhOo+g+glyTkzng8rrUO3LVX
X-Google-Smtp-Source: AGHT+IGJinPXTnmtg2jvdQUT+IkSTQKqrBpThwnTKU/zEfWtEF1nJMRSz7qtzC1Q2lBU0r0PDBhmNg==
X-Received: by 2002:a05:6402:5409:b0:5c3:3f6a:9767 with SMTP id 4fb4d7f45d1cf-5c3dc7904d8mr9809150a12.9.1725894465215;
        Mon, 09 Sep 2024 08:07:45 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it. [95.246.172.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd4680esm3109614a12.21.2024.09.09.08.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 08:07:44 -0700 (PDT)
Message-ID: <69efbf90-7ce1-429f-bf3a-d19acd7d649d@gmail.com>
Date: Mon, 9 Sep 2024 17:07:42 +0200
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
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 10:08 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
>> Use the postamble to reset perf counters when switching between rings,
>> except when sysprof is enabled, analogously to how they are reset
>> between submissions when switching pagetables.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>   4 files changed, 61 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index ed0b138a2d66..710ec3ce2923 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>   		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>   {
>> -	u64 preempt_offset_priv_secure;
>> +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>> +	u64 preempt_offset_priv_secure, preempt_postamble;
>>   
>>   	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>   
>> @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>   	/* seems OK to set to 0 to disable it */
>>   	OUT_RING(ring, 0);
>>   	OUT_RING(ring, 0);
>> +
>> +	/* if not profiling set postamble to clear perfcounters, else clear it */
>> +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
>> +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
>> +
>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>> +		OUT_RING(ring, lower_32_bits(preempt_postamble));
>> +		OUT_RING(ring, upper_32_bits(preempt_postamble));
>> +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>> +					a6xx_gpu->preempt_postamble_len) |
>> +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>> +	} else {
> 
> Why do we need this else part?

Wouldn't the postmable remain set if we don't explicitly set it to 0?

> 
>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>> +		OUT_RING(ring, 0);
>> +		OUT_RING(ring, 0);
>> +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>> +	}
>>   }
>>   
>>   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index da10060e38dc..b009732c08c5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -71,6 +71,11 @@ struct a6xx_gpu {
>>   	bool uses_gmem;
>>   	bool skip_save_restore;
>>   
>> +	struct drm_gem_object *preempt_postamble_bo;
>> +	void *preempt_postamble_ptr;
>> +	uint64_t preempt_postamble_iova;
>> +	uint64_t preempt_postamble_len;
>> +
>>   	struct a6xx_gmu gmu;
>>   
>>   	struct drm_gem_object *shadow_bo;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 1caff76aca6e..ec44f44d925f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>   	return 0;
>>   }
>>   
>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>> +	u32 count = 0;
>> +
>> +	postamble[count++] = PKT7(CP_REG_RMW, 3);
>> +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>> +	postamble[count++] = 0;
>> +	postamble[count++] = 1;
>> +
>> +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>> +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>> +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>> +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>> +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>> +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>> +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>> +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> 
> Isn't it better to just replace this with NOP packets when sysprof is
> enabled, just before triggering preemption? It will help to have an
> immediate effect.
> 
> -Akhil
> 

Mmm, this being a postamble I wonder whether we have the guarantee that 
it finishes execution before the IRQ is called so updating it doesn't 
race with the CP executing it.

>> +
>> +	a6xx_gpu->preempt_postamble_len = count;
>> +}
>> +
>>   void a6xx_preempt_fini(struct msm_gpu *gpu)
>>   {
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>   	a6xx_gpu->uses_gmem = 1;
>>   	a6xx_gpu->skip_save_restore = 1;
>>   
>> +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
>> +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
>> +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
>> +			&a6xx_gpu->preempt_postamble_iova);
>> +
>> +	preempt_prepare_postamble(a6xx_gpu);
>> +
>> +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>> +		goto fail;
>> +
>>   	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
>>   
>>   	return;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6b1888280a83..87098567483b 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>   	OUT_RING(ring, PKT4(regindx, cnt));
>>   }
>>   
>> +#define PKT7(opcode, cnt) \
>> +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>> +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>> +
>>   static inline void
>>   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>   {
>>   	adreno_wait_ring(ring, cnt + 1);
>> -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>> +	OUT_RING(ring, PKT7(opcode, cnt));
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


