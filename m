Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C075E1A4B9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 23:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDJVkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 17:40:03 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63413 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726646AbgDJVkD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 17:40:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586554802; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=T37VHLlLldnIiGR1QAOhXo/GncEFS2PoFRvDQOtUStM=; b=i8Bl+laScGggK8sDBZeBlVLdFl5biWUmEfGV/UuNCUYIyn7icOZYRwj6RfYnXTnkj+HE9ZQO
 TNcxNxBiXu6SKK0vkXk82zXPD5eyLTeW+EWL0PUhHQ6aF0tsuUHiCKlggx/r9hH9bUivXhlR
 SDQT735mfnFMiCeVnZS0LrzCrRU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e90e7af.7f0d28081fb8-smtp-out-n01;
 Fri, 10 Apr 2020 21:39:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8083C433F2; Fri, 10 Apr 2020 21:39:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDBF0C433CB;
        Fri, 10 Apr 2020 21:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BDBF0C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
To:     Bhaumik Vasav Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     "linux-arm-msm@vger.kernel.org; bbhatt"@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
 <1768ba6e-12c2-7b4f-0f17-44fecc6473b9@codeaurora.org>
 <11d9f35b-b911-7985-8846-0a45904ceed1@codeaurora.org>
 <5c4efe13-42a4-e802-4070-5d9d30b8cac2@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <79feeb0b-0837-c5b6-087d-856c3e238c67@codeaurora.org>
Date:   Fri, 10 Apr 2020 15:39:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5c4efe13-42a4-e802-4070-5d9d30b8cac2@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/10/2020 2:37 PM, Bhaumik Vasav Bhatt wrote:
> Hi Jeff,
> 
> We will always have the mhi_intvec_handler registered and trigger your 
> wake_up state event when you write MHI RESET. BHI INTVEC IRQ using 
> mhi_cntrl->irq[0] is _not_ unregistered once you enter AMSS EE.

I understand it is not unregistered.  However mhi_cntrl->irq[0] may be 
reserved for BHI, and thus only exercised by PBL EE.  Where as, 
mhi_cntrl->irq[1..N] may be only exercised by AMSS EE. 
mhi_intvec_handler is not called in response to mhi_cntrl->irq[1..N].

Additionally, I re-reviewed the MHI spec, and I don't see where the spec 
requires the device to issue an interrupt upon completion of the RESET 
request.

Under section 3.5, step 11 states -

"The host must poll for the value of the RESET bit to detect the 
completion of the reset procedure by the device (RESET is set to 0)."

So, by this, my proposed solution appears to be spec compliant, where as 
what Hemant proposed is not.

> 
> So, your below assumption is not true:
>  >>>So, if we are in the PBL EE, we would expect to see the BHI 
> interrupt, but if we are in the AMSS EE, we would expect to see a MHI 
> interrupt.
> 
> At the start of mhi_async_power_up(), you've already registered for the 
> BHI interrupt as we do setup for IRQ and it is only unregistered from 
> power down if power up on the same cycle was a success.

You seem to have misunderstood my point.  If the BHI irq is only for BHI 
activity, which is activity restricted to the PBL EE, and the MHI 
interrupt(s) are restricted to MHI activity, which for the purposes of 
this discussion only occur in the AMSS EE, then my assumption is 
correct.  When the device is in PBL EE, we should only observe BHI irqs, 
and when the device is in AMSS EE, we should only observe MHI irqs.

This is a statement of what IRQ lines the device is raising, and not a 
statement of what handlers the host has, or has not registered.

Again, if the BHI irq is only generated in the PBL EE, and we rely on 
the BHI irq for "sensing" the state_event - we will never see the 
state_event in the AMSS EE, unless the same IRQ line is used for both 
MHI and BHI (which is only a select set of usecases, and not universal).

> 
> On 4/10/20 8:03 AM, Jeffrey Hugo wrote:
>> On 4/9/2020 6:55 PM, Hemant Kumar wrote:
>>>
>>> On 4/7/20 9:50 AM, Jeffrey Hugo wrote:
>>>> The MHI device may be in the syserr state when we attempt to init it in
>>>> power_up().  Since we have no local state, the handling is simple -
>>>> reset the device and wait for it to transition out of the reset state.
>>>>
>>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>> ---
>>>>   drivers/bus/mhi/core/pm.c | 20 ++++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>>>> index 52690cb..3285c9e 100644
>>>> --- a/drivers/bus/mhi/core/pm.c
>>>> +++ b/drivers/bus/mhi/core/pm.c
>>>> @@ -9,6 +9,7 @@
>>>>   #include <linux/dma-direction.h>
>>>>   #include <linux/dma-mapping.h>
>>>>   #include <linux/interrupt.h>
>>>> +#include <linux/iopoll.h>
>>>>   #include <linux/list.h>
>>>>   #include <linux/mhi.h>
>>>>   #include <linux/module.h>
>>>> @@ -760,6 +761,7 @@ static void mhi_deassert_dev_wake(struct 
>>>> mhi_controller *mhi_cntrl,
>>>>   int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>>>>   {
>>>> +    enum mhi_state state;
>>>>       enum mhi_ee_type current_ee;
>>>>       enum dev_st_transition next_state;
>>>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>> @@ -829,6 +831,24 @@ int mhi_async_power_up(struct mhi_controller 
>>>> *mhi_cntrl)
>>>>           goto error_bhi_offset;
>>>>       }
>>>> +    state = mhi_get_mhi_state(mhi_cntrl);
>>>> +    if (state == MHI_STATE_SYS_ERR) {
>>>> +        mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>>>> +        ret = readl_poll_timeout(mhi_cntrl->regs + MHICTRL, val,
>>>> +                     !(val & MHICTRL_RESET_MASK), 1000,
>>>> +                     mhi_cntrl->timeout_ms * 1000);
>>> can we use this instead of polling because MSI is configures and 
>>> int_vec handler is registered
>>>
>>>      wait_event_timeout(mhi_cntrl->state_event,
>>>                 MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
>>>                mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
>>>                            MHICTRL_RESET_MASK,
>>>                            MHICTRL_RESET_SHIFT, &reset) || !reset ,
>>>                 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>>
>>> 1) In case of MHI_PM_IN_FATAL_STATE we would not be accessing MHI reg
>>> 2) Consistent with current MHI driver code.
>>
>> I'm not sure this works in the way you intend.
>>
>> state_event is linked to the intvec, which is the BHI interrupt. I 
>> don't see that the state_event is triggered in the MHI interrupt path 
>> (mhi_irq_handler).  So, if we are in the PBL EE, we would expect to 
>> see the BHI interrupt, but if we are in the AMSS EE, we would expect 
>> to see a MHI interrupt.
>>
>> Now, for my concerned usecase, those two interrupts happen to be the 
>> same interrupt, so both will get triggered, but I don't expect that to 
>> be the same for all usecases.
>>
>> So, with the solution I propose, we exit the wait (poll loop) as soon 
>> as we see the register change values.
>>
>> With the solution you propose, if we only get the MHI interrupt, we'll 
>> have to wait out the entire timeout value, and then check the 
>> register. In this scenario, we are almost guaranteed to wait for 
>> longer than necessary.
>>
>> Did I miss something?
>>
>>>> +        if (ret) {
>>>> +            dev_info(dev, "Failed to reset MHI due to syserr 
>>>> state\n");
>>>> +            goto error_bhi_offset;
>>>> +        }
>>>> +
>>>> +        /*
>>>> +         * device cleares INTVEC as part of RESET processing,
>>>> +         * re-program it
>>>> +         */
>>>> +        mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>>>> +    }
>>>> +
>>>>       /* Transition to next state */
>>>>       next_state = MHI_IN_PBL(current_ee) ?
>>>>           DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
>>>
>>
>>


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
