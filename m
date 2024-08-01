Return-Path: <linux-arm-msm+bounces-27713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586D9447E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EAE7B22E0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852A31A00ED;
	Thu,  1 Aug 2024 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ge6C5s4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116D170A0F;
	Thu,  1 Aug 2024 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503543; cv=none; b=aGNIPcLM0lhjkLTWrvLqmD5j2+zvTXMqHbvd5NqKblHTCi5WgEsdywHpu0zH/R3M4HZ7wfQhW4cJc2JdMybyPeGELG82k72Plqo7midM859DMQsBJLCO70x9p1/Y6cRDJh6mn3bAk+hY/NQjsVd0w5IptjvHa6g7+HNvOh7N1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503543; c=relaxed/simple;
	bh=X2yTZOgmtPzRmB9EZfWm8834SLBb4s6ZqLKVNWv52yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMy5o0MJx+DIYUmZMv9C0xt2r3tsRzYWjQplrS1WvXoAtM3PpflTvvxkQNAh5ZQBNTMQp8NrZelk7PZXixOvHMdGeFBkE3zDEd0l6U0OORoYI0REHugW4oa6OKVv6C5q/BhWxtPyD2Q5o12YBahJqOnOappQWH+Mase+IYMrHvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ge6C5s4W; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503543; x=1754039543;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X2yTZOgmtPzRmB9EZfWm8834SLBb4s6ZqLKVNWv52yE=;
  b=Ge6C5s4Wt3SrUiC+ihK9xvlpN8P0aur0g+d5EIVv0K0hFH54CvdHwA5X
   hAHqmWXOGNbbw1JL4NVshAPlA8lUrhiW2+aHIBja+5I7GwPEBvF9ojxFP
   sH4QDVTV20Xhn03Rc1lVbmooNu2u8iMMRf/HG7NAtBIRzYh5tf4idqeQu
   w1mpBa9eld6o40YtAS3UlQ11CqYI9MytQ21t0UMD5sOkpZdnzl1YxnjCy
   NsDcKufnskcmTUx1fzEtNiyKHeT9jTmZY9b77hXPglMHEnblGI+vNA3+3
   U47ufM8AE7YjREElxrrncp9wGVMj17jTpQDm6HWVXAnvX3fQN+VyvUZ0/
   w==;
X-CSE-ConnectionGUID: TX1I+hP8S52dd0146+kAmA==
X-CSE-MsgGUID: TpC4jCGQRxKNl/e5Y+cvuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383720"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383720"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:12:22 -0700
X-CSE-ConnectionGUID: CIBWS+VXTECq+Rc+1hXfhQ==
X-CSE-MsgGUID: vzCEqILAQRmz4OwjGFWoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59090241"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:12:16 -0700
Message-ID: <c0b5be27-4a7a-4e53-ad90-f384b066791b@linux.intel.com>
Date: Thu, 1 Aug 2024 11:04:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 34/34] ASoC: qcom: qdsp6: Ensure PCM format is
 supported by USB audio device
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
 <20240801011730.4797-35-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-35-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/24 03:17, Wesley Cheng wrote:
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index d8f1bb4ec497..9a3fb3cb32b2 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -52,6 +52,7 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
>  	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int direction = substream->stream;
>  	struct q6afe_port *q6usb_afe;
>  	struct snd_soc_usb_device *sdev;
>  	int ret;
> @@ -63,6 +64,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
>  	mutex_lock(&data->mutex);
>  	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>  
> +	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
> +	if (ret < 0)
> +		goto out;
> +
>  	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>  	if (IS_ERR(q6usb_afe))
>  		goto out;

This patch and the previous patch 33 should be added before patch 17,
see comments there.


