Return-Path: <linux-arm-msm+bounces-83667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 439AFC90054
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 20:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00C224E12A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30D8304BCB;
	Thu, 27 Nov 2025 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5pbYQ+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE613054C3;
	Thu, 27 Nov 2025 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271771; cv=none; b=aUa3pcIxgK8Nt8xitnNk0aNgwl8MtPjJXGb+YwIa7goANxBrHwEyT6Gs/gAKQDz8CW+qbM8ag12PWk4SC0X/guhE+XrSXxLb1obeN8MyMIdaAUPygSWELFUMCT9nPVrgK30wgguH3KL4QovKJr57YDnPvM1nGW4k5lePCoJGicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271771; c=relaxed/simple;
	bh=3dA7eKTdIK6Z2EWuL1CUxNnWxGO002dwKrQWaVzfMQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAuinSJDWzTtgj6p41/WIbbW0Nzyv6BE5cRAv37x+0PFsf1G4NrFdrNTYPF4PTbvSvOlffa69ZsazWSp5ckTCm7FmJsgIvGqwTp8PQcpQAF0gaUdmNcoRK8ktWQdTpbya0k7U+if8I5BqGVpsxjCtk5EhvkHbeKj4Rcwm+O1AjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5pbYQ+/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764271770; x=1795807770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3dA7eKTdIK6Z2EWuL1CUxNnWxGO002dwKrQWaVzfMQ4=;
  b=A5pbYQ+/5bEabKU6Pwa29JdSZFStsp1+JG1QBnvmwA+XwswCELux9N7m
   wo0GzrVqzrb/7kzItf/jQlFleM6LSFLqmEGzMvljpVNlrtgvZEj67zrdW
   UXQPzm0El/7gSzAmeTiWbo7mH4cbfZ/TbuIpBiEbOtOiLLjJwnBWeBsZf
   U8hGgO7IBSn6prZCtg8vKXkfhgK4UjoSN9NXhUit1DFSZlj+FWkn7ugcl
   A2xfPI0xYc/5h8/8/gPDi5XasKj4PBRo3E6657UcxS5Toirlnjje1w7u7
   U2lP+08yxGTjmszfwrGP0IdNsScwT5TnATlzCu7j24lQHScnuzeUEu0nR
   g==;
X-CSE-ConnectionGUID: 2RNXEew2RcihRxaa1JbINA==
X-CSE-MsgGUID: dXqp8H0+SHG3At9lusjGOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66393948"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66393948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 11:29:29 -0800
X-CSE-ConnectionGUID: 19qKVL8VTRiNqYXMIIEb/Q==
X-CSE-MsgGUID: wQwkhhWVRfmX8dHiJ7yaxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="197607869"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2025 11:29:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOhgC-000000005Zv-1iSb;
	Thu, 27 Nov 2025 19:29:24 +0000
Date: Fri, 28 Nov 2025 03:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Message-ID: <202511280306.L2l4tAmD-lkp@intel.com>
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>

Hi Taniya,

kernel test robot noticed the following build errors:

[auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-rpmh-Update-the-clock-suffix-for-Glymur/20251126-021404
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f%40oss.qualcomm.com
patch subject: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
config: arm64-randconfig-003-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280306.L2l4tAmD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280306.L2l4tAmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280306.L2l4tAmD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/clk-rpmh.c:891:21: error: 'clk_rpmh_clk3_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk3_a2'?
     891 |  [RPMH_RF_CLK3]  = &clk_rpmh_clk3_a.hw,
         |                     ^~~~~~~~~~~~~~~
         |                     clk_rpmh_clk3_a2
>> drivers/clk/qcom/clk-rpmh.c:892:22: error: 'clk_rpmh_clk3_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk3_a2_ao'?
     892 |  [RPMH_RF_CLK3_A] = &clk_rpmh_clk3_a_ao.hw,
         |                      ^~~~~~~~~~~~~~~~~~
         |                      clk_rpmh_clk3_a2_ao
>> drivers/clk/qcom/clk-rpmh.c:893:21: error: 'clk_rpmh_clk4_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk4_a2'?
     893 |  [RPMH_RF_CLK4]  = &clk_rpmh_clk4_a.hw,
         |                     ^~~~~~~~~~~~~~~
         |                     clk_rpmh_clk4_a2
>> drivers/clk/qcom/clk-rpmh.c:894:22: error: 'clk_rpmh_clk4_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk4_a2_ao'?
     894 |  [RPMH_RF_CLK4_A] = &clk_rpmh_clk4_a_ao.hw,
         |                      ^~~~~~~~~~~~~~~~~~
         |                      clk_rpmh_clk4_a2_ao
>> drivers/clk/qcom/clk-rpmh.c:895:21: error: 'clk_rpmh_clk5_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk5_a2'?
     895 |  [RPMH_RF_CLK5]  = &clk_rpmh_clk5_a.hw,
         |                     ^~~~~~~~~~~~~~~
         |                     clk_rpmh_clk5_a2
>> drivers/clk/qcom/clk-rpmh.c:896:22: error: 'clk_rpmh_clk5_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk5_a2_ao'?
     896 |  [RPMH_RF_CLK5_A] = &clk_rpmh_clk5_a_ao.hw,
         |                      ^~~~~~~~~~~~~~~~~~
         |                      clk_rpmh_clk5_a2_ao


vim +891 drivers/clk/qcom/clk-rpmh.c

c035a9e265dd80 Taniya Das 2024-12-04  887  
ebcb9db98bdab8 Taniya Das 2025-08-25  888  static struct clk_hw *glymur_rpmh_clocks[] = {
ebcb9db98bdab8 Taniya Das 2025-08-25  889  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25  890  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25 @891  	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25 @892  	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25 @893  	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25 @894  	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25 @895  	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25 @896  	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
ebcb9db98bdab8 Taniya Das 2025-08-25  897  };
ebcb9db98bdab8 Taniya Das 2025-08-25  898  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

