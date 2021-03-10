Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC2B33475C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 20:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhCJTDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 14:03:46 -0500
Received: from z11.mailgun.us ([104.130.96.11]:18225 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233257AbhCJTDp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 14:03:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615403025; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AS1sEDHBIO3sir+NX/hjk6/cywfpyrCpcdK5Am9+KhI=; b=j04Cr7/oLHjG4/lSDDmYPbBP4XACineLxu99WrGVwggTHOD9tg0Hrxr6MRYc4ZaakRvGHMPf
 NC+OqIbD42wgC8f4KhduQ7UG9ar2jwQtKW+p6ekILcXMlSJgpb6p3cQaL6GleaFh4j1QvIsX
 6v46sD4sCe/RKXQcYiNpO8vjx2M=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 604917dd0c7cf0f56cf38032 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 19:02:53
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF3E8C43463; Wed, 10 Mar 2021 19:02:52 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37CCEC433C6;
        Wed, 10 Mar 2021 19:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37CCEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 2/3] bus: mhi: core: Move to polling method to wait for
 MHI ready
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
References: <1614138270-2374-1-git-send-email-bbhatt@codeaurora.org>
 <1614138270-2374-3-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <df566e64-8335-2ab2-85c8-bed4ec5b649d@codeaurora.org>
Date:   Wed, 10 Mar 2021 12:02:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614138270-2374-3-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/23/2021 8:44 PM, Bhaumik Bhatt wrote:
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
>   drivers/bus/mhi/core/pm.c | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 681960c..5fe33d4 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -153,34 +153,31 @@ static void mhi_toggle_dev_wake(struct mhi_controller *mhi_cntrl)
>   /* Handle device ready state transition */
>   int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
>   {
> -	void __iomem *base = mhi_cntrl->regs;
>   	struct mhi_event *mhi_event;
>   	enum mhi_pm_state cur_state;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	u32 reset = 1, ready = 0;
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
> +	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
> +				 25000);
> +	if (ret) {
> +		dev_err(dev, "Device failed to clear MHI Reset\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
> +				 MHISTATUS_READY_MASK, MHISTATUS_READY_SHIFT, 1,
> +				 25000);

You use the magic number "25000" twice here.  Its my understanding that 
the preference is to inline a magic number if its used in one spot, but 
use a macro if its used more than that.

Both uses are confined to this function, and in close proximity, so 
chances that one gets updated without the other seem minimal, so this 
feels like a borderline case.  I don't know if Mani has an opinion here.

I'd probably err on the side of making a macro or a single variable.  If 
not, I think some comments explaining the value are warranted (should 
comment the macro as well).

> +	if (ret) {
> +		dev_err(dev, "Device failed to enter MHI Ready\n");
>   		return -ETIMEDOUT;
>   	}
>   
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
