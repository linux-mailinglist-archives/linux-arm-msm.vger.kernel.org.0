Return-Path: <linux-arm-msm+bounces-80386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89489C33969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 02:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D90FE18C2C75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 01:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36A4236437;
	Wed,  5 Nov 2025 01:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMt7z2f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095A27462;
	Wed,  5 Nov 2025 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304993; cv=none; b=fz3RDNE7O03W/2CRkZguYdGRPkL6bUgOcTjidUGvDjVvkYBZtV4DWqv4y+DqRfTO6bTcEPn6XG4hlsZgqMov5Msp/2jtAXbzCFI5Gr9lZZfZRtsD7pz9WhCcWZ4UR3GkumA47GbXqKZ4Wm9jdfqskjKeYf/NHNN2Bm0arQyyFDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304993; c=relaxed/simple;
	bh=FFfDIqSM/9x7BMOCDpR60+XjPYyWl3N8kflVm4dcMck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLw3KVvrnFSixe775KWJSitWK5dl9EMu/uR8aOVPCpfttwiOHsMHX/hyDF9gnmuT9avU3AanPhkV4QRU8vZI+wvuh+Dz5mw2M9J/EZxm26yLbUuPG0kmgTUm4xO+mKXE715+4Aw/B+eWVvBVcNe8tblUEZkCKEyWpFtU2O6Si1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMt7z2f9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762304991; x=1793840991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FFfDIqSM/9x7BMOCDpR60+XjPYyWl3N8kflVm4dcMck=;
  b=mMt7z2f9BvnGdIAQBy7E9sk8yBVZMa7W+zZlwP7p+U/hnuhEV6D/xj+C
   aLyDDUj543wGGmlYEC6eSQiwRw1lFj0KZ1G2sInmMJ/F9gvK934itO1js
   lL1gZ+R0rN1c7EYftuniU9qy00J//i5wB5GWO6IQjDnKF0ZYILLZBYx05
   7JiXHU3wQL7ddh1KmpEPzn1opGv49fl/nh3EZsAgb8WoKO5jIpu905iur
   YBZG4PpLHsnmUO3XLSupYNgZtzyQpCJsDjVWPaUbXCYohfa+AYjfTGqIu
   PqTBmhgsT30W8jyg9sLeshh9y3o+iUo5zpkRWo0BkgpmeojRYF18vulv+
   g==;
X-CSE-ConnectionGUID: Rx6+9894Qy2pOLFDAdXssA==
X-CSE-MsgGUID: cCS93jTVRYu266fx+G1TTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="87040689"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="87040689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 17:09:51 -0800
X-CSE-ConnectionGUID: u4x7LBY1TjafuokxlPvc3g==
X-CSE-MsgGUID: T1qvwjEnQmadicmAvnWwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="217956010"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 17:09:48 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGS1x-000S0O-1D;
	Wed, 05 Nov 2025 01:09:45 +0000
Date: Wed, 5 Nov 2025 09:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v2] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Message-ID: <202511050842.FTUh6ym8-lkp@intel.com>
References: <20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com>

Hi Dikshita,

kernel test robot noticed the following build errors:

[auto build test ERROR on 163917839c0eea3bdfe3620f27f617a55fd76302]

url:    https://github.com/intel-lab-lkp/linux/commits/Dikshita-Agarwal/media-iris-Refine-internal-buffer-reconfiguration-logic-for-resolution-change/20251104-131307
base:   163917839c0eea3bdfe3620f27f617a55fd76302
patch link:    https://lore.kernel.org/r/20251104-iris-seek-fix-v2-1-c9dace39b43d%40oss.qualcomm.com
patch subject: [PATCH v2] media: iris: Refine internal buffer reconfiguration logic for resolution change
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251105/202511050842.FTUh6ym8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050842.FTUh6ym8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050842.FTUh6ym8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_common.c:99:2: error: use of undeclared identifier 'first_ipsc'
      99 |         first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
         |         ^
>> drivers/media/platform/qcom/iris/iris_common.c:101:2: error: use of undeclared identifier 'drain_active'
     101 |         drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
         |         ^
>> drivers/media/platform/qcom/iris/iris_common.c:104:2: error: use of undeclared identifier 'drc_active'
     104 |         drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
         |         ^
   drivers/media/platform/qcom/iris/iris_common.c:107:6: error: use of undeclared identifier 'drc_active'
     107 |         if (drc_active)
         |             ^
   drivers/media/platform/qcom/iris/iris_common.c:109:11: error: use of undeclared identifier 'drain_active'; did you mean 'swait_active'?
     109 |         else if (drain_active)
         |                  ^~~~~~~~~~~~
         |                  swait_active
   include/linux/swait.h:121:19: note: 'swait_active' declared here
     121 | static inline int swait_active(struct swait_queue_head *wq)
         |                   ^
   drivers/media/platform/qcom/iris/iris_common.c:113:6: error: use of undeclared identifier 'first_ipsc'
     113 |         if (first_ipsc || drc_active) {
         |             ^
   drivers/media/platform/qcom/iris/iris_common.c:113:20: error: use of undeclared identifier 'drc_active'
     113 |         if (first_ipsc || drc_active) {
         |                           ^
   drivers/media/platform/qcom/iris/iris_common.c:127:8: error: use of undeclared identifier 'drain_active'; did you mean 'swait_active'?
     127 |                 if (!drain_active)
         |                      ^~~~~~~~~~~~
         |                      swait_active
   include/linux/swait.h:121:19: note: 'swait_active' declared here
     121 | static inline int swait_active(struct swait_queue_head *wq)
         |                   ^
>> drivers/media/platform/qcom/iris/iris_common.c:127:8: warning: address of function 'swait_active' will always evaluate to 'true' [-Wpointer-bool-conversion]
     127 |                 if (!drain_active)
         |                     ~^~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_common.c:127:8: note: prefix with the address-of operator to silence this warning
     127 |                 if (!drain_active)
         |                      ^
         |                      &
   1 warning and 8 errors generated.


vim +/first_ipsc +99 drivers/media/platform/qcom/iris/iris_common.c

    90	
    91	int iris_process_streamon_output(struct iris_inst *inst)
    92	{
    93		const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
    94		enum iris_inst_sub_state clear_sub_state = 0;
    95		int ret = 0;
    96	
    97		iris_scale_power(inst);
    98	
  > 99		first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
   100	
 > 101		drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
   102			inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
   103	
 > 104		drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
   105			inst->sub_state & IRIS_INST_SUB_DRC_LAST;
   106	
   107		if (drc_active)
   108			clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
   109		else if (drain_active)
   110			clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
   111	
   112		/* Input internal buffer reconfiguration required in case of resolution change */
   113		if (first_ipsc || drc_active) {
   114			ret = iris_alloc_and_queue_input_int_bufs(inst);
   115			if (ret)
   116				return ret;
   117			ret = iris_set_stage(inst, STAGE);
   118			if (ret)
   119				return ret;
   120			ret = iris_set_pipe(inst, PIPE);
   121			if (ret)
   122				return ret;
   123		}
   124	
   125		if (inst->state == IRIS_INST_INPUT_STREAMING &&
   126		    inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
 > 127			if (!drain_active)
   128				ret = hfi_ops->session_resume_drc(inst,
   129								  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
   130			else if (hfi_ops->session_resume_drain)
   131				ret = hfi_ops->session_resume_drain(inst,
   132								    V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
   133			if (ret)
   134				return ret;
   135			clear_sub_state |= IRIS_INST_SUB_INPUT_PAUSE;
   136		}
   137	
   138		if (inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)
   139			clear_sub_state |= IRIS_INST_SUB_FIRST_IPSC;
   140	
   141		ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
   142		if (ret)
   143			return ret;
   144	
   145		if (inst->sub_state & IRIS_INST_SUB_OUTPUT_PAUSE)
   146			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
   147	
   148		ret = iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
   149		if (ret)
   150			return ret;
   151	
   152		inst->last_buffer_dequeued = false;
   153	
   154		return iris_inst_change_sub_state(inst, clear_sub_state, 0);
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

