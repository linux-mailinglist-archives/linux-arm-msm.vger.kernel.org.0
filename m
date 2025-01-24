Return-Path: <linux-arm-msm+bounces-46020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B7A1AF21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 04:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E60188E5BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 03:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067D1D63D0;
	Fri, 24 Jan 2025 03:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYSjCxE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E029A5;
	Fri, 24 Jan 2025 03:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737690523; cv=none; b=mRDBBf/BkVTe9Z5rFdlI6/hnZGGUQGI0Kjtt20bx2SWYVDHwG2b8bRE7eUDJ/ShuCiTGVbPlSGW3PNIqohgGj/NDYnt4qL1i0fBS5ewklqXI4K6GlW0Ww+h/a857kQlUMC70oEIgI8O++0dLy6eJ7bAEgnmaE5EiCCpD15pM/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737690523; c=relaxed/simple;
	bh=ESESZlbmbscGyg08fJZIcgd/7xsDYidU9KIpFT/rdAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkgRjS+Fm8Dem/aB4Egx8+L64ElgfOLZqqsZEDd9foefceF1DxAuvTpqXpZ00bqEX7QANMzRwkNft6NgGKYaxIAQ/YOk8vU/m0MOD7QvXYnC3mU+ky2UqtU1X8/93+opoDBSzex5MEMeN63Muyr6Db166RV0Mf19+aKuQ/qkIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYSjCxE5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737690522; x=1769226522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ESESZlbmbscGyg08fJZIcgd/7xsDYidU9KIpFT/rdAY=;
  b=iYSjCxE5Q8+ua1qyg5uhDzzxqqbg/nlL1dC5nA9os9Y9qHfgAEC7HKwq
   O2miXbUzyynPiILb2BMOkYrMCqI5VI9oP/R6vDxeCkZ1zPCTlQ2QtAX9n
   qks55q/KoPer+p+c8BSVoez/kG4estTrD7FwdNmWRPVayNYYk/P7PhgJa
   w9Gv6BQSzI8GUrQlx4Lww30JN3Yms029shROYMuQE2vQG/K+cDvKWsC+M
   2oylZ66gQN4iGS2LxTDkfkBybk9yFoBAbNRbGkP7QNb2bSo/WujGlncFp
   Z8nYe6JDVLaecvNhN5CcMa4j0myar8sx4fnzNNSQITwEvyKA/njp4cUZ9
   g==;
X-CSE-ConnectionGUID: 2zltuufAS0GPJ8mc2qFc+Q==
X-CSE-MsgGUID: fRMAXE1dQiGH3uD8X5iyfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41883734"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="41883734"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 19:48:42 -0800
X-CSE-ConnectionGUID: FcaMMzkpTRiK0gGgdkLT9w==
X-CSE-MsgGUID: SIwu+aytSZuzIOueLOhRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138528984"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 19:48:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbAgM-000c63-2F;
	Fri, 24 Jan 2025 03:48:34 +0000
Date: Fri, 24 Jan 2025 11:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Message-ID: <202501241339.AZK5Ob8e-lkp@intel.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c@quicinc.com>

Hi Taniya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0907e7fb35756464aa34c35d6abb02998418164b]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-alpha-pll-Add-support-for-dynamic-update-for-slewing-PLLs/20250119-182754
base:   0907e7fb35756464aa34c35d6abb02998418164b
patch link:    https://lore.kernel.org/r/20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c%40quicinc.com
patch subject: [PATCH v4 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
config: nios2-randconfig-r111-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241339.AZK5Ob8e-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241339.AZK5Ob8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241339.AZK5Ob8e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gpucc-qcs615.c:394:15: sparse: sparse: symbol 'gpu_cc_sm6150_hws' was not declared. Should it be static?

vim +/gpu_cc_sm6150_hws +394 drivers/clk/qcom/gpucc-qcs615.c

   393	
 > 394	struct clk_hw *gpu_cc_sm6150_hws[] = {
   395		[CRC_DIV_PLL0] = &crc_div_pll0.hw,
   396		[CRC_DIV_PLL1] = &crc_div_pll1.hw,
   397	};
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

