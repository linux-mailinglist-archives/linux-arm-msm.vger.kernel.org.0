Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 900A6192F01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 18:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgCYRQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 13:16:08 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17516 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgCYRQH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 13:16:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585156566; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ELDYAqLx/dRYmNFHiB9YGfRxXQASMGfcrVBV6ayIONU=; b=gxQ1cMXO8ATw3n/qsE0RNgiFa4kU8xwyR6V0eBo7QFIhF6CRczGDGS9fthp+mzxkC3e3UYY0
 cjvGBTVuldSsRA0izG8kXdzjUyIOiUbrw1qOU47lLhyDiwrwFZKMsLZkMQy7Yry9GwnkN1Nn
 Ukb9jN4RXWGMGyTyKnL+1LaOxz4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7b91b9.7fefe547ba08-smtp-out-n03;
 Wed, 25 Mar 2020 17:15:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58376C433D2; Wed, 25 Mar 2020 17:15:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.14.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2CB0C433F2;
        Wed, 25 Mar 2020 17:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D2CB0C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: Re: [PATCH v13 4/5] soc: qcom: rpmh: Invoke rpmh_flush() for
 dirty caches
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
 <e7723b03-ce7e-ff4b-e2b4-3d93f970748c@codeaurora.org>
 <CAD=FV=XFL9UZ44Q0xjMVsuok+CK9iWs4X3fkWXFHZrkw-ptfXw@mail.gmail.com>
 <5a5274ac-41f4-b06d-ff49-c00cef67aa7f@codeaurora.org>
 <CAD=FV=VPSahhK71k_D+nfL1=5QE5sKMQT=6zzyEF7+JWMcTxsg@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <3247c8d1-2222-e05a-e14f-41966a29fda0@codeaurora.org>
Date:   Wed, 25 Mar 2020 22:45:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VPSahhK71k_D+nfL1=5QE5sKMQT=6zzyEF7+JWMcTxsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/12/2020 8:41 PM, Doug Anderson wrote:
> Hi,
>
> Quoting below may look funny since you replied with HTML mail and all
> old quoting was lost.  :(  I tried my best.
>
> On Thu, Mar 12, 2020 at 3:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>> Specifically I wouldn't trust all callers of rpmh_write() /
>>> rpmh_write_async() to never send the same data.  If it was just an
>>> speed/power optimization then sure you could trust them, but this is
>>> for correctness.
>> yes we should trust callers not to send duplicate data.
> I guess we'll see how this works out.  Since this only affects the
> "zero active-only" case and I'm pretty sure that case has more
> important issues, I'm OK w/ ignoring for now.
>
>
>>> Hrmm, thinking about this again, though, I'm still not convinced I
>>> understand what prevents the firmware from triggering "sleep mode"
>>> while the sleep/wake TCS is being borrowed for an active-only
>>> transaction.  If we're sitting in rpmh_write() and sleeping in
>>> wait_for_completion_timeout() couldn't the system go idle and trigger
>>> sleep mode?  In OSI-mode (with last man down) you'll always have a
>>> rpmh_flush() called by the last man down so you know you can make sure
>>> you're in a consistent state (one final flush and no more active-only
>> transactions will happen).  Without last man down you have to assume
>>> it can happen at any time don't you?
>>>
>>> ...so I guess I'll go back to asserting that zero-active-TCS is
>>> incompatible with non-OSI unless you have some way to prevent the
>>> sleep mode from being triggered while you've borrowed the wake TCS.
>> i had change for this in v4 to handle same.
>>
>> Link: https://patchwork.kernel.org/patch/11366205/
>>
>> + /*
>> + * RPMh domain can not be powered off when there is pending ACK for
>> + * ACTIVE_TCS request. Exit when controller is busy.
>> + */
>>
>> before calling rpmh_flush() we check ctrlr is idle (ensuring
>>
>> tcs_is_free() check passes)  this will ensure that
>>
>> previous active transaction is completed before going ahead.
>>
>> i will add this check in v14.
>>
>> since this curretntly check for ACTIVE TCS only, i will update it to check the repurposed "WAKE TCS" is also free.
> The difficulty isn't in adding a simple check, it's in adding a check
> that is race free and handles locking properly.  Specifically looking
> at your the v4 you pointed to, I see things like this:
>
>   if (!rpmh_rsc_ctrlr_is_idle(drv))
>     return -EBUSY;
>   return rpmh_flush(&drv->client);
>
> The rpmh_rsc_ctrlr_is_idle() grabs a spin lock implying that there
> could be other people acting on RPMh at the same time (otherwise, why
> do you even need locks?).  ...but when it returns the lock is
> released.  Once the lock is dropped then other clients are free to
> start using RPMH because nothing prevents them.  ...then you go ahead
> and start flushing.
>
> Said another way: due to the way you've structured locking in that
> patch rpmh_rsc_ctrlr_is_idle() is inherently dangerous because it
> returns an instantaneous state that may well have changed between the
> spin_unlock_irqrestore() at the end of the function and when the
> function returns.
>
> You could, of course, fix this by requiring that the caller hold the
> 'drv->lock' for both the calls to rpmh_rsc_ctrlr_is_idle() and
> rpmh_flush() (ignoring the fact the drv->lock is nominally part of
> rpmh-rsc.c and not rpmh.c).  Now it would be safe from the problem I
> described.  ...but now you get into a new problem.  If you ever hold
> two locks you always need to make sure you grab them in the same order
> any time you grab them both.  ...but tcs_write() we first grab a
> tcs_lock and _then_ drv->lock.  That means the "fix" of holding
> drv->lock for both the calls to rpmh_rsc_ctrlr_is_idle() and
> rpmh_flush() won't work because rpmh_flush() will need to grab a
> tcs_lock.  Possibly we could make this work by eliminating the "tcs
> lock" and just having the one big "drv->lock" protect everything (or
> introducing a new "super lock" making the other two meaningless).  It
> would certainly be easier to reason about...
Thanks Doug.

Agree, a simple check won't help here.

From above discussions, summarizing out 3 items that gets impacted when using rpmh_start/end_transaction().

1. rpmh_write_async() becomes of little use since drivers may need to wait for rpmh_flush() to finish
if caches becomes dirty in between.
2. It creates more pressure on WAKE TCS when there is no dedicated ACTIVE TCS. Transactions are delayed
if rpmh_flush() is in progress holding the locks and new request comes in to send Active only data.
3. rpmh_rsc_ctrlr_is_idle() needs locking if ANY cpu can be calling this, this may require reordering of
locks / increase the time for which locks are held during rpmh transactions. On downstream variant we don't
have locking in this since in OSI, only last CPU is invoking it and it is the only one invoking this function.

Given above impact this approach seem not so simple as i though of earlier. i have alternate solution which
uses cpu_pm_notifications() and invokes rpmh_flush() for non-OSI targets. This approach should not impact
above 3 items.

I will soon post out v14 with this, testing in progress.

>
> NOTE: the only way I'm able to reason about all the above things is
> because I spent all the time to document what rpmh-rsc is doing and
> what assumptions the various functions had [1].  It'd be great if that
> could get a review.
Sure.
>
>
>>> This whole "no active TCS" is really quite a mess.  Given how broken
>>> it seems to me it almost feels like we should remove "no active TCS"
>>> from the driver for now and then re-add it in a later patch when we
>>> can really validate everything.  I tried addressing this in my
>>> rpmh-rsc cleanup series and every time I thought I had a good solution
>>> I could find another way to break it.
>>>
>>> Do you actually have the "no active TCS" case working on the current
>>> code, or does it only work on some downstream variant of the driver?
>>>
>>> It works fine on downstream variant. Some checks are still needed like above from v4
>>>
>>> since we do rpmh_flush() immediatly for dirty caches now.
> OK.  So I take it you haven't tested the "zero active" case with the
> upstream code?  In theory it should be easy to test, right?  Just hack
> the driver to pretend there are zero active TCSs?

No, it won't work out this way. if we want to test with zero active case, need to pick up [2].

[2] also need follow up fixes to work. This change is also in my to do
list to get merged. I will include a change in v14 series at the end, it can help test this series
for zero active tcs as well.

Note that it doesn't have any dependency with this series and current series can get merged
without [2].
>
> Which SoCs in specific need the zero active TCSs?  We are spending a
> lot of time talking about this and reviewing the code with this in
> mind.  It adds a lot of complexity to the driver.  If nothing under
> active development needs it I think we should do ourselves a favor and
> remove it for now, then add it back later.  Otherwise this whole
> process is just going to take a lot more time.
>
There are multiple SoCs having zero active TCSes in downstream code. So we can not remove it.

As i said above we need [2] plus some fixes to have zero active TCS working fine on upstream driver.

Thanks,
Maulik

>>> I'm not saying we should limit the total number of requests to 1000.
>>> I'm saying that if there are 1000 active clients then that's a
>>> problem.  Right now there are something like 4 clients.  It doesn't
>>> matter how fast those clients are sending, active_clients will only be
>>> at most 4 and that would only be if they were all running their code
>>> at the exact same time.
>>>
>>> I want to be able to quickly detect this type of bug:
>>>
>>> start_transaction()
>>> ret = rpmh_write()
>>> if (ret)
>>>   return ret;
>>> ret = rpmh_write()
>>> end_transaction()
>>> return ret;
>>>
>>> ...in other words: someone has a code path where start_transaction()
>>> is called but never end_transaction().  I'm proposing that if we ever
>>> see the ridiculous value of 1000 active clients the only way it could
>>> happen is if one of the clients started more times than they ended.
>>>
>>>
>>> I guess maybe by the time there were 1000 it would be too late,
>>> though, because we'd have skipped A LOT of flushes by then?  Maybe
>>> instead we should add something where if RPMH is "ditry" for more than
>>> a certain amount of time we put a warning?
>> IMO, we should not add any such warning with any number.
>> There are only 4 clients and unlikely to have any new ones. those 4 we should be able to ensure
>> that they invoke end_transaction(), if they have already done start_transaction().beside,
>> Function description also says that "this must be ended by invoking rpmh_end_transaction()"
>> i am ok to also add  saying that "rpmh do not check this, so its caller's responsibility to
>> end it"
> I don't agree but I won't argue further.  If you want to leave out the
> WARN() then so be it.
>
> -Doug
>
> [1] https://lore.kernel.org/r/20200311161104.RFT.v2.5.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid

[2] https://patchwork.kernel.org/patch/10818129/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
