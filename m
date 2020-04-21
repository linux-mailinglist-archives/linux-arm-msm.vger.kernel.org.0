Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BF51B1EE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 08:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgDUGfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 02:35:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61436 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbgDUGfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 02:35:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587450934; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=EvqRSIKro33AP/3hxSOTL00uYFh45zLbNMuBPIqaWFM=;
 b=JYmaDf/v9L/n+nv3JPssixUe7h2Br2mX9VjAowEG3GlXJ75L3N/yxHtaqyBbUMyKDlgfcxjp
 yGzDdm1MmpMckHWGPIGSrIyJms32nkR5L4sgo11KT8Eoo/4kD09D+Vm9zkt1Zj9wRArt/RrG
 sktb7rZdHDL8buJM87zQG8hUHTw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9e942a.7f4ab3196148-smtp-out-n03;
 Tue, 21 Apr 2020 06:35:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DD5CC433CB; Tue, 21 Apr 2020 06:35:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.184.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E13E5C433D2;
        Tue, 21 Apr 2020 06:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E13E5C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org>
 <1585586460-3272-2-git-send-email-mkshah@codeaurora.org>
 <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com>
 <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org>
 <158693796555.105027.4658047860202135403@swboyd.mtv.corp.google.com>
Message-ID: <bddc11e0-8d9a-dd55-3aab-42aeb18204f4@codeaurora.org>
Date:   Tue, 21 Apr 2020 12:05:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158693796555.105027.4658047860202135403@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/15/2020 1:36 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-04-14 01:05:36)
>> Hi,
>>
>> On 4/14/2020 6:05 AM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-03-30 09:41:00)
>>>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>>>> index 6ae9e1f..c43715b 100644
>>>> --- a/drivers/irqchip/qcom-pdc.c
>>>> +++ b/drivers/irqchip/qcom-pdc.c
>>>> +                        * the pending interrupt gets cleared at GIC before
>>>> +                        * enabling it from msm_gpio_irq_enable(). So CPU will
>>>> +                        * never see pending IRQ after resume if we disable them
>>>> +                        * here.
>>> Is there something that's doing this in the gpio driver? It sounds
>>> like the bug lies in that driver. Maybe the gpio driver should use
>>> irq_startup instead of irq_enable to clear anything pending? The comment
>>> in msm_gpio_irq_enable() talks a lot but doesn't actually say why it's a
>>> problem to be latched at the GIC as pending when the irq is enabled the
>>> first time.
>> This is to clear any erroneous interrupts that would have got latched
>> when the interrupt is not in use.
>>
>> There may be devices like UART which can use the same gpio line for data
>> rx as well as a wakeup gpio
>>
>> The data that was flowing on the line may latch the interrupt and when
>> we enable the interrupt,we see IRQ pending and unexpected IRQ gets
>> triggered.
> Isn't the interrupt supposed to latch in the hardware in this scenario?
> We wanted to wakeup from UART RX over GPIO, and we did, and we also
> wanted to send that data through the pin to the UART core, so I suspect
> we muxed it as a UART pin and also watched it for an irq wakeup in the
> GPIO driver and PDC? The wakeup irq handler can be ignored by the UART
> driver if it wants.
I will check this if i can operate only on PDC and GIC IRQs and can 
ignore PDC-GPIO domain IRQ.
Working on it.
>
>>>> +                               continue;
>>>> +                       }
>>>> +
>>>> +                       irq_chip_disable_parent(d);
>>>> +               }
>>>> +       }
>>>> +       p->from_pdc_suspend = false;
>>>> +}
>>>> +
>>>> +static int pdc_cpu_pm_callback(struct notifier_block *nfb,
>>>> +                              unsigned long action, void *v)
>>>> +{
>>>> +       struct pdc_pm_data *p = container_of(nfb, struct pdc_pm_data,
>>>> +                                            pdc_cpu_pm_nfb);
>>>> +       unsigned long flags;
>>>> +
>>>> +       if (!p->suspend_start)
>>>> +               return NOTIFY_OK;
>>>> +
>>>> +       spin_lock_irqsave(&p->pm_lock, flags);
>>>> +       switch (action) {
>>>> +       case CPU_PM_ENTER:
>>>> +               cpumask_set_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
>>>> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
>>>> +                       pdc_suspend(p);
>>>> +               break;
>>>> +       case CPU_PM_ENTER_FAILED:
>>>> +       case CPU_PM_EXIT:
>>>> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
>>>> +                       pdc_resume(p);
>>>> +               cpumask_clear_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
>>>> +               break;
>>>> +       }
>>>> +       spin_unlock_irqrestore(&p->pm_lock, flags);
>>> What is the point of this callback? Any irqs that we want to wakeup the
>>> CPUs from deep idle should be enabled via enable_irq(). Otherwise, they
>>> shouldn't wake up the system. That's the difference between idle and
>>> suspend.
>> We already discussed and agreed to treat IRQs differently in idle and
>> suspend.
>> In summary if a SW does disable and mark IRQ as wake up capable.
>> 1.    irq_disable()
>> 2.    enable_irq_wake()
>>
>> Since the HW don't understand wake, it only knows either enabled or
>> disabled IRQ. So the HW should do below.
>> 1.    if system is in suspend, the IRQ should be kept Enabled in HW
>> 2.    if system is out of suspend, the IRQ should be kept disabled in HW
> Why should it be kept disabled at the PDC and GIC when the system is out
> of suspend? Is that because software hasn't enabled the irq yet upon
> resume and we're waiting for the irq consumer driver (EC for example) to
> do that?
No, for validation of this change, i did below scenario

During a probe of a driver, requested an IRQ and then mark it as wakeup 
capable and disabled it.
 From driver, after probe is done with above operation, we never do any 
enable/disable/wakeup operation.

In above scenario,

1.    if system is in suspend, the IRQ should be kept Enabled in HW
     (since it was marked for wakeup during probe, right?)
2.    if system is out of suspend, the IRQ should be kept disabled in HW
     (since it was disabled in probe, and never again enabled it, right?)

i wanted to test if in HW its Enabled properly during suspend entry
(since we differ status for idle and suspend, in above scenario IRQ 
should be enabled in HW only during suspend
and then when system is out of suspend it should get disabled in HW again)

of course, if we ever woke up from suspend with this wake up capable 
IRQ, the handler will never get called
since its forever marked as disabled in SW but yet the HW is still 
allowed to wake from this IRQ.
>
> In the CPU idle path (i.e. the system isn't suspending) I'd expect the
> PDC and GIC hwirqs to be enabled so that the interrupt can trigger at
> anytime. This is the normal mode of operation.
Correct
> When the CPU goes to
> idle, and for that matter all the CPUs go to idle, the PDC should still
> be monitoring the irqs that are enabled with irq_enable() and wake up
> the CPU to receive the irq by taking all the CPUs out of deep idle
> states where the GIC is powered off. If the irq is disabled with
> irq_disable(), I'd think we would want to disable in the PDC so that the
> irq doesn't wake us up from idle unnecessarily.
yes, we do all this with current patch.
>
> Long story short, CPUs going in and out of idle and system not
> suspending or freezing for s2idle means the PDC enable state should
> follow irq enable state and completely ignore wake state. During system
> suspend or freezing for s2idle the PDC enable state should follow wake
> state. The tricky part is making sure the suspend and resume path
> doesn't miss some interrupt that would have woken us up.
Agree, we do all settings in PDC / GIC HW during deep suspend/ s2idle 
suspend
and revert back to orignal state in HW when coming out of suspend
>
> I thought that maybe lazy irq disable would save us here.
the lazy doesn't work for GPIO IRQs, gpiolib registers for .irq_disable 
for every gpio chip.
> The PDC
> monitored irq could be disabled in software during suspend but not
> actually disabled in hardware, so the irq could still latch. If it does
> latch during suspend then we'll abort suspend either via hardware or
> software detecting this case. Once we hit the end of suspend, we can
> disable the PDC interrupts that aren't marked for wakeup. Implicitly,
> the other interrupts that are marked for wakeup are already enabled
> because they must have been lazily disabled or left enabled during
> suspend. On the resume path we may have enabled some PDC interrupt for
> wakeup that wasn't supposed to be enabled because software disabled it,
> but it's all lazy so if it didn't trigger it doesn't matter, just let it
> trigger later and if it does genirq will mask it appropriately and mark
> it as pending.
>
>> As we have two different suspend states namely suspend-to-idle (s2idle)
>> and deep suspend.
> Great! I'm glad you're interested in enabling s2idle.
yes i am interested, s2idle is working fine on sc7180.
>
>> The PDC driver need to know "when" we are in suspend path. This is where
>> pdc_pm_callback is used, it will
>> listen to PM_SUSPEND_PREPARE and PM_POST_SUSPEND events to know when
>> system is entered in to suspend path
>> and when it exited.
>>
>> Then comes the CPU PM notifier.
>> If we are not in suspend path, the CPU PM notifier immediately returns,
>> but when we are in suspend path,
>> it starts marking CPUs to know when the last CPU notifies, it will
>> invoke pdc_suspend().
>> That finally programs the HW accordingly.
>>
>> Why last CPU? Because PDC is irq_chip and should execute suspend ops at
>> very last stage during suspend.
>>
>> (if PDC registered for dev pm ops, It could happen that PDC's .suspend
>> callback gets called first and then
>> Let's say EC driver's .suspend is called where it does above to disable
>> and mark IRQ as wakeup capable,
>> however PDC should have called only after EC driver is done operating on
>> its IRQ from its .suspend call)
>>
>> Syscore ops are good to handle such scenarios since by this time all
>> non-boot CPUs are offlined and we are
>> running on boot CPU (last CPU) But then if someone chooses to enter
>> "s2idle", syscore ops are not invoked in
>> s2idle suspend path.
>>
>> I take we want to wake up with disabled but wakeup capable IRQ during
>> s2idle suspend as well?
>>
>> If that is not the case, i can remove these notifiers and register for
>> sycore ops.
>> from syscore op's .suspend we can call pdc_suspend()..
>>
>> This answer's your below comment as well on why can't we use irqchip's
>> irq_suspend() and irq_resume() calls,
>> since they also get internally invoked from syscore ops only.
> Actually no it doesn't. It looks like the irqchip irq_suspend() and
> irq_resume() ops are only called when the driver uses the generic
> irqchip implementation. That doesn't look to be used here.
correct
> Good point
> about the syscore ops and s2idle interaction, but it's not the real
> reason why these ops can't be used.
No internally generic chip also looks using syscore ops 
(irq_gc_syscore_ops)
to invoke generic irq_chip's irq_suspend and irq_resume callbacks

since s2idle still don't call syscore ops, these callback will never get 
invoked
if s2idle suspend is entered.
>
> Maybe we can always call the ops from somewhere deep in the suspend path
> instead of using a notifier. That may make it simpler to reason about
> and fix the s2idle problem at the same time. Putting it into a notifier
> is difficult to understand and could potentially have a problem if
> something like the timer irq needs to stay enabled until the end of
> suspend but our suspend ops turn it off.
we are not using suspend ops for same reason, with notifiers this will 
never happen, since we can determine last cpu

1. during s2idle suspend
     for all CPUs cpu_pm notifier will be called. we can determine which 
one is last cpu calling it.

2. during deep suspend
     non-boot cpus get disabled and from last cpu, kernel/cpu_pm.c 
registers for syscore ops and via
    this ops it invokes cpu_pm notification. so we know it is last cpu.

so both cases these will be invoked at very last stage of suspend(be it 
s2idle or deep) when all other drivers are done

and we will never run into above scenario.

> That's what syscore is
> typically important for. It gets the callback out of the path where
> interrupts are still enabled and could potentially interfere with the
> irqchip being disrupted. Maybe suspend_device_irqs() can be extended
> here. I'm not sure.
>
>>> In suspend, we want wakeup enabled irqs to wake us up from
>>> suspend no matter if the irq is enabled or not. But for idle, we don't
>>> care about the wakeup enable bit at all. The only bit that matters is
>>> that the irq is enabled and then the expectation is that it will wake us
>>> up. If there's some irq that can't wake us up from idle then we'll have
>>> to just ignore that interrupt across deep CPU idle states. Is that
>>> actually a problem? Or the SoC architects have figured out that certain
>>> irqs don't matter for deep CPU idle states and so we don't have to
>>> monitor them?
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
