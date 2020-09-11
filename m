Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3204265D54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 12:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgIKKER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 06:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgIKKEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 06:04:15 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12099C061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 03:04:15 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q13so5053235vsj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lv7DYSegmi05MQ2Or1cVULVSVjTeshwqgQaUDPulOTE=;
        b=gyQaqmP/9o85fe1LiMX2cY1a7zMENgWNJsst1hDiZSI33Fosd3Qv5rUAPGvomlSiU2
         aCLS3ARaIRotYG2VnNOxjwzt/FFcgjR9YaN9I56g1wQjxDYE5YeylRG2CapeXI8KF4Uy
         W3OiNGzsxUBWEBMZqOvabMjSoxBJnqQ42FzVzZyua4B99MamgAo0mgjfcHxdfqZQDXJt
         v7voKkopP50unQtCJonw4iiYQbfMjnj1uHTECeKNfEzowDdrMypLR/GdZPt+k9Dc4Bha
         4x7IUuFy06fTbzFttIW36kDpODVIiw0Vy8NfN1RsU0SU3zlFygTIPgl4LYhlBjsk90wO
         T3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lv7DYSegmi05MQ2Or1cVULVSVjTeshwqgQaUDPulOTE=;
        b=eaKCH3jEUfoiOMqy4FyO+RBy72YBDtvC9lQYRNvd8qAHODLFYhhdKGrBLBkrSO4YFI
         ZdgnPwDF+7C9wSjwl41D1B7QNUCI8uc44H9yT4IGulHWxHeqJIT2H07Edbue92m3L/lU
         5I2aaMILhpN+6bufxc5OzuCnOkA1jp7qRwB8shQp8XgBCQ3JgCY8A7PK3z1SsCpdIMFw
         jhkUXaZ+xHbr8O7PyoY+kw0Kn8OMIZfCsyub8h+5C/9Bb2gBWRpr4IST5p4lfhpwwlsa
         uBrKaloAnxauFeAsQj339KbZ51ttSvHLedaWFjnSeLZBY9YztwZgetqz41chTjDM+qPh
         aNDg==
X-Gm-Message-State: AOAM531xRl6tO1Qq5FJkw8q7BrDrt0jDY0t5btI67WIkZ9w2630gaJBN
        FWUYrRHBhDpgJ5uwPRklJqAhhNbgzL+u2YOZaO3JQQ==
X-Google-Smtp-Source: ABdhPJzQhkBpSUuU0Ob3GWHfokuWfgA4zmVG5+TujkYG/hWdckyrLWyFYgoTqFxrTETn15q2HAHHdhCozEtVDbO2gls=
X-Received: by 2002:a67:e355:: with SMTP id s21mr496154vsm.50.1599818652720;
 Fri, 11 Sep 2020 03:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <890ae5601594fca5de104695a682f4b6efbc631b.1599660554.git.viresh.kumar@linaro.org>
In-Reply-To: <890ae5601594fca5de104695a682f4b6efbc631b.1599660554.git.viresh.kumar@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 11 Sep 2020 12:03:36 +0200
Message-ID: <CAPDyKFropJGPHEmczi9rjWEJvgCOz8d9bLUdMmu6K+B+1w8c-w@mail.gmail.com>
Subject: Re: [PATCH V2 resend] mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Sep 2020 at 16:12, Viresh Kumar <viresh.kumar@linaro.org> wrote:
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

>
> ---
> V2:
> - Compare with -ENODEV only for failures.
> - Create new label to put clkname.
> - Based on 5.9-rc4
> ---
>  drivers/mmc/host/sdhci-msm.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 5a33389037cd..f7beaec6412e 100644
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
> @@ -2285,11 +2284,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>
>         /* OPP table is optional */
>         ret = dev_pm_opp_of_add_table(&pdev->dev);
> -       if (!ret) {
> -               msm_host->has_opp_table = true;
> -       } else if (ret != -ENODEV) {
> +       if (ret && ret != -ENODEV) {
>                 dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> -               goto opp_cleanup;
> +               goto opp_put_clkname;
>         }
>
>         /* Vote for maximum clock rate for maximum performance */
> @@ -2453,8 +2450,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>                                    msm_host->bulk_clks);
>  opp_cleanup:
> -       if (msm_host->has_opp_table)
> -               dev_pm_opp_of_remove_table(&pdev->dev);
> +       dev_pm_opp_of_remove_table(&pdev->dev);
> +opp_put_clkname:
>         dev_pm_opp_put_clkname(msm_host->opp_table);
>  bus_clk_disable:
>         if (!IS_ERR(msm_host->bus_clk))
> @@ -2474,8 +2471,7 @@ static int sdhci_msm_remove(struct platform_device *pdev)
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
