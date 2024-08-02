Return-Path: <linux-arm-msm+bounces-27792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830D945DAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 14:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC02C1C223BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 12:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8951E1E3CBA;
	Fri,  2 Aug 2024 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+aYgezj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270114A4C8;
	Fri,  2 Aug 2024 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722600656; cv=none; b=Aw3qVwWEr7hlRWQdoIzzhlESNqJ7cnYL5KnQT05cPfm+sJbG5akEXNcEhNgFfEhsnGSAiAIoU9fPY4z2j5/DvJlixECL8UQ6nRc11p8BTlY2YRuHOadexn9feazSZYK8z9gfCYo2WK8eZ7DASeailkdl+NrnGgmjFjeX12/pEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722600656; c=relaxed/simple;
	bh=KEYXx/jAB3vyQ6OMi4gTqUazWDOQK45pIkjybNC7SuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0ixrjS16z7r3o067+7/1JXiuoPCy/ZGq6jyvitE46vsmSTgDKkN+GNJ5nrtwKnJlHtD4Ryshwo8xA/xu7Ut0KH3Rjv6NU1gJDb8c/COfjFicghHQKMCVkZRYstC3ghglOEAgRd53qCU4VWETpYBeuSZpRp+sSrCNmh+FNlJydE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+aYgezj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722600653; x=1754136653;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KEYXx/jAB3vyQ6OMi4gTqUazWDOQK45pIkjybNC7SuQ=;
  b=Y+aYgezjFqv+K5AaTC4vZGcAh5hr2dQwe9wm9pi4K3h0Yz24cUe+d3H9
   ZsqbKBkwhHNZc+7OtZ0lDfh8wDGYvnp5h2Ecwagae2cWQzviJIh8hZLb/
   VLja1EpZGQdbrnB/DWdAKtdjgY3yqY1ka63zpxvjBzohWs1l8tFY6JAIN
   fxmTJv+pxr4H5ZVuQetR9jYG60Q42WYoIqi5LUXYPHj/G3sftzD34n49+
   ltFwKxKv0qx184oJS3CzJLMWzUYialY6SJZx3xynsE4nd9klZCq5FNH00
   KEpbbbtZQzWIjGoUr1zIcbSGhlmEkEPb37Xpz8nyE4eX0VjODfZ0jkAoP
   w==;
X-CSE-ConnectionGUID: ZapiAaSiQsKXTYMnVIxb0g==
X-CSE-MsgGUID: Ey9/KvnNTiCDawbkGRz3gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24484218"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="24484218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:10:53 -0700
X-CSE-ConnectionGUID: eze3z9pvRdWNf/nfC0oIGw==
X-CSE-MsgGUID: nX2dhYZKTa2IYxh8hBSGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55978928"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.89]) ([10.245.246.89])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:10:48 -0700
Message-ID: <1a2d0962-405d-4ccf-a0da-00a624c0f3e8@linux.intel.com>
Date: Fri, 2 Aug 2024 08:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 17/34] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20240801011730.4797-18-quic_wcheng@quicinc.com>
 <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
 <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/2/24 01:10, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 8/1/2024 1:40 AM, Pierre-Louis Bossart wrote:
>>
>>
>>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>>> +			   struct snd_pcm_hw_params *params,
>>> +			   struct snd_soc_dai *dai)
>>> +{
>>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>> +	struct q6afe_port *q6usb_afe;
>>> +	struct snd_soc_usb_device *sdev;
>>> +	int ret;
>>> +
>>> +	/* No active chip index */
>>> +	if (list_empty(&data->devices))
>>> +		return -EINVAL;
>>> +
>>> +	mutex_lock(&data->mutex);
>>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>>> +
>>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>>> +	if (IS_ERR(q6usb_afe))
>>> +		goto out;
>>> +
>>> +	/* Notify audio DSP about the devices being offloaded */
>>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>>> +						sdev->pcm_idx);
>>> +
>>> +out:
>>> +	mutex_unlock(&data->mutex);
>>> +
>>> +	return ret;
>>> +}
>> Humm, multiple questions here
>>
>> a) is this intentional that the params are not used in a hw_params routine?
> Think this was answered in patch#34.

yes, but that really begs the question if the format check shouldn't be
added here.

>> b) if yes, could this be replaced by a .prepare callback
>>
>> c) along the same lines as b), is suspend-resume during playback
>> supported? Usually this is handled with a .prepare callback to restore
>> connections.
> 
> I don't see us supporting that throughout any of the QC based DAI drivers, so this probably isn't implemented yet.  In terms of supporting system PM suspend for this USB offload path, we're going to explicitly stop the audio stream from the USB offload driver (qc_audio_offload) before we suspend the usb device. (refer to qc_usb_audio_offload_suspend()

The system suspend-resume during playback is not enabled in all
platforms indeed, it mostly depends on what userspace does. IIRC this is
required for Chrome/CRAS and it's supported by aplay.

