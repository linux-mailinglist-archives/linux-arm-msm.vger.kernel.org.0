Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F352F1D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 19:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390251AbhAKSIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 13:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390236AbhAKSIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 13:08:10 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59287C061382
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:07:11 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id z16so4716vsp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fp1ONf4QArPbxZI1vhdw6hOF0tsfuNvhAr7FVEUu824=;
        b=vNKdZYGkiv3WMCTOIJA/PNn7ufn0uRUrC4bhsSbPN0hV6zaaWvopeMIf48dVjJ+RDs
         gRS06gjzlkIzIIqFIWK5imHWlYS0BAoSfXuhZOBZ2skrSggEpSMNmdmD18d20uR2WtOH
         fjrYWnu3bAy/ItpwJeqzf6VqCUgrYh5X9dh9nZ1qFAlymw4uLC2ly5KfdS4o2j0TE0Fu
         HtNKw0G+hWnXi/KQDv4zOI2j6PD9HTLB+LwCUoWYWzSW9afmXTqcNd6GM1UbnE1aSWeQ
         dXycwgqpHPuFVwCderbKFfX+Sr76E+fNhLecnJgCvXB/7DkY6CK/W2yuydbXSOUxcq/v
         DIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fp1ONf4QArPbxZI1vhdw6hOF0tsfuNvhAr7FVEUu824=;
        b=E3G0D6IYzB+p70zJYN7fRCl2IdI4K2Dv42GDov7w6KrRyEU80ogpPBnJNgIqR4Hvae
         M2gpsazRwtYybe0DToK38KULBjiMSNHnsL+qKSo/hUP4PvNqq16NesK68MJnD4EbhQ+B
         wUs6b7bktTHyMByRVo2HfpSW9z91mE8c3aybYn5P1jR3dxzARDElJOXTje65sk0xe7kE
         kkgucyfREGexWFD8aS2Wjy0oJ2z0MEV0iw7r/bKO2PCq/KjgrneJnmguG4+hYjXPyymN
         MilU54ivSdfGD+X+ABkTgi00wY50fjD16sBjpE7Jo3S9R7OkrA179oSXv+C4+Bu4kSwh
         cY4A==
X-Gm-Message-State: AOAM533zpcbLiveuLl8kWElaJnPrMgEsuGciMrjRX5YTFyV0mqZ/e30h
        FfrSxdrfl/4pET7926NdS1kmvmWk5IAp+6l2lCb/Zw==
X-Google-Smtp-Source: ABdhPJyaQOm5HWNk7sC/NrdkhA37LoQBNZMiKVA0PT2X3cAnwyuwYzecECYQL9sV7E4yw4QHUW4GgKfZMYSoah+yX0k=
X-Received: by 2002:a67:e286:: with SMTP id g6mr875424vsf.42.1610388430511;
 Mon, 11 Jan 2021 10:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
 <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
In-Reply-To: <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 11 Jan 2021 19:06:31 +0100
Message-ID: <CAPDyKFqMARrkX2R=f=dzAh9BjVHUgc9QQZpd1YVWX-Pz5C=Y9A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mmc: sdhci-msm: Actually set the actual clock
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Taniya Das <tdas@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Dec 2020 at 18:23, Douglas Anderson <dianders@chromium.org> wrote:
>
> The MSM SDHCI driver always set the "actual_clock" field to 0.  It had
> a comment about it not being needed because we weren't using the
> standard SDHCI divider mechanism and we'd just fallback to
> "host->clock".  However, it's still better to provide the actual
> clock.  Why?
>
> 1. It will make timeout calculations slightly better.  On one system I
>    have, the eMMC requets 200 MHz (for HS400-ES) but actually gets 192
>    MHz.  These are close, but why not get the more accurate one.
>
> 2. If things are seriously off in the clock driver and it's missing
>    rates or picking the wrong rate (maybe it's rounding up instead of
>    down), this will make it much more obvious what's going on.
>
> NOTE: we have to be a little careful here because the "actual_clock"
> field shouldn't include the multiplier that sdhci-msm needs
> internally.
>
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes in v5:
> - Remove unused clock parameter.
> - Add a comment that we're stashing the requested rate.
>
> Changes in v4:
> - ("mmc: sdhci-msm: Actually set the actual clock") new for v4.
>
>  drivers/mmc/host/sdhci-msm.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 50beb407dbe9..f5669dc858d0 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -328,8 +328,7 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
>         writel_relaxed(val, host->ioaddr + offset);
>  }
>
> -static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
> -                                                   unsigned int clock)
> +static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
>  {
>         struct mmc_ios ios = host->mmc->ios;
>         /*
> @@ -342,8 +341,8 @@ static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
>             ios.timing == MMC_TIMING_MMC_DDR52 ||
>             ios.timing == MMC_TIMING_MMC_HS400 ||
>             host->flags & SDHCI_HS400_TUNING)
> -               clock *= 2;
> -       return clock;
> +               return 2;
> +       return 1;
>  }
>
>  static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> @@ -354,14 +353,16 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>         struct mmc_ios curr_ios = host->mmc->ios;
>         struct clk *core_clk = msm_host->bulk_clks[0].clk;
>         unsigned long achieved_rate;
> +       unsigned int desired_rate;
> +       unsigned int mult;
>         int rc;
>
> -       clock = msm_get_clock_rate_for_bus_mode(host, clock);
> -       rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
> +       mult = msm_get_clock_mult_for_bus_mode(host);
> +       desired_rate = clock * mult;
> +       rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>         if (rc) {
>                 pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> -                      mmc_hostname(host->mmc), clock,
> -                      curr_ios.timing);
> +                      mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
>                 return;
>         }
>
> @@ -371,11 +372,14 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>          * encounter it.
>          */
>         achieved_rate = clk_get_rate(core_clk);
> -       if (achieved_rate > clock)
> +       if (achieved_rate > desired_rate)
>                 pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
> -                       mmc_hostname(host->mmc), clock, achieved_rate);
> +                       mmc_hostname(host->mmc), desired_rate, achieved_rate);
> +       host->mmc->actual_clock = achieved_rate / mult;
> +
> +       /* Stash the rate we requested to use in sdhci_msm_runtime_resume() */
> +       msm_host->clk_rate = desired_rate;
>
> -       msm_host->clk_rate = clock;
>         pr_debug("%s: Setting clock at rate %lu at timing %d\n",
>                  mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
>  }
> @@ -1756,13 +1760,6 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>  static void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  {
>         u16 clk;
> -       /*
> -        * Keep actual_clock as zero -
> -        * - since there is no divider used so no need of having actual_clock.
> -        * - MSM controller uses SDCLK for data timeout calculation. If
> -        *   actual_clock is zero, host->clock is taken for calculation.
> -        */
> -       host->mmc->actual_clock = 0;
>
>         sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
>
> @@ -1785,7 +1782,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>
>         if (!clock) {
> -               msm_host->clk_rate = clock;
> +               host->mmc->actual_clock = msm_host->clk_rate = 0;
>                 goto out;
>         }
>
> --
> 2.29.2.576.ga3fc446d84-goog
>
