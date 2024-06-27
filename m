Return-Path: <linux-arm-msm+bounces-24432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F0491A555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3221C22DF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D3C149C77;
	Thu, 27 Jun 2024 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHiCYvfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF413A409;
	Thu, 27 Jun 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487892; cv=none; b=HDoyZCU1HIc8m1/LS4SmNC+PJWsA7Nl3a1cQKkoZYRyusQbD7a8r7bcRvBtUJlP2UN6jelz34ENOs6dlZbJektulE6xbPokAgAOzQv07iXxNVfHd79WSL/TdXbJ35ehDrzZNoDLVMF1sA2yq+BTdgaecXIsb5Z3i6rQ4CRTK0lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487892; c=relaxed/simple;
	bh=JmabHIiJCTQRE0VWY8FRGcaEwDamGVU8PUlw709Ef0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxgZCGsVQ8sd3prCc+VnP7ZuenXJ8L4Vl4dQN/4Q+4uJKM5SPR25sDEd+rti+6ZawpgzC3Ej5U++3yl84M0oIo5P5UhlMSLWNgMUYnyig5nlgAGwDoaT0w9miE8GMifZLLpuOHhtBQKhgRO7wu0MlIC2fkYxkiZ5Xc5IwoZubZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHiCYvfG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719487891; x=1751023891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JmabHIiJCTQRE0VWY8FRGcaEwDamGVU8PUlw709Ef0Q=;
  b=KHiCYvfG335rXwoc7guun7LeTLDTfG1xLhyO3NCtq1uKT6KauixqED2t
   yF0NP3L6alcTQ2YIaakWpLp6huzH5/N01PhZh+9txpO4WmPCYyOImBown
   8buWt/iEJGGMcMMrlV3FovTgF3Nul0hvHEPj+ipQjCHYQC7K3+jkZbBAq
   DXSh5ne7/Utawc544TLMvS4I/zr+KOiS3J/ECmK4CdspHi5uO5KkwEhXr
   CyzoFoaD9lR4kHOuIjekRfd3awZAN5WlAhjSAIhPyM2R8a3Qpx3PmDZB5
   +sxdL2rpV5nyJjNuC9/H0IDsUssnCfMNaITBway18sl+Bb6TJB9woT/QH
   g==;
X-CSE-ConnectionGUID: HeL2QwivR96p9ieb09SedA==
X-CSE-MsgGUID: vpy8guUtR/CptF+RQryQqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16427442"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="16427442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 04:31:30 -0700
X-CSE-ConnectionGUID: F3/UQkc4R8W1dskgzKKJhw==
X-CSE-MsgGUID: llqONCmBT5O6W8lPncT3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="44164257"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2024 04:31:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMnLY-000G9u-2t;
	Thu, 27 Jun 2024 11:31:24 +0000
Date: Thu, 27 Jun 2024 19:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: add soundwire controller
 resets
Message-ID: <202406271923.v945xTG8-lkp@intel.com>
References: <20240624-x1e-swr-reset-v1-3-da326d0733d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-x1e-swr-reset-v1-3-da326d0733d4@linaro.org>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 781025f172e19ca5682d7bfc5243e7aa74c4977f]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/dt-bindings-clock-Add-x1e80100-LPASS-AUDIOCC-reset-controller/20240625-210534
base:   781025f172e19ca5682d7bfc5243e7aa74c4977f
patch link:    https://lore.kernel.org/r/20240624-x1e-swr-reset-v1-3-da326d0733d4%40linaro.org
patch subject: [PATCH 3/3] arm64: dts: qcom: x1e80100: add soundwire controller resets
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271923.v945xTG8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271923.v945xTG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271923.v945xTG8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c274000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@3: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@3/gpio@8800: failed to match any schema with compatible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@4: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@4/gpio@8800: failed to match any schema with compatible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@5: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@5/gpio@8800: failed to match any schema with compatible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@6: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c274000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@3: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@3/gpio@8800: failed to match any schema with compatible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@4: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@4/gpio@8800: failed to match any schema with compatible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@5: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@5/gpio@8800: failed to match any schema with compatible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c42d000/pmic@6: failed to match any schema with compatible: ['qcom,pmc8380', 'qcom,spmi-pmic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

