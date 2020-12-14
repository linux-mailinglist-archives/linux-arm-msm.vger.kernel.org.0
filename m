Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6902D9D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 18:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440337AbgLNRZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 12:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408507AbgLNRXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 12:23:54 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488E7C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 09:23:14 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id x26so9407921vsq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4/H5KkHplx6c8hRY9n/z1Ihm7wdVAC1WaMlKmQhNMg=;
        b=heyEYswMrzq4NoyA2wH6PjiRH0I7R0Suukp6ZwO3UCTMXk9WkIHFqcti95Fo1+tPEx
         nQZ7vvx3oFG6JMGgF3H3Lsm9Hi7reT7S0p0qkH2UnZYq9JwZL1BBlySy3Mcu5LTxkdA/
         F59jc9Jhg9ADgh/gUlCuxhJ83aU8ov8PoI2T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4/H5KkHplx6c8hRY9n/z1Ihm7wdVAC1WaMlKmQhNMg=;
        b=q0cpQHr1lgO3UtK4pBpo2qBRZx5Kpew3r196rWuAnH6eIfJFwMspFmOTdNQzPTkT4+
         E9HZVbHA0GLNcaqUkCcQg0tfJc9D1z7+uLawSryIqPcnt6A1+shIqF9wbl3RJSxf0snA
         NCESpuGi6b5oDNhip19F5INz/aBsvdrpbqjOtosAn9cJH3cfkzbu389QsQr2M5BWems4
         b36Gupe4bqGJj3H6pxUW42OmkgERxU8aXHUQ7sCtMzaCSQ+uguIegonFXgkiwBkY1Z70
         79xJcJcoRPzlb04mI6ZkLKnjBj4qMmujyM1xrs6fMi69bU4bYFogJ9diJIBmuM5hgCzX
         tFlQ==
X-Gm-Message-State: AOAM533m6J1D4j8m1aQ1ESar00nb8ntZhM2QkO27V05d65KPzHs8O6Zr
        r1kmQTqfqlzNniANFEmz3hUWVhVN5P/WLA==
X-Google-Smtp-Source: ABdhPJwfDZa08BqGM74MGjDaF7V8DZI2QMLNnnX9EtDALFE6CoQvzO05NaA5GT6pR1E33oJtPlzrrw==
X-Received: by 2002:a67:a24e:: with SMTP id t14mr21458706vsh.36.1607966592999;
        Mon, 14 Dec 2020 09:23:12 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id v65sm2405234vkb.31.2020.12.14.09.23.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 09:23:12 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 4so5706273uap.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 09:23:11 -0800 (PST)
X-Received: by 2002:ab0:6285:: with SMTP id z5mr24231786uao.0.1607966591317;
 Mon, 14 Dec 2020 09:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20201211091150.v4.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
 <20201211091150.v4.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid> <e817284c-1ae9-7d3f-5195-7313651ef9da@codeaurora.org>
In-Reply-To: <e817284c-1ae9-7d3f-5195-7313651ef9da@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Dec 2020 09:22:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WpZn8kx+X+EtmRnrtdS2B88x4M9fwuxbtt06BvL76jJQ@mail.gmail.com>
Message-ID: <CAD=FV=WpZn8kx+X+EtmRnrtdS2B88x4M9fwuxbtt06BvL76jJQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mmc: sdhci-msm: Actually set the actual clock
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
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

On Mon, Dec 14, 2020 at 4:44 AM Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 12/11/2020 10:42 PM, Douglas Anderson wrote:
> > The MSM SDHCI driver always set the "actual_clock" field to 0.  It had
> > a comment about it not being needed because we weren't using the
> > standard SDHCI divider mechanism and we'd just fallback to
> > "host->clock".  However, it's still better to provide the actual
> > clock.  Why?
> >
> > 1. It will make timeout calculations slightly better.  On one system I
> >     have, the eMMC requets 200 MHz (for HS400-ES) but actually gets 192
> >     MHz.  These are close, but why not get the more accurate one.
> >
> > 2. If things are seriously off in the clock driver and it's missing
> >     rates or picking the wrong rate (maybe it's rounding up instead of
> >     down), this will make it much more obvious what's going on.
> >
> > NOTE: we have to be a little careful here because the "actual_clock"
> > field shouldn't include the multiplier that sdhci-msm needs
> > internally.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - ("mmc: sdhci-msm: Actually set the actual clock") new for v4.
> >
> >   drivers/mmc/host/sdhci-msm.c | 32 ++++++++++++++------------------
> >   1 file changed, 14 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 50beb407dbe9..08a3960001ad 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -328,7 +328,7 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
> >       writel_relaxed(val, host->ioaddr + offset);
> >   }
> >
> > -static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
> > +static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host,
> >                                                   unsigned int clock)
>
> nit: clock variable not being used anymore. We can drop it.

Good point.  Sending out a v5 with this.


> >   {
> >       struct mmc_ios ios = host->mmc->ios;
> > @@ -342,8 +342,8 @@ static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
> >           ios.timing == MMC_TIMING_MMC_DDR52 ||
> >           ios.timing == MMC_TIMING_MMC_HS400 ||
> >           host->flags & SDHCI_HS400_TUNING)
> > -             clock *= 2;
> > -     return clock;
> > +             return 2;
> > +     return 1;
> >   }
> >
> >   static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> > @@ -354,14 +354,16 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> >       struct mmc_ios curr_ios = host->mmc->ios;
> >       struct clk *core_clk = msm_host->bulk_clks[0].clk;
> >       unsigned long achieved_rate;
> > +     unsigned int desired_rate;
> > +     unsigned int mult;
> >       int rc;
> >
> > -     clock = msm_get_clock_rate_for_bus_mode(host, clock);
> > -     rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
> > +     mult = msm_get_clock_mult_for_bus_mode(host, clock);
> > +     desired_rate = clock * mult;
> > +     rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
> >       if (rc) {
> >               pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> > -                    mmc_hostname(host->mmc), clock,
> > -                    curr_ios.timing);
> > +                    mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
> >               return;
> >       }
> >
> > @@ -371,11 +373,12 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> >        * encounter it.
> >        */
> >       achieved_rate = clk_get_rate(core_clk);
> > -     if (achieved_rate > clock)
> > +     if (achieved_rate > desired_rate)
> >               pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
> > -                     mmc_hostname(host->mmc), clock, achieved_rate);
> > +                     mmc_hostname(host->mmc), desired_rate, achieved_rate);
> > +     host->mmc->actual_clock = achieved_rate / mult;
> >
> > -     msm_host->clk_rate = clock;
> > +     msm_host->clk_rate = desired_rate;
>
>
> Can you set msm_host->clk_rate also to achieved_rate?

Personally I'd rather not, but if you are sure that's what you want I
won't object to it too strongly.  Why do I feel this way?  The member
"clk_rate" contains the value that we passed to dev_pm_opp_set_rate()
the first time and I'd rather use that exact same value in
sdhci_msm_runtime_resume().  Mostly I'm just being paranoid in case
there is a bug and the operations aren't "stable".

For instance, let's imagine a fictional case where somewhere in the
clock framework there is a transition to kHz (something like this
_actually_ happens in the DRM subsystem):

clk_set_rate(rate_hz):
  rate_khz = rate_hz / 1000;
  real_clk_set_rate(rate_khz);

real_clk_set_rate(rate_khz)
  rate_hz = rate_khz * 1000;
  for each table_rate in table:
    if table_rate <= rate_hz:
      break;
  set_hw_rate(table_rate);

real_clk_get_rate()
  rate_hz = get_hw_rate();
  return rate_hz / 1000;

clk_get_rate()
  rate_khz = real_clk_get_rate()
  return rate_khz * 1000;

Now if your table has these rates:
  { 111111111, 222222222, 333333333 }

Calling clk_set_rate(400000000) will set your rate to 333333333 Hz.
Now calling clk_get_rate() will return you 333333000.  Now calling
clk_set_rate(333333000) will set your rate to 222222222 Hz!

IMO the above would be a bug, but I have seen things like that happen.
It's safer to stash the actual rate that we _requested_ and, if we
need to request the rate again, we pass that same value.  That should
always work.  I added a comment to at least make it look more explicit
that we're stashing the requested value.


> At few places in this driver, host->clock is being used where
> achieved_rate should be used ideally.
> I will replace those instances with 'msm_host->clk_rate' in a separate
> patch once this change merged.

Sounds good, thanks!


-Doug
