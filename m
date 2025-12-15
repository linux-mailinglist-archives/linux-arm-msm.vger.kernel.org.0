Return-Path: <linux-arm-msm+bounces-85264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC1CBEB80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 16:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FECB300F1A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4383346BD;
	Mon, 15 Dec 2025 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkF0pWpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E332827F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813429; cv=none; b=VJnsz7lx0PqVX8OIDCD48Ma5m56C/5U/A+4mxwsuWVq1q+H31NUblhMJA5I+KW0B1E2ZXTYnbfiqGix1zws/LByAznvV18/EW229JBlueBZmd0jsSutoyns8gvEaosuXDAOU8ZyD7Hlmc3LKGEdH7RI8nxhbT806Ti/NOJRs/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813429; c=relaxed/simple;
	bh=jbhSTUe4r1yhsr1SieK/5eiyWztSVs/GJZj2RjQNTrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIW9lbLg045e25UQfUtC2t2pjbOKYXO/TfYQ4oaHP+e8HG38ZcOV3fMCTd4Mm3C3c7fn74j8edTlDwut603wvptiCptSXFDh1o76iMgZ/kaMCbCOH9f8vOrFep3AnAtJhaaTK91sdQQUpcHn1HIOiFsdFJXI6KJMo2ydm/b6W/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkF0pWpV; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957c929a5eso5436838e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813423; x=1766418223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h1mPhr8UxqwWoKU4LPsArNXLaNjkp/q7fh9QZ2Vv5go=;
        b=bkF0pWpVgMs+MsNynYgG0AON2ujETucxRuHgKGTxK2IJ97MgDswk/uVAUGXJlik3Sj
         E37IjRTVqpjB3+E6OIxSkBSQbZpmo3z6sT8/ivwXXRt68XeHNyHPSovascYqlNKBSYjL
         XBVLpis9a8g5aLLIg+Dgf+0v+5GALtKRVqWVL7syW86QmIlsNNzWh2qArzqEmNsv+g2B
         /cfZkBFSDwr1ulgm/5I9jSgmyu0Wybl3X0qSNHaK4eksWgk3PhonoxKJWprJifjdeKp4
         jDOGvbgk9W/TVY/tcx4YPggLsrfMvn8E9AimOU+aKn+IiQZr3ew8Iuhmj2If4Dhzapww
         dYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813423; x=1766418223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1mPhr8UxqwWoKU4LPsArNXLaNjkp/q7fh9QZ2Vv5go=;
        b=fkO8hsPZGcM9/kLgmEmFAYv44uonJGpByin7zTbpRegFIUgm1KBFjM6vZx1tz87MHa
         B9FMW7iJu8u8/dNaOUDX0CHaSAm/OzFKCBS0W0Xc5sCMGbHvoUTGOgMPhiyYaNDyahJG
         sbDDn+HTTp2IHuy5x1gCDcuLKuyRw4Sc9lKLnx/6Rt+STYwEZiM3CqsHyzAKqj/Cl+eJ
         8GnPbGnVb2inRvmEwFnIGf7JHW0gx8bYXnsLPnacuGyHeoLeqA4PMp8Rfv/YVS4zsl/H
         GxW2atrFGdlChAccD8Y639bSRXN237nHoflZYAI8s+2CJulpXdaXT7LLCh83HjGXhHtl
         a2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX42KoifrBuoZ/v8nsr3NNm0DocbtK58COv9zrQVEAvnlTJ/FqjYSCedBXlNHCMsFLvFDWr/y5jRHu9btsy@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3qGDFjLDn01F+cBO64CHPR1fUuF7ToEie/KsyxjVXszGiMWX
	de62ORtMzB17FDEy+jnuREu3+QPr2UbbIBzzXVMGrDjJkcWL/zAQieTt1hR4ViHJtOZ7vt4J523
	dLj1fwZZLoVFd0gnBJgB3aPHzQ6NX6BXNy5bVx//dvg==
X-Gm-Gg: AY/fxX7w71AQtOeqcpJ7JMsAsdhWwGH2+s0gfUQ2cZ4DWSg8OxlHPjPX66ArmeWkQJS
	RsmNGwPb7ii/fQFbAkYFvv7NSNJAfhzZ1aqmFlp4xjqr8tXZUDsibpckwv4ijp41WVE+3kQCTom
	FtsLCp5trVqE++frSUv7lqUZRK1RGFrATHQtElnc93k/J4d5pqT8MYQWgJ0JvNamlyBdZbGMv7D
	9JuZ2nu+1H8TcUlraSGsLugvY6KgSdXI+7Dvp/KuIWDpIm2vsijqyK9OyRy2ahP6nNq57bY
X-Google-Smtp-Source: AGHT+IE3Jgck3bZQ02V3Ywy5d1qs46dgCJ2cwUL3Qp0SQkocT/ZlCk/sk6Q7Vhcfa0KPJst+iqW5iFHTALXoIY9Nb4M=
X-Received: by 2002:a05:6512:12c7:b0:594:2d53:545 with SMTP id
 2adb3069b0e04-598faa97a04mr3339735e87.46.1765813422439; Mon, 15 Dec 2025
 07:43:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
In-Reply-To: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:43:05 +0100
X-Gm-Features: AQt7F2oQ2izP6GJIUKoN_iasULgW09Cvg1sgf5bhCj5GAinlGjPZQlAXL20QVyM
Message-ID: <CAPDyKFqNOQW+3OCyhiQaD0FiU2tfy4OzNY+NP+gXn4RcPa_uFw@mail.gmail.com>
Subject: Re: [PATCH v6] mmc: sdhci-msm: Enable ICE for CQE-capable controllers
 with non-CQE cards
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, abel.vesa@linaro.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 07:43, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Enable Inline Crypto Engine (ICE) support for CQE-capable sdhci-msm
> controllers when used with eMMC cards that do not support CQE.
>
> This addresses the scenario where:
> - The host controller supports CQE (and has CQHCI crypto infrastructure)
> - The eMMC card does not support CQE
> - Standard (non-CMDQ) requests need crypto support
>
> This allows hardware-accelerated encryption and decryption for standard
> requests on CQE-capable hardware by utilizing the existing CQHCI crypto
> register space even when CQE functionality is not available due to card
> limitations.
>
> The implementation:
> - Adds ICE register definitions for non-CQE crypto configuration
> - Implements per-request crypto setup via sdhci_msm_ice_cfg()
> - Hooks into the request path via mmc_host_ops.request for non-CQE requests
> - Uses CQHCI register space (NONCQ_CRYPTO_PARM/DUN) for crypto configuration
>
> With this, CQE-capable controllers can benefit from inline encryption
> when paired with non-CQE cards, improving performance for encrypted I/O
> while maintaining compatibility with existing CQE crypto support.
>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Change in [v6]
>
> * Changed the variable name from ice_init_done to non_cqe_ice_init_done
>
> * Eliminated the ICE_HCI_SUPPORT check inside the sdhci_msm_non_cqe_ice_init()
>   function
>
> * Updated the sdhci_msm_ice_cfg() function to use a void return type instead
>   of int
>
> * Removed the crypto_enable and dun variables from the sdhci_msm_ice_cfg()
>   function
>
> * Revised the comment associated with the sdhci_msm_request() function
>
> Change in [v5]
>
> * Removed unused variable
>
> * Added proper comment for sdhci_msm_request()
>
> * Removed sdhci_msm_ice_enable(); it is already invoked during resume
>
> Change in [v4]
>
> * Moved ICE initialization for non cmdq into sdhci_msm_ice_cfg() and made
>   it conditional on mrq->crypto_ctx to enable lazy setup.
>
> * Added msm_host->ice_init_done guard to prevent redundant initialization.
>
> * Updated commit message
>
> Change in [v3]
>
> * Refactored logic to use separate code paths for crypto_ctx != NULL and
>   crypto_ctx == NULL to improve readability.
>
> * Renamed bypass to crypto_enable to align with bitfield semantics.
>
> * Removed slot variable
>
> * Added ICE initialization sequence for non-CMDQ eMMC devices before
>   __sdhci_add_host()
>
> Change in [v2]
>
> * Moved NONCQ_CRYPTO_PARM and NONCQ_CRYPTO_DUN register definitions into
>   sdhci-msm.c
>
> * Introduced use of GENMASK() and FIELD_PREP() macros for cleaner and more
>   maintainable bitfield handling in ICE configuration.
>
> * Removed redundant if (!mrq || !cq_host) check from sdhci_msm_ice_cfg()
>   as both are guaranteed to be valid in the current call path.
>
> * Added assignment of host->mmc_host_ops.request = sdhci_msm_request; to
>   integrate ICE configuration into the standard request path for non-CMDQ
>   eMMC devices.
>
> * Removed sdhci_crypto_cfg() from sdhci.c and its invocation in sdhci_request()
>
> Change in [v1]
>
> * Added initial support for Inline Crypto Engine (ICE) on non-CMDQ eMMC
>   devices.
>
>  drivers/mmc/host/sdhci-msm.c | 77 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3b85233131b3..da356627d9de 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -157,6 +157,17 @@
>  #define CQHCI_VENDOR_CFG1      0xA00
>  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
>
> +/* non command queue crypto enable register*/
> +#define NONCQ_CRYPTO_PARM              0x70
> +#define NONCQ_CRYPTO_DUN               0x74
> +
> +#define DISABLE_CRYPTO                 BIT(15)
> +#define CRYPTO_GENERAL_ENABLE          BIT(1)
> +#define HC_VENDOR_SPECIFIC_FUNC4       0x260
> +
> +#define ICE_HCI_PARAM_CCI      GENMASK(7, 0)
> +#define ICE_HCI_PARAM_CE       GENMASK(8, 8)
> +
>  struct sdhci_msm_offset {
>         u32 core_hc_mode;
>         u32 core_mci_data_cnt;
> @@ -300,6 +311,7 @@ struct sdhci_msm_host {
>         u32 dll_config;
>         u32 ddr_config;
>         bool vqmmc_enabled;
> +       bool non_cqe_ice_init_done;
>  };
>
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2012,6 +2024,68 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>         return qcom_ice_evict_key(msm_host->ice, slot);
>  }
>
> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = msm_host->mmc;
> +       struct cqhci_host *cq_host = mmc->cqe_private;
> +       u32 config;
> +
> +       config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +       config &= ~DISABLE_CRYPTO;
> +       sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +       config = cqhci_readl(cq_host, CQHCI_CFG);
> +       config |= CRYPTO_GENERAL_ENABLE;
> +       cqhci_writel(cq_host, config, CQHCI_CFG);
> +}
> +
> +static void sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = msm_host->mmc;
> +       struct cqhci_host *cq_host = mmc->cqe_private;
> +       unsigned int crypto_params = 0;
> +       int key_index;
> +
> +       if (mrq->crypto_ctx) {
> +               if (!msm_host->non_cqe_ice_init_done) {
> +                       sdhci_msm_non_cqe_ice_init(host);
> +                       msm_host->non_cqe_ice_init_done = true;
> +               }
> +
> +               key_index = mrq->crypto_key_slot;
> +               crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, 1) |
> +                               FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +               cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->bc_dun[0]),
> +                            NONCQ_CRYPTO_DUN);
> +       } else {
> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +       }
> +
> +       /* Ensure crypto configuration is written before proceeding */
> +       wmb();
> +}
> +
> +/*
> + * Handle non-CQE MMC requests with ICE crypto support.
> + * Configures ICE registers before passing the request to
> + * the standard SDHCI handler.
> + */
> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       /* Only need to handle non-CQE crypto requests in this path */
> +       if (mmc->caps2 & MMC_CAP2_CRYPTO)
> +               sdhci_msm_ice_cfg(host, mrq);
> +
> +       sdhci_request(mmc, mrq);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>         .keyslot_program        = sdhci_msm_ice_keyslot_program,
>         .keyslot_evict          = sdhci_msm_ice_keyslot_evict,
> @@ -2762,6 +2836,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>
>         msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>
> +#ifdef CONFIG_MMC_CRYPTO
> +       host->mmc_host_ops.request = sdhci_msm_request;
> +#endif
>         /* Set the timeout value to max possible */
>         host->max_timeout_count = 0xF;
>
> --
> 2.34.1
>

