Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412111977F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 11:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgC3Jjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 05:39:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19894 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727526AbgC3Jjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 05:39:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585561170; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ySEr7QCfkmYmy4fMOJGgd528pP/JLZ/CgTkWxZCcrDY=; b=muaL+ECSIPOw+HrzjHGozXP5cpQPhfzdSl4p5nEqPfUWH7cNOeQU4LfXVskg2MZfqr3oxSfU
 dKtf2LIzfKm2V3KG9uxhbAHH8Sko7jMcI4pTbpDS1LAqWeU/mgX1dBXgQOf8W1Ks1Vx02UUe
 +kE66f5v7x0WPmuNJ0A2Jxvmwqc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e81be51.7f14b56a1500-smtp-out-n04;
 Mon, 30 Mar 2020 09:39:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CCF1C44788; Mon, 30 Mar 2020 09:39:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.183.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 825BDC433F2;
        Mon, 30 Mar 2020 09:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 825BDC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFC v2] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
References: <1584019379-12085-1-git-send-email-mkshah@codeaurora.org>
 <1584019379-12085-2-git-send-email-mkshah@codeaurora.org>
 <158441069917.88485.95270915247150166@swboyd.mtv.corp.google.com>
 <bc2f75bc-1223-68b5-3c64-8ea17ee677cf@codeaurora.org>
 <158456608487.152100.9336929115021414535@swboyd.mtv.corp.google.com>
 <b5124e41-df99-c5d0-28d8-f0157db77ce1@codeaurora.org>
 <158465481295.152100.8582940107266934812@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <5bf58459-32d8-9448-1c38-ff0098084641@codeaurora.org>
Date:   Mon, 30 Mar 2020 15:09:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158465481295.152100.8582940107266934812@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/20/2020 3:23 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-19 02:56:31)
>> On 3/19/2020 2:44 AM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-03-16 23:47:21)
>>>> On 3/17/2020 7:34 AM, Stephen Boyd wrote:
>>>>> What happens if irq is "disabled" in software, because this is the first
>>>>> function called on the irq, and we aren't in suspend yet. Then we get
>>>>> the irq. Won't we be interrupting the CPU because we've enabled in PDC
>>>>> and GIC hardware? Why doesn't this function update the wake bit and then
>>>>> leave the force on irq logic to suspend entry? Will we miss an interrupt
>>>>> while entering suspend because of that?
>>>> As PDC (and GIC) have a role during "active" time as well, interrupt should be
>>>> enabled in PDC and GIC HW.
>>> Sure. When the irq is enabled we want to enable at the GIC, but if it
>>> isn't enabled and we're not in suspend I would think we don't want the
>>> irq enabled at the GIC. But this code is doing that. Why?
>> Since we want to wake up in idle path LPM as well, when IRQ is marked as wake up capable and even though its disabled.
> No. IRQs that are disabled but have wake enabled on them should not wake
> up the CPU from deep idle states (which is what I assume you mean by
> idle path LPM (Low Power Mode)). Only if the irq is enabled should it
> wake the CPU from deep idle states, and in this case irq wake state has
> nothing to do with that working or not.
Okay i will address this in V3.
>>>   I'd think we
>>> would want to make enable in the PDC driver enable the parent and then
>>> make the set_wake path just update some bitmap tracking wakeup enabled
>>> irqs.
>>>
>>> Then when we enter suspend we will enable any pdc interrupts only in the
>>> PDC so that we can wakeup from suspend if that interrupt comes in. When
>>> we wakeup we'll resend the edge interrupts to the GIC on the resume path
>>> and level interrupts will "just work" because they'll stay asserted
>>> throughout resume.
>>>
>>> The bigger problem would look to be suspend entry, but in that case we
>>> leave any interrupts enabled at the GIC on the path to suspend (see
>>> suspend_device_irq() and how it bails out early if it's marked for
>>> wakeup)
>> No it doesn't happen this way in suspend_device_irq(), not for this disabled IRQ.
>>
>> Agree, it's a bigger problem to set IRQ enabled at GIC HW which is already disabled in HW and SW but marked for wake up.
>> However suspend_device_irq() is of little or no-use here (for that particular IRQ). Let me step by step give details.
>>
>> This will benefit everyone to understand this problem. Correct me if something below in not happening as I listed.
>>
>> Step-1
>>
>> Driver invokes enable_irq_wake() to mark their IRQ wake up capable.
>>
>> Step-2
>>
>> After enable_irq_wake(), drivers invokes disable_irq().
>> Let's break it down how this disable_irq() will traverse (in current code, without this RFC PATCH)
>>
>> Step-2.1
>>
>> In kernel/irq/manage.c
>> disable_irq() => __disable_irq_nosync() => __disable_irq() => irq_disable()
>>
>> Step-2.2
>>
>> This will jump to kernel/irq/chip.c
>> irq_disable() => __irq_disable()  => which then calls chip's .irq_disable via desc->irq_data.chip->irq_disable(&desc->irq_data);
>> Note that this is a GPIO IRQ, gpiolib set's this .irq_disable for every gpio chip during registration
>>
>> (see below in drivers/gpio/gpiolib.c)
>> irqchip->irq_disable = gpiochip_irq_disable;
>>
>> So it doesn't take lazy path to disable at HW, its always unlazy (at-least for gpio IRQs)
> That looks like a bug. It appears that gpiolib is only hooking the irq
> disable path here so that it can keep track of what irqs are not in use
> by gpiolib and allow them to be used for GPIO purposes when the irqs are
> disabled. See commit 461c1a7d4733 ("gpiolib: override
> irq_enable/disable"). That code in gpiolib should probably see if lazy
> mode has been disabled on the irq and do similar things to what genirq
> does and then let genirq mask the gpios if they trigger during the time
> when the irq is disabled. Regardless of this design though, I don't
> understand why this matters.
yes i already did see the commit 461c1a7d4733. The change went in few 
years back now in gpiolib.

I wanted to point out that since gpiolib doesn't take lazy approch, the 
interrupt will

get disabled in HW the moment driver invokes disable_irq() from driver's 
suspend ops.

So during suspend someone need to re-enable in HW if its been marked for 
wakeup

This should happen probably at very late stage in suspend after all 
drivers are done.


>
>> Step-2.3
>>
>> Call Jumps to gpiochip_irq_disable()
>> This then invokes irq_chip's  .irq_disable via chip->irq.irq_disable(d)
>> which finally arrives at msmgpio irq_chip's msm_gpio_irq_disable() call from here.
>> it finds that IRQ controller is in hierarchy, so it invokes irq_chip_disable_parent().
>>
>> Step-2.4
>>
>> This invokes PDC irq_chip's qcom_pdc_gic_disable()
>> At this point,
>> This will go ahead and "disabled in PDC HW"
>> This also invokes irq_chip_disable_parent() since PDC is also in hierarchy with GIC.
>>
>> Step-2.5
>>
>> This invokes GIC's gic_mask_irq() since GIC doesn't have .irq_disable implemented, it instead invokes mask.
>> This will go ahead and "disables at GIC HW".
>>
>> Final status at the end of step 2:
>> (a)    IRQ is marked as wake up capable in SW
>> (b)    IRQ is disabled in both SW and HW at GIC and PDC
>>
>> Step-3
>> Device enters "suspend to RAM" which invokes suspend_device_irq()
>> Pasting the interested part here...
>>
>>         if (irqd_is_wakeup_set(&desc->irq_data)) {
>>                  irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
>>                  ...
>>                  return true;
>>          }
>>          ..
>>          __disable_irq(desc);
>>
>> Note that it bails out with above if condition here for IRQs that are marked wake up capable, as you have already pointed out.
>>
>> For the rest of IRQs it goes ahead and disables them at HW via invoking __disable_irq() (be it a GIC HW or PDC HW)
>> so when device is in suspend only wake up capable IRQs are finally left enabled in HW.
> __disable_irq() considers lazy setting or not and leaves the irq
> unmasked if the irq is lazy disabled. But we have the
> IRQCHIP_MASK_ON_SUSPEND flag set in the gpio irq controller and that
> properly masks the irq through the hierarchy if necessary. Again, this
> is fine and all but I don't see how it matters.
>
>> Now, If any driver that has only done step-1, then it make sense that it will bail out here and leave IRQ enabled in HW (to be precise in its
>> original state at HW, without disabling it)
>>
>> But some drivers did step-1 and step-2 both.
>>
>> Yes even for this case, it will still bail out here, since its marked as wake up capable but it defeats the purpose of bail out
>> (bail out is to NOT go ahead and disable at HW), but by doing step-2 driver already disabled the IRQ at HW well before
>> suspend_device_irq() is invoked.
>>
>> In other words, IRQ status stays same as what was at the end of step-2 (disabled in HW)
>>
>> So this whole function is of no use (for that particular IRQ part). Here driver is disabling IRQ on their own via step-2 and then asks
>> "hey remember I marked it as wake up capable in step-1, so IRQ should
>> resume system from suspend when it occurs" completely ignoring
>> the fact that its already disabled at HW in step-2.
>>
>> IMO, drivers should not even do step-2 here.  They should just mark irq as wake up capable and then let suspend framework decide whether
>> to keep it enabled or disabled in HW when entering to suspend (Read may only do step-1, then everything works fine with current code)
>>
>> Hope that above details makes it clear on why I way asking earlier to
>> remove unnecessary disable_irq() call from driver, I don't understand its usage
>> (at least till now its not clear to me). May be there are some reasons like seeing spurious IRQ when entering to suspend so driver may want to disable it in HW.
>>
>> But then responsibility is falling on either suspend framework to re-enable such wake up capable interrupts in HW.
>> This may be done by again invoking enable_irq() before bailing out for
>> wakeup capable IRQ in suspend_device_irq(). I don't know if this is acceptable.
>>
>> Someone from To/Cc may clarify if above can be done. Note that it may create problem for other drivers which does only step-1, by calling enable_irq()
>> during suspend, it will update desc->depth, so this agin need to be undo when resuming.
>>
>> Otherwise, it is currently falling onto the individual irq_chip's to avoid disabling in HW in the first place.
>>
>> this RFC patch tries to do same and address this problem in PDC irq_chip when control reaches at Step 2.4, to NOT disable at HW when the IRQ
>> is already marked wake up capable, it bails out at Step 2.4 in PDC irq_chip so that interrupt is left enabled in HW at both PDC and GIC HW level.
> I don't see any need to change genirq by changing how
> suspend_device_irq() is written, but I'm not the maintainer of this code.

See above reply, the someone mentioned above can be suspend_device_irq().

Since i don't see this as a problem for PDC irqchip alone but for every 
irqchip in kernel using GPIO

interrupts. Although i did not check how other platforms might be 
working, but i guess probably they don't

really disable at HW with disable_irq() or may not even have 
.irq_disable implemented in gpio irq_chip drivers.

>>> so we should be able to have some suspend entry hook in pdc that
>>> enables the irq in the PDC if it's in the wakeup bitmap. Then on the
>>> path to suspend the GIC can lose power at any point after we enable the
>>> wakeup path in PDC and then the system should resume and get the
>>> interrupt through the resend mechanism.
>> I thought of this to introduce suspend hook in PDC which decides to keep wake up marked irq enabled at PDC.
>> But then someone need to keep it enabled at GIC as well.
>>
>> PDC does not directly forward IRQ to CPU. PDC brings SoC out of low power mode where GIC does
>> not have power cut, it replays the interrupt at GIC in HW and that leads to forwarding interrupt
>> to CPU and resume from low power mode.
>> So PDC and GIC HW status should need to be in sync.
>>
> It sounds like PDC just passes along the level or edge and relies on the
> parent irq chip (GIC in this case) to have the irq unmasked so it can be
> seen at the CPU. If the irq is masked at the GIC does it still wakeup
> the CPU if it's unmasked at the PDC?
No. if IRQ is maksed at GIC it doesn't wakeup even though at PDC its 
unmasked.
>
> Does the PDC have any other registers that can latch an edge type irq
> across suspend so we can read it on resume? If that exists then we can
> have software resend irqs at resume time. I think this was asked before
> and the answer was it doesn't exist.
Correct it doesn't exist.
>
> If there isn't any sort of latching, then why can't we unmask the irq in
> the GIC hardware by calling irq_chip_enable_parent() from the suspend
> hook in PDC? That should guarantee that the irq is unmasked at the GIC
> when we're suspending and the GIC is about to lose power. And presumably
> the GIC state is restored by hardware on resume so that the PDC can
> forward the edge to the GIC which can interrupt the CPU because the
> interrupt was left unmasked. The idea is to capture wake and enable
> state in a bitmap, unmask at the PDC and GIC during system suspend if
> it's marked for wakeup regardless of enable state, and then mask in the
> PDC and GIC during resume if the irq is disabled in software. Does that
> fail somehow?

Okay i will implement suspend/resume hook in PDC and use bitmap to

unmask at PDC and GIC during suspend. Addressed in V3.

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
