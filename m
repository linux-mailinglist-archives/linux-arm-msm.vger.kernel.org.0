Return-Path: <linux-arm-msm+bounces-60500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 089DEAD07DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C513B168431
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A6728A1F6;
	Fri,  6 Jun 2025 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MN7RON0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61251534EC;
	Fri,  6 Jun 2025 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749232752; cv=none; b=Gdn1B7pIfluQbe6+Jx5wNgkIKPh2/JNyGku7FJozBwHwT7V4SvxZGbHllbVK1jz4u3BgWMNugkQzzN0dwsBY/AVAJVwXgPuQ88RF8MByB5SAhzyEpzqvBP376b4aGU3ZWWC65Wda9C9B3oOaI2U2Bz8DQ/xpJb9Shvsu/DFec+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749232752; c=relaxed/simple;
	bh=jOqG8Qt6X6qTz/Mhv1xngCEdIRiWJCR8s4noSgqj/HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUAR+QgeH9UFzMiNqaa9dWmHupt2jVk+XclUBOPDQE7u6c9PcPm50a7ZDHVxleerr4vEh1Tey1293Q96nPJ3zFP3blg0S4SWNQoshaypRyxkAdvmUHXxJGWHYOpwmUlOO6D0UMbXCGJEVBrGMzZICPbgCSvt3KVCeABZduuPLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MN7RON0p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4F8C4CEEB;
	Fri,  6 Jun 2025 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749232752;
	bh=jOqG8Qt6X6qTz/Mhv1xngCEdIRiWJCR8s4noSgqj/HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MN7RON0pMFrnRRPLBflH+IIi7lEjqIvlIqxC3CJQTIh+eil3B+2vvIwzMlULpqxsM
	 94oT9SJtT9GM4+RbxOV59RyW70uaQnuTo7W5O39mx5In2nM0grJDuiCksZ65Fgadt0
	 qe3tIryxw/jAkER5U5enIJ9jztwrEYClBgDxhifSCwPyPfH1bn/JkXlS/MUvdoUhLD
	 ZrsDab7X7/XGsDIeyuypspHUmkBzdJ66AuJ78UtktTGFgdfKL9ok9ltDBBkEMurX7q
	 VfiGtbxDwCanZ5/YjAG4rAKJU/JaI3OhlZFe/0Ys1SoGR8tdruuBuiGl+woyx24cl8
	 TKaWuE19A1Qmw==
Date: Fri, 6 Jun 2025 17:59:09 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	kernel@quicinc.com, Neeraj Soni <quic_neersoni@quicinc.com>,
	Ram Prakash Gupta <quic_rampraka@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Sachin Gupta <quic_sachgupt@quicinc.com>,
	Bhaskar Valaboju <quic_bhaskarv@quicinc.com>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Sarthak Garg <quic_sartgarg@quicinc.com>,
	Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Subject: Re: [PATCH v2] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
Message-ID: <20250606175909.GB53397@google.com>
References: <20250606104714.1501297-1-quic_dmukhopa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606104714.1501297-1-quic_dmukhopa@quicinc.com>

On Fri, Jun 06, 2025 at 04:17:14PM +0530, Debraj Mukhopadhyay wrote:
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design.

It's called from mmc_set_initial_state(), which is documented as:

/*
 * Set initial state after a power cycle or a hw_reset.
 */

Please clarify how that corresponds to "MMC runtime suspend/resume".

> streaming applications have been observed due to this. Add the flag
> MMC_CAP2_DONT_REPROGRAM as part of host->caps2 to control reprogramming
> keys to crypto engine for socs which dont require this feature.

The flag has a different name in the code.

> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..d41672e2856e 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -15,7 +15,7 @@
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
>  	/* Reset might clear all keys, so reprogram all the keys. */
> -	if (host->caps2 & MMC_CAP2_CRYPTO)
> +	if (host->caps2 & MMC_CAP2_CRYPTO && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>  		blk_crypto_reprogram_all_keys(&host->crypto_profile);

Add parentheses around 'host->caps2 & MMC_CAP2_CRYPTO'

> +#ifdef CONFIG_MMC_CRYPTO
> +#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host does not support inline crypto key reprogramming */
> +#else
> +#define MMC_CAP2_CRYPTO_NO_REPROG	0
> +#endif

Well, it does support inline crypto key reprogramming.  It just doesn't want the
MMC core driver to handle it.  Please update the comment to something like:
/* Host driver handles crypto key reprogramming */

- Eric

