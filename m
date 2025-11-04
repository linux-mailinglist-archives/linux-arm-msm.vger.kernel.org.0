Return-Path: <linux-arm-msm+bounces-80376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E58C336AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 00:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 350AB189F9BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 23:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C119834B197;
	Tue,  4 Nov 2025 23:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJAzV/Iu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216034B186;
	Tue,  4 Nov 2025 23:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762300064; cv=none; b=bQozw2JFf/rokqv3IE37LW8ttjUs1LHsCt1AgHN95cznSr4jqbH7xVCnc+fuBkR7BYB50n8qo8fMl1z6hO5fFpNUfixg3EDu2o+HzNz1TWFR50+pwxSuImvT978TKLZwO0rwhGFOSww5y8yLt+YVLcYrBuRU32lJ/9RlRPYVOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762300064; c=relaxed/simple;
	bh=q8Yf8/7HLuXQG0Z7K5FKnH461+e+Cvderu2RfpjgDQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ehf9L3KMGOdXW46zRT3dA7PplItC/UujqieS3HWvYzJhJU/nsrqg/oHCIkGdYEBmAiToT7T3d2S/Bzhnrxk3jU4/LUnzptBp4PAsmxWYdr2wT4QPA3SDd/zJioqZJ6ztfHwD2DxDcUeLbM7GTvx3GBDngpq3FydeUnXRbjnfkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJAzV/Iu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762300064; x=1793836064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q8Yf8/7HLuXQG0Z7K5FKnH461+e+Cvderu2RfpjgDQw=;
  b=ZJAzV/IujyZL2QrDw86+vUK47lhjAsOqAHEqFTmgsUZMtlcp97oDTdxT
   4hNMe9AYsDJO+EzzowDTNWdRgahET/ovg+oF8fKttvyswfCZ4gyMKPYE3
   pwij+3ryVDU3iRmcKUUrmysIOackKLaZFPUptu35SKkJCYE6Rs2d6PFzZ
   43+jXroD7QgbgKj40qff21+bZFeHj1uRwehWGLFMsFudmwzkCFLLh4z15
   4qg4L9CbWwcfyWbDkSrKx+4aPaabaDa6Sjnx/cY4CHFO9t09ZpyXQWlU2
   WaqjpMVGqjKLuBK6Rp9Nxynn4aht1SY/89Fm+D+iBi+Ly7EtqbyZNZ4YX
   g==;
X-CSE-ConnectionGUID: odFTKybCSd+9RAMQtDUU9A==
X-CSE-MsgGUID: TG103etjQfCkg/GXJkSd8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75517356"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="75517356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 15:47:43 -0800
X-CSE-ConnectionGUID: hTt4v9M+THmoCh//MpN9YQ==
X-CSE-MsgGUID: jtjy4XN6T/2HSjrKEIqwQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="192375649"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2025 15:47:40 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGQjl-000Rwm-1Y;
	Tue, 04 Nov 2025 23:47:04 +0000
Date: Wed, 5 Nov 2025 07:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v2] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Message-ID: <202511050737.07EKKlnk-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251105/202511050737.07EKKlnk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050737.07EKKlnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050737.07EKKlnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/iris/iris_common.c: In function 'iris_process_streamon_output':
>> drivers/media/platform/qcom/iris/iris_common.c:99:9: error: 'first_ipsc' undeclared (first use in this function)
      99 |         first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
         |         ^~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_common.c:99:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/platform/qcom/iris/iris_common.c:101:9: error: 'drain_active' undeclared (first use in this function); did you mean 'swait_active'?
     101 |         drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
         |         ^~~~~~~~~~~~
         |         swait_active
>> drivers/media/platform/qcom/iris/iris_common.c:104:9: error: 'drc_active' undeclared (first use in this function); did you mean 'PG_active'?
     104 |         drc_active = inst->sub_state & IRIS_INST_SUB_DRC &&
         |         ^~~~~~~~~~
         |         PG_active


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
   127			if (!drain_active)
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

