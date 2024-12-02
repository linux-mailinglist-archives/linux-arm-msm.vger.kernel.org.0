Return-Path: <linux-arm-msm+bounces-39874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CD9E03ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64C46B393C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61673201264;
	Mon,  2 Dec 2024 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFNTD5hP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA2201266
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141708; cv=none; b=HJdovn6M9dDsj0KrTxEJPc/rpJtr4otfT6SyiskXCJKxr58T6FKa4erQnyNaVS6CAfDzTY77OxQQQZHVmMwG+e5UKJ5Mkvl5/OLDyguBtfT6IV40rtsLbc04Thp1EbYtpAxtJMhucFP+ScL2l0f3QF9J0jef5wdSVrF9uVFfseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141708; c=relaxed/simple;
	bh=pHfVjNEEh/wMlbXR+sgmDo/atvBDTwrvCHNUtEeP3ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7drBvD3350Y5JI0r5uV6GVlV9l6gtCS07aLT5QzVxQNUULCvViKGfIaLiqsSqByYha4heMa1VrWBNTQ9dtKUvS/oesDRyvcYG+sQV0WEO9UdabDmwi/HkBHj7A2AoEiocyc3UQNnypVC1fhX0woWiZlnOacup+FEh/pMI2BRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFNTD5hP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de579f775so5669685e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 04:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733141704; x=1733746504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQLjFN+ad6DknoNFL/xQC6JiLu4HezZqiafAvmDmEZA=;
        b=iFNTD5hPRwVLssWUbYT6xPIbhwz/dAOsEKVLirSSYUPQokjC1qfQKrFcJoOcpuzz4x
         H9TQ44PtmwzXdd3qRGUTpStBSIliNSozKY3nvPyYwow6/yILBqmOcXdRsoQ9mq7Qt1IN
         G333FDGagQzzzhp2aIft9rf3KUbw3xjgQznrnTTLxG6Q+/R5mQVcnemgcR4KHwWAF30W
         R4ILbJYTmn0A0euAbszAuU5km2y5r7E84C6jqIN7kir4jU2VN3WfSl6SpuAl/7hhGfZE
         kCKl7sYYCkDBYJmt5MI9hsSk+eeJvy08wFwK/OwMtNhPFHh+7nHWo1Z2atXFB68BoAjU
         gGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141704; x=1733746504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQLjFN+ad6DknoNFL/xQC6JiLu4HezZqiafAvmDmEZA=;
        b=rNqRAF7EaQi/uUTzCSQlqznuPE2bqdXxMr4z3uTZYu9hhdzI1i992ZbtTw8+DP/FNt
         bD5kOdpTSH60jEd1eOIaD/KTvTZfVeT3v5rH3yAusrQc4QDiKrLZ0hOGFz2wyXLO67ii
         coDrJ9Qe5gEUGrZeMSpXCfQc6Q+yFXflk9bz2dXDOM69QWZsQbh0d8gJQGKsqVslFLeJ
         7xMWDizgi6ubVVwIU9AvW6Rk8QAxfEpa3bQFKSH27TFr5quJBBu9mZ0Oarb7i5cw4T0z
         U2zkAP7ztVSYtBqllf38pch4uTviiK1AdlxpeFIoFNo63/3nR7r7331dESZQWcN1GtjT
         APNg==
X-Forwarded-Encrypted: i=1; AJvYcCWaGIvMkCuV99XUBtd0Id+sNqLfDNFWvuCZfVZZ2qErQIbzt4hejRYw3PgoJrYSXc//O1eS0+oavZGpl4GF@vger.kernel.org
X-Gm-Message-State: AOJu0YzNicaV6wD2UEa8X7SQ+gvOWJ0T5xdddiJZpqpIbu1dkUSli7kg
	Gi+JGhWZHFwBR9qhVB2HLeRin/olDipFwLcZZ/pPA7JYxA8wE1R40U9urIAD7gE=
X-Gm-Gg: ASbGncvz7it2JD8AqzaT8kI72oBE9bHFQFZsb2CtEqnIEFBBq+Eeh5b0PxOppSqZc5Q
	xw6dBHRzbrIPqslj8M+IS1n8H09Z7CwgoenCKpxoKsGN2SGTYtV1UwHbPMvBhaUVULzRUsDZtrx
	R1wHP9BUsw6l5MusWRiBhYITEE7/R+mX3rdSvQZqBKDz+fAm1qosP/0wF0ehnFVC9hmSlcUDtJS
	nujsSyPDQku/NKdwq98AolT/s/F8u7gLY+R5ZDCnshMSJH7NfWmfCoWqAXKyqJ70PljB7Fvo3vd
	OCJyMEGn2ig24fU24q/xnvk4GXwVYA==
X-Google-Smtp-Source: AGHT+IEblCu2/E7pOP/ZplNZ7O4yo7Im4dY8c9OK4EzpmDUpTW0MiJjLp/hOHpaQmd9y/88KYDepsw==
X-Received: by 2002:a05:6512:2398:b0:53d:e4cc:f5f2 with SMTP id 2adb3069b0e04-53df01172b7mr17188572e87.56.1733141703966;
        Mon, 02 Dec 2024 04:15:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f2b8sm1463235e87.151.2024.12.02.04.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:15:02 -0800 (PST)
Date: Mon, 2 Dec 2024 14:15:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Asutosh Das <quic_asutoshd@quicinc.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Om Prakash Singh <quic_omprsing@quicinc.com>
Subject: Re: [PATCH RESEND v7 05/17] ice, ufs, mmc: use the blk_crypto_key
 struct when programming the key
Message-ID: <ju5mbbuowwfcfvx7mtxazthhmg2qwciw4nsivaevucwkvapwmb@lei2evlubjdo>
References: <20241202-wrapped-keys-v7-0-67c3ca3f3282@linaro.org>
 <20241202-wrapped-keys-v7-5-67c3ca3f3282@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-wrapped-keys-v7-5-67c3ca3f3282@linaro.org>

On Mon, Dec 02, 2024 at 01:02:21PM +0100, Bartosz Golaszewski wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> The program key ops in the storage controller does not pass on the
> blk_crypto_key structure to ICE, this is okay with raw keys of standard
> AES XTS sizes. However, wrapped keyblobs can be of any size and in
> preparation for that, modify the ICE and storage controller APIs to
> accept blk_crypto_key which can carry larger keys and indicate their
> size.
> 
> Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

I think this needs to be split on a per-subsystem basis. Otherwise it
might be impossible to merge.

> 
> diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
> index 6652982410ec5..91da6de1d6501 100644
> --- a/drivers/mmc/host/cqhci-crypto.c
> +++ b/drivers/mmc/host/cqhci-crypto.c
> @@ -32,6 +32,7 @@ cqhci_host_from_crypto_profile(struct blk_crypto_profile *profile)
>  }
>  
>  static int cqhci_crypto_program_key(struct cqhci_host *cq_host,
> +				    const struct blk_crypto_key *bkey,
>  				    const union cqhci_crypto_cfg_entry *cfg,
>  				    int slot)
>  {
> @@ -39,7 +40,7 @@ static int cqhci_crypto_program_key(struct cqhci_host *cq_host,
>  	int i;
>  
>  	if (cq_host->ops->program_key)
> -		return cq_host->ops->program_key(cq_host, cfg, slot);
> +		return cq_host->ops->program_key(cq_host, bkey, cfg, slot);
>  
>  	/* Clear CFGE */
>  	cqhci_writel(cq_host, 0, slot_offset + 16 * sizeof(cfg->reg_val[0]));
> @@ -99,7 +100,7 @@ static int cqhci_crypto_keyslot_program(struct blk_crypto_profile *profile,
>  		memcpy(cfg.crypto_key, key->raw, key->size);
>  	}
>  
> -	err = cqhci_crypto_program_key(cq_host, &cfg, slot);
> +	err = cqhci_crypto_program_key(cq_host, key, &cfg, slot);
>  
>  	memzero_explicit(&cfg, sizeof(cfg));
>  	return err;
> @@ -113,7 +114,7 @@ static int cqhci_crypto_clear_keyslot(struct cqhci_host *cq_host, int slot)
>  	 */
>  	union cqhci_crypto_cfg_entry cfg = {};
>  
> -	return cqhci_crypto_program_key(cq_host, &cfg, slot);
> +	return cqhci_crypto_program_key(cq_host, NULL, &cfg, slot);
>  }
>  
>  static int cqhci_crypto_keyslot_evict(struct blk_crypto_profile *profile,
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index fab9d74445ba7..06099fd32f23e 100644
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
>  	void (*post_disable)(struct mmc_host *mmc);
>  #ifdef CONFIG_MMC_CRYPTO
>  	int (*program_key)(struct cqhci_host *cq_host,
> +			   const struct blk_crypto_key *bkey,
>  			   const union cqhci_crypto_cfg_entry *cfg, int slot);
>  #endif
>  	void (*set_tran_desc)(struct cqhci_host *cq_host, u8 **desc,
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1c..b8770524c0087 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1859,6 +1859,7 @@ static __maybe_unused int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>   * vendor-specific SCM calls for this; it doesn't support the standard way.
>   */
>  static int sdhci_msm_program_key(struct cqhci_host *cq_host,
> +				 const struct blk_crypto_key *bkey,
>  				 const union cqhci_crypto_cfg_entry *cfg,
>  				 int slot)
>  {
> @@ -1866,6 +1867,7 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>  	union cqhci_crypto_cap_entry cap;
> +	u8 ice_key_size;
>  
>  	/* Only AES-256-XTS has been tested so far. */
>  	cap = cq_host->crypto_cap_array[cfg->crypto_cap_idx];
> @@ -1873,11 +1875,11 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
>  		cap.key_size != CQHCI_CRYPTO_KEY_SIZE_256)
>  		return -EINVAL;
>  
> +	ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
>  	if (cfg->config_enable & CQHCI_CRYPTO_CONFIGURATION_ENABLE)
>  		return qcom_ice_program_key(msm_host->ice,
>  					    QCOM_ICE_CRYPTO_ALG_AES_XTS,
> -					    QCOM_ICE_CRYPTO_KEY_SIZE_256,
> -					    cfg->crypto_key,
> +					    ice_key_size, bkey,
>  					    cfg->data_unit_size, slot);
>  	else
>  		return qcom_ice_evict_key(msm_host->ice, slot);
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 393d2d1d275f1..e89baaf574bc1 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -163,8 +163,8 @@ EXPORT_SYMBOL_GPL(qcom_ice_suspend);
>  
>  int qcom_ice_program_key(struct qcom_ice *ice,
>  			 u8 algorithm_id, u8 key_size,
> -			 const u8 crypto_key[], u8 data_unit_size,
> -			 int slot)
> +			 const struct blk_crypto_key *bkey,
> +			 u8 data_unit_size, int slot)
>  {
>  	struct device *dev = ice->dev;
>  	union {
> @@ -183,7 +183,7 @@ int qcom_ice_program_key(struct qcom_ice *ice,
>  		return -EINVAL;
>  	}
>  
> -	memcpy(key.bytes, crypto_key, AES_256_XTS_KEY_SIZE);
> +	memcpy(key.bytes, bkey->raw, AES_256_XTS_KEY_SIZE);
>  
>  	/* The SCM call requires that the key words are encoded in big endian */
>  	for (i = 0; i < ARRAY_SIZE(key.words); i++)
> diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
> index 7d3a3e228db0d..33083e0cad6e1 100644
> --- a/drivers/ufs/core/ufshcd-crypto.c
> +++ b/drivers/ufs/core/ufshcd-crypto.c
> @@ -18,6 +18,7 @@ static const struct ufs_crypto_alg_entry {
>  };
>  
>  static int ufshcd_program_key(struct ufs_hba *hba,
> +			      const struct blk_crypto_key *bkey,
>  			      const union ufs_crypto_cfg_entry *cfg, int slot)
>  {
>  	int i;
> @@ -27,7 +28,7 @@ static int ufshcd_program_key(struct ufs_hba *hba,
>  	ufshcd_hold(hba);
>  
>  	if (hba->vops && hba->vops->program_key) {
> -		err = hba->vops->program_key(hba, cfg, slot);
> +		err = hba->vops->program_key(hba, bkey, cfg, slot);
>  		goto out;
>  	}
>  
> @@ -89,7 +90,7 @@ static int ufshcd_crypto_keyslot_program(struct blk_crypto_profile *profile,
>  		memcpy(cfg.crypto_key, key->raw, key->size);
>  	}
>  
> -	err = ufshcd_program_key(hba, &cfg, slot);
> +	err = ufshcd_program_key(hba, key, &cfg, slot);
>  
>  	memzero_explicit(&cfg, sizeof(cfg));
>  	return err;
> @@ -107,7 +108,7 @@ static int ufshcd_crypto_keyslot_evict(struct blk_crypto_profile *profile,
>  	 */
>  	union ufs_crypto_cfg_entry cfg = {};
>  
> -	return ufshcd_program_key(hba, &cfg, slot);
> +	return ufshcd_program_key(hba, NULL, &cfg, slot);
>  }
>  
>  /*
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 68040b2ab5f82..44fb4a4c0f2d7 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -150,6 +150,7 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
>  }
>  
>  static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
> +				    const struct blk_crypto_key *bkey,
>  				    const union ufs_crypto_cfg_entry *cfg,
>  				    int slot)
>  {
> @@ -157,6 +158,7 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
>  	union ufs_crypto_cap_entry cap;
>  	bool config_enable =
>  		cfg->config_enable & UFS_CRYPTO_CONFIGURATION_ENABLE;
> +	u8 ice_key_size;
>  
>  	/* Only AES-256-XTS has been tested so far. */
>  	cap = hba->crypto_cap_array[cfg->crypto_cap_idx];
> @@ -164,11 +166,11 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
>  	    cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
>  		return -EOPNOTSUPP;
>  
> +	ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
>  	if (config_enable)
>  		return qcom_ice_program_key(host->ice,
>  					    QCOM_ICE_CRYPTO_ALG_AES_XTS,
> -					    QCOM_ICE_CRYPTO_KEY_SIZE_256,
> -					    cfg->crypto_key,
> +					    ice_key_size, bkey,
>  					    cfg->data_unit_size, slot);
>  	else
>  		return qcom_ice_evict_key(host->ice, slot);
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 5870a94599a25..9dd835dba2a78 100644
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
>  			 u8 algorithm_id, u8 key_size,
> -			 const u8 crypto_key[], u8 data_unit_size,
> -			 int slot);
> +			 const struct blk_crypto_key *bkey,
> +			 u8 data_unit_size, int slot);
>  int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
>  struct qcom_ice *of_qcom_ice_get(struct device *dev);
>  #endif /* __QCOM_ICE_H__ */
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index d7aca9e61684f..bc6f08397769c 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -373,6 +373,7 @@ struct ufs_hba_variant_ops {
>  				struct devfreq_dev_profile *profile,
>  				struct devfreq_simple_ondemand_data *data);
>  	int	(*program_key)(struct ufs_hba *hba,
> +			       const struct blk_crypto_key *bkey,
>  			       const union ufs_crypto_cfg_entry *cfg, int slot);
>  	int	(*fill_crypto_prdt)(struct ufs_hba *hba,
>  				    const struct bio_crypt_ctx *crypt_ctx,
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

