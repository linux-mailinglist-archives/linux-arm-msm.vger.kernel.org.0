Return-Path: <linux-arm-msm+bounces-22103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE7900DF1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 00:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE46284301
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 22:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0E41553AA;
	Fri,  7 Jun 2024 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH0KEAic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7ED4E1DD;
	Fri,  7 Jun 2024 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717798372; cv=none; b=BE6fM8zLKVNw+GAwgluTJBn2U2E8i6SExWFXtFAMAeRo5KKAp7Ls0tM6xd1nC/nVskL6E2jsZ3dVhj37SoPtq6vQsqiPb1XWbWYhY+SxPXL8C0j56kAZxOl7Xo7lfmZfM+RUQaKaWXz9WhN4OOrYdHl3YtmsiYuY2ep2ocWA1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717798372; c=relaxed/simple;
	bh=212IO9K4Rw0UQcxRjjjO+P6wB5hoCNlztTIYL6Jg6Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7b4HTPrcbHKR4sJZzX/osN1z8/N4ahL4fLkGXDeLwVIVWCuvSnzPgbffRds8IcEMIFGAUSB2rJ6s3qfGfAvMUTUxU+p9lUjcrMyJ/6NcPjaQYSO3ajKBWm/zJAD2JnwqzEPaihf5Z/dW/t21rl3TitlRQgJ1StV51QfQkTe5O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH0KEAic; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717798371; x=1749334371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=212IO9K4Rw0UQcxRjjjO+P6wB5hoCNlztTIYL6Jg6Qk=;
  b=YH0KEAicugAwMmKlYIBOFmJoU6Ko2D94dU5VcSFqV817NJwIZqlfDqwW
   rimxqoM8WMxMnJLSpSU5QaD7q1oohYGaoPD42zfFUmgIfoAJxRDzLbpc0
   MreirxkxgWsLB7iCPEnGq/bzIoxDs2vMHZ7xr71qwP52eDckflcHHxWTq
   XBItwVcXhcZCvTzVFuL/cxI/yonbjqHO3z3x7EDhAQ7PtkOIrw9aM9XrU
   8ez1WnV8gxiwoRxvNHIZZF/U0LgZZF4jhGfODi69o0hbmDlkGIYEkZVGo
   DoDGpKcmLO/2by6o5F0CkRWYX7ojQksbqZs1hOra579LtS0b0mnf1AMp5
   g==;
X-CSE-ConnectionGUID: qwnsjjsNSumTlywkx38Mog==
X-CSE-MsgGUID: EYHR/3O9Q7Smi9vgKhwB8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25944780"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25944780"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 15:12:50 -0700
X-CSE-ConnectionGUID: +tx0Ix/uRCyxIsxvayaFLA==
X-CSE-MsgGUID: YND4BhLMQ2eKBI3TTh6p0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38554876"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2024 15:12:47 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFhpF-0000c7-15;
	Fri, 07 Jun 2024 22:12:45 +0000
Date: Sat, 8 Jun 2024 06:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: srinivas.kandagatla@linaro.org, andersson@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org, inux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce SM4250 LPI pinctrl driver
Message-ID: <202406080514.8Yq3kzQr-lkp@intel.com>
References: <20240606130323.138970-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606130323.138970-3-srinivas.kandagatla@linaro.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/dt-bindings-pinctrl-qcom-Add-SM4250-pinctrl/20240606-210728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240606130323.138970-3-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 2/2] pinctrl: qcom: Introduce SM4250 LPI pinctrl driver
config: sh-randconfig-r131-20240608 (https://download.01.org/0day-ci/archive/20240608/202406080514.8Yq3kzQr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406080514.8Yq3kzQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080514.8Yq3kzQr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c:135:9: sparse: sparse: Initializer entry defined twice
   drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c:158:9: sparse:   also defined here

vim +135 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c

   125	
   126	static const struct lpi_function sm4250_functions[] = {
   127		LPI_FUNCTION(dmic01_clk),
   128		LPI_FUNCTION(dmic01_data),
   129		LPI_FUNCTION(dmic23_clk),
   130		LPI_FUNCTION(dmic23_data),
   131		LPI_FUNCTION(dmic4_clk),
   132		LPI_FUNCTION(dmic4_data),
   133		LPI_FUNCTION(ext_mclk0_a),
   134		LPI_FUNCTION(ext_mclk0_b),
 > 135		LPI_FUNCTION(ext_mclk1_a),
   136		LPI_FUNCTION(ext_mclk1_b),
   137		LPI_FUNCTION(ext_mclk1_c),
   138		LPI_FUNCTION(i2s1_clk),
   139		LPI_FUNCTION(i2s1_data),
   140		LPI_FUNCTION(i2s1_ws),
   141		LPI_FUNCTION(i2s2_clk),
   142		LPI_FUNCTION(i2s2_data),
   143		LPI_FUNCTION(i2s2_ws),
   144		LPI_FUNCTION(i2s3_clk),
   145		LPI_FUNCTION(i2s3_data),
   146		LPI_FUNCTION(i2s3_ws),
   147		LPI_FUNCTION(qua_mi2s_data),
   148		LPI_FUNCTION(qua_mi2s_sclk),
   149		LPI_FUNCTION(slim_clk),
   150		LPI_FUNCTION(slim_data),
   151		LPI_FUNCTION(qua_mi2s_ws),
   152		LPI_FUNCTION(swr_rx_clk),
   153		LPI_FUNCTION(swr_rx_data),
   154		LPI_FUNCTION(swr_tx_clk),
   155		LPI_FUNCTION(swr_tx_data),
   156		LPI_FUNCTION(swr_wsa_clk),
   157		LPI_FUNCTION(swr_wsa_data),
   158		LPI_FUNCTION(ext_mclk1_a),
   159		LPI_FUNCTION(ext_mclk1_a),
   160		LPI_FUNCTION(ext_mclk1_a),
   161		LPI_FUNCTION(ext_mclk1_a),
   162	};
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

