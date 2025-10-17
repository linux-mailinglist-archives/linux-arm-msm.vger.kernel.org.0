Return-Path: <linux-arm-msm+bounces-77776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24008BE8BEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 15:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0F21AA428B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 13:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3313451DE;
	Fri, 17 Oct 2025 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BkoM1ja+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D56343D6D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706455; cv=none; b=sp9oswWJGgNx+8yv5tw3nQnBmsTx92tnamalLOIJo38P9mGk0MhGXtuV5oOuVDAQxe+vToeSVt0VtgrhzTIKN/kunKjtIs/Cbt13Up5KLAaR9akTdSf05yLsgDImNo/oIUcNoncgUBuqJAImJRwgpS23AuIUT0przTb+MByhkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706455; c=relaxed/simple;
	bh=+/qLMtVBIWqwLGMAuHcsQDTwgVp463iJrpIJllPu/rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QS7a/JejhXh0ht6ZWQa+cq/hAuQ/iEYU6P9wZtjd/EnBDVauaLoKh8nHp8DAu2tCVeuZQS5bYZtICNxq/KlCJa1FAQsLHUY5yWr9gJxuKLDQo6fafXTpDBA1knHRc0azppe1BuGLEqDbwwree0Z2yZ9x8gEAEMrMgoBvra77gm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BkoM1ja+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d6014810fso20154377b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760706452; x=1761311252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=50cVqA2F5ClWFlvjEjCRe8At6ftPcm1Q3YVimsx0O/4=;
        b=BkoM1ja+UdrZQ5CS7envY+JXLsRcJeIcM+wPqd+s9bPNZCWAaQU0DJW3sIEOHikseA
         hCmRAJ8U2G3HBFiREKRMPAus/HyOFRPWY8iSQu6F1+gh+xdpTBEblHHKHoh+sf6Twc3e
         sV8idxrQukSIBIO0C2KBRA+bcDx10ko4J/1yx6GvPWmZM+6yPvdP8gZMTzLd8VarUcUr
         Y/oQWdV08xKcq7hJI3LJe8kvbludkzXn0oNZ9R5BP7zHFmIYqy8erKpihSZ6LiH0DKgS
         SMG76uptfwlxDEdcKPNBqDU/WOYhu6mXR7R1aUxkUrLySBKDniMru79cD7QvQ3FBzSqP
         Q8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706452; x=1761311252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50cVqA2F5ClWFlvjEjCRe8At6ftPcm1Q3YVimsx0O/4=;
        b=Zv7lCGNvjA15RY2a5MJ7fiOgbMHGGK7x5xHGP6ZdXnNSUU7hzDRN8wocYu8PLK2G/0
         aAiqilyZcfRm8I9Wc6kdfnJoxLCOV2N85OBXxZ/dBQU2kTyJFuEzESWiSF/WjRyPa092
         ENaevxmgyslWqBMKAYM9TvKT9ifvkvkiiPZs36eM83xVg/O3IeVKN3GW9SY7yXeb3pvp
         m/GBg3xowp0BdlMEIh1eREYrmLIUaN9zXkzCMb/q8jxIMxxfSgECuG596LHqiWyp8aYP
         ZYCPpS+JXQDOczK1vKl0UgP0E4avWmOMbwCCA91ZNF+8IQBCZK6bSQaNHCpK/yWLskBq
         UvJg==
X-Forwarded-Encrypted: i=1; AJvYcCURVJFtZ0ocNTiHsS/6GtzhTqszcPMFerUqZoDLqgxY7MFb4AOPSFyKYsHa4RXD4BBs/GV2vBSMXZET1NV5@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUPW1nAdG3v9fbqDIWgPlcJVStbsCT73VH5wGPCBCozN6LL5R
	yfktgzmiK6LZlOpVTX0/MoUyVbSsJCW8nn+Yyc7zUpnY+fumT5tMGMGZV/7q7Dif4RGt7+uaHJn
	vwxmRZACXjuDYbjfYazxBSFpYdidMrBGfxVgdfaCzLw==
X-Gm-Gg: ASbGncu2LfNKrqRGOPSzncUOz4l96W/vAWl2/4OFY7xO8CkuWLSnBKulP+RkIxIfZxr
	6kX+6aoA60Q8+92FrsM7ENWoVdd/T1xMFHynIPoNHjf+WlvC0mdgu+BC39bmZ3VNx6+4AeP8gHg
	4mgI23rTXeGDV4hOBqI/WFBZeepf7dMSkuI977EPHWKg0aV1kptCyaKnKyyYURVEp9RC+pz9gyT
	xAwafB+iihlfK+G4xzLAHvcICnIjjhYcToiyn74LfLuRTTbkOmo5M2vHxvtbg==
X-Google-Smtp-Source: AGHT+IGSrS4HDocorfqEfmZwZOOsXvwvjCJbCOF3S3WNcbmbO5EGBeCiu+E3JHa3nXouVXCrJ5i9C50oOQd1adkQz88=
X-Received: by 2002:a05:690e:1598:10b0:636:1409:c497 with SMTP id
 956f58d0204a3-63e16168320mr2602070d50.3.1760706452091; Fri, 17 Oct 2025
 06:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014093503.347678-1-quic_mdalam@quicinc.com>
In-Reply-To: <20251014093503.347678-1-quic_mdalam@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Oct 2025 15:06:56 +0200
X-Gm-Features: AS18NWDjFAK_bFxixRqaZq-uFC_4ekgdVLwCh3tsP53Kf7WO5KoCxzvYk305ack
Message-ID: <CAPDyKFpYi+fRi+saBitmbFFci41K-pWAre80wQqyujuA9DrP-Q@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC devices
To: Md Sadre Alam <quic_mdalam@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Eric Biggers <ebiggers@google.com>
Cc: adrian.hunter@intel.com, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

+ Abel, Eric

On Tue, 14 Oct 2025 at 11:35, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
> without Command Queue Engine (CQE).This allows hardware-accelerated
> encryption and decryption for standard (non-CMDQ) requests.
>
> This patch:
> - Adds ICE register definitions for non-CMDQ crypto configuration
> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
> - Hooks into the request path via mmc_host_ops.request
> - Initializes ICE hardware during CQE setup for compatible platforms
>
> With this, non-CMDQ eMMC devices can benefit from inline encryption,
> improving performance for encrypted I/O while maintaining compatibility
> with existing CQE crypto support.
>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Before applying this I want to get confirmation from the people who
implemented the inline crypto engine support, hence I have added Abel
and Eric.

Kind regards
Uffe

> ---
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
>  drivers/mmc/host/sdhci-msm.c | 71 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..483aadaca262 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -157,6 +157,18 @@
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
> +#define ICE_HCI_SUPPORT                        BIT(28)
> +
> +#define ICE_HCI_PARAM_CCI      GENMASK(7, 0)
> +#define ICE_HCI_PARAM_CE       GENMASK(8, 8)
> +
>  struct sdhci_msm_offset {
>         u32 core_hc_mode;
>         u32 core_mci_data_cnt;
> @@ -1885,6 +1897,48 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>
>  #ifdef CONFIG_MMC_CRYPTO
>
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
> +                            u32 slot)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = msm_host->mmc;
> +       struct cqhci_host *cq_host = mmc->cqe_private;
> +       unsigned int crypto_params = 0;
> +       int key_index = 0;
> +       bool bypass = true;
> +       u64 dun = 0;
> +
> +       if (mrq->crypto_ctx) {
> +               dun = mrq->crypto_ctx->bc_dun[0];
> +               bypass = false;
> +               key_index = mrq->crypto_key_slot;
> +       }
> +
> +       crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, !bypass) |
> +                       FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +       cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +
> +       if (mrq->crypto_ctx)
> +               cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
> +
> +       /* Ensure crypto configuration is written before proceeding */
> +       wmb();
> +
> +       return 0;
> +}
> +
> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       if (mmc->caps2 & MMC_CAP2_CRYPTO)
> +               sdhci_msm_ice_cfg(host, mrq, 0);
> +
> +       sdhci_request(mmc, mrq);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> @@ -2131,6 +2185,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>         struct cqhci_host *cq_host;
>         bool dma64;
>         u32 cqcfg;
> +       u32 config;
> +       u32 ice_cap;
>         int ret;
>
>         /*
> @@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>         if (ret)
>                 goto cleanup;
>
> +       /* Initialize ICE for non-CMDQ eMMC devices */
> +       config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +       config &= ~DISABLE_CRYPTO;
> +       sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +       ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> +       if (ice_cap & ICE_HCI_SUPPORT) {
> +               config = cqhci_readl(cq_host, CQHCI_CFG);
> +               config |= CRYPTO_GENERAL_ENABLE;
> +               cqhci_writel(cq_host, config, CQHCI_CFG);
> +       }
> +       sdhci_msm_ice_enable(msm_host);
> +
>         dev_info(&pdev->dev, "%s: CQE init: success\n",
>                         mmc_hostname(host->mmc));
>         return ret;
> @@ -2759,6 +2827,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
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

