Return-Path: <linux-arm-msm+bounces-82763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13388C76F87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 03:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4742D2AF5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 02:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0176522FDE6;
	Fri, 21 Nov 2025 02:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQdCF6gY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3F1F09A3;
	Fri, 21 Nov 2025 02:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763691154; cv=none; b=tkaU3qBBcPpiX2p1L/2swMSQZybgQ3RJSldzUBeY+1PQUVaknc0uwR6+qyOSEHcvpswatqvWC7cWqdCeWn2AN1/fG3EK/OeJ2A0J+2dblJXH5n9z0ibjaOFPLpZrZhRhI42l56wxsotr2Tz2qLB9cBqZRRPc88zCQIBbx6sRU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763691154; c=relaxed/simple;
	bh=D+QmXdPau5/ZyvC2st3z174mGwtUSfxIKsgwGJ8x1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZRWNUxzrK477ifnpfz5sg2M61/2/rwTxX04gl8QXG1jIxDlqHE1L/MgYLhw6hKWGzaK8ddDrLt+RwNZtciq4HQoMgvLv0encAIQmB2Q9rjUR5KVucndC8zGlsoaHEWhu8H5ksvJnnEzM9VHpLtHbrz1q84fHQIPZdAEgRJv+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQdCF6gY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F91C4CEF1;
	Fri, 21 Nov 2025 02:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763691154;
	bh=D+QmXdPau5/ZyvC2st3z174mGwtUSfxIKsgwGJ8x1EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQdCF6gYJ7evUs9uD2cIT8sNNzMsIaWkzcDH1XCil8t5ycjVzlFMSaqwgOax2DEv5
	 wIfNG2DRp6uOhr923n73fqnkSKtDuvIbyTX3TE+rWNX2sYML0GaWcc3CqQ+LOPNg7C
	 7WcUWgEl3dfE1PM/26k+fEg16V8CnsEiqnEC6c85QMwMq/9kMQ1cnsedGK+5zOev7H
	 nSacNgpjBuzks3fFBVzvOCHZ9MdjPuf6pFIugKhA23ucSfhN/FPtKU+LvNoJJIDXG2
	 Dm3HmFqL70DQjnoqn2D3W5+O+9bGqqIol2hgYYFyUUrNAkWTa7sX/5/yY4H0G2cF69
	 6VVI7xCexh+iA==
Date: Fri, 21 Nov 2025 02:12:32 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, abel.vesa@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mmc: sdhci-msm: Enable ICE for CQE-capable
 controllers with non-CQE cards
Message-ID: <20251121021232.GD3078357@google.com>
References: <20251119114653.751992-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119114653.751992-1-quic_mdalam@quicinc.com>

On Wed, Nov 19, 2025 at 05:16:53PM +0530, Md Sadre Alam wrote:
>  struct sdhci_msm_offset {
>  	u32 core_hc_mode;
>  	u32 core_mci_data_cnt;
> @@ -300,6 +312,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool ice_init_done;

Rename to non_cqe_ice_init_done

> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u32 config;
> +	u32 ice_cap;
> +
> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +	config &= ~DISABLE_CRYPTO;
> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> +	if (ice_cap & ICE_HCI_SUPPORT) {
> +		config = cqhci_readl(cq_host, CQHCI_CFG);
> +		config |= CRYPTO_GENERAL_ENABLE;
> +		cqhci_writel(cq_host, config, CQHCI_CFG);
> +	}
> +}

Why would ICE_HCI_SUPPORT not be set here?  When this is called, the
driver is already in the middle of processing an mmc_request with an
encryption context, due to the driver advertising that it supports
inline crypto earlier.  If the hardware doesn't actually support inline
crypto, that has to be detected earlier.  But I thought it already does.
So it's unclear what checking ICE_HCI_SUPPORT here is meant to achieve.

> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)

This should return void.

> +	if (mrq->crypto_ctx) {
> +		if (!msm_host->ice_init_done) {
> +			sdhci_msm_non_cqe_ice_init(host);
> +			msm_host->ice_init_done = true;
> +		}
> +
> +		crypto_enable = true;
> +		dun = mrq->crypto_ctx->bc_dun[0];
> +		key_index = mrq->crypto_key_slot;
> +		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
> +				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);

No need for the crypto_enable variable.  Just use:

	FIELD_PREP(ICE_HCI_PARAM_CE, 1).

Also no need for the dun variable.  Just use: 

	cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->bc_dun[0]),
		     NONCQ_CRYPTO_DUN);

> + * For CQE requests, crypto is handled in cqhci_request() in
> + * drivers/mmc/host/cqhci-core.c using the existing CQE crypto infrastructure.

It's recommended to not reference file paths like this in kernel code,
since files are sometimes moved around.

- Eric

