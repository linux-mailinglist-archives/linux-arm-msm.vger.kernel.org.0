Return-Path: <linux-arm-msm+bounces-28171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEEF94C046
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 16:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A16E21F236DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC2118EFC8;
	Thu,  8 Aug 2024 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StbB78cD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E292B674;
	Thu,  8 Aug 2024 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128858; cv=none; b=KJxdEIvP6QaEjCOzEE8H7m6fW6qd4vFaIogdAexHXuk8lroAdStPQ1g4U1+C5qdibeR0h3URpuoLBrj9NyXc/zOGoPc479thHslEF7iUS2KKoZ69uuv5mIuzcm0D1KfpgzQ7RdT5OlD0u0DpiaEO6/KQ+79FHi56bcCmvZGoGes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128858; c=relaxed/simple;
	bh=r985UfwqL1h8K9aokwCyDd3V5rJtD93Nf43KfmOuQsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjsQ22HRNf1c/VovRMwLEHOOXGbOEwDtiaVRpt6xkHOm98sogaAKG99XPT2hASlV426fUCYEUAguS6w23TDdl9YzIFkFPby05L0zIxO4lSxuDpHOB07Jhw45BIDswzYTjFalPCGC0EA5gXyjqk2HJwO4xXOelvlfE6tt5OsH5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StbB78cD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723128858; x=1754664858;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r985UfwqL1h8K9aokwCyDd3V5rJtD93Nf43KfmOuQsk=;
  b=StbB78cDyGwI3l3Zg+JuJWei9kxLJIzF88h89xtNkxw8c+0UFtveJLQm
   QO6+4JcevlFXNi9aI87bW+k0uXejFDvNVM6429ECyyCU0PcmcVNbfMZ5g
   wSBySy3/yFp0v4qQlejNLqAUjqaHDpEG+9xstDilUdsHFwaY/XiRGgvRS
   3c/3hmeT1ej3PupImHdtXEQ6oHjQcmc8cp17Yd8QdHDcCjz0dgJSF97lD
   HygUizzRoaMXN+JbX4e6J6tFdJRcttCeOfSyxugdakRiqP5VW3Rwdqu7h
   CHAyoK+m+a3JoZciEitN+N60xFtyl+6zOeWBOfKMJLvH5TLuDKboWBMwk
   w==;
X-CSE-ConnectionGUID: POAV5kFsQHOi7fyEr9oiOA==
X-CSE-MsgGUID: YYEwmt0GQQOpdjIVuOXN8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21427405"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21427405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 07:54:16 -0700
X-CSE-ConnectionGUID: vAjEFa4ERGyjqZz2qHyCrg==
X-CSE-MsgGUID: IlJ73vWWTuWjDaL6uohR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57486370"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 07:54:11 -0700
Message-ID: <e5cd1a9d-0a16-4c80-b9b9-1c63b8e818cc@linux.intel.com>
Date: Thu, 8 Aug 2024 16:54:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
 <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
 <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
 <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
 <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/8/2024 2:36 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 8/8/24 14:11, Amadeusz Sławiński wrote:
>> On 8/8/2024 3:19 AM, Wesley Cheng wrote:
>>> Hi Amadeusz,
>>>
>>> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>>>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>>>> With USB audio offloading, an audio session is started from the ASoC
>>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>>> still
>>>>> readily available for use, in case the non-offload path is desired.  In
>>>>> order to prevent the two entities from attempting to use the USB bus,
>>>>> introduce a flag that determines when either paths are in use.
>>>>>
>>>>
>>>> How can this happen? Can you provide some example with list of
>>>> devices and which one should block the other? If I recall correctly
>>>> devices are already exclusive unless you support substreams which
>>>> ASoC does not at the moment.
>>>>
>>>   From past discussions, I think so far everyone is on board with the
>>> idea of having both the USB sound card and PCM devices exist in
>>> conjunction w/ the USB offload path, which is going to be done over
>>> the ASoC platform card.  So for example,
>>>
>>
>> Sorry, I must have missed that and examples in documentation could
>> probably be a bit better, it is bit late at patchset 24 that I
>> understood about this now. And is part of a reason why I was confused
>> about kcontrol implementation.
>>
>>> / # cat /proc/asound/cards
>>>    0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>                         SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>    1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>                         Plantronics Plantronics C320-M at usb-xhci-
>>> hcd.1.auto-1.2, full speed
>>>
>>> This device currently has the following sound cards within the system:
>>>
>>> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
>>>
>>> - card#1 - USB SND card: card created for interacting with the
>>> connected USB device.
>>>
>>> So now, with USB offloading in the picture, there are basically two
>>> paths that can start attempting to utilize the same USB device
>>> endpoints.  Let's keep it simple and assume the device only has one
>>> playback substream (which means only one PCM device)
>>>
>>> /proc/asound/card1 # cat stream0
>>> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full
>>> speed : USB Audio
>>>
>>> Playback:
>>>     Status: Stop
>>>     Interface 2
>>>       Altset 1
>>>       Format: S16_LE
>>>       Channels: 2
>>>       Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>>>       Rates: 8000, 16000, 24000, 32000, 44100, 48000
>>>       Bits: 16
>>>       Channel map: FL FR
>>>
>>> So the patch here will prevent transfers from happening from both the
>>> offload path and directly over the USB SND PCM device, which
>>> correlates to the following paths:
>>>
>>> - offload: card#0 pcm#0
>>>
>>> - USB SND: card#1 pcm#0
>>
>> Well, it's one way to do that.
>>
>> Personally I would just reuse USB FEs and when opening one check if it
>> can be offloaded:
>> * check if someone disabled Offload on FE
>> * check if it is connected to HW that can do Offload at all
>> * check if Offload streams are available on backing HW
>> * check if audio formats are supported by above HW
>> * do any other checks that may be needed
>> and then just redirect FE setup to relevant driver doing offload if
>> able, otherwise just go standard path.
> 
> How would userspace know which 'USB FE' to use?
> 

That's my point, the same one as it would use doing normal 
playback/capture on systems which don't have Offload.

If I attach USB Headphones, as a user my expectation would be to use 
playback FE on USB card it exposes, not to spend time setting some 
controls and telling it to use some FE from other card.

With current design there are _two_ separate FEs, on _two_ separate 
cards, which are linked by kcontrol and which block each other. I'm 
rather confused how basic userspace application knows which one to use 
in this case. (By now of course I know that it needs to read kcontrol to 
see if and where it is offloaded and then open the FE on the card, but 
in my opinion it is unnecessarily convoluted.)

> The discovery and mapping between cards and devices is the main problem.
> 

And "offloading" decision to the user/sound server/HAL doesn't help in 
my opinion.

> It's much simpler to start from a generic "USB-Audio" card, and check if
> the functionality exposed by one PCM device is offloaded to another
> ASoC-based card. Then all the interaction can start with this offloaded
> device without any guesswork on the mapping between cards/devices.
> 

That's the point, currently there needs to be some guesswork involved, 
because you need to check kcontrols to see if the endpoint can be 
offloaded and open the other FE it points at, instead of directly 
opening the one you usually would, and having it Offloaded by kernel. It 
is adding more work on userspace side, which will require special 
handling to work correctly.

> The point is that the USB-Audio card will always be there, whereas those
> ASoC cards will have different names and implementation restrictions. In
> the example we have here, if you want to capture audio you *have* to use
> the USB-Audio card.
> 

Yes and with the description above it would be just one of the checks 
after which it would decide that it can't do Offload on capture path and 
open it in standard way, I see no problem?

> In other words, it's just an endianness type of debate with no clear
> difference between solutions and a matter of personal preference. The
> reality is that there's a clear asymmetrical pattern. The USB-Audio card
> is always present and usable, the ASoC offloaded cards are only present
> in specific implementations and only usable if conditions are met.

In my opinion even if it is specific use case, there is no reason to 
make it more complicated than it needs to be. From my point of view 
problem with current design is that instead of being mostly transparent 
to userspace (when it could be), it adds more work for it.


