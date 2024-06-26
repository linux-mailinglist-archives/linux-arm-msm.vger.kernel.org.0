Return-Path: <linux-arm-msm+bounces-24233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBDC917A4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49347B23948
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 07:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E77015ECF1;
	Wed, 26 Jun 2024 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="LTiBrCW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA0614532F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388785; cv=none; b=V38/NACb+CerMQbK66XOuBkLrINt24SDli6wgimABNpJ3VHFX2LeCD5hRTzzeBJUDPKI8YZW+OLn1MtSyPrmoatjS7QV7MwGnPPaGihJe/cO4UQCxnC7sAXXWtqMWvl+nFwTN302TO++R5zFsiluIfZEmrVpTcxNBIEDjMz4Rxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388785; c=relaxed/simple;
	bh=UFcACGqxiuT8v7X+3Me/nx5E98iD5BFlwqaiy2cJxEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9Z8qtiK9xPyB7RgIVL+QUPt03tnXUPsmkPSZc0qGsus4DbQdAXAb+CvHMZDJOAF3Jssh6VSYaqt5LwJiZ0Y5Em781EEFQ3/nNZXhWoj7s8GwcpKEiJ/KYMXKZRitkjCAdmYq/V39sX9aHZqLc5u1k1tTPyQrOm2oFaGfP4v8Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=LTiBrCW+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42111cf2706so8086415e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719388782; x=1719993582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKC9JWwz9mDZFJPWKIzZ35FYqwpsv8ltyyUAlB5rNg4=;
        b=LTiBrCW+GXlJeS/TpkF5cRN7slPn+qwJo0SxZ22Fgw++VhfznTkxYXft4D6ZMOitql
         r0ahvzWLCSjEodG9cDqTRvL8AQm39GYDtKLnNk1P52WbC8GP2dSlji9nnO7nI7fC2/uH
         SFLcQOFWCEMQy7ZH01d4JoT7QJC3K/Hvn9lAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388782; x=1719993582;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKC9JWwz9mDZFJPWKIzZ35FYqwpsv8ltyyUAlB5rNg4=;
        b=QlHFMH1IBoO3vzfVhBXg37+34XHmns8T/+t8ycUYqAEzb0UhQMIutYlWeHu+3fnsLl
         iHIEJDoXFZZ9rq7TnUtQYm2TMfvmo+h/okrWLWf4Xd7NWJI+7mm5zfU4YpRYqLrHQ2P9
         nbXyB0nvQc4bxdYi0nfI1koaaWJjqbi8VM3/goGhHaRL62h+G50PjOWBUa4T4Z81PQL7
         v2O1ui8f2+z2anW2kz4YsaOqFlA98sXIPcR6R/54JeAwcOxpLDcDbh1DO7FqZY7eCCwa
         5OOaIWCtqEzUrjlBdF7Nxv7hV1DNzIvEjjjAuIzl3EhSe4HM/pGy82wiX3LOJUt88prH
         qnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGzlmCtHbfbE58Q1puvNZCgcFi1OMECxTYWD1QfvVVo9Mkuhk4eJgjMTiC17thq3wzN4TO4bMQX/1U/9QbKUzd9gY/olejy6TSrzJ4gw==
X-Gm-Message-State: AOJu0YyzZEKLoKfisKqwh/RFXNocXrjP3oO8e3E2/yyxT29Hh/Xy0KrT
	2jfchQ8dAtrmUWwcMoGWsZBrV4flEm0M5fpQWz5wV3EIEbypD6CBMXh/wYLq0Jg=
X-Google-Smtp-Source: AGHT+IG4EVOkrn1Y0XT/ql2oK40G3v2KP3e4L4gODD12bYa8V2Qg23ovSXufw0iA+4BOJcA67yWlig==
X-Received: by 2002:a5d:6d8f:0:b0:366:eb60:bcf2 with SMTP id ffacd0b85a97d-366eb60bd9amr6081538f8f.4.1719388781876;
        Wed, 26 Jun 2024 00:59:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9c158sm15120701f8f.56.2024.06.26.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:59:41 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:59:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
Message-ID: <ZnvKa29EceUyZ62U@phenom.ffwll.local>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Tue, Jun 25, 2024 at 08:54:41PM +0200, Konrad Dybcio wrote:
> Memory barriers help ensure instruction ordering, NOT time and order
> of actual write arrival at other observers (e.g. memory-mapped IP).
> On architectures employing weak memory ordering, the latter can be a
> giant pain point, and it has been as part of this driver.
> 
> Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> readl/writel, which include r/w (respectively) barriers.
> 
> Replace the barriers with a readback (or drop altogether where possible)
> that ensures the previous writes have exited the write buffer (as the CPU
> must flush the write to the register it's trying to read back).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Some in pci these readbacks are actually part of the spec and called
posting reads. I'd very much recommend drivers create a small wrapper
function for these cases with a void return value, because it makes the
code so much more legible and easier to understand.
-Sima

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0e3dfd4c2bc8..09d640165b18 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -466,9 +466,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
> -	/* Wait for the register to finish posting */
> -	wmb();
> +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
>  		val & (1 << 1), 100, 10000);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c98cdb1e9326..4083d0cad782 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -855,14 +855,16 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Clear GBIF halt in case GX domain was not collapsed */
>  	if (adreno_is_a619_holi(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +		gpu_read(gpu, REG_A6XX_GBIF_HALT);
> +
>  		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
> -		/* Let's make extra sure that the GPU can access the memory.. */
> -		mb();
> +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
>  	} else if (a6xx_has_gbif(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +		gpu_read(gpu, REG_A6XX_GBIF_HALT);
> +
>  		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> -		/* Let's make extra sure that the GPU can access the memory.. */
> -		mb();
> +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
>  	}
>  
>  	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> 
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

