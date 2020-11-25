Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C0E2C429C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 16:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgKYPHT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 10:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgKYPHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 10:07:19 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B29C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 07:07:19 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 34so2659874pgp.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 07:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=20ETfEY82g9AzhjglXlZr7fJmUoWPYK5XgRT4K/E7IA=;
        b=Eq7Sd1jb2rKJDdrUeWMFWUNB8JTPxwBiF1cKR5Y0UqxyRUl9/jBaa//Cx2OBwl8OoK
         94qKyE/jcPNHx5UjIgVJNHNXf5SqanPZfKedEJxKfcEqi/j2DnSo4ZbyDdj/D0NrZA2d
         LRAdxAQnsebeH0l/kX+xaOgm7V4dTM6Oxnby6H77mRo1lts7u4sNqIPsTBGO1+PoHnEt
         pgBace9VCe/5Vo5y3cdDw+qep8JLN2bA3gxY5fBW51hjNHZxwtoZxBc5GEVT7rdEOlu5
         GOPRwjgDTw8qzFG+YN9uBscGh6raR2zAp8fyKMOXfxkRIJqky3MUCu0i3syqZ7Sn3czF
         XcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=20ETfEY82g9AzhjglXlZr7fJmUoWPYK5XgRT4K/E7IA=;
        b=IxTRAbkgmE6v9YK2HCPhdq7VxowUKl8eWD47VZX8ztPcYp5Rcm0/vdfsAgFnlHlH5A
         874XYSYjy1FvsyJR+hB0UGOYOiIeSGvPelWmOpyVHPbuqNeoAiiq0Kqpf5XXXnOejb05
         p/xHk8c0JM1F4BlK0nypvIPA033mT3X/te/tUOrVfQZUNNsX7cePfYNZTf9V9LtpQx9j
         l3PCghMqVyBYAFTi8PZHnWEix3TDnemA+aStvhWRnrwTVLIu/oMVxfFlVl/AgHSkocFR
         SqAXMM8A5gvCCmteBduvGg3mUXIiMAMedSh9ngtPtitwTzALHjQxiZB6nieAXrZCev7v
         A1TQ==
X-Gm-Message-State: AOAM533t3X9HhwKAS7WgYqGIvokoXMXnz7vyGDMnDqLY2/IBjA0JkaOR
        Ui9szOhnnnNan6DAVEpNWT3w7EpiPRKa
X-Google-Smtp-Source: ABdhPJwyOe2+r9H+xfkA6ls+CQ6+wKU0TDMjs3LaB9N3CTtbyt/WFNIXBK1wKure26doh5Hkonvv6g==
X-Received: by 2002:a63:f14c:: with SMTP id o12mr3466942pgk.450.1606316838550;
        Wed, 25 Nov 2020 07:07:18 -0800 (PST)
Received: from thinkpad ([2409:4072:6d97:56c0:a022:f6b9:5738:61e3])
        by smtp.gmail.com with ESMTPSA id g3sm2312402pfr.145.2020.11.25.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 07:07:17 -0800 (PST)
Date:   Wed, 25 Nov 2020 20:36:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v5] bus: mhi: core: Fix device hierarchy
Message-ID: <20201125150651.GB20836@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Hemant, Bhaumik: Can you please look into this change?

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
