Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0733DAC6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 22:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhG2UG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 16:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhG2UG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 16:06:29 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2045C061765
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 13:06:24 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q3so8400956wrx.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=orEZU3YWRIPfL2Wlo/hgQ+Zfxy//ARMfeeEtYN2miI0=;
        b=PHWtzWLZg/vbTbQwYSj9IVbigjXSpJz3+iGNDaCdmA37AA6pP3syQ3E8yVXt68ROkE
         aT8+vP0/8KJmJ+4k5mVW5KoISPAQt9mYRbmKPV9ZkUbbM0dhbjYoNZwScDKdjbQvCIs1
         u37eDD4NLuI4LW8LS3TdsbbTETZ74+2me2IW0GFUfBzNk14ESFTjmUYxIEJ9wOf5JXE/
         d1NT82q8XGYdqq2g32qHQYqT5v36KZ9EOcQ5EaDX6RTwSw5f6SScBQjmgykMu9H3lbJM
         u/W7EFBHVtA2SVbYeGLgx+qczGGs+ePR2CUAj+6SwhW9R9mbyvxwPvNFJFgJ5bmm8ycV
         6Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=orEZU3YWRIPfL2Wlo/hgQ+Zfxy//ARMfeeEtYN2miI0=;
        b=EM/j6VKkT54BIQVOz4rEaix0Y9IcXAbu9eg6sStJT1kMcXZ12+8zGObhzvbT4ap5Hy
         75gFIehvOAqqWBFDgtWUL+3YvBd455s1sI/ErhzHb6o2Rvk6EZ8oiMMJasOkD5VT3pLw
         366cLgWqSUZTe0/WcW/vNr8GwEyPs+GLo2bhkkU2bFXenalR5jSqoX8gs0r9b4LVI4KH
         4cgTL+jCyXiK3peD9oX26V+3xijnsnQMF7xwOy6emUFYtPfNBaTTaqpnP9bt0xqA88Om
         6dmcQzPdV3UTj5tnWcRg7V585fQn6UECaCAynSZBOuODrjzj+UZ5SiLiVdx4zrcbEn1O
         BbTQ==
X-Gm-Message-State: AOAM5331eTWPuZ8KFte0cLHWkFrkQhmW/E9FCYhE2uKStaHnGyCchemw
        ofL9DZwg0QPNPtOk7RYWUfwayg==
X-Google-Smtp-Source: ABdhPJwz51aKsXX7yYtXDXB43ennBdi6yWs9BV+AnNUgLR/wq7FEawLfPiAsm7CvVooy4myXa977cg==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr6618159wrw.328.1627589183227;
        Thu, 29 Jul 2021 13:06:23 -0700 (PDT)
Received: from [192.168.1.12] (host-80-41-121-59.as13285.net. [80.41.121.59])
        by smtp.gmail.com with ESMTPSA id j13sm7796608wms.24.2021.07.29.13.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 13:06:22 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210729183942.2839925-1-robdclark@gmail.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
Date:   Thu, 29 Jul 2021 21:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729183942.2839925-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above 
the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more 
aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.

Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable 
at the higher frequencies.

Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in 
glxgear.

I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run 
at the voltage the hardware needs to be stable.

Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have 
CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?


On 29/07/2021 19:39, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The more frequent frequency transitions resulting from clamping freq to
> minimum when the GPU is idle seems to be causing some issue with the bus
> getting voted off when it should be on.  (An enable racing with an async
> disable?)  This might be a problem outside of the GPU, as I can't
> reproduce this on a618 which uses the same GMU fw and same mechanism to
> communicate with GMU to set opp.  For now, just revert to previous
> devfreq behavior on a630 until the issue is understood.
> 
> Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>   drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 12 ++++++++++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 748665232d29..9fd08b413010 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	pm_runtime_use_autosuspend(dev);
>   	pm_runtime_enable(dev);
>   
> +	if (adreno_is_a630(adreno_gpu))
> +		gpu->devfreq.disable_freq_clamping = true;
> +
>   	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>   			adreno_gpu->info->name, &adreno_gpu_config);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0e4b45bff2e6..7e11b667f939 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -112,6 +112,8 @@ struct msm_gpu_devfreq {
>   	 * it is inactive.
>   	 */
>   	unsigned long idle_freq;
> +
> +	bool disable_freq_clamping;
>   };
>   
>   struct msm_gpu {
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 0a1ee20296a2..a832af436251 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -94,6 +94,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
>   	if (!gpu->funcs->gpu_busy)
>   		return;
>   
> +	/* Revert to previous polling interval if we aren't using freq clamping
> +	 * to preserve previous behavior
> +	 */
> +	if (gpu->devfreq.disable_freq_clamping)
> +		msm_devfreq_profile.polling_ms = 10;
> +
>   	msm_devfreq_profile.initial_freq = gpu->fast_rate;
>   
>   	/*
> @@ -151,6 +157,9 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>   	unsigned int idle_time;
>   	unsigned long target_freq = df->idle_freq;
>   
> +	if (gpu->devfreq.disable_freq_clamping)
> +		return;
> +
>   	/*
>   	 * Hold devfreq lock to synchronize with get_dev_status()/
>   	 * target() callbacks
> @@ -186,6 +195,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   	unsigned long idle_freq, target_freq = 0;
>   
> +	if (gpu->devfreq.disable_freq_clamping)
> +		return;
> +
>   	/*
>   	 * Hold devfreq lock to synchronize with get_dev_status()/
>   	 * target() callbacks
> 

-- 
Kind Regards,
Caleb (they/them)
