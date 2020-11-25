Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C164F2C4687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 18:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730960AbgKYRPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 12:15:09 -0500
Received: from z5.mailgun.us ([104.130.96.5]:37022 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730196AbgKYRPJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 12:15:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606324507; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YXVRMgeGAq56ftqaMYot552XoFlyGKYrN5XTa8ihQtI=; b=WsiBLdJsYPgnYX8qfWNjdpmG6fG+1nclWDnlEW8lboHVhT3L6tOYTOCzpe3nSNAXDTHlx4u4
 w3jNeNhbS1ffoYn6b2OEZ4k141rfzZZ5iOfp9Q6tl1xa1fggf9EoIfnxAQfpR4IT87O9Sv0q
 lDSdl9wppVhBtavtT2gOxiHSbv4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbe910f7e9d874dfc7681e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 17:14:55
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24B14C43461; Wed, 25 Nov 2020 17:14:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0F6FC433C6;
        Wed, 25 Nov 2020 17:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0F6FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Indexed MHI controller name
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <dc6e7a3e-5442-85b0-9672-8a71fe31d5f1@codeaurora.org>
Date:   Wed, 25 Nov 2020 10:14:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/25/2020 8:43 AM, Loic Poulain wrote:
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

Based on various discussions, I have no objections.  I think now is a 
good time to sort out this ABI.  However I do have one nit below.

> ---
>   drivers/bus/mhi/core/init.c | 16 +++++++++++++++-
>   drivers/bus/mhi/core/main.c |  2 +-
>   include/linux/mhi.h         |  2 ++
>   3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c7a7354..ecfffb0 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -8,6 +8,7 @@
>   #include <linux/device.h>
>   #include <linux/dma-direction.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/idr.h>
>   #include <linux/interrupt.h>
>   #include <linux/list.h>
>   #include <linux/mhi.h>
> @@ -18,6 +19,8 @@
>   #include <linux/wait.h>
>   #include "internal.h"
>   
> +static DEFINE_IDA(mhi_controller_ida);
> +
>   const char * const mhi_ee_str[MHI_EE_MAX] = {
>   	[MHI_EE_PBL] = "PBL",
>   	[MHI_EE_SBL] = "SBL",
> @@ -940,6 +943,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   	mhi_cntrl->minor_version = (soc_info & SOC_HW_VERSION_MINOR_VER_BMSK) >>
>   					SOC_HW_VERSION_MINOR_VER_SHFT;
>   
> +	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
> +	if (mhi_cntrl->index < 0) {
> +		ret = mhi_cntrl->index;
> +		goto error_ida_alloc;
> +	}
> +
>   	/* Register controller with MHI bus */
>   	mhi_dev = mhi_alloc_device(mhi_cntrl);
>   	if (IS_ERR(mhi_dev)) {
> @@ -950,7 +959,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   
>   	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
>   	mhi_dev->mhi_cntrl = mhi_cntrl;
> -	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->cntrl_dev));
> +	dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
>   	mhi_dev->name = dev_name(mhi_cntrl->cntrl_dev);
>   
>   	/* Init wakeup source */
> @@ -970,6 +979,9 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   	put_device(&mhi_dev->dev);
>   
>   error_alloc_dev:
> +	ida_free(&mhi_controller_ida, mhi_cntrl->index);
> +
> +error_ida_alloc:
>   	kfree(mhi_cntrl->mhi_cmd);
>   
>   error_alloc_cmd:
> @@ -1004,6 +1016,8 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>   
>   	device_del(&mhi_dev->dev);
>   	put_device(&mhi_dev->dev);
> +
> +	ida_free(&mhi_controller_ida, mhi_cntrl->index);
>   }
>   EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>   
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 188501c0..4818f42 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -349,7 +349,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>   		/* Channel name is same for both UL and DL */
>   		mhi_dev->name = mhi_chan->name;
>   		dev_set_name(&mhi_dev->dev, "%s_%s",
> -			     dev_name(mhi_cntrl->cntrl_dev),
> +			     dev_name(&mhi_cntrl->mhi_dev->dev),
>   			     mhi_dev->name);
>   
>   		/* Init wakeup source if available */
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 27078db..2a89533 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -297,6 +297,7 @@ struct mhi_controller_config {
>    * @cntrl_dev: Pointer to the struct device of physical bus acting as the MHI
>    *            controller (required)
>    * @mhi_dev: MHI device instance for the controller
> + * @index: Index of the MHI controller instance
>    * @debugfs_dentry: MHI controller debugfs directory
>    * @regs: Base address of MHI MMIO register space (required)
>    * @bhi: Points to base of MHI BHI register space
> @@ -377,6 +378,7 @@ struct mhi_controller_config {
>   struct mhi_controller {
>   	struct device *cntrl_dev;
>   	struct mhi_device *mhi_dev;
> +	int index;
>   	struct dentry *debugfs_dentry;
>   	void __iomem *regs;
>   	void __iomem *bhi;
> 

Is there a good reason to have this in the middle of the struct?  Seems 
like it would cause some padding because its a 32-bit value in the 
middle of a series of 64-bit values.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
