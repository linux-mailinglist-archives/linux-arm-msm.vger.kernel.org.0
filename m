Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFD51B0407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 10:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgDTIOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 04:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgDTIOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 04:14:11 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20CEC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 01:14:11 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id g129so2324790vkh.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 01:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T9GinMsJEv0EhSDmZbXQ57IUHSeDM2NbCmWALYXUEsg=;
        b=TRhGtnK39UfkuK08j+Fo8o8zPykMQc6Ufx/2y80JpT0Q1ykAK0rNAOgHOyHzPXZKsO
         sek/6znyPeAEQyxf7wEIbelx+Nh/48yebgqUfUb8RD0L1pFWvjLREs45zShID/FpSZyK
         CoIIMYQPf2o55EfeV0diBxsFV3YXrjKl5vLle7QEubdsatHDrJdCTIPr5+0Ke9DMIyKv
         h0DhZUgBGO5ts4FvPFgd3kaEMmfSLSC8wQlUpIyr3hVg8laeM9lew+kVjeuXY3wrNqmY
         kvgBhDlgAOa0dDEIDpG5a3zrILpw55+/MyZx5JEkI/cVOmwTa2G3OLCyDhRVHPnRUdcg
         jyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T9GinMsJEv0EhSDmZbXQ57IUHSeDM2NbCmWALYXUEsg=;
        b=T81a3HioWy5Zkoj/cO8v7kWwDF9ma38HeLiUG3DOdDX4OQVX1oL8trVix+icmZtP3G
         QvxwN3XFEBb7ZsY0knTc9iGlCCEM9XonU9qPzjA1iqo+F2hf0QOWkIo0O+q1JVk0U2VH
         ubQiv90IVUig4/waRrwphh90NQhP/ey2ED3gOss3dR9R3rw/1gwZLawq4bGt5VbUCxN0
         Iw0EKgf1FSBZwMfDa7HMeAvFtSuaPmvRtwgcUUjouYm7+F88CmbPWiUuPdnXFJpVRtaZ
         CX04qlO4qJcTMn1S/hxVh3rEer1/tSY72phk0a/KuOVQNRaKUhcZS9CwmqM4CyZnnF3C
         mMNA==
X-Gm-Message-State: AGi0PuaMQSBFwBKCia3QULhm8EklpAaQxpYJeyK2sX66PrCiVyth0H7w
        2mDtUYlVCzc5FMhvTQPzG38Xldrucc/5zlmB9njmkQ==
X-Google-Smtp-Source: APiQypKwCd1PgO6T5lp69fVONbTpotACz5UZBAsfPsLtI+BacSvziQUdd7t6fZDDvWhHSNfOT3kDmRcKDUKvPaK3he0=
X-Received: by 2002:a1f:5003:: with SMTP id e3mr10045984vkb.59.1587370450817;
 Mon, 20 Apr 2020 01:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org> <1587132279-27659-10-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1587132279-27659-10-git-send-email-rnayak@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Apr 2020 10:13:35 +0200
Message-ID: <CAPDyKFrdtTvFDKnuJ8t7nRCbZ-b0HHiEbPwCH8OMAcBKZjhXBQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mmc: sdhci-msm: Use OPP API to set clk/perf state
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Apr 2020 at 16:06, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> On some qualcomm SoCs we need to vote on a performance state of a power
> domain depending on the clock rates. Hence move to using OPP api to set
> the clock rate and performance state specified in the OPP table.
> On platforms without an OPP table, dev_pm_opp_set_rate() is eqvivalent to
> clk_set_rate()
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Pradeep P V K <ppvk@codeaurora.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Cc: linux-mmc@vger.kernel.org

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 09ff731..cf27480 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/mmc/mmc.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_opp.h>
>  #include <linux/slab.h>
>  #include <linux/iopoll.h>
>  #include <linux/regulator/consumer.h>
> @@ -243,6 +244,8 @@ struct sdhci_msm_host {
>         struct clk_bulk_data bulk_clks[4]; /* core, iface, cal, sleep clocks */
>         unsigned long clk_rate;
>         struct mmc_host *mmc;
> +       struct opp_table *opp;
> +       bool opp_table;
>         bool use_14lpp_dll_reset;
>         bool tuning_done;
>         bool calibration_done;
> @@ -332,7 +335,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>         int rc;
>
>         clock = msm_get_clock_rate_for_bus_mode(host, clock);
> -       rc = clk_set_rate(core_clk, clock);
> +       rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
>         if (rc) {
>                 pr_err("%s: Failed to set clock at rate %u at timing %d\n",
>                        mmc_hostname(host->mmc), clock,
> @@ -1962,8 +1965,18 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         }
>         msm_host->bulk_clks[0].clk = clk;
>
> +       msm_host->opp = dev_pm_opp_set_clkname(&pdev->dev, "core");
> +       if (IS_ERR(msm_host->opp)) {
> +               ret = PTR_ERR(msm_host->opp);
> +               goto bus_clk_disable;
> +       }
> +
> +       /* OPP table is optional */
> +       if (!dev_pm_opp_of_add_table(&pdev->dev))
> +               msm_host->opp_table = true;
> +
>         /* Vote for maximum clock rate for maximum performance */
> -       ret = clk_set_rate(clk, INT_MAX);
> +       ret = dev_pm_opp_set_rate(&pdev->dev, INT_MAX);
>         if (ret)
>                 dev_warn(&pdev->dev, "core clock boost failed\n");
>
> @@ -1980,7 +1993,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
>                                       msm_host->bulk_clks);
>         if (ret)
> -               goto bus_clk_disable;
> +               goto opp_cleanup;
>
>         /*
>          * xo clock is needed for FLL feature of cm_dll.
> @@ -2115,6 +2128,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  clk_disable:
>         clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>                                    msm_host->bulk_clks);
> +opp_cleanup:
> +       if (msm_host->opp_table)
> +               dev_pm_opp_of_remove_table(&pdev->dev);
> +       dev_pm_opp_put_clkname(msm_host->opp);
>  bus_clk_disable:
>         if (!IS_ERR(msm_host->bus_clk))
>                 clk_disable_unprepare(msm_host->bus_clk);
> @@ -2133,6 +2150,9 @@ static int sdhci_msm_remove(struct platform_device *pdev)
>
>         sdhci_remove_host(host, dead);
>
> +       if (msm_host->opp_table)
> +               dev_pm_opp_of_remove_table(&pdev->dev);
> +       dev_pm_opp_put_clkname(msm_host->opp);
>         pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
> @@ -2151,6 +2171,8 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>
> +       /* Drop the performance vote */
> +       dev_pm_opp_set_rate(dev, 0);
>         clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>                                    msm_host->bulk_clks);
>
> @@ -2173,9 +2195,11 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>          * restore the SDR DLL settings when the clock is ungated.
>          */
>         if (msm_host->restore_dll_config && msm_host->clk_rate)
> -               return sdhci_msm_restore_sdr_dll_config(host);
> +               ret = sdhci_msm_restore_sdr_dll_config(host);
>
> -       return 0;
> +       dev_pm_opp_set_rate(dev, msm_host->clk_rate);
> +
> +       return ret;
>  }
>
>  static const struct dev_pm_ops sdhci_msm_pm_ops = {
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
