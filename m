Return-Path: <linux-arm-msm+bounces-83541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE8C8D42A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DFBE3AC91D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589F731ED69;
	Thu, 27 Nov 2025 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZCzLA30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DD30F815;
	Thu, 27 Nov 2025 07:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764230278; cv=none; b=H6nnHKvirN5xtYANfHnnDT9cNY9bctoyWV1AnL7VDKsRL4ik0z5prcnpaD7uCVjtAZtDC8RQaAMV0dvJWeURyCqJNlhp2tdOoAgk0kzsZwzoAZt6Bqi4nk0M1aJ8T9IVfRuP70YD09ZjToXCnAFWpy21xc2K1oaoHeIfdzUJDXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764230278; c=relaxed/simple;
	bh=yNRU1AlUlXfSPS6MKSgASecC+Ojm2qdh81xWUAj2EIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ug9WjWyia4+RGjVtEohPBnegpInYWBYcObZM6lmdIz0WI05hU67+io7HmK0XI92Sx8dZqtnEvIDT+wle6MWUHnv6GmjeOGwtDvyHq2iK37tlHeZrglo30HZdTnhAPEiDQuzC+m3wQRxF/5tPOfNsXe0jrusICYvOBK5lUHjHRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZCzLA30; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764230277; x=1795766277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yNRU1AlUlXfSPS6MKSgASecC+Ojm2qdh81xWUAj2EIA=;
  b=LZCzLA30n4/Ms+aYT1PGFfN6H/hLJ3KKethHYVUd/HKSHVqExUerwdzF
   /ZVXO+cyKiNhyb+IvntOdM0p5qpga0sufTSgnFgqJf0juUhQ3IsILM5BN
   P0W+7TJqsip1admTT1MkQq2Gm6VVpq4uJmEespbW9jXGkWWvOMr2+CUOn
   KUQTFJzs4k6fzr0KQfE3zhrm6zb+cBe7ay1g6vdDnXYEQ8nSaQi4zajMS
   NqO7utGa1UzKvjuMT2Me5yLgFJ2L9YSWg1VyTuMenwI6ayfK0y9iMEP29
   79SMiwIgs7RZ6u5ncBVYJsszie94VdHbqhNywPzqC69G7+N4ITv1AbsvG
   A==;
X-CSE-ConnectionGUID: BOBMwbAKRpKdbNnpnVKW/w==
X-CSE-MsgGUID: m44r5Op4RGGg3dFwGbI2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53842732"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="53842732"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 23:57:56 -0800
X-CSE-ConnectionGUID: 9F0dBLyrSoGdR7H7H+nkxQ==
X-CSE-MsgGUID: g28467r4TgOyZ+MHXAxhhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="224118859"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 23:57:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOWsx-000000003sL-05Ds;
	Thu, 27 Nov 2025 07:57:51 +0000
Date: Thu, 27 Nov 2025 15:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Message-ID: <202511271512.D8UQpGul-lkp@intel.com>
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
config: arm-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271512.D8UQpGul-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271512.D8UQpGul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271512.D8UQpGul-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/clk-rpmh.c:891:21: error: use of undeclared identifier 'clk_rpmh_clk3_a'
     891 |         [RPMH_RF_CLK3]          = &clk_rpmh_clk3_a.hw,
         |                                    ^~~~~~~~~~~~~~~
>> drivers/clk/qcom/clk-rpmh.c:892:22: error: use of undeclared identifier 'clk_rpmh_clk3_a_ao'
     892 |         [RPMH_RF_CLK3_A]        = &clk_rpmh_clk3_a_ao.hw,
         |                                    ^~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/clk-rpmh.c:893:21: error: use of undeclared identifier 'clk_rpmh_clk4_a'
     893 |         [RPMH_RF_CLK4]          = &clk_rpmh_clk4_a.hw,
         |                                    ^~~~~~~~~~~~~~~
>> drivers/clk/qcom/clk-rpmh.c:894:22: error: use of undeclared identifier 'clk_rpmh_clk4_a_ao'
     894 |         [RPMH_RF_CLK4_A]        = &clk_rpmh_clk4_a_ao.hw,
         |                                    ^~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/clk-rpmh.c:895:21: error: use of undeclared identifier 'clk_rpmh_clk5_a'
     895 |         [RPMH_RF_CLK5]          = &clk_rpmh_clk5_a.hw,
         |                                    ^~~~~~~~~~~~~~~
>> drivers/clk/qcom/clk-rpmh.c:896:22: error: use of undeclared identifier 'clk_rpmh_clk5_a_ao'
     896 |         [RPMH_RF_CLK5_A]        = &clk_rpmh_clk5_a_ao.hw,
         |                                    ^~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/clk-rpmh.c:901:14: error: invalid application of 'sizeof' to an incomplete type 'struct clk_hw *[]'
     901 |         .num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   7 errors generated.


vim +/clk_rpmh_clk3_a +891 drivers/clk/qcom/clk-rpmh.c

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
ebcb9db98bdab8 Taniya Das 2025-08-25  899  static const struct clk_rpmh_desc clk_rpmh_glymur = {
ebcb9db98bdab8 Taniya Das 2025-08-25  900  	.clks = glymur_rpmh_clocks,
ebcb9db98bdab8 Taniya Das 2025-08-25 @901  	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
ebcb9db98bdab8 Taniya Das 2025-08-25  902  };
ebcb9db98bdab8 Taniya Das 2025-08-25  903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

