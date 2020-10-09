Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF1228913B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 20:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732724AbgJIShP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 14:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730130AbgJISgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 14:36:42 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63246C0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 11:36:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b19so4870185pld.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 11:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RXaGCdzadhTSxJ90I/Q7ZO/dbk1lXiLeLP1YwXiDqbc=;
        b=i2SNn6sNaeePDINrDzF4Un/NDOxiB/WDjhMRR7QYro6nFfGDoYlgKzGa8iPs4M7m8b
         l/EdsCwFS7iNoU+1E5p429Nek58Q2uxCYySkwzwFS13mkgGopfmG7U/C3eZyPcnNVc4f
         QzdpUiLdxijdg8o32oY/xuVkpM01gyTBN0X5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RXaGCdzadhTSxJ90I/Q7ZO/dbk1lXiLeLP1YwXiDqbc=;
        b=tZsAlbRwuapGa4WhKR8gR8dN67pSeaeRYo7xgHkA56w4NK78vn2sqfKBmmS0I+GzK0
         +45S43mkcRWISDqcA+OIbaVnHCdOUNBboANPdByX3x3CSHVugzmO8ayz4TLhELsecO5U
         EzPdt7BRiHnpCkQp7OJf3vJ74U1R27q/z2HToRJBObkhWNKUr9eYcL2mLi3EteaXY++x
         Ux9t0XE4UmTWPzjIuMPkh0fPf1xkFWZQhKc/8gXuh4mm9mjJJJtSUiqQNmjvXkS7eqmY
         XhkRv/gGAWzUdPD/PbEeoDSrN2VbR2zwy+e6wfU81/EsuZ90enzsBXg5uK3RLMNk5UwH
         sG9g==
X-Gm-Message-State: AOAM532iRVQXf0jR12XiD1xkHFFPNBXiKMDaCCLf0MRA/U80JHoRMF4q
        bzR5WBRCSPqnW8+nOcp6Kj6vFQ==
X-Google-Smtp-Source: ABdhPJwDW/lNdv+r3y/iNReVvFRv6ckaeyTfiWYvv2Vr4ysFwwuvuddVKMCxbkvFjq8v7CAlF3fLxQ==
X-Received: by 2002:a17:902:7687:b029:d2:8d1f:1079 with SMTP id m7-20020a1709027687b02900d28d1f1079mr13523250pll.2.1602268601939;
        Fri, 09 Oct 2020 11:36:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id bj17sm12423393pjb.15.2020.10.09.11.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 11:36:41 -0700 (PDT)
Date:   Fri, 9 Oct 2020 11:36:40 -0700
From:   mka@chromium.org
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, robh@kernel.org,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
Message-ID: <20201009183640.GB1292413@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akhil,

On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> Register GPU as a devfreq cooling device so that it can be passively
> cooled by the thermal framework.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h |  2 ++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 55d1648..93ffd66 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -14,6 +14,7 @@
>  #include <generated/utsrelease.h>
>  #include <linux/string_helpers.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
>  
> @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>  	if (IS_ERR(gpu->devfreq.devfreq)) {
>  		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
>  		gpu->devfreq.devfreq = NULL;
> +		return;
>  	}
>  
>  	devfreq_suspend_device(gpu->devfreq.devfreq);
> +
> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> +			gpu->devfreq.devfreq);
> +	if (IS_ERR(gpu->cooling)) {
> +		DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Couldn't register GPU cooling device\n");
> +		gpu->cooling = NULL;
> +	}
>  }
>  
>  static int enable_pwrrail(struct msm_gpu *gpu)
> @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	msm_devfreq_init(gpu);
>  
> -
>  	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
>  
>  	if (gpu->aspace == NULL)
> @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>  		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
>  		msm_gem_address_space_put(gpu->aspace);
>  	}
> +
> +	devfreq_cooling_unregister(gpu->cooling);

Resources should be released in reverse order, otherwise the cooling device
could use resources that have already been freed.
