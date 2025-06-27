Return-Path: <linux-arm-msm+bounces-62731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3FAEB02E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 09:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 289A57AB742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 07:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B964321ADC9;
	Fri, 27 Jun 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SngtEmeg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E224201004;
	Fri, 27 Jun 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009792; cv=none; b=ADFOzjzk1EBW+mmXCbjlZToPUjaT7dfihtUnIWa+6Pn79EXmhnAWzCUd71vPbe9GWGipbsEJnhgcWqOno3K1TnQ4sv23U5bn2jzAzwi9AD22KGcyUSnaxJkFkg1mfj53g3oIBNzdKdWu/UBfIzBQjzhSbGb0/Avx4IqHhMSt4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009792; c=relaxed/simple;
	bh=R7MFiZ9r/m2icBqFE8z942btjxdQ3uI5L9jjyYNHCUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sl4zZehs/iqXHb38p3tKV0S2TfiatNrkWdRSgPl502ec3/gqwGpqf3D2XazlBpaKAkoFXslotYosW16MNwba37XBt59hyWm51g84xMaDG/MCnY/lmXl1gPVqrgDVPXvqhZfKfKjouNjXEhFNqKHjNWCdEqX2wDob+QkgJE+f5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SngtEmeg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751009792; x=1782545792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7MFiZ9r/m2icBqFE8z942btjxdQ3uI5L9jjyYNHCUk=;
  b=SngtEmegXuBEkY4VT25y9JMPKFNUeFsyWKqyTTaR7xAQeL3MwEzl73Ex
   /mRfA6D7TQM5LeOsW/bbRNyZXEVSeICxyh/HV0ZiO6I2A+V0wsBac8Efy
   ojSbWS8NFIS80sYih0a5tizG4PoN26Gx7kgKosFrBmAgwx8okEzy+lelv
   eCB6GwYS8dOnfkZ9u22ALzxfw0yv0sbJC98PPYRFjWnziyo4W/VrVofbm
   mrF/RJAJ4jOzfCO2KqZ3JF0wLN1J6QwAoGrESVkxAzLJMoxAgJRorEQMG
   UCfIaFGPiEwcHnzKmBEofJAlRFoYxS6d/d4s8ICU1RnHKQHoo/5OS3wlL
   w==;
X-CSE-ConnectionGUID: wJX46o5SRoO9nxLIynDtgg==
X-CSE-MsgGUID: qHkfZyK4QNiqY22oiEJnfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53190634"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53190634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:36:31 -0700
X-CSE-ConnectionGUID: Kh5t6bgAQ1+j0Xkx9PE3SA==
X-CSE-MsgGUID: j0Uw8pEZQUqEGpTzy5l4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="153256700"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2025 00:36:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV3dI-000VvV-0Y;
	Fri, 27 Jun 2025 07:36:24 +0000
Date: Fri, 27 Jun 2025 15:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v10 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Message-ID: <202506271519.GYlfvTOB-lkp@intel.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8@quicinc.com>

Hi Taniya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ae2aaafb21454f4781c30734959cf223ab486ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-alpha-pll-Add-support-for-dynamic-update-for-slewing-PLLs/20250625-184903
base:   2ae2aaafb21454f4781c30734959cf223ab486ef
patch link:    https://lore.kernel.org/r/20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8%40quicinc.com
patch subject: [PATCH v10 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
config: arc-randconfig-r121-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271519.GYlfvTOB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271519.GYlfvTOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271519.GYlfvTOB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gpucc-qcs615.c:396:15: sparse: sparse: symbol 'gpu_cc_qcs615_hws' was not declared. Should it be static?

vim +/gpu_cc_qcs615_hws +396 drivers/clk/qcom/gpucc-qcs615.c

   395	
 > 396	struct clk_hw *gpu_cc_qcs615_hws[] = {
   397		[CRC_DIV_PLL0] = &crc_div_pll0.hw,
   398		[CRC_DIV_PLL1] = &crc_div_pll1.hw,
   399	};
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

