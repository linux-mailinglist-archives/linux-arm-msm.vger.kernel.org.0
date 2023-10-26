Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5936F7D7CE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 08:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbjJZGeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 02:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344160AbjJZGeQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 02:34:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E090B193
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 23:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698302053; x=1729838053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WnfySFta4QeyblMHJF2qrIR4NYcvPeowwA+r9sQNFkE=;
  b=bFns+CxAI7+GmwI8K8JHX64j6uEXa4K0t5q6UBalMnN+8WkibW+VYWWl
   jH6c7uLamrsYBzi3BkiiFSe2Wzsu1kVypM9h6NL6BPIicIeDwXJCj18QQ
   kKJ3xZT1sY/8kgNiL+yV2Axh4nc9pEkBgw0XAvaleFVMaNB8qmQJRdrGq
   AP22BMU3C0NsU+rMFdaRiSsMAwtU9pFkqwQiMKDe5fIXVMEuE0qPVIWVu
   o0g7BBSm4sMgxV9CSv86vVLN/BEAU+2AK0UNpN3RfJBoBW+IrnQaynDnr
   xqiHGHZ2YuUYc+wis2Zf5bjjZh1NODm/Ugp6970HCclozc/szMRegE3aL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387297541"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="387297541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 23:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="6818850"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2023 23:32:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qvtwQ-0009Z4-2S;
        Thu, 26 Oct 2023 06:34:02 +0000
Date:   Thu, 26 Oct 2023 14:33:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Matthew Brost <matthew.brost@intel.com>,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc:     oe-kbuild-all@lists.linux.dev, Emma Anholt <emma@anholt.net>,
        lina@asahilina.net, Liviu.Dudau@arm.com,
        Matthew Brost <matthew.brost@intel.com>,
        robdclark@chromium.org, lima@lists.freedesktop.org,
        mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
        donald.robson@imgtec.com,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
        ketil.johnsen@arm.com, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        etnaviv@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        nouveau@lists.freedesktop.org, faith.ekstrand@collabora.com,
        boris.brezillon@collabora.com, Qiang Yu <yuq825@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org, christian.koenig@amd.com
Subject: Re: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable
 number of run-queues
Message-ID: <202310261439.3rbAtEoB-lkp@intel.com>
References: <20231026041236.1273694-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026041236.1273694-4-matthew.brost@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 201c8a7bd1f3f415920a2df4b8a8817e973f42fe]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_wqueue_-helpers/20231026-121313
base:   201c8a7bd1f3f415920a2df4b8a8817e973f42fe
patch link:    https://lore.kernel.org/r/20231026041236.1273694-4-matthew.brost%40intel.com
patch subject: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable number of run-queues
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310261439.3rbAtEoB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261439.3rbAtEoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261439.3rbAtEoB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/etnaviv/etnaviv_sched.c: In function 'etnaviv_sched_init':
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:138:30: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     138 |                              DRM_SCHED_PRIORITY_COUNT, NULL,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
         |                              |
         |                              int
   In file included from drivers/gpu/drm/etnaviv/etnaviv_drv.h:20,
                    from drivers/gpu/drm/etnaviv/etnaviv_sched.c:8:
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/m68k/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/moduleparam.h:5,
                    from drivers/gpu/drm/etnaviv/etnaviv_sched.c:6:
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/etnaviv/etnaviv_sched.c:138:56: note: in expansion of macro 'NULL'
     138 |                              DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                        ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~
--
   drivers/gpu/drm/lima/lima_sched.c: In function 'lima_sched_pipe_init':
>> drivers/gpu/drm/lima/lima_sched.c:492:31: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     492 |                               DRM_SCHED_PRIORITY_COUNT, NULL, 1,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   In file included from drivers/gpu/drm/lima/lima_sched.h:7,
                    from drivers/gpu/drm/lima/lima_device.h:12,
                    from drivers/gpu/drm/lima/lima_ctx.h:10,
                    from drivers/gpu/drm/lima/lima_drv.h:9,
                    from drivers/gpu/drm/lima/lima_sched.c:11:
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/io.h:9,
                    from include/linux/iosys-map.h:10,
                    from drivers/gpu/drm/lima/lima_sched.c:4:
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/lima/lima_sched.c:492:57: note: in expansion of macro 'NULL'
     492 |                               DRM_SCHED_PRIORITY_COUNT, NULL, 1,
         |                                                         ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~
--
   drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>> drivers/gpu/drm/v3d/v3d_sched.c:391:50: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     391 |                              &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   In file included from drivers/gpu/drm/v3d/v3d_drv.h:12,
                    from drivers/gpu/drm/v3d/v3d_sched.c:23:
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/m68k/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/err.h:5,
                    from include/linux/kthread.h:5,
                    from drivers/gpu/drm/v3d/v3d_sched.c:21:
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/v3d/v3d_sched.c:391:76: note: in expansion of macro 'NULL'
     391 |                              &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                                            ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~
   drivers/gpu/drm/v3d/v3d_sched.c:399:53: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     399 |                              &v3d_render_sched_ops, DRM_SCHED_PRIORITY_COUNT,
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     int
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/v3d/v3d_sched.c:400:30: note: in expansion of macro 'NULL'
     400 |                              NULL, hw_jobs_limit, job_hang_limit,
         |                              ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~
   drivers/gpu/drm/v3d/v3d_sched.c:407:50: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     407 |                              &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/v3d/v3d_sched.c:407:76: note: in expansion of macro 'NULL'
     407 |                              &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                                            ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~
   drivers/gpu/drm/v3d/v3d_sched.c:417:38: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     417 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/v3d/v3d_sched.c:417:64: note: in expansion of macro 'NULL'
     417 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                                ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~
   drivers/gpu/drm/v3d/v3d_sched.c:426:38: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
     426 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
     530 |                    struct workqueue_struct *submit_wq,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/v3d/v3d_sched.c:426:64: note: in expansion of macro 'NULL'
     426 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
         |                                                                ^~~~
   include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
     531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
         |                    ~~~~^~~~~~~


vim +/drm_sched_init +138 drivers/gpu/drm/etnaviv/etnaviv_sched.c

   132	
   133	int etnaviv_sched_init(struct etnaviv_gpu *gpu)
   134	{
   135		int ret;
   136	
   137		ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 > 138				     DRM_SCHED_PRIORITY_COUNT, NULL,
   139				     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
   140				     msecs_to_jiffies(500), NULL, NULL,
   141				     dev_name(gpu->dev), gpu->dev);
   142		if (ret)
   143			return ret;
   144	
   145		return 0;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
