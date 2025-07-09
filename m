Return-Path: <linux-arm-msm+bounces-64250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A29AFEB63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D09091C87BFC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEF62E764D;
	Wed,  9 Jul 2025 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swKSevdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431BE2E7640
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069780; cv=none; b=EDivVS2mIFlU4MfB/xY5uCPzo5k/TKP6LLw4IeBmfVSFnbyXY3jwHTlra9wWJvU/y901o0B0gwi3goPyf3FvL9BhbZFfldaDMX9cqi+p/YsmhQv9SmtKVd4ex5vQ99h4wXBMWfrGc4YZ3ZuKD5lEE0fnmpjU5WdE9PdUqp5+k6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069780; c=relaxed/simple;
	bh=8ab465XL8RGJp2xwiNdST7psmhAqO4d1Mew5u/WfDXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyupXySZnTmwPAJtj+u1RCEO/cjnEKZqSZV18HssbS5TskybSPbIgh6PoofuPixmVVNezBdxWNEZ2cTBEnQ4rulfOx6mDMLt3rfvTHZFibeSI0AF2SiKbWbmooZApdelXTCQ7L8vjohDxYGOhvguM8GrHNvbp9YfesB8Rr7i0v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swKSevdC; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e1d8c2dc2so48968947b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752069777; x=1752674577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=;
        b=swKSevdCKyNFlX+iIPvi26Ju1UGrU8LxNf86oNwLRPtHY4MX3SH4wBPCF6JiSG5xkd
         98VDL0n3bgY+Z9smjEOMHqmA+I1Yo+6p3+tn7lzz4p4T/27KGD6PewX6Pmm8+Pc6+Mpa
         Y4CP7YpQ7v5+99ZQlfwIWq5Exi1BWa2/bXa3J0GQfoCveE6ToZBJ+KNR+eEQ53KJjLlx
         5xvIZclBGj8TL53T4p2jHNSKsEeRX/qlLDLJY5gL5Sy+2ewwLuc7KmjCXJac/QH7nSIN
         Q+YZ70Q4SFWsZswnhDiDvmjHcnFxxVgW1EjXbnztY9calqNI3jZq8QDCWhD7D6NPf6Pp
         Ykmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752069777; x=1752674577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=;
        b=dRh5S0vX6G1+a5F+kqtW68/mH2UvBJeTkHIrjP9MSQ53KwtKJaIkJ9ehz5bMhvIWts
         8kFXMwJb9tyC7cGPGVczIMtxQNKHv82xoX/MHHn1VCJZIbAci0gl77h9DrNGnfgG8aXt
         tIFwF9GcatWUr/VnwLhJGN4TRKnXsjzH2yVMr+MkJLgGjgd2Ei08vql96tpPdJAVUnTx
         n8w4BdqUGdN6/RvMZRv5qBTedEUF4R5K8NyWF/9Iwawtm4kpWhgQGyirwJf497mBegCD
         RwpHY9hhOpkbbm3PbH3l41GCGHA8EYgYYRmAeTLRONAjdLJmX8t/Gc0N/yshPTtHEIfz
         qvuA==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZEmp0MWcc46PfmHbZl8V5Y03DZcAqJ1EGmQn/SI5G8Ql38r2i6iCPh+3tYwQYOHLzSGcZy2fHV/gZLOi@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGpnxSfdHp0qBBem0iI4Yr50fMi6/A/Qi1ns6KQxSwPFk41H5
	eN0FCUDhd8Q6n72tjiUnkKiPiI0ORUBd1lF1cJu8Z9+FP7l1THjmpExU1Kb4VvetTqGFDb2hBZs
	uxaPVU2IBn1R4qote+XCeBXyJE9c/XXgRKpzkxD280A==
X-Gm-Gg: ASbGnctUXeEk0PvJHfIIjSjoUxikl6Inxmkxa3xB1KtUYxO+E2WV9YdjFAF2I5AWmrX
	I0QGz3Lgneo0iDImWdDEt/ULgIPXLYk6dTeaPqGNgRNBzIu9WJBShEdNtt9Djg7dytzbCMo9khu
	0boTl6W9dkzfSbP7MyrlmJJfDNlmjrQnZnMpghfjOlGsDa
X-Google-Smtp-Source: AGHT+IFtWA8c7PWFxCFRls9OTwmIX50KvZ84tz29XCIMOswJWdVGY+cHCZiaI7O65CCj8j+BQ/aRqyiXkvmlO0NA56I=
X-Received: by 2002:a05:690c:9c09:b0:70e:2d17:84b5 with SMTP id
 00721157ae682-717b13bf817mr39839927b3.0.1752069776636; Wed, 09 Jul 2025
 07:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 16:02:20 +0200
X-Gm-Features: Ac12FXwuMSAHr6sQzvdlqPxk0AdX5s1c2M_fF3m8uP0HMwMi2plFNm-Wc6CWOgg
Message-ID: <CAPDyKFp+aBO9XTmvBYGj4bcL9BW26LCZb9O=6nstj29zctHi6A@mail.gmail.com>
Subject: Re: [PATCH 44/80] mmc: Remove redundant pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Russell King <linux@armlinux.org.uk>, Adrian Hunter <adrian.hunter@intel.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Avri Altman <avri.altman@sandisk.com>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	imx@lists.linux.dev, s32@nxp.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 09:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I have pulled in pm-runtime-6.17-rc1 and applied the $subject patch
for next, thanks!

Kind regards
Uffe


> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
>
>  drivers/mmc/core/core.c            | 1 -
>  drivers/mmc/host/atmel-mci.c       | 2 --
>  drivers/mmc/host/mmci.c            | 1 -
>  drivers/mmc/host/omap_hsmmc.c      | 3 ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 -
>  drivers/mmc/host/sdhci-msm.c       | 1 -
>  drivers/mmc/host/sdhci-omap.c      | 2 --
>  drivers/mmc/host/sdhci-pxav3.c     | 2 --
>  drivers/mmc/host/sdhci-sprd.c      | 1 -
>  drivers/mmc/host/sdhci_am654.c     | 1 -
>  drivers/mmc/host/tmio_mmc_core.c   | 1 -
>  11 files changed, 16 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a0e2dce70434..874c6fe92855 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -882,7 +882,6 @@ void mmc_put_card(struct mmc_card *card, struct mmc_ctx *ctx)
>         WARN_ON(ctx && host->claimer != ctx);
>
>         mmc_release_host(host);
> -       pm_runtime_mark_last_busy(&card->dev);
>         pm_runtime_put_autosuspend(&card->dev);
>  }
>  EXPORT_SYMBOL(mmc_put_card);
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index c885c04e938a..43f92f48590f 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -541,7 +541,6 @@ static int atmci_regs_show(struct seq_file *s, void *v)
>         memcpy_fromio(buf, host->regs, ATMCI_REGS_SIZE);
>         spin_unlock_bh(&host->lock);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         seq_printf(s, "MR:\t0x%08x%s%s ",
> @@ -2567,7 +2566,6 @@ static int atmci_probe(struct platform_device *pdev)
>         dev_info(dev, "Atmel MCI controller at 0x%08lx irq %d, %u slots\n",
>                  host->mapbase, irq, nr_slots);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index c70c64f8adc4..8367283647a9 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2082,7 +2082,6 @@ static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
>         spin_unlock_irqrestore(&host->lock, flags);
>
>         if (!enable) {
> -               pm_runtime_mark_last_busy(mmc_dev(mmc));
>                 pm_runtime_put_autosuspend(mmc_dev(mmc));
>         }
>  }
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index bf3b9f5b067c..adc0d0b6ae37 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1663,7 +1663,6 @@ static int mmc_regs_show(struct seq_file *s, void *data)
>         seq_printf(s, "CAPA:\t\t0x%08x\n",
>                         OMAP_HSMMC_READ(host->base, CAPA));
>
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>
>         return 0;
> @@ -1954,7 +1953,6 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
>         }
>
>         omap_hsmmc_debugfs(mmc);
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>
>         return 0;
> @@ -2031,7 +2029,6 @@ static int omap_hsmmc_resume(struct device *dev)
>         if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
>                 omap_hsmmc_conf_bus_power(host);
>
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 64c27349d79f..a040c0896a7b 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2108,7 +2108,6 @@ static int sdhci_esdhc_resume(struct device *dev)
>             esdhc_is_usdhc(imx_data))
>                 sdhc_esdhc_tuning_restore(host);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 732b65d4b61a..68e56251d5e8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2750,7 +2750,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         if (ret)
>                 goto pm_runtime_disable;
>
> -       pm_runtime_mark_last_busy(&pdev->dev);
>         pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 429d8a517fb6..cdb09605e009 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1370,7 +1370,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>                 host->mmc->pm_caps |= MMC_PM_KEEP_POWER | MMC_PM_WAKE_SDIO_IRQ;
>         }
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return 0;
> @@ -1379,7 +1378,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         sdhci_cleanup_host(host);
>
>  err_rpm_put:
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>  err_rpm_disable:
>         pm_runtime_dont_use_autosuspend(dev);
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
> index 34abf986573f..1371960e34eb 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -494,7 +494,6 @@ static int sdhci_pxav3_suspend(struct device *dev)
>         if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>         ret = sdhci_suspend_host(host);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> @@ -507,7 +506,6 @@ static int sdhci_pxav3_resume(struct device *dev)
>
>         pm_runtime_get_sync(dev);
>         ret = sdhci_resume_host(host);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index a5dec1a0e934..fe2fe52b23b2 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -863,7 +863,6 @@ static int sdhci_sprd_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_cleanup_host;
>
> -       pm_runtime_mark_last_busy(&pdev->dev);
>         pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index ea14d56558c4..e2c4a0049d61 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -986,7 +986,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
>         /* Setting up autosuspend */
>         pm_runtime_set_autosuspend_delay(dev, SDHCI_AM654_AUTOSUSPEND_DELAY);
>         pm_runtime_use_autosuspend(dev);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>         return 0;
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 2cec463b5e00..21c2f9095bac 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -160,7 +160,6 @@ static void tmio_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
>                 sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
>
>                 host->sdio_irq_enabled = false;
> -               pm_runtime_mark_last_busy(mmc_dev(mmc));
>                 pm_runtime_put_autosuspend(mmc_dev(mmc));
>         }
>  }
> --
> 2.39.5
>

