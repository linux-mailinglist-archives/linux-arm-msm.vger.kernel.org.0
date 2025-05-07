Return-Path: <linux-arm-msm+bounces-57111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F670AAD9A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9503A1BC6CB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74205222598;
	Wed,  7 May 2025 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCiXWS+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F11A2222C2;
	Wed,  7 May 2025 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604743; cv=none; b=lT9yqfrOtKl8izqT6Tsu998z8zscvqoTqznMUlhhrx9bYt+cTyCZ91af0Hw4ejqq9IkwBbiB3pbJIQZnEYpPu6oFX+/Gdly9gFH1mW+xqyuLoZ5GawmY30AEGpfor/Y/OhY4O84gbm+eMt07hcenCbqP5djIKAaonqM7m+JNBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604743; c=relaxed/simple;
	bh=pc9ZnpfpNAW8KOYgspYmh8RTXqehB+edtu1UuEUhwVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBfu7G5J3fwTmGYdVXNho9RQuAv1u8zEsquU2yHvpz73X8GFQD4iKqSlNllonXyJWK0IkHUhGptW52ULEUJX2lelxNrGEWQ94UXx4k4soVk1wblCbZes/CtPmkMcGsmNXYOXrYh2MBINYTH7NE53172VPCz2fEbyG/Ee4vUuBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCiXWS+F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746604742; x=1778140742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pc9ZnpfpNAW8KOYgspYmh8RTXqehB+edtu1UuEUhwVw=;
  b=fCiXWS+FphLuH8p/ardWVmN2K3rxql3v/YdeJx+Fq1jA2jEuJVuzwJ5b
   u2koIiC1v/lPvXqohzgK37EI1o3nv0zrPidkHejXl+vAPk5VLSkijocKk
   8VAotCr0rHqFOcpu4Jnzx1/lR5aDNUd9jvOtKGSA4LPnA0Q9fine+k+5w
   n7/TrARTDFxQ3UKxN4MV9x9LN1VauU/FSumOputJ79C62P6oWnZjOQalX
   VQnV7m4x9JyQkvqV9er4jBF2ggU1YwFNnd5aJIXNgulnsg/EmBF6vvk8W
   7zVG4dFn+jQ+7/4Uc1nNobWJn5bnohV35YoirKwoYseeLoFvq+TmxVeqM
   w==;
X-CSE-ConnectionGUID: fP40hO3eR3GPFr8bOdxRtQ==
X-CSE-MsgGUID: 2IcmoOTyTNWzv6TDFRiLtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51969520"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="51969520"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:59:01 -0700
X-CSE-ConnectionGUID: qCHCQ2hDQBu1dMXhuqOWpw==
X-CSE-MsgGUID: HwB8VYUgR8ivGlALf/bRSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="159175157"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 00:58:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZg6-0007Mz-26;
	Wed, 07 May 2025 07:58:54 +0000
Date: Wed, 7 May 2025 15:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] tee: add Qualcomm TEE driver
Message-ID: <202505071540.hAeEOUWt-lkp@intel.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250429-140908
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb%40oss.qualcomm.com
patch subject: [PATCH v4 08/11] tee: add Qualcomm TEE driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071540.hAeEOUWt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071540.hAeEOUWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071540.hAeEOUWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tee/qcomtee/async.c:101 function parameter 'async_msg' not described in 'async_release'
>> Warning: drivers/tee/qcomtee/async.c:101 Excess function parameter 'msg' description in 'async_release'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=y]
   Selected by [m]:
   - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

