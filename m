Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903FD4A6798
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 23:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiBAWOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 17:14:16 -0500
Received: from mga07.intel.com ([134.134.136.100]:10395 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229971AbiBAWOP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 17:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643753655; x=1675289655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7N3Q5Ni1DLk6hYg7jdM2Dvd7SeaAS+/pg1uZRQJ6UzI=;
  b=fq6kBo28FWoVbl5XCwYwbxlElEJaBVjwYGZpb4jOpTOVRc5n0VyGpncK
   FH/2EdVcOwOlyCNa0cCg+0HlbmMDFUgru3NCOcaD5UFFjPd94DNyn2Du3
   pw4DZLE/Zh4vn5VCT5qP7in8c4SxSppqSFOlaWFWC+N4uMZRSjYAoSsHd
   PfldQBQdzaM1PnBM0IZt9AbprI1AIWmdWyR2TraECFxwWC2e6IgpMqb8N
   IBZ0+1DM66VOjnXBTDLr4yJDuTFwWg7fF1PX3YDuT+WTCtsWCrIrnq897
   kNAQh8qxebzDmL+v47D4YxNulj35ctXjaYYXp3Hg9E2VeuuuDdTqZI5iw
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="311117259"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="311117259"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 14:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="698576797"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Feb 2022 14:14:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nF1Pf-000TlW-TL; Tue, 01 Feb 2022 22:14:11 +0000
Date:   Wed, 2 Feb 2022 06:14:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/msm/dpu: allow just single IRQ callback
Message-ID: <202202020613.VjszN4M6-lkp@intel.com>
References: <20220201151056.2480055-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201151056.2480055-4-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.17-rc2 next-20220201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Baryshkov/drm-msm-dpu-simplify-IRQ-helpers/20220201-231430
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: s390-randconfig-r044-20220130 (https://download.01.org/0day-ci/archive/20220202/202202020613.VjszN4M6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c3da64f5022acf9d942f497a3e3cff092648d6c3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-dpu-simplify-IRQ-helpers/20220201-231430
        git checkout c3da64f5022acf9d942f497a3e3cff092648d6c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:973,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:34:
   drivers/gpu/drm/msm/disp/dpu1/./dpu_trace.h: In function 'ftrace_test_probe_dpu_core_irq_unregister_callback':
   include/trace/trace_events.h:870:42: error: passing argument 1 of 'check_trace_callback_type_dpu_core_irq_unregister_callback' from incompatible pointer type [-Werror=incompatible-pointer-types]
     870 |         check_trace_callback_type_##call(trace_event_raw_event_##template); \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          void (*)(void *, int,  void *)
   drivers/gpu/drm/msm/disp/dpu1/./dpu_trace.h:892:1: note: in expansion of macro 'DEFINE_EVENT'
     892 | DEFINE_EVENT(dpu_core_irq_callback_template, dpu_core_irq_unregister_callback,
         | ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:10,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:34:
   include/linux/tracepoint.h:279:49: note: expected 'void (*)(void *, int)' but argument is of type 'void (*)(void *, int,  void *)'
     279 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                          ~~~~~~~^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:419:9: note: in expansion of macro '__DECLARE_TRACE'
     419 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:542:9: note: in expansion of macro 'DECLARE_TRACE'
     542 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:892:1: note: in expansion of macro 'DEFINE_EVENT'
     892 | DEFINE_EVENT(dpu_core_irq_callback_template, dpu_core_irq_unregister_callback,
         | ^~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:973,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:34:
   drivers/gpu/drm/msm/disp/dpu1/./dpu_trace.h: In function 'perf_test_probe_dpu_core_irq_unregister_callback':
>> include/trace/perf.h:99:42: error: passing argument 1 of 'check_trace_callback_type_dpu_core_irq_unregister_callback' from incompatible pointer type [-Werror=incompatible-pointer-types]
      99 |         check_trace_callback_type_##call(perf_trace_##template);        \
         |                                          ^~~~~~~~~~~
         |                                          |
         |                                          void (*)(void *, int,  void *)
   drivers/gpu/drm/msm/disp/dpu1/./dpu_trace.h:892:1: note: in expansion of macro 'DEFINE_EVENT'
     892 | DEFINE_EVENT(dpu_core_irq_callback_template, dpu_core_irq_unregister_callback,
         | ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:10,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:34:
   include/linux/tracepoint.h:279:49: note: expected 'void (*)(void *, int)' but argument is of type 'void (*)(void *, int,  void *)'
     279 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                          ~~~~~~~^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:419:9: note: in expansion of macro '__DECLARE_TRACE'
     419 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:542:9: note: in expansion of macro 'DECLARE_TRACE'
     542 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:892:1: note: in expansion of macro 'DEFINE_EVENT'
     892 | DEFINE_EVENT(dpu_core_irq_callback_template, dpu_core_irq_unregister_callback,
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/check_trace_callback_type_dpu_core_irq_unregister_callback +99 include/trace/perf.h

ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   89) 
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   90) /*
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   91)  * This part is compiled out, it is only here as a build time check
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   92)  * to make sure that if the tracepoint handling changes, the
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   93)  * perf probe will fail to compile unless it too is updated.
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   94)  */
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   95) #undef DEFINE_EVENT
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   96) #define DEFINE_EVENT(template, call, proto, args)			\
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   97) static inline void perf_test_probe_##call(void)				\
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29   98) {									\
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29  @99) 	check_trace_callback_type_##call(perf_trace_##template);	\
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29  100) }
ee53bbd172571c Steven Rostedt (Red Hat  2015-04-29  101) 

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
