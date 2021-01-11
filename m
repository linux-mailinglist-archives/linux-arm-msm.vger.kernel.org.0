Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191282F1D9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 19:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390282AbhAKSKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 13:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390229AbhAKSIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 13:08:09 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB43C0617BF
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:07:06 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id w7so112566uap.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1ba0D1TDd5062AR1SfU8gm8YOEYc8hLSUEnEfhxYD4=;
        b=KzClU4DD85f6+auJ+ivL5JloLPXL2Zyv4fG9HU93Vtk/6t6DQr78NH1ssFYgrlxmjx
         Q4JUQ+OiFHkZJet9S9tO5rCZ82FwIsl/ZzeOMRMaSsbrNtw48xHRt/VwwVJsM8FE4r+G
         A5Ler9XSCthPemz8wSymOGJD0UGmgGE0c9ID36FDRlRyHWlixBEuiB0sDCF4+Ghh74/j
         UYmpY3JQzY9IYvmhiy/6J8urO/vc46OIJyjUikkaD/yRyjMR/1QxMgtKWuMpFyEWPf1z
         UHI8IOslUyUunO2YY+yY7LJq8qp9PiEFdcKLTvOs7E9EztlSIBj5AjWI7f89yVZWbd/q
         cBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1ba0D1TDd5062AR1SfU8gm8YOEYc8hLSUEnEfhxYD4=;
        b=ayX3KFCl2GNrYQMbD/jx4qb1KZI8zjl7MZmmuJ8BYsnrbY1XE1oB2rr2E6gfDYP6uS
         HmWTlgcxiQoPCw4W5En0l3rQjsWg4LXrjRsqTbB5uF1vFs4z6x+CqS5N8XZuXdYI2jln
         LoLcM/mliDDQzuU0uFlb9CGNTwCrSbLiqpIYg/RYxSmRn+CJ8AR2hIBTSkg86dTR+u/i
         keqjmgVxb31FEK5ppa0WHu1NZDW8mfyd3UWZlXXHb0cUksHZhCxokYgs+BftgIROL65w
         YrsW28Fnkupoz0mutP75vBhgsnJKVOdHGhezTNaUSGSXDgC5xOvHCWGonI03GHxvcVDg
         JcGw==
X-Gm-Message-State: AOAM530+QXFq2xRX7c7KP+NP+ET2TWr8pV/qHauvoson9Q/GR9hOgcLe
        BHMlJDcd2kuFuFFDwjAmJz08ISrMYKWAwUpv8li+dg==
X-Google-Smtp-Source: ABdhPJx6BrfdiUcsnuD/N4GaQhtFowI5Mo4SSFOzvypapfM+I74Fa5jZYr+SvYVyFgyLr02veWvmObeLMmoVQFP78gw=
X-Received: by 2002:ab0:4597:: with SMTP id u23mr739116uau.100.1610388426114;
 Mon, 11 Jan 2021 10:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
In-Reply-To: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 11 Jan 2021 19:06:28 +0100
Message-ID: <CAPDyKFpDtRobqgdTf4mgZNEy8Omg=VjzE=6S7O3uiH==Qgqg8A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mmc: sdhci-msm: Warn about overclocking SD/MMC
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
> As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
> floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
> drivers are rounded _up_ by default instead of down.  We should make
> sure SD/MMC clocks are always rounded down in the clock drivers.
> Let's add a warning in the Qualcomm SDHCI driver to help catch the
> problem.
>
> This would have saved a bunch of time [1].
>
> NOTE: this doesn't actually fix any problems, it just makes it obvious
> to devs that there is a problem and that should be an indication to
> fix the clock driver.
>
> [1] http://lore.kernel.org/r/20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> (no changes since v4)
>
> Changes in v4:
> - Emphasize in the commit message that this itself doesn't fix anything.
>
> Changes in v3:
> - Proper printf format code.
>
> Changes in v2:
> - Store rate in unsigned long, not unsigned int.
> - Reuse the clk_get_rate() in the later print.
>
>  drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3451eb325513..50beb407dbe9 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -353,6 +353,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>         struct mmc_ios curr_ios = host->mmc->ios;
>         struct clk *core_clk = msm_host->bulk_clks[0].clk;
> +       unsigned long achieved_rate;
>         int rc;
>
>         clock = msm_get_clock_rate_for_bus_mode(host, clock);
> @@ -363,10 +364,20 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>                        curr_ios.timing);
>                 return;
>         }
> +
> +       /*
> +        * Qualcomm clock drivers by default round clock _up_ if they can't
> +        * make the requested rate.  This is not good for SD.  Yell if we
> +        * encounter it.
> +        */
> +       achieved_rate = clk_get_rate(core_clk);
> +       if (achieved_rate > clock)
> +               pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
> +                       mmc_hostname(host->mmc), clock, achieved_rate);
> +
>         msm_host->clk_rate = clock;
>         pr_debug("%s: Setting clock at rate %lu at timing %d\n",
> -                mmc_hostname(host->mmc), clk_get_rate(core_clk),
> -                curr_ios.timing);
> +                mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
>  }
>
>  /* Platform specific tuning */
> --
> 2.29.2.576.ga3fc446d84-goog
>
