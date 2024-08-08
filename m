Return-Path: <linux-arm-msm+bounces-28156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B694BDA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF3E283760
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBD518C918;
	Thu,  8 Aug 2024 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPHEBNPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB463D;
	Thu,  8 Aug 2024 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723120625; cv=none; b=SkvP1oBvf9ERND/jqSgHosLHP21J71sLlHi5clvD6iC4xxba7R6ivcbEYpL9+RhWyOW+CZDTF561V2cbP4bBDYHEBftPa4I1nD9zrI+JXKo4pGR9ywlklCpyGNzRKZaPH36E0QWpt7TYg3z+mAH/8vl2wNHszo1snmOk36nKjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723120625; c=relaxed/simple;
	bh=+1zgwuPLaGGXFLlOPK3YlsrRj/fXoTmWsgP9AuzOAh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUDqzAWfnX9SpMOM/H7U23ThOIQENjKj2iEz0fHdofTNzZqt+WwqrvDUoQgiLOwdqJalqQp6Icl9gsmcBA4QgRUbGEnfkiREBHie8kUyjDPiNgJSVtubpizLBSgcPaXOxdCkd8zK6gdGq4hSOTFdmX+qFcEFi/qHSDOaJluAfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPHEBNPN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723120624; x=1754656624;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+1zgwuPLaGGXFLlOPK3YlsrRj/fXoTmWsgP9AuzOAh0=;
  b=MPHEBNPNsi2uxwHXqznL3QW2iyk7Z1apL6N1gANbLejW9LwyAVukKw8u
   we0VFSlxSFkdL6sD0LP1w1f6E3zam/EzKVngy7n56yDKP9Zqtp2jBzHl+
   OZotDJwvQtLJEvgmGCl1mEpadKnMJt2PCfTlDXVA43OGakAWl8bnc98vg
   1fgBbTbtMsbwDC3csmsYBSBOAOgRTEqwXxUhQlZSeLY2C6EzSZ0OpPxeQ
   dnE0SXG84zXM1p0QUoUUW8p2zUoIgG2S+kcUdQIcuSKaSS6oQiwbawZnb
   7FL+1mJEMejCXhou9MCOLymlBt/cOK42f5+D+dyDUjbEGf+uGRRtiXjgQ
   w==;
X-CSE-ConnectionGUID: U7yqx5BVQL+tVDMULnfVbQ==
X-CSE-MsgGUID: gqvvtgNnREy5Q2AhhkEqIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21402085"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21402085"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:37:03 -0700
X-CSE-ConnectionGUID: DLlP2L6vSLK84RGk9nzFCA==
X-CSE-MsgGUID: UrorykPvR/mKGCuBEVdsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62054611"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.169]) ([10.245.246.169])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:36:56 -0700
Message-ID: <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
Date: Thu, 8 Aug 2024 14:36:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/8/24 14:11, Amadeusz Sławiński wrote:
> On 8/8/2024 3:19 AM, Wesley Cheng wrote:
>> Hi Amadeusz,
>>
>> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>>> With USB audio offloading, an audio session is started from the ASoC
>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>> still
>>>> readily available for use, in case the non-offload path is desired.  In
>>>> order to prevent the two entities from attempting to use the USB bus,
>>>> introduce a flag that determines when either paths are in use.
>>>>
>>>
>>> How can this happen? Can you provide some example with list of
>>> devices and which one should block the other? If I recall correctly
>>> devices are already exclusive unless you support substreams which
>>> ASoC does not at the moment.
>>>
>>  From past discussions, I think so far everyone is on board with the
>> idea of having both the USB sound card and PCM devices exist in
>> conjunction w/ the USB offload path, which is going to be done over
>> the ASoC platform card.  So for example,
>>
> 
> Sorry, I must have missed that and examples in documentation could
> probably be a bit better, it is bit late at patchset 24 that I
> understood about this now. And is part of a reason why I was confused
> about kcontrol implementation.
> 
>> / # cat /proc/asound/cards
>>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>   1 [C320M          ]: USB-Audio - Plantronics C320-M
>>                        Plantronics Plantronics C320-M at usb-xhci-
>> hcd.1.auto-1.2, full speed
>>
>> This device currently has the following sound cards within the system:
>>
>> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
>>
>> - card#1 - USB SND card: card created for interacting with the
>> connected USB device.
>>
>> So now, with USB offloading in the picture, there are basically two
>> paths that can start attempting to utilize the same USB device
>> endpoints.  Let's keep it simple and assume the device only has one
>> playback substream (which means only one PCM device)
>>
>> /proc/asound/card1 # cat stream0
>> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full
>> speed : USB Audio
>>
>> Playback:
>>    Status: Stop
>>    Interface 2
>>      Altset 1
>>      Format: S16_LE
>>      Channels: 2
>>      Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>>      Rates: 8000, 16000, 24000, 32000, 44100, 48000
>>      Bits: 16
>>      Channel map: FL FR
>>
>> So the patch here will prevent transfers from happening from both the
>> offload path and directly over the USB SND PCM device, which
>> correlates to the following paths:
>>
>> - offload: card#0 pcm#0
>>
>> - USB SND: card#1 pcm#0
> 
> Well, it's one way to do that.
> 
> Personally I would just reuse USB FEs and when opening one check if it
> can be offloaded:
> * check if someone disabled Offload on FE
> * check if it is connected to HW that can do Offload at all
> * check if Offload streams are available on backing HW
> * check if audio formats are supported by above HW
> * do any other checks that may be needed
> and then just redirect FE setup to relevant driver doing offload if
> able, otherwise just go standard path.

How would userspace know which 'USB FE' to use?

The discovery and mapping between cards and devices is the main problem.

It's much simpler to start from a generic "USB-Audio" card, and check if
the functionality exposed by one PCM device is offloaded to another
ASoC-based card. Then all the interaction can start with this offloaded
device without any guesswork on the mapping between cards/devices.

The point is that the USB-Audio card will always be there, whereas those
ASoC cards will have different names and implementation restrictions. In
the example we have here, if you want to capture audio you *have* to use
the USB-Audio card.

In other words, it's just an endianness type of debate with no clear
difference between solutions and a matter of personal preference. The
reality is that there's a clear asymmetrical pattern. The USB-Audio card
is always present and usable, the ASoC offloaded cards are only present
in specific implementations and only usable if conditions are met.




