Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA2A6BFB9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 17:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCRQn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 12:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjCRQnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 12:43:55 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C72172C;
        Sat, 18 Mar 2023 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679157834; x=1710693834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9cVN+VCKJAIk4wgagRUmzJqjpcPtAqI1YYy/7Sm3b0=;
  b=RJtgMgDTxxCVYe6eQnSgAfrgdg6wUXz8RKeeiwjkcgXMhaUXbEAdGhxz
   J8Muhgsv7vf9kres/j2SLTTzncVoH7gLqBWsPe+gNu0FfUFMZU337eJh5
   nJT9AuPEpzLdC+0VgA7KF67GYaDq6PA96JTpjVolC/wP7muroFgjWNRhP
   ySMC8FtHI7OaP5JPa6r3PfbqVAbmmhLWzsWbK9o0+Fau1tIG9KrQU21f8
   VvT68/Z2MyerZpELsRBkh1T5sV97bXgNMsgcEfwBrZwvXlkSM+zc2B2up
   E/sClp41hvj9coxzv6lhIsLNzn/njD10l3A43n5a8BLOFTiuOIb+fWNYR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318847151"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318847151"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 09:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="749614597"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="749614597"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Mar 2023 09:43:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdZen-000AAK-09;
        Sat, 18 Mar 2023 16:43:49 +0000
Date:   Sun, 19 Mar 2023 00:42:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 13/18] phy: qcom-qmp: Register as a typec switch for
 orientation detection
Message-ID: <202303190010.w3QR1CU6-lkp@intel.com>
References: <20230318121828.739424-14-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318121828.739424-14-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next broonie-regulator/for-next lee-mfd/for-mfd-next linus/master v6.3-rc2 next-20230317]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230318-202034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230318121828.739424-14-bryan.odonoghue%40linaro.org
patch subject: [PATCH v4 13/18] phy: qcom-qmp: Register as a typec switch for orientation detection
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230319/202303190010.w3QR1CU6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/76d1e355779b094d3ddb20776b0835215dc3646c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230318-202034
        git checkout 76d1e355779b094d3ddb20776b0835215dc3646c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303190010.w3QR1CU6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-qmp-combo.c: In function 'qmp_combo_typec_switch_set':
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3383:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3383 |         int ret = 0;
         |             ^~~


vim +/ret +3383 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

  3376	
  3377	#if IS_ENABLED(CONFIG_PHY_QCOM_QMP_TYPEC)
  3378	static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
  3379					      enum typec_orientation orientation)
  3380	{
  3381		struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
  3382		struct phy *dp_phy = qmp->dp_phy;
> 3383		int ret = 0;
  3384	
  3385		dev_dbg(qmp->dev, "Toggling orientation current %d requested %d\n",
  3386			qmp->orientation, orientation);
  3387	
  3388		qmp->orientation = orientation;
  3389	
  3390		if (orientation == TYPEC_ORIENTATION_NONE) {
  3391			if (qmp->init_count)
  3392				ret = qmp_combo_dp_power_off(dp_phy);
  3393		} else {
  3394			if (!qmp->init_count)
  3395				ret = qmp_combo_dp_power_on(dp_phy);
  3396		}
  3397	
  3398		return 0;
  3399	}
  3400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
