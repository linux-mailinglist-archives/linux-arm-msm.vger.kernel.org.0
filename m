Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5E82CE067
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 22:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgLCVMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 16:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgLCVMR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 16:12:17 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D10C061A4F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 13:11:31 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id b62so3174883otc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 13:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9FfLi8Nl7FF4traG898yrie9ssHxyCW2fqoUTn0pwI=;
        b=HD8E+QIOXUbv5qxbihazg3iQqaBW4ARO8iibzqKW/locEieSrh6fFZxam81Rd21TVA
         6vii6LoQG8DDaDQVasrDD3sg4epdc7bJ12hTQMktaajIlNo/+W/pdDw6CL5FN7nNhXMI
         NHWHMhVR+ZUrXeeOiAme3OlvBBOWRJbmI0yyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9FfLi8Nl7FF4traG898yrie9ssHxyCW2fqoUTn0pwI=;
        b=SXaVXN4qdvZwgY+y9ONP6M553yL9CF5YYJEwMcOiaohNdkvk9i5LTPcc4fh02gbd7F
         H9q3mhQD4WCsKzzC3Uq4lT7SrltyaFrTOjX9AtAjHhsHZTFAPbz71TUY3xs3iUBWX8Gx
         8O5A5543wjzjuaGUo+nDN4c9xtiu/oZw2thMwIfB1DGB9zRVcD72/f6jDOPWJLOiIfCJ
         GxyRgwiW923zJr1YPGL3nnbdnQPODJ47+ndEiErYsnvx8EOrd857MC9pbJv2mt0MY13K
         l7fqiFq5CQaGywykX84tCKXiA+XIZ4L/oR4dTMHKpSl2+dRVogP0Z3F2XdXF91YP7jHN
         +5cw==
X-Gm-Message-State: AOAM532jD8UAGRHObiGtrc7aD2pUMGgOacy+FkYhj3ZYEamaQfKb0IMk
        wdEeHG8MwHKL3u3tAeFTQCv+uXmdGK2neQ==
X-Google-Smtp-Source: ABdhPJxjUfP2oMEzSvSs15R274L+/0pPRKIjxbnbFBuYTCfvT8K7d9JxneHzZKPRFlHgG9U6IzpUsw==
X-Received: by 2002:a9d:62cb:: with SMTP id z11mr960184otk.191.1607029890410;
        Thu, 03 Dec 2020 13:11:30 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id l132sm131393oia.23.2020.12.03.13.11.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 13:11:30 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id z24so3169683oto.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 13:11:30 -0800 (PST)
X-Received: by 2002:ab0:6285:: with SMTP id z5mr964298uao.0.1607029473177;
 Thu, 03 Dec 2020 13:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org> <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
 <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org>
In-Reply-To: <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Dec 2020 13:04:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
Message-ID: <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 3, 2020 at 3:22 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> >>> +     /*
> >>> +      * Clear IRQs if switching to/from GPIO mode since muxing to/from
> >>> +      * the GPIO path can cause phantom edges.
> >>> +      */
> >>> +     old_i = (oldval & mask) >> g->mux_bit;
> >>> +     if (old_i != i &&
> >>> +         (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
> >>> +             msm_pinctrl_clear_pending_irq(pctrl, group, irq);
> >>> +
> >> The phantom irq can come when switching to GPIO irq mode. so may be only
> >> check if (i == pctrl->soc->gpio_func) {
> > Have you tested this experimentally?
> Yes

Yes means that you tried switching away from GPIO mode and you
couldn't get a phantom interrupt?  OK, I'll re-test then.

I'll test on the Chrome OS kernel tree since that's easiest for me,
but I can test on mainline if you think it would make a difference...

1. Pick <https://crrev.com/c/2556012> and put that kernel on the device.

2. In Cr50 console, make the WP line low with:
  wp enable

3. In AP console do:
  echo bogus > /sys/module/gpio_keys/parameters/doug_test

4. See bogus interrupt:

localhost ~ # echo bogus > /sys/module/gpio_keys/parameters/doug_test
[   62.006346] DOUG: selecting state bogus
[   62.011813] DOUG: ret 0
[   62.011875] DOUG: in dual edge parent: hwirq=66, type=1
[   62.020300] DOUG: gpio_keys_gpio_isr

Can you try replicating again?


> > I have experimentally tested this and I can actually see an interrupt
> > generated when I _leave_ GPIO as well as when I enter GPIO mode.  If
> > you can't see this I can re-setup my test, but this was one of those
> > things that convinced me that the _transition_ is what was causing the
> > fake interrupt.
> >
> > I think my test CL <https://crrev.com/c/2556012/> can help you with
> > testing if you wish.
> >
> >
> >> even better if you can clear this unconditionally.
> > Why?  It should only matter if we're going to/from GPIO mode.
>
> Probably i was not clear, the phantom irq should be cleared when
> switching gpio to gpio IRQ mode.
>
> When GPIO was used as Rx line in example QUP/UART use case, it can latch
> the phantom IRQ

This is where I disagree with you.  I don't think the interrupt is
latching while it's used as an Rx line.  I think it's the pinmux
change that introduces an phantom interrupt.

Specifically, with the same test patch above, AKA
<https://crrev.com/c/2556012>, I can do this:

1. On AP:
  echo bogus > /sys/module/gpio_keys/parameters/doug_test

2. On Cr50 console:
  wp disable
  wp enable
  wp disable
  wp enable
  wp disable
  wp enable

3. Go back and check the AP and see that no interrupts fired.

Said another way: when we're muxed away the interrupts aren't getting
latched.  It's the act of changing the mux that causes the phantom
interrupts.


> but as long as its IRQ is in disabled/masked state it
> doesn't matter.

...but there's no requirement that someone would need to disable/mask
an interrupt while switching the muxing, is there?  So it does matter.


> its only when the GPIO is again set to IRQ mode with set_mux callback,
> the phantom IRQ needs clear to start as clean.
>
> So we should check only for if (i == pctrl->soc->gpio_func) then clear
> phantom IRQ.
>
> The same is case with .direction_output callback, when GPIO is used as
> output say as clock, need not clear any phantom IRQ,
>
> The reason is with every pulse of clock it can latch as pending IRQ in
> GIC_ISPEND as long as it stay as output mode/clock.
>
> its only when switching back GPIO from output direction to input & IRQ
> function, need to clear the phantom IRQ.
>
> so we do not require clear phantom irq in .direction_output callback.

I think all the above explanation is with the model that the interrupt
detection logic is still happening even when muxed away.  I don't
believe that's true.  Please run my test patch or code up something
similar yourself.


> >> In step (3) msm_gpio_irq_set_type() touches the RAW_STATUS_EN making the
> >> phantom irq pending again.
> >> To resolve this, you will need to invoke msm_pinctrl_clear_pending_irq()
> >> at the end of the msm_gpio_irq_set_type().
> >>
> >> I would like Rajendra's (already in cc) review as well on above part.
> > Ugh, so we need a clear in yet another place.  Joy.  OK, I will wait
> > for Rajendra's comment but I can add similar code in
> > msm_gpio_irq_enable().
>
> As the clearing phantom irq code in msm_gpio_irq_enable() is moved to
> separate function msm_pinctrl_clear_pending_irq(), it needs invoke from
> at the end of msm_gpio_irq_set_type() too.

Seems reasonable to me.  I'll include this in my next spin.  Still
waiting for us to agree on some of the points above before spinning,
though.

-Doug
