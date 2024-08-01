Return-Path: <linux-arm-msm+bounces-27707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 822369447AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D849286DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8886D18990F;
	Thu,  1 Aug 2024 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDEZAyHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB62188015;
	Thu,  1 Aug 2024 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503524; cv=none; b=oaLpcpQNXv/4DQJY+bXGZlp4+dXW76u/B/lKRI1CjOpWBhewYzumqA+u1zu+AjrkYZ1qi0T2nxzhKVGZQ3q6U4EKZKvFZ/LgTHFeJL5g2f6+7058j8jJc0qvYMFGjiOm8yo9OJQD9EdAkRpf9ogiwXABAgDl3oe9LRw6nK+O+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503524; c=relaxed/simple;
	bh=SOc8glK77E54IHi0aYmi1becvJHvdKsCHlBtpj4BVg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKOTKo0CcD4T/dN6ycOxp5qiaUI33VlgADHAx0IzoTftW3G+nZmxCgQsghpRKMDVfZPy0UxK1milyosFRogHRnT5YiIFQmApyvDfQwEsWLzbHEDayiphgKX3ETOGhk6LgW4ssjTygQClG3dBgIfbz4/wUxO2fQGDU6pPD5TM+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDEZAyHz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503524; x=1754039524;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SOc8glK77E54IHi0aYmi1becvJHvdKsCHlBtpj4BVg4=;
  b=XDEZAyHz+U1OzWJjrf/uz6lLh0kxEu1LzZ1+NisO6C3fZo7VVCtG1Ut7
   e0FvpvxrvJWAJa2jhrylUkXZD/rCrxMp7aR42X1SBgGcMvrx/0Ev6CRUQ
   w4XeGCbBXLAsCf0fXoL0zEXxe8B5vOlFf3VhHDfioQdHd9b93sBGpvs+8
   OApxiP2DUyOqKLkMb3pSO5qt2+JwoOadCjuJLWBNYNf6CvRpKrzohCD1C
   pGTBTi6wWmt6c6dxu7Azzd+i973m11CGUB4Aja5a4Xx9ozAP7eVEcTPTd
   Lx/RZu0Rdad9MIf1vmmmwgPBF4nmhGKX2sqX3hULjJGUceCq7iFwrS/aM
   A==;
X-CSE-ConnectionGUID: OXG1RadZRayaCcV9XaIeOw==
X-CSE-MsgGUID: FJHr1kMcSYyGD+PoMqLv6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383558"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:50 -0700
X-CSE-ConnectionGUID: 5bTR/KBmSv+7VMJZROiJzw==
X-CSE-MsgGUID: W4mT9NNxSUOjFGSViYJGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089923"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:36 -0700
Message-ID: <abc9f2b9-06c6-4df7-8db8-c2c6e8aaee59@linux.intel.com>
Date: Thu, 1 Aug 2024 10:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 16/34] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
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
 <20240801011730.4797-17-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-17-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/24 03:17, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 948007955934..452d7e8b9b30 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -366,7 +366,7 @@
>  #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>  #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>  
> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000

Surprising that 1s is not enough to resume a bus, and conversely is 3s
enough then if the overhead is so significant?
It looks like either too much or too little...

>  #define AFE_CMD_RESP_AVAIL	0
>  #define AFE_CMD_RESP_NONE	1
>  #define AFE_CLK_TOKEN		1024


