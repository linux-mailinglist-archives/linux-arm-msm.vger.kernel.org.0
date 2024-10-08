Return-Path: <linux-arm-msm+bounces-33578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AB9951ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C1C21C23E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D411E04A6;
	Tue,  8 Oct 2024 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klnyPQ4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BF1E0480
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398196; cv=none; b=D0pDVYTp0JNZPTSzTgbN9wAj9cbT2cuYlAz49v9A1+Z4bkG6x/h24xbwkSp9et9cLnJr2nYFVECb5LC9fp5nCOeqHKl9igmMuTxiDGA8B6sNUGQq3kqzBpG7zMIKy9SWhp9BEQYZRkxt5f5pYDZ+ZH9bRir/8vG/dydthZSk1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398196; c=relaxed/simple;
	bh=Y0lMjW2jKMZwN0M6TbGXmhtEUEKSCT8WCvQRmIGn5HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/BeAnWAe1hIw3MHC7OSA/8A6hf7bqJaTv+bvfDD0UzkREHyM8/nVFa2l0JTZgPGkUlFrf28ImAQ0d5IvIc9Xp/dBSobOuIFEXZymidCNH11jkEMElbmwQruu3/kkpoa6bFC11LsE6ei97pSHAhqvMcEP0T51Qcb+7nAQYVtrKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klnyPQ4v; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e4d16c2fso24043907b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398193; x=1729002993; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvdDxu0uUFcfRftNtzBrq68CTjswU4MR/lPRKPBVJUA=;
        b=klnyPQ4v1Jl38wqrEP6jzFLr2/TGq6vbgO0SHF/OByias5VQjZpph/PEXNBl+sz70n
         nMjZDbuoszXPyooPXgcdWiafK3LfGGCAqDzPL1uGg+DJ9JSA5+6nwX5+19jhT5cag4mZ
         r/tNA9ksJ51EVJJunn9REuhTD1kueNwpUw4G6+GU96JUFvCLI1K4DrI82vg+nwbSuNJf
         8ReXhSldt3FyDDdrG7dbSCNXWXB4s5gPZgZjcseDVyWhO7CHL+Cp+guTnNJ2nSDAqHtz
         hhjgVBJpdFPSJiCfCJyq9SbV72+5FueEFQu1Q7KbJnb/v6sN+yVvziLlUbszfzlQ+wpH
         MrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398193; x=1729002993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvdDxu0uUFcfRftNtzBrq68CTjswU4MR/lPRKPBVJUA=;
        b=Vespl44h/thB1tWm4RIRmT5+VzonPE+Yp+MnDnB0thVU3jsRIBuy0/1iRiKwGyzjbK
         DDNFZ+GHW0v7t1McBfzXciUH8k2sRwOumBIsqjcH2/MzU9eqHVcQ2vVZXxSCvQpohewz
         tr7auk+r0duNL4wiWdGudgJlTGE9HdqzX6L5wHVXe8dfDIKlkar9WPODbGIQTGM4cdN4
         qFngKilc+Yx4ZeCrP0M1KfBNtXrMiKyPR4coBvu5nyidq78FxcphgBC9lA73jCZwC/0n
         JFsyjvecT8NF3hlvfsN0zc39ckg02h8Y26tt8ZgIlqEZgHdUfW+0+iP0dCYAI3cpNcY8
         NRKw==
X-Forwarded-Encrypted: i=1; AJvYcCWhUR/8w4a8Aei8c8Arx+WsSWAAL0Yb/IuthaU/sU9B75DQNxuY9UuwweUm1qW/Hs0J1qxVfCeVNAUHPZmi@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhkcMW52ol6iF2V5FjNN0OPfhH2M8MoDs0XAgwc3bu5EXElJ7
	KDbCjHYJEmQ0gXaKmVxY+nOXcKgQnjUOUAU3SGdGCUmBmGpysCnhp/SjtXuEbkOqPunXz8xo6RB
	AxIS54QO9ufqv7dfUPcQ3eJ844PFKzv623l7gaA==
X-Google-Smtp-Source: AGHT+IH7JBySBe+ugLiwdV9z9D3yRskW3fQHkZaPcUF8iKpr4058P83ZY+ritDjNryL38gb8s14NXcVeCTMnJZxK7bU=
X-Received: by 2002:a05:6902:2e0b:b0:e28:f668:b41d with SMTP id
 3f1490d57ef6-e28f668cd1bmr765146276.48.1728398192886; Tue, 08 Oct 2024
 07:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240929093418.526901-1-yujiaoliang@vivo.com>
In-Reply-To: <20240929093418.526901-1-yujiaoliang@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:35:54 +0200
Message-ID: <CAPDyKFohKSPqhuPVYijtvhY2DmG20ar+MY9OqWWLu5_MnB4ReQ@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Fix typos in comments across various files
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, s32@nxp.com, linux-arm-msm@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Sept 2024 at 11:34, Yu Jiaoliang <yujiaoliang@vivo.com> wrote:
>
> This patch corrects several typos in comments within the mmc/host
> directory. No functional changes are introduced, only comment
> improvements for better readability.
>
> Detected using codespell.
>
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c       | 2 +-
>  drivers/mmc/host/au1xmmc.c         | 2 +-
>  drivers/mmc/host/cavium-octeon.c   | 2 +-
>  drivers/mmc/host/dw_mmc.c          | 2 +-
>  drivers/mmc/host/meson-gx-mmc.c    | 2 +-
>  drivers/mmc/host/mmci.h            | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++--
>  drivers/mmc/host/sdhci-msm.c       | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 6490df54a6f5..f444ca5dd154 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -860,7 +860,7 @@ static void atmci_send_stop_cmd(struct atmel_mci *host, struct mmc_data *data)
>  }
>
>  /*
> - * Configure given PDC buffer taking care of alignement issues.
> + * Configure given PDC buffer taking care of alignment issues.
>   * Update host->data_size and host->sg.
>   */
>  static void atmci_pdc_set_single_buf(struct atmel_mci *host,
> diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
> index 6e80bcb668ec..7393d2ea5e57 100644
> --- a/drivers/mmc/host/au1xmmc.c
> +++ b/drivers/mmc/host/au1xmmc.c
> @@ -543,7 +543,7 @@ static void au1xmmc_cmd_complete(struct au1xmmc_host *host, u32 status)
>                                         cmd->resp[i] |= (r[i + 1] & 0xFF000000) >> 24;
>                         }
>                 } else {
> -                       /* Techincally, we should be getting all 48 bits of
> +                       /* Technically, we should be getting all 48 bits of
>                          * the response (SD_RESP1 + SD_RESP2), but because
>                          * our response omits the CRC, our data ends up
>                          * being shifted 8 bits to the right.  In this case,
> diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
> index 060ec4f4800f..d150d83b41ed 100644
> --- a/drivers/mmc/host/cavium-octeon.c
> +++ b/drivers/mmc/host/cavium-octeon.c
> @@ -217,7 +217,7 @@ static int octeon_mmc_probe(struct platform_device *pdev)
>                 return PTR_ERR(base);
>         host->dma_base = base;
>         /*
> -        * To keep the register addresses shared we intentionaly use
> +        * To keep the register addresses shared we intentionally use
>          * a negative offset here, first register used on Octeon therefore
>          * starts at 0x20 (MIO_EMM_DMA_CFG).
>          */
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 41e451235f63..aab1a8df6414 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -1182,7 +1182,7 @@ static void dw_mci_submit_data(struct dw_mci *host, struct mmc_data *data)
>                 /*
>                  * Use the initial fifoth_val for PIO mode. If wm_algined
>                  * is set, we set watermark same as data size.
> -                * If next issued data may be transfered by DMA mode,
> +                * If next issued data may be transferred by DMA mode,
>                  * prev_blksz should be invalidated.
>                  */
>                 if (host->wm_aligned)
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c7c067b9415a..e87d1c4b9dc1 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -879,7 +879,7 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         /*
>          * The memory at the end of the controller used as bounce buffer for
>          * the dram_access_quirk only accepts 32bit read/write access,
> -        * check the aligment and length of the data before starting the request.
> +        * check the alignment and length of the data before starting the request.
>          */
>         if (host->dram_access_quirk && mrq->data) {
>                 mrq->cmd->error = meson_mmc_validate_dram_access(mmc, mrq->data);
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index a5eb4ced4d5d..4d3647f9ec06 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -77,7 +77,7 @@
>  #define MCI_CPSM_INTERRUPT     BIT(8)
>  #define MCI_CPSM_PENDING       BIT(9)
>  #define MCI_CPSM_ENABLE                BIT(10)
> -/* Command register flag extenstions in the ST Micro versions */
> +/* Command register flag extensions in the ST Micro versions */
>  #define MCI_CPSM_ST_SDIO_SUSP          BIT(11)
>  #define MCI_CPSM_ST_ENCMD_COMPL                BIT(12)
>  #define MCI_CPSM_ST_NIEN               BIT(13)
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 8f0bc6dca2b0..2bfb86364441 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1524,7 +1524,7 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
>                         writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
>                         /*
> -                        * ESDHC_STD_TUNING_EN may be configed in bootloader
> +                        * ESDHC_STD_TUNING_EN may be configured in bootloader
>                          * or ROM code, so clear this bit here to make sure
>                          * the manual tuning can work.
>                          */
> @@ -1626,7 +1626,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>
>         /*
>          * If we have this property, then activate WP check.
> -        * Retrieveing and requesting the actual WP GPIO will happen
> +        * Retrieving and requesting the actual WP GPIO will happen
>          * in the call to mmc_of_parse().
>          */
>         if (of_property_read_bool(np, "wp-gpios"))
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e113b99a3eab..d6b3b343b031 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2601,7 +2601,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         sdhci_msm_handle_pwr_irq(host, 0);
>
>         /*
> -        * Ensure that above writes are propogated before interrupt enablement
> +        * Ensure that above writes are propagated before interrupt enablement
>          * in GIC.
>          */
>         mb();
> --
> 2.34.1
>

