Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C057F3D7EEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 22:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhG0UL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 16:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbhG0UL4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 16:11:56 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A06C061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 13:11:55 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q2so240501ljq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y+K40mFFV/ei9G5K8b7BdAkN1qwtBpRi8uDtKqosQ18=;
        b=SnSX+bXTD7zMfAM9ndnjbj7EIUckOlEdKEjulAoasK6O5z5rDDWXHJcHnB/MnQW/eF
         frEQ3uH4T1b4H0Ix9lzIBtvCPQTxyYqNqMAClFCG9Yg/Ly4WCZ6/gATnQDR/d53pROE9
         WaFqBE1ZsISO79uymky+aLogjUtZDc94PPUlgLdWBepAhbommIZWwjQ/Q/Yue6FU5C0w
         D0baySJuB0sFQ3LrKEmorKWBTp0Xvtrebzg4dAE06mZnzGjFS+Qs3gcOPhlvUTFiyvAr
         Sg0vjHzJ9ESwf6xgTZNIyuXwIUBsbyYNG+DdRlcCDie4FdvsHzN+rttO7KH6Tdsc1jgL
         eicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+K40mFFV/ei9G5K8b7BdAkN1qwtBpRi8uDtKqosQ18=;
        b=c5PthGRyGNBGfmwNlrkP9+dNK2jdtjpWZMXlkqK44uyRXHkqjj9I/e2kqujKunQ2UT
         aPW/N8b6h0gfLYo/Vxdkl+dO6v7VTxhprQ8tlmIAkcrHxbmQat2NXKFuKoH3o1ahhMoD
         sWnESc4fsrbS0LBHgNNvxr3wBTB1j+B8m4XhKlNr5zKkyaOHqcZtFKsFzX7TYBB9MDgg
         McHpnbnmclmGdcqDlBCK9BUxZe5DYa26YaXjxyk42HhBPYjLt/vZzk/9CgfhDGFT6SoN
         Kw5vNaiyhNIomP14rixR7jDaWRLVF5ThrBaOgH6J0m75JXLyaecMx2zNBpvG2CkRL8XP
         SaJw==
X-Gm-Message-State: AOAM531AshZCKoIO6Mn1UYwwnt173CKwJMRJNOaR8gNq0aumnCpU1ZxA
        vBNw3a7B0cHZODioGHyee1aCbA==
X-Google-Smtp-Source: ABdhPJyS/Ff7CGi1er9V6ecbR8FKgsuSjzqzA7zO6o0yP12DYxkn7JCFiAZTsuDvwoycwrwWDny7gg==
X-Received: by 2002:a05:651c:211d:: with SMTP id a29mr16600876ljq.78.1627416714252;
        Tue, 27 Jul 2021 13:11:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a7sm376732lfr.203.2021.07.27.13.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 13:11:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] drm/msm: Split out get_freq() helper
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210726144653.2180096-1-robdclark@gmail.com>
 <20210726144653.2180096-3-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ba388984-3fb1-ae8c-1382-119847981ba8@linaro.org>
Date:   Tue, 27 Jul 2021 23:11:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726144653.2180096-3-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2021 17:46, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In the next patch, it grows a bit more, so lets not duplicate the logic
> in multiple places.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 3bcea0baddab..2e24a97be624 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -37,17 +37,21 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	return 0;
>   }
>   
> +static unsigned long get_freq(struct msm_gpu *gpu)
> +{
> +	if (gpu->funcs->gpu_get_freq)
> +		return gpu->funcs->gpu_get_freq(gpu);
> +
> +	return clk_get_rate(gpu->core_clk);
> +}
> +
>   static int msm_devfreq_get_dev_status(struct device *dev,
>   		struct devfreq_dev_status *status)
>   {
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	ktime_t time;
>   
> -	if (gpu->funcs->gpu_get_freq)
> -		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
> -	else
> -		status->current_frequency = clk_get_rate(gpu->core_clk);
> -
> +	status->current_frequency = get_freq(gpu);
>   	status->busy_time = gpu->funcs->gpu_busy(gpu);
>   
>   	time = ktime_get();
> @@ -59,12 +63,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
>   
>   static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
>   {
> -	struct msm_gpu *gpu = dev_to_gpu(dev);
> -
> -	if (gpu->funcs->gpu_get_freq)
> -		*freq = gpu->funcs->gpu_get_freq(gpu);
> -	else
> -		*freq = clk_get_rate(gpu->core_clk);
> +	*freq = get_freq(dev_to_gpu(dev));
>   
>   	return 0;
>   }
> 


-- 
With best wishes
Dmitry
