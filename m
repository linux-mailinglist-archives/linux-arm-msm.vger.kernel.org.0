Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECAD1A7032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 02:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390531AbgDNAgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 20:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390456AbgDNAgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 20:36:01 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BCCC0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 17:36:01 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t4so4011431plq.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 17:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=0m2qpy6Bbcub34xNBGIDYkfVg1M9EW2JQw91XCpvia4=;
        b=E1aWmJCWBtNfdfNE7SswaKdzAuWh9bBAKmjN6sG/UBzBpVyO92QViS+Ag8efy90f9h
         mUNcUx6N8A8FlAs8UM+2Xlzg38jy4Q2xWBHoT4pwuxloUT1zNqnymihVavKIFpJwozFz
         jYtfcGh4EDLekXwMGcNaAy9RHDvwa2X/FZMYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=0m2qpy6Bbcub34xNBGIDYkfVg1M9EW2JQw91XCpvia4=;
        b=PHGA8rnO1C4Uq8tJfcIz6jBZHpckZquQVDAxgAHyswpromG0hpGF5zyRG7MFLhloyz
         luXBoqWE7bKnJqkJ5Ybgn6anvd6oyZ3mI77glO08SaDdl2V+/RAdAGB4hgqry1JfQ+ea
         Q+k5O0OaTdO24AHlWLyMQZc+7sfilwRQKn3fXh1WHNykEBI00++rrxg8rcj+qhUyImaB
         ebsq+UkH0fk3IeFQhsz0D+0Ej7z+2ZtZdKL8zJ1wjMJRGOwVKa8FIKQ8/9TpUd92BwYD
         DMGy6SsykKhfLFpBIQ7NJL40Hoj3p4zzXg5xBmBgX62WFMFzLzNzT5ZT32Pb/6XDXyHJ
         6Etg==
X-Gm-Message-State: AGi0PubrZwP9Ks9PGL2GyVgzrg4CHYrEwbvx3BOg0PgkotGY+PlSdsAm
        S4cFOruL7UQ/I6UT9H/NTVZmxQ==
X-Google-Smtp-Source: APiQypLRy4PJqDlHTZkXkQeG8odb+ktflhijl1Xpnk3NNBhEgYkkbCefZRLhboKfahBJSRrK5OS8jA==
X-Received: by 2002:a17:902:c814:: with SMTP id u20mr673578plx.85.1586824560884;
        Mon, 13 Apr 2020 17:36:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e26sm9685066pfi.84.2020.04.13.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 17:35:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585586460-3272-2-git-send-email-mkshah@codeaurora.org>
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org> <1585586460-3272-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Mon, 13 Apr 2020 17:35:58 -0700
Message-ID: <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-30 09:41:00)
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 6ae9e1f..c43715b 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -36,6 +38,23 @@ struct pdc_pin_region {
>         u32 cnt;
>  };
> =20
> +struct pdc_pm_data {
> +       struct cpumask cpus_in_pc;
> +       spinlock_t pm_lock;
> +       bool suspend_start;
> +       bool from_pdc_suspend;
> +       struct notifier_block pdc_pm_nfb;
> +       struct notifier_block pdc_cpu_pm_nfb;
> +
> +       DECLARE_BITMAP(pdc_domain_enabled_irqs, PDC_MAX_IRQS);
> +       DECLARE_BITMAP(pdc_domain_wake_irqs, PDC_MAX_IRQS);
> +       DECLARE_BITMAP(pdc_gpio_domain_enabled_irqs, PDC_MAX_GPIO_IRQS);
> +       DECLARE_BITMAP(pdc_gpio_domain_wake_irqs, PDC_MAX_GPIO_IRQS);
> +
> +       struct irq_domain *pdc_domain;
> +       struct irq_domain *pdc_gpio_domain;
> +};

Everything else is just a static local variable here. It looks odd to
have this struct to contain all this stuff but then have everything else
below be outside of it. If we're going to have a container node I'd
prefer that be another patch that makes this driver no longer a
singleton.

> +
>  static DEFINE_RAW_SPINLOCK(pdc_lock);
>  static void __iomem *pdc_base;
>  static struct pdc_pin_region *pdc_region;
> @@ -89,18 +108,38 @@ static void pdc_enable_intr(struct irq_data *d, bool=
 on)
> =20
>  static void qcom_pdc_gic_disable(struct irq_data *d)
>  {
> +       struct pdc_pm_data *p;
> +
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
>                 return;
> =20
> +       p =3D irq_data_get_irq_chip_data(d);
> +       if (!p->from_pdc_suspend) {
> +               if (irq_domain_qcom_handle_wakeup(d->domain))
> +                       clear_bit(d->hwirq, p->pdc_gpio_domain_enabled_ir=
qs);
> +               else
> +                       clear_bit(d->hwirq, p->pdc_domain_enabled_irqs);
> +       }
> +
>         pdc_enable_intr(d, false);
>         irq_chip_disable_parent(d);
>  }
> =20
>  static void qcom_pdc_gic_enable(struct irq_data *d)
>  {
> +       struct pdc_pm_data *p;
> +
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
>                 return;
> =20
> +       p =3D irq_data_get_irq_chip_data(d);
> +       if (!p->from_pdc_suspend) {
> +               if (irq_domain_qcom_handle_wakeup(d->domain))
> +                       set_bit(d->hwirq, p->pdc_gpio_domain_enabled_irqs=
);
> +               else
> +                       set_bit(d->hwirq, p->pdc_domain_enabled_irqs);
> +       }
> +
>         pdc_enable_intr(d, true);
>         irq_chip_enable_parent(d);
>  }
> @@ -145,6 +184,39 @@ enum pdc_irq_config_bits {
>  };
> =20
>  /**
> + * qcom_pdc_gic_set_wake: Mark IRQ as wakeup capable
> + *
> + * @d: the interrupt data
> + * @on: enable or disable wakeup capability
> + *
> + * Mark IRQ as wake up capable at either pdc_domain or pdc_gpio_domain.
> + * This will be used when entering to suspend where if any wakeup capable
> + * IRQ is already disabled in SW, such IRQ needs to be re-enabled at HW.
> + */
> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
> +{
> +       struct pdc_pm_data *p;
> +
> +       if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> +               return 0;
> +
> +       p =3D irq_data_get_irq_chip_data(d);
> +       if (on) {
> +               if (irq_domain_qcom_handle_wakeup(d->domain))
> +                       set_bit(d->hwirq, p->pdc_gpio_domain_wake_irqs);
> +               else
> +                       set_bit(d->hwirq, p->pdc_domain_wake_irqs);
> +       } else {
> +               if (irq_domain_qcom_handle_wakeup(d->domain))
> +                       clear_bit(d->hwirq, p->pdc_gpio_domain_wake_irqs);
> +               else
> +                       clear_bit(d->hwirq, p->pdc_domain_wake_irqs);
> +       }
> +
> +       return irq_chip_set_wake_parent(d, on);
> +}
> +
> +/**
>   * qcom_pdc_gic_set_type: Configure PDC for the interrupt
>   *
>   * @d: the interrupt data
> @@ -202,14 +274,162 @@ static struct irq_chip qcom_pdc_gic_chip =3D {
>         .irq_get_irqchip_state  =3D qcom_pdc_gic_get_irqchip_state,
>         .irq_set_irqchip_state  =3D qcom_pdc_gic_set_irqchip_state,
>         .irq_retrigger          =3D irq_chip_retrigger_hierarchy,
> +       .irq_set_wake           =3D qcom_pdc_gic_set_wake,
>         .irq_set_type           =3D qcom_pdc_gic_set_type,
>         .flags                  =3D IRQCHIP_MASK_ON_SUSPEND |
> -                                 IRQCHIP_SET_TYPE_MASKED |
> -                                 IRQCHIP_SKIP_SET_WAKE,
> +                                 IRQCHIP_SET_TYPE_MASKED,
>         .irq_set_vcpu_affinity  =3D irq_chip_set_vcpu_affinity_parent,
>         .irq_set_affinity       =3D irq_chip_set_affinity_parent,
>  };
> =20
> +static struct irq_data *pdc_find_irq_data(struct irq_domain *domain,
> +                                         int wake_irq)
> +{
> +       int irq =3D irq_find_mapping(domain, wake_irq);
> +       struct irq_desc *desc =3D irq_to_desc(irq);
> +
> +       return &desc->irq_data;
> +}
> +
> +/**
> + * pdc_suspend: Enable IRQs marked for wakeup
> + *
> + * @p: pdc_pm_data
> + *
> + * The SW expects that an IRQ that's disabled with disable_irq() can sti=
ll
> + * wake the system from sleep states such as "suspend to RAM", if it has
> + * been marked for wakeup.
> + *
> + * While the SW may choose to differ status for "wake" and "enabled" int=
errupts,

s/differ/differentiate/ perhaps?

> + * its not the case with HW. There is no dedicated config in HW to diffe=
r "wake"

s/differ/differentiate/ perhaps?

> + * and "enabled". Same is case for PDC's parent irq_chip (ARM GIC) which=
 has
> + * only GICD_ISENABLER to indicate "enabled" or "disabled" status.
> + *
> + * So, the HW ONLY understands either "enabled" or "disabled".
> + * The final status in HW should be an "OR" of "enable" and "wake" statu=
s.
> + * i.e. PDC (and GIC) irq enable in HW =3D irq enable | irq wake in SW
> + */
> +static void pdc_suspend(struct pdc_pm_data *p)
> +{
> +       int wake_irq;
> +       bool enabled;
> +       struct irq_data *d;
> +
> +       p->from_pdc_suspend =3D true;
> +       for_each_set_bit(wake_irq, p->pdc_domain_wake_irqs, PDC_MAX_IRQS)=
 {
> +               enabled =3D test_bit(wake_irq, p->pdc_domain_enabled_irqs=
);
> +               if (!enabled) {
> +                       d =3D pdc_find_irq_data(p->pdc_domain, wake_irq);
> +
> +                       pdc_enable_intr(d, true);
> +                       irq_chip_enable_parent(d);
> +               }
> +       }
> +
> +       for_each_set_bit(wake_irq, p->pdc_gpio_domain_wake_irqs,
> +                        PDC_MAX_GPIO_IRQS) {

Why can't this code operate on the pdc hwirq number space? And keep
track of what pdc pin is enabled or disabled and marked for wakeup or
not? I don't understand why we're tracking different domains.=20

> +               enabled =3D test_bit(wake_irq, p->pdc_gpio_domain_enabled=
_irqs);
> +               if (!enabled) {
> +                       d =3D pdc_find_irq_data(p->pdc_gpio_domain, wake_=
irq);
> +
> +                       irq_chip_enable_parent(d);
> +               }
> +       }
> +}
> +
> +static void pdc_resume(struct pdc_pm_data *p)
> +{
> +       int wake_irq;
> +       bool enabled, pending;
> +       struct irq_data *d;
> +
> +       for_each_set_bit(wake_irq, p->pdc_domain_wake_irqs, PDC_MAX_IRQS)=
 {
> +               enabled =3D test_bit(wake_irq, p->pdc_domain_enabled_irqs=
);
> +               if (!enabled) {
> +                       d =3D pdc_find_irq_data(p->pdc_domain, wake_irq);
> +
> +                       pdc_enable_intr(d, false);
> +                       irq_chip_disable_parent(d);
> +               }
> +       }
> +
> +       for_each_set_bit(wake_irq, p->pdc_gpio_domain_wake_irqs,
> +                        PDC_MAX_GPIO_IRQS) {
> +               enabled =3D test_bit(wake_irq, p->pdc_gpio_domain_enabled=
_irqs);
> +               if (!enabled) {
> +                       d =3D pdc_find_irq_data(p->pdc_gpio_domain, wake_=
irq);
> +
> +                       /*
> +                        * When the drivers invoke enablie_irq() on a GPI=
O IRQ,

s/enablie/enable/

> +                        * the pending interrupt gets cleared at GIC befo=
re
> +                        * enabling it from msm_gpio_irq_enable(). So CPU=
 will
> +                        * never see pending IRQ after resume if we disab=
le them
> +                        * here.

Is there something that's doing this in the gpio driver? It sounds
like the bug lies in that driver. Maybe the gpio driver should use
irq_startup instead of irq_enable to clear anything pending? The comment
in msm_gpio_irq_enable() talks a lot but doesn't actually say why it's a
problem to be latched at the GIC as pending when the irq is enabled the
first time.

> +                        *
> +                        * If wakeup is due to GPIO interrupt do not disa=
ble it.
> +                        * By not disabling, The IRQ will be delivered to=
 CPU
> +                        * and when driver invokes enable_irq(), The soft=
irq
> +                        * tasklet does resend_irqs() to call irq handler.
> +                        */
> +                       irq_chip_get_parent_state(d, IRQCHIP_STATE_PENDIN=
G,
> +                                                 &pending);
> +                       if (pending) {
> +                               pending =3D false;

Please move 'pending' into the if (!enabled) scope so that it
automatically resets for each irq. And then remove this assignment.

> +                               continue;
> +                       }
> +
> +                       irq_chip_disable_parent(d);
> +               }
> +       }
> +       p->from_pdc_suspend =3D false;
> +}
> +
> +static int pdc_cpu_pm_callback(struct notifier_block *nfb,
> +                              unsigned long action, void *v)
> +{
> +       struct pdc_pm_data *p =3D container_of(nfb, struct pdc_pm_data,
> +                                            pdc_cpu_pm_nfb);
> +       unsigned long flags;
> +
> +       if (!p->suspend_start)
> +               return NOTIFY_OK;
> +
> +       spin_lock_irqsave(&p->pm_lock, flags);
> +       switch (action) {
> +       case CPU_PM_ENTER:
> +               cpumask_set_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
> +                       pdc_suspend(p);
> +               break;
> +       case CPU_PM_ENTER_FAILED:
> +       case CPU_PM_EXIT:
> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
> +                       pdc_resume(p);
> +               cpumask_clear_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
> +               break;
> +       }
> +       spin_unlock_irqrestore(&p->pm_lock, flags);

What is the point of this callback? Any irqs that we want to wakeup the
CPUs from deep idle should be enabled via enable_irq(). Otherwise, they
shouldn't wake up the system. That's the difference between idle and
suspend. In suspend, we want wakeup enabled irqs to wake us up from
suspend no matter if the irq is enabled or not. But for idle, we don't
care about the wakeup enable bit at all. The only bit that matters is
that the irq is enabled and then the expectation is that it will wake us
up. If there's some irq that can't wake us up from idle then we'll have
to just ignore that interrupt across deep CPU idle states. Is that
actually a problem? Or the SoC architects have figured out that certain
irqs don't matter for deep CPU idle states and so we don't have to
monitor them?

> +
> +       return NOTIFY_OK;
> +}
> +
> +static int pdc_pm_callback(struct notifier_block *nfb,
> +                          unsigned long event, void *unused)
> +{
> +       struct pdc_pm_data *p =3D container_of(nfb, struct pdc_pm_data,
> +                                            pdc_pm_nfb);
> +       switch (event) {
> +       case PM_SUSPEND_PREPARE:
> +               p->suspend_start =3D true;
> +               break;
> +       case PM_POST_SUSPEND:
> +               p->suspend_start =3D false;
> +               break;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
>  static irq_hw_number_t get_parent_hwirq(int pin)
>  {
>         int i;
> @@ -385,6 +608,10 @@ static int qcom_pdc_init(struct device_node *node, s=
truct device_node *parent)
>                 return -ENXIO;
>         }
> =20
> +       p =3D kzalloc(sizeof(struct pdc_pm_data), GFP_KERNEL);
> +       if (!p)
> +               return -ENOMEM;
> +
>         parent_domain =3D irq_find_host(parent);
>         if (!parent_domain) {
>                 pr_err("%pOF: unable to find PDC's parent domain\n", node=
);
> @@ -398,33 +625,47 @@ static int qcom_pdc_init(struct device_node *node, =
struct device_node *parent)
>                 goto fail;
>         }
> =20
> -       pdc_domain =3D irq_domain_create_hierarchy(parent_domain, 0, PDC_=
MAX_IRQS,
> -                                                of_fwnode_handle(node),
> -                                                &qcom_pdc_ops, NULL);
> -       if (!pdc_domain) {
> +       p->pdc_domain =3D irq_domain_create_hierarchy(parent_domain, 0,
> +                                                   PDC_MAX_IRQS,
> +                                                   of_fwnode_handle(node=
),
> +                                                   &qcom_pdc_ops, p);
> +       if (!p->pdc_domain) {
>                 pr_err("%pOF: GIC domain add failed\n", node);
>                 ret =3D -ENOMEM;
>                 goto fail;
>         }
> =20
> -       pdc_gpio_domain =3D irq_domain_create_hierarchy(parent_domain,
> +       p->pdc_gpio_domain =3D irq_domain_create_hierarchy(parent_domain,
>                                         IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
>                                         PDC_MAX_GPIO_IRQS,
>                                         of_fwnode_handle(node),
> -                                       &qcom_pdc_gpio_ops, NULL);
> -       if (!pdc_gpio_domain) {
> +                                       &qcom_pdc_gpio_ops, p);
> +       if (!p->pdc_gpio_domain) {
>                 pr_err("%pOF: PDC domain add failed for GPIO domain\n", n=
ode);
>                 ret =3D -ENOMEM;
>                 goto remove;
>         }
> =20
> -       irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
> +       irq_domain_update_bus_token(p->pdc_gpio_domain, DOMAIN_BUS_WAKEUP=
);
> +
> +       /* Register for PM-transition events */
> +       p->pdc_pm_nfb.notifier_call =3D pdc_pm_callback;

We have irq_suspend() and irq_resume() callbacks in the irqchip. Can we
use that instead of this notifier?

> +       ret =3D register_pm_notifier(&p->pdc_pm_nfb);
> +       if (ret)
> +               goto remove;
> +
> +       spin_lock_init(&p->pm_lock);
> +
> +       /* Register for CPU PM notifications */

Yes that's obvious. Please don't add comments like this.

> +       p->pdc_cpu_pm_nfb.notifier_call =3D pdc_cpu_pm_callback;
> +       cpu_pm_register_notifier(&p->pdc_cpu_pm_nfb);
> =20
>         return 0;
>
