Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEAF2D4AED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 20:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387994AbgLITtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 14:49:19 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:42798 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733111AbgLITtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 14:49:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607543323; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BDsqBtsR+tJlXw/x5FPrFdURybZlwARsyz23aASsQNI=; b=Q+UdnsqxtsE9NgXbzDQLQ7EzPDxoigS6USwHAGrvkQIh3dilHEqi6lwYuZ1b6zcdgRiUfA4G
 dih/V7Frm3Bl6iJaMIsbr8NDXNoI3WG3JRHUyni5B6dt/Daf6nPLTRGpRupJFph6ty07/SCQ
 ns4MKOA2yDEiF9wtknAJ4qRGExg=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fd129f8c62570206cbbf4d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Dec 2020 19:48:08
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCAECC43463; Wed,  9 Dec 2020 19:48:07 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2874C433C6;
        Wed,  9 Dec 2020 19:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2874C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] mhi: use irq_flags if client driver configures it
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Carl Huang <cjhuang@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201208035500.30581-1-cjhuang@codeaurora.org>
 <fad48bcd-df5d-40e3-9d63-b45adb998445@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <bf5409bb-adaf-d2ad-8606-cd8a3df8bc5b@codeaurora.org>
Date:   Wed, 9 Dec 2020 12:48:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <fad48bcd-df5d-40e3-9d63-b45adb998445@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/9/2020 11:34 AM, Hemant Kumar wrote:
> 
> 
> On 12/7/20 7:55 PM, Carl Huang wrote:
>> If client driver has specified the irq_flags, mhi uses this specified
>> irq_flags. Otherwise, mhi uses default irq_flags.
>>
>> The purpose of this change is to support one MSI vector for QCA6390.
>> MHI will use one same MSI vector too in this scenario.
>>
>> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
>> is requested. The reason is if irq migration happens, the msi_data may
>> change too. However, the msi_data is already programmed to QCA6390
>> hardware during initialization phase. This msi_data inconsistence will
>> result in crash in kernel.

I'm confused as to how this happens.

>>
>> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
>> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
>>
>> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
>> of one MSI vector when mhi_register_controller is called.

Surely this change should be in a series where there is a following 
change which updates the QCA6390 driver?

>>
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/init.c | 9 +++++++--
>>   include/linux/mhi.h         | 1 +
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 0ffdebd..5f74e1e 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller 
>> *mhi_cntrl)
>>   {
>>       struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +    unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>>       int i, ret;
>> +    /* if client driver has set irq_flags, use it */
>> +    if (mhi_cntrl->irq_flags)
>> +        irq_flags = mhi_cntrl->irq_flags;
> Jeff if i remember correctly your use case also have one dedicated irq 
> line for all the MSIs, just want to confirm if you are fine with this 
> change ? i was wondering if any input check is required for irq_flags 
> passed by controller, or responsibility is on controller for any 
> undesired behavior. Like passing IRQF_SHARED and IRQF_ONESHOT when one 
> irq line is shared among multiple MSIs.

This feels a bit weird to me, but I don't think it'll cause a problem.

If we are allowing the controller to specify flags, should they be in a 
per irq manner?

>> +
>>       /* Setup BHI_INTVEC IRQ */
>>       ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>>                      mhi_intvec_threaded_handler,
>> -                   IRQF_SHARED | IRQF_NO_SUSPEND,
>> +                   irq_flags,
>>                      "bhi", mhi_cntrl);
>>       if (ret)
>>           return ret;
>> @@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller 
>> *mhi_cntrl)
>>           ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>>                     mhi_irq_handler,
>> -                  IRQF_SHARED | IRQF_NO_SUSPEND,
>> +                  irq_flags,
>>                     "mhi", mhi_event);
>>           if (ret) {
>>               dev_err(dev, "Error requesting irq:%d for ev:%d\n",
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index d4841e5..f039e58 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -442,6 +442,7 @@ struct mhi_controller {
>>       bool fbc_download;
>>       bool pre_init;
>>       bool wake_set;
>> +    unsigned long irq_flags;

You don't document this.  That gets a NACK from me.

>>   };
>>   /**
>>
> 
> Thanks,
> Hemant
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
