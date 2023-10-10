Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01C67BFCF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 15:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjJJNKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 09:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjJJNKe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 09:10:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECB1AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696943431; x=1728479431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LfvkyWWgd3eiHj7mOmx4QZJ3G+O2ECJyREGq8SLfUKo=;
  b=MgTpigNlv7moRGIYCRXGSHNnwgKacpf4Rsx30U/K0wrqRsfTOGiP43eE
   qTO1DIgo8PY8NBo3BccF2UMbYCOtmPlDd0J+bfXvcbNK/Z/Ys6F4adOUR
   mkI9qVHfHuiKgyfw2sn5b9Nvc9X8lkbpHEwawhMlvOiFSbPRUYoojjTcq
   xgbaynVK+bybXhizt1s0vmMpr6Kub0GmlS6HERuk+qjDfx4SpEUZ1iDOI
   kcEzbRN7ccv0Keeh7ctVHQTO2Knb6Cx4oWRnODeSyakhBKYHEk1GHdlYv
   6B6FMC8ZNuGVQAU7qJwhsKpOcdZACy/vCnhne0RdpUcNRIyIGOUgLsW85
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470651152"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="470651152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897186185"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="897186185"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 06:06:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qqCTC-0000SW-2x;
        Tue, 10 Oct 2023 13:08:19 +0000
Date:   Tue, 10 Oct 2023 21:08:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_ajitpals@quicinc.com,
        quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] accel/qaic: Add support for periodic timesync
Message-ID: <202310102021.xKVfIhRT-lkp@intel.com>
References: <20231006163210.21319-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006163210.21319-2-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20231010]
[cannot apply to linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/accel-qaic-Add-support-for-periodic-timesync/20231007-003324
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231006163210.21319-2-quic_jhugo%40quicinc.com
patch subject: [PATCH 1/2] accel/qaic: Add support for periodic timesync
config: powerpc-randconfig-003-20231010 (https://download.01.org/0day-ci/archive/20231010/202310102021.xKVfIhRT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102021.xKVfIhRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102021.xKVfIhRT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/qaic/qaic_timesync.c: In function 'qaic_timesync_timer':
>> drivers/accel/qaic/qaic_timesync.c:125:25: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     125 |         device_qtimer = readq(mqtsdev->qtimer_addr);
         |                         ^~~~~
         |                         readl
   cc1: some warnings being treated as errors


vim +125 drivers/accel/qaic/qaic_timesync.c

   102	
   103	static void qaic_timesync_timer(struct timer_list *t)
   104	{
   105		struct mqts_dev *mqtsdev = from_timer(mqtsdev, t, timer);
   106		struct qts_host_time_sync_msg_data *sync_msg;
   107		u64 device_qtimer_us;
   108		u64 device_qtimer;
   109		u64 host_time_us;
   110		u64 offset_us;
   111		u64 host_sec;
   112		int ret;
   113	
   114		if (atomic_read(&mqtsdev->buff_in_use)) {
   115			dev_dbg(mqtsdev->dev, "%s buffer not free, schedule next cycle\n", __func__);
   116			goto mod_timer;
   117		}
   118		atomic_set(&mqtsdev->buff_in_use, 1);
   119	
   120		sync_msg = mqtsdev->sync_msg;
   121		sync_msg->header.signature = cpu_to_le16(QAIC_TIMESYNC_SIGNATURE);
   122		sync_msg->header.msg_type = QAIC_TS_SYNC_REQ;
   123		/* Read host UTC time and convert to uS*/
   124		host_time_us = div_u64(ktime_get_real_ns(), NSEC_PER_USEC);
 > 125		device_qtimer = readq(mqtsdev->qtimer_addr);
   126		device_qtimer_us = QAIC_CONV_QTIMER_TO_US(device_qtimer);
   127		/* Offset between host UTC and device time */
   128		offset_us = host_time_us - device_qtimer_us;
   129	
   130		host_sec = div_u64(offset_us, USEC_PER_SEC);
   131		sync_msg->data.tv_usec = cpu_to_le64(offset_us - host_sec * USEC_PER_SEC);
   132		sync_msg->data.tv_sec = cpu_to_le64(host_sec);
   133		ret = mhi_queue_buf(mqtsdev->mhi_dev, DMA_TO_DEVICE, sync_msg, sizeof(*sync_msg), MHI_EOT);
   134		if (ret && (ret != -EAGAIN)) {
   135			dev_err(mqtsdev->dev, "%s unable to queue to mhi:%d\n", __func__, ret);
   136			return;
   137		} else if (ret == -EAGAIN) {
   138			atomic_set(&mqtsdev->buff_in_use, 0);
   139		}
   140	
   141	mod_timer:
   142		ret = mod_timer(t, jiffies + msecs_to_jiffies(timesync_delay_ms));
   143		if (ret)
   144			dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
