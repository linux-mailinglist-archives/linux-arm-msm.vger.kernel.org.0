Return-Path: <linux-arm-msm+bounces-35154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 713879A577A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 01:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC29281D02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 23:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B5217C200;
	Sun, 20 Oct 2024 23:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtriHKw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8ED2260C;
	Sun, 20 Oct 2024 23:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729467029; cv=none; b=YpdwY3hazbZcsZcRhLnxCeaF1tTDEGl1c/TkEdYNFkVjzooPipRvEqC35IyaSNU853w9t6Ap8xMGluFvoxmCSlb8PiOqnk4Qcf8VFIu9eMvMTmPAfoQB0dovBZssHtToWyPruvyV27WpttCsZ98cO9YF7GMpE9stN0DZh1Mh6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729467029; c=relaxed/simple;
	bh=Kz1NHj5ItKEdf8tMz+c3LHflG9kb1GvIXDVJI6QUaw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2a/j0sYWdUZQn8r6NHd6B0bSrZXOq9oOU/zbXKcVMe9F7cPkFpIrij4hYfX0vzyp07rQiXhTJCvJF3mBT1/6I8Xgo0a/f86IthKe79M9DJfiuT4bvUnUKL3LyORU6oPZRxRBa1KxPHjybw79X0trtklYMstnbQOAlSQkB51dS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtriHKw2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729467027; x=1761003027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kz1NHj5ItKEdf8tMz+c3LHflG9kb1GvIXDVJI6QUaw8=;
  b=CtriHKw2rD/Lr6AQNnLw+zwGZH4fL2quU5leVX10fv8xtS1H07tO1sTO
   O4VccSqh8az1lVTnHNxCL5kS1xxZypG81ODjUJPAPkeqnzxxvlqB8OWMe
   uzcK7FY3a6DgLb5aiROpDokMeyjQbSFM7PnJH4Rj1DncEJnTx36WHztNp
   65YxDvb/kxIOB2KmG1urrwXGhTs1ILxsLnZVb5GX2uqVD48ZLubTjQjtG
   mZvSBTpQ8/NmLc9pFicv6FdjNL3vLRaTkoU6V0F+Ym0CaCl6Vadp+LnPJ
   fmrzStW8A9+lnvAbK2Eh4Jo3b4HlZ9SM1sQCxQJmuNUAe8XwOqTYJ8snu
   Q==;
X-CSE-ConnectionGUID: /XgY52rmQR62Tv8AmBu+lg==
X-CSE-MsgGUID: x3kfdDN1TD2YBp+va5SDaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="31801389"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="31801389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 16:30:26 -0700
X-CSE-ConnectionGUID: TRYXLaZQS6iTM3Ws5weyAA==
X-CSE-MsgGUID: ZE26uQnrSH6OO8a5PFhIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79010962"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2024 16:30:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2fNM-000QtJ-0h;
	Sun, 20 Oct 2024 23:30:20 +0000
Date: Mon, 21 Oct 2024 07:30:00 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 11/14] clk: qcom: add support for GCC on SAR2130P
Message-ID: <202410210706.cTMYfYvA-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410210706.cTMYfYvA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210706.cTMYfYvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210706.cTMYfYvA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-sar2130p.c:269:37: warning: 'gcc_parent_data_5' defined but not used [-Wunused-const-variable=]
     269 | static const struct clk_parent_data gcc_parent_data_5[] = {
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-sar2130p.c:264:32: warning: 'gcc_parent_map_5' defined but not used [-Wunused-const-variable=]
     264 | static const struct parent_map gcc_parent_map_5[] = {
         |                                ^~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-sar2130p.c:259:37: warning: 'gcc_parent_data_4' defined but not used [-Wunused-const-variable=]
     259 | static const struct clk_parent_data gcc_parent_data_4[] = {
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-sar2130p.c:254:32: warning: 'gcc_parent_map_4' defined but not used [-Wunused-const-variable=]
     254 | static const struct parent_map gcc_parent_map_4[] = {
         |                                ^~~~~~~~~~~~~~~~


vim +/gcc_parent_data_5 +269 drivers/clk/qcom/gcc-sar2130p.c

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

