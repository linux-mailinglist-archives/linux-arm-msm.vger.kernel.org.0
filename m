Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDBF1BCB78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 20:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgD1SaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 14:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729468AbgD1SaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 14:30:15 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F96C03C1AE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 11:30:15 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id b6so8713552uak.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pXMg95AozC5ju4vKrdTrkYzrsPUBTLw6GqQWj9wwSg8=;
        b=BMOR3eMSjaDO+gIF05mqIQqam13R+jGBmNymq3jZoK2dxuYu0k0lfMbTri71OPUeg+
         nOm7JCs5UGgb8RbAbZVh57RtL73K6pOtg4bfa6abk1zifMglkXSY4sHFy8Nj5nfsL3Ad
         dq4ixCiwxQPtrHIlKhKxJv/yYOmOLo+/3SvhMtbny8ghN3Yuz+VIlDubVGUfLXzRSnkm
         4f8qdAol1fBSCGJCWs0SrvVkjELl0tFaqPgwtaB6KB0y4p4G4e0dnfHEFfAGKDVQusYv
         z1y6QRs6X0ce0WGJHccaWZVslvJG1pAy/ou+ybIzy1ImNfYw7qsdTrmvqtgfLJTfPwEo
         srfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pXMg95AozC5ju4vKrdTrkYzrsPUBTLw6GqQWj9wwSg8=;
        b=JzY3CtZThcGI0owKZhvoqOjAJ+SB8FqsvDdAbmTW2cex72wblOSNyChFEe9/WTguDK
         sjmXOOFvb4c5KpSEPez+qFCHQVnSklEKcBY42ZkTpwmazvKUWmY+QOdNl6HaZbRcsxo+
         CatxrCtmXKvMS8YA4ZBZyTRIKuOiF6VMAVG4Y85iNcS8lynWpSIas7MO8h8yEwqnrT0a
         g6BL4tOVVs10wqJs+n/FpAwm4WzjJRNVEAgRa0ZEriWo9O5KGDcmoKmWlNdXFhx2YaRp
         ErCQS6ffOQZwjej6/hSJYE1JqCdma9Ey+dSzSUFAbZrZNicy8vEKVn1jG0fYK5Z2Wipp
         261w==
X-Gm-Message-State: AGi0PuZUEnfQQFBYPsde3UYgdmKrO+FKkREOUrg0d+NPae7kYHuaJGUG
        ckmE/TkTzi2SvYzgSXadxFe9xPsaJk5Pf9h14mvGAA==
X-Google-Smtp-Source: APiQypLsMma60/04KmAJl8+He2niHeX0v3cUqZD1z9G1U33bvEUR66gRv6EtELS7Q+EmnzF1YJxBkDklwYv88PqRhtM=
X-Received: by 2002:ab0:6588:: with SMTP id v8mr23216205uam.100.1588098614071;
 Tue, 28 Apr 2020 11:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org> <1588080785-6812-10-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1588080785-6812-10-git-send-email-rnayak@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 28 Apr 2020 20:29:38 +0200
Message-ID: <CAPDyKFrGQvcCB1wfv=iqk66uja3faMRF1gGMSE2VhB8gJcO=sg@mail.gmail.com>
Subject: Re: [PATCH v3 09/17] mmc: sdhci-msm: Fix error handling for dev_pm_opp_of_add_table()
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

On Tue, 28 Apr 2020 at 15:39, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Even though specifying OPP's in device tree is optional, ignoring all errors
> reported by dev_pm_opp_of_add_table() means we can't distinguish between a
> missing OPP table and a wrong/buggy OPP table. While missing OPP table
> (dev_pm_opp_of_add_table() returns a -ENODEV in such case) can be ignored,
> a wrong/buggy OPP table in device tree should make the driver error out.
>
> while we fix that, lets also fix the variable names for opp/opp_table to
> avoid confusion and name them opp_table/has_opp_table instead.
>
> Suggested-by: Matthias Kaehlcke <matthias@chromium.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Pradeep P V K <ppvk@codeaurora.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Cc: linux-mmc@vger.kernel.org

Is this a standalone patch that I queue up via my mmc tree?

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 8a055dd..97758fa 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -244,8 +244,8 @@ struct sdhci_msm_host {
>         struct clk_bulk_data bulk_clks[4]; /* core, iface, cal, sleep clocks */
>         unsigned long clk_rate;
>         struct mmc_host *mmc;
> -       struct opp_table *opp;
> -       bool opp_table;
> +       struct opp_table *opp_table;
> +       bool has_opp_table;
>         bool use_14lpp_dll_reset;
>         bool tuning_done;
>         bool calibration_done;
> @@ -1967,15 +1967,20 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         }
>         msm_host->bulk_clks[0].clk = clk;
>
> -       msm_host->opp = dev_pm_opp_set_clkname(&pdev->dev, "core");
> -       if (IS_ERR(msm_host->opp)) {
> -               ret = PTR_ERR(msm_host->opp);
> +       msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
> +       if (IS_ERR(msm_host->opp_table)) {
> +               ret = PTR_ERR(msm_host->opp_table);
>                 goto bus_clk_disable;
>         }
>
>         /* OPP table is optional */
> -       if (!dev_pm_opp_of_add_table(&pdev->dev))
> -               msm_host->opp_table = true;
> +       ret = dev_pm_opp_of_add_table(&pdev->dev);
> +       if (!ret) {
> +               msm_host->has_opp_table = true;
> +       } else if (ret != -ENODEV) {
> +               dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> +               goto opp_cleanup;
> +       }
>
>         /* Vote for maximum clock rate for maximum performance */
>         ret = dev_pm_opp_set_rate(&pdev->dev, INT_MAX);
> @@ -2133,9 +2138,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>                                    msm_host->bulk_clks);
>  opp_cleanup:
> -       if (msm_host->opp_table)
> +       if (msm_host->has_opp_table)
>                 dev_pm_opp_of_remove_table(&pdev->dev);
> -       dev_pm_opp_put_clkname(msm_host->opp);
> +       dev_pm_opp_put_clkname(msm_host->opp_table);
>  bus_clk_disable:
>         if (!IS_ERR(msm_host->bus_clk))
>                 clk_disable_unprepare(msm_host->bus_clk);
> @@ -2154,9 +2159,9 @@ static int sdhci_msm_remove(struct platform_device *pdev)
>
>         sdhci_remove_host(host, dead);
>
> -       if (msm_host->opp_table)
> +       if (msm_host->has_opp_table)
>                 dev_pm_opp_of_remove_table(&pdev->dev);
> -       dev_pm_opp_put_clkname(msm_host->opp);
> +       dev_pm_opp_put_clkname(msm_host->opp_table);
>         pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
