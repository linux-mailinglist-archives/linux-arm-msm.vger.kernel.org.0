Return-Path: <linux-arm-msm+bounces-24868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B975D923A44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E76FB21EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 09:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348081534EB;
	Tue,  2 Jul 2024 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeO/0M3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D0015217F;
	Tue,  2 Jul 2024 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913163; cv=none; b=DEXjC9lvl5jOI1O82069SW0FMRz4+sUyF3LeBFalvlQgH3g9ttupqdPm57d8J/NAwoxXV0nJ9ynLmmgHcyjO3pNgdgFZPlweXbe/PZTxWWhXO6urWnHo8g7hNXt4E6YDO8ecM1XpE28+u65Ot9Gb9us+9BGEHIpUcpLOdxNChLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913163; c=relaxed/simple;
	bh=cKKhmZWA8i3/t0YPKgOkIBJTFu7C+J1VqMks8j/9hs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAQwfJTeITuEmt9Psz8aLiNEcJEkHu87vfJb9QC+E73EpdaVk1ekgPgZANJAP//ESsXAyIITa1noCYyr/PDRYrOBCjj5wY279EAFuN8h667LtBedymCtjISSEJ8CGun46SNR/w47b3s7e+1l/blrusfWa1sOHVeOc5mwc0NrnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeO/0M3A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719913162; x=1751449162;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cKKhmZWA8i3/t0YPKgOkIBJTFu7C+J1VqMks8j/9hs0=;
  b=XeO/0M3A4KnIe3oLFSTo31cb8QzG9N6I6vNvkHVY/Tv3O7n0pOrqGFU/
   C+/AtxZ+zlk9JMBoXxZrLNpuzV+S8EIE5w2RQGUF5DdpxhXlj2JSy7cGK
   2nlOowfU0jbZCcmiL3sw6T14lw9xeNgk7Ef9MSj3SQwduyNAUV4GWFb9N
   Ydx1tN84KqQEBuoJIpWXb2ZmuKoEqda2OJjOwjnY2ju9WqpX3U0TdotO1
   qBOwttUrkuyUMyRzuVs3zQ9T/NdazZY53T75VwomKtIYevHu2LhtuTE5R
   ieEzGiFfwrz2SDVuC4OzqJvfuuE7VjJR+iBgnS9h/u/j3tDX3/2pUos4z
   Q==;
X-CSE-ConnectionGUID: UW+Vl1+oTESyocJmh+htsA==
X-CSE-MsgGUID: n7Rbw1buR+uEb7+OJJZsCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17289670"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17289670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 02:39:21 -0700
X-CSE-ConnectionGUID: 3z6E88XVSzSZZvVdIsg49w==
X-CSE-MsgGUID: tPms4iSOTy2At6x47qeQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45637566"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.174]) ([10.245.246.174])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 02:39:14 -0700
Message-ID: <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
Date: Tue, 2 Jul 2024 10:30:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, srinivas.kandagatla@linaro.org,
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
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>> There are really multiple layers to deal with
>>
>> a) is the controller able to support the offload path? IIRC this is
>> embedded in an obscure XHCI property, it would make sense to expose it
>> as a control, or component string, of the USB card.
> 
> If a component string/tag is desired, I already have some way of doing that.  I can add it to the USB card.
> 
>>
>> b) is there a companion card capable of dealing with the offload path?
>> Since the presence of this card may depend on driver probe, there should
>> be a control on the USB card. userspace could detect changes to this
>> control and detect if that path is or is no longer enabled.
> 
> So currently, the "USB Offload Playback Capable Card" kcontrol (on the USB card) will determine if there is an offload path.  However, this differs than what Amadeusz is suggesting, in that he wants a single kcontrol created for EACH USB card identified (per USB audio device), and a simple enable/disable control to determine if the offload path is enabled for that card/pcm stream.
> 
> It would be a simpler approach for the userspace, and if the card that handles the offload card isn't present, then these enable/disable control will be set to "disabled," and even if users attempt to set the control, it won't go through.

Not following. Are you suggesting userspace would modify the
enable/disable status?

I would just have a read-only control that reports what the hardware can
do and which other card can deal with offload. It's up to userspace to
select the offloaded PCM device or not.



>> c) which PCM device is actually offloaded? This could be plural for some
>> implementations. The mapping between PCM devices exposed by the USB
>> card, and those exposed by the companion card, should be known to
>> userspace. I am not sure how this would be done though, a variable
>> number of controls is a sure way to confuse userspace.
> 
> Expanding on Amadeusz's suggestion, my idea is to have an enable/disable kcontrol per USB stream.  For example, one USB card could have multiple PCM devices (USB streams).  So we would have something like:
> 
> PCM Offload Playback Enable Stream#0  enable/disable
> 
> PCM Offload Playback Enable Stream#1  enable/disable
> 
> ....

are those read-only or not?

> So we'd know which USB card and PCM device is selected for USB SND.  However, I see what you're getting at in case there are multiple supported streams, because userspace needs to know which ASoC card/pcm combination corresponds to which USB device/combination.

I don't understand how this would help map the two parts? There's got to
be an additional mapping...

> What do you think about having a USB card kcontrol to display the mapped ASoC card and PCM indexes?
> 
> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
> 
> To summarize, if we did this, I'd plan to remove all the kcontrols in ASoC card, and have the following in the USB card for an USB audio device that supports one USB stream:
> 
> PCM Offload Playback Enable Stream#0  enable/disable
> 
> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)

... which is suggested here.

Assuming these are read-only controls, we would need to know which PCM
device on the USB card can be optimized with the use of which PCM device
on the ASoC card. That means a set of three values. You would also want
a number of streams to make the guesswork on controls less painful.

