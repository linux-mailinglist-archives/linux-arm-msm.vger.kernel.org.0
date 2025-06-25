Return-Path: <linux-arm-msm+bounces-62561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7753AE8F2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 22:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8D616E95C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D599F2D3A8C;
	Wed, 25 Jun 2025 20:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFJvusXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98E1FE47B;
	Wed, 25 Jun 2025 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882108; cv=none; b=lPuDGtAVmYbK8nvw6avknZVQrziNFMlikSBjO7Ymb0QM6o69l8tCHKhfVW1KL1F4arkVXNU2VR3k748CKxnDM8Ts5PUpZUG3Uz2QfvKT7aZroJ2Te1e6zxOTbxPGtF0+0qgXPT0UuAEpXquVCgdesoWY7L4dE0uczVsFuZSmAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882108; c=relaxed/simple;
	bh=xUpMEIzpFjRDAERBUMObbNI+oufFrlvJkWbPLwaUzp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etBUnZUQTQCsToX2sWMTogAZVQ5GfbdC5xirLfPl3TZ0kbefPQ8uci7dJymeENqMMNfYQtfRYK4nzw+3yiZ8iiMphlZEc/m7MK6IxuKDhC+JW0HVDioDEAv5pq0ZmurGcsGG4v2Nzk7v17/9Tg+SpMvBdgvUB+Pjq/SlGMNtljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFJvusXS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750882107; x=1782418107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xUpMEIzpFjRDAERBUMObbNI+oufFrlvJkWbPLwaUzp0=;
  b=dFJvusXSSnTUtEoMw+ge5lgkqAsi2YMxLLvv0V/xwhkZ/bsjImzSEPmC
   PEMKIMD1Bfs/PwlZeBJ5lcZarbauTwHOeijR5Ltltg7JXTBuq55hCVgBn
   TMuHYW5vWPm/PgMXylaLHeFLZi4N4wRy1xqisFNXBpJEObgWKsIrPYef7
   Z2uBtYL/P6rTq/RV5uaRHu8D6sOww6PdT+MjRYHG37U3xnxD5MXdJ0LvW
   KC2m5LYYj62Mfi7zSckoYU3VzlVTUd/xmeclOW99jTz9cRltAGCuZI3Z+
   G52/YB7eoBl0GFsE75rDen+rYn37F38FBgN3TZDCPhbc32LEsG7b4uNvg
   A==;
X-CSE-ConnectionGUID: +UaOQrb5Q/mlId2UukCGXg==
X-CSE-MsgGUID: sV/HvzV3TAeWvbnSQxuxPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766168"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="63766168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:08:26 -0700
X-CSE-ConnectionGUID: YpEsUcroSXaqWKY9aziD2Q==
X-CSE-MsgGUID: Tn6UOuwBSeC9ZqjURSczQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="153033344"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUWPt-000TRa-0m;
	Wed, 25 Jun 2025 20:08:21 +0000
Date: Thu, 26 Jun 2025 04:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 08/10] clk: qcom: Add Graphics Clock controller (GPUCC)
 driver for SM7635
Message-ID: <202506260357.DyPYkEZb-lkp@intel.com>
References: <20250625-sm7635-clocks-v1-8-ca3120e3a80e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-clocks-v1-8-ca3120e3a80e@fairphone.com>

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Weiss/dt-bindings-clock-qcom-document-the-SM7635-Global-Clock-Controller/20250625-171703
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250625-sm7635-clocks-v1-8-ca3120e3a80e%40fairphone.com
patch subject: [PATCH 08/10] clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250626/202506260357.DyPYkEZb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260357.DyPYkEZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260357.DyPYkEZb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gpucc-sm7635.c:135:37: warning: 'gpu_cc_parent_data_2' defined but not used [-Wunused-const-variable=]
     135 | static const struct clk_parent_data gpu_cc_parent_data_2[] = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gpucc-sm7635.c:131:32: warning: 'gpu_cc_parent_map_2' defined but not used [-Wunused-const-variable=]
     131 | static const struct parent_map gpu_cc_parent_map_2[] = {
         |                                ^~~~~~~~~~~~~~~~~~~


vim +/gpu_cc_parent_data_2 +135 drivers/clk/qcom/gpucc-sm7635.c

   130	
 > 131	static const struct parent_map gpu_cc_parent_map_2[] = {
   132		{ P_BI_TCXO, 0 },
   133	};
   134	
 > 135	static const struct clk_parent_data gpu_cc_parent_data_2[] = {
   136		{ .index = DT_BI_TCXO },
   137	};
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

