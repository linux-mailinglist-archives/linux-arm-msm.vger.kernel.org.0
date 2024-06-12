Return-Path: <linux-arm-msm+bounces-22448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D299055A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B4E1F212C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47E017F36C;
	Wed, 12 Jun 2024 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grGqWBkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C21E504;
	Wed, 12 Jun 2024 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203664; cv=none; b=SLO86olC37nGUwDl4inOE7HqfzNhey+H//p7Krv8eQyXnA5OYRnTqV3vBfB67WffvaF//3cNFnk6zYmdv82e+aNDMrGf0iSOOX9xRFLAHulnQwS67/llMjNsXfx/nHow5gXfRWMR1Vw+X6idJ7uY9S8ZBtsOejJfCdktVckCP9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203664; c=relaxed/simple;
	bh=afYKfX5WiT24a7vRcOHvX/frxR+u+IAFVv0AQdtNlWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzzHYRp813k/cuM3XLTZw3zt5OE3fK8MTEwH5iujQjQJq9LK2go/h+fjsS7+kCkPYyD4D62Q6/5iF0obty8uLuIM4D7Eoryy+zgEkRy++VPioCh5pOITz2uBaDOmSe2koPzZEJcNFZsGWD6G/aowTXHg4xbaYBalLSr5SI4sbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grGqWBkB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718203663; x=1749739663;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=afYKfX5WiT24a7vRcOHvX/frxR+u+IAFVv0AQdtNlWs=;
  b=grGqWBkBrKX6Msb/pvvAOHn2rH4uV6Qb4CJO1tFzD+6GU18XlXSAXUWd
   oAqBUpmV20lrCMDqbIW7gf+JUeJ5efRIYEFlpa4/rBRMVhb6PuVMrhq6i
   3jR2/G2RcbpqfaxoniGJoeOKy31B4d+8uYv+V9mpLABrfVd5ZUj+COHm0
   tx21xtLqs5F23FhWS5j2q5bRfjp/nalZL/xLjNyVzTgTYDwbVr0VdjN0U
   /BtxqqgXrSKRknC/Y55XC2nGOzAHqTQYVQ0q+FeTnLOBjLMiQcAJ+B/SR
   p+MKvpLnPW+5Oto47i9YhHk/FXrg3HXpCXRFkmh2cL5iLZ4/YdW15U2QG
   g==;
X-CSE-ConnectionGUID: jWqhhuq5RhGZ7B+MzB90kg==
X-CSE-MsgGUID: O1xhuSP7TYm6zrnXWMr0HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14846470"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14846470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:47:41 -0700
X-CSE-ConnectionGUID: lXJttGFaTCK21oTjZ4kGZw==
X-CSE-MsgGUID: iGl843MOR66bAy93XUaE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44375086"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:47:36 -0700
Message-ID: <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
Date: Wed, 12 Jun 2024 16:47:34 +0200
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240610235808.22173-33-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/2024 1:58 AM, Wesley Cheng wrote:

(...)

> +In the case where the USB offload driver is unbounded, while USB SND is

unbounded -> unbound

(...)

> +SOC USB and USB Sound Kcontrols
> +===============================
> +Details
> +-------
> +SOC USB and USB sound expose a set of SND kcontrols for applications to select
> +and fetch the current offloading status for the ASoC platform sound card. Kcontrols
> +are split between two layers:
> +
> +	- USB sound - Notifies the sound card number for the ASoC platform sound
> +	  card that it is registered to for supporting audio offload.
> +
> +	- SOC USB - Maintains the current status of the offload path, and device
> +	  (USB sound card and PCM device) information.  This would be the main
> +	  card that applications can read to determine offloading capabilities.
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
> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [C320M          ]: USB-Audio - Plantronics C320-M
> +                     Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1, full speed
> +
> +
> +  **Platform Sound Card** - card#0:
> +
> +	::
> +
> +	  USB Offload Playback Route Card Select  1 (range -1->32)
> +	  USB Offload Playback Route PCM Select   0 (range -1->255)
> +	  USB Offload Playback Route Card Status  -1 (range -1->32)
> +	  USB Offload Playback Route PCM Status   -1 (range -1->255)
> +
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Capable Card         0 (range -1->32)
> +
> +
> +The platform sound card(card#0) kcontrols are created as part of adding the SOC
> +USB device using **snd_soc_usb_add_port()**.  The following kcontrols are defined
> +as:
> +
> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound card device index
> +    that defines which USB SND resources are currently offloaded.  If -1 is seen, it
> +    signifies that offload is not active.
> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM device index
> +    that defines which USB SND resources are currently offloaded.  If -1 is seen, it
> +    signifies that offload is not active.
> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB sound card index which
> +    selects the USB device to initiate offloading on.  If no value is written to the
> +    kcontrol, then the last USB device discovered card index will be chosen.

I see only one kcontrol, what if hardware is capable of offloading on 
more cards, is it possible to do offloading on more than one device?

> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM index which selects
> +    the USB device to initiate offloading on.  If no value is written to the
> +    kcontrol, then the last USB device discovered PCM zero index will be chosen.
> +
> +The USB sound card(card#1) kcontrols are created as USB audio devices are plugged
> +into the physical USB port and enumerated.  The kcontrols are defined as:
> +
> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the sound card
> +    number/index that supports USB offloading.  Further/follow up queries about
> +    the current offload state can be handled by reading the offload status
> +    kcontrol exposed by the platform card.
> +


Why do we need to some magic between cards? I feel like whole kcontrol 
thing is overengineered a bit - I'm not sure I understand the need to do 
linking between cards. It would feel a lot simpler if USB card exposed 
one "USB Offload" kcontrol on USB card if USB controller supports 
offloading and allowed to set it to true/false to allow user to choose 
if they want to do offloading on device.

(...)
> +Mixer Examples
> +--------------
> +
> +	::
> +
> +	  tinymix -D 0 set 'USB Offload Playback Route Card Select' 2
> +	  tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0
> +
> +
> +	::
> +
> +	  tinymix -D 0 get 'USB Offload Playback Route Card Select'
> +	  --> 2 (range -1->32)
> +	  tinymix -D 0 get 'USB Offload Playback Route PCM Select'
> +	  --> 0 (range -1->255)
> +
> +	::
> +
> +	  tinymix -D 0 get 'USB Offload Playback Route Card Status'
> +	  --> 2 (range -1->32)   [OFFLD active]
> +	  --> -1 (range -1->32) [OFFLD idle]
> +	  tinymix -D 0 get 'USB Offload Playback Route PCM Status'
> +	  --> 0 (range -1->255)   [OFFLD active]
> +	  --> -1 (range -1->255) [OFFLD idle]
> +
> +	::
> +
> +	  tinymix -D 1 get 'USB Offload Playback Capable Card'
> +	  --> 0 (range -1->32)
> 

Yes, looking at examples again, I'm still not sure I understand. There 
are two cards and you do linking between them, this feels broken by 
design. From my point of view USB Offload should be property of USB card 
and not involve any other card in a system.


