Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FA52C1A82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 02:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgKXBCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 20:02:03 -0500
Received: from z5.mailgun.us ([104.130.96.5]:11634 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727554AbgKXBCD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 20:02:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606179722; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=I1vyIxPBm48lz6FCnwEJJfLDltGMa+aRUj5rkDbS2fs=;
 b=t+Pp67r2GdhXEa/VjtIT/JuvFwLqvXDvfLXOOpT/Bgvrb0ATf4EK7eDNSxySclFd8pZbIutX
 eYucCcoosrZmHKekUz4QJxejQxH46vY4DdcAZQLqI0HslwNWL3UHeaIN3dV8UHVhGcfgUMJ6
 24Cs5dZb7q0AGI01gpSvtAZKMYM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbc5b8922377520ee2fda55 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 01:02:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75880C43460; Tue, 24 Nov 2020 01:02:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DEC2DC433C6;
        Tue, 24 Nov 2020 01:02:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 17:02:00 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/8] mhi: pci_generic: Add support for reset
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1606140666-4986-5-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
 <1606140666-4986-5-git-send-email-loic.poulain@linaro.org>
Message-ID: <cb248c4e1281ae368909f225b46e0710@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,
On 2020-11-23 06:11 AM, Loic Poulain wrote:
> Add support for resetting the device, reset can be triggered in case
> of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 117 
> +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 104 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c 
> b/drivers/bus/mhi/pci_generic.c
> index 0c07cf5..b48c382 100644
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
> @@ -179,6 +180,16 @@ static const struct pci_device_id 
> mhi_pci_id_table[] = {
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
> @@ -203,6 +214,20 @@ static inline void mhi_pci_reset(struct
> mhi_controller *mhi_cntrl)
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
> @@ -298,16 +323,18 @@ static int mhi_pci_probe(struct pci_dev *pdev,
> const struct pci_device_id *id)
>  {
>  	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *)
> id->driver_data;
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
Were you able to look in to using alloc/free APIs? We do want to mandate
these for any controller as they would read garbage serial/OEM PK HASH 
values
if they were to not abide by it and end up using kmalloc instead of 
kzalloc.

We understand you're using kzalloc but it still deviates from furthering 
our
recommendations of using exported APIs.
> 
>  	mhi_cntrl_config = info->config;
> +	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>  	mhi_cntrl->iova_start = 0;
>  	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> @@ -322,17 +349,21 @@ static int mhi_pci_probe(struct pci_dev *pdev,
> const struct pci_device_id *id)
> 
>  	err = mhi_pci_claim(mhi_cntrl, info->bar_num,
> DMA_BIT_MASK(info->dma_data_width));
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
> +	/* Have stored pci confspace at hand for restore in sudden PCI error 
> */
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
> @@ -347,37 +378,97 @@ static int mhi_pci_probe(struct pci_dev *pdev,
> const struct pci_device_id *id)
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
>  	/* MHI-layer reset could not be enough, always hard-reset the device 
> */
>  	mhi_pci_reset(mhi_cntrl);
> +}
> +
> +void mhi_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	dev_info(&pdev->dev, "reset\n");
> 
> -	mhi_free_controller(mhi_cntrl);
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
>  }
> 
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

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
