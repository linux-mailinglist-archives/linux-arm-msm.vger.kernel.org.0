Return-Path: <linux-arm-msm+bounces-25257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE05927393
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E356DB2134E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A20B1AB52C;
	Thu,  4 Jul 2024 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diaSJuXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D318637;
	Thu,  4 Jul 2024 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720087282; cv=none; b=imuUr9ryclmt6158AC12VScSR0BB8mlX+n5Ca0om0ek/IjiyNn72+Pr7KXzvKwMPsnXa8y8qPOY0lxgZl/c8ZXiv+qRhF5MwwcOK1pzLDAfFXSuIWTcTWnVpB/a39QaYxq9ETMvKIfSkrSRN2GkVlxkS429De7+WQ4mIR8fpdkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720087282; c=relaxed/simple;
	bh=KDuBYp6j1WBY8O6g/h9oYOWnceBIGCqMamxaz7sob2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDvUnmn9KQ3F1aA++0ink5UEBFdGl6cxMT/Ly4tWa6Q3F4dud57rx1OrPWETBIdQAozZAXCZ9BH5VpfDrcrZKGyLKhhBIzHd0Q8gPuEQSEKS88bodqGAPn85f61G5vS+hWRIl0vdvFLPr7PAgGBjgyLouoDxgLJj9gMcCJW4P4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diaSJuXY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720087281; x=1751623281;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KDuBYp6j1WBY8O6g/h9oYOWnceBIGCqMamxaz7sob2E=;
  b=diaSJuXYtL7uyRSsn6jS8lhNe9z5+AZZKx0Wi93/v9LT2ofmGJ06xMVI
   CyDnIL0NsYDTqhlxKb/VlShGZ6MilhrrIdRNQBDSkVUWTsCjyR7DE02uE
   2MUlMnixyiLIS8Qxm0VDLUQ1SjkmAhli7MHs1iI71JRE8UdTsnF+Acb+r
   0DXHX9CCIE0sZno9ac9+MRv9wNTMDxMcINnH6g7VRQPtMHzw96YDuqdBp
   Kom60Y0+N8qIGngIv6AdrsOg6sQfLMoKhseIG9Haeqv8QzU5iYNVMLQJa
   M8mG0/Lw3ZlmSrXMm4rKY6FDO10eS38g9oXUYQFqEt4IahOTDola6Wa5s
   Q==;
X-CSE-ConnectionGUID: m+GqS2i4S/KKdvTn3y5gwg==
X-CSE-MsgGUID: gVOI+zUOS82/cEdbYIbuzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28752927"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28752927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:01:18 -0700
X-CSE-ConnectionGUID: De6J1i8DTYWEVKv/24X/RQ==
X-CSE-MsgGUID: EnB72ZaqRgm8HS+HPjMF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47207782"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:01:13 -0700
Message-ID: <adb4e27b-b328-4eef-87ca-9b8bad6639e6@linux.intel.com>
Date: Thu, 4 Jul 2024 12:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 conor+dt@kernel.org, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com,
 bgoswami@quicinc.com, tiwai@suse.com, robh@kernel.org,
 gregkh@linuxfoundation.org
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
 <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
 <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
 <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
 <ccbf9366-f3de-4a80-bffc-e32a8409e1a7@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ccbf9366-f3de-4a80-bffc-e32a8409e1a7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/4/2024 12:05 AM, Wesley Cheng wrote:
> 
> On 7/3/2024 2:50 AM, Pierre-Louis Bossart wrote:
>>
>>
>>>>>>>> There are really multiple layers to deal with
>>>>>>>>
>>>>>>>> a) is the controller able to support the offload path? IIRC this is
>>>>>>>> embedded in an obscure XHCI property, it would make sense to
>>>>>>>> expose it
>>>>>>>> as a control, or component string, of the USB card.
>>>>>>> If a component string/tag is desired, I already have some way of
>>>>>>> doing that.  I can add it to the USB card.
>>>>>>>
>>>>>>>> b) is there a companion card capable of dealing with the offload
>>>>>>>> path?
>>>>>>>> Since the presence of this card may depend on driver probe, there
>>>>>>>> should
>>>>>>>> be a control on the USB card. userspace could detect changes to this
>>>>>>>> control and detect if that path is or is no longer enabled.
>>>>>>> So currently, the "USB Offload Playback Capable Card" kcontrol (on
>>>>>>> the USB card) will determine if there is an offload path.  However,
>>>>>>> this differs than what Amadeusz is suggesting, in that he wants a
>>>>>>> single kcontrol created for EACH USB card identified (per USB audio
>>>>>>> device), and a simple enable/disable control to determine if the
>>>>>>> offload path is enabled for that card/pcm stream.
>>>>>>>
>>>>>>> It would be a simpler approach for the userspace, and if the card
>>>>>>> that handles the offload card isn't present, then these
>>>>>>> enable/disable control will be set to "disabled," and even if users
>>>>>>> attempt to set the control, it won't go through.
>>>>>> Not following. Are you suggesting userspace would modify the
>>>>>> enable/disable status?
>>>>> Yes, this is the suggestion.  One writeable kcontrol on the USB SND
>>>>> audio device that will control if that USB audio device is going to
>>>>> be offloaded.  If the kcontrol reads back "enabled" (or 1) then
>>>>> userspace knows that the offload path is active.  Else, if it reads
>>>>> "disabled" (or 0) after the attempt to set the kcontrol, then the
>>>>> offload path was unsuccessfully enabled, ie maybe due to no available
>>>>> offload streams.
>>>> It's a bit over-engineered IMHO.
>>>>
>>>> My alternate suggestion is a read-only control reporting that offload is
>>>> possible. Then userspace attempts to open a PCM device on the ASoC card,
>>>> any failures due to resources would be handled at that point.
>>>>
>>>>>> I would just have a read-only control that reports what the hardware
>>>>>> can
>>>>>> do and which other card can deal with offload. It's up to userspace to
>>>>>> select the offloaded PCM device or not.
>>>>>>
>>>>> That is what I have implemented in the previous patch series.  One
>>>>> USB SND kcontrol within each USB audio device, which points to the
>>>>> ASoC platform card that supports offloading:
>>>>>
>>>>> "USB Offload Playback Capable Card" --> returns the card index to the
>>>>> ASoC platform card
>>>>>
>>>>> >From there the offloading control is all within the ASoC platform
>>>>> card.  This is opposite to what Amaduesz suggested in that, the
>>>>> offload control of which USB device to offload should be within USB
>>>>> SND (not ASoC)
>>>> It's very hard to follow, I don't understand what userspace needs to
>>>> 'control' - in the modify sense. What userspace needs is a place to read
>>>> from, and then select the PCM device and follow usual ALSA configuration
>>>> with hw_params.
>>>>
>>>  From what I've seen I assumed that goal is to allow Offloading of
>>> specific stream from USB card. Otherwise I would say controls are not
>>> needed at all, as more user friendly solution is Offloading streams in
>>> order they are used as long as resources are available.
>> That's not great in terms of audio routing, you'd really want more rules
>> or controlled behavior where the order in which devices are used does
>> not matter.
> 
> So to clarify, when I mention to 'control' this is in case userspace does want to modify which USB device is offloaded.  By default, the current behavior is that the latest USB headset is going to be enabled for offloading.  IF say...userspace has some mechanism to switch which USB device is offloaded, they can do so using:
> 
> USB Offload Playback Route Card Select
> 
> USB Offload Playback Route PCM Select
> 
> The above controls are read/write.  read will fetch the current USB card and pcm indexes being enabled for offload.  write will set the USB card and pcm index to enable offload on.  Both reside on the ASoC card that is associated w/ the USB BE DAI link.
> 
>>>>>>>> c) which PCM device is actually offloaded? This could be plural
>>>>>>>> for some
>>>>>>>> implementations. The mapping between PCM devices exposed by the USB
>>>>>>>> card, and those exposed by the companion card, should be known to
>>>>>>>> userspace. I am not sure how this would be done though, a variable
>>>>>>>> number of controls is a sure way to confuse userspace.
>>>>>>> Expanding on Amadeusz's suggestion, my idea is to have an
>>>>>>> enable/disable kcontrol per USB stream.  For example, one USB card
>>>>>>> could have multiple PCM devices (USB streams).  So we would have
>>>>>>> something like:
>>>>>>>
>>>>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>>>>
>>>>>>> PCM Offload Playback Enable Stream#1  enable/disable
>>>>>>>
>>>>>>> ....
>>>>>> are those read-only or not?
>>>>> No, writable and readable.
>>>> The writable part introduces a complicated error handling, e.g. what
>>>> happens if you have an offloaded stream and then this control is changed
>>>> with amixer while streaming?
>>>>
>>> -EBUSY? and keep old value
>> That would require a stop, fw_free, close, reopening of the
>> non-offloaded device and restart. Best to avoid interrupting streams, if
>> there are no resources that should be detected with an early fail during
>> open/hw_params. Once the stream is flowing, it should not be interrupted
>> - unless the USB device is removed of course.
> I agree.  We don't want to interrupt streams if some reason someone tries to switch the offload path.  If there is already an active offload stream, then any attempt to switch/control which USB card/pcm stream is offload is going to be ignored.
>>
>>>>>>> So we'd know which USB card and PCM device is selected for USB
>>>>>>> SND.  However, I see what you're getting at in case there are
>>>>>>> multiple supported streams, because userspace needs to know which
>>>>>>> ASoC card/pcm combination corresponds to which USB device/combination.
>>>>>> I don't understand how this would help map the two parts? There's
>>>>>> got to
>>>>>> be an additional mapping...
>>>>> It won't help with the mapping.  That is something which we'd need to
>>>>> add, suggestion below.
>>>>>>> What do you think about having a USB card kcontrol to display the
>>>>>>> mapped ASoC card and PCM indexes?
>>>>>>>
>>>>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0,
>>>>>>> PCM device#1)
>>>>>>>
>>>>>>> To summarize, if we did this, I'd plan to remove all the kcontrols
>>>>>>> in ASoC card, and have the following in the USB card for an USB
>>>>>>> audio device that supports one USB stream:
>>>>>>>
>>>>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>>>>
>>>>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0,
>>>>>>> PCM device#1)
>>>>>> ... which is suggested here.
>>>>>>
>>>>>> Assuming these are read-only controls, we would need to know which PCM
>>>>>> device on the USB card can be optimized with the use of which PCM
>>>>>> device
>>>>>> on the ASoC card. That means a set of three values. You would also want
>>>>>> a number of streams to make the guesswork on controls less painful.
>>>>> OK, so now to just figuring out something that both you and Amadeusz
>>>>> can agree on before I put time implementing it.  So I've implemented
>>>>> the "enable/disable" path that Amadeusz suggested, which is
>>>>> highlighted in my previous response, for evaluation purposes.  The
>>>>> overall question is which layer should control the devices that will
>>>>> be offloaded.  In my submissions up until now, the control was given
>>>>> to the ASoC platform card to determine which USB device to offload.
>>>>> Amadeusz mentioned that it might be beneficial to move the control to
>>>>> the USB SND devices, because what if the offloading is NOT backed by
>>>>> ASoC. (highlighted in [1])  However, IMO the current implementation
>>>>> assumes there is ASoC involved, which should mean that there is some
>>>>> platform "card" that is backing the offload path.  Please let me know
>>>>> if my understanding is incorrect, @Amadeusz.
>>>> I still fundamentally don't get why userspace would try and modify any
>>>> controls, this makes the flows more complicated IMHO since you also have
>>>> the PCM open/hw_params stages.
>>>> I really think it'd be more than enough if the USB card exposed
>>>> read-only values showing that offload is possible and which card/device
>>>> to map to. Then userspace uses the ASoC PCM device and errors are
>>>> handled at that level.
> Just so I understand...is it really desired that userspace doesn't have the flexibility to choose which USB device is offloaded?  I know it complicates what needs to be done, but it could be just an additional feature that can be added later on.  Again, by default, we select the last USB headset plugged in to be enabled for offload by default.

If it chooses endpoint by itself perhaps you can send patch set without 
controls first? This has added benefit of less patches in series, making 
it easier to review and it won't block whole patch set by discussion on 
controls feature. Controls can be added in followup series.

>>> I tend to agree, less values to change, less chance something breaks.
>>> However I think that there should be some way to disable Offload in case
>>> something doesn't work properly. (It doesn't have to be control, one can
>>> go with module parameter or sysfs toggle or something.)
>> Agree with this, a 'static' configuration to disable offload would be
>> just fine. Module parameter is fine.
>>
>> A control to read if offload is possible and what the mapping is would
>> be good. From there on, userspace may open the offloaded PCM and deal
>> with all events (hw_params not supported, xruns, removal, etc).
> 
> I can look into adding this mapping part to the USB SND card, so we know which ASoC card/pcm devices are associated to the USB SND device for offloading.  Thank you for the discussions and input!
> 
> Thanks
> 
> Wesley Cheng
> 
> 


