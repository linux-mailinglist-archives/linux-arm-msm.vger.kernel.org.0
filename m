Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EB831FB71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 15:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhBSO41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 09:56:27 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:55472 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhBSO40 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 09:56:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613746563; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8FZEp2OZfVO47LVdb5u4zBEqXzFcNcGsWdEeX5D0hk4=; b=qOGAPlhR682y5siot1x+tXoNIikzCgTO3lb9kUzOmUsxQEmLhfGhbx3spVHzLGRgpsbFGiXo
 tFcEo4ZzHSXlPU8/fH7EU4pRxdVRqU6Do62pYEbVoNDwp9DfNgIvSZS3s3EhW19bMq2y2zSc
 gIKCTFKBghhsByFRIN4s43iiscM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 602fd1654511108a8105d4c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 14:55:33
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD97BC433C6; Fri, 19 Feb 2021 14:55:32 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36D14C433C6;
        Fri, 19 Feb 2021 14:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36D14C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Move to polling method to wait for MHI
 ready
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
References: <1613701126-38995-1-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <3071a65e-8ab2-8e88-e87e-50c71602904c@codeaurora.org>
Date:   Fri, 19 Feb 2021 07:55:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613701126-38995-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/18/2021 7:18 PM, Bhaumik Bhatt wrote:
> In certain devices, it is likely that there is no incoming MHI
> interrupt for a transition to MHI READY state. One such example
> is the move from Pass Through to an SBL or AMSS execution
> environment. In order to facilitate faster bootup times as there
> is no need to wait until timeout_ms completes, MHI host can poll
> every 25 milliseconds to check if device has entered MHI READY
> until a maximum timeout of twice the timeout_ms is reached.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/pm.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 65ebca8..ec0060c 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -9,6 +9,7 @@
>   #include <linux/dma-direction.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>   #include <linux/list.h>
>   #include <linux/mhi.h>
>   #include <linux/module.h>
> @@ -157,30 +158,29 @@ int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
>   	struct mhi_event *mhi_event;
>   	enum mhi_pm_state cur_state;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	u32 reset = 1, ready = 0;
> +	u32 reset, ready;
>   	int ret, i;
>   
> -	/* Wait for RESET to be cleared and READY bit to be set by the device */
> -	wait_event_timeout(mhi_cntrl->state_event,
> -			   MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
> -			   mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
> -					      MHICTRL_RESET_MASK,
> -					      MHICTRL_RESET_SHIFT, &reset) ||
> -			   mhi_read_reg_field(mhi_cntrl, base, MHISTATUS,
> -					      MHISTATUS_READY_MASK,
> -					      MHISTATUS_READY_SHIFT, &ready) ||
> -			   (!reset && ready),
> -			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -
>   	/* Check if device entered error state */
>   	if (MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
>   		dev_err(dev, "Device link is not accessible\n");
>   		return -EIO;
>   	}
>   
> -	/* Timeout if device did not transition to ready state */
> -	if (reset || !ready) {
> -		dev_err(dev, "Device Ready timeout\n");
> +	/* Wait for RESET to be cleared and READY bit to be set by the device */
> +	ret = readl_relaxed_poll_timeout(base + MHICTRL, reset,
> +					 !(reset & MHICTRL_RESET_MASK), 25000,
> +					 mhi_cntrl->timeout_ms * 1000);
> +	if (ret) {
> +		dev_err(dev, "Device failed to clear MHI Reset\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = readl_relaxed_poll_timeout(base + MHISTATUS, ready,
> +					 (ready & MHISTATUS_READY_MASK), 25000,
> +					 mhi_cntrl->timeout_ms * 1000);
> +	if (ret) {
> +		dev_err(dev, "Device failed to enter MHI Ready\n");
>   		return -ETIMEDOUT;
>   	}
>   
> 

I think this gets a NACK from me.

mhi_read_reg_field() uses the controller defined accessor method 
read_reg().  readl_relaxed_poll_timeout() does not.  If, say, MHI was 
implemented over I2C, direct readl() accesses wouldn't be valid, and 
this would break.

Also, if the link ever goes down in the middle if the timeout, the 
controller read_reg() should detect that, but 
readl_relaxed_poll_timeout() would not.

I'm fine with this concept, but I think the implementation needs to be 
adjusted.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
