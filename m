Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9D819F766
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 15:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgDFN7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 09:59:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38898 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgDFN7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 09:59:31 -0400
Received: by mail-io1-f67.google.com with SMTP id e79so6012659iof.5;
        Mon, 06 Apr 2020 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WiuMw9xp+mz0F42UsrL6QJlGqNwQFdd9t3J1yc1c128=;
        b=q9doaK/jB6bzjdiPXdM99b+qxzxFd86JnUE4lPM2p2JB/Swp2TkaXGPUs9/8Sy0l5c
         Hm/R89+F+ZJjqwLKA0hlVs5+9vJkWinSKTrElIhHFNwWgudRJgtu3CAGAC2lAij+MAqY
         KEjOV7kThMttPa9yFWO6204IuptO208FPDtYuS8bAiX1Zera0q9dyX9LQfjFtbWX8269
         cKtZ60zpE+EMBatUc//2ApK/bqTWJg54i21O7Rsm+DXndSYVzAEJWSQ7nFhvyGkGXLav
         Y8J72h1H+8zS3zQBfHmBCcNKT8aZv1ztlOle5VIZd17SY6jNMz/UBsRS6aAmJgq4QRog
         S81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WiuMw9xp+mz0F42UsrL6QJlGqNwQFdd9t3J1yc1c128=;
        b=D1PNK0TQ09x58UEVRalWTC67zyOCkkiKuGXe1VxqR/IF4IDj6rPCneqK/pmzAbC+a8
         ZILLdZGRMxC5izCZbwqTNXNK8ScKsuL2bIsDGPhwQc0Gb3yvuyxkya/eVyVNLL0gCpnu
         BrL90XASA/086vz0bSZLHLGqZWay3iDifGJBzjHbft8jguqPWSCfxS815pXyQJwtrHHj
         NLfNLqui3XGKL53228MVj6FFOhcnRdx9xv2oY5G9lTOIWlWHULhmRn4b2w0H3WH+GsMf
         b2R4hJw3DD9o2Q7QzBCCU2OyOCAwn0+hddSiotVfGhnp9Alun1kqk1rNdHwTpUSnxoGP
         oPhw==
X-Gm-Message-State: AGi0PubasEdDS8n6ZR76qkIrU2ZavF3uirf0/9hS5Rp4fHjRWmFF0gmr
        95UQcSwqBfFeexh12EARfYLjUkhh/IHyo65XT1c=
X-Google-Smtp-Source: APiQypKtgDkzu/faGibQ6B724sQtNeNo6BF+zpyGWrRWohntvwo9hrBSntu3RhE1re6zf7ZfhNSGrnVqR5/HJVoHlDs=
X-Received: by 2002:a05:6638:120c:: with SMTP id n12mr21231145jas.32.1586181568036;
 Mon, 06 Apr 2020 06:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com> <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
From:   Alan Cooper <alcooperx@gmail.com>
Date:   Mon, 6 Apr 2020 09:59:16 -0400
Message-ID: <CAOGqxeUjx+OWRhwWznk-uHZ9op7WTZaAGq6xd4Z4QdL+Hja2yA@mail.gmail.com>
Subject: Re: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc:     mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        kernel-team@android.com,
        ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        DTML <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 6, 2020 at 5:28 AM Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> CQE bindings "supports-cqe" and "disable-cqe-dcmd" is parsed
> in mmc_of_parse(). Remove vendor code which parses CQE bindings,
> and use mmc_host->caps2 to decide support CQE or not.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/mmc/host/sdhci-brcmstb.c   | 11 ++++++-----
>  drivers/mmc/host/sdhci-msm.c       |  3 +--
>  drivers/mmc/host/sdhci-of-arasan.c |  3 ---
>  drivers/mmc/host/sdhci-tegra.c     |  2 +-
>  4 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index ad01f64..07c90c6 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -247,10 +247,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>                 return res;
>
>         memset(&brcmstb_pdata, 0, sizeof(brcmstb_pdata));
> -       if (device_property_read_bool(&pdev->dev, "supports-cqe")) {
> -               has_cqe = true;
> -               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;

The above line that sets the irq was moved to later in the function,
but needs to come before sdhci_pltfm_init()

Al

> -       }
>         brcmstb_pdata.ops = match_priv->ops;
>         host = sdhci_pltfm_init(pdev, &brcmstb_pdata,
>                                 sizeof(struct sdhci_brcmstb_priv));
> @@ -261,7 +257,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>
>         pltfm_host = sdhci_priv(host);
>         priv = sdhci_pltfm_priv(pltfm_host);
> -       priv->has_cqe = has_cqe;
>
>         /* Map in the non-standard CFG registers */
>         iomem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> @@ -276,6 +271,12 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>         if (res)
>                 goto err;
>
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +               has_cqe = true;
> +               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
> +       }
> +       priv->has_cqe = has_cqe;
> +
>         /*
>          * If the chip has enhanced strobe and it's enabled, add
>          * callback
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..fbb2f57 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1880,7 +1880,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         u8 core_major;
>         const struct sdhci_msm_offset *msm_offset;
>         const struct sdhci_msm_variant_info *var_info;
> -       struct device_node *node = pdev->dev.of_node;
>
>         host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>         if (IS_ERR(host))
> @@ -2076,7 +2075,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         pm_runtime_use_autosuspend(&pdev->dev);
>
>         host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
> -       if (of_property_read_bool(node, "supports-cqe"))
> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
>                 ret = sdhci_msm_cqe_add_host(host, pdev);
>         else
>                 ret = sdhci_add_host(host);
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index e49b44b..359eff6 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1281,9 +1281,6 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
>                                         sdhci_arasan_voltage_switch;
>                 sdhci_arasan->has_cqe = true;
>                 host->mmc->caps2 |= MMC_CAP2_CQE;
> -
> -               if (!of_property_read_bool(np, "disable-cqe-dcmd"))
> -                       host->mmc->caps2 |= MMC_CAP2_CQE_DCMD;
>         }
>
>         ret = sdhci_arasan_add_host(sdhci_arasan);
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 403ac44..d09abdd 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -715,7 +715,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
>
> -       if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
>                 tegra_host->enable_hwcq = true;
>         else
>                 tegra_host->enable_hwcq = false;
> --
> 1.9.1
