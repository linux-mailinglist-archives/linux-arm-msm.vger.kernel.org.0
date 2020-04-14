Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C71E1A756D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 10:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406938AbgDNIG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 04:06:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21844 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729378AbgDNIGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 04:06:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586851604; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z2UCai6i7z+FxS55FHt2D4Ql2X/hQBevmIi8zZs0ylk=; b=f72Tvj8MixWzVLNsdKOQQuPmFYE8InaUeEmWh3mqsrYSKI+HZO+Byw22RTpRxWDWiK6AvMRJ
 NKA7cj1E5ReBYd5K6kO3ErX0+IUSw3EjeZVybkRE97+np5EZUMtqMqNGjjasSd8Y2sgUn1ZD
 jwkamRowTA2bu0QBUJRiEOixF/4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e956f04.7f332bc251b8-smtp-out-n01;
 Tue, 14 Apr 2020 08:06:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8244EC432C2; Tue, 14 Apr 2020 08:06:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.14.155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D797FC433BA;
        Tue, 14 Apr 2020 08:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D797FC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
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
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:35:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/14/2020 6:05 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-30 09:41:00)
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 6ae9e1f..c43715b 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -36,6 +38,23 @@ struct pdc_pin_region {
>>          u32 cnt;
>>   };
>>   
>> +struct pdc_pm_data {
>> +       struct cpumask cpus_in_pc;
>> +       spinlock_t pm_lock;
>> +       bool suspend_start;
>> +       bool from_pdc_suspend;
>> +       struct notifier_block pdc_pm_nfb;
>> +       struct notifier_block pdc_cpu_pm_nfb;
>> +
>> +       DECLARE_BITMAP(pdc_domain_enabled_irqs, PDC_MAX_IRQS);
>> +       DECLARE_BITMAP(pdc_domain_wake_irqs, PDC_MAX_IRQS);
>> +       DECLARE_BITMAP(pdc_gpio_domain_enabled_irqs, PDC_MAX_GPIO_IRQS);
>> +       DECLARE_BITMAP(pdc_gpio_domain_wake_irqs, PDC_MAX_GPIO_IRQS);
>> +
>> +       struct irq_domain *pdc_domain;
>> +       struct irq_domain *pdc_gpio_domain;
>> +};
> Everything else is just a static local variable here. It looks odd to
> have this struct to contain all this stuff but then have everything else
> below be outside of it. If we're going to have a container node I'd
> prefer that be another patch that makes this driver no longer a
> singleton.
Sure, I will add it to my To-Do to move other items as well in this 
struct but in a separate patch, mostly once this one gets in 
reviewed/aggreed to lands in kernel.
>
>> +
>>   static DEFINE_RAW_SPINLOCK(pdc_lock);
>>   static void __iomem *pdc_base;
>>   static struct pdc_pin_region *pdc_region;
>> @@ -89,18 +108,38 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>   
>>   static void qcom_pdc_gic_disable(struct irq_data *d)
>>   {
>> +       struct pdc_pm_data *p;
>> +
>>          if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                  return;
>>   
>> +       p = irq_data_get_irq_chip_data(d);
>> +       if (!p->from_pdc_suspend) {
>> +               if (irq_domain_qcom_handle_wakeup(d->domain))
>> +                       clear_bit(d->hwirq, p->pdc_gpio_domain_enabled_irqs);
>> +               else
>> +                       clear_bit(d->hwirq, p->pdc_domain_enabled_irqs);
>> +       }
>> +
>>          pdc_enable_intr(d, false);
>>          irq_chip_disable_parent(d);
>>   }
>>   
>>   static void qcom_pdc_gic_enable(struct irq_data *d)
>>   {
>> +       struct pdc_pm_data *p;
>> +
>>          if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                  return;
>>   
>> +       p = irq_data_get_irq_chip_data(d);
>> +       if (!p->from_pdc_suspend) {
>> +               if (irq_domain_qcom_handle_wakeup(d->domain))
>> +                       set_bit(d->hwirq, p->pdc_gpio_domain_enabled_irqs);
>> +               else
>> +                       set_bit(d->hwirq, p->pdc_domain_enabled_irqs);
>> +       }
>> +
>>          pdc_enable_intr(d, true);
>>          irq_chip_enable_parent(d);
>>   }
>> @@ -145,6 +184,39 @@ enum pdc_irq_config_bits {
>>   };
>>   
>>   /**
>> + * qcom_pdc_gic_set_wake: Mark IRQ as wakeup capable
>> + *
>> + * @d: the interrupt data
>> + * @on: enable or disable wakeup capability
>> + *
>> + * Mark IRQ as wake up capable at either pdc_domain or pdc_gpio_domain.
>> + * This will be used when entering to suspend where if any wakeup capable
>> + * IRQ is already disabled in SW, such IRQ needs to be re-enabled at HW.
>> + */
>> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
>> +{
>> +       struct pdc_pm_data *p;
>> +
>> +       if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> +               return 0;
>> +
>> +       p = irq_data_get_irq_chip_data(d);
>> +       if (on) {
>> +               if (irq_domain_qcom_handle_wakeup(d->domain))
>> +                       set_bit(d->hwirq, p->pdc_gpio_domain_wake_irqs);
>> +               else
>> +                       set_bit(d->hwirq, p->pdc_domain_wake_irqs);
>> +       } else {
>> +               if (irq_domain_qcom_handle_wakeup(d->domain))
>> +                       clear_bit(d->hwirq, p->pdc_gpio_domain_wake_irqs);
>> +               else
>> +                       clear_bit(d->hwirq, p->pdc_domain_wake_irqs);
>> +       }
>> +
>> +       return irq_chip_set_wake_parent(d, on);
>> +}
>> +
>> +/**
>>    * qcom_pdc_gic_set_type: Configure PDC for the interrupt
>>    *
>>    * @d: the interrupt data
>> @@ -202,14 +274,162 @@ static struct irq_chip qcom_pdc_gic_chip = {
>>          .irq_get_irqchip_state  = qcom_pdc_gic_get_irqchip_state,
>>          .irq_set_irqchip_state  = qcom_pdc_gic_set_irqchip_state,
>>          .irq_retrigger          = irq_chip_retrigger_hierarchy,
>> +       .irq_set_wake           = qcom_pdc_gic_set_wake,
>>          .irq_set_type           = qcom_pdc_gic_set_type,
>>          .flags                  = IRQCHIP_MASK_ON_SUSPEND |
>> -                                 IRQCHIP_SET_TYPE_MASKED |
>> -                                 IRQCHIP_SKIP_SET_WAKE,
>> +                                 IRQCHIP_SET_TYPE_MASKED,
>>          .irq_set_vcpu_affinity  = irq_chip_set_vcpu_affinity_parent,
>>          .irq_set_affinity       = irq_chip_set_affinity_parent,
>>   };
>>   
>> +static struct irq_data *pdc_find_irq_data(struct irq_domain *domain,
>> +                                         int wake_irq)
>> +{
>> +       int irq = irq_find_mapping(domain, wake_irq);
>> +       struct irq_desc *desc = irq_to_desc(irq);
>> +
>> +       return &desc->irq_data;
>> +}
>> +
>> +/**
>> + * pdc_suspend: Enable IRQs marked for wakeup
>> + *
>> + * @p: pdc_pm_data
>> + *
>> + * The SW expects that an IRQ that's disabled with disable_irq() can still
>> + * wake the system from sleep states such as "suspend to RAM", if it has
>> + * been marked for wakeup.
>> + *
>> + * While the SW may choose to differ status for "wake" and "enabled" interrupts,
> s/differ/differentiate/ perhaps?
Okay i will update.
>
>> + * its not the case with HW. There is no dedicated config in HW to differ "wake"
> s/differ/differentiate/ perhaps?
Okay i will update.
>
>> + * and "enabled". Same is case for PDC's parent irq_chip (ARM GIC) which has
>> + * only GICD_ISENABLER to indicate "enabled" or "disabled" status.
>> + *
>> + * So, the HW ONLY understands either "enabled" or "disabled".
>> + * The final status in HW should be an "OR" of "enable" and "wake" status.
>> + * i.e. PDC (and GIC) irq enable in HW = irq enable | irq wake in SW
>> + */
>> +static void pdc_suspend(struct pdc_pm_data *p)
>> +{
>> +       int wake_irq;
>> +       bool enabled;
>> +       struct irq_data *d;
>> +
>> +       p->from_pdc_suspend = true;
>> +       for_each_set_bit(wake_irq, p->pdc_domain_wake_irqs, PDC_MAX_IRQS) {
>> +               enabled = test_bit(wake_irq, p->pdc_domain_enabled_irqs);
>> +               if (!enabled) {
>> +                       d = pdc_find_irq_data(p->pdc_domain, wake_irq);
>> +
>> +                       pdc_enable_intr(d, true);
>> +                       irq_chip_enable_parent(d);
>> +               }
>> +       }
>> +
>> +       for_each_set_bit(wake_irq, p->pdc_gpio_domain_wake_irqs,
>> +                        PDC_MAX_GPIO_IRQS) {
> Why can't this code operate on the pdc hwirq number space? And keep
> track of what pdc pin is enabled or disabled and marked for wakeup or
> not? I don't understand why we're tracking different domains.
This is becasue on resume we are treating GPIO domain IRQs differently 
then others.
>
>> +               enabled = test_bit(wake_irq, p->pdc_gpio_domain_enabled_irqs);
>> +               if (!enabled) {
>> +                       d = pdc_find_irq_data(p->pdc_gpio_domain, wake_irq);
>> +
>> +                       irq_chip_enable_parent(d);
>> +               }
>> +       }
>> +}
>> +
>> +static void pdc_resume(struct pdc_pm_data *p)
>> +{
>> +       int wake_irq;
>> +       bool enabled, pending;
>> +       struct irq_data *d;
>> +
>> +       for_each_set_bit(wake_irq, p->pdc_domain_wake_irqs, PDC_MAX_IRQS) {
>> +               enabled = test_bit(wake_irq, p->pdc_domain_enabled_irqs);
>> +               if (!enabled) {
>> +                       d = pdc_find_irq_data(p->pdc_domain, wake_irq);
>> +
>> +                       pdc_enable_intr(d, false);
>> +                       irq_chip_disable_parent(d);
>> +               }
>> +       }
>> +
>> +       for_each_set_bit(wake_irq, p->pdc_gpio_domain_wake_irqs,
>> +                        PDC_MAX_GPIO_IRQS) {
>> +               enabled = test_bit(wake_irq, p->pdc_gpio_domain_enabled_irqs);
>> +               if (!enabled) {
>> +                       d = pdc_find_irq_data(p->pdc_gpio_domain, wake_irq);
>> +
>> +                       /*
>> +                        * When the drivers invoke enablie_irq() on a GPIO IRQ,
> s/enablie/enable/
Okay will correct.
>
>> +                        * the pending interrupt gets cleared at GIC before
>> +                        * enabling it from msm_gpio_irq_enable(). So CPU will
>> +                        * never see pending IRQ after resume if we disable them
>> +                        * here.
> Is there something that's doing this in the gpio driver? It sounds
> like the bug lies in that driver. Maybe the gpio driver should use
> irq_startup instead of irq_enable to clear anything pending? The comment
> in msm_gpio_irq_enable() talks a lot but doesn't actually say why it's a
> problem to be latched at the GIC as pending when the irq is enabled the
> first time.
This is to clear any erroneous interrupts that would have got latched 
when the interrupt is not in use.

There may be devices like UART which can use the same gpio line for data 
rx as well as a wakeup gpio

The data that was flowing on the line may latch the interrupt and when 
we enable the interrupt,we see IRQ pending and unexpected IRQ gets 
triggered.

>
>> +                        *
>> +                        * If wakeup is due to GPIO interrupt do not disable it.
>> +                        * By not disabling, The IRQ will be delivered to CPU
>> +                        * and when driver invokes enable_irq(), The softirq
>> +                        * tasklet does resend_irqs() to call irq handler.
>> +                        */
>> +                       irq_chip_get_parent_state(d, IRQCHIP_STATE_PENDING,
>> +                                                 &pending);
>> +                       if (pending) {
>> +                               pending = false;
> Please move 'pending' into the if (!enabled) scope so that it
> automatically resets for each irq. And then remove this assignment.
Sure, i will update.
>
>> +                               continue;
>> +                       }
>> +
>> +                       irq_chip_disable_parent(d);
>> +               }
>> +       }
>> +       p->from_pdc_suspend = false;
>> +}
>> +
>> +static int pdc_cpu_pm_callback(struct notifier_block *nfb,
>> +                              unsigned long action, void *v)
>> +{
>> +       struct pdc_pm_data *p = container_of(nfb, struct pdc_pm_data,
>> +                                            pdc_cpu_pm_nfb);
>> +       unsigned long flags;
>> +
>> +       if (!p->suspend_start)
>> +               return NOTIFY_OK;
>> +
>> +       spin_lock_irqsave(&p->pm_lock, flags);
>> +       switch (action) {
>> +       case CPU_PM_ENTER:
>> +               cpumask_set_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
>> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
>> +                       pdc_suspend(p);
>> +               break;
>> +       case CPU_PM_ENTER_FAILED:
>> +       case CPU_PM_EXIT:
>> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
>> +                       pdc_resume(p);
>> +               cpumask_clear_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
>> +               break;
>> +       }
>> +       spin_unlock_irqrestore(&p->pm_lock, flags);
> What is the point of this callback? Any irqs that we want to wakeup the
> CPUs from deep idle should be enabled via enable_irq(). Otherwise, they
> shouldn't wake up the system. That's the difference between idle and
> suspend.
We already discussed and agreed to treat IRQs differently in idle and 
suspend.
In summary if a SW does disable and mark IRQ as wake up capable.
1.    irq_disable()
2.    enable_irq_wake()

Since the HW don’t understand wake, it only knows either enabled or 
disabled IRQ. So the HW should do below.
1.    if system is in suspend, the IRQ should be kept Enabled in HW
2.    if system is out of suspend, the IRQ should be kept disabled in HW

As we have two different suspend states namely suspend-to-idle (s2idle) 
and deep suspend.

The PDC driver need to know “when” we are in suspend path. This is where 
pdc_pm_callback is used, it will
listen to PM_SUSPEND_PREPARE and PM_POST_SUSPEND events to know when 
system is entered in to suspend path
and when it exited.

Then comes the CPU PM notifier.
If we are not in suspend path, the CPU PM notifier immediately returns, 
but when we are in suspend path,
it starts marking CPUs to know when the last CPU notifies, it will 
invoke pdc_suspend().
That finally programs the HW accordingly.

Why last CPU? Because PDC is irq_chip and should execute suspend ops at 
very last stage during suspend.

(if PDC registered for dev pm ops, It could happen that PDC’s .suspend 
callback gets called first and then
Let’s say EC driver’s .suspend is called where it does above to disable 
and mark IRQ as wakeup capable,
however PDC should have called only after EC driver is done operating on 
its IRQ from its .suspend call)

Syscore ops are good to handle such scenarios since by this time all 
non-boot CPUs are offlined and we are
running on boot CPU (last CPU) But then if someone chooses to enter 
“s2idle”, syscore ops are not invoked in
s2idle suspend path.

I take we want to wake up with disabled but wakeup capable IRQ during 
s2idle suspend as well?

If that is not the case, i can remove these notifiers and register for 
sycore ops.
from syscore op’s .suspend we can call pdc_suspend()..

This answer’s your below comment as well on why can’t we use irqchip’s 
irq_suspend() and irq_resume() calls,
since they also get internally invoked from syscore ops only.


> In suspend, we want wakeup enabled irqs to wake us up from
> suspend no matter if the irq is enabled or not. But for idle, we don't
> care about the wakeup enable bit at all. The only bit that matters is
> that the irq is enabled and then the expectation is that it will wake us
> up. If there's some irq that can't wake us up from idle then we'll have
> to just ignore that interrupt across deep CPU idle states. Is that
> actually a problem? Or the SoC architects have figured out that certain
> irqs don't matter for deep CPU idle states and so we don't have to
> monitor them?
>
>> +
>> +       return NOTIFY_OK;
>> +}
>> +
>> +static int pdc_pm_callback(struct notifier_block *nfb,
>> +                          unsigned long event, void *unused)
>> +{
>> +       struct pdc_pm_data *p = container_of(nfb, struct pdc_pm_data,
>> +                                            pdc_pm_nfb);
>> +       switch (event) {
>> +       case PM_SUSPEND_PREPARE:
>> +               p->suspend_start = true;
>> +               break;
>> +       case PM_POST_SUSPEND:
>> +               p->suspend_start = false;
>> +               break;
>> +       }
>> +
>> +       return NOTIFY_OK;
>> +}
>> +
>>   static irq_hw_number_t get_parent_hwirq(int pin)
>>   {
>>          int i;
>> @@ -385,6 +608,10 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>>                  return -ENXIO;
>>          }
>>   
>> +       p = kzalloc(sizeof(struct pdc_pm_data), GFP_KERNEL);
>> +       if (!p)
>> +               return -ENOMEM;
>> +
>>          parent_domain = irq_find_host(parent);
>>          if (!parent_domain) {
>>                  pr_err("%pOF: unable to find PDC's parent domain\n", node);
>> @@ -398,33 +625,47 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>>                  goto fail;
>>          }
>>   
>> -       pdc_domain = irq_domain_create_hierarchy(parent_domain, 0, PDC_MAX_IRQS,
>> -                                                of_fwnode_handle(node),
>> -                                                &qcom_pdc_ops, NULL);
>> -       if (!pdc_domain) {
>> +       p->pdc_domain = irq_domain_create_hierarchy(parent_domain, 0,
>> +                                                   PDC_MAX_IRQS,
>> +                                                   of_fwnode_handle(node),
>> +                                                   &qcom_pdc_ops, p);
>> +       if (!p->pdc_domain) {
>>                  pr_err("%pOF: GIC domain add failed\n", node);
>>                  ret = -ENOMEM;
>>                  goto fail;
>>          }
>>   
>> -       pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
>> +       p->pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
>>                                          IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
>>                                          PDC_MAX_GPIO_IRQS,
>>                                          of_fwnode_handle(node),
>> -                                       &qcom_pdc_gpio_ops, NULL);
>> -       if (!pdc_gpio_domain) {
>> +                                       &qcom_pdc_gpio_ops, p);
>> +       if (!p->pdc_gpio_domain) {
>>                  pr_err("%pOF: PDC domain add failed for GPIO domain\n", node);
>>                  ret = -ENOMEM;
>>                  goto remove;
>>          }
>>   
>> -       irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
>> +       irq_domain_update_bus_token(p->pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
>> +
>> +       /* Register for PM-transition events */
>> +       p->pdc_pm_nfb.notifier_call = pdc_pm_callback;
> We have irq_suspend() and irq_resume() callbacks in the irqchip. Can we
> use that instead of this notifier?
see above.
>
>> +       ret = register_pm_notifier(&p->pdc_pm_nfb);
>> +       if (ret)
>> +               goto remove;
>> +
>> +       spin_lock_init(&p->pm_lock);
>> +
>> +       /* Register for CPU PM notifications */
> Yes that's obvious. Please don't add comments like this.
Okay i will drop obvious comments.
>
>> +       p->pdc_cpu_pm_nfb.notifier_call = pdc_cpu_pm_callback;
>> +       cpu_pm_register_notifier(&p->pdc_cpu_pm_nfb);
>>   
>>          return 0;
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
