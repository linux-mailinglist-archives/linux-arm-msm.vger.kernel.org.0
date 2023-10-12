Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5167C6556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 08:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343516AbjJLGVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 02:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343510AbjJLGVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 02:21:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8626CB7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697091659; x=1728627659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1bZ8+h/DIJAKATih37V0J7o5Z2gXCEV6FgRc+AtIDI=;
  b=AsRgXVRfiGuIf4/1qxvXaU/ts+r6US77lLf9msQWmw7YVD3vN2SfmPzl
   6fTyczJfsthVm71QCDINcmJaoyiFl1M7RZ9m2wY/+2yz46zdpb0wBvGeu
   uzK3ZofvpUctYoUUhFR9yBj/2CRBOfJjh7Oio1cU4UDHuM1igWB2UMkSZ
   yIAH7bQVnDM9Z0wfG6vlobi7nMAr/U1wMeo4XvR+J7J3tX7zQvG6ZmOn/
   ges86iDT1HHW3vtvjqVdQHUjlIbs3aHyyNyqqKqSBHU+VZscpdBqXVv+Z
   U7usFFE9tv9qlPM9D0jWrz0/GvyD0gaBmZfhN8elSm+/9MtU+kr6bFC8b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415893304"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="415893304"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="820014232"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="820014232"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2023 23:20:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qqp42-0003GP-1c;
        Thu, 12 Oct 2023 06:20:54 +0000
Date:   Thu, 12 Oct 2023 14:20:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_ajitpals@quicinc.com,
        quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] accel/qaic: Add support for periodic timesync
Message-ID: <202310121429.uVQ0tmmi-lkp@intel.com>
References: <20231006163210.21319-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006163210.21319-2-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20231011]
[cannot apply to linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/accel-qaic-Add-support-for-periodic-timesync/20231007-003324
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231006163210.21319-2-quic_jhugo%40quicinc.com
patch subject: [PATCH 1/2] accel/qaic: Add support for periodic timesync
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121429.uVQ0tmmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121429.uVQ0tmmi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/accel/qaic/aic100.rst:227: WARNING: Unknown target name: "qaic_timesync".

vim +/qaic_timesync +227 Documentation/accel/qaic/aic100.rst

   187	
   188	+----------------+---------+----------+----------------------------------------+
   189	| Channel name   | IDs     | EEs      | Purpose                                |
   190	+================+=========+==========+========================================+
   191	| QAIC_LOOPBACK  | 0 & 1   | AMSS     | Any data sent to the device on this    |
   192	|                |         |          | channel is sent back to the host.      |
   193	+----------------+---------+----------+----------------------------------------+
   194	| QAIC_SAHARA    | 2 & 3   | SBL      | Used by SBL to obtain the runtime      |
   195	|                |         |          | firmware from the host.                |
   196	+----------------+---------+----------+----------------------------------------+
   197	| QAIC_DIAG      | 4 & 5   | AMSS     | Used to communicate with QSM via the   |
   198	|                |         |          | DIAG protocol.                         |
   199	+----------------+---------+----------+----------------------------------------+
   200	| QAIC_SSR       | 6 & 7   | AMSS     | Used to notify the host of subsystem   |
   201	|                |         |          | restart events, and to offload SSR     |
   202	|                |         |          | crashdumps.                            |
   203	+----------------+---------+----------+----------------------------------------+
   204	| QAIC_QDSS      | 8 & 9   | AMSS     | Used for the Qualcomm Debug Subsystem. |
   205	+----------------+---------+----------+----------------------------------------+
   206	| QAIC_CONTROL   | 10 & 11 | AMSS     | Used for the Neural Network Control    |
   207	|                |         |          | (NNC) protocol. This is the primary    |
   208	|                |         |          | channel between host and QSM for       |
   209	|                |         |          | managing workloads.                    |
   210	+----------------+---------+----------+----------------------------------------+
   211	| QAIC_LOGGING   | 12 & 13 | SBL      | Used by the SBL to send the bootlog to |
   212	|                |         |          | the host.                              |
   213	+----------------+---------+----------+----------------------------------------+
   214	| QAIC_STATUS    | 14 & 15 | AMSS     | Used to notify the host of Reliability,|
   215	|                |         |          | Accessibility, Serviceability (RAS)    |
   216	|                |         |          | events.                                |
   217	+----------------+---------+----------+----------------------------------------+
   218	| QAIC_TELEMETRY | 16 & 17 | AMSS     | Used to get/set power/thermal/etc      |
   219	|                |         |          | attributes.                            |
   220	+----------------+---------+----------+----------------------------------------+
   221	| QAIC_DEBUG     | 18 & 19 | AMSS     | Not used.                              |
   222	+----------------+---------+----------+----------------------------------------+
   223	| QAIC_TIMESYNC  | 20 & 21 | SBL/AMSS | Used to synchronize timestamps in the  |
   224	|                |         |          | device side logs with the host time    |
   225	|                |         |          | source.                                |
   226	+----------------+---------+----------+----------------------------------------+
 > 227	| QAIC_TIMESYNC_ | 22 & 23 | AMSS     | Used to periodically synchronize       |
   228	| PERIODIC       |         |          | timestamps in the device side logs with|
   229	|                |         |          | the host time source.                  |
   230	+----------------+---------+----------+----------------------------------------+
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
