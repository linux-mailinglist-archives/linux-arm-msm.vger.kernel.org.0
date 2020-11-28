Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDCC2C7394
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgK1Vt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732660AbgK1TC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 14:02:29 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F31EC061A4A
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:49:52 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w4so5876997pgg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fK8ypxZw0P+xhlPu3aj1cJ7J0U2mOgJjzYlUgJSIaCE=;
        b=wBLiTO3OfE/iy8Y8Q2QkjO0A7dTvmcvk7PkoS7+Om+CxmOWhCLFkOjBhPj8mGCgbto
         PW8KF97cdQt0I6VUUg6bV+6WzSN5N5TnV/5yq92H2aHVShpuSu8XqizXLitHB2afpe6y
         YwdXGdAchpRgy+djPHvRxBSdCig2tO5vOj+M8VRM037LWfhAYPpMzvJ7tUnURxf8Zw6B
         tNhoCNQjIO90c2nTc+DzpvJosrV6RuH1xX/Vs6Z8kE2dW6IFAIXbRyUehdj1KvcBdWVB
         lsxPM2HjnCyF1kVjGpBaydKne9EJudOBNcE+YSQajmC3uKkzpGUyGuQe0tfCWOOYKbAC
         z6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fK8ypxZw0P+xhlPu3aj1cJ7J0U2mOgJjzYlUgJSIaCE=;
        b=h0+TBZMhEv7cGkG4z5I2du4rpmOftRY3jaCClPBKR0AvJns6lIO5q4RdujI4jQtZ4r
         e8Sx2n8E5dZdG1ygXUDotC9uhuO7Zro7yjcbe1FTP312xD3GNNmIsbZ8pOR2avnwOKbG
         YTWL/jn/FHxXEUy4+yxz7sEwNwLwbM/yVC/l72sDQCM57OQBhrhJdKzXfNLmSGwqBuYz
         rNJ3GGJYA1UWGnbPVeXoebjaEQ64jtIuxwhMct8A3sc2zgv5y+FAEO30DUbXHrWUeOD0
         1Rs6Da7gd5GKhR0asa25cUlN/b+q73jaGgfrYuCIXTo6cIoDbdiVnk7mbxvOBsFMfrMr
         7Gpw==
X-Gm-Message-State: AOAM532fFFJmg6j8ZApzCt5vQRA2J2lMraUHBbgShtTEIC0EOgF+djgh
        ckPWZM0kvGXb015AOHHQqGfh
X-Google-Smtp-Source: ABdhPJyqWuBgQsxm98vYCC792fa42oRJNjJ1fb41HljJFjKHZDbCbEvqAgJd9D0fQrLjI9vvwtVJ+A==
X-Received: by 2002:a62:820b:0:b029:197:6f2f:91ba with SMTP id w11-20020a62820b0000b02901976f2f91bamr10236293pfd.23.1606542591935;
        Fri, 27 Nov 2020 21:49:51 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id h7sm9060032pgr.33.2020.11.27.21.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:49:51 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:19:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 5/9] mhi: pci_generic: Add support for reset
Message-ID: <20201128054941.GD3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-6-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-6-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:29:03PM +0100, Loic Poulain wrote:
> Add support for resetting the device, reset can be triggered in case
> of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 119 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 106 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 6b6e5bf..67fcbcf 100644
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
> @@ -179,6 +180,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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
> @@ -203,6 +214,20 @@ static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
>  	writel(1, mhi_cntrl->regs + DEV_RESET_REG);
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
> @@ -298,16 +323,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
> +	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> +	if (!mhi_pdev)
>  		return -ENOMEM;

Still not agreeing to use the alloc API? I know that it does only one
job but the reason for pushing this API is that the MHI stack will
misbehave terribly if a non-initialized structure is passed to it. And
the only way to ensure is to provide an API and recommend the users to
use it.

>  
>  	mhi_cntrl_config = info->config;
> +	mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	mhi_initialize_controller(mhi_cntrl);

No, please just stick to alloc API.

Thanks,
Mani

>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>  	mhi_cntrl->iova_start = 0;
>  	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
> @@ -322,17 +351,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
> @@ -347,37 +380,97 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
>  
>  	/* MHI-layer reset could not be enough, always hard-reset the device */
>  	mhi_pci_reset(mhi_cntrl);
> +}
> +
> +void mhi_pci_reset_prepare(struct pci_dev *pdev)
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
> +	mhi_pci_reset(mhi_cntrl);
> +
> +	/* Be sure device reset has been executed */
> +	msleep(500);
> +}
> +
> +void mhi_pci_reset_done(struct pci_dev *pdev)
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
>  
> -	mhi_free_controller(mhi_cntrl);
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
>  }
>  
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
