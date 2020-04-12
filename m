Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C431A5ED3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 15:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgDLNvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 09:51:32 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19485 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726139AbgDLNvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 09:51:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586699492; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EGxLlFMz3kBajqwDflPlpmy0gZni0XcaG/FInswW3kM=; b=t4dVRW9bIItLGur94C3w+vNavC1C+pE4oQyECCI6/X4BZcR/b54AWRAsI5snn3LRgCzGcFr4
 Q8aLIuAnNNQmbHElpJtrnGeHLVCTCoWIa1FO1wlOx2LEqCl7bI8jjAd+gOhqPO6no8OMNjQB
 EQBO0Ab2elD6oTYZKArAP58t8TA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e931ce3.7f330bc3c1f0-smtp-out-n05;
 Sun, 12 Apr 2020 13:51:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 226BFC433F2; Sun, 12 Apr 2020 13:51:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.136.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B5BBC433CB;
        Sun, 12 Apr 2020 13:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B5BBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
 <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
 <158631424318.216820.1843109743502322053@swboyd.mtv.corp.google.com>
 <8553ce0f-6dda-b0e0-d67a-f76ce3c0f945@codeaurora.org>
 <158642017601.126188.6125314877042857783@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <bb13a6be-6d1c-4663-67fb-185072e7cc35@codeaurora.org>
Date:   Sun, 12 Apr 2020 19:21:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158642017601.126188.6125314877042857783@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/9/2020 1:46 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-04-08 00:08:48)
>> Hi,
>>
>> On 4/8/2020 8:20 AM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-04-05 23:32:19)
>>>> for CPU PM notification. They may be in autonomous mode executing
>>>> low power mode and do not require rpmh_flush() to happen from CPU
>>>> PM notification.
>>>>
>>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>> ---
>>>>    drivers/soc/qcom/rpmh-internal.h |  25 +++++---
>>>>    drivers/soc/qcom/rpmh-rsc.c      | 123 +++++++++++++++++++++++++++++++++++----
>>>>    drivers/soc/qcom/rpmh.c          |  26 +++------
>>>>    3 files changed, 137 insertions(+), 37 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>>>> index b718221..fbe1f3e 100644
>>>> --- a/drivers/soc/qcom/rpmh-rsc.c
>>>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>>>> @@ -6,6 +6,7 @@
>>> [...]
>>>> +
>>>> +static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>>>> +                                   unsigned long action, void *v)
>>>> +{
>>>> +       struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
>>>> +       int ret = NOTIFY_OK;
>>>> +
>>>> +       spin_lock(&drv->pm_lock);
>>>> +
>>>> +       switch (action) {
>>>> +       case CPU_PM_ENTER:
>>> I thought CPU_PM notifiers weren't supposed to be used anymore? Or at
>>> least, the genpd work that has gone on for cpuidle could be used here in
>>> place of CPU_PM notifiers?
>> genpd was used in v3 and v4 of this series, where from pd's .power_off
>> function, rpmh_flush() was invoked.
>>
>> genpd can be useful if target firmware supports PSCI's OSI mode, while
>> sc7180 is non-OSI target.
>>
>> The current approch (using cpu pm notification) can be used for both OSI
>> and non-OSI targets to invoke rpmh_flush() when last cpu goes to power down.
> Ok. Doug and I talked today and I re-read the earlier series and I think
> Sudeep was suggesting that if we're doing last man down activities here
> then we're better off using OSI vs. PC mode. But I can only assume
> that's because the concern is something here requires software's help
> for last man down activities like lowering a CPU voltage setting or
> turning off some power switch to a hardware block through some i2c
> message. The way I understand it the last man down activities here are
> just setting up the sleep and wake TCS FIFOs to "do the right thing"
> when the last CPU actually goes down and the first CPU wakes up by
> running through the pile of "instructions" that we program into the
> FIFOs.
>
> The execution of those instructions is all done in hardware so any
> aggregation or coordination between CPUs is not really important here.
> All that matters is that we set up the sleep and wake TCS FIFOs properly
> so that _if_ the whole CPU subsystem goes to sleep we're going to let
> the hardware turn off the right stuff and lower voltages, etc. and
> vice-versa for wake. If we didn't have to share the TCS FIFOs with
> active mode control then we could just tweak the sleep and wake TCS
> buckets at runtime and let the hardware state of the CPUs decide to
> trigger them at the right time.
Correct.
>   Unfortunately, we don't have that luxury
> and we're stuck repurposing the sleep TCS FIFO to control things like
> regulator voltages when the CPU is awake. Yuck!
RSC is having TCS HW and it is currently divided in ACTIVE/ SLEEP/ WAKE 
TCSes configuration.
The ACTICE TCS HW and SLEEP + WAKE TCS HW usecases are mutually 
exclusive, in the sense that when
ACTIVE TCS HW is in-use the SLEEP + WAKE TCSes are not (since CPU is 
already out of low power mode
doing active only transfer, firmware can not trigger deepest low power 
modes where SLEEP and WAKE TCses is used)

Similarly when SLEEP + WAKE TCSes HW are in-use, the ACTIVE TCS HW is 
not (since none of the CPU is in Linux
to send active message) With above, some of the RSCs already don't have 
dedicated ACTIVE TCS HW, and when we
want to send active-only message we borrow one TCS from WAKE TCS pool, 
configure it for ACTIVE use (like enable
completion IRQ for the TCS) and once done re-configure it to use as WAKE 
TCS only.

So with reduced HW (removing ACTIVE TCSes), the same functionality is 
achieved.
The rpmh driver is designed support such scenarios.

Thanks,
Maulik
>
>>> And so this isn't actually any different
>>> than what was proposed originally to use genpd for this?
>>>
> I guess this answer to this is yes. Which is fine. CPU PM notifiers are
> still used by various drivers to do things like save/restore state of
> devices that lose state when the CPUs power down. The use of genpd is
> helpful for OSI mode because it can describe how/when big and little
> clusters are powered off by putting them in different genpds. For
> counting the last CPU to turn off it seems simpler to just register for
> CPU PM notifiers and not care about genpd logic and nesting clusters,
> etc. I'm happy to see this not be a blocker.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
