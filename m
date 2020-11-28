Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF112C73CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgK1Vtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731545AbgK1Sw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:52:59 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC08C061A56
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:07:25 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w6so6310734pfu.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7jfvUADUgZYBu0QBTmeyVfpDsVPoW1KdrHNxzFT75BM=;
        b=M4iw5FpfB9wdQmXNp4RnY7fD2HDnotcG9vpdjeUk44R2RADJnYHTo9UKp3MK3H178k
         K4+8jS+nqasM1r/vp72b8LbDOiTEB58B0HJlIYbXtmp81w5Oedp0pyPhp7raYMCvCIRl
         hW1k07RvR9lBMjwHNBofque1T4iGDMhNC6TQcMumXWwPpjcqtZ6rmuBAaXgk1uJgBe2a
         JvoRN+woLHdGBe5buPXPRSBS/Dc97ZWNPvAZTdU6vIyXFC9+olqmQzFq1eOYbSjE1295
         L5KlXi1RWntfaUKbg5q+4dfi0M5VMgMBF3yFFg3R4WJTp1/K2d70KcZhj621eIAgbIUl
         pgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7jfvUADUgZYBu0QBTmeyVfpDsVPoW1KdrHNxzFT75BM=;
        b=TKg9NI3HMbNfgqWOKIq10ITvxbPIHRIBp54C0iGlT+LWZsStwGezW+Y3Z5GqDZWTDF
         Qz0MQvb7jTkjsmX98uHfhGDTvYSTyMWX0kcOJY9pe1Ebpb4YT8/egNYY4R2glwkur66G
         xyolPryC4SaJzAuQrdzxqiY0TD/gSDDwpWMRGUfZQD47vMhl/xDcKTaX1PjO4u9puSWh
         FaJcfpTOxMfi6TLc43S51E4HixgKXN8y2k1jxxTU6YLJa45L8W+Dgr0HulzdW4l7cEBz
         unPdhuTKbyzPB6Y5A+qm9qYn7I3U+aM/WdAHiJDHRKx7eA+GaG31DwQD5V249OwuesbB
         l+QA==
X-Gm-Message-State: AOAM530uRindQ1dkITWL2L81jgcVJKRK455+lvBURkV0nPQDHqFp/Bn0
        Zme0KlJ5BHg102W/hq4lHnFP
X-Google-Smtp-Source: ABdhPJwLiCElR4OwKX6GmvUAJYQYbDIWjYY1BLVZQaPISSugjaEZZUFwvx/PK1XyMPOdbPsu4+WrYA==
X-Received: by 2002:a65:4809:: with SMTP id h9mr9369217pgs.194.1606543645000;
        Fri, 27 Nov 2020 22:07:25 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id k1sm8976637pgm.21.2020.11.27.22.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 22:07:24 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:37:17 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Indexed MHI controller name
Message-ID: <20201128060717.GI3077@thinkpad>
References: <1606386035-15982-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606386035-15982-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 11:20:35AM +0100, Loic Poulain wrote:
> Today the MHI controller name is simply cloned from the underlying
> bus device (its parent), that gives the following device structure
> for e.g. a MHI/PCI controller:
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
> ...
> 
> That's quite misleading/confusing and can cause device registering
> issues because of duplicate dev name (e.g. if a PCI device register
> two different MHI instances).
> 
> This patch changes MHI core to create indexed mhi controller names
> (mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).
> 
> The previous example becomes:
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
> ...
>  v2: move index field at the end of mhi_controller struct (before bool)
>      to avoid breaking well packed alignment.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 18 ++++++++++++++++--
>  drivers/bus/mhi/core/main.c |  2 +-
>  include/linux/mhi.h         |  2 ++
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c7a7354..4acad28 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -8,6 +8,7 @@
>  #include <linux/device.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/idr.h>
>  #include <linux/interrupt.h>
>  #include <linux/list.h>
>  #include <linux/mhi.h>
> @@ -18,6 +19,8 @@
>  #include <linux/wait.h>
>  #include "internal.h"
>  
> +static DEFINE_IDA(mhi_controller_ida);
> +
>  const char * const mhi_ee_str[MHI_EE_MAX] = {
>  	[MHI_EE_PBL] = "PBL",
>  	[MHI_EE_SBL] = "SBL",
> @@ -940,6 +943,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	mhi_cntrl->minor_version = (soc_info & SOC_HW_VERSION_MINOR_VER_BMSK) >>
>  					SOC_HW_VERSION_MINOR_VER_SHFT;
>  
> +	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
> +	if (mhi_cntrl->index < 0) {
> +		ret = mhi_cntrl->index;
> +		goto error_ida_alloc;
> +	}
> +
>  	/* Register controller with MHI bus */
>  	mhi_dev = mhi_alloc_device(mhi_cntrl);
>  	if (IS_ERR(mhi_dev)) {
> @@ -950,8 +959,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
>  	mhi_dev->mhi_cntrl = mhi_cntrl;
> -	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->cntrl_dev));
> -	mhi_dev->name = dev_name(mhi_cntrl->cntrl_dev);
> +	dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
> +	mhi_dev->name = dev_name(&mhi_dev->dev);
>  
>  	/* Init wakeup source */
>  	device_init_wakeup(&mhi_dev->dev, true);
> @@ -970,6 +979,9 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	put_device(&mhi_dev->dev);
>  
>  error_alloc_dev:
> +	ida_free(&mhi_controller_ida, mhi_cntrl->index);
> +
> +error_ida_alloc:
>  	kfree(mhi_cntrl->mhi_cmd);
>  
>  error_alloc_cmd:
> @@ -1004,6 +1016,8 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>  
>  	device_del(&mhi_dev->dev);
>  	put_device(&mhi_dev->dev);
> +
> +	ida_free(&mhi_controller_ida, mhi_cntrl->index);
>  }
>  EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>  
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 188501c0..4818f42 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -349,7 +349,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>  		/* Channel name is same for both UL and DL */
>  		mhi_dev->name = mhi_chan->name;
>  		dev_set_name(&mhi_dev->dev, "%s_%s",
> -			     dev_name(mhi_cntrl->cntrl_dev),
> +			     dev_name(&mhi_cntrl->mhi_dev->dev),
>  			     mhi_dev->name);
>  
>  		/* Init wakeup source if available */
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 27078db..30c676d 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -356,6 +356,7 @@ struct mhi_controller_config {
>   * @read_reg: Read a MHI register via the physical link (required)
>   * @write_reg: Write a MHI register via the physical link (required)
>   * @buffer_len: Bounce buffer length
> + * @index: Index of the MHI controller instance
>   * @bounce_buf: Use of bounce buffer
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @pre_init: MHI host needs to do pre-initialization before power up
> @@ -446,6 +447,7 @@ struct mhi_controller {
>  			  u32 val);
>  
>  	size_t buffer_len;
> +	int index;
>  	bool bounce_buf;
>  	bool fbc_download;
>  	bool pre_init;
> -- 
> 2.7.4
> 
