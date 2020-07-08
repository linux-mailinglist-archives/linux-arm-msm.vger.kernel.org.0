Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AE6217C76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 03:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgGHBNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 21:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgGHBNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 21:13:47 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96806C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 18:13:47 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id 64so17329369vsl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 18:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9jiS4KqONWOC5mf3zrCvAZ5bUNYEcdecmpFqJ7RDpoE=;
        b=diGz9A072uzSke+K19POfossW4WSRglikhF9LycKc8CR4PNoz8WaQE5v0QwBE1aucz
         w0WCY4cw/7yXlMhPNh/i0S6Nv6pOlmRsclaHePlUS1T0/13xRIPZlbgdO41pHrw/ao5s
         2WMqeccT14DiuCHrvJ9vql3jEt9lia2Y6lITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9jiS4KqONWOC5mf3zrCvAZ5bUNYEcdecmpFqJ7RDpoE=;
        b=Hdy0/TttUiIT6cgjDhyWsJDH4g4fzqlDUrGlFKP6F0Epjjhuc5WzFkxKOP/Wh2RR/J
         FB8jQT0batQLohoIQMBlItSZg0nhQkRBUMnxOkTz7LRuOcweCow9G76I3bM0Iwj/1b9G
         A/nmnCQeyBHmljtXHHACuuj0v6aV4dqBMttf1YZtRypyb3SI2EQQhuQTRube2YVtDroO
         PTely70GkNyKsZSnL6gBncsKIKWOWzasIrZVS7mjwPqdlW/dQV4hnME1Vgsk50rmnqvn
         mmKwiJNMLb6G8L+cjGzgSHtYlXdG+c2Tun84st5iiHU6lKwPF0t9Qbb1EZjmhGn1F57j
         TrTA==
X-Gm-Message-State: AOAM530QPo6878UdrMWUpyqT6caQNRXVCsHIB5UwmYwVxSZa9psIomB2
        6mS4snIzzJzrlvFaiWhXIN3bSmZe2bo=
X-Google-Smtp-Source: ABdhPJySqv8vQRnhnHUIrJhAFL6pHrQ0wrLrFOKirhUObjulfUHg1m2AeZywVK+g4xuEljZt8xyH+A==
X-Received: by 2002:a67:1844:: with SMTP id 65mr21183032vsy.57.1594170826413;
        Tue, 07 Jul 2020 18:13:46 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id z14sm335850vkd.31.2020.07.07.18.13.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 18:13:45 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id k7so2255264uan.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 18:13:45 -0700 (PDT)
X-Received: by 2002:ab0:2408:: with SMTP id f8mr32068943uan.91.1594170824905;
 Tue, 07 Jul 2020 18:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
 <20200706203805.GS388985@builder.lan> <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
 <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
In-Reply-To: <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Jul 2020 18:13:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WH_SkmbYeF9Bif-sw9=nKGbDg869AVC_wg8S_TH5V_HA@mail.gmail.com>
Message-ID: <CAD=FV=WH_SkmbYeF9Bif-sw9=nKGbDg869AVC_wg8S_TH5V_HA@mail.gmail.com>
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

On Tue, Jul 7, 2020 at 4:03 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 6, 2020 at 9:52 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >
> >
> > []..
> >
> > >>> @@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> > >>>
> > >>>   static int sc7180_pinctrl_probe(struct platform_device *pdev)
> > >>>   {
> > >>> +       if (of_machine_is_compatible("google,lazor")) {
> > >>> +               sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
> > >>> +               sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
> > >>> +       }
> > >>
> > >> As much as I want patches landed and things working, the above just
> > >> doesn't feel like a viable solution.  I guess it could work as a short
> > >> term hack but it's going to become untenable pretty quickly.
> > >
> > > I second that.
> > >
> > >> As we
> > >> have more variants of this we're going to have to just keep piling
> > >> more machines in here, right?  ...this is also already broken for us
> > >> because not all boards will have the "google,lazor" compatible.  From
> > >> the current Chrome OS here are the compatibles for various revs/SKUs
> > >>
> > >> compatible = "google,lazor-rev0", "qcom,sc7180";
> > >> compatible = "google,lazor-rev0-sku0", "qcom,sc7180";
> > >> compatible = "google,lazor", "qcom,sc7180";
> > >> compatible = "google,lazor-sku0", "qcom,sc7180";
> > >> compatible = "google,lazor-rev2", "qcom,sc7180";
> > >>
> > >> ...so of the 5 boards you'll only match one of them.
> > >>
> > >>
> > >> Maybe I'm jumping into a situation again where I'm ignorant since I
> > >> haven't followed all the prior conversation, but is it really that
> > >> hard to just add dual edge support to the PDC irqchip driver?  ...or
> >
> > FWIK, this is really a PDC hardware issue (with the specific IP rev that exists
> > on sc7180) so working it around in SW could get ugly.
>
> Ugh.  I guess it's ugly because the workaround would need to be in the
> PDC driver but to properly do the workaround you need to be able to
> read the state of the pin from the PDC driver?  ...and I guess you
> can't do that with the PDC register space so you'd either need to
> violate a layer or 3 of abstraction and snarf into the GPIO register
> space from the PDC driver or you'd have to provide some sort of API
> access from the PDC back down to the GPIO driver?
>
> --
>
> Actually, though, I'm still not sure why this would need to be in the
> PDC driver.  Sure, you can't just magically re-use the existing
> dual-edge emulation in pinctrl-msm.c, but you can add some new
> dual-edge emulation for when your parent handles your interrupts,
> can't you?  As per usually, I'm talking out of my rear end, but I
> sorta imagine:
>
> 1. At the head of msm_gpio_irq_set_type() if you detect that
> "skip_wake_irqs" is set and you're on an SoC with this hardware errata
> then you do a loop much like the one in
> msm_gpio_update_dual_edge_pos() except that instead of changing the
> polarity with msm_writel_intr_cfg() you change the polarity with
> "irq_chip_set_type_parent()".
>
> 2. At the head of msm_gpio_irq_ack() you make the same function call
> if "skip_wake_irqs" is set and you're on an SoC with this hardware
> errata.
>
> It doesn't feel all that ugly to me, assuming I'm understanding it
> correctly.  ...or maybe you can tell me why it'd be harder than that?

So I REALLY don't know what I'm doing and this is very rough and
probably all sorts of illegal (maybe?), but in the limited testing I
was able to do it seemed to work:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2285815
WIP: proof of concept workaround for PDC wakeup problem

If there's anything worthwhile to steal from that, please feel free
and post your own patch based on it.  :-)

-Doug
