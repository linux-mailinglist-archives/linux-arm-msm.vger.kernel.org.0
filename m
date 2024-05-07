Return-Path: <linux-arm-msm+bounces-19502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 254778BFE82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2FFD1F26527
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9960126F3D;
	Wed,  8 May 2024 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6EWZsHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B61F126F0F;
	Wed,  8 May 2024 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174184; cv=none; b=CIazFFRowxd14nl6Ft0j5iEC8oL3KV8Vgg3PlCi4VRAnkkqgFuvR8LGchjULw/6NgyDvXJGdU6J7kJPCWVzXpuTFhtvpUMg5c7Orh1pQ7+80A6t8THk+jYxqAopvHV16oVD0ygny2Cwdp/gRaHRSZy/oG/lCOwdP9g6CDAydw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174184; c=relaxed/simple;
	bh=gQ4XL8BmkP07oBddLqlnRnQ5uY4XUZH2ALIHdrPqhas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYyqH1LlTmWzVwf4YOVUnWfgwS1YgcyTZ2dLAU3XhAZAdi+pWp2nsiCF+vmg8JCUTmOB0oIz++yKzyamWEubaVp8c8Lp3qMi6zsgi6GxmKXuM+6mmcfVE7S21QUpLTZQ4vD3Kaj0s1LO3Qz5x3nW6DD+JqLncxYRbXUv09+lcs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6EWZsHz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174183; x=1746710183;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gQ4XL8BmkP07oBddLqlnRnQ5uY4XUZH2ALIHdrPqhas=;
  b=c6EWZsHzxTo/nXWz8IbxqRv9dOQYOP7AKMKezGzpLzAp5DTg0surec7I
   pzdU9SMcx9/JDdgsadTgwOj4rgsrzpL0PkWZ65/ABuzw9KxBbtzOFpr9I
   6hfqqV0b0Z9Diu7k/UpsN+CcHr5LPOpu2nd6Tvb/LPBzkHYR4Aow6on1F
   xPHKjIIcJcZzvg5j6Pcgg22GxBg/j4FXHtjPo3QfDnSKKmYHQ3WBlf7TD
   JCatdeIx+BOadZbHcP0B9DbCjXWLy+T/I0kr+52Lx7OWh0s13OAURtOSV
   OI7d7KhfcpixMwfvE68n/i80mZKqX8SAhOy8gJ2sn2332JTI3442iXFf3
   A==;
X-CSE-ConnectionGUID: eB36tTZ0RiGdgaXl4S/0eQ==
X-CSE-MsgGUID: 8bDscozjTImHvQQcnHSsIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413306"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:23 -0700
X-CSE-ConnectionGUID: DZNJ1++zQUamCAy0Wc3MPw==
X-CSE-MsgGUID: p99V4mIHQi6lXjfwtugazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356839"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:21 -0700
Message-ID: <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
Date: Tue, 7 May 2024 16:37:01 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-35-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/24 14:51, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> index is associated with the ASoC platform card supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.  SOC USB will expose more
> details about the current offloading status, which includes the USB sound
> card and USB PCM device indexes currently being used.
> 
> It is expected for the USB offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:
> 
> tinymix -D 1 get 'USB Offload Playback Capable Card'
> 0 (range -1->32)

You already gave the following examples in patch 29:

"
USB offloading idle:
tinymix -D 0 get 'USB Offload Playback Route Status'
-->-1, -1 (range -1->32)

USB offloading active(USB card#1 pcm#0):
tinymix -D 0 get 'USB Offload Playback Route Status'
-->1, 0 (range -1->32)
"

Can you clarify how many controls there would be in the end?
Also isn't tinymix -D N going to give you the controls for card N?


