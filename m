Return-Path: <linux-arm-msm+bounces-35155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F59A5783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 01:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE6C51F2188F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 23:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63F6192590;
	Sun, 20 Oct 2024 23:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWyHz8BQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6457E28689;
	Sun, 20 Oct 2024 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729468351; cv=none; b=FmQkGYGfYkSHSBpX5GlAQf4/PI6WXa0qjSYLB6F7K9qdZnHiL1yFblDld8kmIXO0Y8wShalXkdTLoOCYLRxj6fbwJDOklRybsPxsblBFm2/X8jW0hNDOiTD1rUVS++FKu3Xru9R47bkQgwuQginv+5SqN91bCJdXAYEAMZzKV1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729468351; c=relaxed/simple;
	bh=r5t6ezWrj8tM5XbRLWl015a2nIv4PHGA1l1F7OKUVyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLOvk3fjV0h8vEYftqfO4SclpkoIg9QgLsbhjuzMK8zUrNIKsNjNSWjUwPAgHTWHYfwQTFtNe3T9yJ7bFxrLXk2ArpEG6JhD5dcdpqz8dDFEdhwgZnGBONhK6/a464Qxsj53WjAGa/vj6nlT0PNypC41CUBpc7HKZIUimYUkTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWyHz8BQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729468348; x=1761004348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r5t6ezWrj8tM5XbRLWl015a2nIv4PHGA1l1F7OKUVyU=;
  b=ZWyHz8BQR9GCEZcQLZkEPFlu+zmia2us2U6sDQCCB4mNhoHAHH+Islik
   dTzdpHPJ9JVfQAhuXvu6BzmYqrXtPxuePoj2dyskj79QH+rmV/1BsxX5O
   Q17fpC6z3GW4EsszAasZsR3FVnQIKkIbTkbXkA08wmGmQmshVqiReTIpR
   hEjPNYFYEcI1S4j4PTV4woU9lSW2WuIF4c8KOUWCMTRVaXJV+Gwf47KUH
   7xJO9tijtrRUPk+V1vL+3fTJWJnZ8DUTc7Dt+atBECpb+/fYsBJ9fsCXv
   cIMlFkbo1+3QVv56mrvfldM5w/YO0GGlQJQCw48jNKi74EONJmkRFflau
   w==;
X-CSE-ConnectionGUID: 422SdtzSQh+Dxu+W6xxcYw==
X-CSE-MsgGUID: LEfAN0SNTfOjLwscPgMkNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28366954"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="28366954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 16:52:28 -0700
X-CSE-ConnectionGUID: prbo0Ih9TIGcZb3dmFM1RA==
X-CSE-MsgGUID: gFiR32AlQgGK71jkFRmtag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="83944143"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Oct 2024 16:52:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2fif-000Qtr-2v;
	Sun, 20 Oct 2024 23:52:21 +0000
Date: Mon, 21 Oct 2024 07:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 11/14] clk: qcom: add support for GCC on SAR2130P
Message-ID: <202410210734.7rGICRUi-lkp@intel.com>
References: <20241017-sar2130p-clocks-v1-11-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-11-f75e740f0a8d@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7df1e7189cecb6965ce672e820a5ec6cf499b65b]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-clock-qcom-rpmhcc-Add-SAR2130P-compatible/20241018-010608
base:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
patch link:    https://lore.kernel.org/r/20241017-sar2130p-clocks-v1-11-f75e740f0a8d%40linaro.org
patch subject: [PATCH 11/14] clk: qcom: add support for GCC on SAR2130P
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241021/202410210734.7rGICRUi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210734.7rGICRUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210734.7rGICRUi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-sar2130p.c:254:32: warning: unused variable 'gcc_parent_map_4' [-Wunused-const-variable]
     254 | static const struct parent_map gcc_parent_map_4[] = {
         |                                ^~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-sar2130p.c:259:37: warning: unused variable 'gcc_parent_data_4' [-Wunused-const-variable]
     259 | static const struct clk_parent_data gcc_parent_data_4[] = {
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-sar2130p.c:264:32: warning: unused variable 'gcc_parent_map_5' [-Wunused-const-variable]
     264 | static const struct parent_map gcc_parent_map_5[] = {
         |                                ^~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-sar2130p.c:269:37: warning: unused variable 'gcc_parent_data_5' [-Wunused-const-variable]
     269 | static const struct clk_parent_data gcc_parent_data_5[] = {
         |                                     ^~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/gcc_parent_map_4 +254 drivers/clk/qcom/gcc-sar2130p.c

   253	
 > 254	static const struct parent_map gcc_parent_map_4[] = {
   255		{ P_PCIE_0_PIPE_CLK, 0 },
   256		{ P_BI_TCXO, 2 },
   257	};
   258	
 > 259	static const struct clk_parent_data gcc_parent_data_4[] = {
   260		{ .index = DT_PCIE_0_PIPE },
   261		{ .index = DT_BI_TCXO },
   262	};
   263	
 > 264	static const struct parent_map gcc_parent_map_5[] = {
   265		{ P_PCIE_1_PIPE_CLK, 0 },
   266		{ P_BI_TCXO, 2 },
   267	};
   268	
 > 269	static const struct clk_parent_data gcc_parent_data_5[] = {
   270		{ .index = DT_PCIE_1_PIPE },
   271		{ .index = DT_BI_TCXO },
   272	};
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

