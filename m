Return-Path: <linux-arm-msm+bounces-28004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0219493D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 16:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B061F2764B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 14:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2378120010D;
	Tue,  6 Aug 2024 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPZXl4qQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3561D47D4;
	Tue,  6 Aug 2024 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955929; cv=none; b=bxVBy6CBjGa7a4hXiUCzQEDUUVJlObkspv5u7CUi1hSlWgOKYDwJCB6hh/GI/0hpGhANzxa+uLjPsDneQgtLcmSYGeuIgBEx1DWtRnG8+C2du/i10PuoqBq5jAYAJBDJ8j59/URws8IyDCFeo6+StmBZ1+X67QIPT1uNqKTpw98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955929; c=relaxed/simple;
	bh=7fGp4iTGKumpsOqbZPBC+cJ99owLh5xAt61X67NylpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPbnWsdIKDcRza7eQ3rd2VPx1bblR+E6N1osTrELA83D87sRkjESjwjKHjQEcolqk4K2rMIh0fNnEHkDTPSpD/BOr1LqGNG0RzQktPZdlRA+uuNCPk6fmtd+hweWwHFcNisnwDDrKS/Snw5ZMgDradvXvvFxr/LIYFjjBtQgRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPZXl4qQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955928; x=1754491928;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7fGp4iTGKumpsOqbZPBC+cJ99owLh5xAt61X67NylpQ=;
  b=UPZXl4qQlLneq1zWXYiQFMB1/f9tB9s866jek/Jn+BsJRq5dX6j19W6h
   71fb4tjS4Rvjrc7X1KJy8zvEbrKx7YSirowlp4GTS8L0O7X3Fprntt1Uu
   ZmTEksNSQ9SgRi3mablCpDl7UZgXL7zryxJ8Yr3wIqIFS8NuQYGh8rnUv
   7IZQxuekms8FxdKiYckXzk3BdNkqQuFWgeEZLzERgwPlNbRuRNShu8+WK
   YOHXqHvDvkP70EM/z584/nuC5cQt3Vk/wPMfNiMUy9CCWnkMON0jZkCYU
   00M40ClNrLK8mm6wsFMlygnA/1TYV5sfeSROCvuen3ht7lrsH71V70KH3
   w==;
X-CSE-ConnectionGUID: p/IcABjdQIS4BKD0/XuDxg==
X-CSE-MsgGUID: 13V1RUo/T8mCm8HW3HW6Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101994"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21101994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:51:48 -0700
X-CSE-ConnectionGUID: CYOwO9ASSIW+5Vg8zuCwVQ==
X-CSE-MsgGUID: AoaYNMTNSkOzX+xnnSusDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87476697"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:51:43 -0700
Message-ID: <1a93dbae-6fba-4f07-a732-51a4cd98ff2a@linux.intel.com>
Date: Tue, 6 Aug 2024 16:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
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
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> With the introduction of the soc-usb driver, add documentation highlighting
> details on how to utilize the new driver and how it interacts with
> different components in USB SND and ASoC.  It provides examples on how to
> implement the drivers that will need to be introduced in order to enable
> USB audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

(...)

> +
> +One potential use case would be to support USB audio offloading, which is
> +an implementation that allows for an external DSP on the SoC to handle the
> +transfer of audio data over the USB bus.  This would let the main
> +processor to stay in lower power modes for longer durations.  The following

*duration

(...)

> +
> +In order to account for conditions where driver or device existence is
> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
> +connect events for any identified USB audio interfaces.  Consider the
> +the following situtation:

*situation

> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.

At the moment I only see getter below, how does application set it?

> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
> +						Plantronics Plantronics Blackwire 3225 Seri at usb-xhci-hcd.1.auto-1.1, full sp
> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +  **USB Sound Card** - card#2:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> +
> +The above example shows a scenario where the system has one ASoC platform card
> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
> +the available kcontrols for each USB audio device, the following kcontrol lists
> +the mapped offload path for the specific device:
> +
> +	"USB Offload Playback Route#*"
> +
> +The kcontrol is indexed, because a USB audio device could potentially have
> +several PCM devices.  The above kcontrols are defined as:
> +
> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
> +	card and PCM device index.  The output "0, 1" (card index, PCM device index)
> +	signifies that there is an available offload path for the USB SND device
> +	through card#0-PCM device#1.  If "-1, -1" is seen, then no offload path is
> +	available for the USB SND device.
> +

That's better, although I'm still not convinced end users care where 
offload happens.

Few questions though, so I'm sure I understand how it works:
Does "0, 1" in this case means that if you try to open device 1 on card 
0, you won't be able to do it, because it is offloading USB?

In case it is "-1, -1" is there a chance that it can change?



