Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA532C3F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 12:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKYL6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 06:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgKYL6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 06:58:05 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57245C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 03:58:05 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t3so2235265pgi.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 03:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qWZ8YDpteG5oT3RspfBPrELNPRmJXhgzY0rxMPAVL5g=;
        b=YhL1pIwzXdYorpIGi2vlKMCikGPcKAU3wNCz7xLVAdxTA5lWT8WlqpW/uo22b9M2zn
         N+5a43bDCZIrbfjy5x3unU2qoIp7rYh7Rr1fGTaHOgfFvRYv7D1WYbXR6ZMRHI9EukCX
         to3max/ZKNjWAvHatgOyu0MA0ShrnXmSr7+cZFNbavDPArcPgLroOzYTbrprIM8jv1hT
         4OKm4BMzC6kvg8K7NE+rdlUP3Ineow4blx/ntz+C8o7nxY+vhVbje0/48QvVIP0wNCnO
         cwb6bT8/A7CGKWrZIWqaOsO8KzxrsCAS9KDgJN9a4eMuJqlozE/29EqFiDr8tURCY7qD
         KIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qWZ8YDpteG5oT3RspfBPrELNPRmJXhgzY0rxMPAVL5g=;
        b=QVJE9scDMAXOHcrQkqUcLxOVpHCMcnLgWahTpn9/kbxXUoLeELEvmP9FXODhvMujpZ
         12AVwVoTkvhc46azWEJ4o5qyFDwEC7GOk28r5aliKWj/MB/bu/vRe4RKQEcOjtINitIL
         EC6bHOyQfbU1lutKFX8B3G9RRfXjS4HmFfhix6ceYSM0FJ/IhOP1tXQEC7nUmkWg8BzZ
         jRAe7wRnfY0PBCk6KHsTMsXnstrQ8JvPxt55AgjFzZm3KCFCtRM5+6p+xDyMBsvHJvZd
         bnA39UZIK9xCl+AXjUvW9iV7cVxDjjmfAc5S2LLvkNOnqQWG9ratEeerMTaO7MMFS7eK
         krzQ==
X-Gm-Message-State: AOAM530jLvVVINAZpx9y51zoAnhgJcG5ZFFPKREDE5M31WH+hGBmLFsb
        I31SooLPtqRmns+PJtHJBJlJ
X-Google-Smtp-Source: ABdhPJyJp7rQcqnUJ7JGtX/kyo3W/bYAmaQzPsM+khdzHxwtz/CDNM7PBUqoCb+R9WVyLb19o317UA==
X-Received: by 2002:aa7:9a5b:0:b029:19a:7453:5e03 with SMTP id x27-20020aa79a5b0000b029019a74535e03mr972474pfj.43.1606305484474;
        Wed, 25 Nov 2020 03:58:04 -0800 (PST)
Received: from thinkpad ([2409:4072:6d97:56c0:a022:f6b9:5738:61e3])
        by smtp.gmail.com with ESMTPSA id i11sm2940940pjl.53.2020.11.25.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 03:58:03 -0800 (PST)
Date:   Wed, 25 Nov 2020 17:27:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v4] bus: mhi: core: Fix device hierarchy
Message-ID: <20201125115757.GA20836@thinkpad>
References: <1606303396-5588-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606303396-5588-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 25, 2020 at 12:23:16PM +0100, Loic Poulain wrote:
> This patch fixes the hierarchical structure of MHI devices. Indeed,
> MHI client devices are directly 'enumerated' from the mhi controller
> and therefore must be direct descendants/children of their mhi
> controller device, in accordance with the Linux Device Model.
> 
> Today both MHI clients and controller devices are at the same level,
> this patch ensures that MHI controller is parent of its client devices.
> 
> The hierarc        /* Only destroy virtual devices thats attached to bus */
        if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
                return 0;hy is especially important for power management (safe
> suspend/resume order). It is also useful for userspace to determine
> relationship between MHI client devices and controllers.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  v2: fix commit message
>  v3: reword commit message
>  v4: fix device destroy
> 
>  drivers/bus/mhi/core/init.c | 10 +++++++++-
>  drivers/bus/mhi/core/pm.c   |  4 ++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
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

Hmm. Now I don't think we need below check in mhi_destroy_device():

        /* Only destroy virtual devices thats attached to bus */
        if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
                return 0;

But let's keep it there for sanity.

Have you looked into mhi_debugfs_devices_show()? I guess you need to call
device_for_each_child() for both "mhi_cntrl->cntrl_dev" and
"mhi_cntrl->mhi_dev->dev".

Thanks,
Mani

>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> -- 
> 2.7.4
> 
