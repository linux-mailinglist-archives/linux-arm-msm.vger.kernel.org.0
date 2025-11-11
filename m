Return-Path: <linux-arm-msm+bounces-81317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1660C4F406
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 18:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5765434D155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26715393DF8;
	Tue, 11 Nov 2025 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdTKwspx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A658C3AA1BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762882406; cv=none; b=TVbhVVD9K+IYe9y0C/fQe0sT2rOVxYp22eXVs2Rrnow1dfFVdbysSOkevp81diY/LxwQm7Uzrjl6HBfUxMldJUoK7mBQB0aFo6Ocad8OKXd2U/ruaEz67s4ymCHhSw/XZ4CpopNatyVWV6qU8tkk2CmcfHyf7HSesL93weCFjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762882406; c=relaxed/simple;
	bh=bZZmFd1HMB2tVZTcmwAggmfotETIpV8gUXPlqh0xaTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVgarAY48uIOCWjvzioK8OrILtMBxdOB6ZRM1/CG1BfdQajlYbSCy6YVH9KsSv3X2011S6t1vlnlEwfdZOdxsY//G3h6PiXCcnbDsn0RmHlvIzh+k07UAV38nz9PM3D21fMh4pOT8pU8a9N9TlJlbeInoVWVYIFU5uqO8vmfNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdTKwspx; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d60157747so38638817b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 09:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762882403; x=1763487203; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3POagvqZPr4kctt/E0gODwrBgs1hI145Zz/JqGFl+s=;
        b=pdTKwspxFTxHiiV3wIqBp5fk5r2wxYGMimnlDx4ntrFARfeMwu4yuoTJFgkb5ozURF
         DJRn8fy0KVjcLIBBTpJfrxFXSDbqsmRxltI6qIt5Gppy14SMcv3VYppoINdsCP8LX2DL
         hvubQHswb24cbA/QdMKrv+xGFqPoMmty04oyvu7u6eU/dRx1y73mpZTs/2PokxLi/ZSe
         r7lxB7Rsjop0ZZRm7YLKt68OPExLp+2Zw72+tqa+ziLiKL7Cq0ZtQPaAquQC+od4DKMO
         N14K984MApwALqH8uJBfHl+lxKY6XwWITix6xFA4Lz/dutzvagioovBDO9NioBLTOU/G
         5tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882403; x=1763487203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3POagvqZPr4kctt/E0gODwrBgs1hI145Zz/JqGFl+s=;
        b=K6/UECFwKDxmUpatpf9CMUJM+Dq7NCVZobJK0ndWx6tnuCNLAkt7A34GyAHvpvmJp3
         RJmgV2+A3H0cbYxVN71YEOeSG3OxG7nfHUx6g5TXY+1t4b2MKX+XQgJB9eoQOUCk/GnG
         enJAdlQu82oG0yMYZutMU3mREA4klibjfs6cLpeMUaCQdMC0UMRiZomVkusvz4f6zApK
         vlwKXULDTHc1BzA1WmBuJSPcAqsU4Z2IMWE4VRuzm2mnr6+e3IjtlL874G0At8VeuEc/
         fhKhqC/KNHFsOwSHT2ziD5Pe6fW1bzk6s7ntbzcxLDXxUdtq4yxeMiVZsakKoMvNECmY
         10fA==
X-Forwarded-Encrypted: i=1; AJvYcCUSLpMdsK1Q3da/ffSE7aOZ/nq1mwnGCOcAWGDAEWoaGfDpFIhI9G/OpiS4boG5RymJAghRr8UIsA8mdr5P@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBx6dF98tSraF5NIwvarUbihmG6Ar8nSY3+O+POVuMtAtg98d
	6heQ8GZGKxGEc/LjMG2E3GwxjN3+NkbgnEVPjGjm989bP1IKCmeXtzvG3HGLl2pNjQ5lQ7Fm6uc
	KCmdllaJhw9qSWML6p6KxsvezMFUqg949d7g9ZuCKJQ==
X-Gm-Gg: ASbGncvYF/XIP/1bgCkbkTpaoqNr6p85InGt4hD36QsnKTkM9M89VH7HZw+3idvEpO3
	5fNzuRu6cakrN6sM7yJDFBN/V6Z9wFxlY9X8uhWWCCai3e0c/x2FsJV/xhkDsjIhdOLaALzUp6z
	KU5lHNdvW4C8QkOH8gtvp+fgcKFMlCBqPjTDNtULkRqKZl8fQe0QITHnXFgliZ5V7jWfhPnbfVf
	coUMH3GAh3NLpG3EkEOUUjD31lsTRB6QFgoHac7xY48KaSFlecUULpLTQwUeLLhc9fcCDiq
X-Google-Smtp-Source: AGHT+IHkL50UwyugDA2rRkIMYRNP2LCV0zzmMnWcbJ3wfIyChDwcgmKAxAgayOMrHHOnGcwiFnSUlFTpkI/1n22vPDM=
X-Received: by 2002:a05:690c:a1dc:b0:786:8adb:8ae with SMTP id
 00721157ae682-787d5415677mr95593097b3.44.1762882402586; Tue, 11 Nov 2025
 09:33:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
In-Reply-To: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 18:32:46 +0100
X-Gm-Features: AWmQ_bmOpHBCUP1BA5zx0K-SV6LyyIKkTRnysMH9Acvl87xHwuKqeZ7-EziMvnw
Message-ID: <CAPDyKFomGKtznQ4wD8O83b6uAKfNkKhERjoivrbmSqtQODDDDA@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC devices
To: Md Sadre Alam <quic_mdalam@quicinc.com>, Eric Biggers <ebiggers@google.com>, 
	Abel Vesa <abel.vesa@linaro.org>
Cc: adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

+ Eric, Abel

On Tue, 11 Nov 2025 at 11:46, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
> without Command Queue Engine (CQE).This allows hardware-accelerated
> encryption and decryption for standard (non-CMDQ) requests.
>
> This patch:
> - Adds ICE register definitions for non-CMDQ crypto configuration
> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
> - Hooks into the request path via mmc_host_ops.request
>
> With this, non-CMDQ eMMC devices can benefit from inline encryption,
> improving performance for encrypted I/O while maintaining compatibility
> with existing CQE crypto support.
>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Please add Eric/Abel for any future submission of the patch as it's
for ICE. I don't feel completely confident to apply this without some
of their acks.

Kind regards
Uffe

> ---
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
>  drivers/mmc/host/sdhci-msm.c | 84 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..3c1c20182ac7 100644
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
> @@ -300,6 +312,7 @@ struct sdhci_msm_host {
>         u32 dll_config;
>         u32 ddr_config;
>         bool vqmmc_enabled;
> +       bool ice_init_done;
>  };
>
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2009,6 +2022,74 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
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
> +       u32 ice_cap;
> +
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
> +}
> +
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = msm_host->mmc;
> +       struct cqhci_host *cq_host = mmc->cqe_private;
> +       unsigned int crypto_params = 0;
> +       int key_index;
> +       bool crypto_enable;
> +       u64 dun = 0;
> +
> +       if (mrq->crypto_ctx) {
> +               if (!msm_host->ice_init_done) {
> +                       sdhci_msm_non_cqe_ice_init(host);
> +                       msm_host->ice_init_done = true;
> +               }
> +
> +               crypto_enable = true;
> +               dun = mrq->crypto_ctx->bc_dun[0];
> +               key_index = mrq->crypto_key_slot;
> +               crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
> +                               FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +               cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
> +       } else {
> +               crypto_enable = false;
> +               key_index = 0;
> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +       }
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
> +               sdhci_msm_ice_cfg(host, mrq);
> +
> +       sdhci_request(mmc, mrq);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>         .keyslot_program        = sdhci_msm_ice_keyslot_program,
>         .keyslot_evict          = sdhci_msm_ice_keyslot_evict,
> @@ -2759,6 +2840,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
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

