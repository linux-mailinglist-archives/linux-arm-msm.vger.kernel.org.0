Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFED3562DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 07:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348605AbhDGFHo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 01:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348586AbhDGFHn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 01:07:43 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0BFC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 22:07:34 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k8so12134560pgf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 22:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ad7FfMrBXhpKmBwR2AxTcQ8L7cZznDXVouIZrZMVqiQ=;
        b=Nfsa8MLc61F7dqYzW+CFD+GtC4hWFJu8LRd2fY1BUr2kaqpY5XRvzsQgg4e8F1JIr0
         aoXlIlVtTgHkkm/UuG+rUBC0VSz+BXPg3y1yPeZFc+L7CjeZFYaQJcB5D8zf9RXaiNu7
         MEWQI62Tv3DAcjIvwr8Kx9wNdg/fDxaW7vIbpxx0IRj7BXd95Er9wBT8NUSOXHEC7mbH
         Wofvc5ri8imx6ajQe8FUTVn2FqanB8FG2xLo4u+zlikzpxBcb+OqUlms8/c2s7t7WpXd
         QRbeTZNdhAI8PV7aDONrBeG282yvhwKK7VQOM6C7Q7PrwASRTMhlA0xnqhEmfQUPny90
         JWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ad7FfMrBXhpKmBwR2AxTcQ8L7cZznDXVouIZrZMVqiQ=;
        b=KjySMpni4/kxTWdGHH24YPF//hzMpOskFDGbW5d2BNQOeqD2wW0Pq25YgW7rP0G4zJ
         N29Plw8yX4XPUo0XPTWX3rlsZZQUyPmmQRNeMh1JbFnxsYwv3QBhDm/1gsUnCW0tIJWg
         cD/EGCo7+Nyj2xjGWzayanUllFITFKA+4yIS8Ay1V0PQJw1MVzJZkWikiq/GEeDWwpOl
         okDB5D5Q1JFvEus6yXRapYQbX9GuBxHPxiGl9ho8v5MhbA2vi39pn3qFoTtTuhQ2Z3K5
         AMTo4gg8NRq3PplzzJwooyAqB0e5yTr6FCJWRSF+jla1zIdvC/kfaXi6tDYBOCgxN9Sx
         XkQA==
X-Gm-Message-State: AOAM5331nuo1FEHqL0hAD9alEHxo/cQC1/0w3C5DUvc3x2P9rjOcz0BP
        1DGVBtWFn2r/fIiHXceENLGd
X-Google-Smtp-Source: ABdhPJzC5tOrU3RqVhQael2PQ0ozenyGPSSMkpA8LlErqmD3kXz1H6GsnTYWN9oLZJULebhkNuJVVw==
X-Received: by 2002:a62:8f4a:0:b029:241:fc67:d425 with SMTP id n71-20020a628f4a0000b0290241fc67d425mr1245458pfd.21.1617772054184;
        Tue, 06 Apr 2021 22:07:34 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id t12sm20649589pga.85.2021.04.06.22.07.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 22:07:33 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:37:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, loic.poulain@linaro.org, kvalo@codeaurora.org
Subject: Re: [RESEND PATCH] bus: mhi: core: Remove pre_init flag used for
 power purposes
Message-ID: <20210407050730.GC8675@work>
References: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 01, 2021 at 02:41:49PM -0700, Bhaumik Bhatt wrote:
> Some controllers can choose to skip preparation for power up.
> In that case, device context is initialized based on the pre_init
> flag not being set during mhi_prepare_for_power_up(). There is no
> reason MHI host driver should maintain and provide controllers
> with two separate paths for preparing MHI.
> 
> Going forward, all controllers will be required to call the
> mhi_prepare_for_power_up() API followed by their choice of sync
> or async power up. This allows MHI host driver to get rid of the
> pre_init flag and sets up a common way for all controllers to use
> MHI. This also helps controllers fail early on during preparation
> phase in some failure cases.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

I hope Jeff is also okay with this patch for AIC100. 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> This patch was tested on arm64 architecture.
> 
>  drivers/bus/mhi/core/init.c |  3 ---
>  drivers/bus/mhi/core/pm.c   | 20 --------------------
>  include/linux/mhi.h         |  2 --
>  3 files changed, 25 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index d1d9b0d..1f61352 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1080,8 +1080,6 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
>  	}
>  
> -	mhi_cntrl->pre_init = true;
> -
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
>  	return 0;
> @@ -1112,7 +1110,6 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	mhi_deinit_dev_ctxt(mhi_cntrl);
> -	mhi_cntrl->pre_init = false;
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e4aff77..b23eec5 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1062,13 +1062,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  
> -	if (!mhi_cntrl->pre_init) {
> -		/* Setup device context */
> -		ret = mhi_init_dev_ctxt(mhi_cntrl);
> -		if (ret)
> -			goto error_dev_ctxt;
> -	}
> -
>  	ret = mhi_init_irq_setup(mhi_cntrl);
>  	if (ret)
>  		goto error_setup_irq;
> @@ -1150,10 +1143,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	mhi_deinit_free_irq(mhi_cntrl);
>  
>  error_setup_irq:
> -	if (!mhi_cntrl->pre_init)
> -		mhi_deinit_dev_ctxt(mhi_cntrl);
> -
> -error_dev_ctxt:
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
> @@ -1203,15 +1192,6 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	flush_work(&mhi_cntrl->st_worker);
>  
>  	free_irq(mhi_cntrl->irq[0], mhi_cntrl);
> -
> -	if (!mhi_cntrl->pre_init) {
> -		/* Free all allocated resources */
> -		if (mhi_cntrl->fbc_image) {
> -			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
> -			mhi_cntrl->fbc_image = NULL;
> -		}
> -		mhi_deinit_dev_ctxt(mhi_cntrl);
> -	}
>  }
>  EXPORT_SYMBOL_GPL(mhi_power_down);
>  
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index b16afd3..c9b36a3 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -354,7 +354,6 @@ struct mhi_controller_config {
>   * @index: Index of the MHI controller instance
>   * @bounce_buf: Use of bounce buffer
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
> - * @pre_init: MHI host needs to do pre-initialization before power up
>   * @wake_set: Device wakeup set flag
>   * @irq_flags: irq flags passed to request_irq (optional)
>   *
> @@ -447,7 +446,6 @@ struct mhi_controller {
>  	int index;
>  	bool bounce_buf;
>  	bool fbc_download;
> -	bool pre_init;
>  	bool wake_set;
>  	unsigned long irq_flags;
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
