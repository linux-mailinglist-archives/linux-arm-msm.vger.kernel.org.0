Return-Path: <linux-arm-msm+bounces-27708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264A9447BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2064286E3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C2E189BBE;
	Thu,  1 Aug 2024 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zgz2dlHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DB18951C;
	Thu,  1 Aug 2024 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503526; cv=none; b=nI1+bPRURalqMwRLBwu9diT+jchLZKGqP6WiC7P3xdc9g+5t4HyEZsDqNLT13Ahn4bTpEY3M/TSp3spYDrX6yoeH2b+f5we1w/CySew0H3HEIWdAFZhIk8g++YDJsaJSEzCe8zTFeIfBZ96dGz9KjgdP7fy0VITj2Gd3lIuOOcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503526; c=relaxed/simple;
	bh=OziTlghW/wlMQZK0K9+wYZg1uMjzZ8EsjYPZDOViGlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QadoQ+S7XtZzWQ9gw+iujkDFQG5Clo5xAo8y0FP9qDIejNIhW6JpSrkwApIAfZGiw7EiIOKgIlogEkwtW0RKnRmvCUF/ixRdmO5hakKGPu/HaB5stnO9lsLzzfhLHvX/VEAjhJCP/lCNPx3s1zr5ux3XSsEXijwz2o+DjHvVPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zgz2dlHr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503525; x=1754039525;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OziTlghW/wlMQZK0K9+wYZg1uMjzZ8EsjYPZDOViGlo=;
  b=Zgz2dlHrdoWS3aE0aJhPmuHk7fkclfHoFk4GyMnJK/VW4ceQ69A5jYKq
   QJnN5RYw4j2Wz8zpqvfxFREyAhRvoMo7HxzHhe1XqTXe+RhuXodna4Wzp
   jKJFhBVHlbac/ahGL/dj4dfINr+RS9MMxhP/WtoG8h/79RMnErDNh8qQG
   37wO/ftf3ptWFokCb56vQqY7jdsfeVHOdV5acdvT4jR+y0B4+WK4X/Z/X
   TfINh3HrMRvd9yej+TXs9s2gJNm+L180IE1YEisJLCqU9GGfqnTo2Iu8O
   0NF5Kqbb+H/5EF+s51E2Lu8JlnLcI2Dp6TBwqPS10X+oVqNLPr+p0EKzw
   w==;
X-CSE-ConnectionGUID: dtHe+PwnTgCqtZ7Wweu3cw==
X-CSE-MsgGUID: Lhyx2c0rQTCQSxf6zwYOew==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383575"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383575"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:50 -0700
X-CSE-ConnectionGUID: BHajjV1SQTOmkqgtPprL1g==
X-CSE-MsgGUID: wBaSr/dKTH29cbTi2Z2zog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089939"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:43 -0700
Message-ID: <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
Date: Thu, 1 Aug 2024 10:40:20 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-18-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct q6afe_port *q6usb_afe;
> +	struct snd_soc_usb_device *sdev;
> +	int ret;
> +
> +	/* No active chip index */
> +	if (list_empty(&data->devices))
> +		return -EINVAL;
> +
> +	mutex_lock(&data->mutex);
> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
> +
> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
> +	if (IS_ERR(q6usb_afe))
> +		goto out;
> +
> +	/* Notify audio DSP about the devices being offloaded */
> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
> +						sdev->pcm_idx);
> +
> +out:
> +	mutex_unlock(&data->mutex);
> +
> +	return ret;
> +}

Humm, multiple questions here

a) is this intentional that the params are not used in a hw_params routine?

b) if yes, could this be replaced by a .prepare callback

c) along the same lines as b), is suspend-resume during playback
supported? Usually this is handled with a .prepare callback to restore
connections.
> +
> +static const struct snd_soc_dai_ops q6usb_ops = {
> +	.hw_params = q6usb_hw_params,
> +};



