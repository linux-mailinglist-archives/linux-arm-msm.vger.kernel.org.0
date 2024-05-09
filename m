Return-Path: <linux-arm-msm+bounces-19613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC38C15C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41B98B22B34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C01C85954;
	Thu,  9 May 2024 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtyDnETV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6767685933;
	Thu,  9 May 2024 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284588; cv=none; b=Euherp0V6Kgy+7S2D3vNCZzj11ZNU7PrOrwxf2yW4540bef2EjXdoSrwbK2IbbzJdaaa7dg8HIxsFc0gRvH2LYNJG+7RdqH0Dn9iQixDkuxmAkFaMDffsu/k3fxzI7BfPL0uekHqabZu5BKDenhd+CKfXXCNW7NdKRmm0wI3w3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284588; c=relaxed/simple;
	bh=KWpE0p6D5Mx4AC48PvOC39QYe6ueT3DevHp41Jg8ly4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LX7qVZRmbfz7SmjjxA58wH6gJIpGBy/Ua/LQj0465rnE0vutYsLgiHwyCG6cVJK6JRT18nbXiyPlB88SkJB2DCAuxIlw+QI3hKJTxlUrlceKAHA5dFeIL60Jg2vYZ3+8u3Az0rUzfcXbOsa5GRqG2Yvu7ku1D2mtD2gC2cAXliQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtyDnETV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284587; x=1746820587;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KWpE0p6D5Mx4AC48PvOC39QYe6ueT3DevHp41Jg8ly4=;
  b=AtyDnETVdOXnZhlxOvSzgvhX0I74dBcFiIj4RAh0AlR53vYsBNMOAgHd
   lV8t8ZwpsflL3Dw/XBfBxjkCpvpfSSWnjHaIJrySpcGAzRXGX/EriIeKe
   kk/3BoLH/UqbQNMDEviaazUWUGDdMGqjMSIyrN1UrMC30cYzLQ86D5P64
   zLHRBXBrt4NfJjguxqw6Kmwe03SV4hwNe3D5Ct6Se3PGhSIl5j+j1Ylly
   wdOXhj2IhHEEE0EWtjIqQYOMh9BkaUpAJRK42/8ofh1LbcCDNyupCzci3
   arDL3bTFYPX2xyIP92ur91o5Wijkd0n9XmmTbKjWE5ZoITGEK8NHziUTZ
   g==;
X-CSE-ConnectionGUID: qG9lyM2jSdCuU1GGSj3Kgg==
X-CSE-MsgGUID: BDnbUtm5S+ynl+nSRg0eQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454287"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11454287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:26 -0700
X-CSE-ConnectionGUID: a41ju8XXQeG9r7e6NCexkA==
X-CSE-MsgGUID: lQw9T7pCRA6d3UjUMCy9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34213124"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:23 -0700
Message-ID: <f4d59f05-9279-4c89-b5e1-57a0b3e8cddf@linux.intel.com>
Date: Thu, 9 May 2024 08:11:33 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 34/39] ALSA: usb-audio: Add USB offloading capable
 kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-35-quic_wcheng@quicinc.com>
 <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
 <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
 <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>>> It is expected for the USB offloading driver to add the kcontrol to the
>>>> sound card associated with the USB audio device.  An example output
>>>> would
>>>> look like:
>>>>
>>>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>>>> 0 (range -1->32)
>>>
>>> You already gave the following examples in patch 29:
>>>
>>> "
>>> USB offloading idle:
>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>> -->-1, -1 (range -1->32)
>>>
>>> USB offloading active(USB card#1 pcm#0):
>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>> -->1, 0 (range -1->32)
>>> "
>>>
>>> Can you clarify how many controls there would be in the end?
>>
>> For USB offload situations, there will be a set of controls for
>> playback status and playback select.  The offload jack will also be
>> there to tell us if there is an offload path available for the
>> platform ASoC sound card.
>>
>>> Also isn't tinymix -D N going to give you the controls for card N?
>>>
>>
>> Yes, since the offload portion is handled as a DPCM DAI link to the
>> platform ASoC card, it will be included as a kcontrol for that.
>>
>> Thanks
>> Wesley Cheng
>>
>>
> 
> Sorry for responding again.  I read your email again, and wanted to also
> add that aside from the above, which are all within the ASoC layer, as
> we discussed previously, we should have a kcontrol in the USB SND card
> to determine if there is an ASoC platform card capable of offloading.
> This is also available from the SND card created by the USB audio device.

That makes sense: if the application wanted to use a given endpoint, it
could check if there is a 'better' path exposed by another card. It'd be
a lot easier than reading controls from random cards.

Was this part of this patchset or more of an idea for a future addition?

