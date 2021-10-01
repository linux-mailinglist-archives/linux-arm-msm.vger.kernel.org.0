Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8110541F33F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355325AbhJARk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355324AbhJARk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:40:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56980C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:39:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z24so41708935lfu.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IVvmXkzdqqsJWfRDKp2pUYxJw8/s8UhPi23VBkP7rL4=;
        b=qjyN0JeTZaYzcZm+GsbyZAErQn/QN7K5eRXnL9i14K78hbRbfNsj4jehrpylyDZOEt
         ML2qwvnpe9kjQmuDHXD0ZIHjdwpVITI3r53x0GcBdF5nKRS3+bwRJKP1qPSx/EJMx/S6
         qiZUMvHwtNR4sX96Y/PuMlI8l9aLqAxoy6mvd+p4xgTql64XPzelLPTQ43m2qBH6jEVa
         vgCGweRKW1eLuqvb4HQ7q177WAsG8MGy9h7DAZF20+wtrqDEw6DxinuIDhFMNTn4HSY2
         QARq16xPzAQpzYi2g7XbAjrJeofzIeYvZXP7ymRZNHI25PoAbrrUwzsLeXoXm5V9sk+7
         gzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IVvmXkzdqqsJWfRDKp2pUYxJw8/s8UhPi23VBkP7rL4=;
        b=3fA1SBkurUZc+slP/pqjdO8HiXax5gOIGLKAu8Pp6RlWdbj0WE6KvQCB0X4ElpbAeo
         jI4T2Beu2rnaFNc1otZfcaOv8fIQXpNEEpefDBoFrJfWbI/yVigVNFhWure6Vfv1gkbY
         2YhIZjba6JC+PrYML8FcFC0o/unCTG6Td3RsjzN0K4MhLVWXuIsAm/7hZcuDizGSIaAy
         ZYDKJFZDTwDV29wNcx9ZAImCdGGkWOWXiYGhjffF+eCiPawEAZ8Q65WTh03mSTx+OtGc
         mIfy4GqKTPQxUGpfJVIuzfH/Aw0CyfFgRVN+7pFZSNrYYEIcTtmetvD1iPnoSCZR6PYz
         0uLA==
X-Gm-Message-State: AOAM532ap7uxtfbz9milvA1M0CxPrdUatUO/43WXdx3WQcPbEkeel9ew
        UQnKZc1m2f3Bjn3Kq1RZqdGOdA==
X-Google-Smtp-Source: ABdhPJx4XpQy1mMQ0K9hKr5qfEu03Pkz/GHI4xDpzxTeCLm2R2rV769qz71GDdVnwuWZKCnP03TFZg==
X-Received: by 2002:a2e:5806:: with SMTP id m6mr13283109ljb.162.1633109949453;
        Fri, 01 Oct 2021 10:39:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d9sm799148lfl.175.2021.10.01.10.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 10:39:08 -0700 (PDT)
Subject: Re: [RFC] drm/msm/a6xx: Serialize GMU communication
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210927180345.878859-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <9b3a8067-79d6-e4c2-8025-96f2ebe7fd6a@linaro.org>
Date:   Fri, 1 Oct 2021 20:39:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210927180345.878859-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2021 21:03, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> I've seen some crashes in our crash reporting that *look* like multiple
> threads stomping on each other while communicating with GMU.  So wrap
> all those paths in a lock.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Are we allowed to use c99/gnu99 yet?
> 
>   drivers/gpu/drm/msm/Makefile          |  2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  6 ++++
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  9 +++++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 50 ++++++++++++++++++++-------
>   4 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 904535eda0c4..57283bbad3f0 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -ccflags-y := -I $(srctree)/$(src)
> +ccflags-y := -I $(srctree)/$(src) -std=gnu99
>   ccflags-y += -I $(srctree)/$(src)/disp/dpu1
>   ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
>   ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index a7c58018959f..8b73f70766a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -296,6 +296,8 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   	u32 val;
>   	int request, ack;
>   
> +	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> +
>   	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
>   		return -EINVAL;
>   
> @@ -337,6 +339,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   {
>   	int bit;
>   
> +	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> +
>   	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
>   		return;
>   
> @@ -1482,6 +1486,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   	if (!pdev)
>   		return -ENODEV;
>   
> +	mutex_init(&gmu->lock);
> +
>   	gmu->dev = &pdev->dev;
>   
>   	of_dma_configure(gmu->dev, node, true);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 3c74f64e3126..f05a00c0afd0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -44,6 +44,9 @@ struct a6xx_gmu_bo {
>   struct a6xx_gmu {
>   	struct device *dev;
>   
> +	/* For serializing communication with the GMU: */
> +	struct mutex lock;
> +
>   	struct msm_gem_address_space *aspace;
>   
>   	void * __iomem mmio;
> @@ -88,6 +91,12 @@ struct a6xx_gmu {
>   	bool legacy; /* a618 or a630 */
>   };
>   
> +/* Helper macro for serializing GMU access: */
> +#define with_gmu_lock(gmu) \
> +	for (bool done = ({ mutex_lock(&(gmu)->lock); false; }); \
> +		!done; \
> +		done = ({ mutex_unlock(&(gmu)->lock); true; }))

The intent is good, but I'm not sure this kind of syntax sugar would be 
a good approach. What about calling lock/unlock explicitly, like we 
typically do? Then we won't have to use c99.

> +
>   static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>   {
>   	return msm_readl(gmu->mmio + (offset << 2));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index f6a4dbef796b..5e1ae3df42ba 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -881,7 +881,7 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>   	  A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
>   	  A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR)
>   
> -static int a6xx_hw_init(struct msm_gpu *gpu)
> +static int hw_init(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -1135,6 +1135,19 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	return ret;
>   }
>   
> +static int a6xx_hw_init(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	int ret;
> +
> +	with_gmu_lock(&a6xx_gpu->gmu) {
> +		ret = hw_init(gpu);
> +	}
> +
> +	return ret;
> +}
> +
>   static void a6xx_dump(struct msm_gpu *gpu)
>   {
>   	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
> @@ -1509,7 +1522,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>   
>   	trace_msm_gpu_resume(0);
>   
> -	ret = a6xx_gmu_resume(a6xx_gpu);
> +	with_gmu_lock(&a6xx_gpu->gmu) {
> +		ret = a6xx_gmu_resume(a6xx_gpu);
> +	}
>   	if (ret)
>   		return ret;
>   
> @@ -1532,7 +1547,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   
>   	msm_devfreq_suspend(gpu);
>   
> -	ret = a6xx_gmu_stop(a6xx_gpu);
> +	with_gmu_lock(&a6xx_gpu->gmu) {
> +		ret = a6xx_gmu_stop(a6xx_gpu);
> +	}
>   	if (ret)
>   		return ret;
>   
> @@ -1547,18 +1564,17 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	static DEFINE_MUTEX(perfcounter_oob);
>   
> -	mutex_lock(&perfcounter_oob);
> +	with_gmu_lock(&a6xx_gpu->gmu) {
> +		/* Force the GPU power on so we can read this register */
> +		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>   
> -	/* Force the GPU power on so we can read this register */
> -	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> +				    REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
>   
> -	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> -		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
> +		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> +	}
>   
> -	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> -	mutex_unlock(&perfcounter_oob);
>   	return 0;
>   }
>   
> @@ -1622,6 +1638,16 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>   	return (unsigned long)busy_time;
>   }
>   
> +void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	with_gmu_lock(&a6xx_gpu->gmu) {
> +		a6xx_gmu_set_freq(gpu, opp);
> +	}
> +}
> +
>   static struct msm_gem_address_space *
>   a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>   {
> @@ -1766,7 +1792,7 @@ static const struct adreno_gpu_funcs funcs = {
>   #endif
>   		.gpu_busy = a6xx_gpu_busy,
>   		.gpu_get_freq = a6xx_gmu_get_freq,
> -		.gpu_set_freq = a6xx_gmu_set_freq,
> +		.gpu_set_freq = a6xx_gpu_set_freq,
>   #if defined(CONFIG_DRM_MSM_GPU_STATE)
>   		.gpu_state_get = a6xx_gpu_state_get,
>   		.gpu_state_put = a6xx_gpu_state_put,
> 


-- 
With best wishes
Dmitry
