Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568D42E985C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 16:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbhADPVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 10:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbhADPVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 10:21:49 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3445C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 07:21:08 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id m6so16613441pfm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=adHr6IekMbWixaD0/4qUcGg4NxLrJKODBcMo2nNh6RA=;
        b=vaQMwHXeWJYtZDbuYFLAEO7GNnL4+44ky3+2xvwqGHZtL5nU1lJK4ExK/BOzvyEIRA
         6XxhsvpPjpq1F7QBXgEmQd+2rXM+MDIvT3c1xjXzlzPUxPWoLLL9z/H/7dql7XlZE13U
         56PeYoejAODBYV/fnZC9sfFuHm+9+R4F5/2ekP43TUz5eTJ3mMXOd0PCh+Q/i029HHk0
         z8RPqG+C92e9MReNqfS4HiKfOLEikmWHzQ2ySiR5i7YsUyOQVzYAMcybXzQlnSRECwWc
         ko5tkrApW200x5rHIv1hTVvhDLi9JO+gEXZ6qItCaAXeBX+Vu8x+WaYkIEHJd35+t3g3
         QzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=adHr6IekMbWixaD0/4qUcGg4NxLrJKODBcMo2nNh6RA=;
        b=hiln8vhEGXv73h1aivmvVPZBNhJRB3BEQcP+x9UXx/nCum3RTH3BrZgjpHcXPYHbBO
         M2EsYMJUC1C6vzp4pU1Y8wySzqbvi1XZe0nXjHuHi3QXBtWUEbSxebk+kDwu7kNERoEY
         gJEZJa0ciB/9lWror9c0edSeV7GvmVQm1sSFOVqsFGQzxDqmAjhZsCm6RsH21lYej9UG
         6aQArIKfEezvp8ZISezZ3UvLg43ipSQJWYYIWMiaTTeWgtzXUaejU8eTHQ+hqoN95Pxd
         s2ovsw3mlB/JxktrKujrcKOBULitBnvRbw/7Die53inOrZs939f19i5SDvsyw05+f25P
         F/Fw==
X-Gm-Message-State: AOAM5302nNBEmrpLng5Lw+H+07wvoPvn6zzjWkis7J5CTPmAOm2il6dG
        ao/KtnaDKi9bZwoxMBIlLAo7sSulIIm2
X-Google-Smtp-Source: ABdhPJyGhjCJfKawyDsnJE2yg/SC7hEmBaTUjwlvoroFNiXt7qx2O12LvASrMCKZx+N6hikXRUubxg==
X-Received: by 2002:a63:220b:: with SMTP id i11mr72098198pgi.2.1609773668400;
        Mon, 04 Jan 2021 07:21:08 -0800 (PST)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id s5sm21706230pju.9.2021.01.04.07.21.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 07:21:07 -0800 (PST)
Date:   Mon, 4 Jan 2021 20:51:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v7 04/10] mhi: pci_generic: Add support for reset
Message-ID: <20210104152104.GB2256@work>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
 <1609768179-10132-5-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609768179-10132-5-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 02:49:33PM +0100, Loic Poulain wrote:
> Add support for resetting the device, reset can be triggered in case
> of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 121 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 108 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 077595c..b2307e7 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/mhi.h>
>  #include <linux/module.h>
> @@ -15,6 +16,7 @@
>  
>  #define MHI_PCI_DEFAULT_BAR_NUM 0
>  
> +#define MHI_POST_RESET_DELAY_MS 500
>  /**
>   * struct mhi_pci_dev_info - MHI PCI device specific information
>   * @config: MHI controller configuration
> @@ -177,6 +179,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
>  
> +enum mhi_pci_device_status {
> +	MHI_PCI_DEV_STARTED,
> +};
> +
> +struct mhi_pci_device {
> +	struct mhi_controller mhi_cntrl;
> +	struct pci_saved_state *pci_state;
> +	unsigned long status;
> +};
> +
>  static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
>  			    void __iomem *addr, u32 *out)
>  {
> @@ -196,6 +208,20 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  	/* Nothing to do for now */
>  }
>  
> +static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	u16 vendor = 0;
> +
> +	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> +		return false;
> +
> +	if (vendor == (u16) ~0 || vendor == 0)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  			 unsigned int bar_num, u64 dma_mask)
>  {
> @@ -291,16 +317,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
>  	const struct mhi_controller_config *mhi_cntrl_config;
> +	struct mhi_pci_device *mhi_pdev;
>  	struct mhi_controller *mhi_cntrl;
>  	int err;
>  
>  	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>  
> -	mhi_cntrl = mhi_alloc_controller();
> -	if (!mhi_cntrl)
> +	/* mhi_pdev.mhi_cntrl must be zero-initialized */
> +	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> +	if (!mhi_pdev)
>  		return -ENOMEM;
>  
>  	mhi_cntrl_config = info->config;
> +	mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>  	mhi_cntrl->iova_start = 0;
>  	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> @@ -315,17 +345,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
>  	if (err)
> -		goto err_release;
> +		return err;
>  
>  	err = mhi_pci_get_irqs(mhi_cntrl, mhi_cntrl_config);
>  	if (err)
> -		goto err_release;
> +		return err;
> +
> +	pci_set_drvdata(pdev, mhi_pdev);
>  
> -	pci_set_drvdata(pdev, mhi_cntrl);
> +	/* Have stored pci confspace at hand for restore in sudden PCI error */
> +	pci_save_state(pdev);
> +	mhi_pdev->pci_state = pci_store_saved_state(pdev);
>  
>  	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
>  	if (err)
> -		goto err_release;
> +		return err;
>  
>  	/* MHI bus does not power up the controller by default */
>  	err = mhi_prepare_for_power_up(mhi_cntrl);
> @@ -340,33 +374,94 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto err_unprepare;
>  	}
>  
> +	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +
>  	return 0;
>  
>  err_unprepare:
>  	mhi_unprepare_after_power_down(mhi_cntrl);
>  err_unregister:
>  	mhi_unregister_controller(mhi_cntrl);
> -err_release:
> -	mhi_free_controller(mhi_cntrl);
>  
>  	return err;
>  }
>  
>  static void mhi_pci_remove(struct pci_dev *pdev)
>  {
> -	struct mhi_controller *mhi_cntrl = pci_get_drvdata(pdev);
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> +		mhi_power_down(mhi_cntrl, true);
> +		mhi_unprepare_after_power_down(mhi_cntrl);
> +	}
>  
> -	mhi_power_down(mhi_cntrl, true);
> -	mhi_unprepare_after_power_down(mhi_cntrl);
>  	mhi_unregister_controller(mhi_cntrl);
> -	mhi_free_controller(mhi_cntrl);
>  }
>  
> +static void mhi_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	dev_info(&pdev->dev, "reset\n");
> +
> +	/* Clean up MHI state */
> +	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> +		mhi_power_down(mhi_cntrl, false);
> +		mhi_unprepare_after_power_down(mhi_cntrl);
> +	}
> +
> +	/* cause internal device reset */
> +	mhi_soc_reset(mhi_cntrl);
> +
> +	/* Be sure device reset has been executed */
> +	msleep(MHI_POST_RESET_DELAY_MS);
> +}
> +
> +static void mhi_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +	int err;
> +
> +	/* Restore initial known working PCI state */
> +	pci_load_saved_state(pdev, mhi_pdev->pci_state);
> +	pci_restore_state(pdev);
> +
> +	/* Is device status available ? */
> +	if (!mhi_pci_is_alive(mhi_cntrl)) {
> +		dev_err(&pdev->dev, "reset failed\n");
> +		return;
> +	}
> +
> +	err = mhi_prepare_for_power_up(mhi_cntrl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to prepare MHI controller\n");
> +		return;
> +	}
> +
> +	err = mhi_sync_power_up(mhi_cntrl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> +		mhi_unprepare_after_power_down(mhi_cntrl);
> +		return;
> +	}
> +
> +	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +}
> +
> +static const struct pci_error_handlers mhi_pci_err_handler = {
> +	.reset_prepare = mhi_pci_reset_prepare,
> +	.reset_done = mhi_pci_reset_done,
> +};
> +
>  static struct pci_driver mhi_pci_driver = {
>  	.name		= "mhi-pci-generic",
>  	.id_table	= mhi_pci_id_table,
>  	.probe		= mhi_pci_probe,
> -	.remove		= mhi_pci_remove
> +	.remove		= mhi_pci_remove,
> +	.err_handler	= &mhi_pci_err_handler,
>  };
>  module_pci_driver(mhi_pci_driver);
>  
> -- 
> 2.7.4
> 
