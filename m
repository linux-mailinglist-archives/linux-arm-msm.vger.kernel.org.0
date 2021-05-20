Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E35A38B795
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 21:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbhETTaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 15:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237673AbhETTaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 15:30:09 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597A7C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 12:28:47 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id s19so17437133oic.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UkMIkgxAg1yDU50Q27zsSjPf6ATFEQhYvSl3BA7FZWs=;
        b=l/XwDaSM0eTBErOQdXx+pm5scDKjtceA9ooO6g22HuXH/gHozT+VeDSc8a2tyte9p0
         b9f5CWu3gEBJvcercP9QoUkfrwDMZijoTSSUd38OmbgpPuhHFqOL5tDJZGwTjJp9qwck
         GrcmZFYMhDtuEDKyFQOapi+syhAzc086w32bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UkMIkgxAg1yDU50Q27zsSjPf6ATFEQhYvSl3BA7FZWs=;
        b=pCuR1e/o5R2i9BIdk6mSPd5Y8Eixsh7Wr/LwGMsDBhLkQ0oM8Yl9cilTKQPOSC10bZ
         8arQbMYTYrmd2tbZi2YteQYm5ykdAylsN/F0n9k7dKgtlzrA//McF+v3+3nIR1wi8NTe
         Sh+pzwVKr7JwWVFeKqcQlaNds+8LVnK1enwJIIotFnEV41OPQoryRMUnGyG/zg4k5wy3
         2PeD7fzoouFwN5sWXJ5WyFPtY/oPX/4DukR0HtOQiriW4WdRAHFYY6ZG0HjJxXYuIStk
         K7HSjEz4yyphytRM7lgUc2UME/bg23BGXMwjXGXdn952WDGluV6p+g83aDfe65fqDHMc
         caUA==
X-Gm-Message-State: AOAM530yGInNb6iP2rzyJ7Lq6MOsfLtFV8uQ0HpB8xWU6EZXFRznfZPf
        Ov2z/2eUq3ONOKfBMcLUJecCfz8fOPair8OQbw2vNA==
X-Google-Smtp-Source: ABdhPJycnoVRNHyVCJ7p4WTbEK2ooDsoACtWKydECvIhMgsT9Py4KJxnv4eCrQkaI8ZWtJ2nPliIKOWT+oZyY1tnXc8=
X-Received: by 2002:a54:4501:: with SMTP id l1mr4373766oil.19.1621538926660;
 Thu, 20 May 2021 12:28:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 May 2021 12:28:46 -0700
MIME-Version: 1.0
In-Reply-To: <e071434531947e5c4275a1a14b77b2c3@codeaurora.org>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53VUr=f=PKnO5HhXZ3BAG_mNBwmQrfQPxHvxLZPDReA+g@mail.gmail.com>
 <c1a3ced9ac4682bae310712a11576322@codeaurora.org> <CAE-0n50yRCA00ck_FtXwzKw_R8UcocMzTh8V7NOe4ob__3G3bg@mail.gmail.com>
 <e071434531947e5c4275a1a14b77b2c3@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 20 May 2021 12:28:46 -0700
Message-ID: <CAE-0n52rBrjy-=dpqK+dae2GNk1rAaQnKqCjzdqiAoS13gHpSQ@mail.gmail.com>
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

Quoting khsieh@codeaurora.org (2021-05-20 09:08:03)
> On 2021-05-19 14:06, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-05-19 09:01:02)
> >> On 2021-05-18 14:42, Stephen Boyd wrote:
> >> > Quoting Kuogee Hsieh (2021-05-14 10:35:13)
> >> >> irq_hpd interrupt should be handled after dongle plugged in and
> >> >> before dongle unplugged. Hence irq_hpd interrupt is enabled at
> >> >> the end of the plugin handle and disabled at the beginning of
> >> >> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
> >> >> handled same as the dongle unplugged which tears down the mainlink
> >> >> and disables the phy. This patch fixes this problem by only tearing
> >> >> down the mainlink but keeping phy enabled at irq_hpd with
> >> >> sink_count = 0 handle so that next irq_hpd with sink_count =1 can be
> >> >> handled by setup mainlink only.
> >> >>
> >> >> Changes in v2:
> >> >> -- add ctrl->phy_Power_count
> >> >>
> >> >> Changes in v3:
> >> >> -- del ctrl->phy_Power_count
> >> >> -- add phy_power_off to dp_ctrl_off_link_stream()
> >> >>
> >> >> Changes in v4:
> >> >> -- return immediately if clock disable failed at
> >> >> dp_ctrl_off_link_stream()
> >> >>
> >> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> >
> >> > I think we want some Fixes tag. Not sure what it would be though.
> >> >
> >> > I also noticed that if I plug and unplug the HDMI cable from my apple
> >> > dongle that I see this error message
> >> >
> >> >   [drm:dp_display_usbpd_attention_cb] *ERROR* Disconnected, no
> >> > DP_LINK_STATUS_UPDATED
> >>
> >> > *ERROR* Disconnected, no DP_LINK_STATUS_UPDATED <== this is caused by
> >> > dongle generate the second
> >> irq_hpd with sink_count = 0 after first first irq_hpd with sink_count
> >> =
> >> 0. The fix is you have
> >> set dongle to D3 (power off) state after first irq_pd with sink_count
> >> =display_disable
> >> 0 handled.
> >> I have a patch fix this problem. I will merge and re submit for
> >> review.
> >
> > That's good. I still don't understand how the kthread can't race with
> > irq_hpd and hpd going low though. Userspace will have to disable
> > thectrl_off_link_stream()).
> > display and that could happen far later than the time that the hpd low
> > interrupt fires and is processed. Can't hpd go high during that time
> > and
> > then blip before userspace notices and disables the display?
> >
> > Put another way, putting the dongle into D3 state may make the race
> > window smaller, but it's not fixing the root cause of the problem which
> > is that the kthread is running later and userspace is involved in the
> > state of the dongle while irqs are firing. The three different contexts
> > have to coordinate work, so it feels like a better approach would be to
> > shut off the irq_hpd interrupt once hpd goes low for an unplug in
> > hardirq context so that we don't have to consider the cable state or
> > userspace changing the state after we notify it.
>
> There is no race condition here.
> The interrupts are converted into event and stored at event q.
> event thread service event sequentially and make sure transaction had
> been completed before service next event.
> The first irq_hpd with sink_count = 0 is handled and this transaction
> will not completed until user space frame work turn off display
> (msm_dp_display_disable()).
> After that, the second irq_hpd with sink_count will be service which
> found that display is off so it spill out DP_LINK_STATUS_UPDATED warning
> message and do nothing.
>
> Put dongle to D3 state so that it will not issue the unnecessary second
> irq_hpd with sink_count = 0. this will prevent the annoy but unharmful
> DP_LINK_STATUS_UPDATED warning message.
> Again, we can not disable hpd interrupt since dongle still attached and
> hdmi cable can be plugged in at any instant.
>

Right I'm not suggesting to disable hpd interrupt, just the hpd_irq
interrupt once an unplug irq comes in, and do that in hardirq context.
Also, I'm suggesting that we consider unplug as a higher priority if the
hard irq handler is delayed for some reason and both an unplug irq and
an hpd irq are pending in the hardware when the hard irq handler is
running. Putting the dongle into D3 state won't fix these problems.
