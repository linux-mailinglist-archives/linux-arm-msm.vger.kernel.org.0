Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6273925CE3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 01:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgICXTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 19:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgICXTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 19:19:24 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C591C061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 16:19:24 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e14so2668639vsa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T6WdbDtaJju8Wd5Qfl63dOMmDDWlZ9QBk+0SG3b8nzU=;
        b=Pp0doULk3CUHBvhNlrPHW0vLZeN++8R52F0gdy12WUhRPV8Y5IL8l3vDkHODpakk9V
         fI6WTr9tljgfFKRVAYczkefI8icYOwsr8aVIHwk7BY4WtKTWLRfyJjrrFrt5/B5AvJlc
         vEIJ7FyNxVv35fto2vnpRtxWV0yu8IRo3R/WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6WdbDtaJju8Wd5Qfl63dOMmDDWlZ9QBk+0SG3b8nzU=;
        b=mqZKZl2brXACWTOlHwZagYGYoyStyXOBg5IhM6J7MmxuT4O0XEfX5qOqI8UPN2dvtx
         /yPVL1vJ8eOGnlphFqHS9aHBGU//ynf95suGS/Xo/vDoG9EH8EnapZNUQ0kMJUAxlH7H
         ysB4TZ00C3OOe4J+rsVQyzq3X+dCi485Tcpl2HAB4hjkRJOZFlA7SAMMM1La1W/VUaUw
         NUOF5LoIlPGrjvHxDb+QRpNkRSy8DYgJ0xPVqYm67mBxWiJxxDBmAOKDRwHVvJgP7fPy
         Nja1sSD2Uqny3egSVDMzEJqXLBq6UEnUY9nFDcbZDIczz1PkqMKl+a/INQQlHuvXLwu9
         BFHA==
X-Gm-Message-State: AOAM531q6lsm9PIuBeV92FunHRJfwky6vck/JOIPQgJu0NUwZ/OMd7X6
        VhaA2O6hrm7SJdlame8oKtYYZcpOgVE9dA==
X-Google-Smtp-Source: ABdhPJxdmCdq5ZhsJW66sZHzCpoaCKSqfLJCIpohKXdINO1I8fXuqJWMVOV83xJdPvZ4zF8Ogct6SA==
X-Received: by 2002:a67:ec3:: with SMTP id 186mr3804147vso.163.1599175162607;
        Thu, 03 Sep 2020 16:19:22 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id n186sm622081vsd.9.2020.09.03.16.19.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 16:19:21 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id q200so1219042vke.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:19:21 -0700 (PDT)
X-Received: by 2002:ac5:cd88:: with SMTP id i8mr3496396vka.4.1599175160827;
 Thu, 03 Sep 2020 16:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
 <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
 <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org>
 <87y2m1vhkm.fsf@nanos.tec.linutronix.de> <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com>
 <877dtdj042.fsf@nanos.tec.linutronix.de> <CAD=FV=Ua7fLGw6JiG1rnCKpAdO1nXX4A4x1Why-LE9L_FBFe8Q@mail.gmail.com>
 <87zh67uife.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87zh67uife.fsf@nanos.tec.linutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 16:19:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8vchyRXOjozYYroq3Mit_gt=XXADLfn0W4N4TyQzyjQ@mail.gmail.com>
Message-ID: <CAD=FV=U8vchyRXOjozYYroq3Mit_gt=XXADLfn0W4N4TyQzyjQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LinusW <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 3, 2020 at 5:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Wed, Sep 02 2020 at 13:26, Doug Anderson wrote:
> > Specifically I think it gets back to the idea that, from a device
> > driver's point of view, there isn't a separate concept of disabling an
> > IRQ (turn it off and stop tracking it) and masking an IRQ (keep track
> > of it but don't call my handler until I unmask).  As I understand it
> > drivers expect that the disable_irq() call is actually a mask and that
> > an IRQ is never fully disabled unless released by the driver.  It is a
> > little unfortunate (IMO) that the function is called disable_irq() but
> > as far as I understand that's historical.
>
> Yes, the naming is historical but it always meant:
>
> Don't invoke an interrupt handler. Whether that's achieved by actually
> masking it at the interrupt chip level in hardware or by software state
> in the core does not matter from the driver perspective.
>
> >> The point is that the core suspend code disables all interrupts which
> >> are not marked as wakeup enabled automatically and reenables them after
> >> resume. So why would any driver invoke disable_irq() in the suspend
> >> function at all? Historical raisins?
> >
> > One case I can imagine: pretend that there are two power rails
> > controlling a device.  One power rail controls the communication
> > channel between the CPU and the peripheral and the other power rail
> > controls whether the peripheral is on.  At suspend time we want to
> > keep the peripheral on but we can shut down the power to the
> > communication channel.
> >
> > One way you could do this is at suspend time:
> >   disable_irq()
> >   turn_off_comm_power()
> >   enable_irq_wake()
> >
> > You'd do the disable_irq() (AKA mask your interrupt) because you'd
> > really want to make sure that your handler isn't called after you
> > turned off the communication power.  You want to leave the interrupt
> > pending/masked until you are able to turn the communications channel
> > back on and then you can query why the wakeup happened.
>
> Ok.
>
> > Now, admittedly, you could redesign the above driver to work any
> > number of different ways.  Maybe you could use the "noirq" suspend to
> > turn off your comm power or maybe you could come up with another
> > solution.  However, since the above has always worked and is quite
> > simple I guess that's what drivers use?
>
> That comm power case is a reasonable argument for having that
> sequence. So we need to make sure that the underlying interrupt chips do
> the right thing.
>
> We have the following two cases:
>
> 1) irq chip does not have a irq_disable() callback and does not
>    have IRQ_DISABLE_UNLAZY set
>
>    In that case the interrupt is not masked at the hardware level. It's
>    just software state. If the interrupt fires while disabled it is
>    marked pending and actually masked at the hardware level.
>
>    Actually there is a race condition which is not handled:
>
>    disable_irq()
>    ...
>
>    interrupt fires
>       mask and mark pending
>
>    ....
>    suspend_device_irq()
>       if (wakeup source) {
>          set_state(WAKEUP ARMED);
>          return;
>       }
>
>    That pending interrupt will not prevent the machine from going into
>    suspend and if it's an edge interrupt then an unmask in
>    suspend_device_irq() won't help. Edge interrupts are not resent in
>    hardware. They are fire and forget from the POV of the device
>    hardware.

Ah, interesting.  I didn't think about this case exactly.  I might
have a fix for it anyway.  At some point in time I was thinking that
the world could be solved by relying on lazily-disabled interrupts and
I wrote up a patch to make sure that they woke things up.  If you're
willing to check out our gerrit you can look at:

https://crrev.com/c/2314693

...if not I can post it as a RFC for you.  I'm sure I've solved the
problem in a completely incorrect and broken way, but hopefully the
idea makes sense.  In discussion we decided not to go this way because
it looked like IRQ clients could request an IRQ with
IRQ_DISABLE_UNLAZY and then that'd break us.  :(  ...but even so I
think the patch is roughly right and would address your point #1.


> 2) irq chip has a irq_disable() callback or has IRQ_DISABLE_UNLAZY set
>
>    In that case disable_irq() will mask it at the hardware level and it
>    stays that way until enable_irq() is invoked.
>
> #1 kinda works and the gap is reasonably trivial to fix in
>    suspend_device_irq() by checking the pending state and telling the PM
>    core that there is a wakeup pending.
>
> #2 Needs an indication from the chip flags that an interrupt which is
>    masked has to be unmasked when it is a enabled wakeup source.
>
> I assume your problem is #2, right? If it's #1 then UNMASK_IF_WAKEUP is
> the wrong answer.

Right, the problem is #2.  We're not in the lazy mode.

-Doug
