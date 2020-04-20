Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0DE1B05A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 11:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgDTJ3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 05:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725775AbgDTJ3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 05:29:44 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313E9C061A41
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 02:29:43 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c17so3329128uae.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+bXbV2G5yAsWPdoik74HL3zT7EvaYkbi6HLAip4kCPE=;
        b=s4jIYNmDSCSre8L1fOBe4BKz3cwsdftChktN5JBQLZjCofDyAxUTDTCrR29bQ8dwx0
         /UULMi3OKQNpg/O5WT4mJDqSI5Hk78M1a6nm2+fLJQyRjBbAfQNz/ioFJ7RxAG8dsQe2
         HOv+Mde3TMlgY4x2WmVmPYgzvk8jN8pKNA7iRczjLE5el78RwB7Xddsct5dPQcj/nz85
         zFiR2pBDqDB1AMP8msDaTcEmMj1fANeYRsk7sP3SyWpg9pD9/cptg1Hx8UJuzgV7ye2f
         j04qjnuf2cPvH1WJr+/Uox3iREXQ9C4W9RHpflU+HXxQUURDtFXPr6Ee3zxVrTGNjEWd
         Z32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+bXbV2G5yAsWPdoik74HL3zT7EvaYkbi6HLAip4kCPE=;
        b=rJ3Z60HVu+2SPULpXn32MAyDbfhb8eAOdgFwCUFdopgEvi/0XVJFvW+qecUG1fioG0
         HWj/e3ibfI9IYY1LvJzbYVptUFhQL310BjiSzNk99GkPKW++fN3LI+C89u74A2MgXUjh
         uZWfA2EIiDyKfIdJsz604gxngcvzFiYuxb8HXYeQWxvM0hLinNyyXexrvqbs5HwBJZ3h
         OYO1jY1m4Vs7bJrWr314P4lQfMFabLOG1N52whdZZyPHL30H+CiOAKSaNVIBkNgyS2Xn
         wq308v1SsYoEkzeHlSjbehEyi20JLrpwykhitx6LhS8fqqLUyvZoSdQR0RFmrob704F3
         ntEg==
X-Gm-Message-State: AGi0PuZcGkuGj4J2ZN2TFOuwBydxqARtt1amQvjWMGR3xMDeKP8QVSw/
        dc1oJJ2FGbQtTW0jxjm9iD6x5QFT7/+XAMuWDq6uTg==
X-Google-Smtp-Source: APiQypJSb26agvtaW3XUoWIUFAipBIghy203mcWakTXMxgBcN3TEPnxo9vAyT3jVrfHgyafMtr1eTIuTVfa92/Owf/U=
X-Received: by 2002:ab0:3343:: with SMTP id h3mr517711uap.19.1587374982046;
 Mon, 20 Apr 2020 02:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
 <CAPDyKFqSJ4h7UvQfQzWmSq9gg97A0MXvdcuXXaY7b-YUHs=V2g@mail.gmail.com>
 <158334039680.7173.16159724456027777605@swboyd.mtv.corp.google.com>
 <CAPDyKFqecH=AsvtN+JMxdk6pY2dntWUrhUWF6LEq_DLCcPe6pw@mail.gmail.com>
 <158463974696.152100.8345578995373250448@swboyd.mtv.corp.google.com>
 <CAPDyKFrL6uWaKK1zkn6ag2ZqW7ro50VGq6DJnTNyoFS2yGMmRw@mail.gmail.com> <158690616084.105027.4255268086188981149@swboyd.mtv.corp.google.com>
In-Reply-To: <158690616084.105027.4255268086188981149@swboyd.mtv.corp.google.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Apr 2020 11:29:06 +0200
Message-ID: <CAPDyKFqw42Vvu1n-MbL+DEr3wsk9bgrRHmOLS=t57A+1P-yLMg@mail.gmail.com>
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Apr 2020 at 01:16, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Ulf Hansson (2020-03-20 03:22:01)
> > On Thu, 19 Mar 2020 at 18:42, Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Ulf Hansson (2020-03-06 02:07:41)
> > > > On Wed, 4 Mar 2020 at 17:46, Stephen Boyd <swboyd@chromium.org> wrote:
> > > > >
> > > > > Quoting Ulf Hansson (2020-03-04 07:34:29)
> > > > > > On Thu, 20 Feb 2020 at 07:45, Shaik Sajida Bhanu <sbhanu@codeaurora.org> wrote:
> > > > > > >
> > > > > > > The existing suspend/resume callbacks of sdhci-msm driver are just
> > > > > > > gating/un-gating the clocks. During suspend cycle more can be done
> > > > > > > like disabling controller, disabling card detection, enabling wake-up events.
> > > > > > >
> > > > > > > So updating the system pm callbacks for performing these extra
> > > > > > > actions besides controlling the clocks.
> > > > > > >
> > > > > > > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > > > ---
> > > [...]
> > > >
> > > > >
> > > > > >
> > > > > > > +
> > > > > > > +       ret = pm_runtime_force_suspend(dev);
> > > > > >
> > > > > > It looks to me that perhaps you could make use of solely
> > > > > > pm_runtime_force_suspend(), then just skip calling
> > > > > > sdhci_suspend|resume_host() altogether. Do you think that could work?
> > > > >
> > > > > Does that do all the things the commit text mentions is desired for
> > > > > system suspend?
> > > >
> > > > No. :-)
> > > >
> > > > But why is system wakeup needed for an eMMC card?
> > > >
> > >
> > > I don't know if system wakeup is needed for an eMMC card. Probably only
> > > if you plug in a card and some daemon wants to wake up and probe the
> > > card for auto-play or something like that? Seems possible so might as
> > > well expose the CD gpio as a wakeup in that case and let userspace
> > > decide if it wants to do that.
> >
> > Right, card detect IRQs could be useful for system wakeups.
> >
> > I assume you are using a GPIO IRQ for that, which is easily managed,
> > as the runtime PM status of the mmc controller is irrelevant when
> > configuring the GPIO IRQ as wakeup.
> >
> > We even have a helper for doing this, mmc_gpio_set_cd_wake().
>
> Right. Maybe mmc_gpio_set_cd_wake() needs to be called from somewhere in
> the sdhci core?

Yes, that seems reasonable.

>
> >
> > >
> > > Is runtime suspended state the same as system suspended state here
> > > though? The commit text seems to imply that only clks are disabled when
> > > it's desirable to disable the entire controller. I'm still fuzzy on how
> > > runtime PM and system PM interact because it seems to have changed since
> > > I looked last a few years ago. If the driver can stay in a runtime
> > > suspended state across system suspend then I'm all for it. That would
> > > save time for system PM transitions.
> >
> > In most cases this should be possible. And so far, for this case, I
> > haven't found a good reason to why it shouldn't work.
> >
> > Although, perhaps we need to improve some of the sdhci's library
> > functions for PM, to better support this.
> >
>
> So does that mean it's all just working then? Nothing to do here except
> make wakeup irqs for CD work?

Well, if it "works " or not, I am not really sure.

My point is, I think most of the things that need to be managed at
system suspend/resume are the same things that need to be managed
during runtime suspend/resume (except wakeups). So, rather than
implementing a whole bunch of system suspend/resume specific things,
why not make use of the runtime suspend/resume callbacks instead.

Kind regards
Uffe
