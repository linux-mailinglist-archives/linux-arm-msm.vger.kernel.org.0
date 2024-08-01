Return-Path: <linux-arm-msm+bounces-27704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E1944798
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099841C21D11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6C1183CD5;
	Thu,  1 Aug 2024 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9imaoEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3DF170A34;
	Thu,  1 Aug 2024 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503520; cv=none; b=Y0JejNcru6HTqRjanqVx7nvmxsN9fQQG3xFZFq7IsnIFNLYoDRmydyulCP3hToD8vTwasCgczqwpeaTV6XSuWlmmgSG0U9igc1FEybpwWP1ObkTTGSSNcKsM+dmjfv+A/RqmvhhMAjkvdUOR2+PwaYT6R9QFU3bEox79ExHx9sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503520; c=relaxed/simple;
	bh=YyMMtwwfLvF7XbN3Hd27FU6gmaTz5OzC5jyQFcvLAO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pH6//PXD/3dYsZFRAbzeItcXx2lcmGI+vtriw2gVImVv5fFwHTzL+XeMeP32CQ1O/vJhpbDYt2W9YlqmuTEfzjWu/4L2FFBpGaXTrsl5r0BUUSQ5N/VC4aJXYFDMJ/TUe0X0cBXz3G3GINUKDZTXma8WgH3/cbhNbjhWwzOWQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9imaoEt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503519; x=1754039519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YyMMtwwfLvF7XbN3Hd27FU6gmaTz5OzC5jyQFcvLAO4=;
  b=O9imaoEtsvrnILyp4ZsiMg3UAccO//SL7xjzq7HKgx88PHeFOatLHSDw
   fIV7tfnrKCG6gJER4JQUUn8uAsi2tbtltbGJocohONUuBatoC0xjt/zjB
   8JyRFN+MrO/th8vNlUS6wiv0CrwCLHDR8rUWcH8mlT7HVhk59E8umVP3A
   0SiAnykYLksxs1MgEm8zkB94CGAqVCLOBjWflk5CflET1E46LwKQhm+VM
   6gtG0QqLUfejXSU82oumWNMAGuRDWojmdHGSgLZA/Io8AzcRyLQ1D2qFU
   Ji3JIk/Du2U6g/KihmrScFwtP4Ym4J7Cr0uxE7nqExaFb7JOyF2UEShUt
   w==;
X-CSE-ConnectionGUID: 0usLmvSVTKeoU76GHYtmpw==
X-CSE-MsgGUID: yxNdqo/8Tu6uDuYoegDxxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383480"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:21 -0700
X-CSE-ConnectionGUID: ELbweMuJSkOz6l0VdhQiCQ==
X-CSE-MsgGUID: BARAQ/IiRXWsmTikx+x+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089817"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:15 -0700
Message-ID: <63c20e7a-f62a-4b6c-8ea1-1608e06e5b58@linux.intel.com>
Date: Thu, 1 Aug 2024 10:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 11/34] ASoC: usb: Fetch ASoC card and pcm device
 information
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/24 03:17, Wesley Cheng wrote:
> USB SND needs to know how the USB offload path is being routed.  This would
> allow for applications to open the corresponding sound card and pcm device
> when it wants to take the audio offload path.  This callback should return
> the mapped indexes based on the USB SND device information.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/soc-usb.h | 16 ++++++++++++++++
>  sound/soc/soc-usb.c     | 28 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index d6b576f971ae..a167e3de0a78 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -8,6 +8,11 @@
>  
>  #include <sound/soc.h>
>  
> +enum snd_soc_usb_kctl {
> +	SND_SOC_USB_KCTL_CARD_ROUTE,
> +	SND_SOC_USB_KCTL_PCM_ROUTE,
> +};
> +
>  /**
>   * struct snd_soc_usb_device
>   * @card_idx - sound card index associated with USB device
> @@ -32,6 +37,7 @@ struct snd_soc_usb_device {
>   * @component - reference to ASoC component
>   * @num_supported_streams - number of supported concurrent sessions
>   * @connection_status_cb - callback to notify connection events
> + * @get_offload_dev - callback to fetch mapped ASoC device
>   * @priv_data - driver data
>   **/
>  struct snd_soc_usb {
> @@ -40,6 +46,8 @@ struct snd_soc_usb {
>  	unsigned int num_supported_streams;
>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>  			struct snd_soc_usb_device *sdev, bool connected);
> +	int (*get_offload_dev)(struct snd_soc_component *component,
> +				int card, int pcm, enum snd_soc_usb_kctl route);
>  	void *priv_data;
>  };
>  
> @@ -51,6 +59,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
>  int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>  					struct snd_soc_jack *jack);
>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
> +int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
> +				enum snd_soc_usb_kctl route);
>  
>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>  					      int num_streams, void *data);
> @@ -86,6 +96,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
>  	return -ENODEV;
>  }
>  
> +static int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
> +					enum snd_soc_usb_kctl route)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
>  					      struct snd_soc_component *component,
>  					      int num_streams, void *data)
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index fe2a75a28af4..3c217ac67c57 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -117,6 +117,34 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
>  
> +/**
> + * soc_usb_get_offload_device - Set active USB offload path

get or set?

> + * @dev - USB device to get offload status
> + * @card - USB card index
> + * @pcm - USB PCM device index
> + *> + * Fetch the current status for the USB SND card and PCM device
indexes
> + * specified.

the function returns an integer, how does this return the 'mapped indices"?

> + */
> +int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
> +				enum snd_soc_usb_kctl route)

missing route in kernel doc.

> +{
> +	struct snd_soc_usb *ctx;
> +	int ret;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	mutex_lock(&ctx_mutex);
> +	if (ctx && ctx->get_offload_dev)
> +		ret = ctx->get_offload_dev(ctx->component, card, pcm, route);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(soc_usb_get_offload_device);
> +
>  /**
>   * snd_soc_usb_find_priv_data() - Retrieve private data stored
>   * @dev: device reference


