Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9B12C73BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387594AbgK1Vty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731732AbgK1SzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:13 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951CDC08E860
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:20:13 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so5927938pgi.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RlCxB7nAAa3qXJoQsPbM0deC+9x5BseCZOLY2wVYvwo=;
        b=DX8L1HolTqiI/c/D7tpQ07c87SsnCAo/kRMFsqy2HToKVWtobIN8FWWlzlFb1gq7lH
         sjE/NvyXxwoevCi7muwIujaTiiTwhTFx3WsA52EfmhCaAV3FQTVfrBBRq3nu3fv2glUy
         mMVVxyNr502xpLSeDK+Ch6g54y9tlw3asRikA9JCgFUcGSmWISQYLeCRieouC96dPQ0X
         cAzgahQ8m/HWz0SY22vLYKUY91VfqIiOEePxPMsQhqtpV110ZZo5kJ5M12Xxiru1Ri6F
         D7yFFVcMcbRCwaXsnSyE6/fLyLUl3ia7uxOFUoEFd2lHcywdvwHoXTqtsPUToTRuk3o1
         GiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RlCxB7nAAa3qXJoQsPbM0deC+9x5BseCZOLY2wVYvwo=;
        b=rnx2YoghXH7T7Bk25Q3qJC1/6LYXOD8A9vaVvK5Z2rbTmf6zuoYu2a+1XEUPNUl5eg
         0M8cXSyMldGfL5lP8r2qAX26UJ3reKPaLkfeJv1jzuudRUBHRpIWTQydaE3PSJ14kR9n
         tlWs8SqLeAOTcRgSH7ny5Yrs/uYpbix0AHHTgiB/W/VoxCogoZzntPeEWaACYK+ijhoA
         TD8kMaarjCy42KN/20WqrGg0rfKoZ+6S9pUh4JwBmHk5UwRAUmuw1NLw8EiWf8V8Zd+K
         0cN2+oQY1euZdNdFDX7cmgX8P4u7pJ8wDqWe/A9jjiHpFJjcgUIvWcRuwzrIT0q1cMwk
         BLzQ==
X-Gm-Message-State: AOAM5314rJDVTnv8ePEZOEI71tDNjU2JRbQQd/+dx4TWVi49ggahSEhs
        PYumExmyUwp+UBnKQQOwT15m
X-Google-Smtp-Source: ABdhPJzn/q9q2Zvgyt0YH/+iiBGhz4C5oOQ9YEBz9TrfYwoToEEx+PhHPFibjS2GmpE7UEd6EEz03A==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr9520159pgk.279.1606544412936;
        Fri, 27 Nov 2020 22:20:12 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id v18sm8941978pfn.35.2020.11.27.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 22:20:12 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:49:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v3] bus: mhi: core: Indexed MHI controller name
Message-ID: <20201128061958.GK3077@thinkpad>
References: <1606493121-12540-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606493121-12540-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 27, 2020 at 05:05:21PM +0100, Loic Poulain wrote:
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
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: move index field at the end of mhi_controller struct (before bool)
>      to avoid breaking well packed alignment.
>  v3: Align debugfs directory name
> 
>  drivers/bus/mhi/core/debugfs.c |  2 +-
>  drivers/bus/mhi/core/init.c    | 18 ++++++++++++++++--
>  drivers/bus/mhi/core/main.c    |  2 +-
>  include/linux/mhi.h            |  2 ++
>  4 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> index 7d43138..858d751 100644
> --- a/drivers/bus/mhi/core/debugfs.c
> +++ b/drivers/bus/mhi/core/debugfs.c
> @@ -377,7 +377,7 @@ static struct dentry *mhi_debugfs_root;
>  void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
>  {
>  	mhi_cntrl->debugfs_dentry =
> -			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
> +			debugfs_create_dir(dev_name(&mhi_cntrl->mhi_dev->dev),
>  					   mhi_debugfs_root);

This change doesn't belong to this patch, right? This should be part of
"bus: mhi: core: Fix device hierarchy".

Thanks,
Mani

>  
>  	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
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
> index 7f3c990..ea39df0 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -350,7 +350,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
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
