Return-Path: <linux-arm-msm+bounces-1301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E097F2653
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 08:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDB41C209E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 07:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B56B2231C;
	Tue, 21 Nov 2023 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9NKQaN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276ED94;
	Mon, 20 Nov 2023 23:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700551770; x=1732087770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=32jw/KIvtOE3RrphJxoAKT29G9A8pwFs1iDqvFgKt1A=;
  b=Y9NKQaN6nr0pEZ3vncxEwU/Rl3nZRHzv8saHVtsbcHELZDhZn4vh812e
   Z/ed/Q56prhhrzAt2+dFk7T3lIh+uzTwDnKEMD5+43c4lypHRRo8+Jzxx
   3xrM2TgFdD1x2kZN11SyMKz8Vvvkao7kSDMjOsXKXa4+JWdSpEuxmB3oU
   kBT29UI0JmCfD04bN4aIfRNiU3dpYNxUhutb3rMK3Wwjesjej8/3fzytC
   KD95PON+nFnfCOo+PSqRCSolvBmAMNDC5yMybC5j/NiolOOlnHNDfBf1U
   8l+a51+wPMxwmDt5tvXE4x7AQI+oZY/TyAxDra3KQU/p03y5M8l5LaF1Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382176782"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="382176782"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:29:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910372443"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="910372443"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2023 23:29:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5L6s-0007V3-3C;
	Tue, 21 Nov 2023 07:28:16 +0000
Date: Tue, 21 Nov 2023 15:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
	ulf.hansson@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, agross@kernel.org, conor+dt@kernel.org,
	ayan.kumar.halder@amd.com, j@jannau.net,
	dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
	m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
	lpieralisi@kernel.org, quic_rjendra@quicinc.com,
	abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com,
	neil.armstrong@linaro.org, Sibi Sankar <quic_sibis@quicinc.com>
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: Add base X1E80100 dtsi and the
 QCP dts
Message-ID: <202311211519.7IaZhocH-lkp@intel.com>
References: <20231117113931.26660-4-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117113931.26660-4-quic_sibis@quicinc.com>

Hi Sibi,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7-rc1]
[also build test ERROR on linus/master next-20231121]
[cannot apply to robh/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sibi-Sankar/dt-bindings-arm-cpus-Add-qcom-oryon-compatible/20231117-194253
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231117113931.26660-4-quic_sibis%40quicinc.com
patch subject: [PATCH V2 3/5] arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231121/202311211519.7IaZhocH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211519.7IaZhocH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211519.7IaZhocH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/x1e80100-qcp.dts:10:
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:7:10: fatal error: dt-bindings/clock/qcom,x1e80100-gcc.h: No such file or directory
       7 | #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 arch/arm64/boot/dts/qcom/x1e80100.dtsi

   > 7	#include <dt-bindings/clock/qcom,x1e80100-gcc.h>
     8	#include <dt-bindings/dma/qcom-gpi.h>
     9	#include <dt-bindings/interconnect/qcom,icc.h>
    10	#include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
    11	#include <dt-bindings/interrupt-controller/arm-gic.h>
    12	#include <dt-bindings/power/qcom,rpmhpd.h>
    13	#include <dt-bindings/power/qcom-rpmpd.h>
    14	#include <dt-bindings/soc/qcom,rpmh-rsc.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

