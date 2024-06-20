Return-Path: <linux-arm-msm+bounces-23316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833FC90FAEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 03:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062B3282312
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 01:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77E112B6C;
	Thu, 20 Jun 2024 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUzI6TU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317F101E2;
	Thu, 20 Jun 2024 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718846888; cv=none; b=gzVWVnNrb6kd6/TmG8toGXhJIPwQnHXUWcq6f0tYKCp+NlMVwXFUB8Gv4WdEO8ItpqZpSOX9CFQfDK+foOKgf7/wXJxgwxgQiYbTMNcUHsKw1VAV1yCyCoDfr24/H0gIXJlMP6eX4w0nkz1iMoygWJlLhwEXbBWT3fT3Q7LTvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718846888; c=relaxed/simple;
	bh=tah7JHMloHYyyuXUkIuQdAVfA3S4etDUcECfCntNUiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axCVs1ondF6ydrPez64avgisdGFmALer1OCHQ48xbFPoS7SqNOR2EPzHMZskaXI4T899NtAoSkmvfjCogRKnYAKEj4ggiR1DCrOJqPqPxZb5hOJuUFm8ApB/Ylv60D6ZZ4RPX464otONe0J0gcHP/ZZPAJRd0XjGt3K6TfOzUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUzI6TU6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718846887; x=1750382887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tah7JHMloHYyyuXUkIuQdAVfA3S4etDUcECfCntNUiA=;
  b=SUzI6TU6bCDN3VFqALCbS1V0aksPwbU1YlqTVXEEUVEu0XMRlnGyS5Gd
   eTznzE3m8VxC2qag8jsR1P5fHRw5Dg6LcjqjpVrCgOSqHjnK4o6kFlGJL
   g9VBl+t4WOOYAjqvNjkMeYWJ2L6oR+ygAiOCLtSwiY5sVL/tTfWHStRrv
   sZg9eC52kHT9OJ+COPIERZo9k+sm4Dvd5cAQFPPoj52IUfUH2dxk1YR40
   4oKuG9qfAqvSKcUlfxjcNMIWpjsRNc3qgQOSlCmZMheMq5e20Wu7vcCGH
   SQf+P6ydpA2a7fyt95uYJ489U9UtXeRqklJISJjjwHDF1e3/FDND87p9C
   Q==;
X-CSE-ConnectionGUID: xcPIGPVaQeaDmpnR2XZNaA==
X-CSE-MsgGUID: bRMwGOGHRPmbNCr/BFqzbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33349848"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="33349848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 18:28:06 -0700
X-CSE-ConnectionGUID: B1iPLfK6S7Wzu53SOwNG0w==
X-CSE-MsgGUID: WIg/bWvsRvSNbC4fn8CN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="65328322"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2024 18:28:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK6am-0007Bl-2k;
	Thu, 20 Jun 2024 01:28:00 +0000
Date: Thu, 20 Jun 2024 09:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride-r3: add new board file
Message-ID: <202406200921.dxATkjA1-lkp@intel.com>
References: <20240619183255.34107-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619183255.34107-3-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc4 next-20240619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/arm64-dts-qcom-move-common-parts-for-sa8775p-ride-variants-into-a-dtsi/20240620-023438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240619183255.34107-3-brgl%40bgdev.pl
patch subject: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride-r3: add new board file
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200921.dxATkjA1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200921.dxATkjA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200921.dxATkjA1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r']
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r']
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r']
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: phy-mode:0: 'ocsgmii' is not one of ['internal', 'mii', 'gmii', 'sgmii', 'psgmii', 'qsgmii', 'qusgmii', 'tbi', 'rev-mii', 'rmii', 'rev-rmii', 'moca', 'rgmii', 'rgmii-id', 'rgmii-rxid', 'rgmii-txid', 'rtbi', 'smii', 'xgmii', 'trgmii', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', 'xaui', '10gbase-kr', 'usxgmii', '10gbase-r', '25gbase-r']
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

