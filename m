Return-Path: <linux-arm-msm+bounces-24661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC591C506
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C50C4284A5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A323A1CCCBB;
	Fri, 28 Jun 2024 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc2Q+52D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAB31C9ECF;
	Fri, 28 Jun 2024 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719596275; cv=none; b=IJjDASEiiEltCWoWZuhDFn/k/g3UI96Qj3BCwoS+nPG1ViI1uv1ql21bRfT0P+L4RL5/226sZqInTV1T7wknfbseBsyqzas5siZEyq1XiK0y/DcUi9zPKhdCYwxE+HGb3Qe3GdMBXIJGEh5//ATnKw4Rengxf32WJnVsLhg8uQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719596275; c=relaxed/simple;
	bh=qPFeIWVXm8Kv85+s+qgwv+YqdPUZnd5cXgY0w4SHw6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atoUJWyWHtUyYTtyzrJ2+vQQgQEI96zQkPeGnqyskJmzfJs6APqi57gVg6qP/PNDQN0DIxg7Bd3MipQa89I4zdEpovClaTZGR/puLxMTJLBrI0mSOz+5XretTfh4DYqn+R/2aLO1PCwNBQ8KsaNdnlfAqXkpXep3jvp6Io1bZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc2Q+52D; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719596273; x=1751132273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qPFeIWVXm8Kv85+s+qgwv+YqdPUZnd5cXgY0w4SHw6M=;
  b=Hc2Q+52D5sG7wDCZL3sWDxOzMiOR9DXdXX/Nnp3ykojkSAg/pGIbc++O
   ehfMCmi5MFV893y+e3sFikgaCmd0QgjT+t/l7kLkCHp4DUOqhRIS9/UWn
   dDHw3C4k8EMnQ3fPJjj1u3lq5/G8UjvMfRSVafhR+lR1IpqZ1igsKrOBh
   Au2OL+FnvxT4+U4x5AD5tp4WGS4RsUhuhu64vbhfiEiyvQeccFhrGYDOj
   TZkilXF2Ydy4mosyuzm0ZoS4bPsXUwe5uJ66YkB3JlEDImInx8CcQGARN
   98j1zWMR0sVYeGKltF5xZl/HxP95JawymJBmbXMfICXWkiCepPKvCQUX1
   Q==;
X-CSE-ConnectionGUID: 8pT627LxRaaWs8wjukCkkw==
X-CSE-MsgGUID: d71IstcVQM6ooLvuUKO0FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16526229"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16526229"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 10:37:52 -0700
X-CSE-ConnectionGUID: 7AHxoUbyTFybu//5upRrJQ==
X-CSE-MsgGUID: idLp97qGQQSbgHV5vhOiKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44918609"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2024 10:37:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNFXf-000Hcs-0q;
	Fri, 28 Jun 2024 17:37:47 +0000
Date: Sat, 29 Jun 2024 01:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, quic_bjorande@quicinc.com,
	andersson@kernel.org, quic_clew@quicinc.com,
	mathieu.poirier@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	quic_deesin@quicinc.com, quic_sudeepgo@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH V3 2/2] soc: qcom: smp2p: Introduce tracepoint support
Message-ID: <202406290037.KaJgVUWB-lkp@intel.com>
References: <20240627104831.4176799-3-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627104831.4176799-3-quic_sudeepgo@quicinc.com>

Hi Sudeepgoud,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sudeepgoud-Patil/soc-qcom-smp2p-Use-devname-for-interrupt-descriptions/20240628-061654
base:   linus/master
patch link:    https://lore.kernel.org/r/20240627104831.4176799-3-quic_sudeepgo%40quicinc.com
patch subject: [PATCH V3 2/2] soc: qcom: smp2p: Introduce tracepoint support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240629/202406290037.KaJgVUWB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290037.KaJgVUWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290037.KaJgVUWB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:419,
                    from include/trace/define_trace.h:102,
                    from drivers/soc/qcom/trace-smp2p.h:98,
                    from drivers/soc/qcom/smp2p.c:165:
>> drivers/soc/qcom/./trace-smp2p.h:25:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      25 | );
         | ^~                 
   In file included from include/trace/trace_events.h:375:
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'trace_event_raw_event_smp2p_ssr_ack':
>> drivers/soc/qcom/./trace-smp2p.h:22:17: error: '__assign_str' undeclared (first use in this function)
      22 |                 __assign_str(dev_name, dev_name(dev));
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:15:1: note: in expansion of macro 'TRACE_EVENT'
      15 | TRACE_EVENT(smp2p_ssr_ack,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:21:9: note: in expansion of macro 'TP_fast_assign'
      21 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:22:17: note: each undeclared identifier is reported only once for each function it appears in
      22 |                 __assign_str(dev_name, dev_name(dev));
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:15:1: note: in expansion of macro 'TRACE_EVENT'
      15 | TRACE_EVENT(smp2p_ssr_ack,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:21:9: note: in expansion of macro 'TP_fast_assign'
      21 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h: At top level:
   drivers/soc/qcom/./trace-smp2p.h:42:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      42 | );
         | ^~                 
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'trace_event_raw_event_smp2p_negotiate':
   drivers/soc/qcom/./trace-smp2p.h:35:17: error: '__assign_str' undeclared (first use in this function)
      35 |                 __assign_str(dev_name, dev_name(dev));
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:27:1: note: in expansion of macro 'TRACE_EVENT'
      27 | TRACE_EVENT(smp2p_negotiate,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:34:9: note: in expansion of macro 'TP_fast_assign'
      34 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h: At top level:
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'trace_event_raw_event_smp2p_notify_in':
   drivers/soc/qcom/./trace-smp2p.h:54:17: error: '__assign_str' undeclared (first use in this function)
      54 |                 __assign_str(dev_name, dev_name(smp2p_entry->smp2p->dev));
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:44:1: note: in expansion of macro 'TRACE_EVENT'
      44 | TRACE_EVENT(smp2p_notify_in,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:53:9: note: in expansion of macro 'TP_fast_assign'
      53 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h: At top level:
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'trace_event_raw_event_smp2p_update_bits':
   drivers/soc/qcom/./trace-smp2p.h:77:17: error: '__assign_str' undeclared (first use in this function)
      77 |                 __assign_str(dev_name, dev_name(smp2p_entry->smp2p->dev));
         |                 ^~~~~~~~~~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:67:1: note: in expansion of macro 'TRACE_EVENT'
      67 | TRACE_EVENT(smp2p_update_bits,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:76:9: note: in expansion of macro 'TP_fast_assign'
      76 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:469:
   drivers/soc/qcom/./trace-smp2p.h: At top level:
>> drivers/soc/qcom/./trace-smp2p.h:25:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      25 | );
         | ^~                 
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:42:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      42 | );
         | ^~                 
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   In file included from include/trace/perf.h:75,
                    from include/trace/define_trace.h:103:
>> drivers/soc/qcom/./trace-smp2p.h:25:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      25 | );
         | ^~                 
   In file included from include/trace/perf.h:7:
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'perf_trace_smp2p_ssr_ack':
>> drivers/soc/qcom/./trace-smp2p.h:22:17: error: '__assign_str' undeclared (first use in this function)
      22 |                 __assign_str(dev_name, dev_name(dev));
         |                 ^~~~~~~~~~~~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:15:1: note: in expansion of macro 'TRACE_EVENT'
      15 | TRACE_EVENT(smp2p_ssr_ack,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:21:9: note: in expansion of macro 'TP_fast_assign'
      21 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h: At top level:
   drivers/soc/qcom/./trace-smp2p.h:42:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      42 | );
         | ^~                 
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'perf_trace_smp2p_negotiate':
   drivers/soc/qcom/./trace-smp2p.h:35:17: error: '__assign_str' undeclared (first use in this function)
      35 |                 __assign_str(dev_name, dev_name(dev));
         |                 ^~~~~~~~~~~~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:27:1: note: in expansion of macro 'TRACE_EVENT'
      27 | TRACE_EVENT(smp2p_negotiate,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:34:9: note: in expansion of macro 'TP_fast_assign'
      34 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h: At top level:
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'perf_trace_smp2p_notify_in':
   drivers/soc/qcom/./trace-smp2p.h:54:17: error: '__assign_str' undeclared (first use in this function)
      54 |                 __assign_str(dev_name, dev_name(smp2p_entry->smp2p->dev));
         |                 ^~~~~~~~~~~~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:44:1: note: in expansion of macro 'TRACE_EVENT'
      44 | TRACE_EVENT(smp2p_notify_in,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:53:9: note: in expansion of macro 'TP_fast_assign'
      53 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h: At top level:
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h: In function 'perf_trace_smp2p_update_bits':
   drivers/soc/qcom/./trace-smp2p.h:77:17: error: '__assign_str' undeclared (first use in this function)
      77 |                 __assign_str(dev_name, dev_name(smp2p_entry->smp2p->dev));
         |                 ^~~~~~~~~~~~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/soc/qcom/./trace-smp2p.h:67:1: note: in expansion of macro 'TRACE_EVENT'
      67 | TRACE_EVENT(smp2p_update_bits,
         | ^~~~~~~~~~~
   drivers/soc/qcom/./trace-smp2p.h:76:9: note: in expansion of macro 'TP_fast_assign'
      76 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/bpf_probe.h:117,
                    from include/trace/define_trace.h:104:
   drivers/soc/qcom/./trace-smp2p.h: At top level:
>> drivers/soc/qcom/./trace-smp2p.h:25:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      25 | );
         | ^~                 
   In file included from include/trace/bpf_probe.h:7:
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:42:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      42 | );
         | ^~                 
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:65:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      65 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 
   drivers/soc/qcom/./trace-smp2p.h:88:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
      88 | );
         | ^~                    
   include/trace/stages/stage6_event_callback.h:34: note: macro "__assign_str" defined here
      34 | #define __assign_str(dst)                                               \
         | 


vim +/__assign_str +25 drivers/soc/qcom/./trace-smp2p.h

    14	
    15	TRACE_EVENT(smp2p_ssr_ack,
    16		TP_PROTO(const struct device *dev),
    17		TP_ARGS(dev),
    18		TP_STRUCT__entry(
    19			__string(dev_name, dev_name(dev))
    20		),
    21		TP_fast_assign(
  > 22			__assign_str(dev_name, dev_name(dev));
    23		),
    24		TP_printk("%s: SSR detected", __get_str(dev_name))
  > 25	);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

