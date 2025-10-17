Return-Path: <linux-arm-msm+bounces-77816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05752BEB193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E98C34E50DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8CC3081C2;
	Fri, 17 Oct 2025 17:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCYhCFuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E025307ACE;
	Fri, 17 Oct 2025 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722809; cv=none; b=LwGPrFffVVDLaBZW7/x3AT2i+K+68hXDrW4eP+HuB5MR1Jyfg0m4wOZofvB92GE1FI6cAG+TKW6r49/Fu/KZrEXr91X0rO5GqGRzZ8DIGalu0NElqLa03u7Z1O+5sRZC60JYKWB0zDKD8tkgr89l5BHe8lIGT4w/hdD5QR8fqnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722809; c=relaxed/simple;
	bh=k9b1mXzMWi5+ag/o4MoRly+N/Vmf2GG6Dk0obDic1rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prPxBqTrgJR4N528YQfcgghrA2Oe9oeDgoypogsjpihAiSP40BM7mrnQhLUZLJayE8+ukrtO7bjzOf0mjnBaMITsDBBhltzUueHIqCiFDPMBnY4HNi+Qy4gyXxOg+XL6i5t40j/PPHBYc4KUIw3RdoMIna0HimzWsOLkjIikxD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCYhCFuD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75765C4CEE7;
	Fri, 17 Oct 2025 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760722808;
	bh=k9b1mXzMWi5+ag/o4MoRly+N/Vmf2GG6Dk0obDic1rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCYhCFuDxRC2QibdvAbD5CmMMGI03vqqEMfhZ5/7BlO3EHbIF9xDHGbVzZcjonhtx
	 LiuaE3084aMcg+y1elHFZTBcZVsOBfMgQIdz/5dwNHRN3EzOjk6bRcbBY4xfL/XeAX
	 eHmqwojAIOVa3QCXmPUsyLkkgcj1unz5jyatpMq5Oiz8qM2v3+BgDsKijhDqEUMwVh
	 2cqtRPaERYAWIT3hXavq/i/KB+YmZAbAq401tFuSHUDN2uWEL6wlXTZyDzb4S5SftD
	 wzR5sotACf7MCuIrPSr/Z6SxNKW1r6zpTdUTqVtpT0icFqwVrPsxYGp7Lw1WV6IZ2y
	 KUMf2VNDpTYUQ==
Date: Fri, 17 Oct 2025 10:38:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_varada@quicinc.com
Subject: Re: [PATCH v2] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
Message-ID: <20251017173835.GA161400@sol>
References: <20251014093503.347678-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014093503.347678-1-quic_mdalam@quicinc.com>

On Tue, Oct 14, 2025 at 03:05:03PM +0530, Md Sadre Alam wrote:
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

How was this tested?

>  #ifdef CONFIG_MMC_CRYPTO
>  
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
> +			     u32 slot)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	unsigned int crypto_params = 0;
> +	int key_index = 0;
> +	bool bypass = true;
> +	u64 dun = 0;
> +
> +	if (mrq->crypto_ctx) {
> +		dun = mrq->crypto_ctx->bc_dun[0];
> +		bypass = false;
> +		key_index = mrq->crypto_key_slot;
> +	}
> +
> +	crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, !bypass) |
> +			FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +	cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +
> +	if (mrq->crypto_ctx)
> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
> +
> +	/* Ensure crypto configuration is written before proceeding */
> +	wmb();
> +
> +	return 0;
> +}

This would probably be easier to read with separate code paths for
crypto_ctx != NULL and crypto_ctx == NULL.  Also 'bypass' should be
inverted and renamed to 'crypto_enable' to match the bitfield.  Or just
prepare the bitfield directly, without an intermediate variable.

> @@ -2131,6 +2185,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	struct cqhci_host *cq_host;
>  	bool dma64;
>  	u32 cqcfg;
> +	u32 config;
> +	u32 ice_cap;
>  	int ret;
>  
>  	/*
> @@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	if (ret)
>  		goto cleanup;
>  
> +	/* Initialize ICE for non-CMDQ eMMC devices */
> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +	config &= ~DISABLE_CRYPTO;
> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> +	if (ice_cap & ICE_HCI_SUPPORT) {
> +		config = cqhci_readl(cq_host, CQHCI_CFG);
> +		config |= CRYPTO_GENERAL_ENABLE;
> +		cqhci_writel(cq_host, config, CQHCI_CFG);
> +	}
> +	sdhci_msm_ice_enable(msm_host);

This is after __sdhci_add_host() was called, which is probably too late.

> +#ifdef CONFIG_MMC_CRYPTO
> +	host->mmc_host_ops.request = sdhci_msm_request;
> +#endif
>  	/* Set the timeout value to max possible */
>  	host->max_timeout_count = 0xF;

A lot of the code in this patch also seems to actually run on
CQE-capable hosts.  Can you explain?  Why is it needed?  Is there any
change in behavior on them?

- Eric

