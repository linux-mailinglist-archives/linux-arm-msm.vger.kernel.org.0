Return-Path: <linux-arm-msm+bounces-33496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB0994248
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 10:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09D79B27AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 08:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9521F707F;
	Tue,  8 Oct 2024 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqDwbRqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265431F7075;
	Tue,  8 Oct 2024 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375170; cv=none; b=FI4zEnInMJxxJqbq/ysjKHthKALX9YptF7gjHyK+Ru7WzJ6cVBj6lGnic+qp3nfErh9jvohTOD/rDwKUyvHPS+JjFmejUlyDomOpdkXZGqvwU+xFomLl2NxOBVj3C7gBRi46u9hpVw/oXKyp9Ge77pCjFPsIvNZ5wopDoUMN80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375170; c=relaxed/simple;
	bh=EWtmxS0gTPT9PNhZWVAg0XvsbxAqnO0kUuB3LdkiNlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emUMcbACTKnITsMWChtokX4SHRMXgSRXIulUOUtHPPpCoh3iDJIFp/Ga82nLVDG7KZ26uynLf8Qk/fA+6ZGB5R4VUhIFOqBLAsPvdYZpzdk4vm7CBDezMUMWE5zSDoewiCm5jdwRsDcxtq0TOT01LzMkXHdyYpzyIkDWnY8NLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqDwbRqx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728375170; x=1759911170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EWtmxS0gTPT9PNhZWVAg0XvsbxAqnO0kUuB3LdkiNlw=;
  b=cqDwbRqxKLrfw3ckNjbZ22pVaTHepJEEORhkva9dAqKYUJqRfNlKb/MZ
   wyBLoBcMxMs6dM2q11LFl74mUqDCtq3ZRCgVWnnRhX0Y3jbTvVha1Wfvk
   62UZPOq/X/RnRj4LXoV4tWQAbb6lWAijIlXSbGJCcAbOI8jtb+WEjywaS
   5ujq9adFnrNwrWRzVSXeiaF3k+C9I//ppHaKYPrFQiv3uTLhWYIYzQcNv
   arSqR3Q3L2BGycHuMbfyMoFUnKuZoHa5Hg/2jggucV3HFjZ0vnh2RhTDQ
   WX0rpr+FSdR4RhNeCtEJ9rq7NOnAto/v1Y3x//TN2urHMGQXJ7JxiBwUj
   A==;
X-CSE-ConnectionGUID: EHXUPDvzSv+7YZcsINo2Fg==
X-CSE-MsgGUID: k+ZySy9zSUaUJdWg2KXu8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27685759"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27685759"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 01:12:49 -0700
X-CSE-ConnectionGUID: jqz2YI71RxmUygxskGe5vg==
X-CSE-MsgGUID: AOSAarT1QnCC6K/qBBczFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76179906"
Received: from unknown (HELO [10.217.160.106]) ([10.217.160.106])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 01:12:47 -0700
Message-ID: <a2ea4aac-3b12-4769-93b4-2437395c9e71@linux.intel.com>
Date: Tue, 8 Oct 2024 10:12:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add ipc_router channel
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, corbet@lwn.net, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 10/4/2024 6:40 PM, Jeffrey Hugo wrote:
> The ipc_router channel allows AF_QIPCRTR clients and services to
> communicate with the AIC100 device. The ipc_router MHI transport layer
> expects the channel to be named exactly "IPCR".
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/qaic/aic100.rst |  2 ++
>  drivers/accel/qaic/mhi_controller.c | 32 +++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
> index 590dae77ea12..273da6192fb3 100644
> --- a/Documentation/accel/qaic/aic100.rst
> +++ b/Documentation/accel/qaic/aic100.rst
> @@ -229,6 +229,8 @@ of the defined channels, and their uses.
>  | _PERIODIC      |         |          | timestamps in the device side logs with|
>  |                |         |          | the host time source.                  |
>  +----------------+---------+----------+----------------------------------------+
> +| IPCR           | 24 & 25 | AMSS     | AF_QIPCRTR clients and servers.        |
> ++----------------+---------+----------+----------------------------------------+
>  
>  DMA Bridge
>  ==========
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index ada9b1eb0787..8ab82e78dd94 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -405,6 +405,38 @@ static const struct mhi_channel_config aic100_channels[] = {
>  		.auto_queue = false,
>  		.wake_capable = false,
>  	},
> +	{
> +		.name = "IPCR",
> +		.num = 24,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "IPCR",
> +		.num = 25,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = true,
> +		.wake_capable = false,
> +	},
>  };
>  
>  static struct mhi_event_config aic100_events[] = {


