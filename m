Return-Path: <linux-arm-msm+bounces-45598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5E9A16E16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785C33A3179
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C581E2842;
	Mon, 20 Jan 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9J5ISfQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC818BBAE;
	Mon, 20 Jan 2025 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381992; cv=none; b=R2nAELLPWYIC+GzyIg+toVw1grwHx5I2Pdbb1WlBZTOOH87ijZgwxZry1kVAEXIdFAkI6b3FJ8PliFjAOG2fktEJFd619PEaYoz3Txjm4rP1ytTVepO5MDzKF/PWEfGxRlVdcIdusco9K1Yp1gPn78137GpG/iwOhxkJO6Arl4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381992; c=relaxed/simple;
	bh=1uS4z3qSW4B3HL0w5ziOk7BdN1z2O3FF9kgKHr+m/4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVyagtFgEFXH32us7Zm+bO9kH/X6pxWuwSNyXPfg0F3emNpItFxLwIWsqFaab7DFqZMIsL1HQof/La1gYdMBeasV4NGUkSUM+Dc8kftkuZW7XcGgJZCKG0ZjLIlDJy9lwAtGe61QovXNYfN/lM5TAIDsaJveBATiAM/oBNCLK0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9J5ISfQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737381990; x=1768917990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1uS4z3qSW4B3HL0w5ziOk7BdN1z2O3FF9kgKHr+m/4k=;
  b=D9J5ISfQEeP9bTaaFkxsYGcHYAsyJr9x7D11F6n+lXwyqDPdTlM+TSlw
   b65HPlDleT0KV2Abm76A9e4xK3PqRV8T1CnHe3706/i20Fpkry6l8amRi
   4mlLEh3W8ap0wQynsbBIriq9ojyOiUYXO6n86z0lL/3kw15Dzwm+mAUiq
   KHAK6G+mRYUQIYYKbrBeGFt2DXzVBgbyi95oy5a7Upg4Cd7fTr4jhXzUk
   VbZlqRCSAOVJdH4/skjSXccb1oDR1lNtK5tni4/91oi9xjCG8szUD5LFE
   TxJN5y2TncYCey4Q29OVN4/WbbJdzPww6c5MUkOrxs1slspuklW3D6F5Q
   w==;
X-CSE-ConnectionGUID: 7YWAAOWmRquehg5HuEez8Q==
X-CSE-MsgGUID: Dagr0fzWQWC2zoft+/RV5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37890061"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37890061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 06:06:30 -0800
X-CSE-ConnectionGUID: BltcJRoiQXyKctIw3LJ4Dg==
X-CSE-MsgGUID: /biOkYpVQ+iV2JxF+iZWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111154052"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2025 06:06:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZsQ2-000WcZ-1a;
	Mon, 20 Jan 2025 14:06:22 +0000
Date: Mon, 20 Jan 2025 22:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 09/10] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
Message-ID: <202501202157.Aasnvf5L-lkp@intel.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-9-5d1bdb5a140c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-9-5d1bdb5a140c@quicinc.com>

Hi Taniya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0907e7fb35756464aa34c35d6abb02998418164b]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-alpha-pll-Add-support-for-dynamic-update-for-slewing-PLLs/20250119-182754
base:   0907e7fb35756464aa34c35d6abb02998418164b
patch link:    https://lore.kernel.org/r/20250119-qcs615-mm-v4-clockcontroller-v4-9-5d1bdb5a140c%40quicinc.com
patch subject: [PATCH v4 09/10] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_VIDEOCC_615-0-0 (https://download.01.org/0day-ci/archive/20250120/202501202157.Aasnvf5L-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250120/202501202157.Aasnvf5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501202157.Aasnvf5L-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_VIDEOCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_VIDEOCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

