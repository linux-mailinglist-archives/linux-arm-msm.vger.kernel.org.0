Return-Path: <linux-arm-msm+bounces-28154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE194BD0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E62328968F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 12:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F41C18C925;
	Thu,  8 Aug 2024 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jU/Y+lvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73318C900;
	Thu,  8 Aug 2024 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723119078; cv=none; b=BIwX0qz3PrXkYgCWgaybGU8qu5noB86+bIwtaIEOwqY5lSzQRz6Do+Nw9hU7io6oufIjyyIpYqW81Yx1UEN67Xnnc4Q8TEYuIXkAFQFLu6ntDiJuYHeUi9nV1+1QJt7lj+gBkfEeCf73KzfYg2x+svPHQIGcnoC3HBDPGybdz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723119078; c=relaxed/simple;
	bh=ypoxP7jDf7LjMLCC24x01FzK9fJ/WozB7SR4D4u7jHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqSP0hQOywUMaWE+rJWHAM2qrmbUGcqUr3C52uysxin+lm7fWX6JH56p+fhusvaYKg9/wg0zf/t8XKH+OU2h7q2MAFry1V5ywjpOqx4NlbC9mfl/Q/1I4onqtEDW9N/ZZoDe2HUwldRttSwK+T/vRtELSe4fhGX+t1rLgwDX9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jU/Y+lvJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723119076; x=1754655076;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ypoxP7jDf7LjMLCC24x01FzK9fJ/WozB7SR4D4u7jHA=;
  b=jU/Y+lvJ2YhlE6TvidaFUp/2r7EBbkDMFTi1wZXzK/qWiK2wmH8ihnd2
   QSMUXWZo9uWoyrwhQS0Bn8ijADHkFXE+IeWl4AW4n+UqGobMkGu4FVZz6
   Fp1H64bEZwr5IjArdwNeoAJaoCXzLbkGSzY2QgckA2sobGTKMBfBGHZ9n
   Irha+KBsw+cR8nxwnmQdg+fT8aL4lm1x/p6j+uM9YLZ9StGFEYAcrcLzw
   lr29H5ZWp1E2ExZqaIBc/IkIqYt7aq9L86OuQw4UquKfU/WlqMj76m7uR
   Qd1hfIR+Ux+T1k3KsjR9IYFpRmfJXEMr7KngOiLcuUkSLi6XB1wGEAgfd
   g==;
X-CSE-ConnectionGUID: ly/b8TY3TR2xxEe9YpgxEA==
X-CSE-MsgGUID: /aaj+ctIQEukYHStwkuzuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20901289"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="20901289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:11:15 -0700
X-CSE-ConnectionGUID: TmdFroz0QU6FXsOr/pvTEg==
X-CSE-MsgGUID: D7BmpyGfTAuI8ysmCatVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="62149825"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:11:11 -0700
Message-ID: <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
Date: Thu, 8 Aug 2024 14:11:07 +0200
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
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
 <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
 <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/8/2024 3:19 AM, Wesley Cheng wrote:
> Hi Amadeusz,
> 
> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>> With USB audio offloading, an audio session is started from the ASoC
>>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>>> readily available for use, in case the non-offload path is desired.  In
>>> order to prevent the two entities from attempting to use the USB bus,
>>> introduce a flag that determines when either paths are in use.
>>>
>>
>> How can this happen? Can you provide some example with list of devices and which one should block the other? If I recall correctly devices are already exclusive unless you support substreams which ASoC does not at the moment.
>>
>  From past discussions, I think so far everyone is on board with the idea of having both the USB sound card and PCM devices exist in conjunction w/ the USB offload path, which is going to be done over the ASoC platform card.  So for example,
> 

Sorry, I must have missed that and examples in documentation could 
probably be a bit better, it is bit late at patchset 24 that I 
understood about this now. And is part of a reason why I was confused 
about kcontrol implementation.

> / # cat /proc/asound/cards
>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>   1 [C320M          ]: USB-Audio - Plantronics C320-M
>                        Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> 
> This device currently has the following sound cards within the system:
> 
> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
> 
> - card#1 - USB SND card: card created for interacting with the connected USB device.
> 
> So now, with USB offloading in the picture, there are basically two paths that can start attempting to utilize the same USB device endpoints.  Let's keep it simple and assume the device only has one playback substream (which means only one PCM device)
> 
> /proc/asound/card1 # cat stream0
> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed : USB Audio
> 
> Playback:
>    Status: Stop
>    Interface 2
>      Altset 1
>      Format: S16_LE
>      Channels: 2
>      Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>      Rates: 8000, 16000, 24000, 32000, 44100, 48000
>      Bits: 16
>      Channel map: FL FR
> 
> So the patch here will prevent transfers from happening from both the offload path and directly over the USB SND PCM device, which correlates to the following paths:
> 
> - offload: card#0 pcm#0
> 
> - USB SND: card#1 pcm#0

Well, it's one way to do that.

Personally I would just reuse USB FEs and when opening one check if it 
can be offloaded:
* check if someone disabled Offload on FE
* check if it is connected to HW that can do Offload at all
* check if Offload streams are available on backing HW
* check if audio formats are supported by above HW
* do any other checks that may be needed
and then just redirect FE setup to relevant driver doing offload if 
able, otherwise just go standard path.


As I've wrote I must have missed the discussion where it was agreed on 
and if maintainers agree that it can be done this way, I won't fight it. 
Even though I would consider my way a lot simpler and user friendly from 
end user point of view.

Thanks,
Amadeusz

