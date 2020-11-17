Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129212B5EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 12:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgKQLuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 06:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKQLuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 06:50:51 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C598C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 03:50:50 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id h185so82208vsc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 03:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rT4v1DVikUpfEXtE7oPEUWFVvDoE3ZWoDR+gAa6bjgI=;
        b=ddv2LYC2CUQ1W34byoZMPmdiQPbzEP6XccuQwMQL0H1Bv8MYrqPUtBqspfPrSLmvEU
         1Gqd6IvGGKtMNxIyTsCL6qqYrQzOv30neUM7HiPb8G+EXbCggyf/0lWgVLCI5/W+4bq5
         /N495VFQv4mLafx+8M8s5xB8Br7Gi55dJZz2SI3kHD723dQc47wj8uR0u93+ZiQyYfc6
         61CnMnZLoL3/IDGgy+bFbdqL/wShDZbuCfaXDmyOcr6xnjZiCdaKa1laNPw5ajTBJyfo
         yyD/uO/akbVo2yoUwm0G1lpkqbjJC6nzWbOiRmfkTJDBQsut2v3rlPrPvlVmB8Ip9J8v
         L8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rT4v1DVikUpfEXtE7oPEUWFVvDoE3ZWoDR+gAa6bjgI=;
        b=bcQmOQFs6t2PD2fM5S9REpk3mMLeTBuV9fwarjaAr+g4v5xDJpwG2bfJWAwwfBlu1K
         +/fLcRyZxiCGk46qmwoZ9FBKy7mDyxZLi5KZv5+92uZvw4kPnAmaYFo8hrVq5ym6Btbd
         jYG5pxeIEAYKeoa/tAwCb3HZyPLg3nZa0KfFCaaNo6knqrznwvmiSG0KCPRYXxXosxIV
         DYEzhUmVbUJGpkUd7jlV8RmiQk/mPRRbYwIqNzym07trewDBHpR2FVzMeoFcTVSIhMsp
         VY6LbLlf4KM50IfegVcD7nivRo+ofwkRk+9L4zpEhMSMp4ZEOM3kKbmJ5+jrIDa6Vszn
         UQyA==
X-Gm-Message-State: AOAM5336IAWFoAVACRVRqPVaDhNVxAp1xkWRPOYO5ADnCIp+KGiomdsw
        /3g3g4FQE9gcDPH8hyixgo4GSOK25VXJOPYIkWU2iQ==
X-Google-Smtp-Source: ABdhPJyo9RaTCIgqbWCf41+YcbrGBJnW3mhsg+ZsyHKINFY21x8p8zL06l5fhC9X14zOvhUVwObqg4lvInLzFajms+4=
X-Received: by 2002:a67:310d:: with SMTP id x13mr11441505vsx.19.1605613849848;
 Tue, 17 Nov 2020 03:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20201112173636.360186-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201112173636.360186-1-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 17 Nov 2020 12:50:13 +0100
Message-ID: <CAPDyKFqHdDetWXUoSRGBHqmjzsFjfqNrXE=Z594+CHuOPhqgtQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-msm: detect if tassadar_dll is used by
 using core version
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Nov 2020 at 18:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Detect if tassadar_dll is required by using core version rather than
> just specifying it in the sdhci_msm_variant_info.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-msm.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3451eb325513..9c7927b03253 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -248,7 +248,6 @@ struct sdhci_msm_variant_ops {
>  struct sdhci_msm_variant_info {
>         bool mci_removed;
>         bool restore_dll_config;
> -       bool uses_tassadar_dll;
>         const struct sdhci_msm_variant_ops *var_ops;
>         const struct sdhci_msm_offset *offset;
>  };
> @@ -2154,18 +2153,10 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
>         .offset = &sdhci_msm_v5_offset,
>  };
>
> -static const struct sdhci_msm_variant_info sm8250_sdhci_var = {
> -       .mci_removed = true,
> -       .uses_tassadar_dll = true,
> -       .var_ops = &v5_var_ops,
> -       .offset = &sdhci_msm_v5_offset,
> -};
> -
>  static const struct of_device_id sdhci_msm_dt_match[] = {
>         {.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
>         {.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
>         {.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
> -       {.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
>         {.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
>         {},
>  };
> @@ -2249,7 +2240,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         msm_host->restore_dll_config = var_info->restore_dll_config;
>         msm_host->var_ops = var_info->var_ops;
>         msm_host->offset = var_info->offset;
> -       msm_host->uses_tassadar_dll = var_info->uses_tassadar_dll;
>
>         msm_offset = msm_host->offset;
>
> @@ -2396,6 +2386,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         if (core_major == 1 && core_minor >= 0x49)
>                 msm_host->updated_ddr_cfg = true;
>
> +       if (core_major == 1 && core_minor >= 0x71)
> +               msm_host->uses_tassadar_dll = true;
> +
>         ret = sdhci_msm_register_vreg(msm_host);
>         if (ret)
>                 goto clk_disable;
> --
> 2.28.0
>
