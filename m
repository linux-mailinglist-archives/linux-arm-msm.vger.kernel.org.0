Return-Path: <linux-arm-msm+bounces-24405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46A91A07E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 09:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7340282246
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 07:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8712E4EB3F;
	Thu, 27 Jun 2024 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcICpKMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21C3EA76;
	Thu, 27 Jun 2024 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473821; cv=none; b=YRfF16Mt1dTrRM/ZoWGYDHqBkrDOC1TVXNjKDbA3rkf5/ox8BdSFKp0EVljJ4w0M2PRhpF6pX5WQsqlldqq2zulkC7J5dCH1csNJ2zE73zhd0gsajr3TBrgQTs8Veee4HTTzBIEWuGcdgI1nlT8z37Y3b5bw+TV9cEZkNn3C2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473821; c=relaxed/simple;
	bh=GJvTs8uLp8xqMQpQmNm2+XNXsk73scTBtKxY/yW5KCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYfJ2MDEFDVDYySAvHDhKkI+uytInWQdKArqUghQL70JTtQNyF0shKcwqf+9SPEDW0bdLP2cdHuLoVjw6XNTfm8BADAaHSrPcZq1qMmdszCNpSmMzvxAdaY4d/B/juLe/226e/7gSJEKakqutIAI4HDszLj67QrJwOEygnI59Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcICpKMF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719473819; x=1751009819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GJvTs8uLp8xqMQpQmNm2+XNXsk73scTBtKxY/yW5KCM=;
  b=VcICpKMFfgcK7vxNgBFiv4VFzxApYRQbDA2mqIpCV5irZkD+9zWRP4m/
   DtIiSMOKDlN8Y9mdgn3NTCzug0p+qBZbbnF2h6irh9/A53GpWvp+0w7I/
   6OXY0NWdKtz5RcI7Sb94ooxEskB9W8ck2Z36Gkl3UsUBUHWeZWw/bhO1Z
   +UYxtFo9pMecr1b046S0cw47nZYJkPkzh7MzcYvYNszSle25mZwF80hYh
   kXCW8lw8PpPkpV/nV2ud9XgH+cZjRxj3c/j7n3yWtQOOX3JmzpZXT3mk2
   CeplZf0FV3HAz1J2kKgUZwU/r8ttx76wsbygz7obcd2ea+QA2X5aW4qGY
   Q==;
X-CSE-ConnectionGUID: ML6tQYhJS7epG1I8NILw6A==
X-CSE-MsgGUID: nKkZkZuBQcGSyi7qo2+5xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16541221"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16541221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 00:36:59 -0700
X-CSE-ConnectionGUID: kWiZWpTMSQuT6XU78eyK0A==
X-CSE-MsgGUID: qlNvCSGwR8G61kzM5Gcprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="75473125"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2024 00:36:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMjgb-000G1i-19;
	Thu, 27 Jun 2024 07:36:53 +0000
Date: Thu, 27 Jun 2024 15:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	freedreno <freedreno@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <202406271442.d4CbiZMW-lkp@intel.com>
References: <20240623110753.141400-4-quic_akhilpo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623110753.141400-4-quic_akhilpo@quicinc.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc5]
[cannot apply to next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/dt-bindings-display-msm-gmu-Add-Adreno-X185-GMU/20240626-061111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240623110753.141400-4-quic_akhilpo%40quicinc.com
patch subject: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271442.d4CbiZMW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271442.d4CbiZMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271442.d4CbiZMW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-phy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-phy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: iommu@3da0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
   	'marvell,ap806-smmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia,tegra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,x1e80100-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: iommu@3da0000: clock-names: False schema does not allow ['hlos', 'bus', 'iface', 'ahb']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: iommu@3da0000: clocks: False schema does not allow [[150, 14], [51, 55], [51, 56], [150, 0]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@b: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000: 'vdda-phy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000: 'vdda-phy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: iommu@3da0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
   	'marvell,ap806-smmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia,tegra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,x1e80100-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: iommu@3da0000: clock-names: False schema does not allow ['hlos', 'bus', 'iface', 'ahb']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: iommu@3da0000: clocks: False schema does not allow [[146, 14], [51, 55], [51, 56], [146, 0]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@b: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

