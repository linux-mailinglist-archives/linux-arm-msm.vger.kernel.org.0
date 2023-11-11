Return-Path: <linux-arm-msm+bounces-507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F727E8C15
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 19:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB26280E0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 18:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8481C29F;
	Sat, 11 Nov 2023 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrIKKdE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D491C297;
	Sat, 11 Nov 2023 18:19:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9022D77;
	Sat, 11 Nov 2023 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699726783; x=1731262783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBCw9mofHRJSzFvzwiP3EWR07pcL46O0tLTa9AB5JR0=;
  b=KrIKKdE94/wKKoSVi/uPtOiE7MROxicGA61pS/pKR1+L5PgPlV6EUqUe
   AqidzEXR0SMV6+GKaRHbnUnrnJUCHCBWra2XsOskhqEUHXKGjIoNu1DOT
   QIPD/EPjANzDDs5H/Gcdk1kipLnfHL1AUQYtaFTvNfTnMYVXz3egjblEg
   W47a8p7vEPwzBptZuY2vqmRlR9+XfT57MOfAP9FVvklTFiHskKsILidOd
   eY+Csm0Rn+5UJwHhYXQYyRlQHnYl+2bbkGlObDOH1atBylhknpG4vPjGL
   ZXzNovz3xlwGCwCaHRGrCLpVIGY127/ASmTVuyoY1g3ysxHlTZfOk81ab
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="387455164"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="387455164"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 10:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="937408856"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="937408856"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Nov 2023 10:19:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1sa1-000Afh-17;
	Sat, 11 Nov 2023 18:19:37 +0000
Date: Sun, 12 Nov 2023 02:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_parass@quicinc.com,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH v4] bus: mhi: host: Add tracing support
Message-ID: <202311120247.SeMDyRT6-lkp@intel.com>
References: <20231111-ftrace_support-v4-1-c83602399461@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111-ftrace_support-v4-1-c83602399461@quicinc.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3006adf3be79cde4d14b1800b963b82b6e5572e0]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-chaitanya-chundru/bus-mhi-host-Add-tracing-support/20231111-135816
base:   3006adf3be79cde4d14b1800b963b82b6e5572e0
patch link:    https://lore.kernel.org/r/20231111-ftrace_support-v4-1-c83602399461%40quicinc.com
patch subject: [PATCH v4] bus: mhi: host: Add tracing support
config: i386-randconfig-062-20231111 (https://download.01.org/0day-ci/archive/20231112/202311120247.SeMDyRT6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120247.SeMDyRT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120247.SeMDyRT6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/bus/mhi/host/init.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/bus/mhi/host/trace.h):
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: cast to restricted __le64
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: cast to restricted __le32
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: cast to restricted __le32
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:17:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: cast to restricted __le64
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: cast to restricted __le32
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: cast to restricted __le32
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:99:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: cast to restricted __le64
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: cast to restricted __le32
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: cast to restricted __le32
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: restricted __le32 degrades to integer
   drivers/bus/mhi/host/init.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/bus/mhi/host/trace.h):
>> drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: non size-preserving pointer to integer cast
   drivers/bus/mhi/host/init.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, drivers/bus/mhi/host/trace.h):
>> drivers/bus/mhi/host/./trace.h:123:1: sparse: sparse: non size-preserving pointer to integer cast

vim +123 drivers/bus/mhi/host/./trace.h

   122	
 > 123	TRACE_EVENT(mhi_process_ctrl_ev_ring,
   124	
   125		TP_PROTO(const char *name, struct mhi_ring_element *rp, __le64 ptr,
   126			 __le32 dword0, __le32 dword1),
   127	
   128		TP_ARGS(name, rp, ptr, dword0, dword1),
   129	
   130		TP_STRUCT__entry(
   131			__field(u64, rp)
   132			__field(__le64, ptr)
   133			__string(name, name)
   134			__field(__le32, dword0)
   135			__field(__le32, dword1)
   136			__field(int, state)
   137		),
   138	
   139		TP_fast_assign(
   140			__assign_str(name, name);
   141			__entry->rp = (u64)rp;
   142			__entry->ptr = ptr;
   143			__entry->dword0 = dword0;
   144			__entry->dword1 = dword1;
   145			__entry->state = MHI_TRE_GET_EV_STATE(rp);
   146		),
   147	
   148		TP_printk("%s: RP:0x%llx Processing Event:0x%llx 0x%08x 0x%08x state:%s\n",
   149			  __get_str(name), __entry->rp, __entry->ptr, __entry->dword0,
   150			  __entry->dword1, mhi_state_str(__entry->state))
   151	);
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

