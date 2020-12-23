Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF732E17C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 04:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgLWDb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 22:31:57 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:32872 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbgLWDb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 22:31:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608694292; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7Rb04fxp2Vgu3LQSPVrNWPRozHdROabaDrF5ER6ENj8=;
 b=CgtMveOzGDQf2SDuDravYXdyjSizGpnWufcfw8Vcfy1j0nHWGqUg49aGIdyv4EtwwfqW/AzF
 CB/4BAzFRmIlz71c0uIl27SkpGWKjuV2QdtqL7WwVPGUhBE2Z55xukC30Ye5vsVlYRfqBcGg
 WVHqdbd77x6dRj/WNpi3M81Wk6Y=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fe2b9f6120d248bb52c6dd3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:31:02
 GMT
Sender: cjhuang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1D8CC43463; Wed, 23 Dec 2020 03:31:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cjhuang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA5C5C433CA;
        Wed, 23 Dec 2020 03:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 23 Dec 2020 11:31:00 +0800
From:   Carl Huang <cjhuang@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mhi: use irq_flags if client driver configures it
In-Reply-To: <bf5409bb-adaf-d2ad-8606-cd8a3df8bc5b@codeaurora.org>
References: <20201208035500.30581-1-cjhuang@codeaurora.org>
 <fad48bcd-df5d-40e3-9d63-b45adb998445@codeaurora.org>
 <bf5409bb-adaf-d2ad-8606-cd8a3df8bc5b@codeaurora.org>
Message-ID: <c38e91d7d27b8cc6a6da35a3782d6144@codeaurora.org>
X-Sender: cjhuang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-10 03:48, Jeffrey Hugo wrote:
> On 12/9/2020 11:34 AM, Hemant Kumar wrote:
>> 
>> 
>> On 12/7/20 7:55 PM, Carl Huang wrote:
>>> If client driver has specified the irq_flags, mhi uses this specified
>>> irq_flags. Otherwise, mhi uses default irq_flags.
>>> 
>>> The purpose of this change is to support one MSI vector for QCA6390.
>>> MHI will use one same MSI vector too in this scenario.
>>> 
>>> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq 
>>> handler
>>> is requested. The reason is if irq migration happens, the msi_data 
>>> may
>>> change too. However, the msi_data is already programmed to QCA6390
>>> hardware during initialization phase. This msi_data inconsistence 
>>> will
>>> result in crash in kernel.
> 
> I'm confused as to how this happens.
> 
Host needs to program msi_data to QCA6390 hardware components(lots of 
standard
rings), and this msi_data is used to generate MSI interrupt.  If kernel 
has
re-assigned msi_data to QCA6390 when irq migration happens, and this 
re-assigned
msi_data is written to QCA6390 PCIe config space only, standard rings 
still use
previous msi_data.


>>> 
>>> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will 
>>> trigger
>>> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
>>> 
>>> To avoid above two issues, QCA6390 driver specifies the irq_flags in 
>>> case
>>> of one MSI vector when mhi_register_controller is called.
> 
> Surely this change should be in a series where there is a following
> change which updates the QCA6390 driver?
> 
Yes. This patch involves MHI module, so send it separately.
There is another patch set for QCA6390 to support one MSI vector.

>>> 
>>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>>> ---
>>>   drivers/bus/mhi/core/init.c | 9 +++++++--
>>>   include/linux/mhi.h         | 1 +
>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/drivers/bus/mhi/core/init.c 
>>> b/drivers/bus/mhi/core/init.c
>>> index 0ffdebd..5f74e1e 100644
>>> --- a/drivers/bus/mhi/core/init.c
>>> +++ b/drivers/bus/mhi/core/init.c
>>> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller 
>>> *mhi_cntrl)
>>>   {
>>>       struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>> +    unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>>>       int i, ret;
>>> +    /* if client driver has set irq_flags, use it */
>>> +    if (mhi_cntrl->irq_flags)
>>> +        irq_flags = mhi_cntrl->irq_flags;
>> Jeff if i remember correctly your use case also have one dedicated irq 
>> line for all the MSIs, just want to confirm if you are fine with this 
>> change ? i was wondering if any input check is required for irq_flags 
>> passed by controller, or responsibility is on controller for any 
>> undesired behavior. Like passing IRQF_SHARED and IRQF_ONESHOT when one 
>> irq line is shared among multiple MSIs.
> 
> This feels a bit weird to me, but I don't think it'll cause a problem.
> 
> If we are allowing the controller to specify flags, should they be in
> a per irq manner?
> 
Not sure if per irq manner is needed for others, but ath11k doesn't need
per irq manner.

>>> +
>>>       /* Setup BHI_INTVEC IRQ */
>>>       ret = request_threaded_irq(mhi_cntrl->irq[0], 
>>> mhi_intvec_handler,
>>>                      mhi_intvec_threaded_handler,
>>> -                   IRQF_SHARED | IRQF_NO_SUSPEND,
>>> +                   irq_flags,
>>>                      "bhi", mhi_cntrl);
>>>       if (ret)
>>>           return ret;
>>> @@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller 
>>> *mhi_cntrl)
>>>           ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>>>                     mhi_irq_handler,
>>> -                  IRQF_SHARED | IRQF_NO_SUSPEND,
>>> +                  irq_flags,
>>>                     "mhi", mhi_event);
>>>           if (ret) {
>>>               dev_err(dev, "Error requesting irq:%d for ev:%d\n",
>>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>>> index d4841e5..f039e58 100644
>>> --- a/include/linux/mhi.h
>>> +++ b/include/linux/mhi.h
>>> @@ -442,6 +442,7 @@ struct mhi_controller {
>>>       bool fbc_download;
>>>       bool pre_init;
>>>       bool wake_set;
>>> +    unsigned long irq_flags;
> 
> You don't document this.  That gets a NACK from me.
> 
Yes, will document this field in V2.

>>>   };
>>>   /**
>>> 
>> 
>> Thanks,
>> Hemant
>> 
