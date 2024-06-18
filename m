Return-Path: <linux-arm-msm+bounces-23004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03EB90CAA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4596B1F24016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA7315884E;
	Tue, 18 Jun 2024 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FClrha6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D41586CB;
	Tue, 18 Jun 2024 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710960; cv=none; b=CEwqQGR8KjllZ7T6ULaQupovEaEKWcgmvKcVoOpH/jRC4/FWSCHvTDlgS7oPGrMy2b2xzUKxRd0IEvEkqQqYhWGBFkfvVuGVsP4Td/5uH5JZizL1VG/ekw8ivSQm6gUjbwB89NpedZhBjodfROT9jrSvwkVZGBqNAxFDUqt0LDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710960; c=relaxed/simple;
	bh=dDKTgnLm+N281vSSFTHzSq75lnFe+4k7JxhpN8X4oKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqpocdSHrFWVLb0U9f3JDE7wIdRppwiP4XuASYTwZd7HFpdQDViETd1U6oATKkqUKT6IWrg2ZP+HODBH6gUgU2XwTGrczkkRQ5cKC7CDGPqPml8lAqG4gb1Sctrxx5Yzzo2zV7T4ZpH92GzzEjj5pYyMijF+4imzisopKOx+4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FClrha6C; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718710959; x=1750246959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dDKTgnLm+N281vSSFTHzSq75lnFe+4k7JxhpN8X4oKo=;
  b=FClrha6CFM36w+ApFMP+FjHQpzUWIlrOK8WJcFjjfmlTWkpJTKpB7KKj
   2heM8dAY9kv6deQDa3uU9lk+S40JLAJQm21RxN/uyyuzZRW6nuMrq9KC6
   1fFknGIBN3+o08bmLbK4AvSFBToKfTq75TsKBwHM7U+iwUAT9mfxgimrW
   Lu5EJlGQBr74N/R21fIMqbDJrghr7hq+UBFUFaZR2n/KEBzsa+ePeufz8
   FHIaxNolE8MO+dZKOZFs0BpufQA8guD0FiDvEnSX3esI+/SXUCUUmB6hM
   dyY0wQFtrtq5FknkxrbiDIhPfUFNbZLgHxZtXMRgGDBu5suDD5J8UsY8Z
   w==;
X-CSE-ConnectionGUID: EEi+o1MmQcqHo0cS8ljPLQ==
X-CSE-MsgGUID: FWlG2G8nSH6x3tXANTSJNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15546083"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15546083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 04:42:38 -0700
X-CSE-ConnectionGUID: naqY52RKQzar7h6NTEFyxg==
X-CSE-MsgGUID: UiMpxHGHRu2SSybArf/dWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="46064373"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 04:42:33 -0700
Message-ID: <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
Date: Tue, 18 Jun 2024 13:42:30 +0200
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/17/2024 7:02 PM, Wesley Cheng wrote:
> Hi Amadeusz,
> 
> On 6/13/2024 12:46 AM, Amadeusz Sławiński wrote:
>> On 6/12/2024 9:28 PM, Wesley Cheng wrote:
>>> Hi Amadeusz,
>>>
>>> On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
>>>> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
>>>>
>>>> (...)
>>>>
>>>>> +In the case where the USB offload driver is unbounded, while USB 
>>>>> SND is
>>>>
>>>> unbounded -> unbound
>>>>
>>>> (...)
>>>>
>>>>> +SOC USB and USB Sound Kcontrols
>>>>> +===============================
>>>>> +Details
>>>>> +-------
>>>>> +SOC USB and USB sound expose a set of SND kcontrols for 
>>>>> applications to select
>>>>> +and fetch the current offloading status for the ASoC platform 
>>>>> sound card. Kcontrols
>>>>> +are split between two layers:
>>>>> +
>>>>> +    - USB sound - Notifies the sound card number for the ASoC 
>>>>> platform sound
>>>>> +      card that it is registered to for supporting audio offload.
>>>>> +
>>>>> +    - SOC USB - Maintains the current status of the offload path, 
>>>>> and device
>>>>> +      (USB sound card and PCM device) information.  This would be 
>>>>> the main
>>>>> +      card that applications can read to determine offloading 
>>>>> capabilities.
>>>>> +
>>>>> +Implementation
>>>>> +--------------
>>>>> +
>>>>> +**Example:**
>>>>> +
>>>>> +  **Sound Cards**:
>>>>> +
>>>>> +    ::
>>>>> +
>>>>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>>> +                     Plantronics Plantronics C320-M at 
>>>>> usb-xhci-hcd.1.auto-1, full speed
>>>>> +
>>>>> +
>>>>> +  **Platform Sound Card** - card#0:
>>>>> +
>>>>> +    ::
>>>>> +
>>>>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>>>>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>>>>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>>>>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>>>> +
>>>>> +
>>>>> +  **USB Sound Card** - card#1:
>>>>> +
>>>>> +    ::
>>>>> +
>>>>> +      USB Offload Playback Capable Card         0 (range -1->32)
>>>>> +
>>>>> +
>>>>> +The platform sound card(card#0) kcontrols are created as part of 
>>>>> adding the SOC
>>>>> +USB device using **snd_soc_usb_add_port()**.  The following 
>>>>> kcontrols are defined
>>>>> +as:
>>>>> +
>>>>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound 
>>>>> card device index
>>>>> +    that defines which USB SND resources are currently offloaded. 
>>>>> If -1 is seen, it
>>>>> +    signifies that offload is not active.
>>>>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM 
>>>>> device index
>>>>> +    that defines which USB SND resources are currently offloaded. 
>>>>> If -1 is seen, it
>>>>> +    signifies that offload is not active.
>>>>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB 
>>>>> sound card index which
>>>>> +    selects the USB device to initiate offloading on.  If no value 
>>>>> is written to the
>>>>> +    kcontrol, then the last USB device discovered card index will 
>>>>> be chosen.
>>>>
>>>> I see only one kcontrol, what if hardware is capable of offloading 
>>>> on more cards, is it possible to do offloading on more than one device?
>>>>
>>>>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>>>>> index which selects
>>>>> +    the USB device to initiate offloading on.  If no value is 
>>>>> written to the
>>>>> +    kcontrol, then the last USB device discovered PCM zero index 
>>>>> will be chosen.
>>>>> +
>>>>> +The USB sound card(card#1) kcontrols are created as USB audio 
>>>>> devices are plugged
>>>>> +into the physical USB port and enumerated.  The kcontrols are 
>>>>> defined as:
>>>>> +
>>>>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the 
>>>>> sound card
>>>>> +    number/index that supports USB offloading.  Further/follow up 
>>>>> queries about
>>>>> +    the current offload state can be handled by reading the 
>>>>> offload status
>>>>> +    kcontrol exposed by the platform card.
>>>>> +
>>>>
>>>>
>>>> Why do we need to some magic between cards? I feel like whole 
>>>> kcontrol thing is overengineered a bit - I'm not sure I understand 
>>>> the need to do linking between cards. It would feel a lot simpler if 
>>>> USB card exposed one "USB Offload" kcontrol on USB card if USB 
>>>> controller supports offloading and allowed to set it to true/false 
>>>> to allow user to choose if they want to do offloading on device.
>>>>
>>>> (...)
>>>
>>> Based on feedback from Pierre, what I understood is that for some 
>>> applications, there won't be an order on which sound card is 
>>> queried/opened first.
>>>
>>
>> Yes if you have multiple cards, they are probed in random order.
>>
>>> So the end use case example given was if an application opened the 
>>> USB sound card first, it can see if there is an offload path 
>>> available. If there is then it can enable the offload path on the 
>>> corresponding card if desired.
>>>
>>
>> This still doesn't explain why you need to link cards using controls. 
>> What would not work with simple "Enable Offload" with true/false 
>> values on USB card that works while you do have above routing controls?
>>
> 
> Sorry for the late response.
> 
> I think either way, even with the "Enable Offload" kcontrol in USB SND, 
> we'd need a way to link these cards, because if you have multiple USB 
> audio devices connected, and say... your offload mechanism only supports 
> one stream.  Then I assume we'd still need to way to determine if that 
> stream can be enabled for that USB SND device or not.
> 
> Since the USB SND isn't really the entity maintaining the offload path, 
> I went with the decision to add that route selection to the ASoC 
> platform card. It would have access to all the parameters supported by 
> the audio DSP.
> 

Problem with card selection is that it will most likely work in pretty 
random way during reboots and similar scenarios.

Taking from your example:
	USB Offload Playback Route Card Select  1 (range -1->32)
	USB Offload Playback Route PCM Select   0 (range -1->255)
	USB Offload Playback Route Card Status  -1 (range -1->32)
	USB Offload Playback Route PCM Status   -1 (range -1->255)

This tells that hw:1,0 will be offloaded USB card. What happens if after 
reboot the USB card and offload card change places, the control will be 
pointing at its owner... Another scenario to consider is that user 
attaches two USB cards and only first one does offload. Now what happens 
when they enumerate in different order after reboot (swapping places)? 
Taking into the account that most systems restore previous values of 
controls in some way - this will point at wrong card.

In my opinion Offload capability should be the capability of the 
endpoint - in this case USB card (even if in the background it needs to 
talk to some other device) and it should be exposed as such. Currently 
you are mixing capabilities of your audio card with capabilities of USB 
card.

And adding more controls will not make it easy to use from end user 
perspective. Most users will most likely want for the devices to perform 
offload automatically if possible to save power and just have control to 
disable it in case they want to test if it works better without it in 
case of some problems.

Additional question what happens if you want to offload two usb cards, 
currently the above set of controls allows you to only point at one 
card, will you be adding additional set of above controls dynamically 
for each USB card attached?

Thanks,
Amadeusz

