Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D84217F595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 12:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCJLDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 07:03:15 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:64343 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbgCJLDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 07:03:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583838191; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=c4oW8IIqjmviFCEAZBm4P1/JnOBsbaaXtNNdfLZYOaA=;
 b=knIf8XSMfML9xCGBetSMP5VXlYvxdg2bykxhDzUnDwzXbh+FQDSJ1z3Wy2891DuJWlt57ufG
 4drfbtzWl7E4Lr7N30ssqeIesKABskxUc47Fne13aSUEpNwixEMb8XPMfF9ta5jHpI2y6v6D
 YWBC1R2h8y76Jf0CncDZtu/lCO0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6773ef.7f56735e1f80-smtp-out-n01;
 Tue, 10 Mar 2020 11:03:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3711AC433BA; Tue, 10 Mar 2020 11:03:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54EC8C433CB;
        Tue, 10 Mar 2020 11:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54EC8C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
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
 <8e307595-7758-6eb5-ab2d-73ab1ac1029c@codeaurora.org>
 <CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com>
Message-ID: <26b17bf5-7aa0-5853-a1b5-b6f6496aea13@codeaurora.org>
Date:   Tue, 10 Mar 2020 16:33:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/6/2020 3:52 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Mar 5, 2020 at 3:10 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>> To summarize:
>>>
>>> a) If the only allowable use of "WAKE_ONLY" is to undo "SLEEP_ONLY"
>>> then we should re-think the API and stop letting callers to
>>> rpmh_write(), rpmh_write_async(), or rpmh_write_batch() ever specify
>>> "WAKE_ONLY".  The code should just assume that "wake_only =
>>> active_only if (active_only != sleep_only)".  In other words, RPMH
>>> should programmatically figure out the "wake" state based on the
>>> sleep/active state and not force callers to do this.
>>>
>>> b) If "WAKE_ONLY" is allowed to do other things (or if it's not RPMH's
>>> job to enforce/assume this) then we should fully skip calling
>>> cache_rpm_request() for RPMH_ACTIVE_ONLY_STATE.
>>>
>>>
>>> NOTE: this discussion also makes me wonder about the is_req_valid()
>>> function.  That will skip sending a sleep/wake entry if the sleep and
>>> wake entries are equal to each other.  ...but if sleep and wake are
>>> both different than "active" it'll be a problem.
>> Hi Doug,
>>
>> To answer above points, yes in general it’s the understanding that wake is
>> almost always need to be equal to active. However, there can be valid reasons
>> for which the callers are enforced to call them differently in the first place.
>>
>> At present caller send 3 types of request.
>> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
>> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x0);
>> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0x99);
>>
>> Now, Lets assume we handle this in rpmh driver since wake=active and the caller
>> send only 2 type of request (lets call it active and sleep, since we have assumption
>> of wake=active, and we don’t want 3rd request as its handled in rpmh driver)
>> So callers will now invoke 2 types of request.
>>
>> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
>> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x0);
>>
>> with first type request, it now needs to serve 2 purpose
>> (a)    cache ACTIVE request votes as WAKE votes
>> (b)    trigger it out immediately (in ACTIVE TCS) as it need to be also complete immediately.
>>
>> For SLEEP, nothing changes. Now when entering to sleep we do rpmh_flush() to program all
>> WAKE and SLEEP request…so far so good…
>>
>> Now consider a corner case,
>>
>> There is something called a solver mode in RSC where HW could be in autonomous mode executing
>> low power modes. For this it may want to “only” program WAKE and SLEEP votes and then controller
>> would be in solver mode entering and exiting sleep autonomously.
>>
>> There is no ACTIVE set request and hence no requirement to send it right away as ACTIVE vote.
>>
>> If we have only 2 type of request, caller again need to differentiate to tell rpmh driver that
>> when it invoke
>>
>> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
>>
>> with this caching it as WAKE is fine  ((a) in above) but do not trigger it ((b) in above)
>>
>> so we need to again modify this API and pass another argument saying whether to do (a + b) or only (a).
>> but caller can already differentiate by using RPMH_ACTIVE_ONLY_STATE or RPMH_WAKE_ONLY_STATE.
>>
>> i think at least for now, leave it as it is, unless we really see any impact by caller invoking all
>> 3 types of request and take in account all such corner cases before i make any such change.
>> we can take it separate if needed along with optimization pointed in v9 series discussions.
> I totally don't understand what solver mode is for and when it's used,
> but I'm willing to set that aside for now I guess.  From looking at
> what you did for v12 it looks like the way you're expecting things to
> function is this:
>
> * ACTIVE: set wake state and trigger active change right away.
>
> * SLEEP: set only sleep state
>
> * WAKE: set only wake state, will take effect after next sleep/wake
> unless changed again before that happens.
>
>
> ...I'll look at the code with this understanding, now.  Presumably also:
>
> * We should document this.
Okay, i will document above.
> * If we see clients that are explicitly setting _both_ active and wake
> to the same thing then we can change the clients.  That means the only
> people using "WAKE" mode would be those clients that explicitly want
> the deferred action (presumably those using "solver" mode).
>
> Do those seem correct?
Correct. but i suggest to change clients only once solver mode changes go in.
until then leave clients to call ACTIVE and WAKE request separately (even with same data)
>
> If that's correct, I guess one subtle corner-case bug in
> is_req_valid().  Specifically if it's ever valid to do this:
>
> rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
> rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x0);
> rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0x0);
This scenario will never hit in solver mode.
when in solver, only WAKE and SLEEP requests are allowed to go through.
> ...then it won't work.  
will work out just fine, as said above.
> You'll transition between sleep/wake and stay
> with "data=0x99".  Since "sleep == wake" then is_req_valid() will
> return "false" and we won't bother programming the commands for
> sleep/wake.  One simple way to solve this is remove the
> "req->sleep_val != req->wake_val" optimization in is_req_valid().

This will still need to keep check.

the clients may invoke with below example data...

rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=0x10, data=0x99);
rpmh_write(RPMH_SLEEP_STATE, addr=0x10, data=0x99);
rpmh_write(RPMH_WAKE_ONLY_STATE, addr=0x10, data=0x99); (we assume wake=active)

while ACTIVE is immediatly sent, and resource already came to 0x99 level.

Now while flushing, there is no point in programming in SLEEP TCS as such when cmd triggers
from SLEEP TCS then it won't make any real level transition since its already brought up to
0x99 level with previous ACTIVE cmd. same reason goes for not programming it in WAKE TCS.

>
> I guess we should also document that "batch" doesn't work like this.
> The "batch" API is really designed around having exactly one "batch"
> caller (the interconnect code) and we assume that the batch code will
> be sending us pre-optimized commands I guess?  Specifically there
> doesn't seem to be anything trying to catch batch writes to "active"
> and also applying them to "wake".
Okay, i will document above.

Thanks,
Maulik

> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
