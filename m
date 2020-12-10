Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A302D69A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393920AbgLJVU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390489AbgLJVU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:20:57 -0500
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2724DC061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:20:17 -0800 (PST)
Received: by mail-vs1-xe44.google.com with SMTP id j140so3666945vsd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RZsPNOAvTFnun1hxdUG5olOnkQwo5sBEF+e1/v4quww=;
        b=jYty1q9fAhXqrLY26mhEm9pkJfzO5JwKzM4fje3wkEZwQtCclijrvoubG9bJzThLyF
         YZbyHMEwiMIkWkfRGCOpVfFKbvktQMEOtYm3TprWZo8bGaYo6Q49c17SMZ1C9h/lDhJa
         bz03EzZ9KJhNFXQ/xnVf9eCIA55b0QgPg3+JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZsPNOAvTFnun1hxdUG5olOnkQwo5sBEF+e1/v4quww=;
        b=l3drW53TUa21Ru3QziYLFjfPvmoDYpE1vFLCwqBDYHQDjQrhgFx3i0xZQUwIWwR/vz
         QwH3XwE3JIGr+5f2f1rGFYkBrUiN7zvD61kW/3HVVZOodXnqNaeQuSRaNTiZxuR7QQ2a
         MOp1RVB1H3J110R1G4cSLja7Glod++e+STCDfh7gbmfw4l+wUWpujB0qFH8SrCUiUZP1
         BfBIdnivA/ZbWF8FQ2U/J9WswMcnbtRjX7zszv4BRljR++x9fiOOJJ1+H+BYLRs46GZ2
         ySWpVMs46110idlrdZHIW1GFfHy5kct5s27vLL4YzdIDUiaURsLfZL8ZiMUK+SxvTMy6
         6M2w==
X-Gm-Message-State: AOAM533x8Sszb4rOWmUur4vxESHHecmXwpo9r3SB0+3jndolhpudMgIF
        4Um+DEYwIetOBcuXCI/1x4T39+TvjiA1ww==
X-Google-Smtp-Source: ABdhPJwvdgRF5Ygd/rHeas5wAOUktHo2Y4zyOPPM9tQlWWH4xXJoKJbx2dMFor+ju2CaCfL6nyaF6A==
X-Received: by 2002:a05:6102:3111:: with SMTP id e17mr11170602vsh.3.1607635216048;
        Thu, 10 Dec 2020 13:20:16 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id v195sm668469vsv.7.2020.12.10.13.20.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 13:20:15 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id n18so2177211ual.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:20:15 -0800 (PST)
X-Received: by 2002:a9f:3dcc:: with SMTP id e12mr10613727uaj.121.1607635214734;
 Thu, 10 Dec 2020 13:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20201210125709.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
 <160763420585.1580929.9586717907613124743@swboyd.mtv.corp.google.com>
In-Reply-To: <160763420585.1580929.9586717907613124743@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 13:20:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V2E6W_1PtqBy6Fo_Cxp6kygpeitEkaMG5bMRpv7gO53w@mail.gmail.com>
Message-ID: <CAD=FV=V2E6W_1PtqBy6Fo_Cxp6kygpeitEkaMG5bMRpv7gO53w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Warn about overclocking SD/MMC
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 1:03 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-12-10 12:57:25)
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 3451eb325513..dd41f6a4dbfb 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -353,6 +353,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> >         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> >         struct mmc_ios curr_ios = host->mmc->ios;
> >         struct clk *core_clk = msm_host->bulk_clks[0].clk;
> > +       unsigned int achieved_rate;
>
> unsigned long?

I'm matching the type for the parameter.  ...but I guess you're right
that it's better to match clk_get_rate().

NOTE: I'm _not_ planning to change the parameter because it matches
the type in 'struct mmc_ios' and that feels like a much bigger change
to tweak.


> >         int rc;
> >
> >         clock = msm_get_clock_rate_for_bus_mode(host, clock);
> > @@ -363,6 +364,17 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> >                        curr_ios.timing);
> >                 return;
> >         }
> > +
> > +       /*
> > +        * Qualcomm clock drivers by default round clock _up_ if they can't
> > +        * make the requested rate.  This is not good for SD.  Yell if we
> > +        * encounter it.
> > +        */
> > +       achieved_rate = clk_get_rate(core_clk);
> > +       if (achieved_rate > clock)
> > +               pr_warn("%s: Card appears overclocked; req %u Hz, actual %d Hz\n",
>
> Can we use dev_warn?

What's here matches other prints including other ones in the same
function and in much of the MMC subsystem.  mmc_hostname() shows
"mmc1"

> dev_warn(mmc_dev(mmc)
> dev_warn(&msm_host->pdev->dev

This show "sdhci_msm 7c4000.sdhci"

I'm going to keep with tradition and keep using mmc_hostname().  In
some parts of this file they use both (a dev_warn that also includes
the mmc_hostname()) but that feels overkill.

> ?
>
> > +                       mmc_hostname(host->mmc), clock, achieved_rate);
> > +
> >         msm_host->clk_rate = clock;
> >         pr_debug("%s: Setting clock at rate %lu at timing %d\n",
> >                  mmc_hostname(host->mmc), clk_get_rate(core_clk),
>
> This could use achieved_rate now.

Sure.

I sent up a real quick v2 since it seemed like these were small fixes
and maybe this was all good otherwise.


-Doug
