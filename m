Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F02221B0D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 09:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgGJH6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 03:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgGJH6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 03:58:47 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2441C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 00:58:47 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id e15so2508733vsc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Diu8FPSk0YQQ/9KsIVHjWkR640rhqQzr3+RMJoJoM1g=;
        b=gizcXlckz2M67ld6mSAeGM1bMlmeOkCCvNRWT7Vxi1AEXDbep0iGhPQoPlPyNipDCo
         rDanyYCfqFnKRZVMrCKD+Q/KOeIV0SPfpteq76Qp607FT9oVWpG0vnZ5n3ev5Ih979p0
         Q8kTOQ8m1JPR1WjyTUWGZaPzoRByowv73z17YAf5lItx0pNj7dNwxJuwHtMWXc81uSdV
         2JExDCRtZHvk35n6+Is1Gd/whndlmF3a86z+GMgwSMgfm6CAxnOYvENB8qU8bHiP9MAF
         5bU1xVX02rEFo1o4ntyxe6ndnQRMHh7dBGHhqEtqp70zk5VJ4/tAKZ8CdyRKACRpuUWZ
         zKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Diu8FPSk0YQQ/9KsIVHjWkR640rhqQzr3+RMJoJoM1g=;
        b=cBBCkVDUadXbdh/McsXUtF3rBXOOBIBgOgsOaO5g01O+OlpjoOnifPWgJUYyOcZcwN
         K05cVgAev536JL/5bsqjGICKqjBLWclk/1bg4LWfFBjJzbFukCJI4rI7jwDX+LWjLj7d
         G0UtuCXYS9riTWM6jwuRw/3vZEcZF6Hll20jA17W+r6r511Gv15JcXl+wFLwTK7VGloa
         eHL387KY7INtKd07w5sxouz7ugWs2rGoAM62yBmt5Re6+ICC8HAJD4hiB6GeoeoP5vYL
         Vbtfx73uu/d6NPGBYEyZI9wEUPbd8ITG/b+9dxyw8zvWLq3me2P7tp8JVtmW1U2fGrZg
         C0NQ==
X-Gm-Message-State: AOAM533+ZfGRmrnwKDJGcWHhNboH1Xb8azAgUn4oup+oH3Q2F88o3oAz
        mPBKe5cUGsiobYgeA8dIEH09mbnXypgRQ0KWt+HmQQ==
X-Google-Smtp-Source: ABdhPJxPYSpMEhKAbJpUN77i+R+I1788d/Ems0i5GSKwTLANWpFKgAUr6sQNT4PO8IlvGncOYNGftRvmLJTjgk/y7ts=
X-Received: by 2002:a05:6102:22f3:: with SMTP id b19mr4543062vsh.191.1594367926935;
 Fri, 10 Jul 2020 00:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <1594300408-17658-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1594300408-17658-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 10 Jul 2020 09:58:10 +0200
Message-ID: <CAPDyKFqYqxA76zh0qdfcJuGb8x7QcbBGYoubXF5STqhPdWjGmQ@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: sdhci: Fix potential null pointer access while
 accessing vqmmc
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vijay Viswanath <vviswana@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Jul 2020 at 15:13, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> Don't access vqmmc regulator handler, if it's already invalidated.
>
> Fixes: f870b6d480d3 (mmc: sdhci: Allow platform controlled voltage switching)
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index e6275c2202b0..d3b62fc5c661 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4383,11 +4383,6 @@ int sdhci_setup_host(struct sdhci_host *host)
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>                 if (enable_vqmmc) {
>                         ret = regulator_enable(mmc->supply.vqmmc);
> -                       if (ret) {
> -                               pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
> -                                       mmc_hostname(mmc), ret);
> -                               mmc->supply.vqmmc = ERR_PTR(-EINVAL);
> -                       }
>                         host->sdhci_core_to_disable_vqmmc = !ret;
>                 }
>
> @@ -4402,6 +4397,13 @@ int sdhci_setup_host(struct sdhci_host *host)
>                 if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 2700000,
>                                                     3600000))
>                         host->flags &= ~SDHCI_SIGNALING_330;
> +
> +               if (ret) {
> +                       pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
> +                               mmc_hostname(mmc), ret);
> +                       mmc->supply.vqmmc = ERR_PTR(-EINVAL);
> +               }
> +
>         }
>
>         if (host->quirks2 & SDHCI_QUIRK2_NO_1_8_V) {
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>
