Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6F838BDB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 07:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238372AbhEUFBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 01:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238275AbhEUFBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 01:01:37 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26947C061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 22:00:14 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id o14-20020a4a384e0000b029020ec48a2358so2226179oof.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 22:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FKfovp3/MGxEXHdgHe1obh+6nfXZPRl0l3elRwa0NRo=;
        b=mjmlVCqghK3ZHVV6fQUFx2yEVid2cPUx4McEN61V7vEIl/0pVwyB5ZxV8Nxg74FDjM
         vcGLGwSvjXXJ6MGwuIgtjU6Oj+ufIOU8I5+VvKP1jmxY2P1SyyGNhvx9fMN2h7MuIWiD
         I/umWum291wATj83pjphOCDTZics1tLeYhV1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FKfovp3/MGxEXHdgHe1obh+6nfXZPRl0l3elRwa0NRo=;
        b=AAh7FQaYqtJh0wvCxmyfTQ4djiGH/h+x5hl0h/7UMnX4xPzIHY3m3mNUcrqgQdPDYs
         wpawkO3AS//93zt36tRSYV6o1rXpa3txOE+oTTAsraDnxXDGO14rcp5EaaWHpWzMaEKe
         tKfdH3B2vh5+xJzmi1HkNn9hcfl3llsOK+mxxjIHRmrheZbOcsw3woZqJHJTVjkdK2+a
         90EONL9A76BhQpXqqqQeMieLJEzBLoDh9M5Sy4hxmUaRrzazedWXtjbHRJBp+91x62Gj
         6Na1e7f3TyxioFLfUQjjXF4LF/SpeGT3u7dV1DBeQRVRV+wnTtltDSxX7+lat7v6Upxg
         Ma6g==
X-Gm-Message-State: AOAM533478u4Hyf+BU4tnLvFdkhwCXeHhu5XCFO6hWiPy7MNEaYxyH98
        7R9NqKBHSedv8iyPfpRBdg6W5wg4CEc1if8A8nPsjg==
X-Google-Smtp-Source: ABdhPJxB1qkx5SVkS2PoEjgv1g/v4Q/Z+reUTz46j9VmP1JqypN7xDiA/XlNqe/OE+h0h/vjqD2N6gX45NEJHVdXiRo=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr6551230ooh.80.1621573213469;
 Thu, 20 May 2021 22:00:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 May 2021 22:00:12 -0700
MIME-Version: 1.0
In-Reply-To: <5d341df202facb3240a72cfb35e18167@codeaurora.org>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53VUr=f=PKnO5HhXZ3BAG_mNBwmQrfQPxHvxLZPDReA+g@mail.gmail.com>
 <c1a3ced9ac4682bae310712a11576322@codeaurora.org> <CAE-0n50yRCA00ck_FtXwzKw_R8UcocMzTh8V7NOe4ob__3G3bg@mail.gmail.com>
 <e071434531947e5c4275a1a14b77b2c3@codeaurora.org> <CAE-0n52rBrjy-=dpqK+dae2GNk1rAaQnKqCjzdqiAoS13gHpSQ@mail.gmail.com>
 <f476d82d0798e0d7eb9e12949aa2c8f1@codeaurora.org> <CAE-0n51+mbCAqWWTOMDA4Rx_=96V4tK8g+UWVZ-nnp50dFzRPA@mail.gmail.com>
 <5d341df202facb3240a72cfb35e18167@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 20 May 2021 22:00:12 -0700
Message-ID: <CAE-0n50u-qGvqzJThc+ggghv6ZErPr8g8dhvgequBm5CWOR2Kw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     khsieh@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-05-20 15:39:09)
> On 2021-05-20 14:28, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-05-20 13:05:48)
> >> On 2021-05-20 12:28, Stephen Boyd wrote:
> >> >> Put dongle to D3 state so that it will not issue the unnecessary
> >> >> second
> >> >> irq_hpd with sink_count = 0. this will prevent the annoy but unharmful
> >> >> DP_LINK_STATUS_UPDATED warning message.
> >> >> Again, we can not disable hpd interrupt since dongle still attached
> >> >> and
> >> >> hdmi cable can be plugged in at any instant.
> >> >>
> >> >
> >> > Right I'm not suggesting to disable hpd interrupt, just the hpd_irq
> >> > interrupt once an unplug irq comes in, and do that in hardirq context.
> >> > Also, I'm suggesting that we consider unplug as a higher priority if
> >> > the
> >> > hard irq handler is delayed for some reason and both an unplug irq and
> >> > an hpd irq are pending in the hardware when the hard irq handler is
> >> > running. Putting the dongle into D3 state won't fix these problems.
> >>
> >>
> >>
> >> The unplug interrupt is not happen in this case since dongle still
> >> attached.
> >> The unplug interrupt only happen when dongle unplugged.
> >
> > Agreed.
> >
> >>
> >> I think you mistakenly think DP_LINK_STATUS_UPDATED is caused by
> >> unplug
> >> interrupt.
> >
> > Ok, got it.
> >
> >> DP_LINK_STATUS_UPDATED happen is due to dongle issue two consecutive
> >> irq_hpd with sink_count = 0 when hdmi cable unplugged from dongle.
> >> The first irq_hpd with sink_count = 0 is handled as expected to turn
> >> off
> >> display.
> >> After that the second irq_hpd with sink_count = 0 is handled.
> >> Since display had turned off, then there is nothing to do but spill
> >> DP_LINK_STATUS_UPDATED warning message.
> >> There is no unplug (hpd become low) happen in this case since dongle
> >> still attached.
> >
> > Agreed.
> >
> >>
> >> All interrupt (plug/irq_hpd and unplug) are required to be handled in
> >> the order of happening.
> >> We can not ignore any one.
> >> For example, you plug/unplug two different resolution monitor
> >> alternative to/from dongle and unplug dongle once for while.
> >>
> >> I think the race condition you describe here all had been taken care
> >> with
> >> 1) convert irq into event and store at event q in order.
> >> 2) irq handled base on transaction. Next irq can be handled when
> >> previous irq transaction is done.
> >>
> >
> > I'm mostly trying to point out that the irq handling and masking needs
> > to be done in the hard irq context and not in the kthread. It may or
> > may
> > not be related to this message that's printed.
> >
> > What happens if the hardirq is blocked by some other irq that takes a
> > long time to process? Imagine this scenario:
> >
> > CPU0                                CPU1
> > ----                                ----
> >  really_long_other_hardirq() {
> >                                     hpd_irq
> >                                   hpd_irq
> >                                   hpd low
> >  }
> >
> >  dp_display_irq_handler() {
> >
>
>
> >    <fork things to kthread>
> >  }
> >
> > Shouldn't we ignore any hpd_irq events in this scenario? And shouldn't
> > we be disabling the hpd_irq by masking it with DP_DP_IRQ_HPD_INT_MASK
> > when hpd goes low (i.e. DP_DP_HPD_UNPLUG_INT_MASK)?
>
>
>
> 1) irq_hpd interrupt always happen before unplug interrupt
> 2)if hdp_isr_status = (DP_DP_IRQ_HPD_INT_MASK |
> DP_DP_HPD_UNPLUG_INT_MASK) at the time when read at
> dp_display_irq_handler(),
> then DP_DP_IRQ_HPD_INT_MASK will be add into evetn q first followed by
> DP_DP_HPD_UNPLUG_INT_MASK be add into event q.
> So that DP_DP_IRQ_HPD_INT_MASK will be executed by the event thread
> before DP_DP_HPD_UNPLUG_INT_MASK.
> On the other word, IRQ_HPD has higher priority over UNPLUG in the timing
> matter.
> By doing that we can shut down display gracefully.

Ok. So you're saying that we want to put both events on the queue
regardless, and put IRQ_HPD there first because we want to check the
status bit? Doesn't reading the status bit require the dongle to be
connected though? So if an unplug came in along with an irq_hpd we may
queue both the irq_hpd and the unplug, but when it comes time to process
the irq_hpd in the kthread the link will be gone and so trying the dpcd
read for the link status will fail?

>
> If you insist, at hdp_isr_status = (DP_DP_IRQ_HPD_INT_MASK |
> DP_DP_HPD_UNPLUG_INT_MASK) case,
> we can have only add DP_DP_HPD_UNPLUG_INT_MASK to event q only by
> dropping DP_DP_IRQ_HPD_INT_MASK.
> Is this will work for you?
>

I'm not insisting on anything. I'm just trying to think of various
corner cases that we're not handling in the code so we don't have to
worry about them in the future.
