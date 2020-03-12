Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53AE9182F4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 12:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLLdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 07:33:12 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48720 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725268AbgCLLdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 07:33:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584012791; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VqfYby1FdkRa59G1DrIfjKSNPbtsxq7jXtDTplbWPLA=; b=a0hyc17BZoEf5YufDviEAVIvPxHwlZJ1WZSu2DfAwdHDRbBYeTC9MyLHCbbNzN5qXbd1QPlv
 DcSQzVNSwGOtE4C9uhuv9GOmOSeJ/V2dAQavl1vM32HQw2Rm75OOVdU8ovKt8hjtLzxXpyGr
 sy9YQjENwGrvKDeBY67w7MMKYhM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6a1df7.7fee11b80f80-smtp-out-n01;
 Thu, 12 Mar 2020 11:33:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 19A0CC43636; Thu, 12 Mar 2020 11:33:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F34CFC433CB;
        Thu, 12 Mar 2020 11:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F34CFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFC 1/2] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Marc Zyngier <maz@misterjones.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, linux-kernel-owner@vger.kernel.org
References: <1581944408-7656-1-git-send-email-mkshah@codeaurora.org>
 <1581944408-7656-2-git-send-email-mkshah@codeaurora.org>
 <158216527227.184098.17500969657143611632@swboyd.mtv.corp.google.com>
 <4c80783d-8ad0-9bd8-c42e-01659fa81afe@codeaurora.org>
 <158265096050.177367.409185999509868538@swboyd.mtv.corp.google.com>
 <55bfc524f6c45419227c228c86fb20dc@misterjones.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <6fd12e17-5216-d136-b454-2ee7e4a1686e@codeaurora.org>
Date:   Thu, 12 Mar 2020 17:03:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <55bfc524f6c45419227c228c86fb20dc@misterjones.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/27/2020 6:39 AM, Marc Zyngier wrote:
> Maulik,
>
> I'd appreciate if you could Cc me on all irqchip patches.

Sure Marc, i kept you in Cc for V2 addressing stephen's comments.

>
> On 2020-02-25 17:16, Stephen Boyd wrote:
>> Quoting Maulik Shah (2020-02-21 03:20:59)
>>>
>>> On 2/20/2020 7:51 AM, Stephen Boyd wrote:
>>>
>>>     How are wakeups supposed to work when the CPU cluster power is disabled
>>>     in low power CPU idle modes? Presumably the parent irq controller is
>>>     powered off (in this case it's an ARM GIC) and we would need to have the
>>>     interrupt be "enabled" or "unmasked" at the PDC for the irq to wakeup
>>>     the cluster.
>>>
>>> Correct. Interrupt needs to be "enabled" or "unmasked" at wakeup capable PDC
>>> for irqchip to wakeup from "deep" low power modes where parent GIC may not be
>>> monitoring interrupt and only PDC is monitoring.
>>> these "deep" low power modes can either be triggered by kernel "suspend" or
>>> "cpuidle" path for which drivers may or may not have registered for suspend or
>>> cpu/cluster pm notifications to make a decision of enabling wakeup capability.
>
> Loosing interrupt delivery in idle is not an acceptable behaviour. Idle != suspend.

Agree, we are not lossing it, but rather RFC v1 was keeping a requirement on drivers to keep wake

enabled by calling irq_set_wake when the interrupt is routed via PDC, even after coming out of suspend.

i addressed this in RFC v2.

>
>>>
>>>
>>>     We shouldn't need to enable irq wake on any irq for the CPU
>>>     to get that interrupt in deep CPU idle states.
>>>
>>> + *
>>> + *     Note: irq enable/disable state is completely orthogonal
>>> + *     to the enable/disable state of irq wake.
>>>
>>> i think that's what above documentation said to have wakeup capability is
>>> orthogonal to enable/disable state of irq, no?
>>>
>>> A deep cpuidle entry is also orthogonal to drivers unless they register for cpu
>>> pm notifications.
>>>
>>> so with this change,
>>> if the drivers want their interrupt to be wakeup capable during both "suspend"
>>> and "cpuidle" they can call "enable_irq_wake" and leave it there to be wake up
>>> capable.
>>
>> Where is there a mention about drivers registering for cpu PM
>> notifications? I'm not aware of this being mentioned as a requirement.
>> Instead, my understanding is that deep idle states shouldn't affect irqs
>> from being raised to the CPU. If such an irq is enabled and can't wake
>> the system from deep idle and it's expected to interrupt during this
>> idle time then perhaps the PDC driver needs to block deep idle states
>> until that irq is disabled.
>
> Indeed. Idle states shouldn't affect irq delivery. The irq_set_wake() call
> deals with suspend, and idle is rather different from suspend.
>
> Conflating the two seems pretty broken, and definitely goes against the
> expected behaviour of device drivers. Is the expectation now that we are
> going to see a flurry of patches adding irq_set_wake() calls all over the map?
>
>> Does this scenario exist? It sounds like broken system design to have an
>> irq that can't wake from deep idle, but I see that PDC has a selective
>> set of pins so maybe some irqs just aren't expected to wake the system
>> up during idle.
>
> That'd be terribly broken. We've had a similar discussion about a NXP
> platform where only some interrupts could wake take the CPU out of idle.
> The end result is that we don't idle on this system.
>
> If the PDC can't take the CPU out of idle, then idle shouldn't be entered
> when these broken interrupts are enabled.
>
> Thanks,
>
>         M.

This is not the case, we don't loose any interrupt in CPUidle.

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
