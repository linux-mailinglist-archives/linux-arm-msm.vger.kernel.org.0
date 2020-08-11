Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13DE2420FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 22:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgHKUGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 16:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgHKUG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 16:06:27 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2C8C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:06:26 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q13so6641423vsn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wMKY1Jw9WxsNwHBaKFMxM1LYgIpjkj5V6Wxr1s+O2Ac=;
        b=HSC9jimHDqj2Rr/YX/+SxiUOCVVW88ynLYyl/lDM7MG18I3Awgye833RnYVBR2kVdS
         gVA9vwie+VlyFLkCq5Nj6iBdlaxk8IblV2OB+2iwJswifSkVCRLUex4q+tLLxNj500tH
         OkAPdLCgDWW08vBQY+uE/41F+6UcAg020bK0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMKY1Jw9WxsNwHBaKFMxM1LYgIpjkj5V6Wxr1s+O2Ac=;
        b=d0I4N2qd/POJr+62CoK9+PhMmFb9p2Tgq/oT/GXzCUKHcj6ItkC8j/5QKILU1aQPWk
         bi5/NIXteTblyaJmkY4wGMAo2F9Ik1wq5jHY+5Tx1U5y53kmSQ9026gT3A1OpnMEnRV2
         qWVI0YA0ISAeFN7pX2AKpNoZwAN1O56hBKER1dhCWJp9FBfP2VuUw3klCEy4olxwCt2u
         oGATn6tz033xP07odV5dAK1g9YW2t/rm7JBoht3auL4Yt8FaG1H+nEHGS+nFGehSKFEE
         HQICh9w7tzwQwsbUCuJbQp+wK0SflZ/izGh+gGycJOKkUYxDUkLtYWcHjeo7OFLqiRYt
         pfZA==
X-Gm-Message-State: AOAM5310eWMMMN+7aKZJo6BLOIxzJ3Vm9tomUfYWq069SHzx9kSYmDZL
        wyOm/8kel/tV6iVqmiKYMQxepWxigC8=
X-Google-Smtp-Source: ABdhPJzXBxnKW1qnsQKn75KGb6Ma96miMdS1ra5xB2z7GUtqEgTZ1M13g2k6I+AxKAoih68ppgO2Pw==
X-Received: by 2002:a67:7f46:: with SMTP id a67mr7907923vsd.169.1597176385257;
        Tue, 11 Aug 2020 13:06:25 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id z4sm7544793vsl.27.2020.08.11.13.06.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:06:24 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id u15so3874022uau.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:06:24 -0700 (PDT)
X-Received: by 2002:ab0:623:: with SMTP id f32mr9988390uaf.121.1597176383647;
 Tue, 11 Aug 2020 13:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-3-git-send-email-mkshah@codeaurora.org> <159717444178.1360974.6520145243224264090@swboyd.mtv.corp.google.com>
In-Reply-To: <159717444178.1360974.6520145243224264090@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 13:06:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W8kG-ffngoSp-aEViRHas0rOVHDo5WH-OcmkEER0itMw@mail.gmail.com>
Message-ID: <CAD=FV=W8kG-ffngoSp-aEViRHas0rOVHDo5WH-OcmkEER0itMw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] pinctrl: qcom: Use return value from irq_set_wake call
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LinusW <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 11, 2020 at 12:34 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Maulik Shah (2020-08-10 04:20:55)
> > msmgpio irqchip is not using return value of irq_set_wake call.
> > Start using it.
>
> Does this work when the irq parent isn't setup in a hierarchy? I seem to
> recall that this was written this way because sometimes
> irq_set_irq_wake() would fail for the summary irq so it was a best
> effort setting of wake on the summary line.
>
> >
> > Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 90edf61..c264561 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -1077,12 +1077,10 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
> >          * when TLMM is powered on. To allow that, enable the GPIO
> >          * summary line to be wakeup capable at GIC.
> >          */
> > -       if (d->parent_data)
> > -               irq_chip_set_wake_parent(d, on);
> > -
> > -       irq_set_irq_wake(pctrl->irq, on);
> > +       if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> > +               return irq_chip_set_wake_parent(d, on);
>
> So this bit is probably fine.
>
> >
> > -       return 0;
> > +       return irq_set_irq_wake(pctrl->irq, on);
>
> But this one is probably not fine.

Interesting.  I wasn't aware of the history and thus assumed this was
a bug.  If Stephen is remembering correctly, please add a comment
saying that we are purposely ignoring the return value in this case.

-Doug
