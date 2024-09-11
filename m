Return-Path: <linux-arm-msm+bounces-31482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD92974FBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 618291C20EEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3551547CF;
	Wed, 11 Sep 2024 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWdqkLdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C87DA83;
	Wed, 11 Sep 2024 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050781; cv=none; b=bNCBnhA0n6MIlbVXxHkAY4IZ9ogVLkC4jB0/q36pzJsxyr50PphuwCFFbabCxZEnfEFM8LP8Gox30d/7HUIaEXlxlwhgaotTGGAL47MuWmAHC86qPFKmvkiMSMhF5gnLg+0iChfpsJxIWt2HyMFd7HbyaBzER8dpypmL4EkQJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050781; c=relaxed/simple;
	bh=L3DfyRJyMBTh2hMe73ZBoYLf1innUkJOSEQ3kjB6jvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AY8KDNviOpWEL9rKKYhf56KrgUbmxoHRNyoK83vXEdslgPRKWG5WD+2/BJVazci4Ov6iS0rbn0PS9sCjH3h/e9rZ0JT5Cs7GY7Ch+wEn4MXvLuvrhcVWFXSqvBsJy2iu0a4XXqYr+9xhlc1Q0l30ZEMD1Ce2m6xGzknPDXKXl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWdqkLdr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726050780; x=1757586780;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L3DfyRJyMBTh2hMe73ZBoYLf1innUkJOSEQ3kjB6jvE=;
  b=AWdqkLdrms3vrxz6hKXFxqg60oyutQYgxeXvBg2bjy66dX/pBTTn3/3g
   wmsSElbOcNEc11jhYXXKxsG1KYM0NPHTTOsW6cjFfcwCCzQF3LHCM7Og7
   WuVWzXyXNcADUaIuVq5ZzOucH9bxXC4aCruwps7b11CpateESy0e9Z48h
   xlxeSa/uJnh0BGEA2A/EVlH0zWMFPrqhWo8mUIhXUia5kgaLKw4MQDBI5
   GBVshgXbXt4+5Bi5NYUCuOda4ZvfXy0fZ7giioJU5tNCodMdeUD9vdZco
   rJITHU2O2sBYTWAZfJM6zNFy1bVPsyWEYzkad307Eyj58QBwJIiLL1GDC
   Q==;
X-CSE-ConnectionGUID: +ooEyTE+QNCtTj4ouIZ+cg==
X-CSE-MsgGUID: ZyxP779+T4iRdg0TY8WSrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50255157"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="50255157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:32:59 -0700
X-CSE-ConnectionGUID: BNEu4AC2T/CJ3e9psPx4QQ==
X-CSE-MsgGUID: 0lOjmVLITqO33NbgMFbjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72125867"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.58]) ([10.245.244.58])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:32:53 -0700
Message-ID: <5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
Date: Wed, 11 Sep 2024 13:33:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
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
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87ed5q4kbe.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2024 12:21, Takashi Iwai wrote:
>> Wondering if this is backwards compatible with the alsa-lib definitions,
>> specifically the topology parts which did unfortunately have a list of
>> rates that will map to a different index now:
>>
>>
>> typedef enum _snd_pcm_rates {
>> 	SND_PCM_RATE_UNKNOWN = -1,
>> 	SND_PCM_RATE_5512 = 0,
>> 	SND_PCM_RATE_8000,
>> 	SND_PCM_RATE_11025,
>> 	SND_PCM_RATE_16000,
>> 	SND_PCM_RATE_22050,
>> 	SND_PCM_RATE_32000,
>> 	SND_PCM_RATE_44100,
>> 	SND_PCM_RATE_48000,
>> 	SND_PCM_RATE_64000,
>> 	SND_PCM_RATE_88200,
>> 	SND_PCM_RATE_96000,
>> 	SND_PCM_RATE_176400,
>> 	SND_PCM_RATE_192000,
>> 	SND_PCM_RATE_CONTINUOUS = 30,
>> 	SND_PCM_RATE_KNOT = 31,
>> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
>> } snd_pcm_rates_t;
> 
> As far as I understand correctly, those rate bits used for topology
> are independent from the bits used for PCM core, although it used to
> be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
> it's clearer only for topology stuff.

Even if we rename these in alsa-lib we will need translation from
SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?

The topology files are out there and this is an ABI...

> But it'd be better if anyone can double-check.

Since the kernel just copies the rates bitfield, any rate above 11025
will be misaligned and result broken setup.

> 
> 
> thanks,
> 
> Takashi

-- 
Péter

