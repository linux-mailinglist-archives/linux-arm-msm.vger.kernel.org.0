Return-Path: <linux-arm-msm+bounces-35675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40F9AE374
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCB831F22E9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 11:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA661CACD3;
	Thu, 24 Oct 2024 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoPH5A/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667B1C4A31;
	Thu, 24 Oct 2024 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729768125; cv=none; b=cAxauuR4tXA5p0PR37+ct/56f5ZJ7NUu7+Wqd0QoOQe7fYdAyefRdnYnmbJeTCDyPmHpsDZYjT0LEMbIC+HGszlqIBq0+2ywV5Q3opJGtai+PQ5kvwq9N30TQcWIW24HVubve1V+wlRdD3McjHSDx5tQZ+pnUYsjsrRiLNSdYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729768125; c=relaxed/simple;
	bh=NlHgJjsgC1z/zRldu09szX5ASYItuI9tGKsARmS4Taw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsMp3ozJzv0XUJvVWBBLxX53rB6c49QNkrn+Ik4gWzTKAFmpB+nSNaqAlIzSbUeG4j0fk+79KuOq2xUqnehT7PEWw0PcYtEenZmuKE9YBD3JeNVqKpPod6qxSD5WFD05ouv2MtxcCO81HYNRQq2qxqrZ11YyiHSYt2MMJM9bfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoPH5A/U; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729768123; x=1761304123;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NlHgJjsgC1z/zRldu09szX5ASYItuI9tGKsARmS4Taw=;
  b=MoPH5A/UOKhsCh0rJL271OK4YNX5bFivq6OQHyMvf2ygzqtysfAl9Q4Z
   oAc0wgI8PHybMXPlRntzPIV6Nou/qYRpo66xb6YBQ++UsbqzpbNr21Yqw
   oclzq9VFzYFqdIMxdQmbnh0c1QtBkSqhoFfPrSyPPPa6/Q8uEibhzWAkg
   Z2TsZzty6glPCKrX5v2TE1zHB1tunLJHLUq9SVceckkHS4TKXiHYFH8hI
   397k9rCKrQlMwHSSVrZrMN7UAAxkRTOOB+I7luF65bQM94AjyfecxYNAj
   moxzSOKiP0SN4+Zl6F841NN77ejhLdh/YO6DZIMTJOf3VY+/HLIZ7pQ/r
   Q==;
X-CSE-ConnectionGUID: dV7smuK9TwOSL9ndCukPgQ==
X-CSE-MsgGUID: 9BUrYGyPTcyEjGxhNEjNPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29321734"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29321734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:08:43 -0700
X-CSE-ConnectionGUID: ZVCYKNMnTZ+Eaxt9D+h6yA==
X-CSE-MsgGUID: ZfyAt+jjRF24KG1sA+eLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="81378669"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:08:38 -0700
Message-ID: <3e2f8132-af87-40c0-9c31-c0103078fe39@intel.com>
Date: Thu, 24 Oct 2024 14:08:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Slot indexing for distinguishing multiple
 SDCC instances
To: Sachin Gupta <quic_sachgupt@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
 quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
References: <20241022141828.618-1-quic_sachgupt@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241022141828.618-1-quic_sachgupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/24 17:18, Sachin Gupta wrote:
> This update addresses the requirement for accurate slot indexing
> in the sdhci-msm driver to differentiate between multiple SDCC
> (Secure Digital Card Controller) instances, such as eMMC, SD card,
> and SDIO.
> 
> Additionally, it revises the slot indexing logic to comply with
> the new device tree (DT) specifications.

This patch seems incomplete because all it does is assign a global
variable which is never used again.

> 
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e113b99a3eab..3cb79117916f 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -292,6 +292,8 @@ struct sdhci_msm_host {
>  	bool vqmmc_enabled;
>  };
>  
> +static struct sdhci_msm_host *sdhci_slot[3];
> +
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto pltfm_free;
>  
> +	if (node) {
> +		ret = of_alias_get_id(pdev->dev.of_node, "mmc");
> +		if (ret < 0)
> +			dev_err(&pdev->dev, "get slot index failed %d\n", ret);
> +		else
> +			sdhci_slot[ret] = msm_host;
> +	}
> +
>  	/*
>  	 * Based on the compatible string, load the required msm host info from
>  	 * the data associated with the version info.


