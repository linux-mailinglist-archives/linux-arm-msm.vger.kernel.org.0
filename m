Return-Path: <linux-arm-msm+bounces-31512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EC975445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 15:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 244C5B2973F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305E41A3AA5;
	Wed, 11 Sep 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWKM58tt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EF118A6A0;
	Wed, 11 Sep 2024 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061875; cv=none; b=QOtqkuRXL9CnWvu/7ES9PcEYKgVbE6zb8/PvkHeaNUITf6zIZETZ9loXF+kcn38S/kqgKEo3aXsNQVBWQlC7EmzYtZeJlxwyAW65Kxc83XLaStKWd5g+UHnQju7jw6+vSpgG7musxeNb4TTmKZyM+YwAzBmJsNfhUGP+G8rHL/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061875; c=relaxed/simple;
	bh=n0tCEDIuCPhqkDcXyASMzHWwi/d9TjY2ubeWwWuPQu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=padm8ZERuht7YEwoDnlyaaP9wLiDpqkqkjjAna5xtHy5OZnxslXTZm9YjygbOc1EQKcBfplFUBh1TTwpwcwhYscOqXheCxoQmipqFSp/u+7zWgJ62+eHwMzp5Gu6+dlMnOaADACpqoWP3WgTP3eYlZzU7xHIK/YUTfTVj7nbqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWKM58tt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726061873; x=1757597873;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n0tCEDIuCPhqkDcXyASMzHWwi/d9TjY2ubeWwWuPQu8=;
  b=fWKM58ttyc9W1gwSNYuWJ8BoOkYq9f0YpRS0EghwZzGgesffyrCTgSyS
   WLUeFRFFRh0e2WPl614mQx11U0H0+Vk8fln7eEBATwSgBs29zqpZJzpOb
   fPPJLx9lZsA9+vlC8XgvsDL5/MDSWb2lqU2/oWCRQxDylukdqTxDyIZ6C
   5o5Etz0POOVWOVbT0q1/4jnwLbH7ITk+cUOVbGyKkCVjJEwAcGGKjhk0a
   CgxWBzK+wiiuAUdon9nc+KQYryEvLPLQrYA7Z8NnRuL1nrMT5LC1Tu+wt
   fTSLENL4ZzGOVt4wBd8djRqjdjO7LyqJYslx+BZSkt5XzM7rB64CxshyC
   w==;
X-CSE-ConnectionGUID: WoKxRJbrRmOqZCnriIiyWQ==
X-CSE-MsgGUID: W9DfL7adTPqI3GWRc4nmXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24685985"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24685985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:37:52 -0700
X-CSE-ConnectionGUID: I9MRL0L6RR+z1fXzcZbsVA==
X-CSE-MsgGUID: iYRL+yrkRQS0KVVxZcIa0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67385964"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:37:47 -0700
Message-ID: <ae8c1547-9aa7-4a11-9a40-6516ed9c7702@linux.intel.com>
Date: Wed, 11 Sep 2024 15:37:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
 <1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
 <87ed5q4kbe.wl-tiwai@suse.de>
 <5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
 <87y13y31kq.wl-tiwai@suse.de> <4f58ebe8-78fe-41f3-9fc6-720d314c026e@perex.cz>
 <87ldzy2wgc.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ldzy2wgc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/2024 2:42 PM, Takashi Iwai wrote:
> On Wed, 11 Sep 2024 12:58:53 +0200,
> Jaroslav Kysela wrote:
>>
>> On 11. 09. 24 12:51, Takashi Iwai wrote:
>>> On Wed, 11 Sep 2024 12:33:01 +0200,
>>> Péter Ujfalusi wrote:
>>>>
>>>> On 11/09/2024 12:21, Takashi Iwai wrote:
>>>>>> Wondering if this is backwards compatible with the alsa-lib definitions,
>>>>>> specifically the topology parts which did unfortunately have a list of
>>>>>> rates that will map to a different index now:
>>>>>>
>>>>>>
>>>>>> typedef enum _snd_pcm_rates {
>>>>>> 	SND_PCM_RATE_UNKNOWN = -1,
>>>>>> 	SND_PCM_RATE_5512 = 0,
>>>>>> 	SND_PCM_RATE_8000,
>>>>>> 	SND_PCM_RATE_11025,
>>>>>> 	SND_PCM_RATE_16000,
>>>>>> 	SND_PCM_RATE_22050,
>>>>>> 	SND_PCM_RATE_32000,
>>>>>> 	SND_PCM_RATE_44100,
>>>>>> 	SND_PCM_RATE_48000,
>>>>>> 	SND_PCM_RATE_64000,
>>>>>> 	SND_PCM_RATE_88200,
>>>>>> 	SND_PCM_RATE_96000,
>>>>>> 	SND_PCM_RATE_176400,
>>>>>> 	SND_PCM_RATE_192000,
>>>>>> 	SND_PCM_RATE_CONTINUOUS = 30,
>>>>>> 	SND_PCM_RATE_KNOT = 31,
>>>>>> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
>>>>>> } snd_pcm_rates_t;
>>>>>
>>>>> As far as I understand correctly, those rate bits used for topology
>>>>> are independent from the bits used for PCM core, although it used to
>>>>> be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
>>>>> it's clearer only for topology stuff.
>>>>
>>>> Even if we rename these in alsa-lib we will need translation from
>>>> SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?
>>>>
>>>> The topology files are out there and this is an ABI...
>>>>
>>>>> But it'd be better if anyone can double-check.
>>>>
>>>> Since the kernel just copies the rates bitfield, any rate above 11025
>>>> will be misaligned and result broken setup.
>>>
>>> Yep, I noticed it now, too.
>>>
>>> Below is the fix patch, totally untested.
>>> It'd be appreciated if anyone can test it quickly.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>> -- 8< --
>>> From: Takashi Iwai <tiwai@suse.de>
>>> Subject: [PATCH] ALSA: pcm: Fix breakage of PCM rates used for topology
>>>
>>> It turned out that the topology ABI takes the standard PCM rate bits
>>> as is, and it means that the recent change of the PCM rate bits would
>>> lead to the inconsistent rate values used for topology.
>>>
>>> This patch reverts the original PCM rate bit definitions while adding
>>> the new rates to the extended bits instead.  This needed the change of
>>> snd_pcm_known_rates, too.  And this also required to fix the handling
>>> in snd_pcm_hw_limit_rates() that blindly assumed that the list is
>>> sorted while it became unsorted now.
>>>
>>> Fixes: 090624b7dc83 ("ALSA: pcm: add more sample rate definitions")
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>
>> This looks fine. But the topology rate bits should not depend on those
>> bits. It's a bit pitty that the standard PCM ABI does not use those
>> bits for user space and we are doing this change just for topology
>> ABI.
> 
> Yeah, and theoretically it's possible to fix in topology side, but
> it'll be more cumbersome.
> 
> Although it's not really a part of PCM ABI, I believe we should move
> the PCM rate bit definitions to uapi, for showing that it's set in
> stone.  Something like below.
> 
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: pcm: Move standard rate bit definitions into uapi
> 
> Since the standard PCM rate bits are used for the topology ABI, it's a
> part of public ABI that must not be changed.  Move the definitions
> into uapi to indicate it more clearly.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/sound/pcm.h         | 26 --------------------------
>   include/uapi/sound/asound.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 824216799070..f28f6d6ac996 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -105,32 +105,6 @@ struct snd_pcm_ops {
>   
>   #define SNDRV_PCM_POS_XRUN		((snd_pcm_uframes_t)-1)
>   
> -/* If you change this don't forget to change rates[] table in pcm_native.c */
> -#define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
> -#define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
> -#define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
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
> -/* extended rates */
> -#define SNDRV_PCM_RATE_12000		(1U<<17)	/* 12000Hz */
> -#define SNDRV_PCM_RATE_24000		(1U<<18)	/* 24000Hz */
> -#define SNDRV_PCM_RATE_128000		(1U<<19)	/* 128000Hz */
> -
> -#define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
> -#define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
> -
>   #define SNDRV_PCM_RATE_8000_44100	(SNDRV_PCM_RATE_8000|SNDRV_PCM_RATE_11025|\
>   					 SNDRV_PCM_RATE_16000|SNDRV_PCM_RATE_22050|\
>   					 SNDRV_PCM_RATE_32000|SNDRV_PCM_RATE_44100)
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 4cd513215bcd..715ceb3eac7c 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -272,6 +272,32 @@ typedef int __bitwise snd_pcm_subformat_t;
>   #define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
>   #define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
>   
> +/* Standard rate bits */
> +#define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
> +#define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
> +#define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
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
> +
> +#define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
> +#define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
> +
>   #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
>   #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
>   #define SNDRV_PCM_INFO_DOUBLE		0x00000004	/* Double buffering needed for PCM start/stop */

I will just note that alternatively we could bump topology ABI (wouldn't 
be first time) and provide mapping in soc-topology.c for current one.

For ABI+1 we could remove the field from problematic topology struct to 
not make SNDRV_PCM_RATE_* part of UAPI and provide some other way to 
pass expected rates.

