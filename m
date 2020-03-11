Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BACE1810D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 07:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCKGgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 02:36:17 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52167 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725958AbgCKGgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 02:36:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583908576; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=6rpMHZI487eFJA4pa22jpQQCj3zTOUqIIey6GsTDpHk=; b=KLAvLbQ4E2zGv6cMeWASreOrywVV8sDgcrHJZodZL+Sm4Sr8LMiUMfZKItceDqy///FdYEaE
 S+y2hGIpD0Kni2otjfO39oNIfRhx7LfJGz5iMcdxrtuTWEU6/UFcTf2mtGj5j/sp6o9xj4GA
 Ojc8nVjB0TS3amKbcZHklQWhIxE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6886dd.7f0701a46998-smtp-out-n02;
 Wed, 11 Mar 2020 06:36:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27E2EC433CB; Wed, 11 Mar 2020 06:36:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70122C433D2;
        Wed, 11 Mar 2020 06:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70122C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v13 4/5] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
 <1583746236-13325-5-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
 <8810b558-f552-19dc-a5dc-4e64b37f35d8@codeaurora.org>
 <CAD=FV=XajZ5V_uZryghaBkH=4jv4T-ifuQE2NKbU4RgNVho_9A@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e7723b03-ce7e-ff4b-e2b4-3d93f970748c@codeaurora.org>
Date:   Wed, 11 Mar 2020 12:06:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XajZ5V_uZryghaBkH=4jv4T-ifuQE2NKbU4RgNVho_9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/10/2020 9:16 PM, Doug Anderson wrote:
> Hi,
>
> On Tue, Mar 10, 2020 at 4:19 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>
>> On 3/10/2020 5:13 AM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>>> Add changes to invoke rpmh flush() from within cache_lock when the data in
>>>> cache is dirty.
>>>>
>>>> Introduce two new APIs for this. Clients can use rpmh_start_transaction()
>>>> before any rpmh transaction once done invoke rpmh_end_transaction() which
>>>> internally invokes rpmh_flush() if the caches has become dirty.
>>>>
>>>> Add support to control this with flush_dirty flag.
>>>>
>>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>>>> ---
>>>>  drivers/soc/qcom/rpmh-internal.h |  4 +++
>>>>  drivers/soc/qcom/rpmh-rsc.c      |  6 +++-
>>>>  drivers/soc/qcom/rpmh.c          | 64 ++++++++++++++++++++++++++++++++--------
>>>>  include/soc/qcom/rpmh.h          | 10 +++++++
>>>>  4 files changed, 71 insertions(+), 13 deletions(-)
>>> As mentioned previously but not addressed [3], I believe your series
>>> breaks things if there are zero ACTIVE TCSs and you're using the
>>> immediate-flush solution.  Specifically any attempt to set something's
>>> "active" state will clobber the sleep/wake.  I believe this is hard to
>>> fix, especially if you want rpmh_write_async() to work properly and
>>> need to be robust to the last man going down while rpmh_write_async()
>>> is running but hasn't finished.  My suggestion was to consider it to
>>> be an error at probe time for now.
>>>
>>> Actually, though, I'd be super surprised if the "active == 0" case
>>> works anyway.  Aside from subtle problems of not handling -EAGAIN (see
>>> another previous message that you didn't respond to [2]), I think
>>> you'll also get failures because you never enable interrupts in
>>> RSC_DRV_IRQ_ENABLE for anything other than the ACTIVE_TCS.  Thus
>>> you'll never get interrupts saying when your transactions on the
>>> borrowed "wake" TCS finish.
>> No, it shouldn’t effect even with "non-OSI-mode + 0 ACTIVE TCS"
>>
>> i just replied on v9, pasting same on v13 as well.
>>
>> After taking your suggestion to do rpmh start/end transaction() in v13, rpmh_end_transaction()
>> invokes rpmh_flush() only for the last client and by this time expecting all of rpmh_write()
>> and rpmh_write_batch() will be already “finished” as client first waits for them to finish
>> and then only invokes end.
>>
>> So driver is good to handle rpmh_write() and rpmh_write_batch() calls.
> Ah, right.  In the previous version of the patch it was a problem
> because you flushed in cache_rpm_request() and then clobbered it right
> away in __rpmh_write() when you did rpmh_rsc_send_data().  With v13
> that is not the case anymore.  So this case should be OK.
>
>
>> Regarding rpmh_write_async() call, which is a fire-n-forget request from SW and client driver
>> may immediately invoke rpmh_end_transaction() after this.
>>
>> this case is also handled properly…
>> Lets again take an example for understanding this..
>>
>> 1.    Client invokes rpmh_write_async() to send ACTIVE cmds for targets which has zero ACTIVE TCS
>>
>>     Rpmh driver Re-purposes one of SLEEP/WAKE TCS to use as ACTIVE, internally this also sets
>>     drv->tcs_in_use to true for respective SLEEP/WAKE TCS.
>>
>> 2.    Client now without waiting for above to finish, goes ahead and invokes rpmh_end_transaction()
>>     which calls rpmh_flush() (in case cache become dirty)
> I guess we'd have to confirm that there's no way for the cache to
> _not_ become dirty but you do an "active" transaction.  Let's imagine
> this case:
>
> start transaction
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x11);
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0x99);
> end transaction
>
> start transaction
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x11);
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0x99);
> end transaction
>
> In other words the client does the same sequence twice in a row with
> no change in data.  After the first set I think you'd be fine.  ...but
> after the second set you'll be in trouble.  That's because none of the
> calls in the second set would cause the "dirty" to be set.  ...but for
> "active only" calls we don't have any sort of cache--we just fire it
> off.  When we fire off the active only we'll clobber the sleep/wake
> TCS.  ...and then nothing will write them again because the cache
> isn't dirty.
Agree with above scenario, but i don't see a reason why would a rpmh client send the same request twice.

Let me explain...

while first request is a proper one (already handled in rpmh driver), second is again duplicate
of first without any change.

when this duplicate request is triggered, resource may be in its own low power mode, when this
extra/duplicate command is sent, it needs to come out of low power mode and apply the newly requested
level but it is already at that level, so it will immediatly ack back without doing any real level
transition, and it will again go back to sleep. so there can be a small power hit.

and also for "ACTIVE" we need to handle this unnecessary ack interrupt at CPU, so CPU
(if it is in some low power mode where this interrupt is affined to) need to wake up and
handle this interrupt, again taking possible power hit from CPU point.

whats more?

while this whole unnecessary ping-pong happens in HW and SW, client may be waiting if its a blocking call.

rpmh client is expected to "aggregate" and finally do rpmh transaction "only if"
aggregated final level differs from what resource is already having.

if they are not doing this, then IMO, this is something to be addressed from client side.

>
>>     Now if re-purposed TCS is still in use in HW (transaction in progress), we still have
>>     drv->tcs_in_use set. So the rpmh_rsc_invalidate() (invoked from rpmh_flush()) will keep on
>>     returning -EAGAIN until that TCS becomes free to use and then goes ahead to finish its job.
> Ah, interesting.  I still think you have problems I pointed out in
> another response because you never enable interrupts for the "WAKE
> TCS", but I can see how this could be made to work.  In this case
> "async" becomes a little silly here because the flush will essentially
> be forced to wait until the transaction is totally done (so the TCS is
> free again), but it should be able to work.  
Agree, but i guess, this is a hit expected with non-OSI to do rpm_flush() immediately.
> This might actually point
> out something that needs to be changed in my "clean up" series since I
> guess "tcs_in_use" could sometimes be present in a wake TCS now.
yes this still need to keep.
>
>
>>>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>>>> index e278fc1..b6391e1 100644
>>>> --- a/drivers/soc/qcom/rpmh-rsc.c
>>>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>>>> @@ -61,6 +61,8 @@
>>>>  #define CMD_STATUS_ISSUED              BIT(8)
>>>>  #define CMD_STATUS_COMPL               BIT(16)
>>>>
>>>> +#define FLUSH_DIRTY                    1
>>>> +
>>>>  static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>>>>  {
>>>>         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
>>>> @@ -670,13 +672,15 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>>>>         INIT_LIST_HEAD(&drv->client.cache);
>>>>         INIT_LIST_HEAD(&drv->client.batch_cache);
>>>>
>>>> +       drv->client.flush_dirty = device_get_match_data(&pdev->dev);
>>>> +
>>>>         dev_set_drvdata(&pdev->dev, drv);
>>>>
>>>>         return devm_of_platform_populate(&pdev->dev);
>>>>  }
>>>>
>>>>  static const struct of_device_id rpmh_drv_match[] = {
>>>> -       { .compatible = "qcom,rpmh-rsc", },
>>>> +       { .compatible = "qcom,rpmh-rsc", .data = (void *)FLUSH_DIRTY },
>>> Ick.  This is just confusing.  IMO better to set
>>> 'drv->client.flush_dirty = true' directly in probe with a comment
>>> saying that it could be removed if we had OSI.
>> Done.
>> i will keep this bit earlier in probe with commet, so later if we detect rsc to be in hierarchy
>> from [1], we can override this to be 0 within rpmh_probe_power_domain().
>>
>> [1] https://patchwork.kernel.org/patch/11391229/
> I don't really understand, but maybe it'll be obvious when I see the code.
okay.
>
>
>
>>> ...and while you're at it, why not fire off a separate patch (not in
>>> your series) adding the stub to 'include/linux/psci.h'.  Then when we
>>> revisit this in a year it'll be there and it'll be super easy to set
>>> the value properly.
>> With above approch to set it in probe accordingly PSCI change won't be required.
>>
>> it will be simple, cleaner and without any resistance from PSCI perspective.
>>
>>>>         { }
>>>>  };
>>>>
>>>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>>>> index 5bed8f4..9d40209 100644
>>>> --- a/drivers/soc/qcom/rpmh.c
>>>> +++ b/drivers/soc/qcom/rpmh.c
>>>> @@ -297,12 +297,10 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>>>  {
>>>>         struct batch_cache_req *req;
>>>>         const struct rpmh_request *rpm_msg;
>>>> -       unsigned long flags;
>>>>         int ret = 0;
>>>>         int i;
>>>>
>>>>         /* Send Sleep/Wake requests to the controller, expect no response */
>>>> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>>>         list_for_each_entry(req, &ctrlr->batch_cache, list) {
>>>>                 for (i = 0; i < req->count; i++) {
>>>>                         rpm_msg = req->rpm_msgs + i;
>>>> @@ -312,7 +310,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>>>                                 break;
>>>>                 }
>>>>         }
>>>> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>>
>>>>         return ret;
>>>>  }
>>>> @@ -433,16 +430,63 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>>>  }
>>>>
>>>>  /**
>>>> + * rpmh_start_transaction: Indicates start of rpmh transactions, this
>>>> + * must be ended by invoking rpmh_end_transaction().
>>>> + *
>>>> + * @dev: the device making the request
>>>> + */
>>>> +void rpmh_start_transaction(const struct device *dev)
>>>> +{
>>>> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>>>> +       unsigned long flags;
>>>> +
>>>> +       if (!ctrlr->flush_dirty)
>>>> +               return;
>>>> +
>>>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>>> +       ctrlr->active_clients++;
>>> Wouldn't hurt to have something like:
>>>
>>> /*
>>>  * Detect likely leak; we shouldn't have 1000
>>>  * people making in-flight changes at the same time.
>>>  */
>>> WARN_ON(ctrlr->active_clients > 1000)
>> Not necessary change.
> Yes, but it will catch buggy clients much more quickly.  What are the downsides?
IMO, its uncessary warning that too with arbitrary number (1000).
rpmh clients are not expected to bombard it with thousands of requests, as i explained
above, they need to aggregate and make rpmh request only when real level transistion
needed.

and there is already a message (in rpmh_rsc_send_data()) to tell if all TCS are occupied
and rpmh will retry to send pending request. "TCS Busy, retrying RPMH message send"
>
>
>>>> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>> +}
>>>> +EXPORT_SYMBOL(rpmh_start_transaction);
>>>> +
>>>> +/**
>>>> + * rpmh_end_transaction: Indicates end of rpmh transactions. All dirty data
>>>> + * in cache can be flushed immediately when ctrlr->flush_dirty is set
>>>> + *
>>>> + * @dev: the device making the request
>>>> + *
>>>> + * Return: 0 on success, error number otherwise.
>>>> + */
>>>> +int rpmh_end_transaction(const struct device *dev)
>>>> +{
>>>> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>>>> +       unsigned long flags;
>>>> +       int ret = 0;
>>>> +
>>>> +       if (!ctrlr->flush_dirty)
>>>> +               return ret;
>>>> +
>>>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>> WARN_ON(!active_clients);
>> Why? when active_clients become zero, we want to finally call rpmh_flush(), i don't see a reason to warn and then flush.
>>
>> Or do you want to make a check if client really called rpmh_start_transaction() first before calling rpmh_end_transaction() then when we do
>> ctrlr->active_clients--;
>>
>> it shouldn't go to negative value at the end. in that case let me know, i will make those changes.
> Right, I want to warn on underflow.  AKA:
>
> WARN_ON(!ctrlr->active_clients);
> ctrlr->active_clients--;
>
> Generally it's handy to detect mismatches of start/end.  It could be
> that someone accidentally starts twice and ends once.  Starts zero
> times and ends once.  Starts once and ends twice.  All of these are
> interesting cases to warn about.
>
>
>
> -Doug

Agree, i will address this.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
