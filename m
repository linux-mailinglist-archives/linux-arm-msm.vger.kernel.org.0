Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA16217B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 01:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgGGXDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 19:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGGXDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 19:03:45 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBD2C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 16:03:44 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id o25so16733uar.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 16:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0brjpEwt3LWgIWnZnDwkYUdaWWiwXptJrmC/ZFcX/HQ=;
        b=BqgHANLQsFif0HG55ITqpadVS6fjfIF2CV8dhok0vezrpOEEAmex2bupgTL+ftP6CW
         4n+9IuBOME0XbSyOmYoUwvFRGwLkvbU9IC8rIbNlIdOoKxLek3hL61Dj7ZAot96xzdUF
         K9SHLz6w7+TQ9spWWnMYYb28XBBQO4yFAQwV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0brjpEwt3LWgIWnZnDwkYUdaWWiwXptJrmC/ZFcX/HQ=;
        b=TkZPKnzxIyjl5JN2VOiCZ5qYncY37AR115ovl94FUQVOq35YL4Gy3XyHSUtOuFYZqR
         AVQas5xk0jSlk5RhYavRcYbXah2zXDcL8wRfWR7D789ZuASaYbQptO+g+KhVbJmfUMG5
         nyEfj1HYubG2+2WHS+Y7ReC6nAmSePQOG5/l3zjuhPmFnFKkJbDGzXskuAyjmw7mZNPN
         0rkNheItPz4+YBOTG7U4X9a+E1DIdckDO/RSDY0ffOuw1Ql2dxhtQytj7C/u7Zbidi0t
         bi3pLP78EgEeheD3sO6+IhyJua40tBH7tOpzkkWvb1cJOvWOFyK+xlRT58E7WvfnbkQL
         Yf8A==
X-Gm-Message-State: AOAM532x/pVrhuiFZZN5luRl8n2GyiwDTrH2YsuCm+0HQ8rCFkHJxgRb
        GL5cpzExCPBjwDlqFLbJVYrZE8XR1V4=
X-Google-Smtp-Source: ABdhPJxC9u/OzkLJwwXM1PWyH9MEVdsvvb6NLAXI0BjDyWW89+I+P9EAQtfLhVjIzfDEaNMzwEH9oQ==
X-Received: by 2002:ab0:3083:: with SMTP id h3mr40750813ual.18.1594163022081;
        Tue, 07 Jul 2020 16:03:42 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id t17sm245566vsp.0.2020.07.07.16.03.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 16:03:41 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id x13so18707024vsx.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 16:03:40 -0700 (PDT)
X-Received: by 2002:a67:6546:: with SMTP id z67mr34808529vsb.169.1594163019992;
 Tue, 07 Jul 2020 16:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
 <20200706203805.GS388985@builder.lan> <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
In-Reply-To: <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Jul 2020 16:03:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
Message-ID: <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 6, 2020 at 9:52 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> []..
>
> >>> @@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> >>>
> >>>   static int sc7180_pinctrl_probe(struct platform_device *pdev)
> >>>   {
> >>> +       if (of_machine_is_compatible("google,lazor")) {
> >>> +               sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
> >>> +               sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
> >>> +       }
> >>
> >> As much as I want patches landed and things working, the above just
> >> doesn't feel like a viable solution.  I guess it could work as a short
> >> term hack but it's going to become untenable pretty quickly.
> >
> > I second that.
> >
> >> As we
> >> have more variants of this we're going to have to just keep piling
> >> more machines in here, right?  ...this is also already broken for us
> >> because not all boards will have the "google,lazor" compatible.  From
> >> the current Chrome OS here are the compatibles for various revs/SKUs
> >>
> >> compatible = "google,lazor-rev0", "qcom,sc7180";
> >> compatible = "google,lazor-rev0-sku0", "qcom,sc7180";
> >> compatible = "google,lazor", "qcom,sc7180";
> >> compatible = "google,lazor-sku0", "qcom,sc7180";
> >> compatible = "google,lazor-rev2", "qcom,sc7180";
> >>
> >> ...so of the 5 boards you'll only match one of them.
> >>
> >>
> >> Maybe I'm jumping into a situation again where I'm ignorant since I
> >> haven't followed all the prior conversation, but is it really that
> >> hard to just add dual edge support to the PDC irqchip driver?  ...or
>
> FWIK, this is really a PDC hardware issue (with the specific IP rev that exists
> on sc7180) so working it around in SW could get ugly.

Ugh.  I guess it's ugly because the workaround would need to be in the
PDC driver but to properly do the workaround you need to be able to
read the state of the pin from the PDC driver?  ...and I guess you
can't do that with the PDC register space so you'd either need to
violate a layer or 3 of abstraction and snarf into the GPIO register
space from the PDC driver or you'd have to provide some sort of API
access from the PDC back down to the GPIO driver?

--

Actually, though, I'm still not sure why this would need to be in the
PDC driver.  Sure, you can't just magically re-use the existing
dual-edge emulation in pinctrl-msm.c, but you can add some new
dual-edge emulation for when your parent handles your interrupts,
can't you?  As per usually, I'm talking out of my rear end, but I
sorta imagine:

1. At the head of msm_gpio_irq_set_type() if you detect that
"skip_wake_irqs" is set and you're on an SoC with this hardware errata
then you do a loop much like the one in
msm_gpio_update_dual_edge_pos() except that instead of changing the
polarity with msm_writel_intr_cfg() you change the polarity with
"irq_chip_set_type_parent()".

2. At the head of msm_gpio_irq_ack() you make the same function call
if "skip_wake_irqs" is set and you're on an SoC with this hardware
errata.

It doesn't feel all that ugly to me, assuming I'm understanding it
correctly.  ...or maybe you can tell me why it'd be harder than that?


> >> maybe it's just easier to change the pinctrl driver to emulate dual
> >> edge itself and that can work around the problem in the PDC?  There
> >> seem to be a few samples you could copy from:
> >>
> >> $ git log --oneline --no-merges --grep=emulate drivers/pinctrl/
> >> 3221f40b7631 pinctrl: mediatek: emulate GPIO interrupt on both-edges
> >> 5a92750133ff pinctrl: rockchip: emulate both edge triggered interrupts
> >>
> >
> > pinctrl-msm already supports emulating dual edge, but my understanding
> > was that the problem lies in that somehow this emulation would have to
> > be tied to or affect the PDC driver?
>
> yes, thats correct, pinctrl-msm already supports it, the problem lies
> in the fact that PDC does not. This patch, infact was trying to fix the
> issue by removing all PDC involvement for gpio28 and making pinctrl-msm
> in charge of it.

If we're going to try to do this, I think we're stuck with one of these:

1. A really really long list that we keep jamming more boards into.

2. Add an entry at the top-level device tree compatible to all
affected boards _just_ for this purpose.  Seems ugly since we don't
need it for any other reasons.

3. Add some sort of property to the pinctrl node on these boards.
Seems ugly since conceivably this _could_ be worked around in
software.

I don't really like any of those options, so I'm really hoping we can
find out how to get a workaround in...

-Doug
