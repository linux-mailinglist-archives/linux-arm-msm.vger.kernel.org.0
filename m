Return-Path: <linux-arm-msm+bounces-85151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC7CBA928
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 13:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77C1D30094BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 12:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E3F19067C;
	Sat, 13 Dec 2025 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5r3tvR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E37081F;
	Sat, 13 Dec 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765629525; cv=none; b=OMlEhF1vrZsrhy2WOWZoofK3DcZEUAbgVzh1cppWhTRtJWxhdmpdwhT75ikYc8MAD59DKNWNKT2LL35ak7x41GWRc304nj149GKKtrDGR1VlvteYMvKitHyxmyVXp1vCIJxYi5ZCz7jtt5vIgLbgUN68jxPat19bgUvmE5i7lcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765629525; c=relaxed/simple;
	bh=G27+91EwFmRmbX5tFcElcFokL9SyhLTKle8C2wMwatA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0lS19i9EJQGCrXJ1hM91bmedjTECkUbozVLMk7EFsMdVK91ROvR43KIGz4daBMRxN5j+H4uLyripvWIfBt329GAqUaYC9QX4SWcOTlEIZp9soumdjZa0hUzHeweMEMPQWY2f7yWOXxYpzk9irFUv3rXvJsM15qSNe912mTbmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5r3tvR+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765629525; x=1797165525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G27+91EwFmRmbX5tFcElcFokL9SyhLTKle8C2wMwatA=;
  b=j5r3tvR+TyaTPyt9fa21LY2Uds+vdNEGqX45TsDZ2jPTCSnJtQvLAIEw
   QalpLTaqBODEgr0xFnnA0PZnN6cHG+9Lird3YoPLS8WGYT+/yr91SEmyY
   HGpoXqtQesHpQjYYR9qA4Q3JDj8vNkrhH9Zmz8VwUg8PRIdmqVehr6AiU
   ZDnVIOrLngtbXUJgEkhRyhWcF2GJm5G+JL4f3RrQtMBne/9FOplPgTSdN
   rFGVVcf9IUg5UAv5dIQN/0MqjGOHZ5Qo0xHB8BIuguUgxllplopH3QGsN
   93QhjGjj2rHMNgtrUfdRcbWGhxIcnRPHKqRBbxKO27bst3Z3bZlD7D4vL
   w==;
X-CSE-ConnectionGUID: dQA+iJCVRletzvNOC0kkdA==
X-CSE-MsgGUID: +6cCc8JXSY+fDkBU6iyPxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85018034"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85018034"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:38:44 -0800
X-CSE-ConnectionGUID: lCT32xwXSb+SwuspvsqIbw==
X-CSE-MsgGUID: 1zp9xd16S5KiNKF0NrC5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196591578"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 04:38:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOtQ-000000007cL-3DKn;
	Sat, 13 Dec 2025 12:38:36 +0000
Date: Sat, 13 Dec 2025 20:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
Message-ID: <202512132024.rsZaNtbp-lkp@intel.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47b7b5e32bb7264b51b89186043e1ada4090b558]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251211-142430
base:   47b7b5e32bb7264b51b89186043e1ada4090b558
patch link:    https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191%40oss.qualcomm.com
patch subject: [PATCH v8 2/8] coresight: core: add a new API to retrieve the helper device
config: arm64-randconfig-001-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132024.rsZaNtbp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132024.rsZaNtbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132024.rsZaNtbp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hwtracing/coresight/coresight-core.c:600 function parameter 'subtype' not described in 'coresight_get_helper'
>> Warning: drivers/hwtracing/coresight/coresight-core.c:600 function parameter 'subtype' not described in 'coresight_get_helper'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

