Return-Path: <linux-arm-msm+bounces-27705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A990E94479F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAED61C21B71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF32184559;
	Thu,  1 Aug 2024 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gnr0dSXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE86B1741FA;
	Thu,  1 Aug 2024 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503521; cv=none; b=R6joXZjS4VkpDOHTR7SSyC+eb0xl5i2c0mnVKIjpatii4yA+pbtgZjiehuowsqPpFNS9IAok2Y+xdO0/WLCC4twySdO9JSmF0Eqh6/MUldJ5QcUd5aCEyjPQ7omoTroEUL+I5z3CU8YSfh2LtXUrPlW8beN3qHXYEfMahX2klng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503521; c=relaxed/simple;
	bh=5p1oyYO6u1shRaRU1kQj5x9fnU5Q6DlYMq5LOgbkvZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGRLo+RiuLXCtSFNRmo5USXFaAa0QyDt77vCrujwwbRXaiNlc7tfDnR0F/R8abg4WYO/ap7fX79GkbdTVVmvRDnzQnQpWjID1d5EQNNsPVKfe/jzGkJQ7EdjV/arlHqTKwvUhJl3yZVyuXM70zfln6EsTBYBVxzlDuVOgKM7B0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gnr0dSXO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503521; x=1754039521;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5p1oyYO6u1shRaRU1kQj5x9fnU5Q6DlYMq5LOgbkvZo=;
  b=Gnr0dSXOAqYsV7fyemXJ2zoVid8R/K0ziBJQe0b/oWs5279qmyJREkv8
   9Q2UZBBFCeqpjUVoQ3Uu0A+TXoCBPe8LmOtDMyzCtddFx5VUPYO5dmwOq
   vdV8xUIt24PFWxvzs13nt0z4bCOR6yXUsT2vVz9HA/++aEW0sC3KaL5/k
   F+reCRhdGVtEBqrn9SYGpYXiV2/eSBH0ezIeWiTahnJE2SNsL7oFej8q/
   n1ou5ngVqhtXr40SHnNA2l0MkO89QdE8Jl2rZWaD/IvpSl4O95q/tFvei
   qFzs6Mcd6SQ40nonSEOGWaMNFdE5YlXe5tP9AvNHuvyqioy9Nzibz1Dag
   A==;
X-CSE-ConnectionGUID: 20lgqVv/T32ZXmygIdhimQ==
X-CSE-MsgGUID: +mCx9gZqTFKiORDGDXgErA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383499"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383499"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:27 -0700
X-CSE-ConnectionGUID: HjVKERAITIC28FpFzogoxA==
X-CSE-MsgGUID: /6WLYwWXRqOt446s4lkJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089859"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:21 -0700
Message-ID: <57c5af3e-3299-47ae-9e13-bfce077f5e23@linux.intel.com>
Date: Thu, 1 Aug 2024 10:26:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +
> +::
> +
> +               USB                   |            ASoC
> +                                     |  _________________________
> +                                     | |   ASoC Platform card    |
> +                                     | |_________________________|
> +                                     |         |           |
> +                                     |      ___V____   ____V____
> +                                     |     |ASoC BE | |ASoC FE  |
> +                                     |     |DAI LNK | |DAI LNK  |
> +                                     |     |________| |_________|
> +                                     |         ^  ^        ^
> +                                     |         |  |________|
> +                                     |      ___V____    |
> +                                     |     |SOC-USB |   |
> +     ________       ________               |        |   |
> +    |USB SND |<--->|USBSND  |<------------>|________|   |
> +    |(card.c)|     |offld   |<----------                |
> +    |________|     |________|___     | |                |
> +        ^               ^       |    | |    ____________V_________
> +        |               |       |    | |   |IPC                   |
> +     __ V_______________V_____  |    | |   |______________________|
> +    |USB SND (endpoint.c)     | |    | |              ^
> +    |_________________________| |    | |              |
> +                ^               |    | |   ___________V___________
> +                |               |    | |->|audio DSP              |
> +     ___________V_____________  |    |    |_______________________|
> +    |XHCI HCD                 |<-    |
> +    |_________________________|      |
> +

It wouldn't hurt to describe what you mean by 'port' in this diagram...


> +SOC USB driver
> +==============
> +Structures
> +----------
> +``struct snd_soc_usb``
> +
> +  - ``list``: list head for SND SOC struct list
> +  - ``component``: reference to ASoC component
> +  - ``num_supported_streams``: number of supported concurrent sessions
> +  - ``connection_status_cb``: callback to notify connection events
> +  - ``get_offload_dev``: callback to fetch selected USB sound card/PCM device

I think you meant fetch offloaded sound card and PCM device information
for a given USB card:device pair?


> +Functions
> +---------
> +.. code-block:: rst
> +
> +	const char *snd_soc_usb_get_components_tag(bool playback);
> +..
> +
> +  - ``playback``: direction of audio stream

why not use the usual direction 0: playback and 1: capture?

> +
> +**snd_soc_usb_get_components_tag()** returns the tag used for describing if USB
> +offloading is supported for appending to a sound card's components string.

How does this work if the ASoC part is probe after the USB card? The
component string would be modified after the creation of the card?

A control is more dynamic by nature, not sure about this component
string. Jaroslav?

>
> +**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
> +Once added, this device can be referenced by further operations.
> +
> +.. code-block:: rst
> +
> +	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
> +..
> +
> +  - ``usb``: SOC USB device to remove
> +
> +**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
> +After removing a device, any SOC USB operations would not be able to reference the
> +device removed.

Not clear to me if the notion of 'port' helps, why not just
snd_soc_usb_add_device() and remove_device()?


> +
> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.
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
> +USB Offload Playback Route Kcontrol
> +-----------------------------------
> +In order to allow for vendor specific implementations on audio offloading device
> +selection, the SOC USB layer exposes the following:
> +
> +.. code-block:: rst
> +
> +	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol);
> +..
> +
> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
> +
> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
> +execute the registered function calls to the DPCM BE DAI link.

Oh man, now I get what 'get_offload_dev" means: it really means
"update_offload_info' or 'update_info_kcontrol".
The 'get' routines usually provide a handle on something to another part
of the kernel.
Not here, it's an update of something to be looked-up by userspace...


> +**Callback Registration:**
> +
> +.. code-block:: rst
> +
> +	static int q6usb_component_probe(struct snd_soc_component *component)
> +	{
> +	...
> +	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
> +	if (IS_ERR(usb))
> +		return -ENOMEM;
> +
> +	usb->connection_status_cb = q6usb_alsa_connection_cb;
> +	usb->get_offload_dev = q6usb_get_offload_dev;
> +
> +	ret = snd_soc_usb_add_port(usb);
> +..


