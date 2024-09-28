Return-Path: <linux-arm-msm+bounces-32699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D106988D73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 04:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5C01F21F7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 02:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22E814267;
	Sat, 28 Sep 2024 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHtvHXsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EAB641;
	Sat, 28 Sep 2024 02:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727488862; cv=none; b=CsQ7Pq8UDQfNzrp2QeCO199Cwcucl6no5/VQiQK+YBAK6CssNYbfSAbBniC71vImfnvMBHCPfJfETiV0F48dgd49WoVNBCYEdEl1HQsh9TPTGN6RMLwJ92Uh0yA46u0ZMz2P98eUCFj/aQO0dOrdiM2bWYFeXrtE8iINO3ruf9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727488862; c=relaxed/simple;
	bh=31DE8n9SDf2F/erIK1VwAXyXAE2As8q+0EI7xnJca9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN7arj8pNMyKqgipgCGZD4Np3U36a6pR7oh2Me1ymqy+mBI/GYpXAO0ixEnvUAlgk6PDMBMMKMWeeEhl3SiZItnve/GPmGPslwxv6jAFKiY0pEF8m/9DNlcEWEVHRsp9yDtUARKiq467FdGgmZCKejtKGV9r38vQ85nrKEhVHfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHtvHXsB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727488860; x=1759024860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=31DE8n9SDf2F/erIK1VwAXyXAE2As8q+0EI7xnJca9c=;
  b=mHtvHXsBKyYrfyoLJw5OjHRqVH4Uq0reerqu52Jh5bCIDxDKMyyLeB5Z
   GbP/ZvFVJydzWconP+KnXPoVJ0JqNd+5y5gcGVBFhm/sGBTuejHEp9w67
   7yQaqhc7mBz13YNCk+Y2hSyPcAaKr8l+sXySKXgb97gE2h79Q2GjbDqbK
   wgJ8j+EmXl3UZGXWB8TCIc32LqMY0qEuSE1fKTlfZwS9dOFZJ24DeQuD4
   Ggx6cqpNft8wqKglDNT0wCYQnGUiO2AADDsun3LiET0rGIjoLmzyR0YTQ
   cJmXffhC8EEKdDyfT0f3XawGIlMD6ZnDrlZnY1IlJIS8V1mgFjFA9Ji/u
   Q==;
X-CSE-ConnectionGUID: EBPOkYjnRPi4oR9D+uZEMA==
X-CSE-MsgGUID: b0Ha6ligSomP6c8YEH155g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30535213"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30535213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:00:59 -0700
X-CSE-ConnectionGUID: zCEArkfsRiqc7En/2g38Rg==
X-CSE-MsgGUID: oU2TpRIuSlaCkM1WgDNPZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73025900"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 19:00:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suMlQ-000Mpt-2C;
	Sat, 28 Sep 2024 02:00:52 +0000
Date: Sat, 28 Sep 2024 10:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <quic_jingyw@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Xin Liu <quic_liuxin@quicinc.com>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add base QCS8300 RIDE dts
Message-ID: <202409280919.8HQTWaY2-lkp@intel.com>
References: <20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42@quicinc.com>

Hi Jingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d0326b60bb753627437fff0f76bf1525bcda422]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-arm-qcom-document-QCS8300-SoC-and-reference-board/20240925-184548
base:   4d0326b60bb753627437fff0f76bf1525bcda422
patch link:    https://lore.kernel.org/r/20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42%40quicinc.com
patch subject: [PATCH v2 4/4] arm64: dts: qcom: add base QCS8300 RIDE dts
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280919.8HQTWaY2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280919.8HQTWaY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280919.8HQTWaY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
       6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +6 arch/arm64/boot/dts/qcom/qcs8300.dtsi

27f221d22e92b6 Jingyi Wang 2024-09-25  @6  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25   7  #include <dt-bindings/clock/qcom,rpmh.h>
27f221d22e92b6 Jingyi Wang 2024-09-25   8  #include <dt-bindings/interconnect/qcom,icc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25   9  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  10  #include <dt-bindings/interrupt-controller/arm-gic.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  11  #include <dt-bindings/mailbox/qcom-ipcc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  12  #include <dt-bindings/power/qcom,rpmhpd.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  13  #include <dt-bindings/power/qcom-rpmpd.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  14  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

