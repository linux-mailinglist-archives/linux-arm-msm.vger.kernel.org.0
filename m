Return-Path: <linux-arm-msm+bounces-26929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5893AA08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 01:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483BC1F2265F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 23:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC30149C5A;
	Tue, 23 Jul 2024 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyZYWoOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2F4F615;
	Tue, 23 Jul 2024 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721778842; cv=none; b=CzYP2gsmYHPUtB0cYC8P/Zn2MzM5bTSJ1HPbgg5ePAuJig0Ci7g+u+863emrQrYa6pmVkb59f2cIoP+gLbh+pRgo1r8tjEi/sN+5XCSAMmNvV+q9ZQfAhZJPBk0CKm/MJ01h052wXOiBswoRYIUgexaCJHIG+yxxkjUMJw3H45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721778842; c=relaxed/simple;
	bh=AyDCjWs9pcLXSD/LTvowfTw3/Gd6OzHsLDwdnEgsUak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT5QmFM3vhbBxqN44ZVk34oPMDqByLdA34XLNiiA7yfcGXcGU/3IAvVmB3uPlwopR2YlgqnM/ntATIB5DhpFaXLybHM1aiDiEQU4N6ZNkTKjfWKKxEt7uwBPOJ4q6QnNWLxW5NM5A7HK9oH/mempBc5b/AxLz75WFzacsFt2u5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyZYWoOG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721778840; x=1753314840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AyDCjWs9pcLXSD/LTvowfTw3/Gd6OzHsLDwdnEgsUak=;
  b=MyZYWoOGaEGngHPwsqI/EAtD9+bkXp14FZz5yswJ6orl9o3CF11zm+nF
   I4nSUI0xYXvBuujLKti0FwdgaaQ1JzpK/DYULhaCeYH3avMeKur7pV6Vy
   1SmwbLwwIH5/aMUDmzefGJTpzQzRBZyWQgGlF1mvkz2U9XBYwaosu5q3e
   n1X4I/LfSu2+9wqsHEBdItKcm9xI3ZtNQXWVCq6jM++eKloa5MjRS6Ek/
   l8C3nnUyhggRdpmfuGs5rDvMoIW+6m+0fMUtbWxsEYW5UV2PBmeIJOMwa
   wrC73isklDOsDt04lzC52fHwWX4wri0pA53ROGSk2vsEG1o824MprWgjB
   g==;
X-CSE-ConnectionGUID: Jsx9mn3LSkOlJI11HDy/NQ==
X-CSE-MsgGUID: cp+H68+lTWq37bnSi7izbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23297282"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="23297282"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 16:53:59 -0700
X-CSE-ConnectionGUID: qe4u3zLjSzeWlUmx7W9W2A==
X-CSE-MsgGUID: 1ghdFbFsRBuu2NnAhCGGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="57224743"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jul 2024 16:53:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWPKL-000mT6-2P;
	Tue, 23 Jul 2024 23:53:53 +0000
Date: Wed, 24 Jul 2024 07:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: pma8084: add pon node
Message-ID: <202407240711.f7qtQGZG-lkp@intel.com>
References: <20240723-pmic-bindings-v2-3-e1cd614f8c4a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723-pmic-bindings-v2-3-e1cd614f8c4a@linaro.org>

Hi Rayyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on dee7f101b64219f512bb2f842227bd04c14efe30]

url:    https://github.com/intel-lab-lkp/linux/commits/Rayyan-Ansari/arm64-dts-qcom-pmi8994-Add-label-to-wled-node/20240723-175020
base:   dee7f101b64219f512bb2f842227bd04c14efe30
patch link:    https://lore.kernel.org/r/20240723-pmic-bindings-v2-3-e1cd614f8c4a%40linaro.org
patch subject: [PATCH v2 3/3] ARM: dts: qcom: pma8084: add pon node
config: arm-randconfig-051-20240723 (https://download.01.org/0day-ci/archive/20240724/202407240711.f7qtQGZG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240711.f7qtQGZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240711.f7qtQGZG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/qcom/pma8084.dtsi:31.19-20 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

