Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E53486DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245478AbiAFXZB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245457AbiAFXZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:25:01 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E559C061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:25:01 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id b1-20020a4a8101000000b002c659ab1342so1055046oog.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YT91JSmjzJ2hfMRgmVGOHVorjfPKR1pnZsxBO5R/GuI=;
        b=D/2AfUta7+flczHy8ibrXSRE5JZwr1mvaDAm0fn6GyepCsgG/s0a25xiiu8Bs1JPsW
         EV4tRZIEE8yPe/4ReG4UssI53IzIFhO4hBIpP3vqlVkRFrGA1q9NMhl3GedN8/IdYJiH
         O01JgwzEhicYXwzzPCsaY8WyvhE0Gta03dtVTlZpyoIe66Cwwbku0vvfxlf43li7OY4G
         PRhovW1OJLNVoNy6ngs6xb5Yf6BjeeF2nYrbpbKW8OUsv0pjzqItxGItlHP1vj//7SLN
         l4YtUMm4YTsggUax4nX8OZaWRA3zZN8HSEbQxfB7AmMAEde3HTegsxkdpCokgVtbX35L
         OceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YT91JSmjzJ2hfMRgmVGOHVorjfPKR1pnZsxBO5R/GuI=;
        b=kNZErI6XstvFbqcwCESVdaqD3PSVn6ug+CHVQFep/MKmAfP3V+We3GQqrUQOJseJU3
         DG37Aha9uoyNynW0fMINLdcJlofbLAGd0Dqj0P+VH6uEmcMgJ6QeQeeIxC8sCYWLpDAJ
         0ZcUSA12imVzgKKvI48cFN4du+NlLc3u67d11poz5fwNxQDIDw6yfO6VPaG4f6pJqZYy
         Ag65xatJw0Qc4OJa4ja66OwV6LgNTxZVGKg4SNzSevgAMsRtJSvCkZiL1xLxaO2qKCUA
         0+G7xkvw8kAy89n+/rSvBoetneNlhsjp0NSV2CZQgenycIPs21bDFhHFbv3FFJ9w4TvH
         tvjQ==
X-Gm-Message-State: AOAM532vgswmhhmDCDe63/w52NmnJAZNHatPFEvPhXs1++mE33FF+Iu9
        egl3PRfpI8BK3gDAVH+z8K67Ng==
X-Google-Smtp-Source: ABdhPJx4FLN2qFyGyHmApIrjJ+Hi7f0aIkSdtjulk3KuErND+7d/W8dEBalySybtcEntfx775c97rw==
X-Received: by 2002:a4a:8746:: with SMTP id a6mr37663438ooi.93.1641511500390;
        Thu, 06 Jan 2022 15:25:00 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v5sm636158oic.11.2022.01.06.15.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:25:00 -0800 (PST)
Date:   Thu, 6 Jan 2022 15:25:49 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Wait for idle before suspending
Message-ID: <Ydd6fSI/fYDGveja@ripper>
References: <20220106181449.696988-1-robdclark@gmail.com>
 <20220106181449.696988-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106181449.696988-2-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Jan 10:14 PST 2022, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> System suspend uses pm_runtime_force_suspend(), which cheekily bypasses
> the runpm reference counts.  This doesn't actually work so well when the
> GPU is active.  So add a reasonable delay waiting for the GPU to become
> idle.
> 
> Alternatively we could just return -EBUSY in this case, but that has the
> disadvantage of causing system suspend to fail.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++++++
>  drivers/gpu/drm/msm/msm_gpu.c              | 3 +++
>  drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 93005839b5da..b677ca3fd75e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -611,6 +611,15 @@ static int adreno_resume(struct device *dev)
>  static int adreno_suspend(struct device *dev)
>  {
>  	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	int ret = 0;
> +
> +	ret = wait_event_timeout(gpu->retire_event,
> +				 !msm_gpu_active(gpu),
> +				 msecs_to_jiffies(1000));
> +	if (ret == 0) {
> +		dev_err(dev, "Timeout waiting for GPU to suspend\n");
> +		return -EBUSY;
> +	}
>  
>  	return gpu->funcs->pm_suspend(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 0f78c2615272..2c1049c0ea14 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -703,6 +703,8 @@ static void retire_submits(struct msm_gpu *gpu)
>  			}
>  		}
>  	}
> +
> +	wake_up_all(&gpu->retire_event);
>  }
>  
>  static void retire_worker(struct kthread_work *work)
> @@ -848,6 +850,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	INIT_LIST_HEAD(&gpu->active_list);
>  	mutex_init(&gpu->active_lock);
>  	mutex_init(&gpu->lock);
> +	init_waitqueue_head(&gpu->retire_event);
>  	kthread_init_work(&gpu->retire_work, retire_worker);
>  	kthread_init_work(&gpu->recover_work, recover_worker);
>  	kthread_init_work(&gpu->fault_work, fault_worker);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 445c6bfd4b6b..92aa1e9196c6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -230,6 +230,9 @@ struct msm_gpu {
>  	/* work for handling GPU recovery: */
>  	struct kthread_work recover_work;
>  
> +	/** retire_event: notified when submits are retired: */
> +	wait_queue_head_t retire_event;
> +
>  	/* work for handling active-list retiring: */
>  	struct kthread_work retire_work;
>  
> -- 
> 2.33.1
> 
