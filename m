Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA31D1A95ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 10:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635702AbgDOIOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 04:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635699AbgDOIOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 04:14:48 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE33C061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 01:06:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ay6so3493884pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=B/g/TibAwjnY+yZvWkjgMkgQ4bw2jpBYOPJoNThz+9s=;
        b=Xrce0ezokSWs3FfUARizxB8o5/PiN9E3IASHBma7HFNvpNifNrFTZpgqMCzhcEiGUm
         dNbVjpiihS6iv+VaPvwB8plAgZdSYXYSAB89019YPNu4/73XuyK1fFQKyNPwCga186cf
         yRZlMANtJ2H8iBhLoO8ksxZlvMTLlh8b8Qedg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=B/g/TibAwjnY+yZvWkjgMkgQ4bw2jpBYOPJoNThz+9s=;
        b=ZshNyUmAQHB8CgeoAYTUSvHaNClxa/MrfMQTdrcEY4ffrxdpy1HqRIJEw8HxWyS0Nv
         b/JBl6oAGyc+MLjs95d2uIXTKcGJOxGZGqnz0SBI6aQekDq5oasCy0xU4dNJ8e8VhqHA
         9xsRLCxqSPMnwRPm3YXMUW5hr3jmURbxMlURe9A7uAN24ZhJ884TF2cpr80fjKpz/kYH
         izrmuJ4/EjZbvUD15QOZxZzGwG1KUdQrAWM67w+GBk0EHupGvsgDgVXk9yX/CtzY5cf+
         pboRRNeB+y/85Rrpq/Jg8bK4UoibN+EjXXIgJJ9VHmOy5UILhVPVY6XY5rN6gALgiX9U
         oQOw==
X-Gm-Message-State: AGi0Pubdipop6CV+QG3d3d2nFlrjeaVSrDOfuFa2X9UWwt/elLKieLj2
        Sj3/VHfHtHTL+xEtNh4FwlG2ig==
X-Google-Smtp-Source: APiQypLLdh4gCH6xPQD932aD4e+9Q4VC56oHYWETgKfpaqLWNnA8NJsr4ZHGeJSg8ad7Tbg0wx/S1Q==
X-Received: by 2002:a17:90a:35a6:: with SMTP id r35mr5000362pjb.61.1586937967056;
        Wed, 15 Apr 2020 01:06:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z13sm8012576pjz.42.2020.04.15.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 01:06:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org>
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org> <1585586460-3272-2-git-send-email-mkshah@codeaurora.org> <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com> <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org>
Subject: Re: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 15 Apr 2020 01:06:05 -0700
Message-ID: <158693796555.105027.4658047860202135403@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-14 01:05:36)
> Hi,
>=20
> On 4/14/2020 6:05 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-03-30 09:41:00)
> >> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> >> index 6ae9e1f..c43715b 100644
> >> --- a/drivers/irqchip/qcom-pdc.c
> >> +++ b/drivers/irqchip/qcom-pdc.c
> >> +                        * the pending interrupt gets cleared at GIC b=
efore
> >> +                        * enabling it from msm_gpio_irq_enable(). So =
CPU will
> >> +                        * never see pending IRQ after resume if we di=
sable them
> >> +                        * here.
> > Is there something that's doing this in the gpio driver? It sounds
> > like the bug lies in that driver. Maybe the gpio driver should use
> > irq_startup instead of irq_enable to clear anything pending? The comment
> > in msm_gpio_irq_enable() talks a lot but doesn't actually say why it's a
> > problem to be latched at the GIC as pending when the irq is enabled the
> > first time.
> This is to clear any erroneous interrupts that would have got latched=20
> when the interrupt is not in use.
>=20
> There may be devices like UART which can use the same gpio line for data =

> rx as well as a wakeup gpio
>=20
> The data that was flowing on the line may latch the interrupt and when=20
> we enable the interrupt,we see IRQ pending and unexpected IRQ gets=20
> triggered.

Isn't the interrupt supposed to latch in the hardware in this scenario?
We wanted to wakeup from UART RX over GPIO, and we did, and we also
wanted to send that data through the pin to the UART core, so I suspect
we muxed it as a UART pin and also watched it for an irq wakeup in the
GPIO driver and PDC? The wakeup irq handler can be ignored by the UART
driver if it wants.

> >
> >> +                               continue;
> >> +                       }
> >> +
> >> +                       irq_chip_disable_parent(d);
> >> +               }
> >> +       }
> >> +       p->from_pdc_suspend =3D false;
> >> +}
> >> +
> >> +static int pdc_cpu_pm_callback(struct notifier_block *nfb,
> >> +                              unsigned long action, void *v)
> >> +{
> >> +       struct pdc_pm_data *p =3D container_of(nfb, struct pdc_pm_data,
> >> +                                            pdc_cpu_pm_nfb);
> >> +       unsigned long flags;
> >> +
> >> +       if (!p->suspend_start)
> >> +               return NOTIFY_OK;
> >> +
> >> +       spin_lock_irqsave(&p->pm_lock, flags);
> >> +       switch (action) {
> >> +       case CPU_PM_ENTER:
> >> +               cpumask_set_cpu(raw_smp_processor_id(), &p->cpus_in_pc=
);
> >> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
> >> +                       pdc_suspend(p);
> >> +               break;
> >> +       case CPU_PM_ENTER_FAILED:
> >> +       case CPU_PM_EXIT:
> >> +               if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
> >> +                       pdc_resume(p);
> >> +               cpumask_clear_cpu(raw_smp_processor_id(), &p->cpus_in_=
pc);
> >> +               break;
> >> +       }
> >> +       spin_unlock_irqrestore(&p->pm_lock, flags);
> > What is the point of this callback? Any irqs that we want to wakeup the
> > CPUs from deep idle should be enabled via enable_irq(). Otherwise, they
> > shouldn't wake up the system. That's the difference between idle and
> > suspend.
> We already discussed and agreed to treat IRQs differently in idle and=20
> suspend.
> In summary if a SW does disable and mark IRQ as wake up capable.
> 1.=C2=A0=C2=A0=C2=A0 irq_disable()
> 2.=C2=A0=C2=A0=C2=A0 enable_irq_wake()
>=20
> Since the HW don't understand wake, it only knows either enabled or=20
> disabled IRQ. So the HW should do below.
> 1.=C2=A0=C2=A0=C2=A0 if system is in suspend, the IRQ should be kept Enab=
led in HW
> 2.=C2=A0=C2=A0=C2=A0 if system is out of suspend, the IRQ should be kept =
disabled in HW

Why should it be kept disabled at the PDC and GIC when the system is out
of suspend? Is that because software hasn't enabled the irq yet upon
resume and we're waiting for the irq consumer driver (EC for example) to
do that?

In the CPU idle path (i.e. the system isn't suspending) I'd expect the
PDC and GIC hwirqs to be enabled so that the interrupt can trigger at
anytime. This is the normal mode of operation. When the CPU goes to
idle, and for that matter all the CPUs go to idle, the PDC should still
be monitoring the irqs that are enabled with irq_enable() and wake up
the CPU to receive the irq by taking all the CPUs out of deep idle
states where the GIC is powered off. If the irq is disabled with
irq_disable(), I'd think we would want to disable in the PDC so that the
irq doesn't wake us up from idle unnecessarily.

Long story short, CPUs going in and out of idle and system not
suspending or freezing for s2idle means the PDC enable state should
follow irq enable state and completely ignore wake state. During system
suspend or freezing for s2idle the PDC enable state should follow wake
state. The tricky part is making sure the suspend and resume path
doesn't miss some interrupt that would have woken us up.

I thought that maybe lazy irq disable would save us here. The PDC
monitored irq could be disabled in software during suspend but not
actually disabled in hardware, so the irq could still latch. If it does
latch during suspend then we'll abort suspend either via hardware or
software detecting this case. Once we hit the end of suspend, we can
disable the PDC interrupts that aren't marked for wakeup. Implicitly,
the other interrupts that are marked for wakeup are already enabled
because they must have been lazily disabled or left enabled during
suspend. On the resume path we may have enabled some PDC interrupt for
wakeup that wasn't supposed to be enabled because software disabled it,
but it's all lazy so if it didn't trigger it doesn't matter, just let it
trigger later and if it does genirq will mask it appropriately and mark
it as pending.

>=20
> As we have two different suspend states namely suspend-to-idle (s2idle)=20
> and deep suspend.

Great! I'm glad you're interested in enabling s2idle.

>=20
> The PDC driver need to know "when" we are in suspend path. This is where =

> pdc_pm_callback is used, it will
> listen to PM_SUSPEND_PREPARE and PM_POST_SUSPEND events to know when=20
> system is entered in to suspend path
> and when it exited.
>=20
> Then comes the CPU PM notifier.
> If we are not in suspend path, the CPU PM notifier immediately returns,=20
> but when we are in suspend path,
> it starts marking CPUs to know when the last CPU notifies, it will=20
> invoke pdc_suspend().
> That finally programs the HW accordingly.
>=20
> Why last CPU? Because PDC is irq_chip and should execute suspend ops at=20
> very last stage during suspend.
>=20
> (if PDC registered for dev pm ops, It could happen that PDC's .suspend=20
> callback gets called first and then
> Let's say EC driver's .suspend is called where it does above to disable=20
> and mark IRQ as wakeup capable,
> however PDC should have called only after EC driver is done operating on =

> its IRQ from its .suspend call)
>=20
> Syscore ops are good to handle such scenarios since by this time all=20
> non-boot CPUs are offlined and we are
> running on boot CPU (last CPU) But then if someone chooses to enter=20
> "s2idle", syscore ops are not invoked in
> s2idle suspend path.
>=20
> I take we want to wake up with disabled but wakeup capable IRQ during=20
> s2idle suspend as well?
>=20
> If that is not the case, i can remove these notifiers and register for=20
> sycore ops.
> from syscore op's .suspend we can call pdc_suspend()..
>=20
> This answer's your below comment as well on why can't we use irqchip's=20
> irq_suspend() and irq_resume() calls,
> since they also get internally invoked from syscore ops only.

Actually no it doesn't. It looks like the irqchip irq_suspend() and
irq_resume() ops are only called when the driver uses the generic
irqchip implementation. That doesn't look to be used here. Good point
about the syscore ops and s2idle interaction, but it's not the real
reason why these ops can't be used.

Maybe we can always call the ops from somewhere deep in the suspend path
instead of using a notifier. That may make it simpler to reason about
and fix the s2idle problem at the same time. Putting it into a notifier
is difficult to understand and could potentially have a problem if
something like the timer irq needs to stay enabled until the end of
suspend but our suspend ops turn it off. That's what syscore is
typically important for. It gets the callback out of the path where
interrupts are still enabled and could potentially interfere with the
irqchip being disrupted. Maybe suspend_device_irqs() can be extended
here. I'm not sure.

>=20
>=20
> > In suspend, we want wakeup enabled irqs to wake us up from
> > suspend no matter if the irq is enabled or not. But for idle, we don't
> > care about the wakeup enable bit at all. The only bit that matters is
> > that the irq is enabled and then the expectation is that it will wake us
> > up. If there's some irq that can't wake us up from idle then we'll have
> > to just ignore that interrupt across deep CPU idle states. Is that
> > actually a problem? Or the SoC architects have figured out that certain
> > irqs don't matter for deep CPU idle states and so we don't have to
> > monitor them?
