Return-Path: <linux-arm-msm+bounces-40073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57B9E1D5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E7BDB2AE0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 12:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20C31EBFE4;
	Tue,  3 Dec 2024 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvoTiBZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB541EBA04
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230384; cv=none; b=eJVc2auUcWlKyvVepJ/YABM8kKz40TNDzJQrVI/3dtbiPV0vTJhtYjNkvQmpfmxxyF8ffzzx8Vjj+GaEr/iWpLk1WjsWMiJJK2xfajH5oKz8ni5YhdQyla6lTFmGGSYIofj6bd05tiTJI9Yi2vaFvAyOOnjN6Cr9mNNTLqvRwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230384; c=relaxed/simple;
	bh=lhmbSI69R0BUgtQUAs/Zz2F+6BHIrRK0q9of+q2iZ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/zBS2h47gr1VjvwmojC5N6aAStQaLSLxaEu+u18G6xDgau+YsEd5F0/XLhgYFEewQTeuWNPzyH9OachcMGtW23iKi3xJb7sYegFyGC/U62RRb8HPqiJCnE0o8WM74AbBF/xeDb4wombV+6mzzgAlDP1vqx1MnQUF5R5KCp7qy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvoTiBZz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffdf564190so63943231fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733230381; x=1733835181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cgOp9XciNPobuDZogrWrTiS66ohIUz+olcA2lkcJj8w=;
        b=RvoTiBZzXxUPKjibBvy0Dqi8SG5GwrTnp4nf5W1mydXi3UqmaE6ZI1bprDh4Y7FcHR
         58qYASQsz25JQXOwwp5kh0gHc4ACUxBAQhZ6AT4yDFvTc9BUifFFjFuWVwuI7njLHGVJ
         jW/QSWVBHTbEBFsIb2d7uvXizRX3hWWdufKdqQaGnlKTsPseclUH9Tmwa/G9b/XJnXVr
         woLB6V8nA+f84m8zFzORGmYNnyfz8ChUnSBUEBTyzdhwWcLqnNPuUh/uc/HkrNfbRQhb
         YNGzfNk1YwHexwdu3ooyNTVlcAk499lYQ52n3gd6Crcx0IS0MP5425rjjo7CJPEQnJN9
         T3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733230381; x=1733835181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgOp9XciNPobuDZogrWrTiS66ohIUz+olcA2lkcJj8w=;
        b=MjAFNm67DFcwd7XuINiu7ewaRGEgAv3MuXcwXeRt2gm88Dg984dQ0+7lPaAgLHaijZ
         k/E+MwXZsN8vaPukAqhkClzmxEgNBhWZt9N/asT0K8VgKgDklXcFWfU7Y5igCfCCvpgT
         O+plufiq9XIhrqI3ps61OyXH/yCncOf2IlmSx+HohRS8gbBH73mOGRlbi5Y5GP0sGkPx
         llDSaEggjs869BRkzfWp3dl0O9kNqq3avhxLf17V4ggJTwLdiqbwGvO/vSNn8c1NcOPB
         eatjMqCY8SeNJIIlRMI3QXnn+xJnbd6O8ENZmMBAIy8/iwI8YznER1Ke9Xhf6LOLJvCB
         QZOA==
X-Forwarded-Encrypted: i=1; AJvYcCW2J3ppcbfqC24+QPDTGXMcyaUc4fJm1noKeJtymaO+rxyWsfxy0ISpNlOei0ze2LVAAgliGiq03I37vFEy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo77YrGOGFI3ANiXrsyy8XNsExwtTZZH3hfpjex9mkp0WpvW3Z
	MYObENXuJ3tVfc/ZH6UQjs9Rcp6VZSZvIS5/Ctb3owlIxpmqd+m/B82pZdscZXRcwUtcplCb8DL
	Z
X-Gm-Gg: ASbGncsrBXGrGRGqYj+FF7pgAZ5qq2grcDxuhX9gQ2tH4vqr7uH8/ff0MHM1yzlvsSS
	ugu0uA+Wk5Pha6ps7f04lt3v/Ez7kOxCkcOK9XdlPMVUMkFUPHeHGolslHum2S1EHOSpAnm7ofC
	UESj6YEuhaT0hsIWOMZSclNDxSZNZEfKZ8PLy75lL1lIGc6b8zLKM6cGSVFvHdOzVRsrKThJr6U
	+EZoswhGN5HpEeQDjufH0SLKfneVln/DUQwGujKz+DvOCzyd9UNUkusfHphF1xGAyF0VqNEYUJd
	EuFDDXufLIz4GvAsqWUXNZLIiPoCOA==
X-Google-Smtp-Source: AGHT+IEpNqcECccRh4l7n5a+xTcPnLC8zwWnHNryhKJgbaE6P1ez0VKjp2pUHX9jWAZQKmTS2jZ21g==
X-Received: by 2002:a05:651c:2204:b0:2ff:b7ff:53b1 with SMTP id 38308e7fff4ca-30009caa37cmr15651031fa.25.1733230381206;
        Tue, 03 Dec 2024 04:53:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-300142fffaasm330231fa.10.2024.12.03.04.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:52:59 -0800 (PST)
Date: Tue, 3 Dec 2024 14:52:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203095920.505018-2-dpiliaiev@igalia.com>

On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.

Could you please spend more words, describing what it is and why is it
necessary for those extensions. For a5xx+ it looks like some kind of an
internal address (what kind of?). For a4xx I'm completely lost.

> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 50c490b492f0..f1b18a6663f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>  
>  	/* Disable L2 bypass to avoid UCHE out of bounds errors */
> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>  
>  	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>  			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  	if (ret)
>  		goto fail;
>  
> +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
> +
>  	if (!gpu->aspace) {
>  		/* TODO we think it is possible to configure the GPU to
>  		 * restrict access to VRAM carveout.  But the required
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ee89db72e36e..caf2c0a7a29f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>  
>  	/* Disable L2 bypass in the UCHE */
> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>  
>  	/* Set the GMEM VA range (0 to gpu->gmem) */
>  	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->ubwc_config.macrotile_mode = 0;
>  	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>  
> +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
> +
>  	return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..0ae29a7c8a4d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	/* Disable L2 bypass in the UCHE */
>  	if (adreno_is_a7xx(adreno_gpu)) {
> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>  	} else {
> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>  	}
>  
>  	if (!(adreno_is_a650_family(adreno_gpu) ||
> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		}
>  	}
>  
> +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
> +
>  	if (gpu->aspace)
>  		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>  				a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 076be0473eb5..774ff6eacb9f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  	case MSM_PARAM_MACROTILE_MODE:
>  		*value = adreno_gpu->ubwc_config.macrotile_mode;
>  		return 0;
> +	case MSM_PARAM_UCHE_TRAP_BASE:
> +		*value = adreno_gpu->uche_trap_base;
> +		return 0;
>  	default:
>  		DBG("%s: invalid param: %u", gpu->name, param);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71f420f8b3a..9bd38dda4308 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -253,6 +253,8 @@ struct adreno_gpu {
>  	bool gmu_is_wrapper;
>  
>  	bool has_ray_tracing;
> +
> +	u64 uche_trap_base;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>  
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index b916aab80dde..2342cb90857e 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>  
>  /* For backwards compat.  The original support for preemption was based on
>   * a single ring per priority level so # of priority levels equals the #
> -- 
> 2.46.2
> 

-- 
With best wishes
Dmitry

