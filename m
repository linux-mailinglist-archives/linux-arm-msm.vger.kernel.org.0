Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CC118CB7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 11:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgCTKWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 06:22:40 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:47092 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgCTKWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 06:22:39 -0400
Received: by mail-vk1-f195.google.com with SMTP id s139so1554929vka.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2020 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Ahg+K1LklBOYWBRqmStRbuNfs/FmsalbYYMIdthFUE=;
        b=pnQNW5h4aMDIgh8RiTJcOrlLJPuG2Sy9cfcvjMPaQ7UYihYb1g1mZbvAvrxoa+Sbry
         ZzZUm3jwhLJFzwiphhQOkznH3NY+RHCdBWCUmeyw+0NlzARUqQzVr9Ayq+0mVn7AFdIH
         bpj0coq3pT7GieHK2dRjvUKLbWVasGg/BAvmXagNzJNKWni07lFLN0ckVK0ZS/sP3dAr
         sVVky75+pEfM6wgXZS0hfZAWH2SptLcSJhDOPeoPOSZHU8hqDd+An/SiAa48K32BlJ06
         K0TtrIPXZEAWP8bq3MZNQCyKOEVPGAavLqlmB+PRmvNDNDr6FHW/9mS4JN9hLfed0F2a
         qQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Ahg+K1LklBOYWBRqmStRbuNfs/FmsalbYYMIdthFUE=;
        b=B9k/WF395UoILK4S9SDrpwwcIKTg9NoBAgMC0z9rImotq2lKQfktfEfBYDTKd39XzS
         Ej7CsnT5G1kUP/BZq1fpr49okXF/8iLgQMWbJKw0pHigb4khVp12AQZ0jqmWCU0mkTDc
         6VJ1QmKn/hEq+QV8Ib7X2tf7oCXiW1D0ft8xFE5Oehf1Rh1OjLwqkzgJy80jLH/upiTM
         v4yP95uNF1Bn7Uf+M/F+zDq+yn2XsIB3OP4OY2I/U2avbU+bu+VJowkYoqm2JDH4pvmx
         gGzVytsmDNg7+tZjt/9bLuBHOLn+UHPnlcHPYnOLZOe1YhmSpeqWsmkXJDXJd5oP7mg+
         dX2g==
X-Gm-Message-State: ANhLgQ1jtvA7chumRwwluvk0arwH5lDL5nvD8KOBFTBB++bfuZV87ccD
        MwtQq0PjGG3qcUtsMdN20TuxZ0GuEbKOEFa92l94ow==
X-Google-Smtp-Source: ADFU+vu54A/Qz9IrM4XdvkGAJ9wVr6A5ugW7FnZJwnfFEJmJccYTXWgPOZXeS7RZsCmmNsF4/LxwxKerSA7kqUU40r0=
X-Received: by 2002:a1f:7f1d:: with SMTP id o29mr5723265vki.101.1584699757213;
 Fri, 20 Mar 2020 03:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
 <CAPDyKFqSJ4h7UvQfQzWmSq9gg97A0MXvdcuXXaY7b-YUHs=V2g@mail.gmail.com>
 <158334039680.7173.16159724456027777605@swboyd.mtv.corp.google.com>
 <CAPDyKFqecH=AsvtN+JMxdk6pY2dntWUrhUWF6LEq_DLCcPe6pw@mail.gmail.com> <158463974696.152100.8345578995373250448@swboyd.mtv.corp.google.com>
In-Reply-To: <158463974696.152100.8345578995373250448@swboyd.mtv.corp.google.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 20 Mar 2020 11:22:01 +0100
Message-ID: <CAPDyKFrL6uWaKK1zkn6ag2ZqW7ro50VGq6DJnTNyoFS2yGMmRw@mail.gmail.com>
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

On Thu, 19 Mar 2020 at 18:42, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Ulf Hansson (2020-03-06 02:07:41)
> > On Wed, 4 Mar 2020 at 17:46, Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Ulf Hansson (2020-03-04 07:34:29)
> > > > On Thu, 20 Feb 2020 at 07:45, Shaik Sajida Bhanu <sbhanu@codeaurora.org> wrote:
> > > > >
> > > > > The existing suspend/resume callbacks of sdhci-msm driver are just
> > > > > gating/un-gating the clocks. During suspend cycle more can be done
> > > > > like disabling controller, disabling card detection, enabling wake-up events.
> > > > >
> > > > > So updating the system pm callbacks for performing these extra
> > > > > actions besides controlling the clocks.
> > > > >
> > > > > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > ---
> [...]
> >
> > >
> > > >
> > > > > +
> > > > > +       ret = pm_runtime_force_suspend(dev);
> > > >
> > > > It looks to me that perhaps you could make use of solely
> > > > pm_runtime_force_suspend(), then just skip calling
> > > > sdhci_suspend|resume_host() altogether. Do you think that could work?
> > >
> > > Does that do all the things the commit text mentions is desired for
> > > system suspend?
> >
> > No. :-)
> >
> > But why is system wakeup needed for an eMMC card?
> >
>
> I don't know if system wakeup is needed for an eMMC card. Probably only
> if you plug in a card and some daemon wants to wake up and probe the
> card for auto-play or something like that? Seems possible so might as
> well expose the CD gpio as a wakeup in that case and let userspace
> decide if it wants to do that.

Right, card detect IRQs could be useful for system wakeups.

I assume you are using a GPIO IRQ for that, which is easily managed,
as the runtime PM status of the mmc controller is irrelevant when
configuring the GPIO IRQ as wakeup.

We even have a helper for doing this, mmc_gpio_set_cd_wake().

>
> Is runtime suspended state the same as system suspended state here
> though? The commit text seems to imply that only clks are disabled when
> it's desirable to disable the entire controller. I'm still fuzzy on how
> runtime PM and system PM interact because it seems to have changed since
> I looked last a few years ago. If the driver can stay in a runtime
> suspended state across system suspend then I'm all for it. That would
> save time for system PM transitions.

In most cases this should be possible. And so far, for this case, I
haven't found a good reason to why it shouldn't work.

Although, perhaps we need to improve some of the sdhci's library
functions for PM, to better support this.

Kind regards
Uffe
