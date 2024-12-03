Return-Path: <linux-arm-msm+bounces-40107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3E79E24EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B90C3B3A6CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1EB1F6679;
	Tue,  3 Dec 2024 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzV49IoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB31F7073
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733236573; cv=none; b=XZsKpGbR5fYWo5Qx0bkmJD5aIQSNJO/N+05orlb7l0os3oGydViTYJs4AJnatlQgn33XEiIWaLLjplPOZiCInybpH0dZtGSPB+XvQFv4Z8KzOu3vlmwP6NBcclpSvBL1WD+FgfpopQlwvaUO+E1ww91P160OPZAZ1CcsKq7FjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733236573; c=relaxed/simple;
	bh=VoloerIYtuD4Kf9hzsRoF48FaEfryw1QZS1CTNPTMkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b10tn34MVHKbVJxmj/hcpku8NiHDYqz/Lr9Jkzto7zlipwoR7U8phO/SYKACPHiqR57EYPinwvLjC7DGU43T+WQea5QAfoqQHUvUg0gV4kZ4GVFlCraw3ulIK1Ni4HwDZtp6QrDlBgS9ZjokQgRqSOpEot9kTqMOl3Fp+EH46pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzV49IoZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53df67d6659so8795208e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 06:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733236570; x=1733841370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UdbFlmq11p+eASdBnxObk/yRdYyyhts6n06xqRje/4=;
        b=QzV49IoZULvkSqnVWWGWJnIooHDytsbZZ6tSSEjqCSIIcQal7RPqpKPJj3bstLJJD/
         3RZNxwKThuVWarhPCLOcrUBav/ilvrhT+y1AsLtGy5BM+pXshWz4gDgzX3JeH855OuKi
         l2pyupIeSyreStXmpymFKf/K/bRudupK4pybdgW5fRlaQRPEsWaxMmTtWagtm5fndRVl
         iUweDpG2lfoVRu3az/God0nRU50ffc550bQtp7VcfIL7ay8QIumoqAscBCUJuSRlN+kV
         f5tABjZnFY5Uv54LXiIZqwcIpO++H6XqyH8Gu3JoMsAJStbeggZZlmKPgnsJrJ7th4/8
         coxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733236570; x=1733841370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UdbFlmq11p+eASdBnxObk/yRdYyyhts6n06xqRje/4=;
        b=QyqbgPnc6XT0+m2W0ssw1loSIeG2I+CFqBSDRUJJTnaeUev2k2Ryd8biYHf+Y7cTEK
         xDM0C0CAV9hPMLw+TdtGy2ZeTr7jYGTzhqzrVgW3n1IJSK1IbjR3Sx0abf/Ma0BJhzJl
         stfm+CRDIviqHwzPcbXGL1bwIghvuIG0wkN1hCPqQ2PhnNrFM1XlIlgAZsvrgiuJB6/S
         6OVWh4pMuN9uqzRyzdB3B68a+SxdpYzv3TX/A3s/3rXy+rIVtR6F90XmjtNjq7PIzQK8
         3OhpBMG518SWmz24pdmNB4lxpmDFOOg4shg8zK62zSYJ4HujvmgF1RTWLp3Y2CFQhgI+
         tBiA==
X-Forwarded-Encrypted: i=1; AJvYcCVtUjPPHKScXQFsIxqoeUsWDott/eh+2XDLXyX91iyUx8JCGnvW3jK/i1yqpO0R+BQcLshHU7C5mH06CkwE@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBfgOyQGs2/dJ2pWRGKaSQNKW0gxMK7YxjMaKdlJirLfQbAEI
	00BZ5HstBomyOoyO4lI+IJUO2aHwX8cm1leMVPzOnOY0PdoNMgQdFLUCfXRM
X-Gm-Gg: ASbGncvNxhpPWwYf+qFahowksWPhHriwQgd8d1Ncqmnle/g00Gwv2NPuvsXlpbuyAyB
	E8nXRzbI1nCfc9IVdhP9UkBwH71mYgDYj7njAW+Ss/Uz74b52WkH9TC7Fm55Scmis0VpheSTYmQ
	bB9/rvbdFrAxKoRZuViUe/sMOfo4mdDAH/U+OaR3W5IJ4ZLx3ezhtzIiWbMym7vo5fkWgQcqwtU
	KhbhdeDCBRSPAPG/0nv0P/aNbnWENciajq18DaJHswD2eYdVQz0fnqwKC/GHXw=
X-Google-Smtp-Source: AGHT+IEtiGgdnjzwS+6qliEstHFZt4D+WconNrWNE54EW5G6CLa24DZTyDgOoGvRfKazsixde2AXjQ==
X-Received: by 2002:a05:6512:3096:b0:53b:4a6c:1849 with SMTP id 2adb3069b0e04-53e12a3195bmr2515865e87.35.1733236569615;
        Tue, 03 Dec 2024 06:36:09 -0800 (PST)
Received: from [192.168.50.169] ([195.136.68.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm1858540e87.84.2024.12.03.06.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 06:36:09 -0800 (PST)
Message-ID: <38445cf6-0f09-42df-a033-cd2a00c71e0a@gmail.com>
Date: Tue, 3 Dec 2024 15:36:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
 <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
 <b63d73ce-0845-4c0b-a110-4e10b8f587eb@gmail.com>
 <s6yaog7kffvbfzz3uhwvkfzxxe2n32sdefia3g75gffqhgjcjw@6fbifjd36yr7>
Content-Language: en-US
From: Danylo <danylo.piliaiev@gmail.com>
In-Reply-To: <s6yaog7kffvbfzz3uhwvkfzxxe2n32sdefia3g75gffqhgjcjw@6fbifjd36yr7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




On 12/3/24 14:34, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 02:09:59PM +0100, Danylo wrote:
>>
>>
>> On 12/3/24 13:52, Dmitry Baryshkov wrote:
>>> On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
>>>> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
>>>> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
>>> Could you please spend more words, describing what it is and why is it
>>> necessary for those extensions. For a5xx+ it looks like some kind of an
>>> internal address (what kind of?). For a4xx I'm completely lost.
>> Yes, my bad. On at least a6xx+, shader could read 64b ALWAYSON counter
>> from UCHE_TRAP_BASE+0 address. We use it to implement VK_KHR_shader_clock:
>>   "This extension advertises the SPIR-V ShaderClockKHR capability for Vulkan,
>> which
>>    allows a shader to query a real-time or monotonically incrementing counter
>> at
>>    the subgroup level or across the device level."
>> And there is no other proper way to get such counter. Same with
>> GL_ARB_shader_clock.
> Yes, please add this to the commit message.
Ok.

>> Not sure what's there on older gens, I exposed the value on them for the
>> completeness sake. But I don't know whether it is desired or not (I don't
>> expect
>> the value being read and used on a4xx/a5xx in Mesa).
> Do you know if there is anything interesting in that region on a4xx /
> a5xx (or at least if it's a region on a4xx?) Also how will that
> GET_PARAM behave on a2xx-a3xx? Will it return 0 or some -EINVAL?
I don't know if there is anything interesting there on a5xx or a4xx.
I booted a5xx board I dug up, but found out that on a5xx we are
even missing the instruction to read from memory address, so I wasn't
able to check what's at that address.

As for what to return on a2xx-a3xx, as suggested by Rob,
I'll rebase on https://patchwork.freedesktop.org/series/141667/ then
I will return EINVAL:
         if (adreno_gpu->uche_trap_base == 0)
             return UERR(EINVAL, drm, "no uche trap base");

>>>> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>>>    include/uapi/drm/msm_drm.h              |  1 +
>>>>    6 files changed, 23 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>>>> index 50c490b492f0..f1b18a6663f7 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>>>> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>>>>    		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>>>>    	/* Disable L2 bypass to avoid UCHE out of bounds errors */
>>>> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
>>>> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
>>>> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>>>> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>>>    	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>>>>    			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
>>>> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>>>>    	if (ret)
>>>>    		goto fail;
>>>> +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
>>>> +
>>>>    	if (!gpu->aspace) {
>>>>    		/* TODO we think it is possible to configure the GPU to
>>>>    		 * restrict access to VRAM carveout.  But the required
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> index ee89db72e36e..caf2c0a7a29f 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>>>>    	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>>>>    	/* Disable L2 bypass in the UCHE */
>>>> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
>>>> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
>>>> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
>>>> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
>>>> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>>>> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>>> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>>>> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>>>    	/* Set the GMEM VA range (0 to gpu->gmem) */
>>>>    	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>>>> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>>>    	adreno_gpu->ubwc_config.macrotile_mode = 0;
>>>>    	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>>>> +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>>>> +
>>>>    	return gpu;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 019610341df1..0ae29a7c8a4d 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>>>>    	/* Disable L2 bypass in the UCHE */
>>>>    	if (adreno_is_a7xx(adreno_gpu)) {
>>>> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
>>>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
>>>> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
>>>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>>>>    	} else {
>>>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
>>>> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
>>>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
>>>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
>>>> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
>>>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>>>>    	}
>>>>    	if (!(adreno_is_a650_family(adreno_gpu) ||
>>>> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>    		}
>>>>    	}
>>>> +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
>>>> +
>>>>    	if (gpu->aspace)
>>>>    		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>>>>    				a6xx_fault_handler);
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 076be0473eb5..774ff6eacb9f 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>>>>    	case MSM_PARAM_MACROTILE_MODE:
>>>>    		*value = adreno_gpu->ubwc_config.macrotile_mode;
>>>>    		return 0;
>>>> +	case MSM_PARAM_UCHE_TRAP_BASE:
>>>> +		*value = adreno_gpu->uche_trap_base;
>>>> +		return 0;
>>>>    	default:
>>>>    		DBG("%s: invalid param: %u", gpu->name, param);
>>>>    		return -EINVAL;
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index e71f420f8b3a..9bd38dda4308 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -253,6 +253,8 @@ struct adreno_gpu {
>>>>    	bool gmu_is_wrapper;
>>>>    	bool has_ray_tracing;
>>>> +
>>>> +	u64 uche_trap_base;
>>>>    };
>>>>    #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>>>> index b916aab80dde..2342cb90857e 100644
>>>> --- a/include/uapi/drm/msm_drm.h
>>>> +++ b/include/uapi/drm/msm_drm.h
>>>> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>>>>    #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>>>> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>>>>    /* For backwards compat.  The original support for preemption was based on
>>>>     * a single ring per priority level so # of priority levels equals the #
>>>> -- 
>>>> 2.46.2
>>>>


