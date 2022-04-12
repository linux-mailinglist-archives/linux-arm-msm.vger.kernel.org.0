Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2732C4FC947
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 02:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240425AbiDLAdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 20:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiDLAdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 20:33:24 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6311625594
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 17:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649723468; x=1681259468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Agc/9Y7wOfxwFujbzIMC+t72NgHYwPEL9fQAInAnmBk=;
  b=I3I+0NnwNtEG7ujk75y7G7ClvzMr5YcnRUQ87gaTh+RYxNmrj/22kN4P
   9auiSQs4KOXfN6RUi1Yrr3wSysJGAJgMzfeVZEh/DKA7DK3RD73BMGGuc
   xEik2zqhemP5G96nb7AEpc1h/vsVlWGvgo+Hn91h82No42W5bbkZY7XaZ
   jFy1074i6df0mxdsQKjKMHf1NhsmvemBVq3I1j+EiVz7d7Q+64RaCU1Ie
   kRMdHZwzERvfTCgsZUEdAV9o+rwFMNhqhui++acENelEy5qnI1Xtd6aoD
   h6XEEYk1XSGKbf3KpD/s/HgfHlcR5PTaaZqJmLFM583gWGGA38sq/8ay2
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262425742"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="262425742"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 17:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="644495956"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2022 17:31:04 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ne4Qx-0002Mc-Hi;
        Tue, 12 Apr 2022 00:31:03 +0000
Date:   Tue, 12 Apr 2022 08:30:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, rodrigo.vivi@intel.com
Cc:     kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
        markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        abhinavk@codeaurora.org, swboyd@chromium.org,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v5 10/10] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Message-ID: <202204120815.MYwHtGG5-lkp@intel.com>
References: <20220411204741.1074308-11-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-11-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sean,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on v5.18-rc2 next-20220411]
[cannot apply to drm/drm-next drm-intel/for-linux-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Paul/drm-hdcp-Pull-HDCP-auth-exchange-check-into-helpers/20220412-045000
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: parisc-buildonly-randconfig-r003-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120815.MYwHtGG5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ba0d7728b853712a831745c4fddff8d72be1c9c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Paul/drm-hdcp-Pull-HDCP-auth-exchange-check-into-helpers/20220412-045000
        git checkout ba0d7728b853712a831745c4fddff8d72be1c9c8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_atomic.c:10:10: fatal error: dp_drm.h: No such file or directory
      10 | #include "dp_drm.h"
         |          ^~~~~~~~~~
   compilation terminated.


vim +10 drivers/gpu/drm/msm/msm_atomic.c

     9	
  > 10	#include "dp_drm.h"
    11	#include "msm_atomic_trace.h"
    12	#include "msm_drv.h"
    13	#include "msm_gem.h"
    14	#include "msm_kms.h"
    15	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
