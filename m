Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F5A2D7FD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 21:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgLKURU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 15:17:20 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:45909 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgLKUQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 15:16:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607717788; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sJ4VnYUri+EPbI48vwruplqhvQgDu3kPpD7R0zYj0bU=; b=g+ycPErlSsON/T1LVhm0aSnk6tAEV5+npxmy3xsuZcYS2NOyccacOQaxcN/CyHKy4kh4heRp
 zAHk0SDwNx69+np0lxu/2TV2jtmFjpzx/6+Vig2PI1Tl0qZK+ZAfdwnRLNyeqzyu5D0THGkX
 Mt/vZcKLmal1zj9aJOEMZO9Lgqs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fd3d36563480bb0d2340a47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Dec 2020 20:15:33
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6789BC433ED; Fri, 11 Dec 2020 20:15:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1702BC433CA;
        Fri, 11 Dec 2020 20:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1702BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v4 05/10] mhi: pci_generic: Add support for reset
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
 <1607594575-31590-6-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <35126c4f-fd60-9859-be8f-0529a0c392f5@codeaurora.org>
Date:   Fri, 11 Dec 2020 12:15:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607594575-31590-6-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Loic,
On 12/10/20 2:02 AM, Loic Poulain wrote:
> Add support for resetting the device, reset can be triggered in case
> of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/pci_generic.c | 120 +++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 107 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 077595c..d70d3ea 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -8,6 +8,7 @@
>    * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>    */
>   
> +#include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/mhi.h>
>   #include <linux/module.h>
> @@ -177,6 +178,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>   };
>   MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
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
>   static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
>   			    void __iomem *addr, u32 *out)
>   {
> @@ -196,6 +207,20 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>   	/* Nothing to do for now */
>   }
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
>   static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>   			 unsigned int bar_num, u64 dma_mask)
>   {
> @@ -291,16 +316,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   {
>   	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
>   	const struct mhi_controller_config *mhi_cntrl_config;
> +	struct mhi_pci_device *mhi_pdev;
>   	struct mhi_controller *mhi_cntrl;
>   	int err;
>   
>   	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>   
> -	mhi_cntrl = mhi_alloc_controller();
> -	if (!mhi_cntrl)
> +	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> +	if (!mhi_pdev)
>   		return -ENOMEM;
>   
>   	mhi_cntrl_config = info->config;
> +	mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	mhi_initialize_controller(mhi_cntrl);
>   	mhi_cntrl->cntrl_dev = &pdev->dev;
>   	mhi_cntrl->iova_start = 0;
>   	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> @@ -315,17 +344,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   
>   	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
>   	if (err)
> -		goto err_release;
> +		return err;
>   
>   	err = mhi_pci_get_irqs(mhi_cntrl, mhi_cntrl_config);
>   	if (err)
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
>   	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
>   	if (err)
> -		goto err_release;
> +		return err;
>   
>   	/* MHI bus does not power up the controller by default */
>   	err = mhi_prepare_for_power_up(mhi_cntrl);
> @@ -340,33 +373,94 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		goto err_unprepare;
>   	}
>   
> +	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +
>   	return 0;
>   
>   err_unprepare:
>   	mhi_unprepare_after_power_down(mhi_cntrl);
>   err_unregister:
>   	mhi_unregister_controller(mhi_cntrl);
> -err_release:
> -	mhi_free_controller(mhi_cntrl);
>   
>   	return err;
>   }
>   
>   static void mhi_pci_remove(struct pci_dev *pdev)
>   {
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
>   	mhi_unregister_controller(mhi_cntrl);
> -	mhi_free_controller(mhi_cntrl);
>   }
>   
> +void mhi_pci_reset_prepare(struct pci_dev *pdev)
any reason for not making it static ?
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
> +	mhi_reg_soc_reset(mhi_cntrl);
> +
> +	/* Be sure device reset has been executed */
> +	msleep(500);
one suggestion, since you are adding this support for any generic MHI 
controller, would it be good to make this configurable in case some 
devcices need mode time to complete reset?
> +}
> +
> +void mhi_pci_reset_done(struct pci_dev *pdev)
any reason for not making it static ?
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
>   static struct pci_driver mhi_pci_driver = {
>   	.name		= "mhi-pci-generic",
>   	.id_table	= mhi_pci_id_table,
>   	.probe		= mhi_pci_probe,
> -	.remove		= mhi_pci_remove
> +	.remove		= mhi_pci_remove,
> +	.err_handler	= &mhi_pci_err_handler,
>   };
>   module_pci_driver(mhi_pci_driver);
>   
> 
Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
