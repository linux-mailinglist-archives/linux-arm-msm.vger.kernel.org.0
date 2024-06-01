Return-Path: <linux-arm-msm+bounces-21374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF48D6D43
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 03:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DF51286C9F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 01:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73EA23A8;
	Sat,  1 Jun 2024 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXQxvuF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE4A29;
	Sat,  1 Jun 2024 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717205436; cv=none; b=EaX0m7j7tR09S0KL3/J8EhSHxgBmHJLr+QEQksO/1bJIDs6CmL9pRoQNyaUbXSi4BwQX3LfGk848XTww//C9u5+PPx32NJ1cq6G3dE6xQAxEppm6rxGOOrnt/VGPOu25vF5ePPeuLjm5sEjTCDdAUBaUz7YI3UA/pc5PX/E9HWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717205436; c=relaxed/simple;
	bh=4vVXCbo2qncyG62dU78GhZ9CGyoVD8kLIL49/nRG1sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMVK21HT43jhoRnuT+aFuX/LSv3n5QsGhO7wWXf072akuZ8Ayf4Pxww/1tHqnlvTKZIojaK4y2dVOstpmFL+I/VxH/zo9Y21Wp8ZFSybIVWprSxfA9cxIFkHZsEy1lfJeK3GA2lyVxG5VXyJaYV9NwMu9+/5TBeMxVoGbcQHRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXQxvuF7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717205435; x=1748741435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4vVXCbo2qncyG62dU78GhZ9CGyoVD8kLIL49/nRG1sw=;
  b=PXQxvuF7A93zyP5H3Mmxyn4hUwKjxzw3pYr5xll7OcpKx83EyjUpzXn8
   fFB+cnkCna3nvP7tSmDYvUuuGBoUDk2Wv4RNJm8aPQ9yIa6s/ctfxVMoa
   U+a8SE5w23HwCnF1szevLCT/ZVeZs3ydW22+cbi3af1e8kVaC39k/9MmS
   xAdvE/9K/9UamW5T6PxgS2QXIJH5sTF98Mbp+2vLdaXG2o6o64qvAt9yp
   8KgeleZzphsFhvXdaB75vYW2B/KdFCLkw1DYTc7DmthL2CReeDJaIMkMS
   C1fdYBXpQXcKXBoBkRyR9uaEiVxtobBYkhLVRIMBelm6ZtXarZm66GAWl
   A==;
X-CSE-ConnectionGUID: vIVKyp12QWKPOT4jeLK6qg==
X-CSE-MsgGUID: ImO9eS+4TZmnLIqueKnrLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25170707"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="25170707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 18:30:35 -0700
X-CSE-ConnectionGUID: 1slEms+9R0CyL8fdyJBZAg==
X-CSE-MsgGUID: eNanURYwRpeQz6Zks9h0JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="36414964"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2024 18:30:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDDZk-000I5X-2S;
	Sat, 01 Jun 2024 01:30:28 +0000
Date: Sat, 1 Jun 2024 09:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in
 bwmon_intr_thread
Message-ID: <202406010720.b2TIAmY8-lkp@intel.com>
References: <20240531105404.879267-1-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531105404.879267-1-quic_kshivnan@quicinc.com>

Hi Shivnandan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivnandan-Kumar/soc-qcom-icc-bwmon-Add-tracepoints-in-bwmon_intr_thread/20240531-185658
base:   linus/master
patch link:    https://lore.kernel.org/r/20240531105404.879267-1-quic_kshivnan%40quicinc.com
patch subject: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240601/202406010720.b2TIAmY8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010720.b2TIAmY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010720.b2TIAmY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/qcom/icc-bwmon.c:11:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/soc/qcom/icc-bwmon.c:11:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/soc/qcom/icc-bwmon.c:11:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/soc/qcom/icc-bwmon.c:21:
   In file included from drivers/soc/qcom/trace_icc-bwmon.h:49:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/soc/qcom/icc-bwmon.c:21:
   In file included from drivers/soc/qcom/trace_icc-bwmon.h:49:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> drivers/soc/qcom/trace_icc-bwmon.h:28:22: error: too many arguments provided to function-like macro invocation
      28 |                 __assign_str(name, name);
         |                                    ^
   include/trace/stages/stage6_event_callback.h:34:9: note: macro '__assign_str' defined here
      34 | #define __assign_str(dst)                                               \
         |         ^
   In file included from drivers/soc/qcom/icc-bwmon.c:21:
   In file included from drivers/soc/qcom/trace_icc-bwmon.h:49:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> drivers/soc/qcom/trace_icc-bwmon.h:28:3: error: use of undeclared identifier '__assign_str'
      28 |                 __assign_str(name, name);
         |                 ^
   In file included from drivers/soc/qcom/icc-bwmon.c:21:
   In file included from drivers/soc/qcom/trace_icc-bwmon.h:49:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:469:
>> drivers/soc/qcom/trace_icc-bwmon.h:28:22: error: too many arguments provided to function-like macro invocation
      28 |                 __assign_str(name, name);
         |                                    ^
   include/trace/stages/stage6_event_callback.h:34:9: note: macro '__assign_str' defined here
      34 | #define __assign_str(dst)                                               \
         |         ^
   In file included from drivers/soc/qcom/icc-bwmon.c:21:
   In file included from drivers/soc/qcom/trace_icc-bwmon.h:49:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> drivers/soc/qcom/trace_icc-bwmon.h:28:22: error: too many arguments provided to function-like macro invocation
      28 |                 __assign_str(name, name);
         |                                    ^
   include/trace/stages/stage6_event_callback.h:34:9: note: macro '__assign_str' defined here
      34 | #define __assign_str(dst)                                               \
         |         ^
   In file included from drivers/soc/qcom/icc-bwmon.c:21:
   In file included from drivers/soc/qcom/trace_icc-bwmon.h:49:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> drivers/soc/qcom/trace_icc-bwmon.h:28:3: error: use of undeclared identifier '__assign_str'
      28 |                 __assign_str(name, name);
         |                 ^
   7 warnings and 5 errors generated.


vim +28 drivers/soc/qcom/trace_icc-bwmon.h

    14	
    15		TP_PROTO(const char *name,
    16			 unsigned int meas_kbps, unsigned int up_kbps, unsigned int down_kbps),
    17	
    18		TP_ARGS(name, meas_kbps, up_kbps, down_kbps),
    19	
    20		TP_STRUCT__entry(
    21			__string(name, name)
    22			__field(unsigned int, meas_kbps)
    23			__field(unsigned int, up_kbps)
    24			__field(unsigned int, down_kbps)
    25		),
    26	
    27		TP_fast_assign(
  > 28			__assign_str(name, name);
    29			__entry->meas_kbps = meas_kbps;
    30			__entry->up_kbps = up_kbps;
    31			__entry->down_kbps = down_kbps;
    32		),
    33	
    34		TP_printk("name=%s meas_kbps=%u up_kbps=%u down_kbps=%u",
    35			__get_str(name),
    36			__entry->meas_kbps,
    37			__entry->up_kbps,
    38			__entry->down_kbps)
    39	);
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

