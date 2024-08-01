Return-Path: <linux-arm-msm+bounces-27709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A899447C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74A4D286E8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF6918DF7B;
	Thu,  1 Aug 2024 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eED4liwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9B18C336;
	Thu,  1 Aug 2024 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503529; cv=none; b=s2BTxs7QsgG80wGrO7+E/PFkSOsNSmrLNVCeL6qklG9ipiClCya6HaNRL5y1Pa1as/c+h8TX/HiOzt6/pwQ1f4Bpv+jkoigaHHWX2/MfQIxs/R/HH6Sl0pcetCSMZm4mhd83DFxJHBqKNIilJvvK2x5N2w9k1QHoq605G+VqKEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503529; c=relaxed/simple;
	bh=w0McOUyWwUuqt/eulPkwOwH5rxC2a3weyECk1ou2zkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijU6lI81HGowqSIv1cqwO0c3MLJurkVzvBP3CSMlQbpR6s61WrhOOOQtjtA8yee865Ii8Si60hOC/QTdpefq9bqUGI/76vTSKvmO+Qrclc/XnM9qdaX6FIvEErmmjKkN+prt/KE/eiww6YesE/4ZOU7BchqxtbSqQNa4b6aIEvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eED4liwN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503528; x=1754039528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w0McOUyWwUuqt/eulPkwOwH5rxC2a3weyECk1ou2zkg=;
  b=eED4liwNEy3IUn9v/gPh8ZEVr5lFRVK0ixKABUUh/AEXcddNe14ZNXRa
   V71rbGreE0WXa/WdH6oeew5XXPXuTYBNJd6oG3KBJ7pDM+56BtI3uTy8X
   boLmtmx+og81vJ9kcQZINY4q1eNuY6Bq/VpbFTSDwiijvb4J5H4weRUqd
   4MahF8TWWSE7xtEwjSTf0eK1KEToRV7qO8uEd4kO+NytrzTp9dVJhHF6l
   LSG5q4xqjbp1F4ZpFbPcCx2jVvTUoogcW9RXdMlj4nZPGcAM0UqIExNQJ
   a6+LoVpA+8ieEQM2J9p0q7fGSs7Sj/gUP/vm50rEdhiwb7o0YOY4EiaFs
   g==;
X-CSE-ConnectionGUID: 95+f09csTQWz2SupjXjA0A==
X-CSE-MsgGUID: 3J6R5TRyTl6Rw9H3C0ZeBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383620"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:12:00 -0700
X-CSE-ConnectionGUID: qzka40OKSsyRNpJ1IZoG5w==
X-CSE-MsgGUID: yQbFYnn9RiivaEUKaMOqXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59090084"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:50 -0700
Message-ID: <5b5d06b8-8ada-49dd-a9c5-477258a9a72a@linux.intel.com>
Date: Thu, 1 Aug 2024 10:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 19/34] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
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
 <20240801011730.4797-20-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-20-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> +static int q6usb_get_offload_dev(struct snd_soc_component *component,
> +				 int card, int pcm, enum snd_soc_usb_kctl route)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
> +	struct snd_soc_usb_device *sdev;
> +	int ret = -1;
> +
> +	mutex_lock(&data->mutex);
> +
> +	if (list_empty(&data->devices))
> +		goto out;
> +
> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
> +
> +	if ((card == sdev->card_idx) && (pcm == sdev->pcm_idx)) {
> +		if (route == SND_SOC_USB_KCTL_CARD_ROUTE)
> +			ret = component->card->snd_card->number;
> +		else if (route == SND_SOC_USB_KCTL_PCM_ROUTE)
> +			ret = q6usb_get_pcm_id(component);
> +	}
> +
> +out:
> +	mutex_unlock(&data->mutex);
> +
> +	return ret;
> +}

well I obviously didn't get how this function worked until now, it's
supposed to be call TWICE with a different argument.

Not sure it's really wise with the locking, why not get both in one shot?

Also how does this update the kcontrol value?

