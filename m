Return-Path: <linux-arm-msm+bounces-25035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C60449255D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9AC01C2580C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 08:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DE613CA8D;
	Wed,  3 Jul 2024 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLPu0Xf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827B13CA95;
	Wed,  3 Jul 2024 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996569; cv=none; b=c6T2m0z2EpfEgrXKHxlUE0cQ/vYTC8YAlrD+PvS9PDsxasjAID3HWG0FYFt99j+Ss974EUqfcrgkg5YPD4Afs9gtgX9psQbJFRNAZcJrDBinaqF4G9TJ9GjkGUFOXa+pCOxegVQRw5WeBK8snVr9OGSGyBGdXrFBkOfMnwROae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996569; c=relaxed/simple;
	bh=3dltHtCt2kO8qiiW2Npq9piciE3gykOkQi65SIBblgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XP/djhjAh/6lm6zcGJah2T12JEzxyxicV3NAzSg/iosJe7ijorV4X6x1quv9T+RSX4Y1DZb6MohYTt4JPqMVKSYBWGAWkJhf/AblEd1Tt0v11B189fH7fzGbEk0tEvk1S9g+7g5ARGGtMkxtauE6YD207idfQDY7SDnpCEX6vvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLPu0Xf2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719996568; x=1751532568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3dltHtCt2kO8qiiW2Npq9piciE3gykOkQi65SIBblgk=;
  b=eLPu0Xf2naHbJd3R4joRUOUgNK3W2MA1oSEj37nm+cuw53rBBa7TkYlb
   ty9mawMntTaCP8FCdNHSuCm38JhME3BFDOy7rdJqCZOBMp+NUImeWj3SS
   7CwkT1Zb0f1r5leXIr58BN7uwZ0uawBqgBmpJ4bix2Rj3oYXEqXBsSaaE
   ETK4RWk2zGfPpPPyLpkcrRRe40h8hWDh8pMURMDk5WVlyFuCz+WmG2iqd
   gZ0NboSlqYDNaUJn1cYFxYtcbFzP//PWaSbPYvUjB6jkVmteYLICDBT3b
   ezp5lKhBpbiT1A7I+5mz05uZckVX9fsp2efiZUEwigQJzWTSH10xR7F2J
   g==;
X-CSE-ConnectionGUID: oYCxL8rqTa2lulKecwpiNA==
X-CSE-MsgGUID: yW6Da1KhTBGBRtDsJzH2zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17166459"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17166459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 01:49:27 -0700
X-CSE-ConnectionGUID: hspAsi3VQOKExlrUFYcLFw==
X-CSE-MsgGUID: 2ivefynxTxGERJHTPJ/Mqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="50501023"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.242]) ([10.245.246.242])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 01:49:21 -0700
Message-ID: <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
Date: Wed, 3 Jul 2024 10:49:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
 <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



>>>> There are really multiple layers to deal with
>>>>
>>>> a) is the controller able to support the offload path? IIRC this is
>>>> embedded in an obscure XHCI property, it would make sense to expose it
>>>> as a control, or component string, of the USB card.
>>> If a component string/tag is desired, I already have some way of doing that.  I can add it to the USB card.
>>>
>>>> b) is there a companion card capable of dealing with the offload path?
>>>> Since the presence of this card may depend on driver probe, there should
>>>> be a control on the USB card. userspace could detect changes to this
>>>> control and detect if that path is or is no longer enabled.
>>> So currently, the "USB Offload Playback Capable Card" kcontrol (on the USB card) will determine if there is an offload path.  However, this differs than what Amadeusz is suggesting, in that he wants a single kcontrol created for EACH USB card identified (per USB audio device), and a simple enable/disable control to determine if the offload path is enabled for that card/pcm stream.
>>>
>>> It would be a simpler approach for the userspace, and if the card that handles the offload card isn't present, then these enable/disable control will be set to "disabled," and even if users attempt to set the control, it won't go through.
>> Not following. Are you suggesting userspace would modify the
>> enable/disable status?
> 
> Yes, this is the suggestion.  One writeable kcontrol on the USB SND audio device that will control if that USB audio device is going to be offloaded.  If the kcontrol reads back "enabled" (or 1) then userspace knows that the offload path is active.  Else, if it reads "disabled" (or 0) after the attempt to set the kcontrol, then the offload path was unsuccessfully enabled, ie maybe due to no available offload streams.

It's a bit over-engineered IMHO.

My alternate suggestion is a read-only control reporting that offload is
possible. Then userspace attempts to open a PCM device on the ASoC card,
any failures due to resources would be handled at that point.

>> I would just have a read-only control that reports what the hardware can
>> do and which other card can deal with offload. It's up to userspace to
>> select the offloaded PCM device or not.
>>
> That is what I have implemented in the previous patch series.  One USB SND kcontrol within each USB audio device, which points to the ASoC platform card that supports offloading:
> 
> "USB Offload Playback Capable Card" --> returns the card index to the ASoC platform card
> 
>>From there the offloading control is all within the ASoC platform card.  This is opposite to what Amaduesz suggested in that, the offload control of which USB device to offload should be within USB SND (not ASoC)

It's very hard to follow, I don't understand what userspace needs to
'control' - in the modify sense. What userspace needs is a place to read
from, and then select the PCM device and follow usual ALSA configuration
with hw_params.

>>>> c) which PCM device is actually offloaded? This could be plural for some
>>>> implementations. The mapping between PCM devices exposed by the USB
>>>> card, and those exposed by the companion card, should be known to
>>>> userspace. I am not sure how this would be done though, a variable
>>>> number of controls is a sure way to confuse userspace.
>>> Expanding on Amadeusz's suggestion, my idea is to have an enable/disable kcontrol per USB stream.  For example, one USB card could have multiple PCM devices (USB streams).  So we would have something like:
>>>
>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>
>>> PCM Offload Playback Enable Stream#1  enable/disable
>>>
>>> ....
>> are those read-only or not?
> 
> No, writable and readable.

The writable part introduces a complicated error handling, e.g. what
happens if you have an offloaded stream and then this control is changed
with amixer while streaming?

>>> So we'd know which USB card and PCM device is selected for USB SND.  However, I see what you're getting at in case there are multiple supported streams, because userspace needs to know which ASoC card/pcm combination corresponds to which USB device/combination.
>> I don't understand how this would help map the two parts? There's got to
>> be an additional mapping...
> It won't help with the mapping.  That is something which we'd need to add, suggestion below.
>>> What do you think about having a USB card kcontrol to display the mapped ASoC card and PCM indexes?
>>>
>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
>>>
>>> To summarize, if we did this, I'd plan to remove all the kcontrols in ASoC card, and have the following in the USB card for an USB audio device that supports one USB stream:
>>>
>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>
>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
>> ... which is suggested here.
>>
>> Assuming these are read-only controls, we would need to know which PCM
>> device on the USB card can be optimized with the use of which PCM device
>> on the ASoC card. That means a set of three values. You would also want
>> a number of streams to make the guesswork on controls less painful.
> 
> OK, so now to just figuring out something that both you and Amadeusz can agree on before I put time implementing it.  So I've implemented the "enable/disable" path that Amadeusz suggested, which is highlighted in my previous response, for evaluation purposes.  The overall question is which layer should control the devices that will be offloaded.  In my submissions up until now, the control was given to the ASoC platform card to determine which USB device to offload.  Amadeusz mentioned that it might be beneficial to move the control to the USB SND devices, because what if the offloading is NOT backed by ASoC. (highlighted in [1])  However, IMO the current implementation assumes there is ASoC involved, which should mean that there is some platform "card" that is backing the offload path.  Please let me know if my understanding is incorrect, @Amadeusz. 

I still fundamentally don't get why userspace would try and modify any
controls, this makes the flows more complicated IMHO since you also have
the PCM open/hw_params stages.
I really think it'd be more than enough if the USB card exposed
read-only values showing that offload is possible and which card/device
to map to. Then userspace uses the ASoC PCM device and errors are
handled at that level.

