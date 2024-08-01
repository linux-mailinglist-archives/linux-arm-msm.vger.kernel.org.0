Return-Path: <linux-arm-msm+bounces-27702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C4594478D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EC1283FFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F51170A26;
	Thu,  1 Aug 2024 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8aPMFxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956816FF37;
	Thu,  1 Aug 2024 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503518; cv=none; b=ATrhm2BXvrWZTsAiA/5savlnmwlqf2h2qPs7p8r0siO0qrn1Bdv1I0u3HFQsCSXFkFBiaZnkQr70Cu31lYeVIiqBw3K7kLo9Pe3dwxYMefNpQNVQ3r8eNuBJjJBvA2bvt/E+KIhkqaCFQKI3FW7o8i6Gmjv+I8sBdBpuHzurtmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503518; c=relaxed/simple;
	bh=LUc7gpjBS/NHhnn5BVc97L0Im6/kGFGbOYcyzShbHlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJ2nYj84uXB6liU1bX5kR52OcmrF41WwsMdc7gNym0Y+gHNYyAPFmdKVJYnDLH9arr6DYKF68DBnDIKC8oB1tM1EO4ducRvzhQE4P2JHaAiIQBBXhqDm3VkEEx63I52W/8/b7IGHDVjkVazI2q19br2UgrS0X7/P1mknDS2l6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8aPMFxv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503517; x=1754039517;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LUc7gpjBS/NHhnn5BVc97L0Im6/kGFGbOYcyzShbHlE=;
  b=m8aPMFxv2UYw89uixAnSwrXzbXyd4ONIq+afukwkEANYLA0cfOPnxojn
   OxICBVGYBvYoM/EWYvNrMs4XfE4RJn08ZPEK+u7Kb/+tE+kgRkuRYp/xa
   z1bK3PC91h4qIw93aEN3NQ16MHkAcL3ERWSRxawkZLw6aZgrfo+oxi02d
   Bms5zEDoGMlCs2ZszQIpXB6Mo4Q6GoH5Xa+mAGo+S9GBHTPi5TyIyfnIE
   MjgwppQSllUqYHTzlLBbj3FC6O9HdZfpg+gtZ/7qfUkBDifjJav26oST8
   f+YiFvAIx+hrzJqkftVj4WoX6HQRDakguHHxLUUbLPa+W+cPesGFyfpRF
   w==;
X-CSE-ConnectionGUID: +ZFTUlFNSX6LMGnzTS1NUA==
X-CSE-MsgGUID: RgeD8EKSRb2zpAus24aD2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383432"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:08 -0700
X-CSE-ConnectionGUID: ++Bdj5q4TKqwVVZ9HpXbgw==
X-CSE-MsgGUID: C6b4ZdPESPW+h8z2Bw+jtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089790"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:01 -0700
Message-ID: <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
Date: Thu, 1 Aug 2024 10:02:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




> +/**
> + * struct snd_soc_usb_device
> + * @card_idx - sound card index associated with USB device
> + * @pcm_idx - PCM device index associated with USB device
> + * @chip_idx - USB sound chip array index
> + * @num_playback - number of playback streams
> + * @num_capture - number of capture streams

so here we have a clear separation between playback and capture...

> + * @list - list head for SoC USB devices
> + **/
> +struct snd_soc_usb_device {
> +	int card_idx;
> +	int pcm_idx;
> +	int chip_idx;
> +	int num_playback;
> +	int num_capture;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct snd_soc_usb
> + * @list - list head for SND SOC struct list
> + * @component - reference to ASoC component
> + * @num_supported_streams - number of supported concurrent sessions

... but here we don't. And it's not clear what the working 'sessions'
means in the comment.

> + * @connection_status_cb - callback to notify connection events
> + * @priv_data - driver data
> + **/
> +struct snd_soc_usb {
> +	struct list_head list;
> +	struct snd_soc_component *component;
> +	unsigned int num_supported_streams;
> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
> +			struct snd_soc_usb_device *sdev, bool connected);
> +	void *priv_data;
> +};

> +/**
> + * snd_soc_usb_allocate_port() - allocate a SOC USB device

USB port?

> + * @component: USB DPCM backend DAI component
> + * @num_streams: number of offloading sessions supported

same comment, is this direction-specific or not?

> + * @data: private data
> + *
> + * Allocate and initialize a SOC USB device.  This will populate parameters that
> + * are used in subsequent sequences.
> + *
> + */
> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
> +					      int num_streams, void *data)
> +{
> +	struct snd_soc_usb *usb;
> +
> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
> +	if (!usb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	usb->component = component;
> +	usb->priv_data = data;
> +	usb->num_supported_streams = num_streams;
> +
> +	return usb;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
> +
> +/**
> + * snd_soc_usb_free_port() - free a SOC USB device
> + * @usb: allocated SOC USB device
> +
> + * Free and remove the SOC USB device from the available list of devices.

Now I am lost again on the device:port relationship. I am sure you've
explained this before but I forget things and the code isn't
self-explanatory.


> + *
> + */
> +void snd_soc_usb_free_port(struct snd_soc_usb *usb)
> +{
> +	snd_soc_usb_remove_port(usb);
> +	kfree(usb);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
> +
> +/**
> + * snd_soc_usb_add_port() - Add a USB backend port
> + * @usb: soc usb device to add
> + *
> + * Register a USB backend device to the SND USB SOC framework.  Memory is
> + * allocated as part of the USB backend device.
> + *
> + */
> +void snd_soc_usb_add_port(struct snd_soc_usb *usb)
> +{
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
> +
> +/**
> + * snd_soc_usb_remove_port() - Remove a USB backend port
> + * @usb: soc usb device to remove
> + *
> + * Remove a USB backend device from USB SND SOC.  Memory is freed when USB
> + * backend is removed.
> + *
> + */
> +void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
> +{
> +	struct snd_soc_usb *ctx, *tmp;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
> +		if (ctx == usb) {
> +			list_del(&ctx->list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);

