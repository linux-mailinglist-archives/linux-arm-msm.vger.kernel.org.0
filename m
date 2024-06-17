Return-Path: <linux-arm-msm+bounces-22809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F23CD90A7C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE381F23D76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 07:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEAE18FDD9;
	Mon, 17 Jun 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykf/fZac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55D18FDA3
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610887; cv=none; b=qpJ0wJqEB8XHxa6RbXnw2qNfjgMvETf09NMq06AoUoTvNW6OyvvvJrwTc9k70FpVdjFL9HDYVxVoQVpXS7kEkBkhCvyua0Gb/Qp/lPxP5LDX6zoASBrhUnjp9K8VdbikdEVUPEVYxtJyiV3OUVrz8FkWcueMU0/0pWcqpoSIM2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610887; c=relaxed/simple;
	bh=pkiVzCiXOsb8Fmyy5UeV55lfclFZglq4ojL/Y0M1LIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ru/bvyDqXO5QvwO7ebaKFUDlc4G/Q0c7S75xTo4xhk0l+WCGtnQstK3ODBiJ0o7EmSiHd67LDlTJjjOSSH8oVRppqksHm1XDG0uSz/vJZJKMVjvUIQlCH8/ptEomYipF2QEtNidCO+dgPSRNOtSsvoak6MTPAkzfYrvxvs3IWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykf/fZac; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so46704361fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718610884; x=1719215684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvHTWZh3SokmdNjxkdtSNtzGeiXleD8xQv+taJV8T10=;
        b=ykf/fZacCMdOBMK+Nictq8RmgBED0A8pKaH3bgaEr3Bq7tc7FvmSA1s/S36JaKFkzy
         3xakFAaJdOk1Z3FspX3UmetPjjmC/Bd/vBP5S5C3nzgBQLXOtpGKs8sujjRWdqXqdvp1
         A8CZF9QDrwlMoUVSU3eTJqMuzmWNU4+AX6b8/DhrMVWA7Wb4Qgmcxw/oEfVwPmnoUAns
         P137yPKpITSkB+xr68O36GaPJjKnkok7Ou2naHKhLTGnrGS+mpv7hcZNSuWTXts9VAHe
         RdE1Ot6ni373SRMVnHNAOZLtF8wFSHGcyxCL5i++56gHwS2UWsqaF3/KhlmcUTr7rj3f
         ep5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718610884; x=1719215684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvHTWZh3SokmdNjxkdtSNtzGeiXleD8xQv+taJV8T10=;
        b=D1QIOebTMq1CC9ZNNyWV7IF7Yq1St/8M9rKUHqb2iknvx6Bs6eDC9e90CYsYnrZ4Hg
         eZYHnFGtw0gLcKLtM+TBsLVp9oRPhVlVXc53xftJtFDlxpa8sYHquBs3WERlD6itWAhk
         UaNfqKghC6AuGJhWg75e0VA3dx/hSe+noH7fRaEXyZMjA7dnYbCnk602GBS9yn48Gf4p
         vlQ+YfIb8YBMJCGXfqZJEH0iDpJpS84vJ2gcRp8eC1wCAeECNvmeuPpeoDtQnji+3uRQ
         wbGixhTs819dUBMM9VSDVch/UYV3jDiWSjDuGdRBBxLeIcAG58C820dHqc8zhZTCkyjv
         i/BA==
X-Gm-Message-State: AOJu0YzfTrOW7DS42nOy62vQWGkKwi3ODFnVEAhha6/yLLtE1cf33rEy
	y/1S93nl6VH0zQcvlq49Y9e8xHAsNkdbThAqOMXbHCwNVe+eAN/4b1ZSRBzRDa8=
X-Google-Smtp-Source: AGHT+IEVZgF7GuqCy2gMgL5vTvx4VTzWWZjwFflwFmRAPAD+6Lhdke8DJW2mMtdoRuiYOwZ5VzZWpw==
X-Received: by 2002:a2e:a415:0:b0:2ec:1c95:ff02 with SMTP id 38308e7fff4ca-2ec1c9600c0mr45719121fa.7.1718610883660;
        Mon, 17 Jun 2024 00:54:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c89a1fsm12615441fa.106.2024.06.17.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 00:54:43 -0700 (PDT)
Date: Mon, 17 Jun 2024 10:54:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	andersson@kernel.org, ebiggers@google.com, neil.armstrong@linaro.org, 
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	kernel@quicinc.com, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_omprsing@quicinc.com, quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org, 
	konrad.dybcio@linaro.org, ulf.hansson@linaro.org, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, mani@kernel.org, davem@davemloft.net, 
	herbert@gondor.apana.org.au, psodagud@quicinc.com, quic_apurupa@quicinc.com, 
	sonalg@quicinc.com
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Message-ID: <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617005825.1443206-5-quic_gaurkash@quicinc.com>

On Sun, Jun 16, 2024 at 05:50:59PM GMT, Gaurav Kashyap wrote:
> Qualcomm's ICE (Inline Crypto Engine) contains a proprietary
> key management hardware called Hardware Key Manager (HWKM).
> This patch integrates HWKM support in ICE when it is
> available. HWKM primarily provides hardware wrapped key support
> where the ICE (storage) keys are not available in software and
> protected in hardware.
> 
> When HWKM software support is not fully available (from Trustzone),
> there can be a scenario where the ICE hardware supports HWKM, but
> it cannot be used for wrapped keys. In this case, standard keys have
> to be used without using HWKM. Hence, providing a toggle controlled
> by a devicetree entry to use HWKM or not.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> ---
>  drivers/soc/qcom/ice.c | 153 +++++++++++++++++++++++++++++++++++++++--
>  include/soc/qcom/ice.h |   1 +
>  2 files changed, 150 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 6f941d32fffb..d5e74cf2946b 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -26,6 +26,40 @@
>  #define QCOM_ICE_REG_FUSE_SETTING		0x0010
>  #define QCOM_ICE_REG_BIST_STATUS		0x0070
>  #define QCOM_ICE_REG_ADVANCED_CONTROL		0x1000
> +#define QCOM_ICE_REG_CONTROL			0x0
> +/* QCOM ICE HWKM registers */
> +#define QCOM_ICE_REG_HWKM_TZ_KM_CTL			0x1000
> +#define QCOM_ICE_REG_HWKM_TZ_KM_STATUS			0x1004
> +#define QCOM_ICE_REG_HWKM_BANK0_BANKN_IRQ_STATUS	0x2008
> +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_0			0x5000
> +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_1			0x5004
> +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_2			0x5008
> +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_3			0x500C
> +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_4			0x5010
> +
> +/* QCOM ICE HWKM reg vals */
> +#define QCOM_ICE_HWKM_BIST_DONE_V1		BIT(16)
> +#define QCOM_ICE_HWKM_BIST_DONE_V2		BIT(9)
> +#define QCOM_ICE_HWKM_BIST_DONE(ver)		QCOM_ICE_HWKM_BIST_DONE_V##ver
> +
> +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V1		BIT(14)
> +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V2		BIT(7)
> +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE(v)		QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V##v
> +
> +#define QCOM_ICE_HWKM_BOOT_CMD_LIST1_DONE		BIT(2)
> +#define QCOM_ICE_HWKM_BOOT_CMD_LIST0_DONE		BIT(1)
> +#define QCOM_ICE_HWKM_KT_CLEAR_DONE			BIT(0)
> +
> +#define QCOM_ICE_HWKM_BIST_VAL(v)	(QCOM_ICE_HWKM_BIST_DONE(v) |		\
> +					QCOM_ICE_HWKM_CRYPTO_BIST_DONE(v) |	\
> +					QCOM_ICE_HWKM_BOOT_CMD_LIST1_DONE |	\
> +					QCOM_ICE_HWKM_BOOT_CMD_LIST0_DONE |	\
> +					QCOM_ICE_HWKM_KT_CLEAR_DONE)
> +
> +#define QCOM_ICE_HWKM_V1_STANDARD_MODE_VAL	(BIT(0) | BIT(1) | BIT(2))
> +#define QCOM_ICE_HWKM_V2_STANDARD_MODE_MASK	GENMASK(31, 1)
> +#define QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL	(BIT(1) | BIT(2))
> +#define QCOM_ICE_HWKM_RSP_FIFO_CLEAR_VAL	BIT(3)
>  
>  /* BIST ("built-in self-test") status flags */
>  #define QCOM_ICE_BIST_STATUS_MASK		GENMASK(31, 28)
> @@ -34,6 +68,9 @@
>  #define QCOM_ICE_FORCE_HW_KEY0_SETTING_MASK	0x2
>  #define QCOM_ICE_FORCE_HW_KEY1_SETTING_MASK	0x4
>  
> +#define QCOM_ICE_HWKM_REG_OFFSET	0x8000
> +#define HWKM_OFFSET(reg)		((reg) + QCOM_ICE_HWKM_REG_OFFSET)
> +
>  #define qcom_ice_writel(engine, val, reg)	\
>  	writel((val), (engine)->base + (reg))
>  
> @@ -46,6 +83,9 @@ struct qcom_ice {
>  	struct device_link *link;
>  
>  	struct clk *core_clk;
> +	u8 hwkm_version;
> +	bool use_hwkm;
> +	bool hwkm_init_complete;
>  };
>  
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> @@ -63,8 +103,21 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
>  		return false;
>  	}
>  
> -	dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
> -		 major, minor, step);
> +	if (major >= 4 || (major == 3 && minor == 2 && step >= 1))
> +		ice->hwkm_version = 2;
> +	else if (major == 3 && minor == 2)
> +		ice->hwkm_version = 1;
> +	else
> +		ice->hwkm_version = 0;
> +
> +	if (ice->hwkm_version == 0)
> +		ice->use_hwkm = false;
> +
> +	dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d, HWKM v%d\n",
> +		 major, minor, step, ice->hwkm_version);
> +
> +	if (!ice->use_hwkm)
> +		dev_info(dev, "QC ICE HWKM (Hardware Key Manager) not used/supported");
>  
>  	/* If fuses are blown, ICE might not work in the standard way. */
>  	regval = qcom_ice_readl(ice, QCOM_ICE_REG_FUSE_SETTING);
> @@ -113,27 +166,106 @@ static void qcom_ice_optimization_enable(struct qcom_ice *ice)
>   * fails, so we needn't do it in software too, and (c) properly testing
>   * storage encryption requires testing the full storage stack anyway,
>   * and not relying on hardware-level self-tests.
> + *
> + * However, we still care about if HWKM BIST failed (when supported) as
> + * important functionality would fail later, so disable hwkm on failure.
>   */
>  static int qcom_ice_wait_bist_status(struct qcom_ice *ice)
>  {
>  	u32 regval;
> +	u32 bist_done_val;
>  	int err;
>  
>  	err = readl_poll_timeout(ice->base + QCOM_ICE_REG_BIST_STATUS,
>  				 regval, !(regval & QCOM_ICE_BIST_STATUS_MASK),
>  				 50, 5000);
> -	if (err)
> +	if (err) {
>  		dev_err(ice->dev, "Timed out waiting for ICE self-test to complete\n");
> +		return err;
> +	}
>  
> +	if (ice->use_hwkm) {
> +		bist_done_val = ice->hwkm_version == 1 ?
> +				QCOM_ICE_HWKM_BIST_VAL(1) :
> +				QCOM_ICE_HWKM_BIST_VAL(2);
> +		if (qcom_ice_readl(ice,
> +				   HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_STATUS)) !=
> +				   bist_done_val) {
> +			dev_err(ice->dev, "HWKM BIST error\n");
> +			ice->use_hwkm = false;
> +			err = -ENODEV;
> +		}
> +	}
>  	return err;
>  }
>  
> +static void qcom_ice_enable_standard_mode(struct qcom_ice *ice)
> +{
> +	u32 val = 0;
> +
> +	/*
> +	 * When ICE is in standard (hwkm) mode, it supports HW wrapped
> +	 * keys, and when it is in legacy mode, it only supports standard
> +	 * (non HW wrapped) keys.

I can't say this is very logical.

standard mode => HW wrapped keys
legacy mode => standard keys

Consider changing the terms.

> +	 *
> +	 * Put ICE in standard mode, ICE defaults to legacy mode.
> +	 * Legacy mode - ICE HWKM slave not supported.
> +	 * Standard mode - ICE HWKM slave supported.

s/slave/some other term/

Is it possible to use both kind of keys when working on standard mode?
If not, it should be the user who selects what type of keys to be used.
Enforcing this via DT is not a way to go.

> +	 *
> +	 * Depending on the version of HWKM, it is controlled by different
> +	 * registers in ICE.
> +	 */
> +	if (ice->hwkm_version >= 2) {
> +		val = qcom_ice_readl(ice, QCOM_ICE_REG_CONTROL);
> +		val = val & QCOM_ICE_HWKM_V2_STANDARD_MODE_MASK;
> +		qcom_ice_writel(ice, val, QCOM_ICE_REG_CONTROL);
> +	} else {
> +		qcom_ice_writel(ice, QCOM_ICE_HWKM_V1_STANDARD_MODE_VAL,
> +				HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_CTL));
> +	}
> +}
> +
> +static void qcom_ice_hwkm_init(struct qcom_ice *ice)
> +{
> +	/* Disable CRC checks. This HWKM feature is not used. */
> +	qcom_ice_writel(ice, QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL,
> +			HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_CTL));
> +
> +	/*
> +	 * Give register bank of the HWKM slave access to read and modify
> +	 * the keyslots in ICE HWKM slave. Without this, trustzone will not
> +	 * be able to program keys into ICE.
> +	 */
> +	qcom_ice_writel(ice, GENMASK(31, 0), HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_0));
> +	qcom_ice_writel(ice, GENMASK(31, 0), HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_1));
> +	qcom_ice_writel(ice, GENMASK(31, 0), HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_2));
> +	qcom_ice_writel(ice, GENMASK(31, 0), HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_3));
> +	qcom_ice_writel(ice, GENMASK(31, 0), HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_4));
> +
> +	/* Clear HWKM response FIFO before doing anything */
> +	qcom_ice_writel(ice, QCOM_ICE_HWKM_RSP_FIFO_CLEAR_VAL,
> +			HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BANKN_IRQ_STATUS));
> +	ice->hwkm_init_complete = true;
> +}
> +
>  int qcom_ice_enable(struct qcom_ice *ice)
>  {
> +	int err;
> +
>  	qcom_ice_low_power_mode_enable(ice);
>  	qcom_ice_optimization_enable(ice);
>  
> -	return qcom_ice_wait_bist_status(ice);
> +	if (ice->use_hwkm)
> +		qcom_ice_enable_standard_mode(ice);
> +
> +	err = qcom_ice_wait_bist_status(ice);
> +	if (err)
> +		return err;
> +
> +	if (ice->use_hwkm)
> +		qcom_ice_hwkm_init(ice);
> +
> +	return err;
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_enable);
>  
> @@ -149,6 +281,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  		return err;
>  	}
>  
> +	if (ice->use_hwkm) {
> +		qcom_ice_enable_standard_mode(ice);
> +		qcom_ice_hwkm_init(ice);
> +	}
>  	return qcom_ice_wait_bist_status(ice);
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_resume);
> @@ -156,6 +292,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>  int qcom_ice_suspend(struct qcom_ice *ice)
>  {
>  	clk_disable_unprepare(ice->core_clk);
> +	ice->hwkm_init_complete = false;
>  
>  	return 0;
>  }
> @@ -205,6 +342,12 @@ int qcom_ice_evict_key(struct qcom_ice *ice, int slot)
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
>  

Documentation?

> +bool qcom_ice_hwkm_supported(struct qcom_ice *ice)
> +{
> +	return ice->use_hwkm;

I see that use_hwkm can change during runtime. Will it have an impact on
a driver that calls this first?

> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_hwkm_supported);
> +
>  static struct qcom_ice *qcom_ice_create(struct device *dev,
>  					void __iomem *base)
>  {
> @@ -239,6 +382,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  		engine->core_clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(engine->core_clk))
>  		return ERR_CAST(engine->core_clk);
> +	engine->use_hwkm = of_property_read_bool(dev->of_node,
> +						 "qcom,ice-use-hwkm");

DT bindings should come before driver changes.

>  
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 9dd835dba2a7..1f52e82e3e1c 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -34,5 +34,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
>  			 const struct blk_crypto_key *bkey,
>  			 u8 data_unit_size, int slot);
>  int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
> +bool qcom_ice_hwkm_supported(struct qcom_ice *ice);
>  struct qcom_ice *of_qcom_ice_get(struct device *dev);
>  #endif /* __QCOM_ICE_H__ */
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

