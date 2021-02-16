Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D06031CF24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhBPRgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:36:55 -0500
Received: from z11.mailgun.us ([104.130.96.11]:12878 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230402AbhBPRgx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:36:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613496992; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pC9G+BUvCiISFv2MlIldVCc/lXBCwMTeGgdEzuGGba0=;
 b=pN4SOnQ9PGPRZ63qZrFdJQSmzOhOrBAOtOVF4RAxHJ2XmhCvDSU+hL3q6UuCJxX7wTPlkwvn
 ejYM0mVrJjOWlne+8Tgj9uJF3wOVxz1KADpUIBKp17su68WcLI24yDdQXMfL/+Il8M/EfhVC
 uKHxN/IusWsuBw1FeknZfFedvS0=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602c0286fe1d39643850d91f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 17:36:06
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 062F7C43461; Tue, 16 Feb 2021 17:36:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 431A7C433C6;
        Tue, 16 Feb 2021 17:36:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Feb 2021 09:36:05 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler for
 syserr
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210216073228.GD5082@thinkpad>
References: <1613176814-29171-1-git-send-email-jhugo@codeaurora.org>
 <20210216073228.GD5082@thinkpad>
Message-ID: <478ca42796c2a049cdbead6900d1b489@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-15 11:32 PM, Manivannan Sadhasivam wrote:
> On Fri, Feb 12, 2021 at 05:40:14PM -0700, Jeffrey Hugo wrote:
>> The intvec handler stores the caches ee in a local variable for use in
>> processing the intvec.  When determining if a syserr is a fatal error 
>> or
>> not, the intvec handler is using the cached version, when it should be
>> using the current ee read from the device.  Currently, the device 
>> could
>> be in the PBL ee as the result of a fatal error, but the cached ee 
>> might
>> be AMSS, which would cause the intvec handler to incorrectly signal a
>> non-fatal syserr.
>> 
>> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM 
>> operations")
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
>> ---
>>  drivers/bus/mhi/core/main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 4e0131b..f182736 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -448,7 +448,7 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>> irq_number, void *priv)
>>  		wake_up_all(&mhi_cntrl->state_event);
>> 
>>  		/* For fatal errors, we let controller decide next step */
>> -		if (MHI_IN_PBL(ee))
>> +		if (MHI_IN_PBL(mhi_cntrl->ee))
>>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>>  		else
>>  			mhi_pm_sys_err_handler(mhi_cntrl);
>> --
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>> 

This was being fixed by my patch series for execution environment.

I should just send the most important of my patches as one line fixers 
from now on.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
