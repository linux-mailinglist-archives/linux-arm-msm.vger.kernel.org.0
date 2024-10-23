Return-Path: <linux-arm-msm+bounces-35572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 023309AC273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6911F2626F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740A31607B7;
	Wed, 23 Oct 2024 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoY7Ghmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DC8155A4E;
	Wed, 23 Oct 2024 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673952; cv=none; b=J8bO/0bEaaXeVHdX9Rm9HL5iNPHbJESzlxLnniQCov64gVs3os1hjRVzCQpzZIK9TkErCCqMqNc48mmqRbVspbFlsv7z7l0zDB2BtOpoqqH3NbIisH73MzJwduBZnreFTvzMn19YqkWLzt2YK6qFm6EZpb6cI/J+vy5Ph4ro4xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673952; c=relaxed/simple;
	bh=3Z7u4wZm/iuLqCCuaeor5uPPDgpyABJSSkp9X+2Lfyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C61CidQ8u25g3vx1h1OXy2amUoQ5pcjgiKF1X3hhe3fRe5dfBtXeXCKAJa4dumVy1FknSscx7cSmif8ZrdJqjBGhKwydW+1kYEieZfZkXLDG92H2A5f49NztG7XZsCb7nJetRkuaUcaNTi/iq81IQOV7+w4mXZy9L1eQRXK59UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoY7Ghmu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729673951; x=1761209951;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3Z7u4wZm/iuLqCCuaeor5uPPDgpyABJSSkp9X+2Lfyg=;
  b=JoY7GhmumQ9k63v9d4Uu43SRkDrs62+tahV8W+7cFtJHDNeqJLNZ8Yqj
   OTdF8mkrNjH6qtv/yhVGhBxnvZPsBGXp6Px+hU/3sOinMIDVKApVSEyB9
   S3H0l6PRT0Pdt7rbtBlVEIU7MHnUDL7Vp1c48udv4aPQA1qtweg0U/E2U
   PDC9udkp0PxsPvQ6VP5jdwqiYDbIRTSRwueZH4SHce74W5oatYXOPrTZH
   Quk4Sb6QQEn9pNlwMH+B6SYzXkC6b6xLvJmZyPV3avH9sVYNQuuCea5Ui
   PdVE/lURe18M6WejwdgbqsAuGNXcfkWGMKx4VjMSLeNjQS5AHypXQDGH9
   A==;
X-CSE-ConnectionGUID: fuDkEGrGRHGkd9eGz02dHw==
X-CSE-MsgGUID: NpplyEdEQGewISAe4CSaAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29360978"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29360978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 01:59:10 -0700
X-CSE-ConnectionGUID: 1HHVKIziSdGBTI6/bdW74w==
X-CSE-MsgGUID: 3d3neFQNSFWQwkjXzm5tAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="103414582"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.115.59])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 01:59:06 -0700
Message-ID: <1cb08708-fca2-48a9-9cf9-c0c1ac004587@intel.com>
Date: Wed, 23 Oct 2024 11:59:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control
 reprogram keys to Crypto Engine
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com,
 quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com,
 quic_gaurkash@quicinc.com, Eric Biggers <ebiggers@google.com>,
 Abel Vesa <abel.vesa@linaro.org>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241006135530.17363-2-quic_spuppala@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241006135530.17363-2-quic_spuppala@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/24 16:55, Seshu Madhavi Puppala wrote:
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

Probably nicer to put MMC_CAP2_CRYPTO check first, but also the logic
needs a tweak:

	/* Reset might clear all keys, so reprogram all the keys. */
	if (host->caps2 & MMC_CAP2_CRYPTO &&
	    (!host->ops->avoid_reprogram_allkeys ||
	     !host->ops->avoid_reprogram_allkeys()))
		blk_crypto_reprogram_all_keys(&host->crypto_profile);

>  }
>  
>  void mmc_crypto_setup_queue(struct request_queue *q, struct mmc_host *host)
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index fbf7a91bed35..cd663899c025 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2704,6 +2704,11 @@ int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
>  }
>  EXPORT_SYMBOL_GPL(sdhci_start_signal_voltage_switch);
>  
> +static bool sdhci_avoid_reprogram_allkeys(void)
> +{
> +	return false;
> +}
> +
>  static int sdhci_card_busy(struct mmc_host *mmc)
>  {
>  	struct sdhci_host *host = mmc_priv(mmc);
> @@ -3066,6 +3071,7 @@ static const struct mmc_host_ops sdhci_ops = {
>  	.execute_tuning			= sdhci_execute_tuning,
>  	.card_event			= sdhci_card_event,
>  	.card_busy	= sdhci_card_busy,
> +	.avoid_reprogram_allkeys	= sdhci_avoid_reprogram_allkeys,

There isn't any need for this

>  };
>  
>  /*****************************************************************************\
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 88c6a76042ee..c4109d17f177 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -218,6 +218,13 @@ struct mmc_host_ops {
>  
>  	/* Initialize an SD express card, mandatory for MMC_CAP2_SD_EXP. */
>  	int	(*init_sd_express)(struct mmc_host *host, struct mmc_ios *ios);
> +
> +	/*
> +	 * Optional callback to support controllers that dont require to
> +	 * reprogram all crypto keys on card suspend/resume.
> +	 */
> +	bool	(*avoid_reprogram_allkeys)(void);
> +
>  };
>  
>  struct mmc_cqe_ops {


