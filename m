Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FCE1B4014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730148AbgDVKnL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731512AbgDVKmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:42:21 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69FDC03C1A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:42:19 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t16so771363plo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=j5o58n/r44+ZqGFwsIRUrvRN3EMSgAmS8i64zUiZi7s=;
        b=b600BWWOUi39Ctp+OUsxocW7Nto6JzJITVwKVPqchjk7dWMtjges+GtQ6cLjJi6s20
         cMddU7g6+TqvE3mvY17MAUFg/ZwyvWmP3OI7rkszxWVGSY3orbQf3LwwJ1vc5ON1A3ly
         TfE95LmcWaKiCgAABZ2rOn0A0yFUpI/ROsNfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=j5o58n/r44+ZqGFwsIRUrvRN3EMSgAmS8i64zUiZi7s=;
        b=p2xFR0gW/ABi6WhNTo8TEqH97JqYjN5e0lYTqz+dPNwlnkOieRAbrcQpSqLIRzy7cw
         /aNyGOCCAW3VoDsSvi/yP/3umaTJwTr8XOOhfjM+WIW8dzoJat+JOhRqddWfrOkKMlrf
         Izyk4IVDQbAUXpsEsF6LkPECBW9ZXuMMKGDLzMtF4vCovdLOOlL/eAYocp2aGyMECSVe
         riSiBOu7O7WgglASmvH3r48j7kWhzqv+V/eF3YUB99ALWzsjVJdZSkQVR1n8B7VId4X1
         9sfQtRXfnqlVIMuQg5F5Jrxo71gYJKEZDJfdjhscYnHRuXBx6UqZVzC3w38P2RwnEDyP
         KedQ==
X-Gm-Message-State: AGi0PuaRURiVuc2h5Skb7UMrOVD2r8Yi5Kpbk/Xj6RdKAyA/gsbWcn97
        qvjGrjKnfxGWoc/USngnKjhFCw==
X-Google-Smtp-Source: APiQypJRQM4KCasYtXaDiWT3xkp679bKx0Cq1m+mMYYFpE0BJXHseLL6OvIVS1JcRhpnqkD+uJr5Ig==
X-Received: by 2002:a17:902:904a:: with SMTP id w10mr20914592plz.17.1587552139207;
        Wed, 22 Apr 2020 03:42:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b2sm4697491pgg.77.2020.04.22.03.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:42:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bddc11e0-8d9a-dd55-3aab-42aeb18204f4@codeaurora.org>
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org> <1585586460-3272-2-git-send-email-mkshah@codeaurora.org> <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com> <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org> <158693796555.105027.4658047860202135403@swboyd.mtv.corp.google.com> <bddc11e0-8d9a-dd55-3aab-42aeb18204f4@codeaurora.org>
Subject: Re: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 22 Apr 2020 03:42:17 -0700
Message-ID: <158755213744.163502.17257131401798918469@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-20 23:35:09)
> Hi,
>=20
> On 4/15/2020 1:36 PM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-04-14 01:05:36)
> >> Hi,
> >>
> >> On 4/14/2020 6:05 AM, Stephen Boyd wrote:
> >>> Quoting Maulik Shah (2020-03-30 09:41:00)
> >>>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> >>>> index 6ae9e1f..c43715b 100644
> >>>> --- a/drivers/irqchip/qcom-pdc.c
> >>>> +++ b/drivers/irqchip/qcom-pdc.c
> >>>> +                        * the pending interrupt gets cleared at GIC=
 before
> >>>> +                        * enabling it from msm_gpio_irq_enable(). S=
o CPU will
> >>>> +                        * never see pending IRQ after resume if we =
disable them
> >>>> +                        * here.
> >>> Is there something that's doing this in the gpio driver? It sounds
> >>> like the bug lies in that driver. Maybe the gpio driver should use
> >>> irq_startup instead of irq_enable to clear anything pending? The comm=
ent
> >>> in msm_gpio_irq_enable() talks a lot but doesn't actually say why it'=
s a
> >>> problem to be latched at the GIC as pending when the irq is enabled t=
he
> >>> first time.
> >> This is to clear any erroneous interrupts that would have got latched
> >> when the interrupt is not in use.
> >>
> >> There may be devices like UART which can use the same gpio line for da=
ta
> >> rx as well as a wakeup gpio
> >>
> >> The data that was flowing on the line may latch the interrupt and when
> >> we enable the interrupt,we see IRQ pending and unexpected IRQ gets
> >> triggered.
> > Isn't the interrupt supposed to latch in the hardware in this scenario?
> > We wanted to wakeup from UART RX over GPIO, and we did, and we also
> > wanted to send that data through the pin to the UART core, so I suspect
> > we muxed it as a UART pin and also watched it for an irq wakeup in the
> > GPIO driver and PDC? The wakeup irq handler can be ignored by the UART
> > driver if it wants.
> I will check this if i can operate only on PDC and GIC IRQs and can=20
> ignore PDC-GPIO domain IRQ.
> Working on it.

Ok.

> >
> >>>> +                               continue;
> >>>> +                       }
> >>>> +
> >>>> +                       irq_chip_disable_parent(d);
> >>>> +               }
> >>>> +       }
> >>>> +       p->from_pdc_suspend =3D false;
> >>>> +}
> >>>> +
> >>>> +static int pdc_cpu_pm_callback(struct notifier_block *nfb,
> >>>> +                              unsigned long action, void *v)
> >>>> +{
> >>>> +       struct pdc_pm_data *p =3D container_of(nfb, struct pdc_pm_da=
ta,
> >>>> +                                            pdc_cpu_pm_nfb);
> >>>> +       unsigned long flags;
> >>>> +
> >>>> +       if (!p->suspend_start)
> >>>> +               return NOTIFY_OK;
> >>>> +
> >>>> +       spin_lock_irqsave(&p->pm_lock, flags);
> >>>> +       switch (action) {
> >>>> +       case CPU_PM_ENTER:
> >>>> +               cpumask_set_cpu(raw_smp_processor_id(), &p->cpus_in_=
pc);
> >>>> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
> >>>> +                       pdc_suspend(p);
> >>>> +               break;
> >>>> +       case CPU_PM_ENTER_FAILED:
> >>>> +       case CPU_PM_EXIT:
> >>>> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
> >>>> +                       pdc_resume(p);
> >>>> +               cpumask_clear_cpu(raw_smp_processor_id(), &p->cpus_i=
n_pc);
> >>>> +               break;
> >>>> +       }
> >>>> +       spin_unlock_irqrestore(&p->pm_lock, flags);
> >>> What is the point of this callback? Any irqs that we want to wakeup t=
he
> >>> CPUs from deep idle should be enabled via enable_irq(). Otherwise, th=
ey
> >>> shouldn't wake up the system. That's the difference between idle and
> >>> suspend.
> >> We already discussed and agreed to treat IRQs differently in idle and
> >> suspend.
> >> In summary if a SW does disable and mark IRQ as wake up capable.
> >> 1.=C2=A0=C2=A0=C2=A0 irq_disable()
> >> 2.=C2=A0=C2=A0=C2=A0 enable_irq_wake()
> >>
> >> Since the HW don't understand wake, it only knows either enabled or
> >> disabled IRQ. So the HW should do below.
> >> 1.=C2=A0=C2=A0=C2=A0 if system is in suspend, the IRQ should be kept E=
nabled in HW
> >> 2.=C2=A0=C2=A0=C2=A0 if system is out of suspend, the IRQ should be ke=
pt disabled in HW
> > Why should it be kept disabled at the PDC and GIC when the system is out
> > of suspend? Is that because software hasn't enabled the irq yet upon
> > resume and we're waiting for the irq consumer driver (EC for example) to
> > do that?
> No, for validation of this change, i did below scenario
>=20
> During a probe of a driver, requested an IRQ and then mark it as wakeup=20
> capable and disabled it.
>  From driver, after probe is done with above operation, we never do any=20
> enable/disable/wakeup operation.
>=20
> In above scenario,
>=20
> 1.=C2=A0=C2=A0=C2=A0 if system is in suspend, the IRQ should be kept Enab=
led in HW
>  =C2=A0=C2=A0=C2=A0 (since it was marked for wakeup during probe, right?)

Yes.

> 2.=C2=A0=C2=A0=C2=A0 if system is out of suspend, the IRQ should be kept =
disabled in HW
>  =C2=A0=C2=A0=C2=A0 (since it was disabled in probe, and never again enab=
led it, right?)

Not exactly. It was requested in probe, so it was enabled, and then it
was lazy disabled so it has basically always been enabled since it was
requested. If lazy disable isn't used then there's a problem.

>=20
> i wanted to test if in HW its Enabled properly during suspend entry
> (since we differ status for idle and suspend, in above scenario IRQ=20
> should be enabled in HW only during suspend
> and then when system is out of suspend it should get disabled in HW again)
>=20
> of course, if we ever woke up from suspend with this wake up capable=20
> IRQ, the handler will never get called
> since its forever marked as disabled in SW but yet the HW is still=20
> allowed to wake from this IRQ.

Alright. The other case is request an irq without auto enable flag set,
which is pretty rare, and then mark it as wakeup capable and suspend. I
hope we can ignore this one.

> >
> > In the CPU idle path (i.e. the system isn't suspending) I'd expect the
> > PDC and GIC hwirqs to be enabled so that the interrupt can trigger at
> > anytime. This is the normal mode of operation.
> Correct
> > When the CPU goes to
> > idle, and for that matter all the CPUs go to idle, the PDC should still
> > be monitoring the irqs that are enabled with irq_enable() and wake up
> > the CPU to receive the irq by taking all the CPUs out of deep idle
> > states where the GIC is powered off. If the irq is disabled with
> > irq_disable(), I'd think we would want to disable in the PDC so that the
> > irq doesn't wake us up from idle unnecessarily.
> yes, we do all this with current patch.
> >
> > Long story short, CPUs going in and out of idle and system not
> > suspending or freezing for s2idle means the PDC enable state should
> > follow irq enable state and completely ignore wake state. During system
> > suspend or freezing for s2idle the PDC enable state should follow wake
> > state. The tricky part is making sure the suspend and resume path
> > doesn't miss some interrupt that would have woken us up.
> Agree, we do all settings in PDC / GIC HW during deep suspend/ s2idle=20
> suspend
> and revert back to orignal state in HW when coming out of suspend
> >
> > I thought that maybe lazy irq disable would save us here.
> the lazy doesn't work for GPIO IRQs, gpiolib registers for .irq_disable=20
> for every gpio chip.

Why? Can the gpio chip stop doing that?

> >>
> >> This answer's your below comment as well on why can't we use irqchip's
> >> irq_suspend() and irq_resume() calls,
> >> since they also get internally invoked from syscore ops only.
> > Actually no it doesn't. It looks like the irqchip irq_suspend() and
> > irq_resume() ops are only called when the driver uses the generic
> > irqchip implementation. That doesn't look to be used here.
> correct
> > Good point
> > about the syscore ops and s2idle interaction, but it's not the real
> > reason why these ops can't be used.
> No internally generic chip also looks using syscore ops=20
> (irq_gc_syscore_ops)
> to invoke generic irq_chip's irq_suspend and irq_resume callbacks
>=20
> since s2idle still don't call syscore ops, these callback will never get =

> invoked
> if s2idle suspend is entered.

Are you using the generic irqchip code? I don't see that used here so
talking about the usage of syscore and how that doesn't work for s2idle
doesn't seem relevant here.

> >
> > Maybe we can always call the ops from somewhere deep in the suspend path
> > instead of using a notifier. That may make it simpler to reason about
> > and fix the s2idle problem at the same time. Putting it into a notifier
> > is difficult to understand and could potentially have a problem if
> > something like the timer irq needs to stay enabled until the end of
> > suspend but our suspend ops turn it off.
> we are not using suspend ops for same reason, with notifiers this will=20
> never happen, since we can determine last cpu
>=20
> 1. during s2idle suspend
>  =C2=A0=C2=A0=C2=A0 for all CPUs cpu_pm notifier will be called. we can d=
etermine which=20
> one is last cpu calling it.
>=20
> 2. during deep suspend
>  =C2=A0=C2=A0=C2=A0 non-boot cpus get disabled and from last cpu, kernel/=
cpu_pm.c=20
> registers for syscore ops and via
>  =C2=A0=C2=A0 this ops it invokes cpu_pm notification. so we know it is l=
ast cpu.
>=20
> so both cases these will be invoked at very last stage of suspend(be it=20
> s2idle or deep) when all other drivers are done
>=20
> and we will never run into above scenario.
>=20

I hope the irqs can be lazy disabled and whatever problem exists in gpio
driver can be resolved so that irqs can be left enabled in PDC and GIC
during suspend and idle entry. It's sort of odd to rely on lazy disable
behavior in this way, so it would need genirq maintainer approval.
