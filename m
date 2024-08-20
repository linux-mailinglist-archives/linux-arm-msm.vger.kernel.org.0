Return-Path: <linux-arm-msm+bounces-29054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94B957E6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6101C24050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 06:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C31718E367;
	Tue, 20 Aug 2024 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzf3vvLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC2518E35E;
	Tue, 20 Aug 2024 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724136008; cv=none; b=GQ00RxMesye1WD8Nzqwit5MOkCY2fMMNJwmLaqgf+vzcYz6kwNM2j1Qdw36f9Ad82yIta9F76nKe5V+7nBgufqrxs0IWQEwkL9npSyGnGdhXCkQ6674uVkxQ2JhuAnOwE9beoAqy3Cc0KZcHeCoe3ROV8FPRpOUfjuMw029bhQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724136008; c=relaxed/simple;
	bh=/hHiRcXgLHm4sUaUmn1kvv9aDZlbaGSXQTZLN7Klh8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yst4Zwsl5xppStn7ye34550ISEEr59VoeucJul4NMdl40p8g2q6Lm7T8SycuDjuzipTam2JhpDy/7RNK9NwH00o23aKgnifGOxEYUIjWYb13KY3x2fMVSFW1SvN6N+kxdIpoFwFhAFBJiy6UXjJtBQmChp2p1uSsdYRGhwq1WYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzf3vvLa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724136006; x=1755672006;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/hHiRcXgLHm4sUaUmn1kvv9aDZlbaGSXQTZLN7Klh8Q=;
  b=hzf3vvLaPyT72YwlfpxPwBNxh6f5vZrIW/KUrDIwGZ0kkTCJoc+iSDVv
   zMJGvEKw7fRKM8EwYJIom5a3vdB+rU4e+NelGupv1dvQsUfuh62O0B33C
   KjAnTXzOVQDwxCheG9kWwCbU/mLyvg5Z2exg8yj/OEfZ9Q8o+/BR1orwb
   qqhYd6UFSCGVLlMsbn9l5gq8lsQzUBudG864F5OwOY1f1RNZFTVGCAhVn
   vBtHyO6LIKjE9RL9Nk7x29+G1HMXGJSg0XaMhHo9Gb/EqnzSywvqOOcF2
   KEd7RxUmp/9MG+1jt6gKVYo5G3vhyOpFEqX/HfjyIHNfLeXcbhIR9W3oJ
   g==;
X-CSE-ConnectionGUID: CdxFjwjoTfKEp/1GMtWZ7g==
X-CSE-MsgGUID: yBjM6gz2Q3Kvm1f76jU9Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22297503"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22297503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 23:40:05 -0700
X-CSE-ConnectionGUID: BsfZeq6bQjGX4UIBe0hLfA==
X-CSE-MsgGUID: efE7EHc2Sbe1ViKK24ig2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="91394800"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176]) ([10.245.246.176])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 23:39:59 -0700
Message-ID: <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
Date: Tue, 20 Aug 2024 08:39:56 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>> +/**
>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>> + * @chip - USB SND chip device
>>> + *
>>> + * Creates a sound control for a USB audio device, so that applications can
>>> + * query for if there is an available USB audio offload path, and which
>>> + * card is managing it.
>>> + */
>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>> +{
>>> +	struct usb_device *udev = chip->dev;
>>> +	struct snd_kcontrol_new *chip_kctl;
>>> +	struct snd_usb_stream *as;
>>> +	char ctl_name[37];
>>> +	int ret;
>>> +
>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>> +		chip_kctl->count = 1;
>>> +		/*
>>> +		 * Store the associated USB SND card number and PCM index for
>>> +		 * the kctl.
>>> +		 */
>>> +		chip_kctl->private_value = as->pcm_index |
>>> +					  chip->card->number << 16;
>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>> +			as->pcm_index);
>>> +		chip_kctl->name = ctl_name;
>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>> +				  udev->bus->sysdev));
>>> +		if (ret < 0)
>>> +			break;
>>> +	}
>>> +
>>> +	return ret;
> Hi Pierre,
>> None of this looks Qualcomm-specific, shouldn't this be part of the
>> soc_usb framework instead of being added in the qcom/ stuff?
> 
> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
> 
> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
> 
> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
> 
> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.

My comment was only referring to the location of the code, it's now in
sound/usb/qcom/mixer_usb_offload.c but does not contain anything
specific to Qualcomm. I was not asking for any encapsulation inside of
soc-usb, I was only suggesting a move of the code to a shared helper
library so that this code can be reused as is and not duplicated if the
QCOM parts are not compiled in.

