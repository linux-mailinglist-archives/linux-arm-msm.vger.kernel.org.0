Return-Path: <linux-arm-msm+bounces-45580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C18CEA16BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD8BB7A2B83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2B41DF983;
	Mon, 20 Jan 2025 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLb23EsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06761B87EE;
	Mon, 20 Jan 2025 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374315; cv=none; b=Rb0PWVXzYtil9V3UDFznwNFMErqLltHAK+P4SdnRJjUs+5raDePtv//aCdGNwHkDzIhjPn6YvPF7qSAyae9Tf1QptFnXMGv9bzlwbuX9aQlO/5H0JC0gAJITPWaJPZpn63gMnB9WBA+13dOMQunxCRXQgA3TZ6AIi4Ugjn4M/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374315; c=relaxed/simple;
	bh=Ud8mjZa0Vr1kKKXuf/VAUY7cuf1qu22Xddl85PI8jtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LS/nQ8O31xUpFt78NBV1b7eW6rd2gJhEASh3m+IPHgormXREr4P6VB9acDbGgpjFb7/M+O3pilnrb7gUkObDi4OdfSLjZujtv1wUMxQd2wQ5qY+e9y1ZhWrA1Kg/FFd+aHLpTpQUTTr0HAM7+M9u/xY0DMJAh6d+7z8YMjOKjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLb23EsP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737374314; x=1768910314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ud8mjZa0Vr1kKKXuf/VAUY7cuf1qu22Xddl85PI8jtU=;
  b=XLb23EsPIJKqxep0huRhvShZ/6Lbk6fct5FZMRayLUPRjBGTNMybmL2D
   xqYkQzv1bGVhOePdNG1aMaK21kSGW7bJuWB3/TDWSODnCiuCxBrHC3rG/
   9IkWcXIcagx4HnC5Umrl8EQkmpJMPeptmGzcuAf1tJ6H0Ov2h258Q90CP
   7eDfxtgml8268C40DdJ3c7w4YxXGWe2PYu7+BvpAvZk+1cdN+JCcSPzF4
   ouu/swkiFHHnXmXvGlNl4WMH1qFrC+EzYMH6fp2MPAnIPc2DXUmd4S/N4
   TIRV7b14rqNiZJ4Tm8OYTpkaOW6s5Mp1k8kE6aVLhz9jO9v7R/ImsKwk4
   Q==;
X-CSE-ConnectionGUID: T5WaS9uLRaiOXKTENXjvCg==
X-CSE-MsgGUID: aTUNNDd2RCSWUtgmjnkSnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48254397"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="48254397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:58:33 -0800
X-CSE-ConnectionGUID: IoA75u+HT/Cl169pA8qaCQ==
X-CSE-MsgGUID: PE1bLa0GSDKvSWyIDztPNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111580540"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2025 03:58:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZqQD-000WVn-1E;
	Mon, 20 Jan 2025 11:58:25 +0000
Date: Mon, 20 Jan 2025 19:57:22 +0800
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Message-ID: <202501201928.ZrWmF3Kl-lkp@intel.com>
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
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_GPUCC_615-0-0 (https://download.01.org/0day-ci/archive/20250120/202501201928.ZrWmF3Kl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250120/202501201928.ZrWmF3Kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201928.ZrWmF3Kl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_GPUCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_GPUCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

