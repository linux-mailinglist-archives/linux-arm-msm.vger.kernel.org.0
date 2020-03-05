Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD8F17A3BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 12:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgCELKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 06:10:25 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:24977 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgCELKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 06:10:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583406624; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kkKqaCREFIcFeWu8i5T/o363HLW4FpZR/5+zbhVgff4=; b=NBpHmwFvolBndXLv2ZfP/pprE9sBzvCPB4UQw6se0PHZe5+dg6Qp9eRxSmP03No+7+R9JY8Q
 i7S/Jo0atmzq+kXUk7qpCYl+lxIfxTLhyTpRtuK2/f1qLaJ5y3XN2wmzkGYICng5vYPRfA9x
 QPlEnbHvkIHJTE2StgrHyCCnU08=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e60de1b.7fbe0ef52180-smtp-out-n05;
 Thu, 05 Mar 2020 11:10:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF859C4479F; Thu,  5 Mar 2020 11:10:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 58527C43383;
        Thu,  5 Mar 2020 11:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 58527C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v10 2/3] soc: qcom: rpmh: Update dirty flag only when data
 changes
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
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
 <1583238415-18686-3-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=VOARbQzY_p-SyDFu0mzFROp8nV9E=sraNrykWiySwEpw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8e307595-7758-6eb5-ab2d-73ab1ac1029c@codeaurora.org>
Date:   Thu, 5 Mar 2020 16:40:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VOARbQzY_p-SyDFu0mzFROp8nV9E=sraNrykWiySwEpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/5/2020 4:51 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Mar 3, 2020 at 4:27 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Currently rpmh ctrlr dirty flag is set for all cases regardless of data
>> is really changed or not. Add changes to update dirty flag when data is
>> changed to newer values. Update dirty flag everytime when data in batch
>> cache is updated since rpmh_flush() may get invoked from any CPU instead
>> of only last CPU going to low power mode.
>>
>> Also move dirty flag updates to happen from within cache_lock and remove
>> unnecessary INIT_LIST_HEAD() call and a default case from switch.
>>
>> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>> Reviewed-by: Evan Green <evgreen@chromium.org>
>> ---
>>  drivers/soc/qcom/rpmh.c | 21 +++++++++++++--------
>>  1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index eb0ded0..f28afe4 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -133,26 +133,30 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>
>>         req->addr = cmd->addr;
>>         req->sleep_val = req->wake_val = UINT_MAX;
>> -       INIT_LIST_HEAD(&req->list);
>>         list_add_tail(&req->list, &ctrlr->cache);
>>
>>  existing:
>>         switch (state) {
>>         case RPMH_ACTIVE_ONLY_STATE:
>> -               if (req->sleep_val != UINT_MAX)
>> +               if (req->sleep_val != UINT_MAX) {
>>                         req->wake_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
> You could maybe avoid a few additional "dirty" cases by changing the
> above "if" to:
>
> if (req->sleep_val != UINT_MAX &&
>    (req->wake_val != cmd->data)
>
> ...since otherwise writing an "ACTIVE_ONLY" thing over and over again
> with the same value would keep saying "dirty".
>
>
> Looking at this code makes me wonder a bit about how it's supposed to
> work, though.  Let's look at a sequence of 3 commands called in two
> different orders:
>
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0xaa);
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0xbb);
>
> ==> End result will be a cache entry (addr=0x10, wake=0xaa, sleep=0xbb)
>
>
> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0xbb);
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0xaa);
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
>
> ==> End result will be a cache entry (addr=0x10, wake=0x99, sleep=0xbb)
>
>
> Said another way, it seems weird that a vote for "active" counts as a
> vote for "wake", but only if a sleep vote was made beforehand?
> Howzat?
>
>
> Maybe at one point in time it was assumed that wake's point was just
> to undo sleep?  That is, if:
>
> state_orig = /* the state before sleep happens */
> state_sleep = apply(state_orig, sleep_actions)
> state_wake = apply(state_sleep, wake_actions)
>
> The code is assuming "state_orig == state_wake".
>
> ...it sorta makes sense that "state_orig == state_wake" would be true,
> but if we were really making that requirement we really should have
> structured RPMH's APIs differently.  We shouldn't have even allowed
> the callers to specify "WAKE_ONLY" state and we should have just
> constructed it from the "ACTIVE_ONLY" state.
>
>
> To summarize:
>
> a) If the only allowable use of "WAKE_ONLY" is to undo "SLEEP_ONLY"
> then we should re-think the API and stop letting callers to
> rpmh_write(), rpmh_write_async(), or rpmh_write_batch() ever specify
> "WAKE_ONLY".  The code should just assume that "wake_only =
> active_only if (active_only != sleep_only)".  In other words, RPMH
> should programmatically figure out the "wake" state based on the
> sleep/active state and not force callers to do this.
>
> b) If "WAKE_ONLY" is allowed to do other things (or if it's not RPMH's
> job to enforce/assume this) then we should fully skip calling
> cache_rpm_request() for RPMH_ACTIVE_ONLY_STATE.
>
>
> NOTE: this discussion also makes me wonder about the is_req_valid()
> function.  That will skip sending a sleep/wake entry if the sleep and
> wake entries are equal to each other.  ...but if sleep and wake are
> both different than "active" it'll be a problem.

Hi Doug,

To answer above points, yes in general it’s the understanding that wake is
almost always need to be equal to active. However, there can be valid reasons
for which the callers are enforced to call them differently in the first place.

At present caller send 3 types of request.
rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x0);
rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0x99);

Now, Lets assume we handle this in rpmh driver since wake=active and the caller
send only 2 type of request (lets call it active and sleep, since we have assumption
of wake=active, and we don’t want 3rd request as its handled in rpmh driver)
So callers will now invoke 2 types of request.

rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x0);

with first type request, it now needs to serve 2 purpose
(a)    cache ACTIVE request votes as WAKE votes
(b)    trigger it out immediately (in ACTIVE TCS) as it need to be also complete immediately.

For SLEEP, nothing changes. Now when entering to sleep we do rpmh_flush() to program all
WAKE and SLEEP request…so far so good…

Now consider a corner case,

There is something called a solver mode in RSC where HW could be in autonomous mode executing
low power modes. For this it may want to “only” program WAKE and SLEEP votes and then controller
would be in solver mode entering and exiting sleep autonomously.

There is no ACTIVE set request and hence no requirement to send it right away as ACTIVE vote.

If we have only 2 type of request, caller again need to differentiate to tell rpmh driver that
when it invoke

rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);

with this caching it as WAKE is fine  ((a) in above) but do not trigger it ((b) in above)

so we need to again modify this API and pass another argument saying whether to do (a + b) or only (a).
but caller can already differentiate by using RPMH_ACTIVE_ONLY_STATE or RPMH_WAKE_ONLY_STATE.

i think at least for now, leave it as it is, unless we really see any impact by caller invoking all
3 types of request and take in account all such corner cases before i make any such change.
we can take it separate if needed along with optimization pointed in v9 series discussions.
>
>>                 break;
>>         case RPMH_WAKE_ONLY_STATE:
>> -               req->wake_val = cmd->data;
>> +               if (req->wake_val != cmd->data) {
>> +                       req->wake_val = cmd->data;
>> +                       ctrlr->dirty = true;
> As far as I can tell from the code, you can also avoid dirty if
> req->sleep_val == UINT_MAX since nothing will be sent if either
> sleep_val or wake_val are UINT_MAX.  Same in the sleep case where we
> can avoid dirty if wake_val == UINT_MAX.
>
>
>> +               }
>>                 break;
>>         case RPMH_SLEEP_STATE:
>> -               req->sleep_val = cmd->data;
>> -               break;
>> -       default:
>> +               if (req->sleep_val != cmd->data) {
>> +                       req->sleep_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                 break;
>>         }
> I wonder if instead of putting the dirty everywhere above it's better
> to cache the old value before the switch, then do:
>
> ctrl->dirty = (req->sleep_val != old_sleep_val ||
>   req->wake_val != old_wake_val) &&
>   req->sleep_val != UINT_MAX &&
>   req->wake_val != UINT_MAX;
>
>
> -Doug

Thanks,  this seems good. v11 on the way.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
