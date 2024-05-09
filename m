Return-Path: <linux-arm-msm+bounces-19609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4C8C15A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06FEF1C20D8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845C07FBC1;
	Thu,  9 May 2024 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTagBD7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A52907;
	Thu,  9 May 2024 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284577; cv=none; b=nN+6RkMekzLDNvkasmXcQPmWWOAXXPwBsoAFLg38esneDeJ9mF/mMb73byiRa1K90/iq6viydeHGEou+g7fNF25ZCHpbh5wwZbGtJ2FdVA1fXlkIqagXSvcnteGGfBGOyn0s7SLgQNalxL+PLNRUjCIwCdh+bAwqR8FuvV+gYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284577; c=relaxed/simple;
	bh=yggsdWvGecv9KlZXR7Gn5ZXJpoT8aeY02OM9eHlbgFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpcYm13Fdk4Nb9rlZ1LuYGyyuGLmzHEB6A7bItvyo+11icOn6kzIcArUxNYaMppjeqAhGowO20u8kww+ZHeGsrAsgXRDT+tJLTbGL7u8Z1hsGTfLTz+Q1PK54jb1qlkXGLSqp3ngdMaXBYvXFEpI/xHZ5CWt/GS1ouoHjzXWNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTagBD7Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284576; x=1746820576;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yggsdWvGecv9KlZXR7Gn5ZXJpoT8aeY02OM9eHlbgFI=;
  b=RTagBD7QGomYEp9Rqj9nG72Ua8Vy5vv2/DsR9AbD09Ee4hJSD0/Vj3Gs
   XE4JwQT6IKzbCd6jeI/5E4dIYuAWCIJ07g15SF7B0FdiOTVd9Ou8QU1zn
   C5s72CV9ZF2LQp2oHa4fQao9nlQEIbKQS0KkhEYZsg2UHA7guBjGIAkpJ
   kRXBM5UEZeLdTAwJXu6qZdhBPhA8axOCAxtr1udmyh2pH80fuy9do3oAe
   99RtbaBYIwhoYJ52lTfrnz3JQ2wW9xFdYDodMYQp2Ur9yabwrcGTFmz22
   PLjfNntBiYZ2qfMB6TjRJ3YdRBiz4GJ1QMAQ9JuK0ETnYXhV1EUWZ9z3S
   w==;
X-CSE-ConnectionGUID: OVYOC/UESkmsBEEk0xgBww==
X-CSE-MsgGUID: UxKGoLOVTd+VGyMPEGcUdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454245"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11454245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:14 -0700
X-CSE-ConnectionGUID: 0hSRX4lDS5GfwWSqiwJzxQ==
X-CSE-MsgGUID: Ld9aKcU1TYSOY0PDBQNl8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34213064"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:11 -0700
Message-ID: <726e7006-30b4-4525-84c8-4fb2ef380994@linux.intel.com>
Date: Thu, 9 May 2024 07:54:47 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240507195116.9464-10-quic_wcheng@quicinc.com>
 <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
 <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




>> Wait, is this saying you will have exactly one PCM device/FE DAI
>> connected to the USB BE DAI exposed in patch 11?
>>
>>> +    SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
>>> +               usb_mixer_controls,
>>> +               ARRAY_SIZE(usb_mixer_controls)),
>>> +
>>
>> And then what is the role of the USB mixer if you only have one input?
>>
>> I must be missing something.
>>
> 
> Not sure if this is a QCOM specific implementation, but the way the DT
> is defined for the USB offload path is as follows:
> 
>     usb-dai-link {
>         link-name = "USB Playback";
> 
>         cpu {
>             sound-dai = <&q6afedai USB_RX>;
>         };
> 
>         codec {
>             sound-dai = <&usbdai USB_RX>;
>         };
> 
>         platform {
>             sound-dai = <&q6routing>;
>         };
>     };
> 
> Based on our DT parser helper API (qcom_snd_parse_of()) this isn't going
> to create a PCM device.  The PCM devices are created for nodes that
> don't have a codec and platform defined:
> 
>     mm1-dai-link {
>         link-name = "MultiMedia1";
>         cpu {
>             sound-dai = <&q6asmdai      MSM_FRONTEND_DAI_MULTIMEDIA1>;
>         };
>     };
> 
> The ASM path is the entity that defines the number of PCM devices that
> is created for the QC ASoC platform card, and is where the actual PCM
> data is sent over to the DSP.  So there could be several PCM devices
> that can use the USB BE DAI.

ok, but then how would this work with the ALSA controls reporting which
PCM device can be used? I didn't see a mechanism allowing for more than
one offloaded device, IIRC the control reported just ONE PCM device number.

