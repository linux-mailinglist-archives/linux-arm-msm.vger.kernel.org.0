Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB16258783
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 07:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgIAFfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 01:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgIAFfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 01:35:46 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F21DC061290
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:35:45 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id d189so98391oig.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bqLgjtRNDTI/SCbsYrw9ssaBt/TftKu39O2QQtBM9Tk=;
        b=w9XTgjGSu41nt9IFeQpEbJjO8J6dMiQcWgbPKtyAAyS9OdjINki2co+sS9dqTcXxwP
         9a50dhJmZZ/pcAKuZZi1bZ5FG47qFmFnjFsnK34WIOJM6sawqS2BxkA+wnfFo/0NO5U7
         T7HJ125TAyC1FH3SF7fLiQaDDx5zDeJAmOcAZKM1DVJi6UnrWGuRpUp+p8SUOQ2fh7+5
         koAKBtid/eWHiFAWyqy49gYwFOUY404kNbsU8ifI+myNLNWaMyjPnehz8klEfrv8vU8c
         HqtvtyCyEHdtd1ZzNRXAF5xnjwtcLtq7Ej9dmL+S5qx1xFf3gOBJIJdNRD441DwhKLQt
         oJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bqLgjtRNDTI/SCbsYrw9ssaBt/TftKu39O2QQtBM9Tk=;
        b=tnxiqz6QSqZffw9k5r00YbqFtnUbLK2i8+NIDgGBb+BVyzdX2IqKnJf+wPLsgJFuvv
         BnQzdKnNuO5uEoOvrE1rNJpuSDyot0pDXrifqP766yo/QxGstejvj9GWhh2xRPc12e2j
         TIMpPcfexwFYzpPpwF8GYBh8r8kGcVPDPRYJ2ElBarEfi26cygLiL0DqaMFiYJupaFRC
         EhgTUYtxZvYpfBrH8qhX5y4IBLWGwUmjodhBOaXrMtw8QjNR6Ml2WiqGz1F5Ps+MguXC
         0Ich/7E0hTILsYIuRH5Ilz/i5Y5x5a3UNRkNX0Tx2siKqMBOYGHlrkXIljjifPbjRkJW
         dZlA==
X-Gm-Message-State: AOAM532BAp3/dKBnjdyNkOwbMSX6tNqHvQNavBvPG+Zal0FEkR25x4jl
        N7qTBbJxZ8nI5WezQM+RWpJ8Ag==
X-Google-Smtp-Source: ABdhPJxCwPxWpbx9/FQ/pHgMctBc48p1eEulQ2TAksIyKoN3KLenR9QKBzFuscBKV7AaA2Ff800Myg==
X-Received: by 2002:aca:190a:: with SMTP id l10mr117370oii.175.1598938544802;
        Mon, 31 Aug 2020 22:35:44 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id u28sm20035otj.13.2020.08.31.22.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 22:35:44 -0700 (PDT)
Date:   Tue, 1 Sep 2020 00:35:41 -0500
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
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 19/19] drm/msm: show process names in gem_describe
Message-ID: <20200901053541.GY3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-20-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-20-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> In $debugfs/gem we already show any vma(s) associated with an object.
> Also show process names if the vma's address space is a per-process
> address space.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c     |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c     | 25 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_gem.h     |  5 +++++
>  drivers/gpu/drm/msm/msm_gem_vma.c |  1 +
>  drivers/gpu/drm/msm/msm_gpu.c     |  8 +++++---
>  drivers/gpu/drm/msm/msm_gpu.h     |  2 +-
>  6 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 8e70d220bba8..8d5c4f98c332 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>  	kref_init(&ctx->ref);
>  	msm_submitqueue_init(dev, ctx);
>  
> -	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
> +	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
>  	file->driver_priv = ctx;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 3cb7aeb93fd3..76a6c5271e57 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -842,11 +842,28 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>  
>  		seq_puts(m, "      vmas:");
>  
> -		list_for_each_entry(vma, &msm_obj->vmas, list)
> -			seq_printf(m, " [%s: %08llx,%s,inuse=%d]",
> -				vma->aspace != NULL ? vma->aspace->name : NULL,
> -				vma->iova, vma->mapped ? "mapped" : "unmapped",
> +		list_for_each_entry(vma, &msm_obj->vmas, list) {
> +			const char *name, *comm;
> +			if (vma->aspace) {
> +				struct msm_gem_address_space *aspace = vma->aspace;
> +				struct task_struct *task =
> +					get_pid_task(aspace->pid, PIDTYPE_PID);
> +				if (task) {
> +					comm = kstrdup(task->comm, GFP_KERNEL);
> +				} else {
> +					comm = NULL;
> +				}
> +				name = aspace->name;
> +			} else {
> +				name = comm = NULL;
> +			}
> +			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s,inuse=%d]",
> +				name, comm ? ":" : "", comm ? comm : "",
> +				vma->aspace, vma->iova,
> +				vma->mapped ? "mapped" : "unmapped",
>  				vma->inuse);
> +			kfree(comm);
> +		}
>  
>  		seq_puts(m, "\n");
>  	}
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 9c573c4269cb..7b1c7a5f8eef 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -24,6 +24,11 @@ struct msm_gem_address_space {
>  	spinlock_t lock; /* Protects drm_mm node allocation/removal */
>  	struct msm_mmu *mmu;
>  	struct kref kref;
> +
> +	/* For address spaces associated with a specific process, this
> +	 * will be non-NULL:
> +	 */
> +	struct pid *pid;
>  };
>  
>  struct msm_gem_vma {
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 29cc1305cf37..80a8a266d68f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -17,6 +17,7 @@ msm_gem_address_space_destroy(struct kref *kref)
>  	drm_mm_takedown(&aspace->mm);
>  	if (aspace->mmu)
>  		aspace->mmu->funcs->destroy(aspace->mmu);
> +	put_pid(aspace->pid);
>  	kfree(aspace);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 951850804d77..ac8961187a73 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -825,10 +825,9 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>  
>  /* Return a new address space for a msm_drm_private instance */
>  struct msm_gem_address_space *
> -msm_gpu_create_private_address_space(struct msm_gpu *gpu)
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
>  {
>  	struct msm_gem_address_space *aspace = NULL;
> -
>  	if (!gpu)
>  		return NULL;
>  
> @@ -836,8 +835,11 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu)
>  	 * If the target doesn't support private address spaces then return
>  	 * the global one
>  	 */
> -	if (gpu->funcs->create_private_address_space)
> +	if (gpu->funcs->create_private_address_space) {
>  		aspace = gpu->funcs->create_private_address_space(gpu);
> +		if (!IS_ERR(aspace))
> +			aspace->pid = get_pid(task_pid(task));
> +	}
>  
>  	if (IS_ERR_OR_NULL(aspace))
>  		aspace = msm_gem_address_space_get(gpu->aspace);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 4052a18e18c2..59f26bd0fe42 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -298,7 +298,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		const char *name, struct msm_gpu_config *config);
>  
>  struct msm_gem_address_space *
> -msm_gpu_create_private_address_space(struct msm_gpu *gpu);
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task);
>  
>  void msm_gpu_cleanup(struct msm_gpu *gpu);
>  
> -- 
> 2.26.2
> 
