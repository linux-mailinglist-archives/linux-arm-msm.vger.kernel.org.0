Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6B62C73B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387735AbgK1Vtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731856AbgK1SzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:25 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B04C094258
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 23:14:49 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 34so6001806pgp.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 23:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pWe1fZC62G3mtoRkN1GoYQXtRiPjbT/cZ8cQTKaGx7M=;
        b=MsN6+zZJjOwKtbqOf0XV1pAvg9xFSoY0vD7PJdwLbei60c+YOkbJPhjJ84m2xzbO/v
         56DpqCZ9HnP8fodhXJ7gm1JWyooEOMJd6Oqnm5ZdT01uJRnhlvPtSxDI0rowN6p3+pqQ
         QZuihS8y3LKxE3+YxJz353qNOT066/JbXuKAuEk2qWgPvAzz5s4osxMwXZ7XCULHElo1
         hQdEPdol5+W0uVwxSg15eJiIUillRXA9Xaj6djS9yq470cvAKP0J/4aD1XzHDJO5fLDu
         XWclF3j39RIP93XMBHjbrEa0e+EJgUJ1A1BpA3BJE2yO57UT/oTtZzhL4GorgS6SXLnZ
         US5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pWe1fZC62G3mtoRkN1GoYQXtRiPjbT/cZ8cQTKaGx7M=;
        b=HKBxAXnMjGGuMdx5ZSHhdvRlaARhinIYknVGx+Os6ymQxWkc6w2Vi1BP9yOkaMVySt
         CosJqGj8BsCxagN9CPRLzGm03R6uIJo4r262iAstHZ3b5S7mGmX9ydOBAttoRXvCq67o
         YHi467XiLbPBKJP04A66rxR7pErkWJVsDtqYktWvs7Qt6N1GVYcP/uP8ByR24BopDMSy
         p1rKJJny3jOICDDqa+0i7NGKWOFTShmJDeiyIWZ6rNLpGrlMqzW09FpdCqJ6IZP+Vays
         jfbWwuJfpyGjgk5uXmH3ykjlmAFxtBvmI7K5ec/dYF4UiFqrF8DOC4G3xV9KIvQ4PSkZ
         sdNg==
X-Gm-Message-State: AOAM531B9zO7bgIVPDg/t7/HeOXx+6hnRuybC2tW/cCOAUcwbQ185eJU
        ssPfy19fhG/SdPxvP5sr4U9tUuoeYrnJ
X-Google-Smtp-Source: ABdhPJyHqUmm2/wxxG/oVNn9ZOmmiO5pfJiJRzzFBJx+YGHGNxqX528eJqWpoUSZFc+SXjJcFmnYgw==
X-Received: by 2002:a17:90a:2e04:: with SMTP id q4mr14925305pjd.37.1606547689265;
        Fri, 27 Nov 2020 23:14:49 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id iq11sm10051544pjb.39.2020.11.27.23.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 23:14:48 -0800 (PST)
Date:   Sat, 28 Nov 2020 12:44:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v5] bus: mhi: core: Fix device hierarchy
Message-ID: <20201128071440.GM3077@thinkpad>
References: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 25, 2020 at 02:24:49PM +0100, Loic Poulain wrote:
> This patch fixes the hierarchical structure of MHI devices. Indeed,
> MHI client devices are directly 'enumerated' from the mhi controller
> and therefore must be direct descendants/children of their mhi
> controller device, in accordance with the Linux Device Model.
> 
> Today both MHI clients and controller devices are at the same level,
> this patch ensures that MHI controller is parent of its client devices.
> 
> The hierarchy is especially important for power management (safe
> suspend/resume order). It is also useful for userspace to determine
> relationship between MHI client devices and controllers.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: fix commit message
>  v3: reword commit message
>  v4: fix device destroy
>  v5: fix debugfs device show
> 
>  drivers/bus/mhi/core/debugfs.c |  4 +++-
>  drivers/bus/mhi/core/init.c    | 10 +++++++++-
>  drivers/bus/mhi/core/pm.c      |  4 ++--
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> index 3a48801..7d43138 100644
> --- a/drivers/bus/mhi/core/debugfs.c
> +++ b/drivers/bus/mhi/core/debugfs.c
> @@ -159,7 +159,9 @@ static int mhi_debugfs_devices_show(struct seq_file *m, void *d)
>  		return -ENODEV;
>  	}
>  
> -	device_for_each_child(mhi_cntrl->cntrl_dev, m, mhi_device_info_show);
> +	/* Show controller and client(s) info */
> +	mhi_device_info_show(&mhi_cntrl->mhi_dev->dev, m);
> +	device_for_each_child(&mhi_cntrl->mhi_dev->dev, m, mhi_device_info_show);
>  
>  	return 0;
>  }
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 436221c..c7a7354 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
>  	device_initialize(dev);
>  	dev->bus = &mhi_bus_type;
>  	dev->release = mhi_release_device;
> -	dev->parent = mhi_cntrl->cntrl_dev;
> +
> +	if (mhi_cntrl->mhi_dev) {
> +		/* for MHI client devices, parent is the MHI controller device */
> +		dev->parent = &mhi_cntrl->mhi_dev->dev;
> +	} else {
> +		/* for MHI controller device, parent is the bus device (e.g. pci device) */
> +		dev->parent = mhi_cntrl->cntrl_dev;
> +	}
> +
>  	mhi_dev->mhi_cntrl = mhi_cntrl;
>  	mhi_dev->dev_wake = 0;
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index a671f58..681960c 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -504,7 +504,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  	wake_up_all(&mhi_cntrl->state_event);
>  
>  	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> +	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -637,7 +637,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  	wake_up_all(&mhi_cntrl->state_event);
>  
>  	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> +	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> -- 
> 2.7.4
> 
