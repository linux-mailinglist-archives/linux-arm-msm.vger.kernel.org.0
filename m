Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1863E261BA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731355AbgIHTGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 15:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgIHTFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 15:05:51 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD631C061573
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 12:05:35 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id u14so91141uaq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=11UezPkShRZ1XbTMFLAIvgFJ6S7F6Qj5hmTERAqAcf0=;
        b=AEymAD0aEUUcB63HmREI5LL3aPUIdQW8ooUB2Efwl6Hq2GHsbZMN2synFWhVWmMwJa
         FgxW9xAqeVKYQ8JsT9hPGY3MQQq6G9q6bmsLIpT+YUp2YO5IaRBQT2Q8AeGbQbcoGyir
         y4VAHqKYOzaA5NnqkCFbAMNU89unydaEBQxRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=11UezPkShRZ1XbTMFLAIvgFJ6S7F6Qj5hmTERAqAcf0=;
        b=JVLxOHBuaRkiSf8CCyoxfmFbG/tirjWOgCf4WZljDyrD1FtXdlCUKtrJyD6vMONSdb
         4wWTcC9GFDScIBHMmHVatqravaN4SnTw23fUYOauBJM/Ti1rAdlt6azkrWvtFn5OVxcz
         O1tonr3hjPKTNErA372sP/8BGTHKIHhJ7atZ/enAhvi4cD2TFfm7hJFfbmU6HsNxA8D4
         wIzOKOHTIHu5trPeiM+LCzHEQ3c8UXYXT3n9WDE6b6DlG9YSmxexfFQ+0dbf+Ftnysx8
         +TgeKX8xrsOfXGtCQmdyseba8sf4Z4rJcnWOLpXAdSr41/W58dEZ0q5wZrP97R9pU1+h
         gqnw==
X-Gm-Message-State: AOAM532U4JFLeRrTbbhZAZMbtCXZLtJuwxPLhsxebDoHhOX5kJtcsCU/
        uiHqEMO8hEKSZeIYLcT22nJYoAAJbS24Cw==
X-Google-Smtp-Source: ABdhPJwMMnSbVycp3rp7Xv2QaiF5eFKK31fvRypbTMftQb0gdXEGVg22jgkZ+2H4jMCrodIngyD/XA==
X-Received: by 2002:ab0:60d7:: with SMTP id g23mr394505uam.122.1599591935066;
        Tue, 08 Sep 2020 12:05:35 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id s70sm29751vss.9.2020.09.08.12.05.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 12:05:34 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id s62so9609114vsc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 12:05:34 -0700 (PDT)
X-Received: by 2002:a67:d907:: with SMTP id t7mr423806vsj.8.1599591934367;
 Tue, 08 Sep 2020 12:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
 <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
 <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org>
 <87y2m1vhkm.fsf@nanos.tec.linutronix.de> <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com>
 <877dtdj042.fsf@nanos.tec.linutronix.de> <CAD=FV=Ua7fLGw6JiG1rnCKpAdO1nXX4A4x1Why-LE9L_FBFe8Q@mail.gmail.com>
 <87zh67uife.fsf@nanos.tec.linutronix.de> <CAD=FV=U8vchyRXOjozYYroq3Mit_gt=XXADLfn0W4N4TyQzyjQ@mail.gmail.com>
 <87pn7150li.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87pn7150li.fsf@nanos.tec.linutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 8 Sep 2020 12:05:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0wjOYC9u1y=fhDTVSW+jd5G8ydSYJEE-a8BTfnhRgTA@mail.gmail.com>
Message-ID: <CAD=FV=X0wjOYC9u1y=fhDTVSW+jd5G8ydSYJEE-a8BTfnhRgTA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LinusW <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 4, 2020 at 2:54 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Doug,
>
> On Thu, Sep 03 2020 at 16:19, Doug Anderson wrote:
> > On Thu, Sep 3, 2020 at 5:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>    That pending interrupt will not prevent the machine from going into
> >>    suspend and if it's an edge interrupt then an unmask in
> >>    suspend_device_irq() won't help. Edge interrupts are not resent in
> >>    hardware. They are fire and forget from the POV of the device
> >>    hardware.
> >
> > Ah, interesting.  I didn't think about this case exactly.  I might
> > have a fix for it anyway.  At some point in time I was thinking that
> > the world could be solved by relying on lazily-disabled interrupts and
> > I wrote up a patch to make sure that they woke things up.  If you're
> > willing to check out our gerrit you can look at:
> >
> > https://crrev.com/c/2314693
> >
> > ...if not I can post it as a RFC for you.
>
> I actually tried despite my usual aversion against web
> interfaces. Aversion confirmed :)
>
> You could have included the 5 lines of patch into your reply to spare me
> the experience. :)

Sorry!  :(  Inline patches are a bit of a pain for me since I'm
certifiably insane and use the gmail web interface for kernel mailing
lists.  Everyone has their pet aversions, I guess.  ;-)


> > I'm sure I've solved the problem in a completely incorrect and broken
> > way, but hopefully the idea makes sense.  In discussion we decided not
> > to go this way because it looked like IRQ clients could request an IRQ
> > with IRQ_DISABLE_UNLAZY and then that'd break us.  :( ...but even so I
> > think the patch is roughly right and would address your point #1.
>
> Kinda :) But that's still incomplete because it does not handle the case
> where the interrupt arrives between disable_irq() and enable_irq_wake().
> See below.

Huh, I thought I'd handled this with the code in irq_set_irq_wake()
which checked if it was pending and did a wakeup.  In any case, I
trust your understanding of this code far better than I trust mine.
How should we proceed then?  Do you want to post up an official patch?

At the moment I don't have any test cases that need your patch since
the interrupts I'm dealing with are not lazily disabled.  However, I
still do agree that it's the right thing to do.


> >> 2) irq chip has a irq_disable() callback or has IRQ_DISABLE_UNLAZY set
> >>
> >>    In that case disable_irq() will mask it at the hardware level and it
> >>    stays that way until enable_irq() is invoked.
> >>
> >> #1 kinda works and the gap is reasonably trivial to fix in
> >>    suspend_device_irq() by checking the pending state and telling the PM
> >>    core that there is a wakeup pending.
> >>
> >> #2 Needs an indication from the chip flags that an interrupt which is
> >>    masked has to be unmasked when it is a enabled wakeup source.
> >>
> >> I assume your problem is #2, right? If it's #1 then UNMASK_IF_WAKEUP is
> >> the wrong answer.
> >
> > Right, the problem is #2.  We're not in the lazy mode.
>
> Right and that's where we want the new chip flag with the unmask if
> armed.

OK, so we're back in Maulik's court to spin, right?  I think the last
word before our tangent was at:

http://lore.kernel.org/r/87y2m1vhkm.fsf@nanos.tec.linutronix.de

There you were leaning towards #2 ("a new function
disable_wakeup_irq_for_suspend()").  Presumably you'd now be
suggesting #1 ("Do the symmetric thing") since I've pointed out the
bunch of drivers that would need to change.


-Doug
