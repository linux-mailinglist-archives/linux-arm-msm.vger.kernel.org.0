Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E4F2586F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 06:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgIAEcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 00:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgIAEcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 00:32:16 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC948C061290
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 21:32:15 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 37so54819oto.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 21:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6R0w32dHRH3+SBeVCMfaRe9dqTNsO2sbD8FOePJ7bRI=;
        b=AQ0Ns747XkOOSF/pd838/AQpkaJww0p9SS2YjA33J96ISeP2BQtVSiqecu5E3fvFe6
         Jb58fivxjJHf+vH0Ytps7p6nor87tlxqOxWKGlUKnALfAkv7/r9qpZe0d9zEbpiL0ijc
         ob1gXiK9CozRDgRc0KTnEulqVZdBVD02F+XjqcWym5X8oKW8qJ/qw1e1TAPL8MJDYub8
         IrAzvOs4a5YlTtlfjLy0thUuI+lnVJXJOe+9cIksq0Qwc0K+z7OoOdd9rHD7fFBPVzAH
         lgg74fkpms7c5PJ5C3myeiIOMFOK1RraZl1knC8Kam1yHGtxatpTePXQlvsC7vw7m6Ci
         XfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6R0w32dHRH3+SBeVCMfaRe9dqTNsO2sbD8FOePJ7bRI=;
        b=s8OB7FT0HsQyQnVPC3/zAaSS+WFuNZuqaUIM86lc0Sbw4DadGafGgfOXcObHZ9giRP
         NLQn6DQW2bwSOE/9cJYtsaadCkfCz8woRk+crEavSpdnLjEzacvu8UNSa10wGd7yQVkw
         PeLpLuSrnMFA/YOhq89CmxcidzxDmUNT9WJwzxvX27xi21CKcwrkhBhy07h/+3ysfqvS
         ntIbtP95DbsckVOlfkcvCbrfWP61SSzLFn9li6JRVlEZIaOgmYovfR5evSE/MJYXy0lr
         9c91KxgrFTfl/SafQp2OZmop4/5bAl5spX6zt1vjWoGzhEWgAttmFd44x1+gZSlYHZ3e
         DYHg==
X-Gm-Message-State: AOAM532O9cqa5zyuFaZCWAUX+TlegbEU0ADkVaLoI2Kc4tSfwgUKf5iE
        dLR+AVW1Z1FtXhap+9XYdew6OQ==
X-Google-Smtp-Source: ABdhPJwme/u5M3h14OxrBdRlOBTBOLIg+gJr5HMqBioo8/D+h9xfhE4wPOwDoY7s+tBkKE8hH9+LtQ==
X-Received: by 2002:a9d:4695:: with SMTP id z21mr90592ote.91.1598934735028;
        Mon, 31 Aug 2020 21:32:15 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id e7sm2199948otj.28.2020.08.31.21.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 21:32:14 -0700 (PDT)
Date:   Mon, 31 Aug 2020 23:32:11 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/19] drm/msm/gpu: add dev_to_gpu() helper
Message-ID: <20200901043211.GN3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-7-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> In a later patch, the drvdata will not directly be 'struct msm_gpu *',
> so add a helper to reduce the churn.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
>  drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
>  drivers/gpu/drm/msm/msm_gpu.h              |  5 +++++
>  3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 9eeb46bf2a5d..26664e1b30c0 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -282,7 +282,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>  	int ret;
>  
>  	if (pdev)
> -		gpu = platform_get_drvdata(pdev);
> +		gpu = dev_to_gpu(&pdev->dev);
>  
>  	if (!gpu) {
>  		dev_err_once(dev->dev, "no GPU device was found\n");
> @@ -425,7 +425,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  static void adreno_unbind(struct device *dev, struct device *master,
>  		void *data)
>  {
> -	struct msm_gpu *gpu = dev_get_drvdata(dev);
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	pm_runtime_force_suspend(dev);
>  	gpu->funcs->destroy(gpu);
> @@ -490,16 +490,14 @@ static const struct of_device_id dt_match[] = {
>  #ifdef CONFIG_PM
>  static int adreno_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_gpu *gpu = platform_get_drvdata(pdev);
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	return gpu->funcs->pm_resume(gpu);
>  }
>  
>  static int adreno_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_gpu *gpu = platform_get_drvdata(pdev);
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	return gpu->funcs->pm_suspend(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d5645472b25d..6aa9e04e52e7 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -24,7 +24,7 @@
>  static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  		u32 flags)
>  {
> -	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  	struct dev_pm_opp *opp;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
> @@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  static int msm_devfreq_get_dev_status(struct device *dev,
>  		struct devfreq_dev_status *status)
>  {
> -	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  	ktime_t time;
>  
>  	if (gpu->funcs->gpu_get_freq)
> @@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
>  
>  static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
>  {
> -	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	if (gpu->funcs->gpu_get_freq)
>  		*freq = gpu->funcs->gpu_get_freq(gpu);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0db117a7339b..8bda7beaed4b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -141,6 +141,11 @@ struct msm_gpu {
>  	struct msm_gpu_state *crashstate;
>  };
>  
> +static inline struct msm_gpu *dev_to_gpu(struct device *dev)

That's a fairly generic name for a driver-global helper :)

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +{
> +	return dev_get_drvdata(dev);
> +}
> +
>  /* It turns out that all targets use the same ringbuffer size */
>  #define MSM_GPU_RINGBUFFER_SZ SZ_32K
>  #define MSM_GPU_RINGBUFFER_BLKSIZE 32
> -- 
> 2.26.2
> 
