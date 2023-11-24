Return-Path: <linux-arm-msm+bounces-1874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A77F77AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 16:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54EFAB2178C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 15:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980C72EB0B;
	Fri, 24 Nov 2023 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhP5DcUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23882172A;
	Fri, 24 Nov 2023 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839436; x=1732375436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hjHUasbUvdZyid1X5HvgmpQL0hPNRyInjUAbKjnNwBA=;
  b=IhP5DcUudeE7JdZfJxS6kIaFYA3ATMgmU30Rst1mxKavhkUbHy4d7wVm
   6g1i1RlOysSgptmXz6myS5Lsw3S00XnJbFtQFC9O5wumPYa2igtZPdFPa
   cc/Aj/6U+Vn9w7R0luKH5VLiQtvJMU6RdJS3wlHP3BwyL7Vf+KYLDYmjl
   RlmL47YhFWvSYAiLZSrSerkJmTLhgSPMKmbMyHHHtWMs46Zb9WhMUna+D
   LyTJZsxwhTmsVIOFFYdhlqOZ5/sn83Xx0bzVGc3tVS87UGuieQK0vh2Bd
   7wgJ41DDkXTY4C+85bSGUES2oI5AbUmi0eOCynCupfLRBtXoXvboLUQfu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456781780"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="456781780"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1014935597"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1014935597"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 07:23:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y20-0002wK-0N;
	Fri, 24 Nov 2023 15:23:48 +0000
Date: Fri, 24 Nov 2023 23:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p: enable Fault
 IRQ
Message-ID: <202311241629.yh1clHno-lkp@intel.com>
References: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-fault-IRQ-for-sa8775p/20231123-202252
base:   net-next/main
patch link:    https://lore.kernel.org/r/66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p: enable Fault IRQ
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231124/202311241629.yh1clHno-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241629.yh1clHno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241629.yh1clHno-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sa8775p.dtsi:2344.10-11 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

