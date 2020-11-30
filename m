Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A089E2C9018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 22:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388534AbgK3VbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 16:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388662AbgK3VbE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 16:31:04 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D4FC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 13:30:23 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id q4so4240463ual.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 13:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQ7YTMSOgNJk6C7RFtbNrsBN7emJhZRffS3U/+z/bcI=;
        b=OfdLooMYThRlS3Q3NaExYX7qtlWtVk0t6l+hSzWbh6ghggWL9W9qlE4XVrNF1x8AiV
         y+JguKA1P5jRm86KlaQFMejQsu9qGvuQ7wwx5TVk0tj2AbEUcJ6HbBFOE8hp1Fy2MPK5
         iVFp7rAJCDfvphXVA9M4fllvxAh72Vgr3RFJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQ7YTMSOgNJk6C7RFtbNrsBN7emJhZRffS3U/+z/bcI=;
        b=sOw5WpFut5ojUZPtTdr4pZW/G6qAp9BIkL3T9wEM7MMxQ0KcrSSGtQMPIORNL40fGg
         AEirrw2Oq3vJ1r6omQ692SefbT6iJKQFrGFYtJC6FJ3mFNJGNf+pWr18OuokxxJN84/i
         gL6HISkmScDTZrleuY8zY/Pmix37cwxqdp471g4gBi17BoLp/ZIk0ztaGE0oVR3V322O
         A/VdwsFbP0b+zsmidsnRZlcPm75e3baIq0K8u4pZGgO4JN4ql3M2g+A+Ik5y868mBCxS
         zhy/0vuXl9W/hs8nhpLKz7QORj8V0VFoClAu4TE7VTk1w51YpVo8xs7KCpRhBVkbhv15
         nx7Q==
X-Gm-Message-State: AOAM5321fnf7QQIagmPdSr8h5ZdrDN4p6Q/mhi/ERluIYXikwAADmi1U
        J6FtumvnHUSpBYlXQ+PQKARnhwWARvBd2A==
X-Google-Smtp-Source: ABdhPJzt7J9FnK9w3QUR16ECTCmUGIvFbhiZ979Og/BJlVoFzsktaGC0GSV8HEdZlc0IVRTJM2hoeQ==
X-Received: by 2002:ab0:39cd:: with SMTP id g13mr19707116uaw.42.1606771822020;
        Mon, 30 Nov 2020 13:30:22 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id s6sm4210742vkk.20.2020.11.30.13.30.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 13:30:21 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id 128so6879819vsw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 13:30:20 -0800 (PST)
X-Received: by 2002:a67:4242:: with SMTP id p63mr18219636vsa.34.1606771820251;
 Mon, 30 Nov 2020 13:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
In-Reply-To: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Nov 2020 13:30:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2i7dfcg2J2a-EO8nBvwHU0AMp79Esoy1Y=H_hNc+jvw@mail.gmail.com>
Message-ID: <CAD=FV=W2i7dfcg2J2a-EO8nBvwHU0AMp79Esoy1Y=H_hNc+jvw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 9:47 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> We have a problem if we use gpio-keys and configure wakeups such that
> we only want one edge to wake us up.  AKA:
>   wakeup-event-action = <EV_ACT_DEASSERTED>;
>   wakeup-source;
>
> Specifically we end up with a phantom interrupt that blocks suspend if
> the line was already high and we want wakeups on rising edges (AKA we
> want the GPIO to go low and then high again before we wake up).  The
> opposite is also problematic.
>
> Specifically, here's what's happening today:
> 1. Normally, gpio-keys configures to look for both edges.  Due to the
>    current workaround introduced in commit c3c0c2e18d94 ("pinctrl:
>    qcom: Handle broken/missing PDC dual edge IRQs on sc7180"), if the
>    line was high we'd configure for falling edges.
> 2. At suspend time, we change to look for rising edges.
> 3. After qcom_pdc_gic_set_type() runs, we get a phantom interrupt.
>
> We can solve this by just clearing the phantom interrupt.
>
> NOTE: it is possible that this could cause problems for a client with
> very specific needs, but there's not much we can do with this
> hardware.  As an example, let's say the interrupt signal is currently
> high and the client is looking for falling edges.  The client now
> changes to look for rising edges.  The client could possibly expect
> that if the line has a short pulse low (and back high) that it would
> always be detected.  Specifically no matter when the pulse happened,
> it should either have tripped the (old) falling edge trigger or the
> (new) rising edge trigger.  We will simply not trip it.  We could
> narrow down the race a bit by polling our parent before changing
> types, but no matter what we do there will still be a period of time
> where we can't tell the difference between a real transition (or more
> than one transition) and the phantom.
>
> Fixes: f55c73aef890 ("irqchip/pdc: Add PDC interrupt controller for QCOM SoCs")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>

NOTE: even though this has Maulik's tags, he has requested [1] that we
should wait before landing while he talks with HW folks.

[1] https://lore.kernel.org/linux-arm-msm/603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org/


-Doug
