Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5D96BFCE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 22:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjCRVKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 17:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjCRVKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 17:10:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24F71B2C1;
        Sat, 18 Mar 2023 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679173798; x=1710709798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=onXfoHbAozeANeR5pqkOEsAVdG4bNudHIEO3t8xXZvU=;
  b=QPsNekE39zo2NOhOeUdvZms1aJARrC4pyQupX/DrbV5ej4VgrnRoeUl8
   UaEpboL1W44+Q/+tce7caCF+b7ti1y+6JQuunUZUhECRCB/sgdczzuRzh
   25QozjKM7p9UJz1zZ8g4oCDw7muAt+R1bKvEaDq2v7BXWM62cwFeO2seD
   T+GxvTq+82LtnNSY7RyEmlI7WY3khoJYfMUFo+gfmGaEJxxa7JLxRD6Mx
   OfP8PDswJYhqHnly+Aq5Rk89XMGSGI1xFvRJ782XBo70cd47TbhIYYSMB
   8YR/k/+Xgy8whK91eVeGs4p0YB345XJ+UjC8wd97gjCeMBvhciY8/nMu7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="403334023"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="403334023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 14:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="769747855"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="769747855"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 14:09:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pddoH-000AH0-2g;
        Sat, 18 Mar 2023 21:09:53 +0000
Date:   Sun, 19 Mar 2023 05:09:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 14/18] arm64: dts: qcom: pm8150b: Add a TCPM
 description
Message-ID: <202303190420.SG155iKR-lkp@intel.com>
References: <20230318121828.739424-15-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318121828.739424-15-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next broonie-regulator/for-next lee-mfd/for-mfd-next linus/master v6.3-rc2 next-20230317]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230318-202034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230318121828.739424-15-bryan.odonoghue%40linaro.org
patch subject: [PATCH v4 14/18] arm64: dts: qcom: pm8150b: Add a TCPM description
config: arm-randconfig-r046-20230319 (https://download.01.org/0day-ci/archive/20230319/202303190420.SG155iKR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f22a2d4f99f0527b2429c054e4c918c2dee8ec89
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230318-202034
        git checkout f22a2d4f99f0527b2429c054e4c918c2dee8ec89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303190420.SG155iKR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
