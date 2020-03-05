Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EB017A25F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 10:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgCEJlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 04:41:47 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:60677 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725880AbgCEJlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 04:41:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583401306; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=p29vmtXnIGYKAtfuFzEtWLuvGXAbVi5EzBi6IIHnlMU=; b=pnxgxz5VlIQvPY+Y4zdLVI3N1stgzEFwYIqZVbh5p/pv4f+eBU2vRyXRuzT5CpH7yT1hggOj
 cjh9pyoFemDNaX/gHYhbAIHKs9HBEYjTjNBCsIpUlMO1FmUXq/J1BBsFGigwwfUjo+hn0Gp0
 7GZlXPXaWvhHnrXx4mfkvPjTtes=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e60c94f.7f98367ddea0-smtp-out-n01;
 Thu, 05 Mar 2020 09:41:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06C44C4479F; Thu,  5 Mar 2020 09:41:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DD3AC4479C;
        Thu,  5 Mar 2020 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DD3AC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v9 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
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
References: <1582889903-12890-1-git-send-email-mkshah@codeaurora.org>
 <1582889903-12890-4-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=V92fFH8q+yvMk2sWdgi_xjFyvt3rMu14O+sO5zLp2kGg@mail.gmail.com>
 <7704638e-b473-d0cf-73ab-2bdb67b636ba@codeaurora.org>
 <CAD=FV=XL631dpEY8iB=gzjnh1cZVk6AKRafkQ7ke++AfXtuHNA@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <c65ec56b-6cd2-8593-7d25-23eb2f3672d0@codeaurora.org>
Date:   Thu, 5 Mar 2020 15:11:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XL631dpEY8iB=gzjnh1cZVk6AKRafkQ7ke++AfXtuHNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/4/2020 6:10 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Mar 2, 2020 at 9:47 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>>
>> On 2/29/2020 5:15 AM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Fri, Feb 28, 2020 at 3:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>>> Add changes to invoke rpmh flush() from within cache_lock when the data
>>>> in cache is dirty.
>>>>
>>>> This is done only if OSI is not supported in PSCI. If OSI is supported
>>>> rpmh_flush can get invoked when the last cpu going to power collapse
>>>> deepest low power mode.
>>>>
>>>> Also remove "depends on COMPILE_TEST" for Kconfig option QCOM_RPMH so the
>>>> driver is only compiled for arm64 which supports psci_has_osi_support()
>>>> API.
>>>>
>>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>>>> ---
>>>>   drivers/soc/qcom/Kconfig |  2 +-
>>>>   drivers/soc/qcom/rpmh.c  | 33 ++++++++++++++++++++++-----------
>>>>   2 files changed, 23 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index d0a73e7..2e581bc 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>> +++ b/drivers/soc/qcom/Kconfig
>>>> @@ -105,7 +105,7 @@ config QCOM_RMTFS_MEM
>>>>
>>>>   config QCOM_RPMH
>>>>          bool "Qualcomm RPM-Hardened (RPMH) Communication"
>>>> -       depends on ARCH_QCOM && ARM64 || COMPILE_TEST
>>>> +       depends on ARCH_QCOM && ARM64
>>>>          help
>>>>            Support for communication with the hardened-RPM blocks in
>>>>            Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
>>>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>>>> index f28afe4..6a5a60c 100644
>>>> --- a/drivers/soc/qcom/rpmh.c
>>>> +++ b/drivers/soc/qcom/rpmh.c
>>>> @@ -12,6 +12,7 @@
>>>>   #include <linux/module.h>
>>>>   #include <linux/of.h>
>>>>   #include <linux/platform_device.h>
>>>> +#include <linux/psci.h>
>>>>   #include <linux/slab.h>
>>>>   #include <linux/spinlock.h>
>>>>   #include <linux/types.h>
>>>> @@ -158,6 +159,13 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>>>          }
>>>>
>>>>   unlock:
>>>> +       if (ctrlr->dirty && !psci_has_osi_support()) {
>>>> +               if (rpmh_flush(ctrlr)) {
>>>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>> +                       return ERR_PTR(-EINVAL);
>>>> +               }
>>>> +       }
>>> It's been a long time since I looked in depth at RPMH, but upon a
>>> first glance this seems like it's gonna be terrible for performance.
>>> You're going to send every entry again and again, aren't you?  In
>>> other words in pseudo-code:
>>>
>>> 1. rpmh_write(addr=0x10, data=0x99);
>>> ==> writes on the bus (0x10, 0x99)
>>>
>>> 2. rpmh_write(addr=0x11, data=0xaa);
>>> ==> writes on the bus (0x10, 0x99)
>>> ==> writes on the bus (0x11, 0xaa)
>>>
>>> 3. rpmh_write(addr=0x10, data=0xbb);
>>> ==> writes on the bus (0x10, 0xbb)
>>> ==> writes on the bus (0x11, 0xaa)
>>>
>>> 4. rpmh_write(addr=0x12, data=0xcc);
>>> ==> writes on the bus (0x10, 0xbb)
>>> ==> writes on the bus (0x11, 0xaa)
>>> ==> writes on the bus (0x12, 0xcc)
>>>
>>> That seems bad.
>> Hi Doug,
>>
>> No this is NOT how data is sent to RPMh/AOSS.
>> The rpmh_flush() fills up DRV-2 (HLOS) TCSes, makes it ready and The HW
>> takes care of
>> sending data of Sleep TCSes for each of the EL/ DRV(s) when Last cpu is
>> going to deepest
>> low power mode and of WAKE TCSes while first cpu is waking up.
> Ah, I see.  So for sleep / wake commands we never directly wait for
> them to go out on the bus while the system is awake.  We just program
> them all to the RPMH hardware and they'll set there and all get sent
> automatically when the last CPU goes into deepest low power mode.
>
> ...so actually the whole point of OSI mode (from an RPMH perspective)
> is not to avoid transactions on the bus.  It's just avoiding
> programming RPMH over and over again.  Is that correct?
>
> ...and the reason we have all these data structures in the kernel is
> to keep track of auxiliary information about the things in the
> sleep/wake TCSs and make it easier to update bits of them?
correct.
>
>
>>> Why can't you just send the new request itself and
>>> forget adding it to the cache?  In other words don't even call
>>> cache_rpm_request() in the non-OSI case and then in __rpmh_write()
>>> just send right away...
>> This won’t work out. Let me explain why…
>>
>> We have 3 SLEEP and 3 WAKE TCSes from below config..
>>                          qcom,tcs-config = <ACTIVE_TCS  2>,
>>                                            <SLEEP_TCS   3>,
>>                                            <WAKE_TCS    3>,
>> Each TCS has total 16 commands so total 48 commands(16*3) for each SLEEP
>> and WAKE TCSes,
>> that can be filled up.
>>
>> Now Lets take a example in pseudo-code on what could happen if we don’t
>> cache and
>> immediately fill up TCSes commands. The triggering part doesn’t happen
>> as explained above
>> it fills up TCSes and makes them ready..
>>
>> Time-t0 (from client_x invoking rpmh_write_batch() for SLEEP SET, a
>> batch of 3 commands)
>>
>> rpmh_write_batch(
>> addr=0x10, data=0x99,  -> fills up CMD0 in SLEEP TCS_0
>> addr=0x11, data=0xaa,  -> fills up CMD1 in SLEEP TCS_0
>> addr=0x10, data=0xbb); -> fills up CMD2 in SLEEP TCS_0
>>
>> Time-t1 (from client_y invoking rpmh_write(), a single command)
>>
>> rpmh_write(
>> addr=0x12, data=0xcc,  -> fills up CMD3 in SLEEP TCS_0
>> );
>>
>> Time-t2 (from client_x invokes rpmh_invalidate() which invalidates all
>> previous *batch requests* only)
>>
>> At this point, it should have CMD3 only in TCS while CMD 0,1,2 needs to
>> be freed up, since we expect
>> a new batch request now.
>>
>> Since driver didn’t cache anything in the first place, it doesn’t know
>> details about previous batch request
>> like how many commands it had, what were the commands of those batches
>> when filling up in TCSes, and so on…
>> (basically all the data required to free up only CMD 0,1,2, and don’t
>> disturb CMD3)
>>
>> Whats more?
>>
>> The new batch request could be of let say 5 commands after invalidation,
>> instead of 3 commands in previous batch.
>> So it will not fit in CMD-0,1,2 and we might want to allocate from
>> CMD-4,5,6,7,8 now.
>>
>> This will leave a hole in TCS CMDs (each TCS has 16 total commands)
>> unless we re-arrange everything.
>> Also we may want to fill up batch request first and then single
>> requests, by not caching anything, driver don’t
>> know which one is batch and which one is single request.
> OK, I got it now.  I'll try to spend some time tomorrow looking over
> everything / testing with my new understanding.
>
>
>> There are other cases like below which also gets impacted if driver
>> don't cache anything...
>>
>> for example, when we don’t have dedicated ACTIVE TCS ( if we have below
>> config with ACTIVE TCS count 0)
>>      qcom,tcs-config = <ACTIVE_TCS  0>,
>>                            <SLEEP_TCS   3>,
>>                            <WAKE_TCS    3>,
>>
>> Now to send active data, driver may re-use/ re-purpose few of the sleep
>> or wake TCS, to be used as ACTIVE TCS and once work is done,
>> it will be re-allocated in SLEEP/ WAKE TCS pool accordingly. If driver
>> don’t cache, all the SLEEP and WAKE data is lost when one
>> of TCS is repurposed to use as ACTIVE TCS.
> Ah, interesting.  I'll read the code more, but are you expecting this
> type of situation to work today, or is it theoretical for the future?
yes, we have targets which needs to work with this type of situation.
>
>
>> Hope above explanation clears why caching is important and gives clear
>> view of caching v/s not caching.
>>
>> Thanks,
>> Maulik
>>
>>> I tried to test this and my printouts didn't show anything actually
>>> happening in rpmh_flush().  Maybe I just don't have the write patches
>>> to exercise this properly...
>> it may be due to missing interconnect patches series
>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=247175
> I ended up pulling those in but I was still not seeing things work as
> I expected.  I'll debug more tomorrow to see if it was my expectations
> that were wrong or if there was a real issue.
>
>
>>>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>>
>>>>          return req;
>>>> @@ -285,26 +293,35 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>>>>   }
>>>>   EXPORT_SYMBOL(rpmh_write);
>>>>
>>>> -static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>>>> +static int cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>>>>   {
>>>>          unsigned long flags;
>>>>
>>>>          spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>>> +
>>>>          list_add_tail(&req->list, &ctrlr->batch_cache);
>>>>          ctrlr->dirty = true;
>>>> +
>>>> +       if (!psci_has_osi_support()) {
>>>> +               if (rpmh_flush(ctrlr)) {
>>>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>> +                       return -EINVAL;
>>>> +               }
>>>> +       }
>>>> +
>>>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>> +
>>>> +       return 0;
>>>>   }
>>>>
>>>>   static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>>>   {
>>>>          struct batch_cache_req *req;
>>>>          const struct rpmh_request *rpm_msg;
>>>> -       unsigned long flags;
>>>>          int ret = 0;
>>>>          int i;
>>>>
>>>>          /* Send Sleep/Wake requests to the controller, expect no response */
>>>> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>>>          list_for_each_entry(req, &ctrlr->batch_cache, list) {
>>>>                  for (i = 0; i < req->count; i++) {
>>>>                          rpm_msg = req->rpm_msgs + i;
>>>> @@ -314,7 +331,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>>>                                  break;
>>>>                  }
>>>>          }
>>>> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>>
>>>>          return ret;
>>>>   }
>>>> @@ -386,10 +402,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>>>                  cmd += n[i];
>>>>          }
>>>>
>>>> -       if (state != RPMH_ACTIVE_ONLY_STATE) {
>>>> -               cache_batch(ctrlr, req);
>>>> -               return 0;
>>>> -       }
>>>> +       if (state != RPMH_ACTIVE_ONLY_STATE)
>>>> +               return cache_batch(ctrlr, req);
>>> I'm curious: why not just do:
>>>
>>> if (state != RPMH_ACTIVE_ONLY_STATE && psci_has_osi_support()) {
>>>    cache_batch(ctrlr, req);
>>>    return 0;
>>> }
>>>
>>> ...AKA don't even cache it up if we're not in OSI mode.  IIUC this
>>> would be a huge deal because with your code you're doing the whole
>>> RPMH transfer under "spin_lock_irqsave", right?  And presumably RPMH
>>> transfers are somewhat slow, otherwise why did anyone come up with
>>> this whole caching / last-man-down scheme to start with?
>>>
>>> OK, it turned out to be at least slightly more complex because it
>>> appears that we're supposed to use rpmh_rsc_write_ctrl_data() for
>>> sleep/wake stuff and that they never do completions, but it really
>>> wasn't too hard.  I prototyped it at <http://crrev.com/c/2080916>.
>>> Feel free to hijack that change if it looks like a starting point and
>>> if it looks like I'm not too confused.
>> I looked at this change and thought of it earlier but it won’t work out
>> for the reasons in above example.
>> I have thought of few optimizations in rpmh_flush() to reduce its time,
>> if we *really* see any performance impact…
>>
>> below is high level idea…
>> When  rpmh_write_batch() is invoked for SLEEP_SETs, currently
>> rpmh_flush() will update both SLEEP and WAKE TCS contents,
>> However we may change it to update only SLEEP TCS, and when
>> rpmh_write_batch() is invoked for WAKE SETs, update only WAKE TCS contents.
>> This way it may reduce time by roughly ~50%.
> OK, that's something to keep in mind.  Agree that it doesn't have the
> be part of the initial change.
>
> -Doug
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
