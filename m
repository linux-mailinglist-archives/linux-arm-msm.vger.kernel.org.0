Return-Path: <linux-arm-msm+bounces-57143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C92AADDC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 13:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258C61895E07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 11:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B990F257AFE;
	Wed,  7 May 2025 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgsvnpMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7781233145;
	Wed,  7 May 2025 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618815; cv=none; b=ZaYlIqhs5ZOXwOlbLTvEgXxswEvrcakr4ruSDlsNqP+LODYq97VDxdCMW42EnJeQ5GS/tPhnTjDXf6eoHU1L7xQR6N3D96fO/8jpnpf7qjpcJ/popGm9/VUVkuQ8GcXF/uON/TYxamFowNuskoAE9b2GOqLfp92rVyOm/0/7zHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618815; c=relaxed/simple;
	bh=4JcYlBsxf2ipeOFDRyF84mG5KKuYrCHrCu3pXh8h5nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZwIrVSwGJYDqv4nN+a8kXcUTQpIDn5C68O6wPtbuxGACgpsdAg7dgxA08t20NVof98CPYv5a/YR7fq4RRjN3LB5W6nf6tHNYfXoPbtfLH3tCT0T5s7bGjjVHM4Hl3s1lH7p1downdQH+WZBnQ2Vf3vDzFS+Wqm28nz1cKiES00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgsvnpMT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746618813; x=1778154813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JcYlBsxf2ipeOFDRyF84mG5KKuYrCHrCu3pXh8h5nQ=;
  b=kgsvnpMTkJxNxBPBWmePTa+MVDQkHjF0l8OhOq5knmF/xIvjVcIBBauq
   r2xa3PtFHFebLUUxkJHeouZOOM6je7KjAGWn8zSouZo90g2InMZqTDFpb
   nQ7vGNCJzSXOQhPeQYAbK4RN35/d3Bn7+ciJszyvKnfKGZsqZ9aQTvEA5
   eFsIztLne8LbxQ8c/ZmZw6a9KXH+9DuUiBKTD5jRYyAi7eG7//klC8gBv
   zGdmWPUtJujIjwKJlUtP9b7CM0CNyvqaCcBj4P6f0CQPLJsslKIVnH5aY
   46PhoypySiXidUJK4OoTm+MdRUh1B7cZRTPGblaQd4WOjnC6EkSlWb3Eq
   g==;
X-CSE-ConnectionGUID: HQK2ShDcT6KAZjI/VftKDw==
X-CSE-MsgGUID: 2cJZwSRTSxe8Ck9vCWVCIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59332550"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59332550"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:53:33 -0700
X-CSE-ConnectionGUID: Y6Wip6tRQCuEQ4xOWumbTQ==
X-CSE-MsgGUID: qeovHKWERhu8FikUC689lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135898619"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 04:53:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdL4-0007ij-1R;
	Wed, 07 May 2025 11:53:26 +0000
Date: Wed, 7 May 2025 19:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: Re: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
Message-ID: <202505071921.BoUs47vy-lkp@intel.com>
References: <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>

Hi Satya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bc8aa6cdadcc00862f2b5720e5de2e17f696a081]

url:    https://github.com/intel-lab-lkp/linux/commits/Satya-Priya-Kakitapalli/dt-bindings-clock-Add-Qualcomm-SC8180X-Camera-clock-controller/20250422-134531
base:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
patch link:    https://lore.kernel.org/r/20250422-sc8180x-camcc-support-v1-2-691614d13f06%40quicinc.com
patch subject: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071921.BoUs47vy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071921.BoUs47vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071921.BoUs47vy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/camcc-sc8180x.c:403:37: warning: 'cam_cc_parent_data_7' defined but not used [-Wunused-const-variable=]
     403 | static const struct clk_parent_data cam_cc_parent_data_7[] = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/camcc-sc8180x.c:399:32: warning: 'cam_cc_parent_map_7' defined but not used [-Wunused-const-variable=]
     399 | static const struct parent_map cam_cc_parent_map_7[] = {
         |                                ^~~~~~~~~~~~~~~~~~~


vim +/cam_cc_parent_data_7 +403 drivers/clk/qcom/camcc-sc8180x.c

   398	
 > 399	static const struct parent_map cam_cc_parent_map_7[] = {
   400		{ P_SLEEP_CLK, 0 },
   401	};
   402	
 > 403	static const struct clk_parent_data cam_cc_parent_data_7[] = {
   404		{ .index = DT_SLEEP_CLK },
   405	};
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

