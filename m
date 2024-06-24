Return-Path: <linux-arm-msm+bounces-24008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B867A9153B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 18:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EDC21F24C62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F0E19DF80;
	Mon, 24 Jun 2024 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIXSY2SU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B201E19DF5D;
	Mon, 24 Jun 2024 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246471; cv=none; b=jiRpsq/kD5RTLHeRweXgk01rsmG7VvsxRHxel3TAZ7aJQ0K6GSd7w4D4bHif9bNDcTnbtvaDjbnQIeL5DrThYKVGdcTIm9ClymAVJtTW4cgjK4XZa0m8o5D42KSl5efUmveiHxbb0vv1mD+HX0qDJITWLb6K4pVTK2vlwFlkhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246471; c=relaxed/simple;
	bh=YjtWJQm9QqPK9v0wi70UmdCLPRdILJAl2N3WIxmkRgw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W0eTg2wemkVzDJSwE9dsq6z98HqmCRKs89ZNBKWc13WwO8KTsEgHIIjRj6JaJRwxUfHK/BGJWPuo3WER6ph9aihL3GUwkAUO8kG9WaR0LRtgS2kgE3TFwFbWMXOymst2lQ9RY3itm8viAsjVYwWNPgLN7kU/TrOjuQ67TTJbuIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIXSY2SU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719246470; x=1750782470;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YjtWJQm9QqPK9v0wi70UmdCLPRdILJAl2N3WIxmkRgw=;
  b=LIXSY2SUSl6v4Bquvyqm8/LpIChFRiDcgllVb59BrkXiZxTwR+clq6Do
   OnT14PnISDzRc+ogcCZH5lEHoK43TqFXA3Cm6a/sy8GrRknsTgoTPEbYD
   YqcHgOab2kZTxvqgXtGFbHp3fEvGI060H+7WDVvEUyJuqpmLIFYD2R1pr
   fzau30SLordJfVIXRAMcKaqNRR62vmi3VbjtRNcqpH2qCnhzJ8tgi0L3Z
   eZLD25i4gQdnuy5xhDAeX07BPG8yizYDUVWxYFGuj0E96nBAdMGluWFzQ
   5Rge3+X6QV+HlQt4GP4oGcqtdga28iWpmvczsZQBCDLBO3GG9sWXljVA1
   Q==;
X-CSE-ConnectionGUID: /kPfGTUjQd6Dx6LSJi/N7w==
X-CSE-MsgGUID: e5Gj7rO1Txa/sKNsraMztQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16356859"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="16356859"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 09:27:49 -0700
X-CSE-ConnectionGUID: sV4ipX9bQmGll7jRK377kA==
X-CSE-MsgGUID: 9Xmm6K/BS7C9/MoeqSa4Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="74578186"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 09:27:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Jun 2024 19:27:41 +0300 (EEST)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
cc: Bjorn Andersson <andersson@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Konrad Dybcio <konrad.dybcio@linaro.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v9 1/2] platform/arm64: build drivers even on non-ARM64
 platforms
In-Reply-To: <20240624-ucsi-yoga-ec-driver-v9-1-53af411a9bd6@linaro.org>
Message-ID: <645b8ae6-10ad-11f9-eb18-a931f258bfd2@linux.intel.com>
References: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org> <20240624-ucsi-yoga-ec-driver-v9-1-53af411a9bd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Dmitry Baryshkov wrote:

> The Kconfig for platforms/arm64 has 'depends on ARM64 || COMPILE_TEST'.
> However due to Makefile having just obj-$(CONFIG_ARM64) the subdir will
> not be descended for !ARM64 platforms and thus the drivers won't get
> built. This breaks modular builds of other driver drivers which depend
> on arm64 platform drivers.
> 
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: 363c8aea2572 ("platform: Add ARM64 platform directory")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/platform/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index fbbe4f77aa5d..837202842a6f 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -11,4 +11,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
>  obj-$(CONFIG_GOLDFISH)		+= goldfish/
>  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
>  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
> -obj-$(CONFIG_ARM64)		+= arm64/
> +obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/

I made a second ib tag with this patch.

I'm a bit disappointed that LKP didn't catch this in the patch stage, it 
feels almost as if it never built any of the versions.


-- 
 i.


