Return-Path: <linux-arm-msm+bounces-78251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0DBFA1B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C305550450E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C362EFD9E;
	Wed, 22 Oct 2025 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujacSTim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836172EFD98;
	Wed, 22 Oct 2025 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111957; cv=none; b=cKyvsRoHd5R1OTbO8taXSbD3/tj9DSxE+nUEequA9c8xDFHXe6b3GCobp1rs8xR3in6/QYw/qOoIbkqXHDT3FArWb+bJVEhO772VvgWut8mkVxrfonA86c4p8UfXsvx16mJESKq2Hcb2ehVObrs4TNO2IWIyPB1Sz69OXHOBTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111957; c=relaxed/simple;
	bh=nzVEduC9/Kkg41xlskrupc7IxgWOKnClJj35t5wA9hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtjK1pR7Oq0Iu1yaU5Gd2wIxKl//uxLYSVdEkQxu2pzhHcXYF+YY6fPXdvtiY+20uvsKHg2QvSR5LewL6kvrNhLfKZ0weTBOvGi0t5CIKjGT5qRirckiPE3w7JDPpfVKxc2l+zjCe4a7+sGEyFSxWwJcQ0D9OsXzMtg3J9GhciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujacSTim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9C7C4CEE7;
	Wed, 22 Oct 2025 05:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761111956;
	bh=nzVEduC9/Kkg41xlskrupc7IxgWOKnClJj35t5wA9hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujacSTimhXFiNzI+QS5vS1VcWvJ/ObCZ2k4ylXsBiZLkvrx9r0arFl8ow926/IUXY
	 UntKck/iTa3LhOteVg6ZnohKChf8vT6HCWZ2oxGoQZJrIksxkaodVfBTBbTc0Zf8WY
	 58MZnTLs0eLm6beZwikPRN1pX0giRqiG0gGpAGT/qFN6JM+JIxiZcYQklzQ8s3VL+Z
	 pBCOa1X5vTsoWn46LD3kD/meaFXbhpTnDgFaKm3vUVJvW8RLfNQH871XoMKeVclU5A
	 VWIAFVflSkdaVSDmODaC8k20Qva65nnLWTIImUvkgJmfz1PNe3/KvRfBVYKz7u98BD
	 ZYBoER9Hm7+9Q==
Date: Tue, 21 Oct 2025 22:44:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_varada@quicinc.com
Subject: Re: [PATCH v2] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
Message-ID: <20251022054423.GB35717@sol>
References: <20251014093503.347678-1-quic_mdalam@quicinc.com>
 <20251017173835.GA161400@sol>
 <abe89411-e590-29df-e9e9-b50402e08aac@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abe89411-e590-29df-e9e9-b50402e08aac@quicinc.com>

On Wed, Oct 22, 2025 at 10:49:23AM +0530, Md Sadre Alam wrote:
> Hi,
> 
> On 10/17/2025 11:08 PM, Eric Biggers wrote:
> > On Tue, Oct 14, 2025 at 03:05:03PM +0530, Md Sadre Alam wrote:
> > > Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
> > > without Command Queue Engine (CQE).This allows hardware-accelerated
> > > encryption and decryption for standard (non-CMDQ) requests.
> > > 
> > > This patch:
> > > - Adds ICE register definitions for non-CMDQ crypto configuration
> > > - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
> > > - Hooks into the request path via mmc_host_ops.request
> > > - Initializes ICE hardware during CQE setup for compatible platforms
> > > 
> > > With this, non-CMDQ eMMC devices can benefit from inline encryption,
> > > improving performance for encrypted I/O while maintaining compatibility
> > > with existing CQE crypto support.
> > > 
> > > Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> > 
> > How was this tested?
> I tested this using fscrypt on a Phison eMMC device. However, since that
> particular eMMC does not support CMDQ, inline encryption (ICE) was bypassed
> during testing.

What do you mean by "inline encryption (ICE) was bypassed during
testing"?

> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
> +			     u32 slot)

Could you also remove the unused 'slot' parameter from this function?

> > > @@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
> > >   	if (ret)
> > >   		goto cleanup;
> > > +	/* Initialize ICE for non-CMDQ eMMC devices */
> > > +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> > > +	config &= ~DISABLE_CRYPTO;
> > > +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> > > +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> > > +	if (ice_cap & ICE_HCI_SUPPORT) {
> > > +		config = cqhci_readl(cq_host, CQHCI_CFG);
> > > +		config |= CRYPTO_GENERAL_ENABLE;
> > > +		cqhci_writel(cq_host, config, CQHCI_CFG);
> > > +	}
> > > +	sdhci_msm_ice_enable(msm_host);
> > 
> > This is after __sdhci_add_host() was called, which is probably too late.
> ok,I’ll move the ICE initialization earlier in the probe flow, ideally
> before __sdhci_add_host() is called.
> > 
> > > +#ifdef CONFIG_MMC_CRYPTO
> > > +	host->mmc_host_ops.request = sdhci_msm_request;
> > > +#endif
> > >   	/* Set the timeout value to max possible */
> > >   	host->max_timeout_count = 0xF;
> > 
> > A lot of the code in this patch also seems to actually run on
> > CQE-capable hosts.  Can you explain?  Why is it needed?  Is there any
> > change in behavior on them?
> Thanks for raising this. You're right that some parts of the patch interact
> with CQE-related structures, such as cqhci_host, even on CQE-capable hosts.
> However, the intent is to reuse existing CQE infrastructure (like register
> access helpers and memory-mapped regions) to configure ICE for non-CMDQ
> requests.
> 
> Importantly, actual CQE functionality is only enabled if the eMMC device
> advertises CMDQ support. For devices without CMDQ, the CQE engine remains
> disabled, and the request path falls back to standard non-CMDQ flow. In this
> case, we're simply leveraging the CQE register space to program ICE
> parameters.
> 
> So while the code runs on CQE-capable hosts, there's no change in behavior
> for CMDQ-enabled devices — the patch does not interfere with CQE operation.
> It only enables ICE for non-CMDQ requests when supported by the platform.

So, we're dealing only with hosts that do support a command queue, but
support eMMC devices either with or without using it?

Could you explain why sdhci_msm_ice_enable() is called twice: once from
sdhci_msm_cqe_add_host() and once from sdhci_msm_cqe_enable()?

- Eric

