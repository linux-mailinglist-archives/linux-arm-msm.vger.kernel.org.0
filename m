Return-Path: <linux-arm-msm+bounces-24459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D191A6BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 836171F237D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CB715EFC2;
	Thu, 27 Jun 2024 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixL28et/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C7415ECEF;
	Thu, 27 Jun 2024 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492210; cv=none; b=CZnuv/w2EF5TtssFPSqyCF8AcmqnVjSIxpTf3YxM69XXN2NHujZVvsOwVKGGMm2kgv7pVReQjEDuMkemfjZ/ld/x6oY0vQehrTYaaWqhjJD9tWmvMKlbXWAz7OlP0BJ3dRv2ZXpBmBNWHsXPHtpULjOPn+bWnHyiiWBDuDaZMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492210; c=relaxed/simple;
	bh=MIa5UbAwdN0MQZHDYIq4AocxOOiHJlQicygyyMYL9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRF8Ul9G/vrjynbzR/FRX5lXRpyU0mGoGVk9aLgFdM7Q7TXQQC0Z9RUHpUnDtsEEw+rxyVfzs8Y6rKRRoqNh9hGvGXFHP3/2LhqEZ3yBqiPCdd6gJSuKIvkvXoahwcfYCf5zuI8GlANxUyUZ98CrP7Ty/Y42CuoBRpipr3smpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixL28et/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719492209; x=1751028209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MIa5UbAwdN0MQZHDYIq4AocxOOiHJlQicygyyMYL9aU=;
  b=ixL28et/Cx921ZfyPz+SP9YS/Y8zAk8A0q/s2f/2/vx1Wq3FTTpTIKay
   kLr1gw93kqlWb43HPx3YNg9tmp3z2f0clxiQGfZtt7FGMQ0RFVyjZnHwP
   yNbSxr6A7XUyY1AY6slsmmVxQCBwzBoTb4iAhjQIBa8lWUSuPcKWmWlbI
   orvV8wyNCb8IZv0QlzNSifGmHayLXqZ5LkOk7N5Kx4AdRpg6SOMBjRKY6
   WVpWA4Hw4dlBOmAhQl2J06gCo3eBhfyJ2xIpp6HBX//gsc996jGri2hRv
   EaeK+6+ftL+HtbmYBGmU2nkr4moG3tPKF1b97dv814D+xT4d5UySe+lj3
   A==;
X-CSE-ConnectionGUID: HXSwzJDbR3C8+M9dPg5xTw==
X-CSE-MsgGUID: XEjtTFj6RhWK4/4+/+5I2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20435161"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="20435161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 05:43:27 -0700
X-CSE-ConnectionGUID: wtTd6FqOQ+SyMrQRmMdeLg==
X-CSE-MsgGUID: TxNoo/aqRMu0POgQB/IcaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="45022904"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2024 05:43:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMoTA-000GCo-17;
	Thu, 27 Jun 2024 12:43:20 +0000
Date: Thu, 27 Jun 2024 20:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, sboyd@kernel.org,
	andersson@kernel.org, bjorn.andersson@linaro.org,
	david.brown@linaro.org, devicetree@vger.kernel.org,
	jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
	mturquette@baylibre.com, ohad@wizery.com, robh@kernel.org,
	sricharan@codeaurora.org
Cc: oe-kbuild-all@lists.linux.dev, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Message-ID: <202406272012.krpg0wbC-lkp@intel.com>
References: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>

Hi Gokul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gokul-Sriram-Palanisamy/remoteproc-qcom-Add-PRNG-proxy-clock/20240625-162317
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240621114659.2958170-9-quic_gokulsri%40quicinc.com
patch subject: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240627/202406272012.krpg0wbC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406272012.krpg0wbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272012.krpg0wbC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@59000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@59000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
--
>> arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
--
>> arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

