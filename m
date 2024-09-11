Return-Path: <linux-arm-msm+bounces-31471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F174B974E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B291E289E50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87259183CDC;
	Wed, 11 Sep 2024 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9+RLVYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F0A15445B;
	Wed, 11 Sep 2024 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045812; cv=none; b=BISpJ6OIJtmRT6JrUA+k15CWMw4Grv3ghkF70IL5gkduCvKzpsanaRDib51TDDdvx2yUBsi9SYJ6iwR/p0UJtXuQv1+PFQ6DJWpK//iCxXdrWIZOZkTDr19W59qaoCDCC/eAT+93CqaNfB9RV7TmK24nfCw14oyzFcAFEG+3sxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045812; c=relaxed/simple;
	bh=7hXzo1gtAmWQBm4/YCS0mRlX5+6bEz9+z5FQDrLjvUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FC7JpROQaNjcRJy2y63GMlrnAId0QfefgnqaF079yiNlJtlp/N3M0yeuNsUMPXaqn49mnD9ObmDlB+tJ6ZIlaLfHgt7VsWqAjNMOzYn2hllJEF2qVMp6wluWUpzh4fAT8dtizOIj8hHV3+oUw9g7xc9aG6JtuLG847s49YmP44c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9+RLVYS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726045811; x=1757581811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7hXzo1gtAmWQBm4/YCS0mRlX5+6bEz9+z5FQDrLjvUM=;
  b=m9+RLVYSh5gQzU+MVrROxL195yZ+7GD1EaboyQB3UrYGTpt4g+815eNx
   LllgE1gOufmpYUxfcmHoPMeKNVJRWriY96bSnn50DCa7hlRXY+YBS5KWZ
   LqtCUvpb/zX5inqcrs+AoYz8xXNtHCFhbEBWbgtUkwcvKevVCxxV4VUCo
   ahVrzzAEM4BW+g+KNCNFxuKNk9YJiYzlL0fkWiTpCvMM3SLvogh+6TlTn
   nRKlocxDsFtx1CnAI6zpOaCTLWT/uRGGs8amHxk8Ir2n1gpFQfvjngOf4
   5qDYB34G0x1sx/HVVShff6MnbCIingYNcd3nG55vrF9L7LS0MR3UGHjLY
   w==;
X-CSE-ConnectionGUID: kBNN1zSnSVKtUCRP7vh2OQ==
X-CSE-MsgGUID: nHSpPqVXQhmeJDcRZaTN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35425202"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="35425202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 02:10:10 -0700
X-CSE-ConnectionGUID: 31lL6o1/TaqLrSKlLBTY/w==
X-CSE-MsgGUID: azG953GiQ+Kp2FB4snQTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67593407"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.146]) ([10.245.246.146])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 02:10:03 -0700
Message-ID: <1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
Date: Wed, 11 Sep 2024 11:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
To: Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/24 16:12, Jerome Brunet wrote:
> This adds a sample rate definition for 12kHz, 24kHz and 128kHz.
> 
> Admittedly, just a few drivers are currently using these sample
> rates but there is enough of a recurrence to justify adding a definition
> for them and remove some custom rate constraint code while at it.
> 
> The new definitions are not added to the interval definitions, such as
> SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
> rates to drivers that may or may not support them. For sure the drivers
> have not been tested for these new rates so it is better to leave them out
> of interval definitions.
> 
> That being said, the added rates are multiples of well know rates families,
> it is very likely that a lot of devices out there actually supports them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  include/sound/pcm.h     | 31 +++++++++++++++++--------------
>  sound/core/pcm_native.c |  6 +++---
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 732121b934fd..c993350975a9 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -109,20 +109,23 @@ struct snd_pcm_ops {
>  #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
>  #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
>  #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
> -#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
> -#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
> -#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
> -#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
> -#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
> -#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
> -#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
> -#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
> -#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
> -#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
> -#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
> -#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
> -#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
> -#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
> +#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
> +#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
> +#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
> +#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
> +#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
> +#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
> +#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
> +#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
> +#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
> +#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
> +#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
> +#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
> +#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
> +#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
> +#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
> +#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
> +#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
>  
>  #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
>  #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 44381514f695..7461a727615c 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2418,13 +2418,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
>  	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
>  }
>  
> -#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
> +#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
>  #error "Change this table"
>  #endif
>  
>  static const unsigned int rates[] = {
> -	5512, 8000, 11025, 16000, 22050, 32000, 44100,
> -	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
> +	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
> +	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
>  };
>  
>  const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {

Wondering if this is backwards compatible with the alsa-lib definitions,
specifically the topology parts which did unfortunately have a list of
rates that will map to a different index now:


typedef enum _snd_pcm_rates {
	SND_PCM_RATE_UNKNOWN = -1,
	SND_PCM_RATE_5512 = 0,
	SND_PCM_RATE_8000,
	SND_PCM_RATE_11025,
	SND_PCM_RATE_16000,
	SND_PCM_RATE_22050,
	SND_PCM_RATE_32000,
	SND_PCM_RATE_44100,
	SND_PCM_RATE_48000,
	SND_PCM_RATE_64000,
	SND_PCM_RATE_88200,
	SND_PCM_RATE_96000,
	SND_PCM_RATE_176400,
	SND_PCM_RATE_192000,
	SND_PCM_RATE_CONTINUOUS = 30,
	SND_PCM_RATE_KNOT = 31,
	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
} snd_pcm_rates_t;

