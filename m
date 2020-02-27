Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D2D170E05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 02:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgB0BvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 20:51:02 -0500
Received: from disco-boy.misterjones.org ([51.254.78.96]:44356 "EHLO
        disco-boy.misterjones.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728091AbgB0BvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 20:51:02 -0500
X-Greylist: delayed 2500 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Feb 2020 20:51:01 EST
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@misterjones.org>)
        id 1j77fv-008I1Q-2D; Thu, 27 Feb 2020 01:09:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 Feb 2020 01:09:14 +0000
From:   Marc Zyngier <maz@misterjones.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [RFC 1/2] irqchip: qcom: pdc: Introduce irq_set_wake call
In-Reply-To: <158265096050.177367.409185999509868538@swboyd.mtv.corp.google.com>
References: <1581944408-7656-1-git-send-email-mkshah@codeaurora.org>
 <1581944408-7656-2-git-send-email-mkshah@codeaurora.org>
 <158216527227.184098.17500969657143611632@swboyd.mtv.corp.google.com>
 <4c80783d-8ad0-9bd8-c42e-01659fa81afe@codeaurora.org>
 <158265096050.177367.409185999509868538@swboyd.mtv.corp.google.com>
Message-ID: <55bfc524f6c45419227c228c86fb20dc@misterjones.org>
X-Sender: maz@misterjones.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: swboyd@chromium.org, mkshah@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, mka@chromium.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, linux-kernel-owner@vger.kernel.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Maulik,

I'd appreciate if you could Cc me on all irqchip patches.

On 2020-02-25 17:16, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-02-21 03:20:59)
>> 
>> On 2/20/2020 7:51 AM, Stephen Boyd wrote:
>> 
>>     How are wakeups supposed to work when the CPU cluster power is 
>> disabled
>>     in low power CPU idle modes? Presumably the parent irq controller 
>> is
>>     powered off (in this case it's an ARM GIC) and we would need to 
>> have the
>>     interrupt be "enabled" or "unmasked" at the PDC for the irq to 
>> wakeup
>>     the cluster.
>> 
>> Correct. Interrupt needs to be "enabled" or "unmasked" at wakeup 
>> capable PDC
>> for irqchip to wakeup from "deep" low power modes where parent GIC may 
>> not be
>> monitoring interrupt and only PDC is monitoring.
>> these "deep" low power modes can either be triggered by kernel 
>> "suspend" or
>> "cpuidle" path for which drivers may or may not have registered for 
>> suspend or
>> cpu/cluster pm notifications to make a decision of enabling wakeup 
>> capability.

Loosing interrupt delivery in idle is not an acceptable behaviour. Idle 
!= suspend.

>> 
>> 
>>     We shouldn't need to enable irq wake on any irq for the CPU
>>     to get that interrupt in deep CPU idle states.
>> 
>> + *
>> + *     Note: irq enable/disable state is completely orthogonal
>> + *     to the enable/disable state of irq wake.
>> 
>> i think that's what above documentation said to have wakeup capability 
>> is
>> orthogonal to enable/disable state of irq, no?
>> 
>> A deep cpuidle entry is also orthogonal to drivers unless they 
>> register for cpu
>> pm notifications.
>> 
>> so with this change,
>> if the drivers want their interrupt to be wakeup capable during both 
>> "suspend"
>> and "cpuidle" they can call "enable_irq_wake" and leave it there to be 
>> wake up
>> capable.
> 
> Where is there a mention about drivers registering for cpu PM
> notifications? I'm not aware of this being mentioned as a requirement.
> Instead, my understanding is that deep idle states shouldn't affect 
> irqs
> from being raised to the CPU. If such an irq is enabled and can't wake
> the system from deep idle and it's expected to interrupt during this
> idle time then perhaps the PDC driver needs to block deep idle states
> until that irq is disabled.

Indeed. Idle states shouldn't affect irq delivery. The irq_set_wake() 
call
deals with suspend, and idle is rather different from suspend.

Conflating the two seems pretty broken, and definitely goes against the
expected behaviour of device drivers. Is the expectation now that we are
going to see a flurry of patches adding irq_set_wake() calls all over 
the map?

> Does this scenario exist? It sounds like broken system design to have 
> an
> irq that can't wake from deep idle, but I see that PDC has a selective
> set of pins so maybe some irqs just aren't expected to wake the system
> up during idle.

That'd be terribly broken. We've had a similar discussion about a NXP
platform where only some interrupts could wake take the CPU out of idle.
The end result is that we don't idle on this system.

If the PDC can't take the CPU out of idle, then idle shouldn't be 
entered
when these broken interrupts are enabled.

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?
