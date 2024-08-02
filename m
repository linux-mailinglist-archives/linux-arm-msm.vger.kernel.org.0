Return-Path: <linux-arm-msm+bounces-27791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10D945DAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 14:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E0C1F21B92
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1521DF67E;
	Fri,  2 Aug 2024 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEcceYM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167F014A4C8;
	Fri,  2 Aug 2024 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722600650; cv=none; b=UrJ3TYH0ONeNzxnitoM7bCnxP65+NouvCBR6RtEa7+Q3RBhLAIPBe/Rrv6jvCStfsFPJszi5voaBBq33APUUNrqDxO6z4MRtXjLfDcuwTKpWKkpsVPS6eaxnHTrY767j9xxhBGBLz/Y7HTcxU9sAO/eZ3F7nH7VGMRz7PJLskMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722600650; c=relaxed/simple;
	bh=eR+iu6/0WXfDTtplSQGsJVWxAt8YS165hY1VY+hKTf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fz3Kvp32G7darda5tO0HiuYkgnGp/sAKDpVM/2+H2I9zVayBGLJzUpEht72660IAgsSPppJcRQo7vG7ehDnoOJlW6XYu0PxAPcKr55134hJhQJiyy7NWHXBaBsPkBzNTBtFwN59hIpLjm6k1jsstPqUJttVwWfE7bVQVNzvkzDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEcceYM8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722600647; x=1754136647;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eR+iu6/0WXfDTtplSQGsJVWxAt8YS165hY1VY+hKTf8=;
  b=LEcceYM80ly35bcyLQlfwZTzMxhwhmHL5MQeG9tWI9n0Vmuy2yaYK/cE
   ad8hzGs2YSRc0UugZohJG1HtyiRr0REPdL+EEkNfr+k1pRY22NQrtAmFo
   RdpQF+cyYhZZ+cKVdPR63Sb3Doh7VkDpDWW7k5j4X/d8zSqH/9B/je/Nd
   UoQ064ucX9XSbc38yAW9MT+qYOpOK7VPQueCZrToI2tVdMzMyKq6UIZ+p
   BQnCWKzvo2p8mI3psY7NaHiJAb+DlvNB6IULOUoZBJg+B0DfnmSDZVZCL
   YiMy7NqJ5Sgd6bUO5qlzT98vQSlU4iydO/rW4JUOSkDUDPk+fHtZSm3JM
   A==;
X-CSE-ConnectionGUID: YiJ6omhhTICaHTyB845Jhw==
X-CSE-MsgGUID: pDQWo+DIQUupP6xdMfzwBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24484192"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="24484192"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:10:46 -0700
X-CSE-ConnectionGUID: WeoaLZ5qS1yBmoKb3Bfcyg==
X-CSE-MsgGUID: UgZNmmCzQrqeVCUuSYL9GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55978897"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.89]) ([10.245.246.89])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:10:42 -0700
Message-ID: <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
Date: Fri, 2 Aug 2024 08:26:10 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/1/24 23:43, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 8/1/2024 1:02 AM, Pierre-Louis Bossart wrote:
>>
>>
>>> +/**
>>> + * struct snd_soc_usb_device
>>> + * @card_idx - sound card index associated with USB device
>>> + * @pcm_idx - PCM device index associated with USB device
>>> + * @chip_idx - USB sound chip array index
>>> + * @num_playback - number of playback streams
>>> + * @num_capture - number of capture streams
>> so here we have a clear separation between playback and capture...
> 
> Thanks for the quick review of the series, I know that its a lot of work, so its much appreciated.
> 
> I guess in the past revisions there was some discussions that highlighted on the fact that, currently, in our QC USB offload implementation we're supporting playback only, and maybe it should be considered to also expand on the capture path.  I went ahead and added some sprinkles of that throughout the SOC USB layer, since its vendor agnostic, and some vendors may potentially have that type of support.  Is it safe to assume that this is the right thinking?  If so, I will go and review some of the spots that may need to consider both playback and capture paths ONLY for soc-usb. (as you highlighted one below)  Else, I can note an assumption somewhere that soc-usb supports playback only and add the capture path when implemented.

I don't think it's as simple as playback only or playback+capture. If
there is no support for capture, then there is also no support for
devices with implicit feedback - which uses the capture path. So you
gradually start drawing a jagged boundary of what is supported and what
isn't.

My preference would be to add capture in APIs where we can, with TODOs
added to make sure no one us under any illusion that the code is fully
tested. But at least some of the basic plumbing will be in place.

Takashi should chime in on this...

>>> + * @list - list head for SoC USB devices
>>> + **/
>>> +struct snd_soc_usb_device {
>>> +	int card_idx;
>>> +	int pcm_idx;
>>> +	int chip_idx;
>>> +	int num_playback;
>>> +	int num_capture;
>>> +	struct list_head list;
>>> +};
>>> +
>>> +/**
>>> + * struct snd_soc_usb
>>> + * @list - list head for SND SOC struct list
>>> + * @component - reference to ASoC component
>>> + * @num_supported_streams - number of supported concurrent sessions
>> ... but here we don't. And it's not clear what the working 'sessions'
>> means in the comment.
>>
>>> + * @connection_status_cb - callback to notify connection events
>>> + * @priv_data - driver data
>>> + **/
>>> +struct snd_soc_usb {
>>> +	struct list_head list;
>>> +	struct snd_soc_component *component;
>>> +	unsigned int num_supported_streams;
>>> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
>>> +			struct snd_soc_usb_device *sdev, bool connected);
>>> +	void *priv_data;
>>> +};
>>> +/**
>>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
>> USB port?
> Noted, refer to the last comment.
>>> + * @component: USB DPCM backend DAI component
>>> + * @num_streams: number of offloading sessions supported
>> same comment, is this direction-specific or not?
> Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>>> + * @data: private data
>>> + *
>>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>>> + * are used in subsequent sequences.
>>> + *
>>> + */
>>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>> +					      int num_streams, void *data)
>>> +{
>>> +	struct snd_soc_usb *usb;
>>> +
>>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>>> +	if (!usb)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	usb->component = component;
>>> +	usb->priv_data = data;
>>> +	usb->num_supported_streams = num_streams;
>>> +
>>> +	return usb;
>>> +}
>>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>>> +
>>> +/**
>>> + * snd_soc_usb_free_port() - free a SOC USB device
>>> + * @usb: allocated SOC USB device
>>> +
>>> + * Free and remove the SOC USB device from the available list of devices.
>> Now I am lost again on the device:port relationship. I am sure you've
>> explained this before but I forget things and the code isn't
>> self-explanatory.
>>
> Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.

I am not sure USB uses 'port' at all. If by 'port' you meant 'connector'
it's not quite right, USB audio works across hubs.



