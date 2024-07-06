Return-Path: <linux-arm-msm+bounces-25408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1159291FF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 10:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C9F21F210E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 08:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0D42A85;
	Sat,  6 Jul 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kc/JnFYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A32837F;
	Sat,  6 Jul 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720255385; cv=none; b=ILNWfn4EjsT2syQY0POlpFPQz4aV+IIG6yV0WEMsmNnntO8gjrPlul4s3L27f/uzmy9oc1uvurXfts3NDldyT+mAFrTB0oQW3ylL17v0WyFJa0jHDDNSBCRxSFV9fw+OpRLe7fxyUEmfUaXjPMYuNSejyGVQI5zGpgJmyVn1N0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720255385; c=relaxed/simple;
	bh=zealATdd/by23EUllnb0nD8gvGCX7tmsTFaN4kL2Ys8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P+3BJBuo9wolexlTr/0c+4UvBOc51JejqNQL1LudGVEjKEtsLfAtN84PklrF+qyt8x+BDYblXba69ThoGiLeDX+N8HJWGaBxli+bZsiS44yJ/GPB9OnpDgo2BksJmTMsJ3AR9R82QvWffn9SiBd3vwPTJmbuQ/kePAzXPuhzsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kc/JnFYM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720255384; x=1751791384;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zealATdd/by23EUllnb0nD8gvGCX7tmsTFaN4kL2Ys8=;
  b=kc/JnFYMR0nZsKWyUy3ex+bw68buG6f5ak8n5Vyt1zpk55tyI/05wj7O
   7mGAykjF0L0JQKQeeKB7+jgXxYJYMo6KbeoIN7LWAB6Gw/YJXFHqX4ADv
   d9FoHznMUUMR+T3UVJHgcYMqbf8padVRf8FtJJEsWxjuZ5yhz9DUaBG9F
   lY1jttUSfSvP1Zmbsuwyg9o3pFbDpx7m3SEL0hX03+BeSjE3Gbxu/VypB
   BfOowo2wwrlGmYYCOarDnFRU9EVZJa0Llg94EyTWPXSMpo4dyVkf5Qshu
   5+Blqehd2UJrTaSuxwVDiefEF8+yZqOr9u6UtuavG1IgxAkU/rzN6uRTy
   g==;
X-CSE-ConnectionGUID: 4HpTBraxS9u4aj++svL6YQ==
X-CSE-MsgGUID: dWGBrlnkR6SikFhJOIqG8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34967181"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="34967181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 01:43:04 -0700
X-CSE-ConnectionGUID: cjUSCeYxRo+oYokUD4zgrA==
X-CSE-MsgGUID: p/CLed3hSrOzPsmTFyV7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47011783"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.111])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 01:43:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 6 Jul 2024 11:42:56 +0300 (EEST)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform: arm64: lenovo-yoga-c630: select
 AUXILIARY_BUS
In-Reply-To: <20240626-yoga-fix-aux-v1-1-6aaf9099b18e@linaro.org>
Message-ID: <15cf1f84-992b-59dc-d888-7a8972b0e0f4@linux.intel.com>
References: <20240626-yoga-fix-aux-v1-1-6aaf9099b18e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Dmitry Baryshkov wrote:

> Add missing selection of AUXILIARY_BUS as the driver uses aux bus to
> create subdevices.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406260704.roVRkyPi-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/platform/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 8c103b3150d1..e612cbe06aec 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -35,6 +35,7 @@ config EC_ACER_ASPIRE1
>  config EC_LENOVO_YOGA_C630
>  	tristate "Lenovo Yoga C630 Embedded Controller driver"
>  	depends on I2C
> +	select AUXILIARY_BUS
>  	help
>  	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
>  	  Lenovo Yoga C630, which provides battery and power adapter

Applied to platform-drivers-x86-lenovo-c630 branch and merged it into 
for-next.

-- 
 i.


