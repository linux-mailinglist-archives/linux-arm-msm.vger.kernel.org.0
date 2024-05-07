Return-Path: <linux-arm-msm+bounces-19501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D78BFE7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BD091F262E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3A586AE2;
	Wed,  8 May 2024 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG1sgdGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43A286640;
	Wed,  8 May 2024 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174182; cv=none; b=Yak6nhQYKi0Uq3R4PrBnOYejAf96dATuigszEMQ/Eq2NltWX51NtY+rqjUF7gkmzBcaxBGy2xCOiJlxvG7RWKOOICJizxgzV8LuIsg36ediUClaaIf5Kqu835udtAf9LkQnlssPjHo00jY3qf8qleO1vd8VGnjjxVQN/Mu9oA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174182; c=relaxed/simple;
	bh=Pbghh143acCbPWT9OSSfKb3SaczwJwuLEG9zgGuWUjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/pWX2NNm2lSLc8HWWJk6TD5YkRBfMLXn8InQsVr3dnzOKaqTMni39IgJouGpzhHRcydCafFNUDV+GmNHavGa+onBfsCZvgu3P3XxqHOX7o/SEZn7yrjMyRP9jV/OVWSys7Fpno1L8ysZoK/qBUnk+SHChDvQT7T9tmDghjXhSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG1sgdGj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174181; x=1746710181;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Pbghh143acCbPWT9OSSfKb3SaczwJwuLEG9zgGuWUjc=;
  b=NG1sgdGjHs28SX9YP78hO/RpegsdWIfBRtG/KZ5W9MIkONYewHH+2/mW
   t6EyLob50Yl/GtRUyq5PRrwYpaihNPd4/mXyUGDSl2+9wKIPQp6BY92uB
   TmO0TzkpvQQXD3nJjPBFHzDpYtPNaWZBmLWXo+H0jDCzNDQEhyJJ7BJUq
   dfWuLpfv6NcOM4nEMvxFEexF0hl4wO62Btu/mePPOEUbR6xQqRx0zhKme
   mCWawmXlkfsP0LltIlyytt5feIxiK08oYD2BStzCmLmbqK1R/Jv2Ur7ja
   YumrjO2XmEwrnXqCR2endttH4/FxLFt5BsFmsD04kqKVO9LxtyM3JQgPt
   w==;
X-CSE-ConnectionGUID: FPgocgStR9aX9RdWxH314w==
X-CSE-MsgGUID: vLhKxbQ0RfOZy+fvYZlxRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413289"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:20 -0700
X-CSE-ConnectionGUID: MQxi/U5oS8ewAq1bHz0clQ==
X-CSE-MsgGUID: yinIUFupQ928TFhDXIeDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356817"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:19 -0700
Message-ID: <6fe8f489-d8a2-4951-96fa-875ac9b29d23@linux.intel.com>
Date: Tue, 7 May 2024 16:33:11 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 33/39] ASoC: usb: Fetch ASoC sound card information
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-34-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-34-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +/**
> + * snd_soc_usb_device_offload_available() - Fetch BE DAI link sound card
> + * @dev: the device to find in SOC USB
> + *
> + * Finds the component linked to a specific SOC USB instance, and returns
> + * the sound card number for the platform card supporting offloading.
> + *
> + */
> +int snd_soc_usb_device_offload_available(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	return ctx->component->card->snd_card->number;
> +}

Presumably there's a notification to help applications discard this
information on removal?

