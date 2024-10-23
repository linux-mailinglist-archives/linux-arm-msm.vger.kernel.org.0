Return-Path: <linux-arm-msm+bounces-35631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35C9AD6B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 23:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5631F226EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF01EF925;
	Wed, 23 Oct 2024 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIGYwMk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71561E8825;
	Wed, 23 Oct 2024 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718916; cv=none; b=WMTJgTS8A46a5v7sB6c7yZC7VDK0b3/YL7IcmB3zaA155zPQjYyC6SF9zejOYHGsuIejWQ8aZ0r187+aYOlD+e68KsYQYy0FtWqeWr04S383u3drKObZeHw28r3ipdndx/6sJdlGWJUKNEVfPwYtI61JJlm33grW1audypTgiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718916; c=relaxed/simple;
	bh=EcWqIdiJPQra7zioAKkajsxtpk1Fn0+3s20S/v1xYVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFSQN1amHZ7LIplghya3YjLJkFLj1jegDkNz2QEixsxkgUduc/bnI43zqLlQHCfWTTrpvfHWovSsaIhuyCda6k3W/VhIVEk4XhMhB7lTN7mlkW+4uABeAwGuGtATRJ59KEBrHdh8H7p4uK9rBwmG3wkOKbW0/JZtO3faATEfVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIGYwMk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CDDC4CEC6;
	Wed, 23 Oct 2024 21:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729718916;
	bh=EcWqIdiJPQra7zioAKkajsxtpk1Fn0+3s20S/v1xYVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIGYwMk02rIYOubkmZm5Z4Acu52Uj/6Nw2ZO7MZDhb3XuYunbbKVop/+H0zAmBgax
	 2Ml/tWb5MMQNg2TbzpnLqe7CDNNbNgPbF1xtkI7V7x/1KDqT9ciST1/+lfBYSsbXuD
	 fofSl/GGtEJTqrbugINTTwNNbcxjQSNizz4J3XreYRCGC2qXUNqpqX4ErhrcLwpSAu
	 px2f7h9lcdRcz8YBOhI26lS1b/Ze75twVXN784RAdRHDb2B8z8U0qXsImyMZbyNobp
	 qZe43dYB54WpKsI0ZCznKGRU5IkUYK4Jzz8vtfln22itLTXFypiy4lRc+T9jDTpvys
	 BEL//iHWt1wIQ==
Date: Wed, 23 Oct 2024 21:28:34 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com
Subject: Re: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control
 reprogram keys to Crypto Engine
Message-ID: <20241023212834.GB3736641@google.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241006135530.17363-2-quic_spuppala@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006135530.17363-2-quic_spuppala@quicinc.com>

On Sun, Oct 06, 2024 at 07:25:29PM +0530, Seshu Madhavi Puppala wrote:
> Add mmc_host_ops hook avoid_reprogram_allkeys to control
> reprogramming keys to Inline Crypto Engine by vendor as some
> vendors might not require this feature.
> 
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/core/crypto.c | 8 +++++---
>  drivers/mmc/host/sdhci.c  | 6 ++++++
>  include/linux/mmc/host.h  | 7 +++++++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..4168f7d135ff 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -14,9 +14,11 @@
>  
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
> -	/* Reset might clear all keys, so reprogram all the keys. */
> -	if (host->caps2 & MMC_CAP2_CRYPTO)
> -		blk_crypto_reprogram_all_keys(&host->crypto_profile);
> +	if (host->ops->avoid_reprogram_allkeys && !host->ops->avoid_reprogram_allkeys()) {
> +		/* Reset might clear all keys, so reprogram all the keys. */
> +		if (host->caps2 & MMC_CAP2_CRYPTO)
> +			blk_crypto_reprogram_all_keys(&host->crypto_profile);
> +	}

This should be a simple flag, not an indirect function call which is
inefficient.

It could be a bit in mmc_host_ops, though based on the existing code maybe a new
bit in MMC_CAP2_* would be more appropriate.

- Eric

