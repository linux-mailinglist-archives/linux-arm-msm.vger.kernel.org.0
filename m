Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E802C73A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgK1Vtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732117AbgK1S6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:58:05 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4606CC094259
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 23:15:49 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so6407328pfn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 23:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MKoWUEN4GtO48pZaDmL3FhlAuOdDrUevk/+n8pdV/IY=;
        b=N1YCQ8sYQUVjyvUdOwp6zXJ4g3r8I7N1BemZJXm9A7/dKzW7Wmpq/QSHB+WXAo3WIX
         t7H3wGH8JogTDeCFpQnxQSRZFkvMm27PAdSKyJF5t0y4BwilIP8quYiR3K1FYGYOYTJ8
         H/Bg83yvui72xwhpTwz7rUq8kgyaOKmNNkWJugqXodWymM1Rz4wJaVxzyj6gOVnIiAoF
         5UrAOtfJrPhartQUXHybVHwF0MtjaHEPxebJBZSC7fqjPDtTXWDekis3SSoDpfkjIpdY
         U7vxFwLG6fX7lddzkeEn86lJ8qYgN/LJ9z5MJCf8V1cBBWUsGNX9+uMio5vkJi0cWz5j
         bEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MKoWUEN4GtO48pZaDmL3FhlAuOdDrUevk/+n8pdV/IY=;
        b=J4FNHPxeKWYEUmZtom41UDRqqbe+y/18TJshbHYxSst0K5HzknrxKVhqMLoslxGYFa
         F4+W4lT/TNfn4qQasyBKwPSEBegKruMX+d5MWrnY5zN7x9DaHWGUOqHiR9C1oAsPe8LN
         jiaXeYcBpHnBgwDSQ2lZf5aYpDs6yKwjq8OeueONFaX6HLYgW/M0MOXboF1sYYIp3Isv
         zfF97eE1n7wrRqJ08Qlkt3EnWhb6Py2aiQCdvltao6JCEIG7cmldjLqKtd6uddKinS1F
         GZYCSps/SIPdV0wsMPsBU8zdOyPi42IUzbbx+N9DUsYJSaujNuDyCP8wnnS01ACsGJZH
         xkjQ==
X-Gm-Message-State: AOAM532DA8kz08jVRCGHFPRS8pJ4xjRAFN1wdGg8XBxLkZPeBbwOnim0
        17ROYgZ9AHd8bCaoakTfS4Yy
X-Google-Smtp-Source: ABdhPJwZNMK/ZqGJTVb1G6VspFddStw1o5kscCk8wnlMl1IUIBFplS7tQN5eQEMZ5lj24Qt+9McxCQ==
X-Received: by 2002:a17:90b:1183:: with SMTP id gk3mr3107485pjb.191.1606547748812;
        Fri, 27 Nov 2020 23:15:48 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id e22sm9627124pfi.83.2020.11.27.23.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 23:15:47 -0800 (PST)
Date:   Sat, 28 Nov 2020 12:45:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Indexed MHI controller name
Message-ID: <20201128071540.GN3077@thinkpad>
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

Applied to mhi-next!

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
