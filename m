Return-Path: <linux-arm-msm+bounces-19496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE18BFE5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D9C285F77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B504184FAF;
	Wed,  8 May 2024 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0Sls2kz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090150A6C;
	Wed,  8 May 2024 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174171; cv=none; b=rjsILJ7A/vC75uOUDNx/vcFpk9x0W0wvw8/VWuglkf6fBxnyf9NZWkZtDZ9CsrmOkIoPdCJvAMR+oTKckZcnMN21BpVx2SU8RxZ2binArS6w20yf8tp5FJXgtqZ/BvWqqaBMCCsPLwjBO2/F1SXmFx3T0xZ5TfpNbu3BgvZFKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174171; c=relaxed/simple;
	bh=+u9xtA3A4qWiXB/A2rpymg6ByEaKIVCB76KjWj11y/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRjt9KdjOLzxjK8Hqfik4TP2YRgPWHG/F/s2FWFklzI2DG+rjVmnYrfjXTvkASWcw+mwmRtmUBokEgVIx4NeTljEK+XcaeqlIvSYqZlBdHsga5XJWeGhGnfsrHhlGbhjXFiI2R8eV5mkkIWS35g8ieIgCCyu603nJfbDPnGp1Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0Sls2kz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174170; x=1746710170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+u9xtA3A4qWiXB/A2rpymg6ByEaKIVCB76KjWj11y/Q=;
  b=I0Sls2kzKr02ExyvkF8S1zUsVTSVGiNrXzI1MDheLpy2GWppIVG4pQFP
   GGVFthBxivk3E05RBSrlOikQtDEHuaJw1h6xnXo3okK9pPx7uxxa+I7HH
   cNqg+zbk+k6zAP4OjIaoFJc4Gz6MDVWO3AY2X8DZVHqHBvb+UiyPBvqX+
   Us1FseDV7Dh/cVb3sTVBCxFxiU6BuKx/ZJLN4Wd4QmhRbQbhHiMYZtzuv
   qIsAQCCAuoeBLy4GhqhNMqlPZy7by1A+By8LuxC9YtgHEm8oSEbQz9M81
   2NerB0axf//5/JCEkreVFspsSKw0IK7rntwR0OvVWuKgF/ZGavBcEmnL0
   w==;
X-CSE-ConnectionGUID: 8vr+oWDJRsCKBDieSdu0oA==
X-CSE-MsgGUID: 372AcqLsSBC1iFJl+J1tcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413208"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:09 -0700
X-CSE-ConnectionGUID: pfAWuZjXRPaa5DMWrIGqBQ==
X-CSE-MsgGUID: EjppC2esQDilsGXwWQHTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356740"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:08 -0700
Message-ID: <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
Date: Tue, 7 May 2024 15:37:29 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240507195116.9464-10-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>  static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
> +	{
> +		.playback = {
> +			.stream_name = "USB Playback",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
> +					SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
> +					SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> +					SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
> +					SNDRV_PCM_RATE_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +					SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
> +					SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +					SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rate_min =	8000,
> +			.rate_max = 192000,
> +		},
> +		.id = USB_RX,
> +		.name = "USB_RX",
> +	},

Wait, is this saying you will have exactly one PCM device/FE DAI
connected to the USB BE DAI exposed in patch 11?

> +	SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
> +			   usb_mixer_controls,
> +			   ARRAY_SIZE(usb_mixer_controls)),
> +

And then what is the role of the USB mixer if you only have one input?

I must be missing something.


