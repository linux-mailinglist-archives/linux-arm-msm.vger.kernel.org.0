Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4531D23D2EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 22:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgHEUY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 16:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgHEUYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 16:24:23 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4732CC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 13:24:22 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id a1so1480172vsp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eGIzllpKy7pmL77GIeeTzGsGYJ+dTs44d8O/o9vZBIo=;
        b=GjXblg6wANewrQs2G+Jb7rtJ/87rIf8S4cmep5ejqnrLneLPosXeG6dNoMPmz8+9bY
         0o2TCoyabPkEQxOkh3ryub0HzaaX1k1acPAMvjWuytvW8l4OpDiAx3vYbFwHf5YLQ86p
         HA5pEjm8pCpn7CSIyIkDZVuSTMuy7jAGMCkgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eGIzllpKy7pmL77GIeeTzGsGYJ+dTs44d8O/o9vZBIo=;
        b=P/qZfXvKzRPzKuVxEwWVFWZ6915NYOtg1Qae01t3CAxzr5/tDLatnsUOnzgqhzKv6Q
         1UH4ysYEOQioLzQzxp+4prHVvvtjDZINyMD1PzPjN6rIKpFhjBYXWndMr3Ji9Js+zMlh
         IFj8va+r86wHPsaxsDCfysYnsxfO9pfi33j8iMSkC8Zb/aJUb9TUsJczB4DjPmSbVFD6
         QfYcjmbuMKx33ewj8VkhA0g5rmciu3JLmTv42+E/dDFc/uGXFi1HJJRHrz2Fz0EDy/3z
         7eeNoeXbpxHnHKY7YPsI9UWb/50uVF6iKwQqijwiaeB81kCocCkSaoAt0hFcmwgwlzwz
         +VcQ==
X-Gm-Message-State: AOAM530Nqrsf4rXRpetRT66LNmk7Flsb3zmXdRTxJcPelVcsGpqQ+tk8
        2W6mGYVgOIR1NW4jQ794neXRDf9e6Ho=
X-Google-Smtp-Source: ABdhPJxqp58m5ySnBQIf4OBzvMsyuneJY9Ubwqhi4qUjAKJcp8StI+dDCdrKo27QyN/QakVg2asO6w==
X-Received: by 2002:a67:b342:: with SMTP id b2mr3684582vsm.224.1596659060464;
        Wed, 05 Aug 2020 13:24:20 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id y6sm604426vke.35.2020.08.05.13.24.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 13:24:19 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id p27so9906397uaa.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 13:24:19 -0700 (PDT)
X-Received: by 2002:a9f:2966:: with SMTP id t93mr3783359uat.90.1596659058476;
 Wed, 05 Aug 2020 13:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid>
 <159664899840.1360974.7548807728313161626@swboyd.mtv.corp.google.com>
In-Reply-To: <159664899840.1360974.7548807728313161626@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Aug 2020 13:24:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK+xHV6qsr2AsPB=BzmzN77AT-du8G2tt1QZMQUpGgKg@mail.gmail.com>
Message-ID: <CAD=FV=UK+xHV6qsr2AsPB=BzmzN77AT-du8G2tt1QZMQUpGgKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: aoss: Don't wait for IRQ if we might be in
 suspend/resume noirq
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 5, 2020 at 10:36 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-08-05 09:16:10)
> > Running suspend/resume tests on a sc7180-based board with a modem I
> > found that both system suspend and system resume would hang for 1
> > second.  These messages indicate where:
> >
> >   genpd genpd:0:4080000.remoteproc: calling genpd_suspend_noirq+0x0/0x2c @ 18659, parent: none
> >   genpd genpd:0:4080000.remoteproc: genpd_suspend_noirq+0x0/0x2c returned 0 after 987917 usecs
> >
> > Adding a printout, I found that we were working with the power domain
> > where "res->pd.name" was "modem".
> >
> > I found that we were hanging on the wait_event_interruptible_timeout()
> > call in qmp_send().  Specifically we'd wait for the whole 1 second
> > timeout to hit, then we'd notice that our condition was true and would
> > continue on our merry way.  Sure enough, I could confirm that
> > wait_event_interruptible_timeout() was returning "1" which indicates
> > that the condition evaluated to true and we also timed out.
> >
> > Dumping the stack at the time of the failure made the problem clear.
> > Specifically the stack looked like:
> >    qmp_send+0x1cc/0x210
> >    qmp_pd_power_toggle+0x90/0xb8
> >    qmp_pd_power_off+0x20/0x2c
> >    genpd_sync_power_off+0x80/0x12c
> >    genpd_finish_suspend+0xd8/0x108
> >    genpd_suspend_noirq+0x20/0x2c
> >    dpm_run_callback+0xe0/0x1d4
> >    __device_suspend_noirq+0xfc/0x200
> >    dpm_suspend_noirq+0x174/0x3bc
> >    suspend_devices_and_enter+0x198/0x8a0
> >    pm_suspend+0x550/0x6f4
> > As you can see we're running from the "noirq" callback.  Looking at
> > what was supposed to wake us up, it was qmp_intr() (our IRQ handler).
> > Doh!

As per is typical for me, I'm poking around in code that I have very
little context in.  :-P  If something I'm saying seems wrong, feel
free to correct.


> Why is the genpd being powered off at all? It looks like the driver is
> written in a way that it doesn't expect this to happen. See where
> adsp_pds_disable() is called from. Looks like the remoteproc "stop"
> callback should be called or the driver should be detached.
>
> It sort of looks like the genpd is expected to be at the max level all
> the time (it sets INT_MAX in adsp_pds_enable(), cool).

In general in Linux there are some things that, at suspend time, get
done behind a driver's back.  The regulator API, for instance, allows
for regulators to be turned off in suspend even if a driver leaves
them on.  Sure, it's good practice for a driver to be explicit but the
regulator suspend states do allow for the more heavy-handed approach.

I guess I assume that genpd is a bit similar.  If a driver leaves a
genpd on all the time then it will still be turned off at suspend time
and then turned back on at resume time.  It seems like it must be part
of the genpd API.  Specifically genpd_sync_power_off() says: "Check if
the given PM domain can be powered off (during system suspend or
hibernation) and do that if so."  That makes it seem like it's how
genpd works.

Reading all the descriptions of things like GENPD_FLAG_ALWAYS_ON,
GENPD_FLAG_ACTIVE_WAKEUP, GENPD_FLAG_RPM_ALWAYS_ON makes me even more
convinced that it's normal (unless otherwise specified) for genpds to
get turned off in suspend even if a driver just blindly left them on.

Presumably if this "modem" genpd is supposed to stay on in suspend
time it should have been marked "always on"?  I'd guess we'd need to
add "GENPD_FLAG_ALWAYS_ON" in some (or all?) cases in qmp_pd_add() if
this was true?


> Maybe we need to
> add some sort of suspend hooks to the remote proc driver instead? Where
> those suspend hooks are called earlier and drop the genpd performance
> state request but otherwise leave it enabled across suspend?

I think you're saying:

a) You think it's a bug today that the "modem" genpd is being powered
off in suspend.  Any evidence to back this up?

b) Assuming it's a bug today, we should mark the "modem" as
GENPD_FLAG_ALWAYS_ON.

c) If there are genpds that sometimes should be left on in suspend but
sometimes not (and that doesn't match up with what
GENPD_FLAG_ACTIVE_WAKEUP does), then we'd have to pass
GENPD_FLAG_ALWAYS_ON as a flag and then add suspend hooks to make the
decision for us.

Did I understand that correctly?

...or are you suggesting that we work around the fact that
qmp_pd_power_off() can't be called at "noirq" time by forcing it to
suspend earlier?

...or am I just totally confused and you meant something else?


> I know this isn't clearing the land mine that is calling this code from
> noirq phase of suspend, but I'm just looking at the driver and thinking
> that it never expected to be called from this phase of suspend to begin
> with.

You're saying that qmp_pd_power_off() wasn't expecting to be called
from the noirq phase of suspend?  Sure, I guess not given the bug.
...but once we fix the bug, it works fine, doesn't it?  ...and it
appears that it's part of the genpd API to be able to be called from
the noirq phase.  To me that means that, even if we were supposed to
be keeping this particular PD on during suspend we should take my
patch.


So the summary is: I still think my patch is correct, but I could
certainly still be convinced otherwise.

-Doug
