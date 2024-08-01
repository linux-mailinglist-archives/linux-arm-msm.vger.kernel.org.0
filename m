Return-Path: <linux-arm-msm+bounces-27706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0709447A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C10C01C22CE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B103118950B;
	Thu,  1 Aug 2024 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZPkOyuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C82187FF1;
	Thu,  1 Aug 2024 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503523; cv=none; b=edqbMKvXbp637py7ehqO4XWRtNZ+YkbNgLAAeej/SwIjkVfI0pvN516zIEqfiWyxEuwp4iWU10lytRePmj3lf4MWOduUdTGF3+/emJQiIfqP+gzVqi6IJb50W1hrGHlRBSLN8uxmyqOAflMuNoL41IjD6QOJBQ7Ey2WXXphov9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503523; c=relaxed/simple;
	bh=5toF+PsLMmG3nsBrKM94Rd7v4kxGJrsS2p+u19WypBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISsOXyaaJpjTHqaPanfvBVbpmQlsLfQQiN+SyDMmWD/nFt2eMQCx2GnDlifPGUk8iZl5oku2DYp6DoBb19If5b9qDZ01KTFAUY1is70jkXKgWv0x985Cwwt1D/9q5NTcbFKMup6hgGxLX1U5i8r4Qeg0gNp3Jz6b5EYFTA9IqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZPkOyuJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503523; x=1754039523;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5toF+PsLMmG3nsBrKM94Rd7v4kxGJrsS2p+u19WypBE=;
  b=OZPkOyuJCejcT0W3AQXp+JOCUHDmmLzp9KZj834wl3tEWuroa3KuyNu6
   5rFB4EF1dW+2MRLulXkvMetBv5Gx/ZLaApe2Zf/htL2gQ28hxexKjSyUR
   ijJ0rrQi4czDNh/KaMonqVGahtdcTyR3cm7EnA67InH/iidgMjrrzqvFW
   Jb8RC4bd1ccQqxD+1wkX+w7FBCKRWa0kncPTvBx/lxC/XjsLSLv/Wnyz8
   bDh2CdftJOoqj5/hwL9JsPwVlLshIzXAkdNPL2H0/SHgmGVhyyeBfKstf
   kcAyvsvZbu0HyorW9QMvU2KWdyhrNN7D0at9Ych/GY0sa2TjZtFv4PXPK
   w==;
X-CSE-ConnectionGUID: whdhqU3bScGMxtSG9Gn/Bg==
X-CSE-MsgGUID: tDz3r9zxRUWs7S4lFeXj2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383532"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:36 -0700
X-CSE-ConnectionGUID: wcqSdmgMTj+f0XjaXEriKA==
X-CSE-MsgGUID: qPY3CEHgSiuP5J8I3USl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089896"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:29 -0700
Message-ID: <33f0e72e-aff8-4733-bf71-dd592a99de97@linux.intel.com>
Date: Thu, 1 Aug 2024 10:30:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 15/34] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240801011730.4797-16-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-16-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/24 03:17, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback endpoints, so that the main
> application processor can be placed into lower CPU power modes.  This adds
> the required AFE port configurations and port start command to start an
> audio session.
> 
> Specifically, the QC ADSP can support all potential endpoints that are
> exposed by the audio data interface.  This includes, feedback endpoints
> (both implicit and explicit) as well as the isochronous (data) endpoints.
> The size of audio samples sent per USB frame (microframe) will be adjusted
> based on information received on the feedback endpoint.
> 
> Some pre-requisites are needed before issuing the AFE port start command,
> such as setting the USB AFE dev_token.  This carries information about the
> available USB SND cards and PCM devices that have been discovered on the
> USB bus.  The dev_token field is used by the audio DSP to notify the USB
> offload driver of which card and PCM index to enable playback on.

It's just fine if the AFE stuff relies on the 'port' definition/concept,
but I don't think it needs to pop-up at the ASoC/USB level.



