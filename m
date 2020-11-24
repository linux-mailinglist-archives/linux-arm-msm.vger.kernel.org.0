Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC7B2C2DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389898AbgKXRB6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKXRB6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:01:58 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84595C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:01:58 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id f7so11452350vsh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2wb1JgcU2epWYb7iN5+zCGTz6bLzovtrxzJoMWboNp4=;
        b=JJsfMe7GQA2lWJ0cihNe47ChOBzthFMJbdQ/5Jdt/2W2oowgdw3noFz6OOeW7f9PBA
         4lfBZxE6+7Ac9/BlN0h/LGcgBBV0nq9NHDAifj01wsEZJM3OZlHKkg01el7x1d6bf1ut
         NzyX8qSUtdgM0DsGslTetF7Lwf//NH68JDbE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2wb1JgcU2epWYb7iN5+zCGTz6bLzovtrxzJoMWboNp4=;
        b=sQz1NkNmn2Ekuimd508y3WoAa66Fo4DgrhPtA0n2yGTuJF0EHbZQncCsRaJ1dpF2EF
         xv6/KLqLuIg/157r9oEMuFZfJKZtKX6n3zpAZvyBck47r7jsCqIMUe/D02yfu0io5d3B
         sj+hO6UCogp8Zs/vdByTb1LCOe+ELO9zVHMOWf4vRmZ5Uui7Xj1pLW93K7KK+vkpY+DF
         l3xsiSSRJY1NpgiPmCuIZcsNnI7iOD2c1ujR2HMjdihVzoc67nmPw9NPzGLkVYPvWoN0
         +LyOQpDPYSPvnfJHip2BUcqVRCERhEdwTUdEcEJwytau6B/4eyqNjlW/lPJEqyskLbPI
         5v/w==
X-Gm-Message-State: AOAM531fmPz6V8t/MhwA+Y4UJm3SknKBMq2xrv+tsq2dyMoE2Br5Bw7r
        wccWGBUonKgH9cvh8qBrCAfp55D61LV+lA==
X-Google-Smtp-Source: ABdhPJyrsjY00cN4V8n/3An6ZY27FN0Xzog0TdSQPdWcMIAtkHMYjDJRQudAclcwthoYvJ4rpPRXSw==
X-Received: by 2002:a67:3095:: with SMTP id w143mr4624732vsw.35.1606237317817;
        Tue, 24 Nov 2020 09:01:57 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id r139sm1725103vkd.47.2020.11.24.09.01.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:01:57 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id s135so4918569vkh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:01:57 -0800 (PST)
X-Received: by 2002:a1f:1b92:: with SMTP id b140mr4748486vkb.7.1606237316598;
 Tue, 24 Nov 2020 09:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <d65e2be33a218751e7be3342e490e076@kernel.org>
In-Reply-To: <d65e2be33a218751e7be3342e490e076@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:01:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wg-gdry1a-LjJhuKgHRr=DXq4Hu0P8nJGAzf5viEcthA@mail.gmail.com>
Message-ID: <CAD=FV=Wg-gdry1a-LjJhuKgHRr=DXq4Hu0P8nJGAzf5viEcthA@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 1:00 AM Marc Zyngier <maz@kernel.org> wrote:
>
> > @@ -187,9 +189,24 @@ static int qcom_pdc_gic_set_type(struct irq_data
> > *d, unsigned int type)
> >               return -EINVAL;
> >       }
> >
> > +     old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
> >       pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
> >
> > -     return irq_chip_set_type_parent(d, type);
> > +     ret = irq_chip_set_type_parent(d, type);
> > +
> > +     /*
> > +      * When we change types the PDC can give a phantom interrupt.
> > +      * Clear it.  Specifically the phantom shows up if a line is already
> > +      * high and we change to rising or if a line is already low and we
> > +      * change to falling but let's be consistent and clear it always.
> > +      *
> > +      * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
> > +      * interrupt will be cleared before the rest of the system sees it.
> > +      */
> > +     if (old_pdc_type != pdc_type)
> > +             irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
>
> nit: s/0/false/.

I'll fix this.


> You could also make it conditional on the parent side having been
> successful.

Good idea.


> And while we're looking at this: do you need to rollback the PDC state
> if the GIC side has failed? It's all very hypothetical, but just in
> case...

I'm going to go ahead and say "no", but I'll make this change if you
insist.  Specifically:

* We're still leaving things in a self-consistent state if we fail to
clear the parent, we'll just get a spurious interrupt.  It won't cause
any crashes / hangs / whatever.

* Since it seems very unlikely we'd ever trip this and if we ever do
it's not the end of the world, I'd rather not add extra code.

Hopefully that's OK.

-Doug
