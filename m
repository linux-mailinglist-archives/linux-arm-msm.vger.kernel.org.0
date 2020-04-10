Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB3B1A4B2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 22:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDJUhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 16:37:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41799 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgDJUhr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 16:37:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586551066; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=T2fbWw6zwXJ0P7g5074NZ7pZhPP1gkSEW7pXyoFPiWI=; b=wbHk6/Mk627O3eeaie91wjnvw6GSTustQ3aWk4IeztSKqoWUgwZnYIhP6v8aGjUeBT688HGs
 tayKi7wMOsWvNU0dCqqRXiCvRi3O9F0U7K/ClRvu57RKCoWU7p8hTB4XeZLC9tNsbM8m3dY6
 bKHYiZuPu3eabQ8y1wE+xHpMxrU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e90d913.7f9519aa0ce0-smtp-out-n02;
 Fri, 10 Apr 2020 20:37:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8660C433BA; Fri, 10 Apr 2020 20:37:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.179] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC14EC433F2;
        Fri, 10 Apr 2020 20:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC14EC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
Subject: Re: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     "linux-arm-msm@vger.kernel.org; bbhatt"@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
 <1768ba6e-12c2-7b4f-0f17-44fecc6473b9@codeaurora.org>
 <11d9f35b-b911-7985-8846-0a45904ceed1@codeaurora.org>
From:   Bhaumik Vasav Bhatt <bbhatt@codeaurora.org>
Message-ID: <5c4efe13-42a4-e802-4070-5d9d30b8cac2@codeaurora.org>
Date:   Fri, 10 Apr 2020 13:37:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <11d9f35b-b911-7985-8846-0a45904ceed1@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff,

We will always have the mhi_intvec_handler registered and trigger your 
wake_up state event when you write MHI RESET. BHI INTVEC IRQ using 
mhi_cntrl->irq[0] is _not_ unregistered once you enter AMSS EE.

So, your below assumption is not true:
 >>>So, if we are in the PBL EE, we would expect to see the BHI 
interrupt, but if we are in the AMSS EE, we would expect to see a MHI 
interrupt.

At the start of mhi_async_power_up(), you've already registered for the 
BHI interrupt as we do setup for IRQ and it is only unregistered from 
power down if power up on the same cycle was a success.

On 4/10/20 8:03 AM, Jeffrey Hugo wrote:
> On 4/9/2020 6:55 PM, Hemant Kumar wrote:
>>
>> On 4/7/20 9:50 AM, Jeffrey Hugo wrote:
>>> The MHI device may be in the syserr state when we attempt to init it in
>>> power_up().  Since we have no local state, the handling is simple -
>>> reset the device and wait for it to transition out of the reset state.
>>>
>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>> ---
>>>   drivers/bus/mhi/core/pm.c | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>>> index 52690cb..3285c9e 100644
>>> --- a/drivers/bus/mhi/core/pm.c
>>> +++ b/drivers/bus/mhi/core/pm.c
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/dma-direction.h>
>>>   #include <linux/dma-mapping.h>
>>>   #include <linux/interrupt.h>
>>> +#include <linux/iopoll.h>
>>>   #include <linux/list.h>
>>>   #include <linux/mhi.h>
>>>   #include <linux/module.h>
>>> @@ -760,6 +761,7 @@ static void mhi_deassert_dev_wake(struct 
>>> mhi_controller *mhi_cntrl,
>>>   int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>>>   {
>>> +    enum mhi_state state;
>>>       enum mhi_ee_type current_ee;
>>>       enum dev_st_transition next_state;
>>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>> @@ -829,6 +831,24 @@ int mhi_async_power_up(struct mhi_controller 
>>> *mhi_cntrl)
>>>           goto error_bhi_offset;
>>>       }
>>> +    state = mhi_get_mhi_state(mhi_cntrl);
>>> +    if (state == MHI_STATE_SYS_ERR) {
>>> +        mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>>> +        ret = readl_poll_timeout(mhi_cntrl->regs + MHICTRL, val,
>>> +                     !(val & MHICTRL_RESET_MASK), 1000,
>>> +                     mhi_cntrl->timeout_ms * 1000);
>> can we use this instead of polling because MSI is configures and 
>> int_vec handler is registered
>>
>>      wait_event_timeout(mhi_cntrl->state_event,
>>                 MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
>>                mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
>>                            MHICTRL_RESET_MASK,
>>                            MHICTRL_RESET_SHIFT, &reset) || !reset ,
>>                 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>
>> 1) In case of MHI_PM_IN_FATAL_STATE we would not be accessing MHI reg
>> 2) Consistent with current MHI driver code.
>
> I'm not sure this works in the way you intend.
>
> state_event is linked to the intvec, which is the BHI interrupt. I 
> don't see that the state_event is triggered in the MHI interrupt path 
> (mhi_irq_handler).  So, if we are in the PBL EE, we would expect to 
> see the BHI interrupt, but if we are in the AMSS EE, we would expect 
> to see a MHI interrupt.
>
> Now, for my concerned usecase, those two interrupts happen to be the 
> same interrupt, so both will get triggered, but I don't expect that to 
> be the same for all usecases.
>
> So, with the solution I propose, we exit the wait (poll loop) as soon 
> as we see the register change values.
>
> With the solution you propose, if we only get the MHI interrupt, we'll 
> have to wait out the entire timeout value, and then check the 
> register. In this scenario, we are almost guaranteed to wait for 
> longer than necessary.
>
> Did I miss something?
>
>>> +        if (ret) {
>>> +            dev_info(dev, "Failed to reset MHI due to syserr 
>>> state\n");
>>> +            goto error_bhi_offset;
>>> +        }
>>> +
>>> +        /*
>>> +         * device cleares INTVEC as part of RESET processing,
>>> +         * re-program it
>>> +         */
>>> +        mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>>> +    }
>>> +
>>>       /* Transition to next state */
>>>       next_state = MHI_IN_PBL(current_ee) ?
>>>           DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
>>
>
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
