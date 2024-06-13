Return-Path: <linux-arm-msm+bounces-22552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AF906586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 09:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8927B21241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 07:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B6A136660;
	Thu, 13 Jun 2024 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksBQEiMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8612C53D;
	Thu, 13 Jun 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264772; cv=none; b=FZbnxcOw5mbKytMb2c4ydEwn+nM9obc5U20WUHQGWnBdmVFZK0+jcTdW4cfEzLOyC7iCQbnKSW16LFuK7GyXML23UV2KM3z5famEseSsOOE8wVWH9TiaiHpbhzVHuzbyUDpa5tCzqHEc2IY3JbfNW5TWeFMH9oaWn3aH9hIpyh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264772; c=relaxed/simple;
	bh=SWhtuMvx4uGhi/2J1+eQKjWpE4vQF+jCSZC4acIXW4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgFbWilGJY76HqJ1Xs4XQsad5B16RHWsJJqwx3kF4IhEFoElqCAPGRTW/6zCqqy7qdzzYcuAcWze1kLo87rBQGH8ZZPw0E5MjTlZBlbpo7w4JWYflcE5Yw2cz4fnZKTAmQ9gd6WMBFd4xSmdti9OCOUVbCMGPdCVuEK64tMhJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksBQEiMU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718264771; x=1749800771;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SWhtuMvx4uGhi/2J1+eQKjWpE4vQF+jCSZC4acIXW4M=;
  b=ksBQEiMU6ObEeJUh1KTfgWEMaecgtqhaXA2V7S2Hl+cixsk8uITos3nL
   gQ71+0rVpfu6OOSpclJrWToX9lq6Seo7PGIQ7KqFF8IqhRhJIh/j98EyH
   lJw9LNlW9DDFpFZUjfxqctzHMEN3bOPTqP5PqrZbu5VtiAh67/+L4fyyr
   rxD00PGw17hRHjmNJkD6I6iWORqfbCdGAF2IQ+2LJ1oyeXb61AXFv3x+b
   KTgESQGtBumiPoUaHBghz0C9glyMnIt2h/vbZty90256HyNzbPzCbMgZg
   J7OK533FtBJfunvKJGh+xMFoEp6JNXssw3TehTq0rVx8EDN1qguPAsF9a
   Q==;
X-CSE-ConnectionGUID: ej8fp6anS6S6gypilpwu/g==
X-CSE-MsgGUID: VPTleWmCTLiW+S8pkVZewA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32555152"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="32555152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:46:10 -0700
X-CSE-ConnectionGUID: G7+f6gn+QjydAvijR9Jdfg==
X-CSE-MsgGUID: I60iyNO4Qg2NYql1SQsh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="71264693"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:46:04 -0700
Message-ID: <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
Date: Thu, 13 Jun 2024 09:46:02 +0200
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/2024 9:28 PM, Wesley Cheng wrote:
> Hi Amadeusz,
> 
> On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
>> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
>>
>> (...)
>>
>>> +In the case where the USB offload driver is unbounded, while USB SND is
>>
>> unbounded -> unbound
>>
>> (...)
>>
>>> +SOC USB and USB Sound Kcontrols
>>> +===============================
>>> +Details
>>> +-------
>>> +SOC USB and USB sound expose a set of SND kcontrols for applications 
>>> to select
>>> +and fetch the current offloading status for the ASoC platform sound 
>>> card. Kcontrols
>>> +are split between two layers:
>>> +
>>> +    - USB sound - Notifies the sound card number for the ASoC 
>>> platform sound
>>> +      card that it is registered to for supporting audio offload.
>>> +
>>> +    - SOC USB - Maintains the current status of the offload path, 
>>> and device
>>> +      (USB sound card and PCM device) information.  This would be 
>>> the main
>>> +      card that applications can read to determine offloading 
>>> capabilities.
>>> +
>>> +Implementation
>>> +--------------
>>> +
>>> +**Example:**
>>> +
>>> +  **Sound Cards**:
>>> +
>>> +    ::
>>> +
>>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>>> +                     Plantronics Plantronics C320-M at 
>>> usb-xhci-hcd.1.auto-1, full speed
>>> +
>>> +
>>> +  **Platform Sound Card** - card#0:
>>> +
>>> +    ::
>>> +
>>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>> +
>>> +
>>> +  **USB Sound Card** - card#1:
>>> +
>>> +    ::
>>> +
>>> +      USB Offload Playback Capable Card         0 (range -1->32)
>>> +
>>> +
>>> +The platform sound card(card#0) kcontrols are created as part of 
>>> adding the SOC
>>> +USB device using **snd_soc_usb_add_port()**.  The following 
>>> kcontrols are defined
>>> +as:
>>> +
>>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound 
>>> card device index
>>> +    that defines which USB SND resources are currently offloaded.  
>>> If -1 is seen, it
>>> +    signifies that offload is not active.
>>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM 
>>> device index
>>> +    that defines which USB SND resources are currently offloaded.  
>>> If -1 is seen, it
>>> +    signifies that offload is not active.
>>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB sound 
>>> card index which
>>> +    selects the USB device to initiate offloading on.  If no value 
>>> is written to the
>>> +    kcontrol, then the last USB device discovered card index will be 
>>> chosen.
>>
>> I see only one kcontrol, what if hardware is capable of offloading on 
>> more cards, is it possible to do offloading on more than one device?
>>
>>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>>> index which selects
>>> +    the USB device to initiate offloading on.  If no value is 
>>> written to the
>>> +    kcontrol, then the last USB device discovered PCM zero index 
>>> will be chosen.
>>> +
>>> +The USB sound card(card#1) kcontrols are created as USB audio 
>>> devices are plugged
>>> +into the physical USB port and enumerated.  The kcontrols are 
>>> defined as:
>>> +
>>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the 
>>> sound card
>>> +    number/index that supports USB offloading.  Further/follow up 
>>> queries about
>>> +    the current offload state can be handled by reading the offload 
>>> status
>>> +    kcontrol exposed by the platform card.
>>> +
>>
>>
>> Why do we need to some magic between cards? I feel like whole kcontrol 
>> thing is overengineered a bit - I'm not sure I understand the need to 
>> do linking between cards. It would feel a lot simpler if USB card 
>> exposed one "USB Offload" kcontrol on USB card if USB controller 
>> supports offloading and allowed to set it to true/false to allow user 
>> to choose if they want to do offloading on device.
>>
>> (...)
> 
> Based on feedback from Pierre, what I understood is that for some 
> applications, there won't be an order on which sound card is 
> queried/opened first.
> 

Yes if you have multiple cards, they are probed in random order.

> So the end use case example given was if an application opened the USB 
> sound card first, it can see if there is an offload path available.  If 
> there is then it can enable the offload path on the corresponding card 
> if desired.
> 

This still doesn't explain why you need to link cards using controls. 
What would not work with simple "Enable Offload" with true/false values 
on USB card that works while you do have above routing controls?

>>> +Mixer Examples
>>> +--------------
>>> +
>>> +    ::
>>> +
>>> +      tinymix -D 0 set 'USB Offload Playback Route Card Select' 2
>>> +      tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0
>>> +
>>> +
>>> +    ::
>>> +
>>> +      tinymix -D 0 get 'USB Offload Playback Route Card Select'
>>> +      --> 2 (range -1->32)
>>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Select'
>>> +      --> 0 (range -1->255)
>>> +
>>> +    ::
>>> +
>>> +      tinymix -D 0 get 'USB Offload Playback Route Card Status'
>>> +      --> 2 (range -1->32)   [OFFLD active]
>>> +      --> -1 (range -1->32) [OFFLD idle]
>>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Status'
>>> +      --> 0 (range -1->255)   [OFFLD active]
>>> +      --> -1 (range -1->255) [OFFLD idle]
>>> +
>>> +    ::
>>> +
>>> +      tinymix -D 1 get 'USB Offload Playback Capable Card'
>>> +      --> 0 (range -1->32)
>>>
>>
>> Yes, looking at examples again, I'm still not sure I understand. There 
>> are two cards and you do linking between them, this feels broken by 
>> design. From my point of view USB Offload should be property of USB 
>> card and not involve any other card in a system.
>>
> 
> Main benefit to having two cards (keeping one for USB SND and another 
> for the ASoC platform sound card) is that current applications won't 
> break.  The behavior is the same, in that if something opens the USB 
> sound card, it will go through the same non-offloaded path.  During 
> initial reviews, I think this was a big point where folks wanted the USB 
> PCM path to still be an option.
> 

I'm not against having two cards, in fact I hope that USB card looks and 
behaves the same as before this patch set, with only difference being 
controls for enabling offload.

> If applications want to add the offload capabilities to its environment, 
> they can enable it as an additional feature.

That sounds fine to me.


