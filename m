Return-Path: <linux-arm-msm+bounces-86626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACFCDE385
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 03:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF8B430084EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 02:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42CC1F471F;
	Fri, 26 Dec 2025 02:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCGnRuqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B651EEA55;
	Fri, 26 Dec 2025 02:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766715056; cv=none; b=tOJOwpJiTq+HT2fD/DZRIP7J6cwMlMsBPKVfUANdF8tlwKMdM60A1zvMQJ5i3MDQglUDHvz3wsYzTqtyGMSjORi2JauCSz7REtrL0YcHzxJ7bHTOufuYRa5ZxtfEcRm3xhdl0ccS0enPz4zjwgLQvl8plYsYiHRDrpgqh0Tb6VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766715056; c=relaxed/simple;
	bh=qzNjEiHKek0BUViMMAly9bAFw8qrM8SiawOOPzj4tfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNmzCmd/jE48DoTq6gw2/BfMw3gn+IRm+XmgVLzGWawEr9Xey4gqiDDgAWozlbN2aLD1Khehf9L4c4o0YId4dQqY93EbwlkN+s22KismN440BtZE62HpwJzEPwl+nF4QjXZ2lf68ZzXDQWPf8r7eVHhtLPSEgqz15wWnfCvPFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCGnRuqU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766715054; x=1798251054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qzNjEiHKek0BUViMMAly9bAFw8qrM8SiawOOPzj4tfM=;
  b=jCGnRuqUW6LKPEiRWzN0rF9Za3FQtE9b0olWlD0dhl7eTQpQtlvwg7RU
   jaGVxXlSvj2lW0Ggs/fC4sdlD4rcWuUfpPBcqDSgLiHMUSCwQlTUVstNJ
   u28LMR7q8cL7BkZnm2uRsfC0luf++1xwnPfmWMpAwFXJedJ/nSuYL1Sch
   Ir5YFusmj4qQgHF7x9YI0vuzXXulcMTcrzX5zHx+loAlsLN+xEDmBe9G+
   R9zsK8BlW9QpW+8AQnVMqbn7n+GvqlFKWvuhYZmj4LOyamol0ASuz5ONt
   7GA6py5SXWeVsnImWVR6OJsOu4/vz3TqnRs2kyyYcjXTv11NA1TyScwrh
   Q==;
X-CSE-ConnectionGUID: /aK/rs2gRJyuKWXouOQBvw==
X-CSE-MsgGUID: vKyTamH2QrCLdbI7IeS6dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72347675"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="72347675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 18:10:53 -0800
X-CSE-ConnectionGUID: zW7zYLIsR6er2mASNIg1sQ==
X-CSE-MsgGUID: x2lYUp/ZRXe6oVZ/+ejGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="205216291"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Dec 2025 18:10:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYxI0-000000004c9-2OiL;
	Fri, 26 Dec 2025 02:10:48 +0000
Date: Fri, 26 Dec 2025 10:10:26 +0800
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
	Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <202512260914.h2eyiELk-lkp@intel.com>
References: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>

Hi Jingyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-remoteproc-qcom-sm8550-pas-Add-Kaanapali-ADSP/20251223-171848
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251223-knp-remoteproc-v3-4-5b09885c55a5%40oss.qualcomm.com
patch subject: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for subsystems
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251226/202512260914.h2eyiELk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260914.h2eyiELk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260914.h2eyiELk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/remoteproc/qcom_q6v5.c:331 function parameter 'early_boot' not described in 'qcom_q6v5_init'
>> Warning: drivers/remoteproc/qcom_q6v5.c:331 function parameter 'early_boot' not described in 'qcom_q6v5_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

