Return-Path: <linux-arm-msm+bounces-28003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B322A9493C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 16:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D99C280F70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 14:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6262205E06;
	Tue,  6 Aug 2024 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuAGokTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264061D61BD;
	Tue,  6 Aug 2024 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955874; cv=none; b=A3UcxMguogw0K4CHOWuviO+/sM7phNuTNyOzuG0K88srWA2J2pXSpks91XrIu6ulUmDW5MFYrj5UCK9F6rKeEl0wkgxvXMtyrkVUkuKHL1lD2eYYK4SedKrCyR6NM0yP6eORjWlD3rIk1zjE1Bu2MmSsasG46cVuqu+2HbifP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955874; c=relaxed/simple;
	bh=epnSmWwsAft3uM/meWwz3a3AEZDlLJA7Y6aLodABTZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKKe/MTDaZTL0mnjEvsO5jK0eHUgY3pjQw5+rVnhaYtY1UFwPcbu9K4bwJ9taqBpIV9QuZa3FqjMpbGjCK8qeNSs//7SD4Z6PwzGBHjuIQPVF6AK3PY6iKpWvlLHw5NeChVKiMRG9gHBiXmFsPqGc9260f/cj4OULXnlWHAL6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuAGokTb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955874; x=1754491874;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=epnSmWwsAft3uM/meWwz3a3AEZDlLJA7Y6aLodABTZI=;
  b=DuAGokTbI61l8BlyO6VS3CuqhGmFQ/iVlDGmFM15dqNH932gaAMZzKse
   Wy2TrBEdtVqy0tOi6gHKy6wQMtRwJA0JYujC4hYpdqv7JpoTncQF7Rs4V
   2PtQ60Hsr2B9YPgyQR31tQKaREkC8DLFJT/nWEKBjoAOkNSz/c1N/9fMp
   ncHex/tRUctRhb7visLBiIzUn6FUzU8GSapk7kP0tm6nFp6ykznV2jUEx
   WP9VDNhHEnNE909qVbrde0g3bppqd+tKU8Z2CugIWJhoxQq82HgjatBvV
   8iL3mBpYPo5jDvSB4MxZTT3lR4xGKdYRKex0OtFUOamBeG8tuXOykjoei
   Q==;
X-CSE-ConnectionGUID: 00fGwDdTRY+yaZmdJtZFrA==
X-CSE-MsgGUID: YbdW1DyHQYOHxbBOnj/5JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101774"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21101774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:51:12 -0700
X-CSE-ConnectionGUID: ZZRHssqJRWOw10BSIhT3Ng==
X-CSE-MsgGUID: EorPW4FmRGWL+6V8mUVq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87476658"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:51:06 -0700
Message-ID: <5c882055-85d5-41ba-98bf-da375a490c5b@linux.intel.com>
Date: Tue, 6 Aug 2024 16:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 conor+dt@kernel.org, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com,
 bgoswami@quicinc.com, tiwai@suse.com, gregkh@linuxfoundation.org,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
 <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
 <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/2/2024 12:43 AM, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 8/1/2024 1:07 AM, Pierre-Louis Bossart wrote:
>>
>>
>>> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>> +						 struct snd_soc_jack *jack)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +
>>> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>>> +{
>>> +	return -ENODEV;
>>> +}
>> usually fallback functions return 0, is the error code intentional?
> ACK.
>>
>>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>> +					struct snd_soc_jack *jack)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
>> do we need the reference to Playback?
> No, will remove.
>>> +					SND_JACK_HEADPHONE, jack);
>> wondering if there would be any merit in defining a new type of jack,
>> e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
>> device connected. The type of device does not really matter, does it?
>>
> Not as of now, but I think we discussed in the past that maybe depending on if playback and capture is supported, we can notify SND_JACK_HEADSET?  That is something I will need to change depending on how we want to handle the comments on patch#9
> 

I agree with Pierre that SND_JACK_HEADPHONE is too specific in this 
case, adding SND_JACK_USB sounds like good solution, as there are more 
device types than headset and headphones. Alternatively you could also 
consider defining some type of USB Audio Class mapping to existing 
SND_JACK types. (Look for UAC_INPUT_TERMINAL_*, UAC_OUTPUT_TERMINAL_* & 
UAC_BIDIR_TERMINAL_*.)


