Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA92142AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 13:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgATMaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 07:30:55 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34542 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgATMax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 07:30:53 -0500
Received: by mail-vs1-f68.google.com with SMTP id g15so18831960vsf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 04:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ytGdwpcZgz+l1IsVkcphclobVWDkaAqfesVy/sJ81w=;
        b=CjOuG5Fr+IfSBMB7vcLkYCgIGbVypeHGBgKc3xtoTVaagiJO9+xYneiK79TwTsAgZA
         Rp3XrhE4vF/hdgKQtqfE5SOfEWGJytqg9Z/rCu1w+ccWrkJ4e9YJ1HJ5PGjDOnD9p0WM
         7B8DceH4GH3jJH5BzHsikq+q7Hj0h5fvM8+71ZloKh5TWhG/+enIXs/7OtQumgoZXsac
         5PefUSumrvmMhRLsVd1AHSrevlfmrjI1Lqk+qyV5VhTneVwgJf1CNMUSc44UDRfRCHd1
         /Bp57GAko/jZtyX9O4kp1XcaQyxmEsVsNFOoLMOslOUFiFzDhG0vcrBoBhWaJ45UPQO0
         WtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ytGdwpcZgz+l1IsVkcphclobVWDkaAqfesVy/sJ81w=;
        b=Lbq5+WT1xsoOSQXbkQ3ZtpgnP9GjNHQN0lGGdNukZXqGQATvIrkDlTo7qR3uc7cCms
         N+kWhtOvgBS05uax/Whgz+HXcFYNVKjPjsMQ4ZWiYhyqh2CYLjLVHukrsi8Oecw0ZcL3
         HKyhZowMIr6+xy16JPKWxcATfZ6F+GHJ3cE2wl2jMyKxQulD+VCq83USlSloEwS74yyv
         3PmndLOtcIPjYPGM84S/qDpO0jpJ413Yg9FngYG2tY2AK7+bdKKcfxUux0QIjNBGrXlr
         7kiXljIMDqeADt9fQN/IkQ+9QrFjLxL2lTCeG5KVGoRNas3QX8lJCk4/rsHUy5VzNa4R
         vjWw==
X-Gm-Message-State: APjAAAXdOPLSajwThm3GX0GLgF9yaQm9tXmhOa0skYh3NmTD1M2YT+YE
        aVTnhgLR+DLsF7HIAnjmmV9hX8Fdb+Njwx6cEdv/og==
X-Google-Smtp-Source: APXvYqx/32gaJjwq5JIgE16xycMPDYZWG/VspqgyqiJHUQuPr95p1nuRKfWvhqO/K6or8mMLp1RJQH2QBU5UIqTx3Qw=
X-Received: by 2002:a67:e9da:: with SMTP id q26mr12201344vso.34.1579523450926;
 Mon, 20 Jan 2020 04:30:50 -0800 (PST)
MIME-Version: 1.0
References: <1579194192-7942-1-git-send-email-vbadigan@codeaurora.org> <1579194192-7942-3-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1579194192-7942-3-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Jan 2020 13:30:13 +0100
Message-ID: <CAPDyKFpOtW5ZkFEhamCLPNsD-ECH1c1gERzMwT5MRMWc_9q_OQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Add CQHCI support for sdhci-msm
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        BOUGH CHEN <haibo.chen@nxp.com>,
        Takao Orito <orito.takao@socionext.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Jan 2020 at 18:05, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> From: Ritesh Harjani <riteshh@codeaurora.org>
>
> This adds CQHCI support for sdhci-msm platforms.
>
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig     |   1 +
>  drivers/mmc/host/sdhci-msm.c | 133 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 133 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index d06b2df..7f2ae59 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -501,6 +501,7 @@ config MMC_SDHCI_MSM
>         depends on ARCH_QCOM || (ARM && COMPILE_TEST)
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
> +       select MMC_CQHCI
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           support present in Qualcomm SOCs. The controller supports
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3d0bb5e..0b4d01f 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>
>  #include "sdhci-pltfm.h"
> +#include "cqhci.h"
>
>  #define CORE_MCI_VERSION               0x50
>  #define CORE_VERSION_MAJOR_SHIFT       28
> @@ -122,6 +123,10 @@
>  #define msm_host_writel(msm_host, val, host, offset) \
>         msm_host->var_ops->msm_writel_relaxed(val, host, offset)
>
> +/* CQHCI vendor specific registers */
> +#define CQHCI_VENDOR_CFG1      0xA00
> +#define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
> +
>  struct sdhci_msm_offset {
>         u32 core_hc_mode;
>         u32 core_mci_data_cnt;
> @@ -1567,6 +1572,127 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>         __sdhci_msm_set_clock(host, clock);
>  }
>
> +/*****************************************************************************\
> + *                                                                           *
> + * MSM Command Queue Engine (CQE)                                            *
> + *                                                                           *
> +\*****************************************************************************/
> +
> +static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
> +{
> +       int cmd_error = 0;
> +       int data_error = 0;
> +
> +       if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
> +               return intmask;
> +
> +       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       return 0;
> +}
> +
> +void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +       unsigned long flags;
> +       u32 ctrl;
> +
> +       /*
> +        * When CQE is halted, the legacy SDHCI path operates only
> +        * on 16-byte descriptors in 64bit mode.
> +        */
> +       if (host->flags & SDHCI_USE_64_BIT_DMA)
> +               host->desc_sz = 16;
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +
> +       /*
> +        * During CQE command transfers, command complete bit gets latched.
> +        * So s/w should clear command complete interrupt status when CQE is
> +        * either halted or disabled. Otherwise unexpected SDCHI legacy
> +        * interrupt gets triggered when CQE is halted/disabled.
> +        */
> +       ctrl = sdhci_readl(host, SDHCI_INT_ENABLE);
> +       ctrl |= SDHCI_INT_RESPONSE;
> +       sdhci_writel(host,  ctrl, SDHCI_INT_ENABLE);
> +       sdhci_writel(host, SDHCI_INT_RESPONSE, SDHCI_INT_STATUS);
> +
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +       sdhci_cqe_disable(mmc, recovery);
> +}
> +
> +static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
> +       .enable         = sdhci_cqe_enable,
> +       .disable        = sdhci_msm_cqe_disable,
> +};
> +
> +static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
> +                               struct platform_device *pdev)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct cqhci_host *cq_host;
> +       bool dma64;
> +       u32 cqcfg;
> +       int ret;
> +
> +       /*
> +        * When CQE is halted, SDHC operates only on 16byte ADMA descriptors.
> +        * So ensure ADMA table is allocated for 16byte descriptors.
> +        */
> +       if (host->caps & SDHCI_CAN_64BIT)
> +               host->alloc_desc_sz = 16;
> +
> +       ret = sdhci_setup_host(host);
> +       if (ret)
> +               return ret;
> +
> +       cq_host = cqhci_pltfm_init(pdev);
> +       if (IS_ERR(cq_host)) {
> +               ret = PTR_ERR(cq_host);
> +               dev_err(&pdev->dev, "cqhci-pltfm init: failed: %d\n", ret);
> +               goto cleanup;
> +       }
> +
> +       msm_host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
> +       cq_host->ops = &sdhci_msm_cqhci_ops;
> +
> +       dma64 = host->flags & SDHCI_USE_64_BIT_DMA;
> +
> +       ret = cqhci_init(cq_host, host->mmc, dma64);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s: CQE init: failed (%d)\n",
> +                               mmc_hostname(host->mmc), ret);
> +               goto cleanup;
> +       }
> +
> +       /* Disable cqe reset due to cqe enable signal */
> +       cqcfg = cqhci_readl(cq_host, CQHCI_VENDOR_CFG1);
> +       cqcfg |= CQHCI_VENDOR_DIS_RST_ON_CQ_EN;
> +       cqhci_writel(cq_host, cqcfg, CQHCI_VENDOR_CFG1);
> +
> +       /*
> +        * SDHC expects 12byte ADMA descriptors till CQE is enabled.
> +        * So limit desc_sz to 12 so that the data commands that are sent
> +        * during card initialization (before CQE gets enabled) would
> +        * get executed without any issues.
> +        */
> +       if (host->flags & SDHCI_USE_64_BIT_DMA)
> +               host->desc_sz = 12;
> +
> +       ret = __sdhci_add_host(host);
> +       if (ret)
> +               goto cleanup;
> +
> +       dev_info(&pdev->dev, "%s: CQE init: success\n",
> +                       mmc_hostname(host->mmc));
> +       return ret;
> +
> +cleanup:
> +       sdhci_cleanup_host(host);
> +       return ret;
> +}
> +
>  /*
>   * Platform specific register write functions. This is so that, if any
>   * register write needs to be followed up by platform specific actions,
> @@ -1731,6 +1857,7 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>         .set_uhs_signaling = sdhci_msm_set_uhs_signaling,
>         .write_w = sdhci_msm_writew,
>         .write_b = sdhci_msm_writeb,
> +       .irq    = sdhci_msm_cqe_irq,
>  };
>
>  static const struct sdhci_pltfm_data sdhci_msm_pdata = {
> @@ -1754,6 +1881,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         u8 core_major;
>         const struct sdhci_msm_offset *msm_offset;
>         const struct sdhci_msm_variant_info *var_info;
> +       struct device_node *node = pdev->dev.of_node;
>
>         host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>         if (IS_ERR(host))
> @@ -1952,7 +2080,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         pm_runtime_use_autosuspend(&pdev->dev);
>
>         host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
> -       ret = sdhci_add_host(host);
> +       if (of_property_read_bool(node, "supports-cqe"))
> +               ret = sdhci_msm_cqe_add_host(host, pdev);
> +       else
> +               ret = sdhci_add_host(host);
>         if (ret)
>                 goto pm_runtime_disable;
>         sdhci_msm_set_regulator_caps(msm_host);
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
