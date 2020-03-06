Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB5917B9DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 11:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgCFKIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 05:08:20 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38077 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgCFKIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 05:08:20 -0500
Received: by mail-ua1-f66.google.com with SMTP id y3so491487uaq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 02:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uNKCod9HWXu3nxzrNq2A6yL231Mu94A886+59BwdSMs=;
        b=nEcPiVzXVIU3Kib52ncsdTxiBqwhamhygdS+O38NTLUeFv61aJ1sn68iVJc6k7JB7r
         o/j/pLXeg7SUehGbmsn/QpATLwr7LQLZHvZApBZRExxELPQt213sRW113dkv9Il0TbzN
         ymGZ/uZahmlGI2HkF99JYMa5ZWivoDErDZL+qUPAeu9fb6lEsWWejI5H2DoH1SvahW8D
         KVsWYpzheANfyigtJZ8q6TipmSY1e30WUruYvr3nRpgkGAKSYDPF4JeR3QLQ1UjITByX
         QTyh6GXV7tFacA2/ugy49rkZl8Ute2lZfcgMiqmbpl1lmSPwNRJXlr3Jk+Zce1xc/4Fa
         jzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uNKCod9HWXu3nxzrNq2A6yL231Mu94A886+59BwdSMs=;
        b=eDJV7r+TF+mmHAIpZtA6EFTsQYqFJLGOPLBPUNw5st2773Bx3ugvHFxH+5jo7tV2em
         WNC4aU/APa4wIChonbvYMIdWQ9mJmOeeZC8/w1+w/TjYF0jFZXnC3xv4O3RLnv+XYcLG
         nDm1wGxg+cM6MyMqX/QEJkS2rBDeCh7uoNbiIH+2uDwJFudgB1lpODZEmYcuCuprSuHd
         HVyXRVLhRTv0lX+eqAqR6l9QA9Z53CeD4XWkD60m4e4gmHgPeCGGCUHGjILOOL/G+w01
         N5hmHQgeuH2CdjbYsHEvOd73n8ZWZxw25m+/rvXYCCZuODrhUpaiSYLgjiV7QKTT1igv
         YAtA==
X-Gm-Message-State: ANhLgQ2k7fCzEN1ditbuFBaVzflO3tvfUA7WETCSJZx97R0rmngtHDod
        w7+sm6YjXJYg0gNrKGEBQjeMOSkV024UpTTPsMNiEw==
X-Google-Smtp-Source: ADFU+vsPFcu0IamYO7zcUHclxL6+QOvOPAC3udRj76VGvSDRr2MgjVWcGiwDFu6MaHE/Uqw+4BybbwlP2HJccNuaWOc=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr1248889uaq.100.1583489298936;
 Fri, 06 Mar 2020 02:08:18 -0800 (PST)
MIME-Version: 1.0
References: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
 <CAPDyKFqSJ4h7UvQfQzWmSq9gg97A0MXvdcuXXaY7b-YUHs=V2g@mail.gmail.com> <158334039680.7173.16159724456027777605@swboyd.mtv.corp.google.com>
In-Reply-To: <158334039680.7173.16159724456027777605@swboyd.mtv.corp.google.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 6 Mar 2020 11:07:41 +0100
Message-ID: <CAPDyKFqecH=AsvtN+JMxdk6pY2dntWUrhUWF6LEq_DLCcPe6pw@mail.gmail.com>
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver
To:     Stephen Boyd <swboyd@chromium.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
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

On Wed, 4 Mar 2020 at 17:46, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Ulf Hansson (2020-03-04 07:34:29)
> > On Thu, 20 Feb 2020 at 07:45, Shaik Sajida Bhanu <sbhanu@codeaurora.org> wrote:
> > >
> > > The existing suspend/resume callbacks of sdhci-msm driver are just
> > > gating/un-gating the clocks. During suspend cycle more can be done
> > > like disabling controller, disabling card detection, enabling wake-up events.
> > >
> > > So updating the system pm callbacks for performing these extra
> > > actions besides controlling the clocks.
> > >
> > > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > > Changes since V3:
> > >     Invoking sdhci & cqhci resume if sdhci_host_suspend fails.
> > >     Removed condition check before invoking cqhci_resume since its a dummy function.
> > >
> > > Changes since V2:
> > >     Removed disabling/enabling pwr-irq from system pm ops.
> > >
> > > Changes since V1:
> > >     Invoking pm_runtime_force_suspend/resume instead of
> > >     sdhci_msm_runtime_suepend/resume.
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index 3955fa5d..3559b50 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -2159,9 +2159,52 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
> [...]
> > > +
> > > +       ret = sdhci_suspend_host(host);
> > > +       if (ret)
> > > +               goto resume_cqhci;
> >
> > sdhci_suspend_host() can't be called on a device that has been runtime
> > suspended, as that would lead to accessing device registers when
> > clocks/PM domains are gated.
> >
> > Depending on how the corresponding cqhci device is managed from a
> > runtime PM point of view, it could also be problematic to call
> > cqhci_suspend().
>
> There seems to be another patch floating around here[1] that is an
> attempt at a fix to this patch. They should probably be combined so that
> it's not confusing what's going on.

Yeah, it would be easier if these are discussed together.

>
> >
> > > +
> > > +       ret = pm_runtime_force_suspend(dev);
> >
> > It looks to me that perhaps you could make use of solely
> > pm_runtime_force_suspend(), then just skip calling
> > sdhci_suspend|resume_host() altogether. Do you think that could work?
>
> Does that do all the things the commit text mentions is desired for
> system suspend?

No. :-)

But why is system wakeup needed for an eMMC card?

>
> > > like disabling controller, disabling card detection, enabling wake-up events.
>
> [1] https://lore.kernel.org/linux-arm-msm/1583322863-21790-1-git-send-email-vbadigan@codeaurora.org/

Kind regards
Uffe
