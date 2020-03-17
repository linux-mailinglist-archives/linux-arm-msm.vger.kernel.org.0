Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388391877AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 03:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgCQCFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 22:05:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44226 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgCQCFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 22:05:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id b72so11012717pfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PuBdq3oKN6OnDZlNnTpz84hQODfvkLuOr1GrjfvRoNo=;
        b=fXfCB/uNg4P7vdsO+ICsSKnxSGeTlEBgYp5wdqpH+UNJu9AOd6nkkncqQGjZ7c0p3/
         DbrSFqtxIRvVHx/tz72fQ96bEF7DRORNGQdEGZshq+4wxoYH3I8lhKGa5bNjPVDU/gzl
         OgYnMUiHWLDTmLLDSAjlprvahWqt0t2oD76W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PuBdq3oKN6OnDZlNnTpz84hQODfvkLuOr1GrjfvRoNo=;
        b=rwezkVvhlMaXpccouNoYDgyOG8zDzhjC7uuWMb90622n9UyM4yscno4ackKu+6dOyG
         qNGI14hlSYKct4Un/wIm8dOwKhlKvz/EeImUb2SVraXo05Nbnj6mzGUADZckWs3lojTY
         2D00XsmYq8dIbQgkLIbLj6alM9AtewraEUcI6Q+plpnX+qJ7qgAvLhDYDoHNCXLRPqui
         DVF1VEKA6dDxfnZ32J5gVCLrqasC6ruDfwXGlO0iDdkk2vHPocgx3PwTINQUTJJuy0i3
         CxRJw5VyxpPGWbrjyxtD7TwUN4n0J4iZEXe9DENpaZ6sFiUvXzy0KgkdiTua5rZcfR9G
         wsqQ==
X-Gm-Message-State: ANhLgQ2t3kr2TsVvBUIryJuKtbpBLfUO2nrEQm1Qa5q9tcKxZ0b4bko6
        gBQO9a+t8E/rDwMfQDJAd4qxRw==
X-Google-Smtp-Source: ADFU+vsscTpTdrgGt+1cXZufoHXkM2hen7VX1wxFsMqY6IO7147+K39ihq9PTr+z1WpeLozkE86tbA==
X-Received: by 2002:a62:820e:: with SMTP id w14mr2700704pfd.59.1584410700857;
        Mon, 16 Mar 2020 19:05:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e9sm1074372pfl.179.2020.03.16.19.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 19:05:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584019379-12085-2-git-send-email-mkshah@codeaurora.org>
References: <1584019379-12085-1-git-send-email-mkshah@codeaurora.org> <1584019379-12085-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [RFC v2] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Mon, 16 Mar 2020 19:04:59 -0700
Message-ID: <158441069917.88485.95270915247150166@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-12 06:22:59)
> Change the way interrupts get enabled at wakeup capable PDC irq chip.
>=20
> Introduce irq_set_wake call which lets interrupts enabled at PDC with
> enable_irq_wake and disabled with disable_irq_wake with certain
> conditions.
>=20
> Interrupt will get enabled in HW at PDC and its parent GIC if they are
> either enabled is SW or marked as wake up capable.

Shouldn't we only enable in PDC and GIC if it's marked wakeup capable
and we're entering suspend? Otherwise we should let the hardware enable
state follow the software irq enable state?

>=20
> interrupt will get disabled in HW at PDC and its parent GIC only if its
> disabled in SW and also marked as non-wake up capable.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 124 +++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 117 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 6ae9e1f..d698cec 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>   */
> =20
>  #include <linux/err.h>
> @@ -30,6 +30,9 @@
> =20
>  #define PDC_NO_PARENT_IRQ      ~0UL
> =20
> +DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
> +DECLARE_BITMAP(pdc_enabled_irqs, PDC_MAX_IRQS);

Please add static on both of these.

> +
>  struct pdc_pin_region {
>         u32 pin_base;
>         u32 parent_base;
> @@ -80,20 +83,32 @@ static void pdc_enable_intr(struct irq_data *d, bool =
on)
>         index =3D pin_out / 32;
>         mask =3D pin_out % 32;
> =20
> -       raw_spin_lock(&pdc_lock);
>         enable =3D pdc_reg_read(IRQ_ENABLE_BANK, index);
>         enable =3D on ? ENABLE_INTR(enable, mask) : CLEAR_INTR(enable, ma=
sk);
>         pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
> -       raw_spin_unlock(&pdc_lock);
>  }
> =20
>  static void qcom_pdc_gic_disable(struct irq_data *d)
>  {
> +       bool wake_status;

This name is not good. Why not 'wakeup_enabled'?

> +
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
>                 return;
> =20
> -       pdc_enable_intr(d, false);
> -       irq_chip_disable_parent(d);
> +       raw_spin_lock(&pdc_lock);
> +
> +       clear_bit(d->hwirq, pdc_enabled_irqs);

clear_bit() is atomic, so why inside the lock?

> +       wake_status =3D test_bit(d->hwirq, pdc_wake_irqs);
> +
> +       /* Disable at PDC HW if wake_status also says same */
> +       if (!wake_status)

Should read as "if not wakeup_enabled".

> +               pdc_enable_intr(d, false);
> +
> +       raw_spin_unlock(&pdc_lock);
> +
> +       /* Disable at GIC HW if wake_status also says same */
> +       if (!wake_status)

This happens outside the lock, so I'm confused why any locking is needed
in this function.

> +               irq_chip_disable_parent(d);
>  }
> =20
>  static void qcom_pdc_gic_enable(struct irq_data *d)
> @@ -101,7 +116,16 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
>                 return;
> =20
> +       raw_spin_lock(&pdc_lock);
> +
> +       set_bit(d->hwirq, pdc_enabled_irqs);
> +
> +       /* We can blindly enable at PDC HW as we are already in enable pa=
th */
>         pdc_enable_intr(d, true);
> +
> +       raw_spin_unlock(&pdc_lock);
> +
> +       /* We can blindly enable at GIC HW as we are already in enable pa=
th */
>         irq_chip_enable_parent(d);
>  }
> =20
> @@ -121,6 +145,92 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>         irq_chip_unmask_parent(d);
>  }
> =20
> +/**
> + * qcom_pdc_gic_set_wake: Enables/Disables interrupt at PDC and parent G=
IC
> + *
> + * @d: the interrupt data
> + * @on: enable or disable wakeup capability
> + *
> + * The SW expects that an irq that's disabled with disable_irq()
> + * can still wake the system from sleep states such as "suspend to RAM",
> + * if it has been marked for wakeup.
> + *
> + * While the SW may choose to differ status for "wake" and "enabled"
> + * interrupts, its not the case with HW. There is no dedicated
> + * configuration in HW to differ "wake" and "enabled". Same is
> + * case for PDC's parent irq_chip (ARM GIC) which has only GICD_ISENABLER
> + * to indicate "enabled" or "disabled" status and also there is no .irq_=
set_wake
> + * implemented in parent GIC irq_chip.
> + *
> + * So, the HW ONLY understands either "enabled" or "disabled".
> + *
> + * This function is introduced to handle cases where drivers may invoke
> + * below during suspend in SW on their irq, and expect to wake up from t=
his
> + * interrupt.
> + *
> + * 1. enable_irq_wake()
> + * 2. disable_irq()
> + *
> + * and below during resume
> + *
> + * 3. disable_irq_wake()
> + * 4. enable_irq()
> + *
> + * if (2) is invoked in end and just before suspend, it currently leaves

We shouldn't document the currently broken state of the code. Please
reword this.

> + * interrupt "disabled" at HW and hence not leading to resume.
> + *
> + * Note that the order of invoking (1) & (2) may interchange and similar=
ly
> + * it can interchange for (3) & (4) as per driver's wish.
> + *
> + * if the driver call .irq_set_wake first it will enable at HW but later

s/if/If/

> + * call with .irq_disable will disable at HW. so final result is again

s/so/So/

> + * "disabled" at HW whereas the HW expectection is to keep it "enabled"

s/expectection/expectation/

> + * since it understands only "enabled" or "disabled".
> + *
> + * Hence .irq_set_wake can not just go ahead and  "enable" or "disable"
> + * at HW blindly, it needs to take in account status of currently "enabl=
e"

s/in/into/

> + * or "disable" as well.

"status of currently enable or disable as well" doesn't make any sense
to me. Is this "take into account if the interrupt is enabled or
disableed"?

> + *
> + * Introduce .irq_set_wake in PDC irq_chip to handle above issue.
> + * The final status in HW should be an "OR" of "enable" and "wake" calls.
> + * (i.e. same as below table)
> + * -------------------------------------------------|
> + * ENABLE in SW | WAKE in SW | PDC & GIC HW Status  |

Presumably 'PDC & GIC HW status' means enabled in PDC and GIC hardware?

> + *      0       |     0      |     0               |
> + *      0      |     1      |     1                |
> + *     1       |     0      |     1                |
> + *     1       |     1      |     1                |
> + *--------------------------------------------------|

Are there tabs in here? Probably better to just use spaces everywhere or
drop the OR table because it's literally just two variables.

 irq enable | irq wake =3D=3D PDC & GIC hardware irq enabled

> + */
> +
> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
> +{
> +       bool enabled_status;
> +
> +       if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> +               return 0;
> +
> +       raw_spin_lock(&pdc_lock);
> +       enabled_status =3D test_bit(d->hwirq, pdc_enabled_irqs);
> +       if (on) {
> +               set_bit(d->hwirq, pdc_wake_irqs);
> +               pdc_enable_intr(d, true);
> +       } else {
> +               clear_bit(d->hwirq, pdc_wake_irqs);
> +               pdc_enable_intr(d, enabled_status);
> +       }
> +
> +       raw_spin_unlock(&pdc_lock);
> +
> +       /* Either "wake" or "enabled" need same status at parent as well =
*/
> +       if (on || enabled_status)
> +               irq_chip_enable_parent(d);
> +       else
> +               irq_chip_disable_parent(d);

What happens if irq is "disabled" in software, because this is the first
function called on the irq, and we aren't in suspend yet. Then we get
the irq. Won't we be interrupting the CPU because we've enabled in PDC
and GIC hardware? Why doesn't this function update the wake bit and then
leave the force on irq logic to suspend entry? Will we miss an interrupt
while entering suspend because of that?

Otherwise, I wonder why the code can't be:

	if (on)
		set_bit(d->hwirq, pdc_wake_irqs);
	else
		clear_bit(d->hwirq, pdc_wake_irqs);
=09
	pdc_enable_intr(d, on);

Then we can leave the lock inside the pdc_enable_intr() function and
test for both bitmasks there and or in whatever software is asking for?
It would be nice to simplify the callers and make the code that actually
writes the hardware do a small bit test and set operation.

> +
> +       return irq_chip_set_wake_parent(d, on);
> +}
> +
>  /*
>   * GIC does not handle falling edge or active low. To allow falling edge=
 and
>   * active low interrupts to be handled at GIC, PDC has an inverter that =
inverts
