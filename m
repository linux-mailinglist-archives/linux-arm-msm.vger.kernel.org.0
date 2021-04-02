Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F85352BFA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 18:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhDBOuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 10:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbhDBOuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 10:50:05 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0720C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 07:50:04 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id b10so5584009iot.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=l0HqcwAEcAzaa2RK+pZE6jtYY7XOgt5sS3E2spUn1Rk=;
        b=Kmgr8cnyHkBCjw6d098vCcVagqVkv5JmDU91epU9ZWO7suSGeKnYW7wRpQBgsU6Kbs
         bnC+FC9X9QMvN9rLnz4RSFfLGWy5STRsjKuf79o0DSdeBWwe22pySANiq314cu5fHMsT
         LwlwRpJetf/3zwEbAAVcYSDBorIDUqEzt963OIKC9cjeW1e5f/iuxmTORJJiwtFhByU/
         qDsDk4atEjJxiQaMqqmKjyBomzu8Vp1NXy0A/9nlO7/WGT9hnhIjfe1whBYjBBd6rWwk
         /m8hrKnQDZT8IrRWrCv5bP7k0gu0lNtpu2yRbt9WN2SqVKz1J5cqLkBPhE+aqq2HAojn
         OFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=l0HqcwAEcAzaa2RK+pZE6jtYY7XOgt5sS3E2spUn1Rk=;
        b=GSiM78EhWP0Ub41MFdPm/N5TUHn9KqrqnBm7lMHJ/qqmDaRbqkGvQaQwPiUfI7dJEP
         gmoLrW/+84AJJ/LxHoc94s1mzUQrRA06WxhguYXT5BpzDEgKSSUvwm3FSQR7EA5kAWKW
         pDWAhfOwmV4ebqIh00fTHp61e0cDsN6yGjr/iODNI073jFPRkuWywO2/PAHMTHmhREIg
         xOgumEmfAYscpmZ2lSaKqYjm3vzPDFWPxHyT9GA1wJAOUGndq6PD7OfUIVDObnKs3pv8
         Ss1/esF340432CbtWeaUd52zwV1/uCXOQ3n3jbkoJ+4Blb8YyqcDsszcYMqXxW+P5PcN
         aZhA==
X-Gm-Message-State: AOAM531XpOoGmNNcWhq4R9ZO0A2XFpYwpBAJvJkz7V3WQr3EP9YsVOIJ
        cHy3c2mKKepjea/U7mcgZGqB7A==
X-Google-Smtp-Source: ABdhPJyuvuBtNPl+yzzZ5Hm9a08vW6pett3RP0OPcCwvzWTKuV1JGe7ZTwSlG04ahbRO6oSo90Wecw==
X-Received: by 2002:a6b:e20a:: with SMTP id z10mr10979620ioc.99.1617375004119;
        Fri, 02 Apr 2021 07:50:04 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id y15sm3987161ilv.70.2021.04.02.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 07:50:03 -0700 (PDT)
Date:   Fri, 2 Apr 2021 08:50:01 -0600
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Fix a5xx/a6xx timestamps
Message-ID: <20210402145001.n7upxwvyub2tyavz@cosmicpenguin.net>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>
References: <20210325012358.1759770-1-robdclark@gmail.com>
 <20210325012358.1759770-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325012358.1759770-2-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 24, 2021 at 06:23:52PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> They were reading a counter that was configured to ALWAYS_COUNT (ie.
> cycles that the GPU is doing something) rather than ALWAYS_ON.  This
> isn't the thing that userspace is looking for.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a5af223eaf50..bb82fcd9df81 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1241,8 +1241,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  
>  static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
> -	*value = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
> -		REG_A5XX_RBBM_PERFCTR_CP_0_HI);
> +	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
> +		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 130661898546..59718c304488 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1173,8 +1173,8 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  	/* Force the GPU power on so we can read this register */
>  	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>  
> -	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> -		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> +		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
>  
>  	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>  	return 0;
> -- 
> 2.29.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
