Return-Path: <linux-arm-msm+bounces-31509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5F975312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 15:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F6A128338B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C22119259F;
	Wed, 11 Sep 2024 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiyBtexD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E26B18C91D;
	Wed, 11 Sep 2024 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059574; cv=none; b=FWU3B9ke5DWuTkqVMUx49phEO1bozChZVRzUom2tMgDIv+MoyNvX4ym3Mov3UjzI1S6wOMqRbiDefT2za/CnRlfZ1WVOAaT+7GbnEyBYBPIVxViUYQkFimqxRdnDHQ85+/sOuuQT/yxY2ZVHnfF1ptFCVkPDYM++HrqGel0Wurc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059574; c=relaxed/simple;
	bh=Llil1AkQbBbhjpTYvwLNuxUBQbxuoYC1bmwSM5nppMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVzTdIjwJGGTW24SLFOOYKI3+PtGh518uObPYbOw/CN41kTqDFUZgBgRKkc3F0lOKrOhFC/vN9SKqBMOKSaHExZb/arYl6/n3Bk3Ls6gWxwMlwR6Py5O3OAqsmAIXsbAx9qe7XpR1E/e+hWNERfEi4ok6eoX/JQRLpKPwUb2p2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiyBtexD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726059572; x=1757595572;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Llil1AkQbBbhjpTYvwLNuxUBQbxuoYC1bmwSM5nppMc=;
  b=kiyBtexDkgUctJ2/y2ktHj1kZPn57tIEPYMqMuIcaR/n+hlsBoQkfPlG
   dsIeLxGU/yYBPffbg5ABKod82RFiq2zT0bxhy4s65EYeBy+/cuk+cIImE
   VVlCXR77IBP52bFkx12D1zk1AzeoPeHp0aRxvkkQRFmWh0c5oZ/LlprTQ
   qVxIrYpHul7bf5pU1CtlT2u3I3wtj2nGEGam72bBlfVtmnKh/gZ0mUsqx
   XQ6Y0M0prgVd1GVQY9gm5MHFcWsLozzMMUusCtGiBmxpPQ5OSVgZ3tVKH
   rpVaY/tAJazqOvFUDu5stmYkqK0lAxzFPdMMid2y9qQrXRuvpLhw5+F4W
   Q==;
X-CSE-ConnectionGUID: Z4OKDP7jSlmeW7SeG7z+Hw==
X-CSE-MsgGUID: 7Q6VlC73TYWxJn9WMPzBnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25012726"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="25012726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 05:59:31 -0700
X-CSE-ConnectionGUID: noPg8P1yTfGbpysO5/plUA==
X-CSE-MsgGUID: idzFjDICQwiU3NHTUO6z/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67595319"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.225]) ([10.246.104.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 05:59:25 -0700
Message-ID: <5773da1f-b139-4fc7-82c0-231583636b6a@linux.intel.com>
Date: Wed, 11 Sep 2024 20:59:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
To: Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 bard.liao@intel.com
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
 <1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
 <87ed5q4kbe.wl-tiwai@suse.de>
 <5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
 <87y13y31kq.wl-tiwai@suse.de>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <87y13y31kq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/11/2024 6:51 PM, Takashi Iwai wrote:
> On Wed, 11 Sep 2024 12:33:01 +0200,
> Péter Ujfalusi wrote:
>> On 11/09/2024 12:21, Takashi Iwai wrote:
>>>> Wondering if this is backwards compatible with the alsa-lib definitions,
>>>> specifically the topology parts which did unfortunately have a list of
>>>> rates that will map to a different index now:
>>>>
>>>>
>>>> typedef enum _snd_pcm_rates {
>>>> 	SND_PCM_RATE_UNKNOWN = -1,
>>>> 	SND_PCM_RATE_5512 = 0,
>>>> 	SND_PCM_RATE_8000,
>>>> 	SND_PCM_RATE_11025,
>>>> 	SND_PCM_RATE_16000,
>>>> 	SND_PCM_RATE_22050,
>>>> 	SND_PCM_RATE_32000,
>>>> 	SND_PCM_RATE_44100,
>>>> 	SND_PCM_RATE_48000,
>>>> 	SND_PCM_RATE_64000,
>>>> 	SND_PCM_RATE_88200,
>>>> 	SND_PCM_RATE_96000,
>>>> 	SND_PCM_RATE_176400,
>>>> 	SND_PCM_RATE_192000,
>>>> 	SND_PCM_RATE_CONTINUOUS = 30,
>>>> 	SND_PCM_RATE_KNOT = 31,
>>>> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
>>>> } snd_pcm_rates_t;
>>> As far as I understand correctly, those rate bits used for topology
>>> are independent from the bits used for PCM core, although it used to
>>> be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
>>> it's clearer only for topology stuff.
>> Even if we rename these in alsa-lib we will need translation from
>> SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?
>>
>> The topology files are out there and this is an ABI...
>>
>>> But it'd be better if anyone can double-check.
>> Since the kernel just copies the rates bitfield, any rate above 11025
>> will be misaligned and result broken setup.
> Yep, I noticed it now, too.
>
> Below is the fix patch, totally untested.
> It'd be appreciated if anyone can test it quickly.
>
>
> thanks,
>
> Takashi


I tested it on my laptop and it fixed the issue.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: pcm: Fix breakage of PCM rates used for topology
>
> It turned out that the topology ABI takes the standard PCM rate bits
> as is, and it means that the recent change of the PCM rate bits would
> lead to the inconsistent rate values used for topology.
>
> This patch reverts the original PCM rate bit definitions while adding
> the new rates to the extended bits instead.  This needed the change of
> snd_pcm_known_rates, too.  And this also required to fix the handling
> in snd_pcm_hw_limit_rates() that blindly assumed that the list is
> sorted while it became unsorted now.
>
> Fixes: 090624b7dc83 ("ALSA: pcm: add more sample rate definitions")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/sound/pcm.h     | 35 ++++++++++++++++++-----------------
>   sound/core/pcm_misc.c   | 18 ++++++++++--------
>   sound/core/pcm_native.c | 10 +++++++---
>   3 files changed, 35 insertions(+), 28 deletions(-)
>
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index c993350975a9..824216799070 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -109,23 +109,24 @@ struct snd_pcm_ops {
>   #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
>   #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
>   #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
> -#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
> -#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
> -#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
> -#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
> -#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
> -#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
> -#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
> -#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
> -#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
> -#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
> -#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
> -#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
> -#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
> -#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
> -#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
> -#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
> -#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
> +#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
> +#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
> +#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
> +#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
> +#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
> +#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
> +#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
> +#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
> +#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
> +#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
> +#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
> +#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
> +#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
> +#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
> +/* extended rates */
> +#define SNDRV_PCM_RATE_12000		(1U<<17)	/* 12000Hz */
> +#define SNDRV_PCM_RATE_24000		(1U<<18)	/* 24000Hz */
> +#define SNDRV_PCM_RATE_128000		(1U<<19)	/* 128000Hz */
>   
>   #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
>   #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
> diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> index 5588b6a1ee8b..4f556211bb56 100644
> --- a/sound/core/pcm_misc.c
> +++ b/sound/core/pcm_misc.c
> @@ -494,18 +494,20 @@ EXPORT_SYMBOL(snd_pcm_format_set_silence);
>   int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
>   {
>   	int i;
> +	unsigned int rmin, rmax;
> +
> +	rmin = UINT_MAX;
> +	rmax = 0;
>   	for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
>   		if (hw->rates & (1 << i)) {
> -			hw->rate_min = snd_pcm_known_rates.list[i];
> -			break;
> -		}
> -	}
> -	for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
> -		if (hw->rates & (1 << i)) {
> -			hw->rate_max = snd_pcm_known_rates.list[i];
> -			break;
> +			rmin = min(rmin, snd_pcm_known_rates.list[i]);
> +			rmax = max(rmax, snd_pcm_known_rates.list[i]);
>   		}
>   	}
> +	if (rmin > rmax)
> +		return -EINVAL;
> +	hw->rate_min = rmin;
> +	hw->rate_max = rmax;
>   	return 0;
>   }
>   EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 7461a727615c..5e1e6006707b 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2418,13 +2418,17 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
>   	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
>   }
>   
> -#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
> +#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12 ||\
> +	SNDRV_PCM_RATE_128000 != 1 << 19
>   #error "Change this table"
>   #endif
>   
> +/* NOTE: the list is unsorted! */
>   static const unsigned int rates[] = {
> -	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
> -	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
> +	5512, 8000, 11025, 16000, 22050, 32000, 44100,
> +	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000,
> +	/* extended */
> +	12000, 24000, 128000
>   };
>   
>   const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {

