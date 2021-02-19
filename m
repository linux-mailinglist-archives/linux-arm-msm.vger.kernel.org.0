Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADABE31FE87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 19:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhBSSG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 13:06:59 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:61065 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229743AbhBSSG5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 13:06:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613757991; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kXbF7w0R9PC06ofMJ92nb80MCqGt/jkEAMA0b9SbA00=;
 b=uy3lYVFqYnTiJG/0IQEaoNeok38RGboykEgrqLZnnFgzAR6QAGBPxVzTK5v7SeBYXnM6M7uA
 zJyxNu+kTaI8MwWn4pOOCbG+y8j0AdFuqs0bCgiPCOAFssBIsR2m8k6Hw+qZ1xpJ6riINqnp
 RHV4EmNyZPHfV4Upjg9NGc01j5g=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 602ffe04f33d74123f82e357 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 18:05:56
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C8C1C43462; Fri, 19 Feb 2021 18:05:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76657C433CA;
        Fri, 19 Feb 2021 18:05:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Feb 2021 10:05:54 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Move to polling method to wait for MHI
 ready
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <3071a65e-8ab2-8e88-e87e-50c71602904c@codeaurora.org>
References: <1613701126-38995-1-git-send-email-bbhatt@codeaurora.org>
 <3071a65e-8ab2-8e88-e87e-50c71602904c@codeaurora.org>
Message-ID: <74842b01810974326cbbbd718a77f98d@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-19 06:55 AM, Jeffrey Hugo wrote:
> On 2/18/2021 7:18 PM, Bhaumik Bhatt wrote:
>> In certain devices, it is likely that there is no incoming MHI
>> interrupt for a transition to MHI READY state. One such example
>> is the move from Pass Through to an SBL or AMSS execution
>> environment. In order to facilitate faster bootup times as there
>> is no need to wait until timeout_ms completes, MHI host can poll
>> every 25 milliseconds to check if device has entered MHI READY
>> until a maximum timeout of twice the timeout_ms is reached.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/pm.c | 32 ++++++++++++++++----------------
>>   1 file changed, 16 insertions(+), 16 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 65ebca8..ec0060c 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/dma-direction.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/interrupt.h>
>> +#include <linux/iopoll.h>
>>   #include <linux/list.h>
>>   #include <linux/mhi.h>
>>   #include <linux/module.h>
>> @@ -157,30 +158,29 @@ int mhi_ready_state_transition(struct 
>> mhi_controller *mhi_cntrl)
>>   	struct mhi_event *mhi_event;
>>   	enum mhi_pm_state cur_state;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> -	u32 reset = 1, ready = 0;
>> +	u32 reset, ready;
>>   	int ret, i;
>>   -	/* Wait for RESET to be cleared and READY bit to be set by the 
>> device */
>> -	wait_event_timeout(mhi_cntrl->state_event,
>> -			   MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
>> -			   mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
>> -					      MHICTRL_RESET_MASK,
>> -					      MHICTRL_RESET_SHIFT, &reset) ||
>> -			   mhi_read_reg_field(mhi_cntrl, base, MHISTATUS,
>> -					      MHISTATUS_READY_MASK,
>> -					      MHISTATUS_READY_SHIFT, &ready) ||
>> -			   (!reset && ready),
>> -			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
>> -
>>   	/* Check if device entered error state */
>>   	if (MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
>>   		dev_err(dev, "Device link is not accessible\n");
>>   		return -EIO;
>>   	}
>>   -	/* Timeout if device did not transition to ready state */
>> -	if (reset || !ready) {
>> -		dev_err(dev, "Device Ready timeout\n");
>> +	/* Wait for RESET to be cleared and READY bit to be set by the 
>> device */
>> +	ret = readl_relaxed_poll_timeout(base + MHICTRL, reset,
>> +					 !(reset & MHICTRL_RESET_MASK), 25000,
>> +					 mhi_cntrl->timeout_ms * 1000);
>> +	if (ret) {
>> +		dev_err(dev, "Device failed to clear MHI Reset\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	ret = readl_relaxed_poll_timeout(base + MHISTATUS, ready,
>> +					 (ready & MHISTATUS_READY_MASK), 25000,
>> +					 mhi_cntrl->timeout_ms * 1000);
>> +	if (ret) {
>> +		dev_err(dev, "Device failed to enter MHI Ready\n");
>>   		return -ETIMEDOUT;
>>   	}
>> 
> 
> I think this gets a NACK from me.
> 
> mhi_read_reg_field() uses the controller defined accessor method
> read_reg().  readl_relaxed_poll_timeout() does not.  If, say, MHI was
> implemented over I2C, direct readl() accesses wouldn't be valid, and
> this would break.
> 
> Also, if the link ever goes down in the middle if the timeout, the
> controller read_reg() should detect that, but
> readl_relaxed_poll_timeout() would not.
> 
> I'm fine with this concept, but I think the implementation needs to be 
> adjusted.
I agree. I will think on this and plan it around the controller defined 
method.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
