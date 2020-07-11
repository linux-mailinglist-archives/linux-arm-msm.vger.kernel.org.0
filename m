Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1FF21C34C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 11:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgGKJQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 05:16:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:40538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727888AbgGKJQa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 05:16:30 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66B51206F0;
        Sat, 11 Jul 2020 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594458989;
        bh=3kHI0MpfwxWrtgpDGGjNIDO93+S/R3yYU6/0s1gIhkw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MKyCJmAX3JFgRV9Afr+Q9xYrh1kao3vxYDLbFgyd7y8Xss8OIMpDlXQiMMmgb8Bzr
         jiAaLsSUuCtPq36XeVmh/1DiC5hartWASgBLLkQsLSPnH5EQ+A/BBq0sfOEORmOFm0
         vsx9S3PhS7Sp3hsMxD2u/we2XMejmZmwIRZEZIxc=
Received: from host109-149-250-171.range109-149.btcentralplus.com ([109.149.250.171] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1juBcR-00Ault-Hc; Sat, 11 Jul 2020 10:16:27 +0100
Date:   Sat, 11 Jul 2020 10:16:26 +0100
Message-ID: <87sgdyxvh1.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
In-Reply-To: <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
        <87lfjreo7m.wl-maz@kernel.org>
        <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 EasyPG/1.0.0 Emacs/26.3
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 109.149.250.171
X-SA-Exim-Rcpt-To: dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org, linux-arm-msm@vger.kernel.org, cychiang@chromium.org, ilina@codeaurora.org, agross@kernel.org, rnayak@codeaurora.org, mkshah@codeaurora.org, bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jul 2020 17:10:55 +0100,
Doug Anderson <dianders@chromium.org> wrote:
> 
> Hi,
> 
> On Fri, Jul 10, 2020 at 2:03 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > Hi Doug,

[...]

> >
> > > +     type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> > > +
> > > +     raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> > What is this lock protecting you against? In both cases, you are
> > already under the irq_desc lock, with interrupts disabled.
> 
> We are?  I put a breakpoint when the IRQ hits and did a bt.  I see
> this (I happen to be on 5.4 at the moment, so hopefully the same as
> mainline):
> 
>  kgdb_breakpoint+0x3c/0x74
>  msm_gpio_update_dual_edge_parent+0x58/0x17c
>  msm_gpio_handle_dual_edge_parent_irq+0x1c/0x30
>  __handle_domain_irq+0x84/0xc4
>  gic_handle_irq+0x170/0x220
>  el1_irq+0xd0/0x180
> 
> I think the stack is missing a few things due to aggressive inlining
> from my compiler, so the true backtrace would be:
> 
> msm_gpio_handle_dual_edge_parent_irq()
> generic_handle_irq_desc()
> generic_handle_irq()
> __handle_domain_irq()
> handle_domain_irq()
> gic_handle_irq()
> 
> The first place that got the "desc" was generic_handle_irq() and it
> got it via irq_to_desc().  That doesn't seem to do any locking.  Then
> generic_handle_irq_desc() just calls a function pointer so no locking
> there either.
> 
> ...ah, but maybe what you're saying is that
> msm_gpio_handle_dual_edge_parent_irq() should be holding "desc->lock"
> around the call to msm_gpio_update_dual_edge_parent()?  I can do that.

No, I mentally did a fast-forward to moving this hack into the irq
flow, rather than doing before entering the flow. handle_fasteoi_irq
will take the lock, but obviously not with the current state of this
patch.

>
> 
> > > +     do {
> > > +             /* Set the parent to catch the next edge */
> > > +             irq_chip_set_type_parent(d, type);
> > > +
> > > +             /*
> > > +              * Possibly the line changed between when we last read "val"
> > > +              * (and decided what edge we needed) and when set the edge.
> > > +              * If the value didn't change (or changed and then changed
> > > +              * back) then we're done.
> > > +              */
> >
> > If the line changed, shouldn't you actually inject a new interrupt
> > altogether? By changing the polarity more than once, you are
> > effectively loosing edges that should have triggered an interrupt.
> 
> Are you sure this is needed?  My understanding of edge triggered
> interrupts is that until the interrupt handler is called that all
> edges can be coalesced into a single interrupt.

It really depends on whether the edges are semantically different, and
I'm not sure you can decide this at the interrupt controller
level. The core IRQ code doesn't give you a way to discriminate
between those, but endpoint drivers could, and could get terminally
confused if the see two rising edges without a falling edge in
between.

> It's only after the
> interrupt handler is called that it's important to capture new edges.
> So if you have this:
> 
> a) Be busy processing another unrelated interrupt
> b) 5 edges happen on the line
> c) Other interrupt finishes
> d) Edge interrupt is acked and handler is called
> 
> You'll only get one call to the interrupt handler even though there
> were 5 edges, right?  It's only important that you queue another
> interrupt if that interrupt happens after the true interrupt handler
> (the one acting on the edge) has started.
> 
> ...actually, in theory you'll get _either_ one or two calls to the
> interrupt handler depending on timing, since the above could also
> happen as:
> 
> a) Be busy processing another unrelated interrupt
> b) 4 edges happen on the line
> c) Other interrupt finishes
> d) Edge interrupt is acked and ...
> e) 1 more edge happens on the line
> f) ...handler is called
> g) Edge interrupt is acked and handler is called
> 
> 
> As long as msm_gpio_update_dual_edge_parent() is called _before_ the
> true interrupt handler is called then what I have should be fine,
> right?

I don't disagree with any of that, except that being fine at the
irqchip level doesn't necessarily mean being fine at the endpoint
driver level. On the other hand, the HW looks terminally broken, so
maybe it doesn't matter as the drivers will have to be written with
this limitation in mind...

> 
> > > +             val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> > > +             if (type == IRQ_TYPE_EDGE_RISING) {
> > > +                     if (!val)
> > > +                             break;
> > > +                     type = IRQ_TYPE_EDGE_FALLING;
> > > +             } else if (type == IRQ_TYPE_EDGE_FALLING) {
> > > +                     if (val)
> > > +                             break;
> > > +                     type = IRQ_TYPE_EDGE_RISING;
> > > +             }
> > > +     } while (loop_limit-- > 0);
> > > +     raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > > +
> > > +     if (!loop_limit)
> > > +             dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
> > > +}
> > > +
> > > +void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
> > > +{
> > > +     struct irq_data *d = &desc->irq_data;
> > > +
> > > +     /* Make sure we're primed for the next edge */
> > > +     msm_gpio_update_dual_edge_parent(d);
> >
> > I would have expected this to happen on EOI or ACK, rather than before
> > the flow is actually handled, once you have told the interrupt
> > controller that you were dealing with this interrupt.
> 
> Having it on Ack would be ideal, but it appears that the Ack function
> isn't called in this case.  That's only called if our handler is
> handle_edge_irq() or handle_level_irq().  See more below.

Easily fixed, see further down.

> 
> ...I'm pretty sure I don't want it on EOI.  Specifically, if I did it
> on EOI then I think I _would_ need to re-queue another interrupt if an
> edge came in msm_gpio_update_dual_edge_parent().  Doing all the edge
> adjustment before calling the true interrupt handler avoids all
> that.

Requeuing interrupts would be fine, and we have the retrigger callback
for that. This can be used when you want to support level interrupts,
but your interrupt controller only supports edge. Something similar
could be done to deal with dual edge interrupts.

> 
> 
> > > +
> > > +     /* Pass on to the normal interrupt handler */
> > > +     handle_fasteoi_irq(desc);
> >
> > Is that the right flow? It seems that the current code is using
> > handle_edge_irq. I guess it has been broken so far, and that this
> > patch actually fixes it by forcing a fasteoi flow...
> 
> The code today only uses handle_level_irq() / handle_edge_irq() if
> "skip_wake_irqs" wasn't set for this IRQ.  In the case that
> "skip_wake_irqs" wasn't set then it leaves the handler alone.  I
> definitely had a hard time following all the flow and interactions
> between the pinctrl, PDC, and the GICv3 but I definitely did confirm
> that handle_fasteoi_irq() was the handler that was running when
> "skip_wake_irqs" was set before I stuck mine in the middle.

OK.

> I believe how things work today with the "skip_wake_irqs" case is
> that, for the most part, the pinctrl driver stays out of the way for
> setting up and handling IRQs and just passes some calls onto its
> parent (the PDC).  The PDC driver is actually quite minimal.  There's
> no "Ack" in there and no calls to set an IRQ handler--it seems to just
> rely on the GICv3 doing all that.  It looks there is an implicit Ack
> as part of gic_handle_irq() since reading the IAR counts as an Ack.
> 
> 
> So to try to sum up my understanding:
> 
> 1. In the case of "skip_wake_irqs" today there is no acking / handling
> code that is part of pinctrl-msm or the PDC.  They just configure
> things to direct to the GICv3.
> 
> 2. For my workaround I just need to make sure to intercept myself and
> prime the next edge _before_ the end-user interrupt handler gets
> called.  If edges are coalesced before the end-user interrupt handler
> is called then that's OK.
> 
> 
> I'll await your reply before sending out the next version.  Thanks
> much for all your time looking at this!

So here are my suggestions:

- Move your dual edge hack to the irq_ack callback

- On detecting a dual edge interrupt, switch to the
  handle_fasteoi_ack_irq flow, which will call the irq_ack callback

- Get rid of the now useless locking

I bet you could reuse some of the existing hacks, though I haven't
looked too hard because it is Saturday and this code really makes my
eyes bleed.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
