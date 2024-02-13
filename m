Return-Path: <linux-arm-msm+bounces-10884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2F8530E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ED0F1F220A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CDA482EE;
	Tue, 13 Feb 2024 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuE8QpI+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4115482CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828581; cv=none; b=dm/uBRLRfUvZC108RH0ZNt9YGJQYanoaU8gPxyQG8tuCke5dU+BIIBulWZcPbjYMQdlkAVGBFPBbPtY+Jf2kQjxAiLkAzizeHcM6Wbi/cM98lCUG+1BlXUSfN7jvW8J3SEnnVJzZ/XYatgOUrmWei0Ty4dbNRpl2jUNE+lXd7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828581; c=relaxed/simple;
	bh=HSuK8gF8xqQlzSUAllq5D6X/pqFlN4vTdtHlcK5UeBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QI3k9WRhKL5FFuAmfwl4cxol84ZcEtXtZcJv0Kp7Hl4JwgiDWV8MH9oCD4z8X9CenbShQAwOBSMEzpRUGQldMO2+rW56ZYwNNZkFrV6lRnunpmuIDetNL+mCo1sz8gaaqy9aLD0M2aFszU4JT2lwN3IlhtNU6B//js5PeTFblio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuE8QpI+; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60792653b94so2992107b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 04:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707828578; x=1708433378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PltJZt/4GisbtWaUCig+Gxgvk8AtsQXf9mPTLTSgx3k=;
        b=GuE8QpI+0/ucIeBnRWUmD3MUGddgsy4Fi+bKHJlY95ce6OMp8AZFYS3eqtN9XXQ3RK
         kjPp1Zxk33Djzh+OMOxICL4pHUuTsOjTt+mQbpfxPMyK90ouE6JtCkOux3UIw5Jr78Fo
         wTLkRafHxW42tkpCO2y3B4PBHtjYoLk5kWHRw1xrNSqIpOUNeI3tY6+726Zdge0TyuA9
         x7YyO4QXigWuV3tkEXkrkmQjB3UtgDfNqsBpEncRmOtBtB/MKdCwsiptYDQpJx3+/5mp
         5TVArc20cKYb4dFADsEM0FjUTiIceashe/6EY5ZW3O8P/bQYFCQ71OliHFLKZHOjr9ut
         w1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828578; x=1708433378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PltJZt/4GisbtWaUCig+Gxgvk8AtsQXf9mPTLTSgx3k=;
        b=I+QhubjRJ9FoF/bj87E9p2OxNSIO+z3Q4I84aFY3GZarT7zNDondst3+3BZqHWlSZn
         GxsjhJuCE4rp8WVLoU+iqQqwAb/0QQyP6N+GzQdDlh7h913rBZCrpdiyHN3mNnQrpdUs
         UkuJmxvu2yCzUfao5PCtiph6Jw36WsWcMHtWO+F4Xp2XVcFHJWG5AaA/SJDlWsAkCpVC
         ykSH/LX1GVm10DTm8PGUhFu3YM9kBZAoagNtrollZyxWUAwXhEVzIiIcpkLA0gwHdV2y
         RF87CzB2XT9dx6cN16B/M2qFJwgK4y3lrQAKO7V0vwSZ3fmyJgnDKGk8RSNGrv8axc9O
         84kw==
X-Gm-Message-State: AOJu0YyqsLIcOYwR2OvlaFbO1RbWOPT2wWx/4PWtMDo76C46/+jfx9oV
	X1Yob1Z3K4ISs3Vd1UvCkKSB+D6WAlXDaverTP8tVWNEXIhLLDHNfnD0mPg4+uP+WKmEJ8fWE4E
	2RA+za1s2IiugjUeAlVp6V6vhf+1duJiUoHxvlg==
X-Google-Smtp-Source: AGHT+IFZTUR6t+Td46CAo+mAkCI61T1Bdp7THvEqZ4Rg9t47+KU4Vr4WFPYRN7MOfIsr49mG+Jk8Zfvv3InHXpEiTrE=
X-Received: by 2002:a81:60c2:0:b0:604:45d:ddb4 with SMTP id
 u185-20020a8160c2000000b00604045dddb4mr8648784ywb.43.1707828578552; Tue, 13
 Feb 2024 04:49:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127232436.2632187-1-quic_gaurkash@quicinc.com> <20240127232436.2632187-2-quic_gaurkash@quicinc.com>
In-Reply-To: <20240127232436.2632187-2-quic_gaurkash@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 13:49:02 +0100
Message-ID: <CAPDyKFqyu4kDYg1Ac=bi4j-M2EYw3bDT602ytspw1KPG2UbS_Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] ice, ufs, mmc: use blk_crypto_key for program_key
To: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	andersson@kernel.org, ebiggers@google.com, neil.armstrong@linaro.org, 
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, kernel@quicinc.com, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_omprsing@quicinc.com, 
	quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org, 
	konrad.dybcio@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	mani@kernel.org, davem@davemloft.net, herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 00:26, Gaurav Kashyap <quic_gaurkash@quicinc.com> wrote:
>
> The program key ops in the storage controller does not
> pass on the blk crypto key structure to ice, this is okay
> when wrapped keys are not supported and keys are standard
> AES XTS sizes. However, wrapped keyblobs can be of any size
> and in preparation for that, modify the ICE and storage
> controller APIs to accept blk_crypto_key.
>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>

I assume this is better funneled via some other tree than the MMC, so:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

> ---
>  drivers/mmc/host/cqhci-crypto.c  | 7 ++++---
>  drivers/mmc/host/cqhci.h         | 2 ++
>  drivers/mmc/host/sdhci-msm.c     | 6 ++++--
>  drivers/soc/qcom/ice.c           | 6 +++---
>  drivers/ufs/core/ufshcd-crypto.c | 7 ++++---
>  drivers/ufs/host/ufs-qcom.c      | 6 ++++--
>  include/soc/qcom/ice.h           | 5 +++--
>  include/ufs/ufshcd.h             | 1 +
>  8 files changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
> index 6652982410ec..91da6de1d650 100644
> --- a/drivers/mmc/host/cqhci-crypto.c
> +++ b/drivers/mmc/host/cqhci-crypto.c
> @@ -32,6 +32,7 @@ cqhci_host_from_crypto_profile(struct blk_crypto_profile *profile)
>  }
>
>  static int cqhci_crypto_program_key(struct cqhci_host *cq_host,
> +                                   const struct blk_crypto_key *bkey,
>                                     const union cqhci_crypto_cfg_entry *cfg,
>                                     int slot)
>  {
> @@ -39,7 +40,7 @@ static int cqhci_crypto_program_key(struct cqhci_host *cq_host,
>         int i;
>
>         if (cq_host->ops->program_key)
> -               return cq_host->ops->program_key(cq_host, cfg, slot);
> +               return cq_host->ops->program_key(cq_host, bkey, cfg, slot);
>
>         /* Clear CFGE */
>         cqhci_writel(cq_host, 0, slot_offset + 16 * sizeof(cfg->reg_val[0]));
> @@ -99,7 +100,7 @@ static int cqhci_crypto_keyslot_program(struct blk_crypto_profile *profile,
>                 memcpy(cfg.crypto_key, key->raw, key->size);
>         }
>
> -       err = cqhci_crypto_program_key(cq_host, &cfg, slot);
> +       err = cqhci_crypto_program_key(cq_host, key, &cfg, slot);
>
>         memzero_explicit(&cfg, sizeof(cfg));
>         return err;
> @@ -113,7 +114,7 @@ static int cqhci_crypto_clear_keyslot(struct cqhci_host *cq_host, int slot)
>          */
>         union cqhci_crypto_cfg_entry cfg = {};
>
> -       return cqhci_crypto_program_key(cq_host, &cfg, slot);
> +       return cqhci_crypto_program_key(cq_host, NULL, &cfg, slot);
>  }
>
>  static int cqhci_crypto_keyslot_evict(struct blk_crypto_profile *profile,
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 1a12e40a02e6..949ebbe05773 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -12,6 +12,7 @@
>  #include <linux/completion.h>
>  #include <linux/wait.h>
>  #include <linux/irqreturn.h>
> +#include <linux/blk-crypto.h>
>  #include <asm/io.h>
>
>  /* registers */
> @@ -291,6 +292,7 @@ struct cqhci_host_ops {
>         void (*post_disable)(struct mmc_host *mmc);
>  #ifdef CONFIG_MMC_CRYPTO
>         int (*program_key)(struct cqhci_host *cq_host,
> +                          const struct blk_crypto_key *bkey,
>                            const union cqhci_crypto_cfg_entry *cfg, int slot);
>  #endif
>  };
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 668e0aceeeba..529ea9f4fa07 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1859,6 +1859,7 @@ static __maybe_unused int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>   * vendor-specific SCM calls for this; it doesn't support the standard way.
>   */
>  static int sdhci_msm_program_key(struct cqhci_host *cq_host,
> +                                const struct blk_crypto_key *bkey,
>                                  const union cqhci_crypto_cfg_entry *cfg,
>                                  int slot)
>  {
> @@ -1866,6 +1867,7 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>         union cqhci_crypto_cap_entry cap;
> +       u8 ice_key_size;
>
>         /* Only AES-256-XTS has been tested so far. */
>         cap = cq_host->crypto_cap_array[cfg->crypto_cap_idx];
> @@ -1873,11 +1875,11 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
>                 cap.key_size != CQHCI_CRYPTO_KEY_SIZE_256)
>                 return -EINVAL;
>
> +       ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
>         if (cfg->config_enable & CQHCI_CRYPTO_CONFIGURATION_ENABLE)
>                 return qcom_ice_program_key(msm_host->ice,
>                                             QCOM_ICE_CRYPTO_ALG_AES_XTS,
> -                                           QCOM_ICE_CRYPTO_KEY_SIZE_256,
> -                                           cfg->crypto_key,
> +                                           ice_key_size, bkey,
>                                             cfg->data_unit_size, slot);
>         else
>                 return qcom_ice_evict_key(msm_host->ice, slot);
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index fbab7fe5c652..6f941d32fffb 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -163,8 +163,8 @@ EXPORT_SYMBOL_GPL(qcom_ice_suspend);
>
>  int qcom_ice_program_key(struct qcom_ice *ice,
>                          u8 algorithm_id, u8 key_size,
> -                        const u8 crypto_key[], u8 data_unit_size,
> -                        int slot)
> +                        const struct blk_crypto_key *bkey,
> +                        u8 data_unit_size, int slot)
>  {
>         struct device *dev = ice->dev;
>         union {
> @@ -183,7 +183,7 @@ int qcom_ice_program_key(struct qcom_ice *ice,
>                 return -EINVAL;
>         }
>
> -       memcpy(key.bytes, crypto_key, AES_256_XTS_KEY_SIZE);
> +       memcpy(key.bytes, bkey->raw, AES_256_XTS_KEY_SIZE);
>
>         /* The SCM call requires that the key words are encoded in big endian */
>         for (i = 0; i < ARRAY_SIZE(key.words); i++)
> diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
> index f4cc54d82281..34537cbac622 100644
> --- a/drivers/ufs/core/ufshcd-crypto.c
> +++ b/drivers/ufs/core/ufshcd-crypto.c
> @@ -18,6 +18,7 @@ static const struct ufs_crypto_alg_entry {
>  };
>
>  static int ufshcd_program_key(struct ufs_hba *hba,
> +                             const struct blk_crypto_key *bkey,
>                               const union ufs_crypto_cfg_entry *cfg, int slot)
>  {
>         int i;
> @@ -27,7 +28,7 @@ static int ufshcd_program_key(struct ufs_hba *hba,
>         ufshcd_hold(hba);
>
>         if (hba->vops && hba->vops->program_key) {
> -               err = hba->vops->program_key(hba, cfg, slot);
> +               err = hba->vops->program_key(hba, bkey, cfg, slot);
>                 goto out;
>         }
>
> @@ -89,7 +90,7 @@ static int ufshcd_crypto_keyslot_program(struct blk_crypto_profile *profile,
>                 memcpy(cfg.crypto_key, key->raw, key->size);
>         }
>
> -       err = ufshcd_program_key(hba, &cfg, slot);
> +       err = ufshcd_program_key(hba, key, &cfg, slot);
>
>         memzero_explicit(&cfg, sizeof(cfg));
>         return err;
> @@ -103,7 +104,7 @@ static int ufshcd_clear_keyslot(struct ufs_hba *hba, int slot)
>          */
>         union ufs_crypto_cfg_entry cfg = {};
>
> -       return ufshcd_program_key(hba, &cfg, slot);
> +       return ufshcd_program_key(hba, NULL, &cfg, slot);
>  }
>
>  static int ufshcd_crypto_keyslot_evict(struct blk_crypto_profile *profile,
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 39eef470f8fa..acf352594362 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -144,6 +144,7 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
>  }
>
>  static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
> +                                   const struct blk_crypto_key *bkey,
>                                     const union ufs_crypto_cfg_entry *cfg,
>                                     int slot)
>  {
> @@ -151,6 +152,7 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
>         union ufs_crypto_cap_entry cap;
>         bool config_enable =
>                 cfg->config_enable & UFS_CRYPTO_CONFIGURATION_ENABLE;
> +       u8 ice_key_size;
>
>         /* Only AES-256-XTS has been tested so far. */
>         cap = hba->crypto_cap_array[cfg->crypto_cap_idx];
> @@ -158,11 +160,11 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
>             cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
>                 return -EOPNOTSUPP;
>
> +       ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
>         if (config_enable)
>                 return qcom_ice_program_key(host->ice,
>                                             QCOM_ICE_CRYPTO_ALG_AES_XTS,
> -                                           QCOM_ICE_CRYPTO_KEY_SIZE_256,
> -                                           cfg->crypto_key,
> +                                           ice_key_size, bkey,
>                                             cfg->data_unit_size, slot);
>         else
>                 return qcom_ice_evict_key(host->ice, slot);
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 5870a94599a2..9dd835dba2a7 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -7,6 +7,7 @@
>  #define __QCOM_ICE_H__
>
>  #include <linux/types.h>
> +#include <linux/blk-crypto.h>
>
>  struct qcom_ice;
>
> @@ -30,8 +31,8 @@ int qcom_ice_resume(struct qcom_ice *ice);
>  int qcom_ice_suspend(struct qcom_ice *ice);
>  int qcom_ice_program_key(struct qcom_ice *ice,
>                          u8 algorithm_id, u8 key_size,
> -                        const u8 crypto_key[], u8 data_unit_size,
> -                        int slot);
> +                        const struct blk_crypto_key *bkey,
> +                        u8 data_unit_size, int slot);
>  int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
>  struct qcom_ice *of_qcom_ice_get(struct device *dev);
>  #endif /* __QCOM_ICE_H__ */
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index cb2afcebbdf5..582d5a747e84 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -363,6 +363,7 @@ struct ufs_hba_variant_ops {
>                                 struct devfreq_dev_profile *profile,
>                                 struct devfreq_simple_ondemand_data *data);
>         int     (*program_key)(struct ufs_hba *hba,
> +                              const struct blk_crypto_key *bkey,
>                                const union ufs_crypto_cfg_entry *cfg, int slot);
>         void    (*event_notify)(struct ufs_hba *hba,
>                                 enum ufs_event_type evt, void *data);
> --
> 2.43.0
>

