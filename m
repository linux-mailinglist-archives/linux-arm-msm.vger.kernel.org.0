Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF13218A6D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 22:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgCRVOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 17:14:50 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43374 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRVOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 17:14:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id f206so142606pfa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Vmp6BTOgydfHk10WrjIJ59FqwiTaCy2iSVS6aUYT3x8=;
        b=UepFWvnW3WgXsvqf7yJKBzYbaQTnkPZzJYSMe0tY5iziZ7d3z6El7HggouvHTPRYCS
         PtGu34mLgHEgMMUSwznq3A0DCmhC2cubSGCt1FqiydrXoU6PX+ZivB2Phb0bMZSoeunq
         H5VbfsD+j5iApc5w1eDDjzT4u6y24p522GicM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Vmp6BTOgydfHk10WrjIJ59FqwiTaCy2iSVS6aUYT3x8=;
        b=LZeHrOF5tNBN8btX+IDVuYMdSVr8zZcGHaYlgMbhmEMUCLjVsvURQRdfPs44kLiaVj
         oZKvX4cjut7H/ON5IlcDHmqKDBxLbyZo5LrdRA9Mda1A54PFvXzduxLhXNN9oTjqK4eA
         tDrs3I3Ko1ry958A+XOgQ9ETsJ/JSmBo00xrICsU0rmLIcIcWAl2U9WfxUPf4i/AuFYu
         7Vc1QJ4Wtnb9OZrPzElMar2bYJzYfzgjkC1RQzXDcnuDCy8HXKB823j50TmO3aEyGUmN
         W/bxfoEEgkAY9oAI7kTCOVixlWYIOtYxm5aFs9hSKBUwwC8Mn3asb4Oe+FX3jWv1sHKp
         3jbQ==
X-Gm-Message-State: ANhLgQ34c34yJeWSC5h4WlPWP0KLf5tCCVxrV3OstqnUnsdXq6pQDBFE
        cu4dpapZvmZ+ePO5xrtw8+KyeA==
X-Google-Smtp-Source: ADFU+vvIHkLqQlSnYlnmvZrr2UP9WLS9Yac5xsXL+7Ibk6gsHN0DjkGGu2rhb35tswU5HdgU+tc3/g==
X-Received: by 2002:a63:2542:: with SMTP id l63mr6471985pgl.312.1584566087892;
        Wed, 18 Mar 2020 14:14:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g7sm3114467pjl.17.2020.03.18.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 14:14:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bc2f75bc-1223-68b5-3c64-8ea17ee677cf@codeaurora.org>
References: <1584019379-12085-1-git-send-email-mkshah@codeaurora.org> <1584019379-12085-2-git-send-email-mkshah@codeaurora.org> <158441069917.88485.95270915247150166@swboyd.mtv.corp.google.com> <bc2f75bc-1223-68b5-3c64-8ea17ee677cf@codeaurora.org>
Subject: Re: [RFC v2] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 18 Mar 2020 14:14:44 -0700
Message-ID: <158456608487.152100.9336929115021414535@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-16 23:47:21)
> Hi,
>=20
> On 3/17/2020 7:34 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-03-12 06:22:59)
> >> Change the way interrupts get enabled at wakeup capable PDC irq chip.
> >>
> >> Introduce irq_set_wake call which lets interrupts enabled at PDC with
> >> enable_irq_wake and disabled with disable_irq_wake with certain
> >> conditions.
> >>
> >> Interrupt will get enabled in HW at PDC and its parent GIC if they are
> >> either enabled is SW or marked as wake up capable.
> > Shouldn't we only enable in PDC and GIC if it's marked wakeup capable
> > and we're entering suspend? Otherwise we should let the hardware enable
> > state follow the software irq enable state?
> Not only during "sleep" but PDC (and GIC) have a role during "active" tim=
e as well.
> so we can not just enabled at PDC and GIC when entering to suspend, inter=
rupt need
> to keep interrupt enabled at PDC and GIC HW when out of suspend as well.

Yes, but if an interrupt is only marked for wakeup and not actually
enabled we shouldn't deliver it to the GIC. That's what I'm asking
about.

> >
> >> interrupt will get disabled in HW at PDC and its parent GIC only if its
> >> disabled in SW and also marked as non-wake up capable.
> >>
> >> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >> ---
> >>  drivers/irqchip/qcom-pdc.c | 124 ++++++++++++++++++++++++++++++++++++=
++++++---
> >>  1 file changed, 117 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> >> index 6ae9e1f..d698cec 100644
> >> --- a/drivers/irqchip/qcom-pdc.c
> >> +++ b/drivers/irqchip/qcom-pdc.c
> >> @@ -1,6 +1,6 @@
[...]
> >
> >> +
> >>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >>                 return;
> >> =20
> >> -       pdc_enable_intr(d, false);
> >> -       irq_chip_disable_parent(d);
> >> +       raw_spin_lock(&pdc_lock);
> >> +
> >> +       clear_bit(d->hwirq, pdc_enabled_irqs);
> > clear_bit() is atomic, so why inside the lock?
> I will move it out of lock.
> >
> >> +       wake_status =3D test_bit(d->hwirq, pdc_wake_irqs);
> >> +
> >> +       /* Disable at PDC HW if wake_status also says same */
> >> +       if (!wake_status)
> > Should read as "if not wakeup_enabled".
> I will update comment.

Hopefully the comment isn't useful and can just be removed if the code
reads properly.

> >
> >> +               pdc_enable_intr(d, false);
> >> +
> >> +       raw_spin_unlock(&pdc_lock);
> >> +
> >> +       /* Disable at GIC HW if wake_status also says same */
> >> +       if (!wake_status)
> > This happens outside the lock, so I'm confused why any locking is needed
> > in this function.
> Okay, since test_bit() is also atomic so i will keep locking inside pc_en=
able_intr() as it is.
> >
> >> +               irq_chip_disable_parent(d);
> >>  }
> >> =20
> >>  static void qcom_pdc_gic_enable(struct irq_data *d)
> >> @@ -101,7 +116,16 @@ static void qcom_pdc_gic_enable(struct irq_data *=
d)
> >>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >>                 return;
> >> =20
> >> +       raw_spin_lock(&pdc_lock);
> >> +
> >> +       set_bit(d->hwirq, pdc_enabled_irqs);
> >> +
> >> +       /* We can blindly enable at PDC HW as we are already in enable=
 path */
> >>         pdc_enable_intr(d, true);
> >> +
> >> +       raw_spin_unlock(&pdc_lock);
> >> +
> >> +       /* We can blindly enable at GIC HW as we are already in enable=
 path */
> >>         irq_chip_enable_parent(d);
> >>  }
> >> =20
[...]
> >> + */
> >> +
> >> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
> >> +{
> >> +       bool enabled_status;
> >> +
> >> +       if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >> +               return 0;
> >> +
> >> +       raw_spin_lock(&pdc_lock);
> >> +       enabled_status =3D test_bit(d->hwirq, pdc_enabled_irqs);
> >> +       if (on) {
> >> +               set_bit(d->hwirq, pdc_wake_irqs);
> >> +               pdc_enable_intr(d, true);
> >> +       } else {
> >> +               clear_bit(d->hwirq, pdc_wake_irqs);
> >> +               pdc_enable_intr(d, enabled_status);
> >> +       }
> >> +
> >> +       raw_spin_unlock(&pdc_lock);
> >> +
> >> +       /* Either "wake" or "enabled" need same status at parent as we=
ll */
> >> +       if (on || enabled_status)
> >> +               irq_chip_enable_parent(d);
> >> +       else
> >> +               irq_chip_disable_parent(d);
> > What happens if irq is "disabled" in software, because this is the first
> > function called on the irq, and we aren't in suspend yet. Then we get
> > the irq. Won't we be interrupting the CPU because we've enabled in PDC
> > and GIC hardware? Why doesn't this function update the wake bit and then
> > leave the force on irq logic to suspend entry? Will we miss an interrupt
> > while entering suspend because of that?
> As PDC (and GIC) have a role during "active" time as well, interrupt shou=
ld be
> enabled in PDC and GIC HW.

Sure. When the irq is enabled we want to enable at the GIC, but if it
isn't enabled and we're not in suspend I would think we don't want the
irq enabled at the GIC. But this code is doing that. Why? I'd think we
would want to make enable in the PDC driver enable the parent and then
make the set_wake path just update some bitmap tracking wakeup enabled
irqs.

Then when we enter suspend we will enable any pdc interrupts only in the
PDC so that we can wakeup from suspend if that interrupt comes in. When
we wakeup we'll resend the edge interrupts to the GIC on the resume path
and level interrupts will "just work" because they'll stay asserted
throughout resume.

The bigger problem would look to be suspend entry, but in that case we
leave any interrupts enabled at the GIC on the path to suspend (see
suspend_device_irq() and how it bails out early if it's marked for
wakeup) so we should be able to have some suspend entry hook in pdc that
enables the irq in the PDC if it's in the wakeup bitmap. Then on the
path to suspend the GIC can lose power at any point after we enable the
wakeup path in PDC and then the system should resume and get the
interrupt through the resend mechanism.
