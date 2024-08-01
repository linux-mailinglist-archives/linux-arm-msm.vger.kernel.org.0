Return-Path: <linux-arm-msm+bounces-27703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08005944792
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7AEA1F2798D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD6A183CA2;
	Thu,  1 Aug 2024 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYgUHyqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C43170A16;
	Thu,  1 Aug 2024 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503519; cv=none; b=P4dDAl+gR5r0Y5LIHoKQlmRCK98iYbUW+8GWr3sEHiZGGU+c66AwwwkIBeenSQUBG9PLkHWTm4ZyMNgxsSF6FfSoDoWgKPoGFqgSJ9v/HkTZM736TE2Q87dfTW2iFzlaalUg95LSGUJUJX0RA+3M2zjDTgw/oCvk2x0TSx+BYKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503519; c=relaxed/simple;
	bh=tscyAirBL6Y/hiFr/fYWfIAghFNfqHxPlsqlAVXu9hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCxlq+74jzkcjWad7TouhUGDXLFZqMH9s0KQyzYlvTtM3Cns3wXRSriKiQpZvgTrmELXPfyndKvxkkjCZjc77+bnfBcMGH7Iy4+j5TFEIOxbeAOHUvHiTYTl5Ij6jFph08eG/dGjoJZjxauPW8iGLhVvoGCpj0mAVp9S9YXiKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYgUHyqr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503519; x=1754039519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tscyAirBL6Y/hiFr/fYWfIAghFNfqHxPlsqlAVXu9hE=;
  b=DYgUHyqrhJU8m8v30gzp5TSPU/QzV65w5T+Tf3kMX9RpvNPcC+mUuxea
   wCphazHUTeWU7t5FgOFMiTeb3tKQ7kbgIgfq+24XlXlQf9YKpBis0BU83
   ZtgmKkc04QZ1cCnoWXFnFJFrulki2ZXfnf69U35mhGx1XN0bjdDLUTQg0
   MkgiZuTastwnkFEVvyCcTC9vMHIVR/oQGmWjIImTXtOHRZp0RoJFTp/pf
   VbCSWx2KNgUsl6j9NTElfHuJQwT5aXpEJLhmAnpuhYgQALM+GGxgPMWAa
   40I6FDSkjx9sFr+Tvibu+7J1T/g3v/cRaWzWmzSy/bvHD3sMvSF6TMVzf
   w==;
X-CSE-ConnectionGUID: dAcLpoUUSCaVCaOiCtFf6Q==
X-CSE-MsgGUID: SfTc+dw2TVCe5313Um24XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383464"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:15 -0700
X-CSE-ConnectionGUID: X/4AQvn4RX2vRaRVo8BBHw==
X-CSE-MsgGUID: nybOwouiQnOiwizSYTfNMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089811"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:08 -0700
Message-ID: <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
Date: Thu, 1 Aug 2024 10:07:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
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
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +						 struct snd_soc_jack *jack)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
> +{
> +	return -ENODEV;
> +}

usually fallback functions return 0, is the error code intentional?


> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +					struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",

do we need the reference to Playback?

> +					SND_JACK_HEADPHONE, jack);

wondering if there would be any merit in defining a new type of jack,
e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
device connected. The type of device does not really matter, does it?


> +	if (ret < 0) {
> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;

