Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E86336F444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 05:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhD3DMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 23:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhD3DMn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 23:12:43 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C439C06138B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 20:11:54 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id i26so13332271oii.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4zSMC073IwDySDPBCUWFoXswHjrOIZYAwmTqB4nyr40=;
        b=FBmK2xwNc8x5jcpFOrvc5Zf8LTfin0m4daiMMgtQKAsSRgPzri5aH/ky+BzMGJoj0r
         JcQVBZrEkA0BOTJzFVVjYSbpHPAe0YnYbUiojMhDW1awvjVlSS8fM5BGp+YKt25zy27d
         B+EbZQr6wYUbUKhLIOf9v748NbtVSyKGFAysA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4zSMC073IwDySDPBCUWFoXswHjrOIZYAwmTqB4nyr40=;
        b=BbM272paD/S8ABerwBLct1DmMv+Cq/oq26a1Y8cUW61vs1eUhDh40FtouJxDcUxlSy
         rN5fqSEU9Z+FZUE6Ud8L43OaD3Ds/GjTom7K5sqhOEcwM5K8G2yqxyjl7oJr+ci3iuk5
         adoLKMb0xfbUWwzHk7ZXPhI+Y+Tvzv5UKYTFWR/uXFng+qD5D3IzQcB0UY05aJ62dwI8
         vwk8q1rdSZ8akmr1JI0ssJvWH56ws+TciLfMgmxzekyaSQszZVegpuiH2IdytgMOoGu2
         GO/972KNsOLXOcm1Nm0hPWtOL/1EPawh2WyWeF4uX+NvTJRgCr9K1XhmUwJ+tiRolrLw
         tXqA==
X-Gm-Message-State: AOAM5301jJhvUsB6UNSSCwaCtpJcDjyGv0vYBXIabOY7NWMiWZBTeWnJ
        6s3HQZQ22AU2vtZTKhGcF0hhDKzpM8Kl85uQGx1kKQ==
X-Google-Smtp-Source: ABdhPJzOfMPKP40dpYhMLcG5d6exIQrIvQ0ajFRWtRhjWqMaRDmJFQuS/NxnNBcjqise69iR9HkMUxFPxK4vXerq2T4=
X-Received: by 2002:aca:ed12:: with SMTP id l18mr9315627oih.24.1619752313591;
 Thu, 29 Apr 2021 20:11:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Apr 2021 20:11:52 -0700
MIME-Version: 1.0
In-Reply-To: <d88cd3e0af511ed60c12ce616ce22415@codeaurora.org>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
 <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
 <e3c3ef96ac507da6f138106f70c78ed2@codeaurora.org> <ddc1e372c5f864cd62c4e056ef2e6404@codeaurora.org>
 <CAE-0n53JNCc3JdONogGNArnsYLDr9E2fXZ2ODKBy7Jy3yVMr6g@mail.gmail.com>
 <9ccdef6e1a1b47bd8d99594831f51094@codeaurora.org> <CAE-0n533ZCaQkP7+XN+Ee9CG-r7vJD7LHG7_H8v7sVpimmQabg@mail.gmail.com>
 <d88cd3e0af511ed60c12ce616ce22415@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 29 Apr 2021 20:11:52 -0700
Message-ID: <CAE-0n50J1JkaBa5XQmHS8Fe2W5R2fXKpLoTWbH0RshRZivGZWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dp: service only one irq_hpd if there are
 multiple irq_hpd pending
To:     khsieh@codeaurora.org
Cc:     aravindh@codeaurora.org, robdclark@gmail.com, sean@poorly.run,
        abhinavk@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-04-29 10:23:31)
> On 2021-04-29 02:26, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-04-28 10:38:11)
> >> On 2021-04-27 17:00, Stephen Boyd wrote:
> >> > Quoting aravindh@codeaurora.org (2021-04-21 11:55:21)
> >> >> On 2021-04-21 10:26, khsieh@codeaurora.org wrote:
> >> >> >>
> >> >> >>> +
> >> >> >>>         mutex_unlock(&dp->event_mutex);
> >> >> >>>
> >> >> >>>         return 0;
> >> >> >>> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp,
> >> >> >>> struct drm_encoder *encoder)
> >> >> >>>         /* stop sentinel checking */
> >> >> >>>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
> >> >> >>>
> >> >> >>> +       /* link is down, delete pending irq_hdps */
> >> >> >>> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
> >> >> >>> +
> >> >> >>
> >> >> >> I'm becoming convinced that the whole kthread design and event queue
> >> >> >> is
> >> >> >> broken. These sorts of patches are working around the larger problem
> >> >> >> that the kthread is running independently of the driver and irqs can
> >> >> >> come in at any time but the event queue is not checked from the irq
> >> >> >> handler to debounce the irq event. Is the event queue necessary at
> >> >> >> all?
> >> >> >> I wonder if it would be simpler to just use an irq thread and process
> >> >> >> the hpd signal from there. Then we're guaranteed to not get an irq
> >> >> >> again
> >> >> >> until the irq thread is done processing the event. This would
> >> >> >> naturally
> >> >> >> debounce the irq hpd event that way.
> >> >> > event q just like bottom half of irq handler. it turns irq into event
> >> >> > and handle them sequentially.
> >> >> > irq_hpd is asynchronous event from panel to bring up attention of hsot
> >> >> > during run time of operation.
> >> >> > Here, the dongle is unplugged and main link had teared down so that no
> >> >> > need to service pending irq_hpd if any.
> >> >> >
> >> >>
> >> >> As Kuogee mentioned, IRQ_HPD is a message received from the panel and
> >> >> is
> >> >> not like your typical HW generated IRQ. There is no guarantee that we
> >> >> will not receive an IRQ_HPD until we are finished with processing of
> >> >> an
> >> >> earlier HPD message or an IRQ_HPD message. For example - when you run
> >> >> the protocol compliance, when we get a HPD from the sink, we are
> >> >> expected to start reading DPCD, EDID and proceed with link training.
> >> >> As
> >> >> soon as link training is finished (which is marked by a specific DPCD
> >> >> register write), the sink is going to issue an IRQ_HPD. At this point,
> >> >> we may not done with processing the HPD high as after link training we
> >> >> would typically notify the user mode of the newly connected display,
> >> >> etc.

I re-read this. I think you're saying that IRQ_HPD can come in after HPD
goes high and we finish link training? That sounds like we should enable
IRQ_HPD in the hardware once we finish link training, instead of having
it enabled all the time. Then we can finish the threaded irq handler and
the irq should be pending again once IRQ_HPD is sent over. Is there ever
a need to be processing some IRQ_HPD and then get another IRQ_HPD while
processing the first one?

> >> >
> >> > Given that the irq comes in and is then forked off to processing at a
> >> > later time implies that IRQ_HPD can come in at practically anytime.
> >> > Case
> >> > in point, this patch, which is trying to selectively search through the
> >> > "event queue" and then remove the event that is no longer relevant
> >> > because the display is being turned off either by userspace or because
> >> > HPD has gone away. If we got rid of the queue and kthread and processed
> >> > irqs in a threaded irq handler I suspect the code would be simpler and
> >> > not have to search through an event queue when we disable the display.
> >> > Instead while disabling the display we would make sure that the irq
> >> > thread isn't running anymore with synchronize_irq() or even disable the
> >> > irq entirely, but really it would be better to just disable the irq in
> >> > the hardware with a register write to some irq mask register.
> >> >
> >> > This pushes more of the logic for HPD and connect/disconnect into the
> >> > hardware and avoids reimplementing that in software: searching through
> >> > the queue, checking for duplicate events, etc.
> >>
> >> I wish we can implemented as you suggested. but it more complicate
> >> than
> >> that.
> >> Let me explain below,
> >> we have 3 transactions defined as below,
> >>
> >> plugin transaction: irq handle do host dp ctrl initialization and link
> >> training. If sink_count = 0 or link train failed, then transaction
> >> ended. otherwise send display up uevent to frame work and wait for
> >> frame
> >> work thread to do mode set, start pixel clock and start video to end
> >> transaction.
> >
> > Why do we need to wait for userspace to start video? HPD is indicating
> > that we have something connected, so shouldn't we merely signal to
> > userspace that something is ready to display and then enable the irq
> > for
> > IRQ_HPD?
> >
> yes, it is correct.
> The problem is unplug happen after signal user space.
> if unplug happen before user space start mode set and video, then it can
> just do nothing and return.
> but if unplugged happen at the middle of user space doing mode set and
> start video?

I expect the link training to fail, maybe slowly, but userspace should
still be notified that the state has changed to disconnected when the
irq comes in, around the same time that the cable is physically
disconnected.

>
> remember we had run into problem system show in connect state when
> dongle unplugged, vice versa.
>

These problems are still happening as far as I can tell. I've heard
reports that external panels are showing up as connected when no dongle
is there, implying that HPD handling is broken.

>
>
>
> >>
> >> unplugged transaction: irq handle send display off uevent to frame
> >> work and wait for frame work to disable pixel clock ,tear down main
> >> link and dp ctrl host de initialization.
> >
> > What do we do if userspace is slow and doesn't disable the display
> > before the cable is physically plugged in again?
> >
> plugin is not handle (re enter back into event q) until unplugged handle
> completed.
> >>
> >> irq_hpd transaction: This only happen after plugin transaction and
> >> before unplug transaction. irq handle read panel dpcd register and
> >> perform requesting action. Action including perform dp compliant
> >> phy/link testing.
> >>
> >> since dongle can be plugged/unplugged at ant time, three conditions
> >> have
> >> to be met to avoid race condition,
> >> 1) no irq lost
> >> 2) irq happen timing order enforced at execution
> >> 3) no irq handle done in the middle transaction
> >>
> >> for example we do not want to see
> >> plugin --> unplug --> plugin --> unplug become plugin --> plugin-->
> >> unplug
> >>
> >> The purpose of this patch is to not handle pending irq_hpd after
> >> either
> >> dongle or monitor had been unplugged until next plug in.
> >>
> >
> > I'm not suggesting to block irq handling entirely for long running
> > actions. A plug irq due to HPD could still notify userspace that the
> > display is connected but when an IRQ_HPD comes in we process it in the
> > irq thread instead of trying to figure out what sort of action is
> > necessary to quickly fork it off to a kthread to process later.
> >
> > The problem seems to be that this quick forking off of the real IRQ_HPD
> > processing is letting the event come in, and then an unplug to come in
> > after that, and then a plug in to come in after that, leading to the
> > event queue getting full of events that are no longer relevant but
> > still
> > need to be processed. If this used a workqueue instead of an open-coded
> > one, I'd say we should cancel any work items on the queue if an unplug
> > irq came in. That way we would make sure that we're not trying to do
> > anything with the link when it isn't present anymore.
> >
> is this same as we delete irq_hpd from event q?
> What happen if the workqueue had been launched?

Yes workqueues are basically functions you run on a kthread with various
ways to either make sure that the work has finished processing or to try
to cancel it out so that it either doesn't run at all because the
kthread hasn't picked it up or that it runs to completion before
continuing. The event queue should be replaced with a workqueue design,
but even better would be to use a threaded irq if possible so that
hardware can't raise more irqs while one is being handled.

>
> > But even then it doesn't make much sense. Userspace could be heavily
> > delayed after the plug in irq, when HPD is asserted, and not display
> > anything. The user could physically unplug and plug during that time so
> > we really need to not wait at all or do anything besides note the state
> > of the HPD when this happens. The IRQ_HPD irq is different. I don't
> > think we care to keep getting them if we're not done processing the
> > previous irq. I view it as basically an "edge" irq that we see,
> > process,
> > and then if another one comes in during the processing time we ignore
> > it. There's only so much we can do, hence the suggestion to use a
> > threaded irq.
> >
> I do not think you can ignore irq_hpd.
> for example, you connect hdmi monitor to dongle then plug in dongle into
> DUT and unplug hdmi monitor immediatly.
> DP driver will see plugin irq with sink_count=1 followed by irq_hpd with
> sink_count= 0.
> Then we may end up you think it is in connect state but actually it
> shold be in disconnect state.

Yes I'm saying that we should be able to use the hardware to coalesce
multiple IRQ_HPDs so that we don't unmask the IRQ_HPD until a connect
irq tells us a cable is connected, and then we mask IRQ_HPD when a
disconnect irq happens, and ignore extra IRQ_HPDs by processing the
IRQ_HPD in a threaded irq handler.

Maybe this can't work because the same hardware irq is used for the HPD
high/low and IRQ_HPD? If that's true, we should be able to keep the
IRQ_HPD masked until the event is processed by calling
dp_catalog_hpd_config_intr() to disable DP_DP_IRQ_HPD_INT_MASK when we
see it in the irq handler and only enable the irq again once we've
processed it, which I guess would be the end of dp_irq_hpd_handle()?

> I do not think we can ignore irq_hpd but combine multiple irq_hpd into
> one and handle it.
>
>
> > This is why IRQ_HPD is yanking the HPD line down to get the attention
> > of
> > the source, but HPD high and HPD low for an extended period of time
> > means the cable has been plugged or unplugged. We really do care if the
> > line goes low for a long time, but if it only temporarily goes low for
> > an IRQ_HPD then we either saw it or we didn't have time to process it
> > yet.
> >
> > It's like a person at your door ringing the doorbell. They're there
> > (HPD
> > high), and they're ringing the doorbell over and over (IRQ_HPD) and
> > eventually they go away when you don't answer (HPD low). We don't have
> > to keep track of every single doorbell/IRQ_HPD event because it's
> > mostly
> > a ping from the sink telling us we need to go do something, i.e. a
> > transitory event. The IRQ_HPD should always work once HPD is there, but
> > once HPD is gone we should mask it and ignore that irq until we see an
> > HPD high again.
>
> if amazon deliver ring the door bell 3 times, then we answer the door at
> the third time. this mean the first and second door bell ring can be
> ignored.
> Also if door bell ring 3 times and left an package at door then deliver
> left, you saw deliver left form window then you still need to answer to
> find out there is package left at door. If you ignore doorbell, then you
> will missed the package.

There isn't a package being left at the door. When HPD goes away,
there's nothing to do anymore. Stop going to the door to look for
anything. Maybe a better analogy is that the entire door and doorbell is
gone when HPD goes away.

>
>
> I believe both thread_irq and event q works.
> But I think event q give us more finer controller.

What sort of finer control? Opinions need supporting facts or they're
just opinions.

> We are trying to fix an extreme case which generate un expected number
> of irq_hpd at an unexpected timing.
> I believe other dp driver (not Qcom) will also failed on this particular
> case.
>

I don't understand why that matters. This driver being just as bad as
other drivers isn't a good quality.
