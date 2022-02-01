Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5CC4A6843
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 23:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242385AbiBAWzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 17:55:41 -0500
Received: from mga12.intel.com ([192.55.52.136]:48878 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241098AbiBAWzk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 17:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643756140; x=1675292140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KZwbuAEZV1Yl9JchUYv22xVHMgTH9DX8N1sFwc4oOvs=;
  b=Qf2Upm45ivXalXQmL25KRM1t3RMqzFgBqYlfyYMKjoXeKA+sdzYQd4C6
   CajvzVh9Llmqn4cxuSuscEhSa1uAgS7AgAkBfjL1fQ+C+YKRIr/keiEar
   MKDL7BYFxs76qujXQJCkZaNX1CSYWfZjLB6vxQxkmU5d+2qTV4kT9awl4
   3vA46ioKM/sbk3pfDFlNLH0FMuNdIfGBKIYjArceXQdBJD9Al+M1MPcGs
   Ssm7YzmEfQ7K1VW6Esy5vFyMM3KgCc5C5cw90VneWASxnMecd9mD6Twa0
   9L+hDDoAbaEXlmtEaT9TqAGIFb7mujdOsaNR/6So99HcbY7AYE0iBLdAv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="227782232"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="227782232"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 14:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="599376568"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2022 14:55:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nF23R-000ToW-6w; Tue, 01 Feb 2022 22:55:17 +0000
Date:   Wed, 2 Feb 2022 06:54:56 +0800
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
Message-ID: <202202020658.FJTV4CAp-lkp@intel.com>
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
config: arc-randconfig-r043-20220130 (https://download.01.org/0day-ci/archive/20220202/202202020658.FJTV4CAp-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c3da64f5022acf9d942f497a3e3cff092648d6c3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-dpu-simplify-IRQ-helpers/20220201-231430
        git checkout c3da64f5022acf9d942f497a3e3cff092648d6c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:973,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:34:
   drivers/gpu/drm/msm/disp/dpu1/./dpu_trace.h: In function 'ftrace_test_probe_dpu_core_irq_unregister_callback':
>> include/trace/trace_events.h:870:42: error: passing argument 1 of 'check_trace_callback_type_dpu_core_irq_unregister_callback' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   cc1: some warnings being treated as errors


vim +/check_trace_callback_type_dpu_core_irq_unregister_callback +870 include/trace/trace_events.h

46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  830) 
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  831) #undef DECLARE_EVENT_CLASS
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  832) #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)	\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  833) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  834) static notrace void							\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  835) trace_event_raw_event_##call(void *__data, proto)			\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  836) {									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  837) 	struct trace_event_file *trace_file = __data;			\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  838) 	struct trace_event_data_offsets_##call __maybe_unused __data_offsets;\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  839) 	struct trace_event_buffer fbuffer;				\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  840) 	struct trace_event_raw_##call *entry;				\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  841) 	int __data_size;						\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  842) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  843) 	if (trace_trigger_soft_disabled(trace_file))			\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  844) 		return;							\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  845) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  846) 	__data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  847) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  848) 	entry = trace_event_buffer_reserve(&fbuffer, trace_file,	\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  849) 				 sizeof(*entry) + __data_size);		\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  850) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  851) 	if (!entry)							\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  852) 		return;							\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  853) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  854) 	tstruct								\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  855) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  856) 	{ assign; }							\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  857) 									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  858) 	trace_event_buffer_commit(&fbuffer);				\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  859) }
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  860) /*
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  861)  * The ftrace_test_probe is compiled out, it is only here as a build time check
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  862)  * to make sure that if the tracepoint handling changes, the ftrace probe will
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  863)  * fail to compile unless it too is updated.
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  864)  */
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  865) 
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  866) #undef DEFINE_EVENT
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  867) #define DEFINE_EVENT(template, call, proto, args)			\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  868) static inline void ftrace_test_probe_##call(void)			\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  869) {									\
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23 @870) 	check_trace_callback_type_##call(trace_event_raw_event_##template); \
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  871) }
46ac51822a6a0b8 Steven Rostedt (Red Hat  2015-09-23  872) 

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
