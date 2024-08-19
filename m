Return-Path: <linux-arm-msm+bounces-28950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC679564D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 09:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660421F23E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 07:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6315D157A67;
	Mon, 19 Aug 2024 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjRFd5pl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9906314AD3D;
	Mon, 19 Aug 2024 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053318; cv=none; b=k12Tsk0OTnwhn4LHxqWVBKAjWxzUlVmOsBDdnzIdJmlsim0W968adgQsur0kk1RuRFl9TtKX9SoBbJjLSlO7BO2QWzjY4uVg8oH3AOl54STdtJ0ZvCSSyU5KtX2izdsMHyPJve3lDw/Yw51oOwwDxwASPs1CmX5QFFbzYUmYVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053318; c=relaxed/simple;
	bh=0K840/msskRjT2q+9Xr4aH29i04ioHV2zfboFzqrkHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNRj873UOuBsPkJEUMpkshnAXae/vLlPGOdXLxvtc1u/Hckk3JabSiM/Dlxvugs9CMJ1w6xY8+GrbIIIvE4oQCP3NeKimRXnTHomhQqGX4cXBZpmxHYXceXVxm5ylxKq/QuSQNj6WQkGB6rPQh6dis2f/eu34q1BHrLufdJsVkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjRFd5pl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724053317; x=1755589317;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0K840/msskRjT2q+9Xr4aH29i04ioHV2zfboFzqrkHE=;
  b=OjRFd5pl68oeHoeCBvSn01zk+P/MieofPJi7T4bm1QHesxvSwPqj50oL
   pPGTrz4wom6F9NBzywkp/uYdSL0oCn3xDNLTrNPxh9A2W8F7shPg/gNJ9
   H96JSKiK8rDp0SUhFv/PNnqzdZXgpY/nH3El21apv6dbgOKihO11CD6Q/
   BmUi3ghRiRwOQs43AMOXRmGMqhbGtAwo0lE4YKI4V9yssPW191mc8+29R
   1vSfIjsHYNfAN/35f+6yNr7dHwWCAcmvZKxCPIuGQdTX4TlimJ+KUX9VH
   OgPqAW9HIutVi6alAM5NEijo+BH01OTfkbuydS4ak2Ddq39qPha0Y4nd1
   A==;
X-CSE-ConnectionGUID: 2g3fdWJrRRqjeihwhkk3IQ==
X-CSE-MsgGUID: H6Uf4sbsQG2t5vHdf8qJ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26079133"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="26079133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 00:41:56 -0700
X-CSE-ConnectionGUID: gqcRluUbTbiWOIuL2nGreg==
X-CSE-MsgGUID: L+FfEV28SeaeQ1SqYz+WhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="64677103"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.57]) ([10.245.246.57])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 00:41:50 -0700
Message-ID: <5695d0ec-af07-4d8e-993f-d435537ea503@linux.intel.com>
Date: Mon, 19 Aug 2024 08:26:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
 <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
 <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
 <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
 <b323a813-b02e-488b-86f9-06796f9bbf50@quicinc.com>
 <e6e7533c-5665-458e-ba60-7cb843eb27e1@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <e6e7533c-5665-458e-ba60-7cb843eb27e1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>>>>> +/**
>>>>>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
>>>>> USB port?
>>>> Noted, refer to the last comment.
>>>>>> + * @component: USB DPCM backend DAI component
>>>>>> + * @num_streams: number of offloading sessions supported
>>>>> same comment, is this direction-specific or not?
>>>> Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>>>>>> + * @data: private data
>>>>>> + *
>>>>>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>>>>>> + * are used in subsequent sequences.
>>>>>> + *
>>>>>> + */
>>>>>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>>>>> +					      int num_streams, void *data)
>>>>>> +{
>>>>>> +	struct snd_soc_usb *usb;
>>>>>> +
>>>>>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>>>>>> +	if (!usb)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	usb->component = component;
>>>>>> +	usb->priv_data = data;
>>>>>> +	usb->num_supported_streams = num_streams;
>>>>>> +
>>>>>> +	return usb;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>>>>>> +
>>>>>> +/**
>>>>>> + * snd_soc_usb_free_port() - free a SOC USB device
>>>>>> + * @usb: allocated SOC USB device
>>>>>> +
>>>>>> + * Free and remove the SOC USB device from the available list of devices.
>>>>> Now I am lost again on the device:port relationship. I am sure you've
>>>>> explained this before but I forget things and the code isn't
>>>>> self-explanatory.
>>>>>
>>>> Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.
>>> I am not sure USB uses 'port' at all. If by 'port' you meant 'connector'
>>> it's not quite right, USB audio works across hubs.
>>>
>> Remember, this is technically the term used to explain the channel created for ASoC to communicate w/ USB.  If we use a term like "device," USB devices come and go, but this ASoC path won't be unallocated along with the USB device, since it does service/know about all the available USB devices connected to the system. (ie through usb hubs)
>>
> How about snd_soc_usb_allocate_link()? This is technically allocating the soc-usb structure which is the entity that connects the ASoC to ALSA.

oh, so if this has nothing to do with a USB device proper, it'd be fine
to use 'port', but explain it in the comments, e.g. something along
those lines:

snd_soc_usb_allocate_port() - allocate a soc-usb port for offload support.

The soc-usb port may be used to stream data with ASoC support to
different connected USB devices. Plug-unplug events are signaled with a
notification but don't directly impact the soc-usb alloc/free.

