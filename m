Return-Path: <linux-arm-msm+bounces-40076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B51AD9E1D26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 732592815B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBC41E53A;
	Tue,  3 Dec 2024 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RduRE3G/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C31B0F39
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231404; cv=none; b=i+NQG4eO1s9aQgxhcU59/xIpY4CZYLKFSpYX3zmS2VBhX+8t3DLR3VuxaUgUBATMDZKm5o7qaQeJD7c1bfjH1+w1/wy+O0PBOYKSwQh2Yl7g6ZlHD6HE9dbTctlXVL4kpxFXnLn2Q+nXPZayXCl0+rt3mE06yDHMHTgT1JACh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231404; c=relaxed/simple;
	bh=t/VbWOGpbuI5Jv7jw59oaC4yhq7zyiTdRO2GbexmICw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cv9Rw/iv6goT66p7QSHN+3+frbnBKCPdcGGLX3znCi0maqLrRPHYgOBwLMfH2gZ5gvTG8i6GCR/pUW4QSZVoYD8fqG6/+2Pqt5fBwTRrrN/kPfgn//uaa03kss1914ZatiYGjZ4wU6hnO0Fe89LMVLjz/06QiEEGVgOjy4g4GeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RduRE3G/; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffb0bbe9c8so63630281fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733231401; x=1733836201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBpVYUR537Z/UcSm2SUw7xuU7Lh2NWpzO6bN06e40uU=;
        b=RduRE3G/kp84ouq69NT/ran2HMgxYdBMfpWtRS/OYeqczgJ5WVrzLv3bDqrbND087V
         Jd+z7oXh07LpTKDHpDOaKzTZp4ZNxOCt2/FTCe/0u6plYrpHGBgVpHp3SaWUMD69dU04
         LAsjFpzvdz/piB+nPIkqpu44TL7EOdFVR2GGcEKy3mpfeKRHPF/Lm470iVO3vYdK2hon
         eH29MY8oVZwZ82HgFFzuT/Z4o/jdfUFDpPY7LTEcsEFOE686nOH8jlre8AKxEQBzIfkp
         9OV9h3bqbMr3GSKOudr7OSXkuXVam99uQsREZMjI8F76JJOVQoFfUo8e62D2/nJi9rTN
         IgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231401; x=1733836201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBpVYUR537Z/UcSm2SUw7xuU7Lh2NWpzO6bN06e40uU=;
        b=M0kH+42b+WvSBrkGgfb1fHZA8cwSXYPHnZJzKQqxAnnudiJNqxOHVWRwzblYwIG7y8
         tNUfrtXCcc9aHEjx/olxzG8gR3o82TgmX066e8pYgLIDPvnhIiGIXNMb47ziPzGHtV9O
         72FFMts8kTXxrXzfCX5rCf0AcrTlKxSsqTLl8ENRexBSra+BYt7bvVVF6giV2g7WdTvD
         5/oiTMgW0e3quw6eva4ZXgdsAsTlqZd94xza9nTTVBzBuvl0qzVx/bIMwJ1wBjEN+e4N
         +kCtDAgxi1kEzaUdnsKtzGC35hYxjwIEQXEqybjdOMa72kk2dtNunaswVG/Ou/H5Pgm5
         Y8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8XMBk83hys3ozF/VeF5q72LWWvsUT7zUt8uX8LFcJoGMt/YXqEU5jT1iM3tWUwKJzz8ao/fUKJ+T9vHSe@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDL1/XVXYVJ1T9EPM67gUPyGJRM2ySeq+Hgy45c+fkdOqtadv
	kJIBi4CAcBlzn+eaNfxGNu8/z63lFSQJW0ul/LLih32p+2jVWHLy
X-Gm-Gg: ASbGncuUgc7CcNATG8X8u/Q19kog+mdgAI0NeLA3aE7r3iq+kHtOa4PowYAmvRAA0Mq
	RQ/DjvESDvienWM/4q9zMLo45T9YXrrgk9OfvlV0IRdPtrLkcPPJO5n89Kyif4a7UNCvrBC5xS0
	Ncy4r5zSnS6RhdPlQyeYLikYPBxUdoBhty98zgfJOc3wCq1fL6AXH8J6MoXqo0SegWIsdMGgwSP
	Il0gXw4zh51x6D87+D9j7qNlJv9i2wwsQs086VlvP4+wfZ42HYfVWlRxFYC7N8=
X-Google-Smtp-Source: AGHT+IE44eehjh4J99/+1OuXnz12zNWYEYZrb0qp3hsM6WiSlfMd9BI6rWO85gTg6shNHsRsITMGNA==
X-Received: by 2002:a2e:bc07:0:b0:2ff:ce85:8c97 with SMTP id 38308e7fff4ca-30009c6cdfdmr17644481fa.27.1733231400727;
        Tue, 03 Dec 2024 05:10:00 -0800 (PST)
Received: from [192.168.50.169] ([195.136.68.87])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30014797f5csm285571fa.91.2024.12.03.05.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:10:00 -0800 (PST)
Message-ID: <b63d73ce-0845-4c0b-a110-4e10b8f587eb@gmail.com>
Date: Tue, 3 Dec 2024 14:09:59 +0100
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
Content-Language: en-US
From: Danylo <danylo.piliaiev@gmail.com>
In-Reply-To: <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




On 12/3/24 13:52, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
>> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
>> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
> Could you please spend more words, describing what it is and why is it
> necessary for those extensions. For a5xx+ it looks like some kind of an
> internal address (what kind of?). For a4xx I'm completely lost.
Yes, my bad. On at least a6xx+, shader could read 64b ALWAYSON counter
from UCHE_TRAP_BASE+0 address. We use it to implement VK_KHR_shader_clock:
  "This extension advertises the SPIR-V ShaderClockKHR capability for 
Vulkan, which
   allows a shader to query a real-time or monotonically incrementing 
counter at
   the subgroup level or across the device level."
And there is no other proper way to get such counter. Same with 
GL_ARB_shader_clock.

Not sure what's there on older gens, I exposed the value on them for the
completeness sake. But I don't know whether it is desired or not (I 
don't expect
the value being read and used on a4xx/a5xx in Mesa).

>> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>   include/uapi/drm/msm_drm.h              |  1 +
>>   6 files changed, 23 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> index 50c490b492f0..f1b18a6663f7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>>   		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>>   
>>   	/* Disable L2 bypass to avoid UCHE out of bounds errors */
>> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
>> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
>> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>   
>>   	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>>   			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
>> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>>   	if (ret)
>>   		goto fail;
>>   
>> +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
>> +
>>   	if (!gpu->aspace) {
>>   		/* TODO we think it is possible to configure the GPU to
>>   		 * restrict access to VRAM carveout.  But the required
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index ee89db72e36e..caf2c0a7a29f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>>   	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>>   
>>   	/* Disable L2 bypass in the UCHE */
>> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
>> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
>> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
>> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
>> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>   
>>   	/* Set the GMEM VA range (0 to gpu->gmem) */
>>   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>   	adreno_gpu->ubwc_config.macrotile_mode = 0;
>>   	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>>   
>> +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>> +
>>   	return gpu;
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 019610341df1..0ae29a7c8a4d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>>   
>>   	/* Disable L2 bypass in the UCHE */
>>   	if (adreno_is_a7xx(adreno_gpu)) {
>> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>>   	} else {
>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
>> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>>   	}
>>   
>>   	if (!(adreno_is_a650_family(adreno_gpu) ||
>> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>   		}
>>   	}
>>   
>> +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
>> +
>>   	if (gpu->aspace)
>>   		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>>   				a6xx_fault_handler);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 076be0473eb5..774ff6eacb9f 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>>   	case MSM_PARAM_MACROTILE_MODE:
>>   		*value = adreno_gpu->ubwc_config.macrotile_mode;
>>   		return 0;
>> +	case MSM_PARAM_UCHE_TRAP_BASE:
>> +		*value = adreno_gpu->uche_trap_base;
>> +		return 0;
>>   	default:
>>   		DBG("%s: invalid param: %u", gpu->name, param);
>>   		return -EINVAL;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index e71f420f8b3a..9bd38dda4308 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -253,6 +253,8 @@ struct adreno_gpu {
>>   	bool gmu_is_wrapper;
>>   
>>   	bool has_ray_tracing;
>> +
>> +	u64 uche_trap_base;
>>   };
>>   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>>   
>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>> index b916aab80dde..2342cb90857e 100644
>> --- a/include/uapi/drm/msm_drm.h
>> +++ b/include/uapi/drm/msm_drm.h
>> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>>   #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>>   #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>>   #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>>   
>>   /* For backwards compat.  The original support for preemption was based on
>>    * a single ring per priority level so # of priority levels equals the #
>> -- 
>> 2.46.2
>>


