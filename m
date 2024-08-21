Return-Path: <linux-arm-msm+bounces-29178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DA95953F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 09:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B956528322F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 07:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5DD192D7E;
	Wed, 21 Aug 2024 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YY1g8XpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06171192D6A;
	Wed, 21 Aug 2024 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223767; cv=none; b=qKDsCipmg2z7Hn7pCJRYxz0mA6fCwkglbpV7UWvRJamgNFxazpbRRbS1sMLdmXgs808SDePHDjS8/Zh4UK14R2TFU4qlPUZ+cRLAxiwyJxGGZc8VPD7rD+qLTVlxG+7JIohO6ipNxNrZzyNGcTusDkCIqpCFVId+feerN7KXmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223767; c=relaxed/simple;
	bh=8rUm72MnGLmHQNl/Pyxx0EYzyXtHSorMLOIHmsjfdMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxwHumIdFonq2SoDL71KjbqDo4KV4j2brhRkBDHnS2kOLANbgSkGwvEtD2EVE+OFb0aX6X2GFibJjKt4v5gfJyxxTeNxQhI5uaO9+kxw2WgwW/FmsbFRAWZXb1EGonXsFv7QGuuBIgHSfK6KFS+vO48u/9p5TQVX6ufYC1BZ6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YY1g8XpH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724223766; x=1755759766;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8rUm72MnGLmHQNl/Pyxx0EYzyXtHSorMLOIHmsjfdMk=;
  b=YY1g8XpHLdE595GK51tnrBrNO/HM5rr8j+FEc1APx3Ifcx+tH0VLnkr1
   PWovQjs+6o5WGEgDTCnMkBUbIXUe+K4/x3cEdjntn+ibtEiW0AoyemxgU
   kHtXkELsiWDlcD0aCUIz23Lht+MYyuVDjBdDOwfXqQYBnhSXrC94v9f0O
   LANXScKrbZEnTtolgYBfj7vAL5PfbWR0ISOKVPA4BxzlOjoDbQ6dL6ArF
   s8C+drAMjOY59JRwxRCvtmMFGsT2uDFpfJyD+eDX2eirm6xqmjXgVhsE0
   +ZzYnIABT4XV7xVVbp1ejs+/k3cw8H3x5ZMvYV/gsk61a5h0XSLfmntfz
   A==;
X-CSE-ConnectionGUID: Hhs8JmD/QsW33kpH3E9nCw==
X-CSE-MsgGUID: DGFSXacyTGqSOOjiLVDqZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22706002"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22706002"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 00:02:46 -0700
X-CSE-ConnectionGUID: r7X2J0LrR8ub329AoQ8R8g==
X-CSE-MsgGUID: fYBNYWdMTGy2tKnZxPcjmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65871786"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.16]) ([10.245.246.16])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 00:02:39 -0700
Message-ID: <7b3421f5-8d57-4138-9456-1bf0eb4662c0@linux.intel.com>
Date: Wed, 21 Aug 2024 09:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
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
 <20240801011730.4797-30-quic_wcheng@quicinc.com>
 <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
 <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
 <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
 <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
 <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




>>>>>> +/**
>>>>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>>>>> + * @chip - USB SND chip device
>>>>>> + *
>>>>>> + * Creates a sound control for a USB audio device, so that applications can
>>>>>> + * query for if there is an available USB audio offload path, and which
>>>>>> + * card is managing it.
>>>>>> + */
>>>>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>>>>> +{
>>>>>> +	struct usb_device *udev = chip->dev;
>>>>>> +	struct snd_kcontrol_new *chip_kctl;
>>>>>> +	struct snd_usb_stream *as;
>>>>>> +	char ctl_name[37];
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>>>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>>>>> +		chip_kctl->count = 1;
>>>>>> +		/*
>>>>>> +		 * Store the associated USB SND card number and PCM index for
>>>>>> +		 * the kctl.
>>>>>> +		 */
>>>>>> +		chip_kctl->private_value = as->pcm_index |
>>>>>> +					  chip->card->number << 16;
>>>>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>>>>> +			as->pcm_index);
>>>>>> +		chip_kctl->name = ctl_name;
>>>>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>>>>> +				  udev->bus->sysdev));
>>>>>> +		if (ret < 0)
>>>>>> +			break;
>>>>>> +	}
>>>>>> +
>>>>>> +	return ret;
>>>> Hi Pierre,
>>>>> None of this looks Qualcomm-specific, shouldn't this be part of the
>>>>> soc_usb framework instead of being added in the qcom/ stuff?
>>>> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
>>>>
>>>> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
>>>>
>>>> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
>>>>
>>>> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.
>>> My comment was only referring to the location of the code, it's now in
>>> sound/usb/qcom/mixer_usb_offload.c but does not contain anything
>>> specific to Qualcomm. I was not asking for any encapsulation inside of
>>> soc-usb, I was only suggesting a move of the code to a shared helper
>>> library so that this code can be reused as is and not duplicated if the
>>> QCOM parts are not compiled in.
>> Ah, great, thanks for the clarification.  Let me take a look with that perspective.
>>
> Going back on the history behind moving it into qcom/ was based off feedback that Takashi pointed out in v14[1].  It was mainly due to the fact that we would be adding another hard dependency between USB SND and the offloading components.  Hence the reason for moving it to within the QCOM offloading package. 
> 
> Thanks
> 
> Wesley Cheng
> 
> [1]: https://lore.kernel.org/linux-usb/87y1bt2acg.wl-tiwai@suse.de/

I don't see anything wrong with the initial proposal


 +config SND_USB_OFFLOAD_MIXER
 +	bool
 +
  config SND_USB_AUDIO_QMI
  	tristate "Qualcomm Audio Offload driver"
  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
  	select SND_PCM
 +	select SND_USB_OFFLOAD_MIXER


That would allows the SND_USB_OFFLOAD_MIXER to be build as a module, and
it would allow other non-QCON solutions to use the module.
Maybe just make it a tristate?

