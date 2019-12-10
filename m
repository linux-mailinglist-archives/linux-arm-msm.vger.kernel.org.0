Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A1E118418
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 10:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfLJJvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 04:51:50 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38325 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfLJJvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 04:51:49 -0500
Received: by mail-vs1-f68.google.com with SMTP id y195so12569624vsy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cBbBEnPUIIoW2OTGVU3g0EnMYCU75p2JMvnnrLqCOyA=;
        b=TDIBXQbaiBCARQwCl+GxHekTgJMIj4Gx6RVVCVV0k2Gkg/7F5iss0Bu6hy3g1XXUCi
         xvL+9lss/j/EfuGHgJZs9MLCHCL+uSx3jhjBN4w2uTjZw3Gorz6R/Kce5+SAFpr2llCo
         1ECz79V7wYJbeKYrqxY0PnIKYwmBi3GayhduI6pOe5KYpRPsVqJCthFG1ZtoPzxccWkm
         VNf0bCZQjSYJCVv2KmMttgTt3TST9rTBNP3Jp1vOoVxqa/ehjaso9JxYGPcg2+mH/0m1
         9KDwgGUVTMATlT2TtcZC43JBPqmjwuYtSvxWH/l+JWuD9AHaVk4eZp5FfGf72MzZzGpG
         whKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBbBEnPUIIoW2OTGVU3g0EnMYCU75p2JMvnnrLqCOyA=;
        b=At0cQf9BHMcvAuv0hvPWfbZggg81eecjlcwkP+w7ez8HIWQLl9Li5Um31cl20HcE3Q
         /UEOTt/8vEz6QXftJaCv548ZvsLWVLbPLoaHWK3Lok/QQf0btsY21RXMVUXfKdzINgU+
         IJbWNxoddZlVBwLpucDaaA1NYgX1LO9gJ26owBeNzPzmuASM4BKVHXH3VTAwdrn0PUXo
         yDTr7exmkSIgxxI/zK9XYp/+QV1JxmeEvzOZmWbMLZ4Aby5gkMNMbh+S2Mxjg12zyYIi
         YY9fY4CzJDY+dZoeOz8MMQasGIWqMeivy+o5yDkRehckf9VzUTeaPEx1o2kkfzOOiNkX
         DlFw==
X-Gm-Message-State: APjAAAWf2TquLz5WjglWiXMeBnVm6/AcyAmpZz5dXxjddmppTXwq6qQU
        Hl8yDY7dQvFxj+/BV7tmklbhmpZVpVAxwiqEXRypGg==
X-Google-Smtp-Source: APXvYqy0tPcfRrPqUT+wqLmJZOVLWIl9nnKy8avxTvgY9iiAaZYBwVPYvikhP55EtvU4At/IsV9f0l09cmygiEJBnoY=
X-Received: by 2002:a67:2087:: with SMTP id g129mr24103910vsg.191.1575971508490;
 Tue, 10 Dec 2019 01:51:48 -0800 (PST)
MIME-Version: 1.0
References: <0101016ea738eb52-8c362755-205a-4383-9181-1a867e82eeed-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ea738eb52-8c362755-205a-4383-9181-1a867e82eeed-000000@us-west-2.amazonses.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Dec 2019 10:51:12 +0100
Message-ID: <CAPDyKFqdFc1RMNu38d7b+s2Bpr49v-w18frGsPSxsYf924HLWg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Correct the offset and value for
 DDR_CONFIG register
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Nov 2019 at 11:19, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> The DDR_CONFIG register offset got updated after a specific
> minor version of sdcc V4. This offset change has not been properly
> taken care of while updating register changes for sdcc V5.
>
> Correcting proper offset for this register.
> Also updating this register value to reflect the recommended RCLK
> delay.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

I have applied this for fixes, however it seems like this should also
be tagged for stable, right?

Is there a specific commit this fixes or should we just find the
version it applies to?


Kind regards
Uffe



> ---
>  drivers/mmc/host/sdhci-msm.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b75c82d..3d0bb5e 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -99,7 +99,7 @@
>
>  #define CORE_PWRSAVE_DLL       BIT(3)
>
> -#define DDR_CONFIG_POR_VAL     0x80040853
> +#define DDR_CONFIG_POR_VAL     0x80040873
>
>
>  #define INVALID_TUNING_PHASE   -1
> @@ -148,8 +148,9 @@ struct sdhci_msm_offset {
>         u32 core_ddr_200_cfg;
>         u32 core_vendor_spec3;
>         u32 core_dll_config_2;
> +       u32 core_dll_config_3;
> +       u32 core_ddr_config_old; /* Applicable to sdcc minor ver < 0x49 */
>         u32 core_ddr_config;
> -       u32 core_ddr_config_2;
>  };
>
>  static const struct sdhci_msm_offset sdhci_msm_v5_offset = {
> @@ -177,8 +178,8 @@ struct sdhci_msm_offset {
>         .core_ddr_200_cfg = 0x224,
>         .core_vendor_spec3 = 0x250,
>         .core_dll_config_2 = 0x254,
> -       .core_ddr_config = 0x258,
> -       .core_ddr_config_2 = 0x25c,
> +       .core_dll_config_3 = 0x258,
> +       .core_ddr_config = 0x25c,
>  };
>
>  static const struct sdhci_msm_offset sdhci_msm_mci_offset = {
> @@ -207,8 +208,8 @@ struct sdhci_msm_offset {
>         .core_ddr_200_cfg = 0x184,
>         .core_vendor_spec3 = 0x1b0,
>         .core_dll_config_2 = 0x1b4,
> -       .core_ddr_config = 0x1b8,
> -       .core_ddr_config_2 = 0x1bc,
> +       .core_ddr_config_old = 0x1b8,
> +       .core_ddr_config = 0x1bc,
>  };
>
>  struct sdhci_msm_variant_ops {
> @@ -253,6 +254,7 @@ struct sdhci_msm_host {
>         const struct sdhci_msm_offset *offset;
>         bool use_cdr;
>         u32 transfer_mode;
> +       bool updated_ddr_cfg;
>  };
>
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -924,8 +926,10 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>  {
>         struct mmc_host *mmc = host->mmc;
> -       u32 dll_status, config;
> +       u32 dll_status, config, ddr_cfg_offset;
>         int ret;
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>         const struct sdhci_msm_offset *msm_offset =
>                                         sdhci_priv_msm_offset(host);
>
> @@ -938,8 +942,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>          * bootloaders. In the future, if this changes, then the desired
>          * values will need to be programmed appropriately.
>          */
> -       writel_relaxed(DDR_CONFIG_POR_VAL, host->ioaddr +
> -                       msm_offset->core_ddr_config);
> +       if (msm_host->updated_ddr_cfg)
> +               ddr_cfg_offset = msm_offset->core_ddr_config;
> +       else
> +               ddr_cfg_offset = msm_offset->core_ddr_config_old;
> +       writel_relaxed(DDR_CONFIG_POR_VAL, host->ioaddr + ddr_cfg_offset);
>
>         if (mmc->ios.enhanced_strobe) {
>                 config = readl_relaxed(host->ioaddr +
> @@ -1899,6 +1906,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>                                 msm_offset->core_vendor_spec_capabilities0);
>         }
>
> +       if (core_major == 1 && core_minor >= 0x49)
> +               msm_host->updated_ddr_cfg = true;
> +
>         /*
>          * Power on reset state may trigger power irq if previous status of
>          * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>
