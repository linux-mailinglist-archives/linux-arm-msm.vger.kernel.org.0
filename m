Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528B317F615
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 12:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgCJLTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 07:19:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42382 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726258AbgCJLTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 07:19:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583839178; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=b/N1CeOpnDOYC1uuEwQEHq2rbRKbxmAY0QzVHSonNf4=; b=UHSul0SSLxlKy9icQJL2c53NihdmY0all12q9kxKwwceLIDPntxwbazH4t3ovGUSoOjs4o+p
 fO3CSKmrhfJnlis1TeARWoN+fBCln3pNXgaKJGjkO7hhNTWx8iVIGhwmJX3h87rzBvaIvvq2
 zNg4CY4533jHfFQwg8e2qKEI9GU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6777ca.7f07025dfe68-smtp-out-n02;
 Tue, 10 Mar 2020 11:19:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8F3DC433CB; Tue, 10 Mar 2020 11:19:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0009AC432C2;
        Tue, 10 Mar 2020 11:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0009AC432C2
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
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8810b558-f552-19dc-a5dc-4e64b37f35d8@codeaurora.org>
Date:   Tue, 10 Mar 2020 16:49:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/10/2020 5:13 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Add changes to invoke rpmh flush() from within cache_lock when the data in
>> cache is dirty.
>>
>> Introduce two new APIs for this. Clients can use rpmh_start_transaction()
>> before any rpmh transaction once done invoke rpmh_end_transaction() which
>> internally invokes rpmh_flush() if the caches has become dirty.
>>
>> Add support to control this with flush_dirty flag.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>> ---
>>  drivers/soc/qcom/rpmh-internal.h |  4 +++
>>  drivers/soc/qcom/rpmh-rsc.c      |  6 +++-
>>  drivers/soc/qcom/rpmh.c          | 64 ++++++++++++++++++++++++++++++++--------
>>  include/soc/qcom/rpmh.h          | 10 +++++++
>>  4 files changed, 71 insertions(+), 13 deletions(-)
> As mentioned previously but not addressed [3], I believe your series
> breaks things if there are zero ACTIVE TCSs and you're using the
> immediate-flush solution.  Specifically any attempt to set something's
> "active" state will clobber the sleep/wake.  I believe this is hard to
> fix, especially if you want rpmh_write_async() to work properly and
> need to be robust to the last man going down while rpmh_write_async()
> is running but hasn't finished.  My suggestion was to consider it to
> be an error at probe time for now.
>
> Actually, though, I'd be super surprised if the "active == 0" case
> works anyway.  Aside from subtle problems of not handling -EAGAIN (see
> another previous message that you didn't respond to [2]), I think
> you'll also get failures because you never enable interrupts in
> RSC_DRV_IRQ_ENABLE for anything other than the ACTIVE_TCS.  Thus
> you'll never get interrupts saying when your transactions on the
> borrowed "wake" TCS finish.

No, it shouldn’t effect even with "non-OSI-mode + 0 ACTIVE TCS"

i just replied on v9, pasting same on v13 as well.

After taking your suggestion to do rpmh start/end transaction() in v13, rpmh_end_transaction()
invokes rpmh_flush() only for the last client and by this time expecting all of rpmh_write()
and rpmh_write_batch() will be already “finished” as client first waits for them to finish
and then only invokes end.

So driver is good to handle rpmh_write() and rpmh_write_batch() calls.

Regarding rpmh_write_async() call, which is a fire-n-forget request from SW and client driver
may immediately invoke rpmh_end_transaction() after this.

this case is also handled properly…
Lets again take an example for understanding this..

1.    Client invokes rpmh_write_async() to send ACTIVE cmds for targets which has zero ACTIVE TCS

    Rpmh driver Re-purposes one of SLEEP/WAKE TCS to use as ACTIVE, internally this also sets
    drv->tcs_in_use to true for respective SLEEP/WAKE TCS.

2.    Client now without waiting for above to finish, goes ahead and invokes rpmh_end_transaction()
    which calls rpmh_flush() (in case cache become dirty)

    Now if re-purposed TCS is still in use in HW (transaction in progress), we still have
    drv->tcs_in_use set. So the rpmh_rsc_invalidate() (invoked from rpmh_flush()) will keep on
    returning -EAGAIN until that TCS becomes free to use and then goes ahead to finish its job.  


...i will add "suggested-by" you in next revision.


> Speaking of previous emails that you didn't respond to, I think you
> still have these action items:
>
> * Document that rpmh_write(active) and rpmh_write_async(active) also
> updates wake state. [1]
I will update in v14.
>
> * Change is_req_valid() to still return true if (sleep == wake), or
> keep track of "active" and return true if (sleep != wake || wake !=
> active). [1]
Not required, as replied in v10 now only.
> * Document that for batch a write to active doesn't update wake. [1]
I will update in v14.
>
>> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
>> index 6eec32b..d36be3d 100644
>> --- a/drivers/soc/qcom/rpmh-internal.h
>> +++ b/drivers/soc/qcom/rpmh-internal.h
>> @@ -70,13 +70,17 @@ struct rpmh_request {
>>   *
>>   * @cache: the list of cached requests
>>   * @cache_lock: synchronize access to the cache data
>> + * @active_clients: count of rpmh transaction in progress
>>   * @dirty: was the cache updated since flush
>> + * @flush_dirty: if the dirty cache need immediate flush
>>   * @batch_cache: Cache sleep and wake requests sent as batch
>>   */
>>  struct rpmh_ctrlr {
>>         struct list_head cache;
>>         spinlock_t cache_lock;
>> +       u32 active_clients;
>>         bool dirty;
>> +       bool flush_dirty;
>>         struct list_head batch_cache;
>>  };
>>
>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>> index e278fc1..b6391e1 100644
>> --- a/drivers/soc/qcom/rpmh-rsc.c
>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>> @@ -61,6 +61,8 @@
>>  #define CMD_STATUS_ISSUED              BIT(8)
>>  #define CMD_STATUS_COMPL               BIT(16)
>>
>> +#define FLUSH_DIRTY                    1
>> +
>>  static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>>  {
>>         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
>> @@ -670,13 +672,15 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>>         INIT_LIST_HEAD(&drv->client.cache);
>>         INIT_LIST_HEAD(&drv->client.batch_cache);
>>
>> +       drv->client.flush_dirty = device_get_match_data(&pdev->dev);
>> +
>>         dev_set_drvdata(&pdev->dev, drv);
>>
>>         return devm_of_platform_populate(&pdev->dev);
>>  }
>>
>>  static const struct of_device_id rpmh_drv_match[] = {
>> -       { .compatible = "qcom,rpmh-rsc", },
>> +       { .compatible = "qcom,rpmh-rsc", .data = (void *)FLUSH_DIRTY },
> Ick.  This is just confusing.  IMO better to set
> 'drv->client.flush_dirty = true' directly in probe with a comment
> saying that it could be removed if we had OSI.
Done.
i will keep this bit earlier in probe with commet, so later if we detect rsc to be in hierarchy
from [1], we can override this to be 0 within rpmh_probe_power_domain().

[1] https://patchwork.kernel.org/patch/11391229/

>
> ...and while you're at it, why not fire off a separate patch (not in
> your series) adding the stub to 'include/linux/psci.h'.  Then when we
> revisit this in a year it'll be there and it'll be super easy to set
> the value properly.

With above approch to set it in probe accordingly PSCI change won't be required.

it will be simple, cleaner and without any resistance from PSCI perspective.

>
>>         { }
>>  };
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index 5bed8f4..9d40209 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -297,12 +297,10 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>  {
>>         struct batch_cache_req *req;
>>         const struct rpmh_request *rpm_msg;
>> -       unsigned long flags;
>>         int ret = 0;
>>         int i;
>>
>>         /* Send Sleep/Wake requests to the controller, expect no response */
>> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>         list_for_each_entry(req, &ctrlr->batch_cache, list) {
>>                 for (i = 0; i < req->count; i++) {
>>                         rpm_msg = req->rpm_msgs + i;
>> @@ -312,7 +310,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>                                 break;
>>                 }
>>         }
>> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>
>>         return ret;
>>  }
>> @@ -433,16 +430,63 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>  }
>>
>>  /**
>> + * rpmh_start_transaction: Indicates start of rpmh transactions, this
>> + * must be ended by invoking rpmh_end_transaction().
>> + *
>> + * @dev: the device making the request
>> + */
>> +void rpmh_start_transaction(const struct device *dev)
>> +{
>> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>> +       unsigned long flags;
>> +
>> +       if (!ctrlr->flush_dirty)
>> +               return;
>> +
>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>> +       ctrlr->active_clients++;
> Wouldn't hurt to have something like:
>
> /*
>  * Detect likely leak; we shouldn't have 1000
>  * people making in-flight changes at the same time.
>  */
> WARN_ON(ctrlr->active_clients > 1000)
Not necessary change.
>
>
>> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +}
>> +EXPORT_SYMBOL(rpmh_start_transaction);
>> +
>> +/**
>> + * rpmh_end_transaction: Indicates end of rpmh transactions. All dirty data
>> + * in cache can be flushed immediately when ctrlr->flush_dirty is set
>> + *
>> + * @dev: the device making the request
>> + *
>> + * Return: 0 on success, error number otherwise.
>> + */
>> +int rpmh_end_transaction(const struct device *dev)
>> +{
>> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>> +       unsigned long flags;
>> +       int ret = 0;
>> +
>> +       if (!ctrlr->flush_dirty)
>> +               return ret;
>> +
>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> WARN_ON(!active_clients);
Why? when active_clients become zero, we want to finally call rpmh_flush(), i don't see a reason to warn and then flush.

Or do you want to make a check if client really called rpmh_start_transaction() first before calling rpmh_end_transaction() then when we do
ctrlr->active_clients--;

it shouldn't go to negative value at the end. in that case let me know, i will make those changes.

>
>
>> +
>> +       ctrlr->active_clients--;
>> +       if (ctrlr->dirty && !ctrlr->active_clients)
>> +               ret = rpmh_flush(ctrlr);
> As mentioned previously [2], I don't think it's valid to call
> rpmh_flush() with interrupts disabled.  Specifically (as of your
> previous patch) rpmh_flush now loops if rpmh_rsc_invalidate() returns
> -EAGAIN.  I believe that the caller needs to enable interrupts for a
> little bit before trying again.  If the caller doesn't need to enable
> interrupts for a little bit before trying again then why was -EAGAIN
> even returned?  tcs_invalidate() could have just looped itself and all
> the code would be much simpler.
I will check and address this.
>
>
>> +
>> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(rpmh_end_transaction);
>> +
>> +/**
>>   * rpmh_flush: Flushes the buffered active and sleep sets to TCS
>>   *
>>   * @ctrlr: controller making request to flush cached data
>>   *
>> - * Return: -EBUSY if the controller is busy, probably waiting on a response
>> - * to a RPMH request sent earlier.
>> + * Return: 0 on success, error number otherwise.
>>   *
>> - * This function is always called from the sleep code from the last CPU
>> - * that is powering down the entire system. Since no other RPMH API would be
>> - * executing at this time, it is safe to run lockless.
>> + * This function can either be called from sleep code on the last CPU
>> + * (thus no spinlock needed) or with the ctrlr->cache_lock already held.
>>   */
>>  int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>  {
>> @@ -464,10 +508,6 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>         if (ret)
>>                 return ret;
>>
>> -       /*
>> -        * Nobody else should be calling this function other than system PM,
>> -        * hence we can run without locks.
>> -        */
>>         list_for_each_entry(p, &ctrlr->cache, list) {
>>                 if (!is_req_valid(p)) {
>>                         pr_debug("%s: skipping RPMH req: a:%#x s:%#x w:%#x",
>> diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
>> index f9ec353..85e1ab2 100644
>> --- a/include/soc/qcom/rpmh.h
>> +++ b/include/soc/qcom/rpmh.h
>> @@ -22,6 +22,10 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>
>>  int rpmh_invalidate(const struct device *dev);
>>
>> +void rpmh_start_transaction(const struct device *dev);
>> +
>> +int rpmh_end_transaction(const struct device *dev);
>> +
>>  #else
>>
>>  static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
>> @@ -41,6 +45,12 @@ static inline int rpmh_write_batch(const struct device *dev,
>>  static inline int rpmh_invalidate(const struct device *dev)
>>  { return -ENODEV; }
>>
>> +void rpmh_start_transaction(const struct device *dev)
>> +{ return -ENODEV; }
> Unexpected return from void function.
>
Thanks, done.
>> +
>> +int rpmh_end_transaction(const struct device *dev)
>> +{ return -ENODEV; }
>> +
>>  #endif /* CONFIG_QCOM_RPMH */
>>
>>  #endif /* __SOC_QCOM_RPMH_H__ */
> [1] https://lore.kernel.org/r/CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com
> [2] https://lore.kernel.org/r/CAD=FV=UYpO2rSOoF-OdZd3jKfSZGKnpQJPoiE5fzH+u1uafS6g@mail.gmail.com
> [3] https://lore.kernel.org/r/CAD=FV=VNaqwiti+UB8fLgjF5r2CD2xeF_p7qHS-_yXqf+ZDrBg@mail.gmail.com
>
>
>
> -Doug

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
