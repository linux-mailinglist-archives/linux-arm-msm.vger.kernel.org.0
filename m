Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA52E24F9FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 11:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgHXJvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 05:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729553AbgHXJvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 05:51:44 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78619C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2020 02:51:44 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id r7so4104178vsq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2020 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ln8SN+7RLvf7fE2ywm+jg35Tyq/B4Xvx0WH4mCC+yU4=;
        b=KcKirNkka0lXfE/G1WBoDbs+9xUm6m7RRxLyArxUXcL+MBqMttUxIXZhdzZWelj9Iu
         RIgZPOet2uKIWEXK3Tlxykk+fNi0PJil1M+PImvo5F0X8/RATfwREkQbFkLLiw5p2k7c
         t9iiul5OGNaFNW/S1V7pKehZycdtVOCpXmYmd8Am7Q0OfD0G+63tpvWkVv2f3ykk4yer
         4Sq03SUehpTCjbB60/O66CIcZwzYttH8wREWhi4ah5J50SPfglsPpZPfu/APbYEigphG
         cN6yB72HGAtq8Iz5ZvMYOEqV1tgKQDeARxw6lV1aiHLD2GrWPL+yIjWwWO5xROzTmYC/
         bpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ln8SN+7RLvf7fE2ywm+jg35Tyq/B4Xvx0WH4mCC+yU4=;
        b=NXBYKRJeJamin5MLZExr8/fPHXGHbixEsnTV5PHBXrvofSErH6Njuy2tnNOl5j+c6g
         2JpYRluEXxJiZpYrqIThti1QNzAFzaE0VHsRjFaVcyEWIhLAE1rfc6kyH0IafJRveN5C
         3L0Bv5S2fwQGfJyp7kIBURo3x4GR8DiQsdFWFViWV1LjR1HSfPbF8I+S39tWB1mGzaea
         bkjbYMEFb43Qsrc2T++guvUQm/DnivAoyAHoF9vKBiVWICjlDjo9ASDBdabKji5tBeFv
         csT0XBVjJg+sQZGQ9y7cwtQ6fVF1x/1bqoIzI4y2hE7Uf0JBCrVDIz48iXarnCy/oTz7
         H3+Q==
X-Gm-Message-State: AOAM532ESz65UM83P1pPEQDVxpf8Jv3km4NpsYzSo6w/t6vQ0Jis86r4
        fBdiNWDxbhnvxAu38e8Rp9leWJoN/rmi3PsRdDX5ng==
X-Google-Smtp-Source: ABdhPJwd+jCqwoXcVEZBQ1HvErLYStyQ+OkTEJZDJuVbqozu9T2Ah5ho52VM3ZSTTAdEQ07d2iqF066sx8wJHfqQdWE=
X-Received: by 2002:a67:8c06:: with SMTP id o6mr2038655vsd.200.1598262703392;
 Mon, 24 Aug 2020 02:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597919647.git.viresh.kumar@linaro.org> <e88128c48349723636b7c35e95289b50b27e235a.1597919647.git.viresh.kumar@linaro.org>
In-Reply-To: <e88128c48349723636b7c35e95289b50b27e235a.1597919647.git.viresh.kumar@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 Aug 2020 11:51:07 +0200
Message-ID: <CAPDyKFp58Sqvmq7CFmDkHXX3ohgyqt1VPELGdq0mtOSZq+uc2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Aug 2020 at 12:44, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-msm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 5a33389037cd..b7e47107a31a 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -263,7 +263,6 @@ struct sdhci_msm_host {
>         unsigned long clk_rate;
>         struct mmc_host *mmc;
>         struct opp_table *opp_table;
> -       bool has_opp_table;
>         bool use_14lpp_dll_reset;
>         bool tuning_done;
>         bool calibration_done;
> @@ -2285,9 +2284,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>
>         /* OPP table is optional */
>         ret = dev_pm_opp_of_add_table(&pdev->dev);
> -       if (!ret) {
> -               msm_host->has_opp_table = true;
> -       } else if (ret != -ENODEV) {
> +       if (ret != -ENODEV) {
>                 dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
>                 goto opp_cleanup;
>         }
> @@ -2453,8 +2450,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>                                    msm_host->bulk_clks);
>  opp_cleanup:
> -       if (msm_host->has_opp_table)
> -               dev_pm_opp_of_remove_table(&pdev->dev);
> +       dev_pm_opp_of_remove_table(&pdev->dev);
>         dev_pm_opp_put_clkname(msm_host->opp_table);
>  bus_clk_disable:
>         if (!IS_ERR(msm_host->bus_clk))
> @@ -2474,8 +2470,7 @@ static int sdhci_msm_remove(struct platform_device *pdev)
>
>         sdhci_remove_host(host, dead);
>
> -       if (msm_host->has_opp_table)
> -               dev_pm_opp_of_remove_table(&pdev->dev);
> +       dev_pm_opp_of_remove_table(&pdev->dev);
>         dev_pm_opp_put_clkname(msm_host->opp_table);
>         pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
> --
> 2.25.0.rc1.19.g042ed3e048af
>
