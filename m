Return-Path: <linux-arm-msm+bounces-19497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6D8BFE65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076381F25097
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3175085299;
	Wed,  8 May 2024 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="holQK5JH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750AD85266;
	Wed,  8 May 2024 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174174; cv=none; b=ScMHKZZ/uIOCWQiNtpZ9eAcN4BNcOncr/aN+bCLbwswRb6zA7BFJ999UJPEiPVvge98w2jGkQfbwjg/la6KDIQ4xnhVcE/ZmSMzdfupC9HkBrvj2LQmHGYRPaA1FSq3qVFWw9UnmadiJWw6X0ixf+zx6tEIkkAyRTCcP36a8wzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174174; c=relaxed/simple;
	bh=E0Uv0/y9SRIfHmzAsDzPPoXeAyXGIWKGuhPGfCi6mjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8yC2ULrZSwYELBYlTqcW3iVMZQtlqi/uqgCUOaf5L/9zYbgQXPejs6r/t1WdPYaRQAjLlrx/238GU7ohDK4DiOZ1aDpuHuz/ZlN9X1kA3rSYfJkTp7+qSuFnUnB3qPBpxF2YlrHTdPEZ+5lu9a77mvkNkji790PI2ekdtQrSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=holQK5JH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174172; x=1746710172;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E0Uv0/y9SRIfHmzAsDzPPoXeAyXGIWKGuhPGfCi6mjU=;
  b=holQK5JH8on/WeWFZ66/hSRM7zDK0Te5waiwyakKRy3hXIXKXKOurIii
   HNsM+8V5gOU3XZAeYf4YbnC3oX20pwS2DxCUP/t8W+4lbzlapwrsHuPkp
   Eh9eQ6X0BkqEhRWDN6io9shGk/rHEJf8nW9k46oiGqrTqKYlMZaWxHvEg
   Uh5jT/hswRsUW9XV6yiXLjtAHc4NQVuWJEvwZfp4Ql03c6dRUZ4c6eDxB
   SKh1vEYJ4mgT++dHvoHUxUIx6cRgfMeAZrAO6irifK8r8XfRot10x9qcP
   Pa2U++Od60b47r78wfUUeElFVEKQbZEkw0Kx+p0vFEZmmMR9zY4N9g0nY
   Q==;
X-CSE-ConnectionGUID: giZoyUoEQDWwbOzpWBU3FA==
X-CSE-MsgGUID: CQsR+0EOTdqIV+KL1nvCPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413225"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:12 -0700
X-CSE-ConnectionGUID: mCAmmzivQ0mn329nFX4BOA==
X-CSE-MsgGUID: v9h/yVhhSMS2DKmDnbBcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356756"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:10 -0700
Message-ID: <84dc55a6-22d6-4d4f-8bce-62fa4e37702b@linux.intel.com>
Date: Tue, 7 May 2024 15:39:47 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 11/39] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20240507195116.9464-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +config SND_SOC_QDSP6_USB
> +    tristate "SoC ALSA USB offloading backing for QDSP6"
> +    depends on SND_SOC_USB
> +    help
> +      Adds support for USB offloading for QDSP6 ASoC
> +      based platform sound cards.  This will enable the
> +      Q6USB DPCM backend DAI link, which will interact
> +      with the SoC USB framework to initialize a session
> +      with active USB SND devices.

If this is set to 'n', don't you have a risk of the FE DAIs exposed in
patch 9 not being connected to anything?

