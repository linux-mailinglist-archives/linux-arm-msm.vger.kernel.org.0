Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CF045D82C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 11:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354645AbhKYKZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 05:25:46 -0500
Received: from mga04.intel.com ([192.55.52.120]:41753 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351541AbhKYKXp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 05:23:45 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="234219438"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="234219438"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 02:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="457816037"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Nov 2021 02:20:32 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqBrj-0006Cb-R1; Thu, 25 Nov 2021 10:20:31 +0000
Date:   Thu, 25 Nov 2021 18:20:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     kbuild-all@lists.01.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Message-ID: <202111251812.6wpYwb62-lkp@intel.com>
References: <1637732438-17016-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637732438-17016-1-git-send-email-quic_mpubbise@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manikanta,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manikanta-Pubbisetty/arm64-dts-qcom-sc7280-Add-WCN6750-WiFi-node/20211124-134148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm64-buildonly-randconfig-r003-20211125 (https://download.01.org/0day-ci/archive/20211125/202111251812.6wpYwb62-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b7a0d539f9b9176600b2ae2b8b29aeda4fd50e9a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Manikanta-Pubbisetty/arm64-dts-qcom-sc7280-Add-WCN6750-WiFi-node/20211124-134148
        git checkout b7a0d539f9b9176600b2ae2b8b29aeda4fd50e9a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/qcom/sc7280-idp.dtsi:602.7-607.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
