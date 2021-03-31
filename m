Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64D6350563
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 19:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhCaRX1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 13:23:27 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47713 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234382AbhCaRXZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 13:23:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617211405; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5zPrWlxFJHLDtc9SoIBmfqJpJkOSn1LpHhAgsB/5vG0=;
 b=PgpU/xHpv/ils7FpRE5pi77IA1DKe2DZ7YlaQdYFoP91+Nr9agTDVZzfp6LDfXhTnb2eRyBN
 YMXwvqNAPZfv6nLVLPao0N0pHeOymaU0NWq4lV5OFOFyM0BX+t5ja7Mh8Ncsr0aEbgpbdo/N
 3x+TjUxqtTjei1SJadRtoEm+2Pk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6064affa03cfff345268c719 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 17:23:06
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2690C43463; Wed, 31 Mar 2021 17:23:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA0B9C433C6;
        Wed, 31 Mar 2021 17:23:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 31 Mar 2021 10:23:04 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 2/2] bus: mhi: core: Move to polling method to wait for
 MHI ready
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210331130451.GJ15610@work>
References: <1617047583-12104-1-git-send-email-bbhatt@codeaurora.org>
 <1617047583-12104-3-git-send-email-bbhatt@codeaurora.org>
 <20210331130451.GJ15610@work>
Message-ID: <0ae6fde544fe67ea9b0a849026a344e2@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-31 06:04 AM, Manivannan Sadhasivam wrote:
> On Mon, Mar 29, 2021 at 12:53:03PM -0700, Bhaumik Bhatt wrote:
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
>>  drivers/bus/mhi/core/pm.c | 32 +++++++++++++++-----------------
>>  1 file changed, 15 insertions(+), 17 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 681960c..dcc7fe0 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -153,34 +153,32 @@ static void mhi_toggle_dev_wake(struct 
>> mhi_controller *mhi_cntrl)
>>  /* Handle device ready state transition */
>>  int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
>>  {
>> -	void __iomem *base = mhi_cntrl->regs;
>>  	struct mhi_event *mhi_event;
>>  	enum mhi_pm_state cur_state;
>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> -	u32 reset = 1, ready = 0;
>> +	u32 interval_us = 25000; /* poll register field every 25 
>> milliseconds */
>>  	int ret, i;
>> 
>> -	/* Wait for RESET to be cleared and READY bit to be set by the 
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
>>  	/* Check if device entered error state */
>>  	if (MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
>>  		dev_err(dev, "Device link is not accessible\n");
>>  		return -EIO;
>>  	}
>> 
>> -	/* Timeout if device did not transition to ready state */
>> -	if (reset || !ready) {
>> -		dev_err(dev, "Device Ready timeout\n");
>> +	/* Wait for RESET to be cleared and READY bit to be set by the 
>> device */
>> +	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
>> +				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
>> +				 interval_us);
>> +	if (ret) {
>> +		dev_err(dev, "Device failed to clear MHI Reset\n");
>> +		return -ETIMEDOUT;
> 
> You should return the actual error code since there are couple of error
> paths.
> 
> Thanks,
> Mani
> 
Sure. With the update on patch #1, this will be taken care of properly 
as we
return -ETIMEDOUT from the API.
>> +	}
>> +
>> +	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
>> +				 MHISTATUS_READY_MASK, MHISTATUS_READY_SHIFT, 1,
>> +				 interval_us);
>> +	if (ret) {
>> +		dev_err(dev, "Device failed to enter MHI Ready\n");
>>  		return -ETIMEDOUT;
>>  	}
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
