Return-Path: <linux-arm-msm+bounces-31508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727179752F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 14:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7B201F238B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBD1185606;
	Wed, 11 Sep 2024 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pT0FuqBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E4184559
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059340; cv=none; b=PRKNhLvyunfD0t4zw/rrt7UIh9DBczvbdcThfd3M1lZW8Pm5nmrs2Zy8zAYfa09XgeRIbT9eta7W6UOpOSN8UQ780c4XVnn5ohMuzo6Hib7/keaW2AEDnDykT9OuuGmqS8M6ageS6s3h4QdFIK+X3MbKhpv56BAea4/IC1S/Yic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059340; c=relaxed/simple;
	bh=PXGl3Yh3gPOigFyEjo+1kizXmz5AFYgovU6M8wIOaVc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gUnu1PXvI2fv3c8n4RsCOVWMw8EH+qyAuzOTfsG6ru08YCwbWeHnXBfW9xUalC+jUln5MyknwIUuRNiZ78tFgFyzxjeAs3f5W3z/p/xp6HrqY5CUIEQjoDAA35nymByXy/ZJMcyeXCwwv754dqda6vQPNiwe6PUbZ7lde9IgtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pT0FuqBo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso40815505e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 05:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726059335; x=1726664135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9RGOZIYc6ayBD37YXP/MMFqFNqPPZai0Orn0846COw=;
        b=pT0FuqBoxvCQyYd61HUH9P6pN1A3vt/aQimNZVf1k0t/BzEfhmv8my7p4ZULIKolyi
         2KOtU5wdpLlHjnR4LCWvL7C3DOLvu/5Qy2ANWXis4yrrLpMFELRpjXOJOZ0YVR8j+NVO
         PnbepYmYHnKP7lbiuihZBCytWL3vAPW+J6L8hokXg7K8n/NN7Uv6P4WAbeNUkUEm7DxK
         oTlyJD2D9bTtY18JLGbS++cLgCaPyPppRSLIYHgBO98YjWahrRrp7ca5DyxhgDeelPAe
         1uIdyIYEEeprFv4UVGPQ/4MONwZCuYHiycy/c7yJFpbS5HPzyFp60Xzw591sncbdHe9p
         RRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726059335; x=1726664135;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9RGOZIYc6ayBD37YXP/MMFqFNqPPZai0Orn0846COw=;
        b=qVq2O7FPcpEUjlzOncdMj61oYa5nRIJZ7X8xIxa3OTwM8IpQ7Czy7NiCWD2hE22oBB
         l+LB+i7HB28ckhDC//+wWvvXSiuS5FAs2VdSfahHhSVLfxEvTR1QWUuJsUm7U20mFqem
         LrijmhwYQwlEHMz6m6HpSyt6NFpw+P7WhHVpu9sRtCUrOJx8pVA/pNyFnZ+u3VyspLXz
         oRvCBzusCOJy1vskMkvuGr8VEsrciVb5e5UDMw1kO5mxUTiQX7NlyKOpJpDMdY+BCZXV
         NpteH5C+HQonOa9VO2bsHFWctkZksoFA+DSs+Yhoq5x5iZY2aUZKPzDfp7cBKqk/dCP3
         GG2w==
X-Forwarded-Encrypted: i=1; AJvYcCUeTozqmoY6yiLAJ4T9kC7NPaYgmIIQ6dqgYGhZNlOlo44XBcoshGEBstZcueMXceR8rEoAvYr2GD4ZfaFg@vger.kernel.org
X-Gm-Message-State: AOJu0YxWOLpcY5NklAcGLxqpS837jdbo6X3LbvB9vbokdkFegG89+VA+
	47LDQfnbmhc1lUtll+ij8Mgbtj2xG6JFjMeyIv7dxcztGn0UHDtCDUBPAxTKHrY=
X-Google-Smtp-Source: AGHT+IFUI5RsJEYiRmeXktzyq/H2NLWoogpCMjeueVb9QXdTRobrP0ALCRQbHrSB3n16d3kmTZ3FAg==
X-Received: by 2002:a05:600c:5107:b0:426:6f17:531 with SMTP id 5b1f17b1804b1-42cad760f6bmr113201445e9.13.1726059333802;
        Wed, 11 Sep 2024 05:55:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb0dbcb6bsm136949845e9.30.2024.09.11.05.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 05:55:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: =?utf-8?Q?P=C3=A9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  David Rhodes <david.rhodes@cirrus.com>,
  Richard Fitzgerald <rf@opensource.cirrus.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Cezary Rojewski
 <cezary.rojewski@intel.com>,  Liam Girdwood
 <liam.r.girdwood@linux.intel.com>,  Bard Liao
 <yung-chuan.liao@linux.intel.com>,  Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,  Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,  Chen-Yu Tsai <wens@csie.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org,
  patches@opensource.cirrus.com,  alsa-devel@alsa-project.org,
  linux-arm-msm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
In-Reply-To: <87y13y31kq.wl-tiwai@suse.de> (Takashi Iwai's message of "Wed, 11
	Sep 2024 12:51:49 +0200")
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
	<20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
	<1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
	<87ed5q4kbe.wl-tiwai@suse.de>
	<5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
	<87y13y31kq.wl-tiwai@suse.de>
Date: Wed, 11 Sep 2024 14:55:32 +0200
Message-ID: <1j34m6s62j.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 11 Sep 2024 at 12:51, Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 11 Sep 2024 12:33:01 +0200,
> P=C3=A9ter Ujfalusi wrote:
>>=20
>> On 11/09/2024 12:21, Takashi Iwai wrote:
>> >> Wondering if this is backwards compatible with the alsa-lib definitio=
ns,
>> >> specifically the topology parts which did unfortunately have a list of
>> >> rates that will map to a different index now:
>> >>
>> >>
>> >> typedef enum _snd_pcm_rates {
>> >> 	SND_PCM_RATE_UNKNOWN =3D -1,
>> >> 	SND_PCM_RATE_5512 =3D 0,
>> >> 	SND_PCM_RATE_8000,
>> >> 	SND_PCM_RATE_11025,
>> >> 	SND_PCM_RATE_16000,
>> >> 	SND_PCM_RATE_22050,
>> >> 	SND_PCM_RATE_32000,
>> >> 	SND_PCM_RATE_44100,
>> >> 	SND_PCM_RATE_48000,
>> >> 	SND_PCM_RATE_64000,
>> >> 	SND_PCM_RATE_88200,
>> >> 	SND_PCM_RATE_96000,
>> >> 	SND_PCM_RATE_176400,
>> >> 	SND_PCM_RATE_192000,
>> >> 	SND_PCM_RATE_CONTINUOUS =3D 30,
>> >> 	SND_PCM_RATE_KNOT =3D 31,
>> >> 	SND_PCM_RATE_LAST =3D SND_PCM_RATE_KNOT,
>> >> } snd_pcm_rates_t;
>> >=20
>> > As far as I understand correctly, those rate bits used for topology
>> > are independent from the bits used for PCM core, although it used to
>> > be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
>> > it's clearer only for topology stuff.
>>=20
>> Even if we rename these in alsa-lib we will need translation from
>> SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?
>>=20
>> The topology files are out there and this is an ABI...
>>=20
>> > But it'd be better if anyone can double-check.
>>=20
>> Since the kernel just copies the rates bitfield, any rate above 11025
>> will be misaligned and result broken setup.
>
> Yep, I noticed it now, too.
>
> Below is the fix patch, totally untested.
> It'd be appreciated if anyone can test it quickly.
>
>
> thanks,
>
> Takashi
>
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
>  include/sound/pcm.h     | 35 ++++++++++++++++++-----------------
>  sound/core/pcm_misc.c   | 18 ++++++++++--------
>  sound/core/pcm_native.c | 10 +++++++---
>  3 files changed, 35 insertions(+), 28 deletions(-)
>
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index c993350975a9..824216799070 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -109,23 +109,24 @@ struct snd_pcm_ops {
>  #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
>  #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
>  #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
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
>=20=20
>  #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
>  #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous ra=
tes */
> diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> index 5588b6a1ee8b..4f556211bb56 100644
> --- a/sound/core/pcm_misc.c
> +++ b/sound/core/pcm_misc.c
> @@ -494,18 +494,20 @@ EXPORT_SYMBOL(snd_pcm_format_set_silence);
>  int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
>  {
>  	int i;
> +	unsigned int rmin, rmax;
> +
> +	rmin =3D UINT_MAX;
> +	rmax =3D 0;
>  	for (i =3D 0; i < (int)snd_pcm_known_rates.count; i++) {
>  		if (hw->rates & (1 << i)) {
> -			hw->rate_min =3D snd_pcm_known_rates.list[i];
> -			break;
> -		}
> -	}
> -	for (i =3D (int)snd_pcm_known_rates.count - 1; i >=3D 0; i--) {
> -		if (hw->rates & (1 << i)) {
> -			hw->rate_max =3D snd_pcm_known_rates.list[i];
> -			break;
> +			rmin =3D min(rmin, snd_pcm_known_rates.list[i]);
> +			rmax =3D max(rmax, snd_pcm_known_rates.list[i]);
>  		}
>  	}
> +	if (rmin > rmax)
> +		return -EINVAL;
> +	hw->rate_min =3D rmin;
> +	hw->rate_max =3D rmax;
>  	return 0;
>  }
>  EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 7461a727615c..5e1e6006707b 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2418,13 +2418,17 @@ static int snd_pcm_hw_rule_sample_bits(struct snd=
_pcm_hw_params *params,
>  	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
>  }
>=20=20
> -#if SNDRV_PCM_RATE_5512 !=3D 1 << 0 || SNDRV_PCM_RATE_768000 !=3D 1 << 19
> +#if SNDRV_PCM_RATE_5512 !=3D 1 << 0 || SNDRV_PCM_RATE_192000 !=3D 1 << 1=
2 ||\
> +	SNDRV_PCM_RATE_128000 !=3D 1 << 19
>  #error "Change this table"
>  #endif
>=20=20
> +/* NOTE: the list is unsorted! */
>  static const unsigned int rates[] =3D {
> -	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 640=
00,
> -	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
> +	5512, 8000, 11025, 16000, 22050, 32000, 44100,
> +	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768=
000,
> +	/* extended */
> +	12000, 24000, 128000
>  };
>=20=20
>  const struct snd_pcm_hw_constraint_list snd_pcm_known_rates =3D {

I've quickly tested this version with a few rates (48, 128, 768k),
amlogic device.

Looks Ok.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

Can't say for topology.

--=20
Jerome

