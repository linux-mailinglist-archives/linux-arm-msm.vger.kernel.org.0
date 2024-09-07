Return-Path: <linux-arm-msm+bounces-31216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0997047D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 01:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB1D91F21A65
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 23:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0070E168C26;
	Sat,  7 Sep 2024 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QV8aOGOv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E931684A1;
	Sat,  7 Sep 2024 23:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725751359; cv=none; b=Z5lCYefjpVVssWzoJ2GaPSXHH/ElTU5UOyhvl/9+Joev/9QharKSv+1VIzDnnzZlKIniU5Rxf6vfE5U02nQ3oPNsu5qtVBNtoM5Ha9cRGQ8ERYI/LAfaqtnXa2JN66To+6kUDtSDnmcR17GaKGB4GJVrUfZRM60c4jUWbZe8000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725751359; c=relaxed/simple;
	bh=kPcUBRJYy8VX11c2WAZ63MKA4XepOxYnPs6fcTnrKlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ed4TkWTHCQZQeLEKD/A2z22Ude86KKwLMQYDMSEhMPLlbGtxquK957Sc5HqpsxxF9z3mIOPtdwLZoBKW9JHk4DcUJrwaYfo+J/UEx08W/dhYF20nyzrFFik0HutklDKxaPQwaSqhlBEDsYjN5CfA5nAsGAq1pvbQbzKc0/zymHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QV8aOGOv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725751358; x=1757287358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kPcUBRJYy8VX11c2WAZ63MKA4XepOxYnPs6fcTnrKlU=;
  b=QV8aOGOvnCGCZcW9epciKqJqNsMHGhS+XmyoQ2xDv1E57PCzKLoX8MB7
   ikf+CNc6AR3ecPQNDAHbZw4ywHqLSutBcuQ8LwJcCR5P/CMRWAu+SC6qf
   UeOZqgiHaBcr3n8X0uwiGO4TSR+LH50TKJIePC1iVZrCzY9fuvaZYae8J
   rSeN19erGTH5924okO/VAeYE8PaPj9O5J8Bu+R1R9elWYulh2+DZGCSoS
   YEz/TRNnD6rY41qWkcnOW4iYfQQ4C+OgotP9I6FE4EZoJBJEYimf0d7J/
   TSYYh0NZQc0Z4XNX0M5OchhN+fA8VCP+slZX/kW8EA5tDzTh9x8lAbb5H
   g==;
X-CSE-ConnectionGUID: SlHpN99VRv+LlctWb0ua4g==
X-CSE-MsgGUID: BZZroeHVQcu95H/TV3ZDWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24353037"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24353037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 16:22:37 -0700
X-CSE-ConnectionGUID: 50IcsTvqRxGv8PcQ4cgH2Q==
X-CSE-MsgGUID: Gook4d2aQJCjv6AhNR5CFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66331779"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2024 16:22:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4lA-000D6T-34;
	Sat, 07 Sep 2024 23:22:28 +0000
Date: Sun, 8 Sep 2024 07:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <quic_jingyw@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 19/19] arm64: dts: qcom: add base QCS8300 RIDE dts
Message-ID: <202409080754.6Zv1y3pX-lkp@intel.com>
References: <20240904-qcs8300_initial_dtsi-v1-19-d0ea9afdc007@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904-qcs8300_initial_dtsi-v1-19-d0ea9afdc007@quicinc.com>

Hi Jingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on eb8c5ca373cbb018a84eb4db25c863302c9b6314]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-remoteproc-qcom-sa8775p-pas-Document-QCS8300-remoteproc/20240904-164345
base:   eb8c5ca373cbb018a84eb4db25c863302c9b6314
patch link:    https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-19-d0ea9afdc007%40quicinc.com
patch subject: [PATCH 19/19] arm64: dts: qcom: add base QCS8300 RIDE dts
config: arm64-randconfig-003-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080754.6Zv1y3pX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080754.6Zv1y3pX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080754.6Zv1y3pX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: 'dt-bindings/clock/qcom,qcs8300-gcc.h' file not found
       6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +6 arch/arm64/boot/dts/qcom/qcs8300.dtsi

984d43bac8bbd3 Jingyi Wang 2024-09-04  @6  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04   7  #include <dt-bindings/clock/qcom,rpmh.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04   8  #include <dt-bindings/interconnect/qcom,icc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04   9  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  10  #include <dt-bindings/interrupt-controller/arm-gic.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  11  #include <dt-bindings/mailbox/qcom-ipcc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  12  #include <dt-bindings/power/qcom,rpmhpd.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  13  #include <dt-bindings/power/qcom-rpmpd.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  14  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

