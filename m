Return-Path: <linux-arm-msm+bounces-28467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95795178A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389CE1F23A0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 09:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C783A14900E;
	Wed, 14 Aug 2024 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRjvPLh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F6146A8A;
	Wed, 14 Aug 2024 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723627271; cv=none; b=BwGZoCd0oJjCRlFMOBSgaNGNeel/PdgNPEVha1sIsyB6uL3oIZFZ5aBJQWLKIImT/u5pIstkMQr10jlxcx27pDeGC00YE3SBmDNjReKsXm5wUyXRFNrYNbwzogef8YCjp+EnwlRs8leDOe0ay8g3wHmyKGsAYyf6xQCS6bI/JVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723627271; c=relaxed/simple;
	bh=wj88B6BBi8tG04+C5SWDMso/uHUJfPvBpn1JpU98qQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5cBA/XQhrtPLSuMhjekz8fwgin6mdk06gphJ66w73UdSp40LwUp5MhPKS7kanf9RJZbe/K7q2LHPyj3tn/vaIa1jKPl6flOxBzGIv19ab/CIYJn5l+fy7Pe+1wf/eGBy8RX6KLCGyrSyDfvgUZLKwjfkVHXokSkscNRLUgyLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRjvPLh5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723627269; x=1755163269;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wj88B6BBi8tG04+C5SWDMso/uHUJfPvBpn1JpU98qQI=;
  b=JRjvPLh5PVvg0WmFEUiIK7nEES0sc3caL281T3nyD8uLeQpvHUsHJSQM
   Lnj1zkjzyRvGqcFX3jU2OtHl3IyCc1ifsWVJPmN8CCJ5x2u61VzJdZjX/
   WN2Pea7wuPRB87CMZGZPogKdZSZxwFs7b54YDp8VZZkUnD98BR1jUQDhw
   GxJ0RAwbGmnIFDDMdojeCx90nyCadkKSv0bzEP9WUmJa7XtAq+45fBooS
   h/TJHhMebE1szuJa8yiIACAMZUemC+vHNeMKrlZfowkYirS0vDCRWrdPH
   uWeO092ECqEouUL4Xh5ha5phsvuT2TckSutTTPxrjrLv2FXNb46tiJ7wQ
   g==;
X-CSE-ConnectionGUID: kVvTUd/4Q9212FpsPgb7Og==
X-CSE-MsgGUID: rR44qeteSzKXBudqIv/ihQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="39282578"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="39282578"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:21:08 -0700
X-CSE-ConnectionGUID: C5GMpR9eT82uHlsNZHJFaQ==
X-CSE-MsgGUID: MS7yrPWQTkWJMZoDPeQKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="58655845"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.67]) ([10.245.246.67])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:21:03 -0700
Message-ID: <74d413f3-45ab-405d-8dff-122785ae7da5@linux.intel.com>
Date: Wed, 14 Aug 2024 11:20:59 +0200
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
 <6855763c-0230-4535-a603-343059de5202@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6855763c-0230-4535-a603-343059de5202@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>>>> + * @list - list head for SoC USB devices
>>>>> + **/
>>>>> +struct snd_soc_usb_device {
>>>>> +	int card_idx;
>>>>> +	int pcm_idx;
>>>>> +	int chip_idx;
>>>>> +	int num_playback;
>>>>> +	int num_capture;
>>>>> +	struct list_head list;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct snd_soc_usb
>>>>> + * @list - list head for SND SOC struct list
>>>>> + * @component - reference to ASoC component
>>>>> + * @num_supported_streams - number of supported concurrent sessions
>>>> ... but here we don't. And it's not clear what the working 'sessions'
>>>> means in the comment.
> 
> After taking a look at this "num_supported_streams" naming a bit more, I wanted to check with you to see adds to the complexity of the terminology being used across soc-usb.
> 
> The intention of this is to define how many concurrent USB devices the USB backend can support.  So for example, if the audio DSP did support multiple USB devices at the same time, this would denote that.  This is where I wanted to make sure the terminology was right....  So in this case, to me, it makes more sense if num_supported_streams --> num_supported_devices, because it determines how many USB devices the ASoC USB backend DAI can manage/support.  This adds a bit to the reason why I think using the term "port" for explaining the SOC USB context is reasonable.

IIRC the USB specs define a hierarchy of device/interface/endpoint
concepts. For streaming the only thing that really matters is the number
of data endpoints, isn't it? If you have two devices with a single
endpoint each or one device with two endpoints it should be the same
complexity at the DSP level?



