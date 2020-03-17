Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2051879D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 07:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgCQGrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 02:47:32 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:51241 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbgCQGrc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 02:47:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584427650; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9qIAZKh2GUdzPYkV6USYz1gjhSnW7AIrgJcI3X3Ylcc=; b=D9WtalTFPNgJbUhjmWzXSJJqSi/4O8UWjD2Q5sUMxAPD0mYr/HFKQ+Yf8CtPT7TnCTFFZEMn
 1ErxyDx91ELByBhcjX81I7ZCK2XbmJrcQYIJP4s7eZnsIu6Tu2O5LBYMrMUVjawwtCpbzDgM
 o7gh1wQKzUgGuaGwdXE2ZsVbVGg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e707282.7fa830ad8ca8-smtp-out-n02;
 Tue, 17 Mar 2020 06:47:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E363FC433CB; Tue, 17 Mar 2020 06:47:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5515BC433D2;
        Tue, 17 Mar 2020 06:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5515BC433D2
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
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <bc2f75bc-1223-68b5-3c64-8ea17ee677cf@codeaurora.org>
Date:   Tue, 17 Mar 2020 12:17:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158441069917.88485.95270915247150166@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/17/2020 7:34 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-12 06:22:59)
>> Change the way interrupts get enabled at wakeup capable PDC irq chip.
>>
>> Introduce irq_set_wake call which lets interrupts enabled at PDC with
>> enable_irq_wake and disabled with disable_irq_wake with certain
>> conditions.
>>
>> Interrupt will get enabled in HW at PDC and its parent GIC if they are
>> either enabled is SW or marked as wake up capable.
> Shouldn't we only enable in PDC and GIC if it's marked wakeup capable
> and we're entering suspend? Otherwise we should let the hardware enable
> state follow the software irq enable state?
Not only during "sleep" but PDC (and GIC) have a role during "active" time as well.
so we can not just enabled at PDC and GIC when entering to suspend, interrupt need
to keep interrupt enabled at PDC and GIC HW when out of suspend as well.
>
>> interrupt will get disabled in HW at PDC and its parent GIC only if its
>> disabled in SW and also marked as non-wake up capable.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>  drivers/irqchip/qcom-pdc.c | 124 ++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 117 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 6ae9e1f..d698cec 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> - * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>>   */
>>  
>>  #include <linux/err.h>
>> @@ -30,6 +30,9 @@
>>  
>>  #define PDC_NO_PARENT_IRQ      ~0UL
>>  
>> +DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
>> +DECLARE_BITMAP(pdc_enabled_irqs, PDC_MAX_IRQS);
> Please add static on both of these.
Sure.
>
>> +
>>  struct pdc_pin_region {
>>         u32 pin_base;
>>         u32 parent_base;
>> @@ -80,20 +83,32 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>         index = pin_out / 32;
>>         mask = pin_out % 32;
>>  
>> -       raw_spin_lock(&pdc_lock);
>>         enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
>>         enable = on ? ENABLE_INTR(enable, mask) : CLEAR_INTR(enable, mask);
>>         pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
>> -       raw_spin_unlock(&pdc_lock);
>>  }
>>  
>>  static void qcom_pdc_gic_disable(struct irq_data *d)
>>  {
>> +       bool wake_status;
> This name is not good. Why not 'wakeup_enabled'?
I will rename to 'wakeup_enabled'
>
>> +
>>         if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                 return;
>>  
>> -       pdc_enable_intr(d, false);
>> -       irq_chip_disable_parent(d);
>> +       raw_spin_lock(&pdc_lock);
>> +
>> +       clear_bit(d->hwirq, pdc_enabled_irqs);
> clear_bit() is atomic, so why inside the lock?
I will move it out of lock.
>
>> +       wake_status = test_bit(d->hwirq, pdc_wake_irqs);
>> +
>> +       /* Disable at PDC HW if wake_status also says same */
>> +       if (!wake_status)
> Should read as "if not wakeup_enabled".
I will update comment.
>
>> +               pdc_enable_intr(d, false);
>> +
>> +       raw_spin_unlock(&pdc_lock);
>> +
>> +       /* Disable at GIC HW if wake_status also says same */
>> +       if (!wake_status)
> This happens outside the lock, so I'm confused why any locking is needed
> in this function.
Okay, since test_bit() is also atomic so i will keep locking inside pc_enable_intr() as it is.
>
>> +               irq_chip_disable_parent(d);
>>  }
>>  
>>  static void qcom_pdc_gic_enable(struct irq_data *d)
>> @@ -101,7 +116,16 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
>>         if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                 return;
>>  
>> +       raw_spin_lock(&pdc_lock);
>> +
>> +       set_bit(d->hwirq, pdc_enabled_irqs);
>> +
>> +       /* We can blindly enable at PDC HW as we are already in enable path */
>>         pdc_enable_intr(d, true);
>> +
>> +       raw_spin_unlock(&pdc_lock);
>> +
>> +       /* We can blindly enable at GIC HW as we are already in enable path */
>>         irq_chip_enable_parent(d);
>>  }
>>  
>> @@ -121,6 +145,92 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>>         irq_chip_unmask_parent(d);
>>  }
>>  
>> +/**
>> + * qcom_pdc_gic_set_wake: Enables/Disables interrupt at PDC and parent GIC
>> + *
>> + * @d: the interrupt data
>> + * @on: enable or disable wakeup capability
>> + *
>> + * The SW expects that an irq that's disabled with disable_irq()
>> + * can still wake the system from sleep states such as "suspend to RAM",
>> + * if it has been marked for wakeup.
>> + *
>> + * While the SW may choose to differ status for "wake" and "enabled"
>> + * interrupts, its not the case with HW. There is no dedicated
>> + * configuration in HW to differ "wake" and "enabled". Same is
>> + * case for PDC's parent irq_chip (ARM GIC) which has only GICD_ISENABLER
>> + * to indicate "enabled" or "disabled" status and also there is no .irq_set_wake
>> + * implemented in parent GIC irq_chip.
>> + *
>> + * So, the HW ONLY understands either "enabled" or "disabled".
>> + *
>> + * This function is introduced to handle cases where drivers may invoke
>> + * below during suspend in SW on their irq, and expect to wake up from this
>> + * interrupt.
>> + *
>> + * 1. enable_irq_wake()
>> + * 2. disable_irq()
>> + *
>> + * and below during resume
>> + *
>> + * 3. disable_irq_wake()
>> + * 4. enable_irq()
>> + *
>> + * if (2) is invoked in end and just before suspend, it currently leaves
> We shouldn't document the currently broken state of the code. Please
> reword this.
Okay.
>
>> + * interrupt "disabled" at HW and hence not leading to resume.
>> + *
>> + * Note that the order of invoking (1) & (2) may interchange and similarly
>> + * it can interchange for (3) & (4) as per driver's wish.
>> + *
>> + * if the driver call .irq_set_wake first it will enable at HW but later
> s/if/If/
I will address.
>
>> + * call with .irq_disable will disable at HW. so final result is again
> s/so/So/
I will address.
>
>> + * "disabled" at HW whereas the HW expectection is to keep it "enabled"
> s/expectection/expectation/
I will address.
>
>> + * since it understands only "enabled" or "disabled".
>> + *
>> + * Hence .irq_set_wake can not just go ahead and  "enable" or "disable"
>> + * at HW blindly, it needs to take in account status of currently "enable"
> s/in/into/
I will address.
>
>> + * or "disable" as well.
> "status of currently enable or disable as well" doesn't make any sense
> to me. Is this "take into account if the interrupt is enabled or
> disableed"?
I will address.
>
>> + *
>> + * Introduce .irq_set_wake in PDC irq_chip to handle above issue.
>> + * The final status in HW should be an "OR" of "enable" and "wake" calls.
>> + * (i.e. same as below table)
>> + * -------------------------------------------------|
>> + * ENABLE in SW | WAKE in SW | PDC & GIC HW Status  |
> Presumably 'PDC & GIC HW status' means enabled in PDC and GIC hardware?
True.
>
>> + *      0       |     0      |     0               |
>> + *      0      |     1      |     1                |
>> + *     1       |     0      |     1                |
>> + *     1       |     1      |     1                |
>> + *--------------------------------------------------|
> Are there tabs in here? Probably better to just use spaces everywhere or
> drop the OR table because it's literally just two variables.
>
>  irq enable | irq wake == PDC & GIC hardware irq enabled
Okay, i will remove table and keep above.
>
>> + */
>> +
>> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
>> +{
>> +       bool enabled_status;
>> +
>> +       if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> +               return 0;
>> +
>> +       raw_spin_lock(&pdc_lock);
>> +       enabled_status = test_bit(d->hwirq, pdc_enabled_irqs);
>> +       if (on) {
>> +               set_bit(d->hwirq, pdc_wake_irqs);
>> +               pdc_enable_intr(d, true);
>> +       } else {
>> +               clear_bit(d->hwirq, pdc_wake_irqs);
>> +               pdc_enable_intr(d, enabled_status);
>> +       }
>> +
>> +       raw_spin_unlock(&pdc_lock);
>> +
>> +       /* Either "wake" or "enabled" need same status at parent as well */
>> +       if (on || enabled_status)
>> +               irq_chip_enable_parent(d);
>> +       else
>> +               irq_chip_disable_parent(d);
> What happens if irq is "disabled" in software, because this is the first
> function called on the irq, and we aren't in suspend yet. Then we get
> the irq. Won't we be interrupting the CPU because we've enabled in PDC
> and GIC hardware? Why doesn't this function update the wake bit and then
> leave the force on irq logic to suspend entry? Will we miss an interrupt
> while entering suspend because of that?
As PDC (and GIC) have a role during "active" time as well, interrupt should be
enabled in PDC and GIC HW.
>
> Otherwise, I wonder why the code can't be:
>
> 	if (on)
> 		set_bit(d->hwirq, pdc_wake_irqs);
> 	else
> 		clear_bit(d->hwirq, pdc_wake_irqs);
> 	
> 	pdc_enable_intr(d, on);
>
> Then we can leave the lock inside the pdc_enable_intr() function 
okay, since set_bit(), clear_bit(), test_bit() are atomic, i will address this to keep
locking inside pdc_enable_intr() only.
> and
> test for both bitmasks there and or in whatever software is asking for?
> It would be nice to simplify the callers and make the code that actually
> writes the hardware do a small bit test and set operation.
.irq_set_wake is testing both "enabled" and "wake" bitmask and then invoking respective parent API.
IMO, This is simpler to keep PDC functionality separate in pdc_enable_intr() and not mix it with invoking parent APIs.
>
>> +
>> +       return irq_chip_set_wake_parent(d, on);
>> +}
>> +
>>  /*
>>   * GIC does not handle falling edge or active low. To allow falling edge and
>>   * active low interrupts to be handled at GIC, PDC has an inverter that inverts
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
