Return-Path: <linux-arm-msm+bounces-23190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B860590E4EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 09:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84711C21D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 07:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B9F770ED;
	Wed, 19 Jun 2024 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvf0QXle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCF73441;
	Wed, 19 Jun 2024 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718783562; cv=none; b=h76RGtDKumNUQPaEB3FJdkkKjE2UI8zNhzmRt23oOiJPm4hZXVNgudTubEes33984VaGgITgBFglYxSuVjjljDaMXWuVHDBfLDAqnrOZI20VFxkbmlqI+gDLGjEddE9dQi8WM344eiFV0efm11teSEsXxVnRXSKK7gjx13+Dj9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718783562; c=relaxed/simple;
	bh=H10wBpKPsvDcsTb0TDOwAb2cn0L0fhqGpU7vrHSA07g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fc9rUimu9gMZcNqq4NyPFob8czzWuOPfF7qDZxzdZLFNZcRvrMXSgJFIKABzpg6dm/GP4lfgK4fcoVBjBHWFts1PLX4Rs1axeyCsXBElSrowVd8ffuyPJFuQXVfMpGIcD+sqfV33uymjQRVAR2P5scq2ng4lEW4NBmXG3ro8X+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvf0QXle; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718783561; x=1750319561;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H10wBpKPsvDcsTb0TDOwAb2cn0L0fhqGpU7vrHSA07g=;
  b=nvf0QXleOq0MgplrysU5SFBRmaUg6WToqIXH15Q8CzlLVfqg8zAbISfC
   EreCNnhqgizGx/33myrz2LdY0rKdd/wPMIwzJXrt2iBsKA5VAxc+Bt8G+
   WcYMjv0JV5rDVkJSjHUPd915QHBZtlQ5m3eBjl+GUDNXHdbOkT/BEN/pP
   BzCqYKnTJ6RGJx+InlAOzgykTmTeAkdYiKlMlpplVCjVfEYms/92H4CuY
   xoKdiPSOQPRZJY5dfOG9adPiie0q1OvOdh01NYSb266MWydRu/VDg5gfA
   7U3OJrZpYlLL8LxhTHM8R1OooA21KdQx6JkI2/kIUBhJGlsWlQqBjEbDY
   A==;
X-CSE-ConnectionGUID: OWSZsjAITaeTqqDnsNU2Tg==
X-CSE-MsgGUID: KKKrBe1YT3WF2V5kAC8FDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15467290"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15467290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 00:52:39 -0700
X-CSE-ConnectionGUID: L1xmlWBIRdeoOtiVtpbpug==
X-CSE-MsgGUID: zFr38q7+Twaj/W7YB8LB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="73040390"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 00:52:34 -0700
Message-ID: <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
Date: Wed, 19 Jun 2024 09:52:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/2024 10:52 PM, Wesley Cheng wrote:
> Hi Amadeusz,
> 
> On 6/18/2024 4:42 AM, Amadeusz Sławiński wrote:
>> On 6/17/2024 7:02 PM, Wesley Cheng wrote:
>>> Hi Amadeusz,
>>>
>>> On 6/13/2024 12:46 AM, Amadeusz Sławiński wrote:
>>>> On 6/12/2024 9:28 PM, Wesley Cheng wrote:
>>>>> Hi Amadeusz,
>>>>>
>>>>> On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
>>>>>> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
>>>>>>
>>>>>> (...)
>>>>>>
>>>>>>> +In the case where the USB offload driver is unbounded, while USB 
>>>>>>> SND is
>>>>>>
>>>>>> unbounded -> unbound
>>>>>>
>>>>>> (...)
>>>>>>
>>>>>>> +SOC USB and USB Sound Kcontrols
>>>>>>> +===============================
>>>>>>> +Details
>>>>>>> +-------
>>>>>>> +SOC USB and USB sound expose a set of SND kcontrols for 
>>>>>>> applications to select
>>>>>>> +and fetch the current offloading status for the ASoC platform 
>>>>>>> sound card. Kcontrols
>>>>>>> +are split between two layers:
>>>>>>> +
>>>>>>> +    - USB sound - Notifies the sound card number for the ASoC 
>>>>>>> platform sound
>>>>>>> +      card that it is registered to for supporting audio offload.
>>>>>>> +
>>>>>>> +    - SOC USB - Maintains the current status of the offload 
>>>>>>> path, and device
>>>>>>> +      (USB sound card and PCM device) information.  This would 
>>>>>>> be the main
>>>>>>> +      card that applications can read to determine offloading 
>>>>>>> capabilities.
>>>>>>> +
>>>>>>> +Implementation
>>>>>>> +--------------
>>>>>>> +
>>>>>>> +**Example:**
>>>>>>> +
>>>>>>> +  **Sound Cards**:
>>>>>>> +
>>>>>>> +    ::
>>>>>>> +
>>>>>>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>>>>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>>>>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>>>>> +                     Plantronics Plantronics C320-M at 
>>>>>>> usb-xhci-hcd.1.auto-1, full speed
>>>>>>> +
>>>>>>> +
>>>>>>> +  **Platform Sound Card** - card#0:
>>>>>>> +
>>>>>>> +    ::
>>>>>>> +
>>>>>>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>>>>>>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>>>>>>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>>>>>>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>>>>>> +
>>>>>>> +
>>>>>>> +  **USB Sound Card** - card#1:
>>>>>>> +
>>>>>>> +    ::
>>>>>>> +
>>>>>>> +      USB Offload Playback Capable Card         0 (range -1->32)
>>>>>>> +
>>>>>>> +
>>>>>>> +The platform sound card(card#0) kcontrols are created as part of 
>>>>>>> adding the SOC
>>>>>>> +USB device using **snd_soc_usb_add_port()**.  The following 
>>>>>>> kcontrols are defined
>>>>>>> +as:
>>>>>>> +
>>>>>>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB 
>>>>>>> sound card device index
>>>>>>> +    that defines which USB SND resources are currently 
>>>>>>> offloaded. If -1 is seen, it
>>>>>>> +    signifies that offload is not active.
>>>>>>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM 
>>>>>>> device index
>>>>>>> +    that defines which USB SND resources are currently 
>>>>>>> offloaded. If -1 is seen, it
>>>>>>> +    signifies that offload is not active.
>>>>>>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB 
>>>>>>> sound card index which
>>>>>>> +    selects the USB device to initiate offloading on.  If no 
>>>>>>> value is written to the
>>>>>>> +    kcontrol, then the last USB device discovered card index 
>>>>>>> will be chosen.
>>>>>>
>>>>>> I see only one kcontrol, what if hardware is capable of offloading 
>>>>>> on more cards, is it possible to do offloading on more than one 
>>>>>> device?
>>>>>>
>>>>>>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>>>>>>> index which selects
>>>>>>> +    the USB device to initiate offloading on.  If no value is 
>>>>>>> written to the
>>>>>>> +    kcontrol, then the last USB device discovered PCM zero index 
>>>>>>> will be chosen.
>>>>>>> +
>>>>>>> +The USB sound card(card#1) kcontrols are created as USB audio 
>>>>>>> devices are plugged
>>>>>>> +into the physical USB port and enumerated.  The kcontrols are 
>>>>>>> defined as:
>>>>>>> +
>>>>>>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the 
>>>>>>> sound card
>>>>>>> +    number/index that supports USB offloading.  Further/follow 
>>>>>>> up queries about
>>>>>>> +    the current offload state can be handled by reading the 
>>>>>>> offload status
>>>>>>> +    kcontrol exposed by the platform card.
>>>>>>> +
>>>>>>
>>>>>>
>>>>>> Why do we need to some magic between cards? I feel like whole 
>>>>>> kcontrol thing is overengineered a bit - I'm not sure I understand 
>>>>>> the need to do linking between cards. It would feel a lot simpler 
>>>>>> if USB card exposed one "USB Offload" kcontrol on USB card if USB 
>>>>>> controller supports offloading and allowed to set it to true/false 
>>>>>> to allow user to choose if they want to do offloading on device.
>>>>>>
>>>>>> (...)
>>>>>
>>>>> Based on feedback from Pierre, what I understood is that for some 
>>>>> applications, there won't be an order on which sound card is 
>>>>> queried/opened first.
>>>>>
>>>>
>>>> Yes if you have multiple cards, they are probed in random order.
>>>>
>>>>> So the end use case example given was if an application opened the 
>>>>> USB sound card first, it can see if there is an offload path 
>>>>> available. If there is then it can enable the offload path on the 
>>>>> corresponding card if desired.
>>>>>
>>>>
>>>> This still doesn't explain why you need to link cards using 
>>>> controls. What would not work with simple "Enable Offload" with 
>>>> true/false values on USB card that works while you do have above 
>>>> routing controls?
>>>>
>>>
>>> Sorry for the late response.
>>>
>>> I think either way, even with the "Enable Offload" kcontrol in USB 
>>> SND, we'd need a way to link these cards, because if you have 
>>> multiple USB audio devices connected, and say... your offload 
>>> mechanism only supports one stream.  Then I assume we'd still need to 
>>> way to determine if that stream can be enabled for that USB SND 
>>> device or not.
>>>
>>> Since the USB SND isn't really the entity maintaining the offload 
>>> path, I went with the decision to add that route selection to the 
>>> ASoC platform card. It would have access to all the parameters 
>>> supported by the audio DSP.
>>>
>>
>> Problem with card selection is that it will most likely work in pretty 
>> random way during reboots and similar scenarios.
>>
>> Taking from your example:
>>      USB Offload Playback Route Card Select  1 (range -1->32)
>>      USB Offload Playback Route PCM Select   0 (range -1->255)
>>      USB Offload Playback Route Card Status  -1 (range -1->32)
>>      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>
>> This tells that hw:1,0 will be offloaded USB card. What happens if 
>> after reboot the USB card and offload card change places, the control 
>> will be pointing at its owner... Another scenario to consider is that 
>> user attaches two USB cards and only first one does offload. Now what 
>> happens when they enumerate in different order after reboot (swapping 
>> places)? Taking into the account that most systems restore previous 
>> values of controls in some way - this will point at wrong card.
> 
> That sounds like a problem that would exist with current USB SND 
> implementation too?  Removing the offloading perspective, how does the 
> system ensure that the previous setting stays persistent?  For example, 
> as you mentioned, depending on which USB device enumerates first, the 
> sound card may be different so cards will be switched.
> 

It works because there is no control pointing at other card. My main 
problem is with controls which have card and pcm id of other card in it.

> I think I mentioned this previously in another discussion, but I think 
> the idea was that with the
> USB Offload Playback Capable Card
> 
> kcontrol, would allow the system to at least know there is an offload 
> capable path pointing to the ASoC platform card, and fetch more detailed 
> information about which device is selected for offloading, etc...
> 

This works only in your design, where USB Offload is backed by card, 
what happens if it is backed by something else?

>>
>> In my opinion Offload capability should be the capability of the 
>> endpoint - in this case USB card (even if in the background it needs 
>> to talk to some other device) and it should be exposed as such. 
>> Currently you are mixing capabilities of your audio card with 
>> capabilities of USB card.
>>
>> And adding more controls will not make it easy to use from end user 
>> perspective. Most users will most likely want for the devices to 
>> perform offload automatically if possible to save power and just have 
>> control to disable it in case they want to test if it works better 
>> without it in case of some problems.
> 
> I agree with you that we need to keep the controls at a minimum, but I 
> think what I have in place is fairly reasonable.  If we switch to having 
> the USB SND controlling things, we'd save maybe one control?  I think 
> keeping the offload status controls are still fairly valuable in both 
> scenarios, as userspace may need to verify which USB SND card is being 
> offloaded.
> 

It should be able to tell which one is being offloaded by examining 
which USB card has Offload control set to true.

I would assume that USB cards that cannot perform Offload have no 
control at all, as it is unneeded. And ones that can do, have Offload 
control. And ones actively being Offloaded have it set to true, 
otherwise to false.

End user has no need to know where it is offloaded. I'm not HW person, 
but I would assume that it is even unlikely that someone will design HW, 
where it is possible to Offload one endpoint to two different places, as 
this complicates things a lot, but if it were possible, from design 
perspective it would make a lot more sense to set it in Offloaded USB 
card settings, instead of some seemingly unrelated controller card 
device. And that is assuming that all solutions use some other card 
device to perform Offload.

>>
>> Additional question what happens if you want to offload two usb cards, 
>> currently the above set of controls allows you to only point at one 
>> card, will you be adding additional set of above controls dynamically 
>> for each USB card attached?
>>
> 
> It would depend on the number of offload streams that folks may be 
> supporting on their platform.  In our case we only have one available 
> stream, so applications would need to switch between the two devices 
> using the card/pcm selector.
> 
> In this case, there will be only one set of controls to select the 
> card/pcm device.  As of now (I think I'll change to to add another 
> separate set of controls per stream) if you did support multiple 
> streams, then the current card/PCM device selector would take in 
> multiple arugments. (ie for two streams the kcontrol can take in two 
> values)
> 

Then it is implementation detail of your device, and it should be 
implemented as controls in your device instead of as part of generic API.

Thanks,
Amadeusz

