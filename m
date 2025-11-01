Return-Path: <linux-arm-msm+bounces-79988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8EC27B6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 10:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0DF4434AD6D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 09:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB372C3256;
	Sat,  1 Nov 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnBvA1FW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C92C11C6;
	Sat,  1 Nov 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990977; cv=none; b=adjV4Hr6PXIqlbByMvsmADQ9Ran4/vfs+4/UqfX0jJFlwdoZYwVRXFKEWK2pHF4LjnG4eHWj+iuTKwYZdeeeAzLOiz2Z8PjtQW1lB7kNH9k19LwHbNiWNiVKMvBevV92qQmeymODVowHqQxPzDTp2Z1uEshzbgY08bDk5IaekzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990977; c=relaxed/simple;
	bh=92Kmi3hGY3gJbK+jA3mmu9XQ60R/d5Owd7Ceo+/Oqcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKbHNKhDdbIQx8YcZw+9dMkWBJFkvs2jPrc1s0gLyRLfS0OqtI/sTYRWVzIhvqsvURv6YffKA3WFGBoqRQ63VC8lbm4/HpmcBX3O9G7Boba8v6wqb8Jq3azHOT4B3dA5A47dkXvySDSCLESxzIamrO3x43c6Vf0mvmpDiAX97ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnBvA1FW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761990976; x=1793526976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92Kmi3hGY3gJbK+jA3mmu9XQ60R/d5Owd7Ceo+/Oqcw=;
  b=mnBvA1FWqSQcgt4tiEgyVIpZiSCRrrL/B/g/zblzwAftYoCX8aabLydR
   A2gqm7OfHRU2yDOdtJiidFwn6uqap0DtOUONhi1a+AyKhtyCJowrRwnQg
   ndFBacaZgFLxouB/sUB6UbpGiYvBXMR7JkLwR8QnTL/KA9DnKFGKOf5Ju
   Ax0NDiga+AilkszKZgd9n73G10kgK9VQPEmsIodVtm0vIEWtps1t7yLAI
   C5OgdZlX2+tqe9Uyi/tSgbsnLQQ2sfQyH+1lyUVUUf5KWEgf3iRj0EIok
   rnxrXuk7/gvqsyycw5eK8L8cCGBFrbp4Qcgkjh0C6WYdsud+e1+GknWck
   g==;
X-CSE-ConnectionGUID: 1/VuiilvTSSNzVSTqfTm/A==
X-CSE-MsgGUID: hUt5YuA8TMeoW6yGi2OQVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="66756163"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="66756163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:56:15 -0700
X-CSE-ConnectionGUID: O2fTRgmIQjmEKfVEkXCqiA==
X-CSE-MsgGUID: YLJowlZ/RgaoT/WcyKg7Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="186766072"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Nov 2025 02:56:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF8KZ-000O5w-2M;
	Sat, 01 Nov 2025 09:56:05 +0000
Date: Sat, 1 Nov 2025 17:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
Subject: Re: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <202511011702.IgpENW3z-lkp@intel.com>
References: <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>

Hi Jingyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aaa9c3550b60d6259d6ea8b1175ade8d1242444e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-remoteproc-qcom-sm8550-pas-Add-Kaanapali-ADSP/20251029-163330
base:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
patch link:    https://lore.kernel.org/r/20251029-knp-remoteproc-v2-4-6c81993b52ea%40oss.qualcomm.com
patch subject: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support for subsystems
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251101/202511011702.IgpENW3z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011702.IgpENW3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011702.IgpENW3z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/remoteproc/qcom_q6v5.c:333 function parameter 'early_boot' not described in 'qcom_q6v5_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

