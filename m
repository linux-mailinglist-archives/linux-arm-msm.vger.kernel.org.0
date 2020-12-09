Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265432D491B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 19:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731508AbgLISfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 13:35:25 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:49996 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732477AbgLISfU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 13:35:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607538896; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=2VXdqkWPjse+TMyhrZNpHaMaDvfIr0uDnQt4ohm7ZGc=; b=oA1IUhABl+kwgv/Q8b1me+BMMT8EzjcAz2tR/DFnUe2JrqhuBgGfmKq0cuIn/gOV7y/IMcvJ
 p0++tMgbKrOoKE2EgJhq6KdrsWKK+dw90UPsdwNrmTp6QWuZYJQS84cIJw+ebu6gRi7eeLhB
 dkJvN3zuga6XDLGy2f7eN39sKw8=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fd118b0b261d6f601ce2c05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Dec 2020 18:34:24
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF191C433C6; Wed,  9 Dec 2020 18:34:23 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06DC3C433CA;
        Wed,  9 Dec 2020 18:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06DC3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] mhi: use irq_flags if client driver configures it
To:     Carl Huang <cjhuang@codeaurora.org>,
        manivannan.sadhasivam@linaro.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201208035500.30581-1-cjhuang@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <fad48bcd-df5d-40e3-9d63-b45adb998445@codeaurora.org>
Date:   Wed, 9 Dec 2020 10:34:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208035500.30581-1-cjhuang@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/7/20 7:55 PM, Carl Huang wrote:
> If client driver has specified the irq_flags, mhi uses this specified
> irq_flags. Otherwise, mhi uses default irq_flags.
> 
> The purpose of this change is to support one MSI vector for QCA6390.
> MHI will use one same MSI vector too in this scenario.
> 
> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
> is requested. The reason is if irq migration happens, the msi_data may
> change too. However, the msi_data is already programmed to QCA6390
> hardware during initialization phase. This msi_data inconsistence will
> result in crash in kernel.
> 
> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
> 
> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
> of one MSI vector when mhi_register_controller is called.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> ---
>   drivers/bus/mhi/core/init.c | 9 +++++++--
>   include/linux/mhi.h         | 1 +
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 0ffdebd..5f74e1e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   {
>   	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>   	int i, ret;
>   
> +	/* if client driver has set irq_flags, use it */
> +	if (mhi_cntrl->irq_flags)
> +		irq_flags = mhi_cntrl->irq_flags;
Jeff if i remember correctly your use case also have one dedicated irq 
line for all the MSIs, just want to confirm if you are fine with this 
change ? i was wondering if any input check is required for irq_flags 
passed by controller, or responsibility is on controller for any 
undesired behavior. Like passing IRQF_SHARED and IRQF_ONESHOT when one 
irq line is shared among multiple MSIs.
> +
>   	/* Setup BHI_INTVEC IRQ */
>   	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>   				   mhi_intvec_threaded_handler,
> -				   IRQF_SHARED | IRQF_NO_SUSPEND,
> +				   irq_flags,
>   				   "bhi", mhi_cntrl);
>   	if (ret)
>   		return ret;
> @@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   
>   		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>   				  mhi_irq_handler,
> -				  IRQF_SHARED | IRQF_NO_SUSPEND,
> +				  irq_flags,
>   				  "mhi", mhi_event);
>   		if (ret) {
>   			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d4841e5..f039e58 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -442,6 +442,7 @@ struct mhi_controller {
>   	bool fbc_download;
>   	bool pre_init;
>   	bool wake_set;
> +	unsigned long irq_flags;
>   };
>   
>   /**
> 

Thanks,
Hemant

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
