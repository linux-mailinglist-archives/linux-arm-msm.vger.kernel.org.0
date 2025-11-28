Return-Path: <linux-arm-msm+bounces-83805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42411C92DF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 19:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E891C3A5D16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 18:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0094333741;
	Fri, 28 Nov 2025 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWzVWxSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AB33373D;
	Fri, 28 Nov 2025 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764353008; cv=none; b=iUm9O+GnuTBccENYCpKxUMF5J7GHOf5PXdjz9cg17H7R3rqGgjb/5gRZWd4YoZUPGDEGEMF1j0KNP0/LnLf4m59nPbJEG93JceMP/oD7OdFxYWryFNuuB60jDQclwrWCcp9vEmYfpq3ge6/mVcclE8mj55uABkK+aKsGqhtsGh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764353008; c=relaxed/simple;
	bh=RXJXqeobgPEAjbpuExToJm696Xmf+fdudNnvH6ua4jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aqgr1iexaWsafSNThzMOnAGVePb2AggZ4mRkveAFfSePa10C8UcAJdY4+HsnUUj7OEicm+tzkoX+svRpB9eyp+BzNjyBxlO40ec8yQv0VnvN2cWQbUaKzkAs1zlGheeTtvClQBxQvedrn0awuk0UczVuhobvLlbaxY7XOoJIC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWzVWxSD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FBCC4CEF1;
	Fri, 28 Nov 2025 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764353007;
	bh=RXJXqeobgPEAjbpuExToJm696Xmf+fdudNnvH6ua4jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWzVWxSDhw7+M9Tu0BE9bzmwP88omzgmxFBgoyREI7sQhIUMxtCqk+QuTsMEeU0J8
	 WY7G/YfWUxscWAizHilisRKkC1SlAe6Z0bJHLCcebNTH1Ozr5HUPpzlShsCz1Jlk9B
	 HG1tkizbWm9cgmOTujRK6vqFgXguE3uR3UVmSI2U7BOe0jsDUktTgLL0xrivnCKd15
	 nkenhHhFBCvHtsYJxer5fxYwWv9Ufa7olq4zBt4VuILwsfkhf0Z7lOXwULhqJmklSr
	 lw6UKsJw6Frdc+dta1/tbzyxJNlSiVT19XlIhZPdX4W//6sNDbvYQu4xeHDvitE/9j
	 gsEaq5H+l+8CA==
Date: Fri, 28 Nov 2025 10:01:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, abel.vesa@linaro.org
Subject: Re: [PATCH v6] mmc: sdhci-msm: Enable ICE for CQE-capable
 controllers with non-CQE cards
Message-ID: <20251128180138.GB2000@sol>
References: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126064251.1928529-1-quic_mdalam@quicinc.com>

On Wed, Nov 26, 2025 at 12:12:51PM +0530, Md Sadre Alam wrote:
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

Acked-by: Eric Biggers <ebiggers@kernel.org>

- Eric

