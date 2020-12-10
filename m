Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B752D6957
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393948AbgLJVEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393942AbgLJVEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:04:08 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9FEC061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:03:28 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 11so5300282pfu.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=T2P3DlcWN55SD3X5e5s1IbMPU4HzdbItsvShaGGY6/8=;
        b=O9dIcolmPk2h9eYxo2k94OieRWmIlIoAupo8FNGpGIY//eiN6t/yojHZwuXhowYVx+
         DoLcn+ZhyqNXk3JhmVo0hmGVLJUxm2LipT2vykNFRxEnMmztGwmPd/CK7Nv9i3pV99ig
         UbtHbe2Iq/eI7Vko3gAoVAZ3QrLGDV/M/+frs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=T2P3DlcWN55SD3X5e5s1IbMPU4HzdbItsvShaGGY6/8=;
        b=FfMZmsaTyj572avDCRz+8jwtgM4q2St5d7bUg0CGiA8lROSX0uLalJQnBrhX4VCvXm
         Fwbu3Yx475lxrUa4T8CQAWMI5DS07WFnpbQeZuAhZw1BwSsVYtGkXjKLKTAR4b9+IWvo
         gFzrDTk6Hb6NiWSVlKrxD2woEXTXVMc1ULeyh1A4Vh13Mo9UiAjDz6mTJ00sErQCHx2N
         dn2wg/4gAc2GYUNkVaKrHX/DPhvC+iTR8acp4SHJNPq3rE50NqdaPUaEreT8Y0tAxtNY
         kphxtII4R/iuu8vRIsfVx+BqZtB1OJ4A4XvRSaOPaLkMgsGLj7DOPaYkMfO9p5+s+bhp
         yRGw==
X-Gm-Message-State: AOAM530MLwwDPwuPNZBWG0xCZWmjnGeBT6kMZXlAZWiTUwerX5WMRYDO
        WaIL27l2SIAX2cr3rRS173HK2Q==
X-Google-Smtp-Source: ABdhPJxx1i9bIXMbpjGRg9li1/UDCps7h6j1P9QtAEqOIDx19avmfbsKk8eDtvBC+zLKGBTQhutTTA==
X-Received: by 2002:a63:ad4a:: with SMTP id y10mr8173837pgo.176.1607634207930;
        Thu, 10 Dec 2020 13:03:27 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e3sm6877068pfe.154.2020.12.10.13.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:03:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210125709.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
References: <20201210125709.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
Subject: Re: [PATCH] mmc: sdhci-msm: Warn about overclocking SD/MMC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     vbadigan@codeaurora.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
To:     Adrian Hunter <adrian.hunter@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 10 Dec 2020 13:03:25 -0800
Message-ID: <160763420585.1580929.9586717907613124743@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-10 12:57:25)
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3451eb325513..dd41f6a4dbfb 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -353,6 +353,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sd=
hci_host *host,
>         struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
>         struct mmc_ios curr_ios =3D host->mmc->ios;
>         struct clk *core_clk =3D msm_host->bulk_clks[0].clk;
> +       unsigned int achieved_rate;

unsigned long?

>         int rc;
> =20
>         clock =3D msm_get_clock_rate_for_bus_mode(host, clock);
> @@ -363,6 +364,17 @@ static void msm_set_clock_rate_for_bus_mode(struct s=
dhci_host *host,
>                        curr_ios.timing);
>                 return;
>         }
> +
> +       /*
> +        * Qualcomm clock drivers by default round clock _up_ if they can=
't
> +        * make the requested rate.  This is not good for SD.  Yell if we
> +        * encounter it.
> +        */
> +       achieved_rate =3D clk_get_rate(core_clk);
> +       if (achieved_rate > clock)
> +               pr_warn("%s: Card appears overclocked; req %u Hz, actual =
%d Hz\n",

Can we use dev_warn?

dev_warn(mmc_dev(mmc)
dev_warn(&msm_host->pdev->dev

?

> +                       mmc_hostname(host->mmc), clock, achieved_rate);
> +
>         msm_host->clk_rate =3D clock;
>         pr_debug("%s: Setting clock at rate %lu at timing %d\n",
>                  mmc_hostname(host->mmc), clk_get_rate(core_clk),

This could use achieved_rate now.
