Return-Path: <linux-arm-msm+bounces-81324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26800C4FBEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 21:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D76FF1892BE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 20:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CE636B06B;
	Tue, 11 Nov 2025 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6C44jSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CF42E62A6;
	Tue, 11 Nov 2025 20:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762894433; cv=none; b=uXFOXSuwupmT6MeZNEfMzaI4z52mcmR8MWVKXhcjYswINbo+vUbB2zknvDV/L48WjluYLLBVgvBihhFJZAPPDgu8M9zNiTizm/zqzILYxL7tDaBf2N6HVtS8el6JHonAfrMfSW4RM66PHJ4BK4UNgNYPj18f19tSPYwhjrNKFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762894433; c=relaxed/simple;
	bh=0YQm/4JsHCkfx5AWtL5CtnIBWM8Fu5DkUObGIb6oFbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjEPvvqJu5+oXWJA18O67WLE7SeTkz69Ig8Sx6nvsdo0VYdmlUVARxacsZRK3RbTq93ZBehMTTp1bDwmZRlhxZwqv8Qo1ztyp+PTB4KfmKYd8BVNtnD1SG+yyA5pFSTCNHaI4jmscZEJXnxxvL17108BBe9wB2PuSPFqGg2mXeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6C44jSO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63796C113D0;
	Tue, 11 Nov 2025 20:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762894432;
	bh=0YQm/4JsHCkfx5AWtL5CtnIBWM8Fu5DkUObGIb6oFbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6C44jSOxsRg4D1pGq/TSlRiFFX4kh4hlzlHPjBzH7n8+TZlUKHCZ4p33IwD7A+eR
	 kbSjvwmgeODqsyiQowJHQMIFYR89EdybL9q46M2UEp3w7/sKdh/lMcUV7XBVPK4Yoc
	 qlqjCh+zNU0il/kcq99yQfMcdjlhdVLHGrTRxn5ZmTMUcj1epsH+8KJSc9rLvW1R0x
	 3NyTtS58/5DPOCJ5/P4j+TrCltkbKO9ef2PC9wsico68uDtzrCITqayiGCXque/Edp
	 eRnMdz9/u/WjeV8MZOVrS3/+rulxSsqtFEeLposTSyqxUB88aIMRmqUkNZvSJRwTB8
	 6fGNKopUIvxfg==
Date: Tue, 11 Nov 2025 12:52:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_varada@quicinc.com
Subject: Re: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
Message-ID: <20251111205212.GA245945@sol>
References: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111104604.2494305-1-quic_mdalam@quicinc.com>

On Tue, Nov 11, 2025 at 04:16:04PM +0530, Md Sadre Alam wrote:
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

This really should explain that this patch actually applies only to host
controllers that *do* support CQE.  Just they are using a card that
doesn't support CQE or CQE was explicitly disabled.  Right?

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
> +	sdhci_msm_ice_enable(msm_host);
> +}
> +
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	unsigned int crypto_params = 0;
> +	int key_index;
> +	bool crypto_enable;
> +	u64 dun = 0;
> +
> +	if (mrq->crypto_ctx) {
> +		if (!msm_host->ice_init_done) {
> +			sdhci_msm_non_cqe_ice_init(host);
> +			msm_host->ice_init_done = true;
> +		}

This means sdhci_msm_ice_enable() is called only once per host
controller.  It looks like the existing call to sdhci_msm_ice_enable()
happens each time after the host controller is resumed.  So there seems
to be an inconsistency there.  Which way is correct?

> +	} else {
> +		crypto_enable = false;
> +		key_index = 0;
> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);

The values assigned to 'crypto_enable' and 'key_index' are never used.

> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> +{

Could you leave a comment here that notes this is used only for non-CQE
requests and that crypto on CQE requests is handled elsewhere?

- Eric

