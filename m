Return-Path: <linux-arm-msm+bounces-47229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E5A2D42A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 06:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B837188DEBF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 05:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D971917C7;
	Sat,  8 Feb 2025 05:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ako5oNk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633F155A52;
	Sat,  8 Feb 2025 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738993696; cv=none; b=S8EY4xhr5HGG7fss16MBbkatDEMJPz1fx3/yKK0C8v93R7EFa+2N0cGpaJEkbtv1AIJBVKdkyG1VhmYb7cTf8P5uGwGmbKjLxLLJJzriP0RRRu3O5sgWu5BvL8TgcfstScU9OEdiqR/mk8FzhTAtMdYtIVYWwpbvYT8F7gXzKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738993696; c=relaxed/simple;
	bh=wA0BmDz21/8I4MOZeMPRdJ8DIn6Tlt/iSbPznwlMASM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hs7IxCNHrR75U8NHgoZYArKmHqbNkAs8j+LfztFfWGmMHvKkDxtmCsq8zwTugoHjSlILy26l4kMC/BAhHRg5r5SmyofQTELskb/nA5tlFYK/CozlRT6Sk3qTL2KBC+lEkfyWlJOdPHv+BGgVpGowtzlJonctu0k0SsHvZ9L/AaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ako5oNk4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738993694; x=1770529694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wA0BmDz21/8I4MOZeMPRdJ8DIn6Tlt/iSbPznwlMASM=;
  b=Ako5oNk40zOGNe2HMDzZEauvdM9SwvsbpfEDiWOldrqk8zGMfULvoCxi
   c21VL3uZV/MZfctv8g2Wk+ZhK3MVcSW37yT7L5cg6MbjPgSbBsYt4SW0J
   qKTPvCX5gi+NySTaxsYmyk5lHphKcexMxpo2vaKs9G5a1g461YWrotKJo
   H+z6CDxjY+TqYK32CLLKPmUWZVaPgQ6tVR6mEOTMD54ca2GfHRHaWNuZK
   QcB0l+ujUqGpZxuUWZwzhVoC/t9Zi3nJ2ZrZKAv7fd9I6Jsc2IXfIpDAN
   2MBl75JjeYhp18VyfqKaJ3iDTkZ1o91rMXjlSwI5vH9gSET1JCgw0KtRF
   A==;
X-CSE-ConnectionGUID: jvYPt10wTeSTtI+7y0SgCQ==
X-CSE-MsgGUID: ijn0HWvtT+exMGNUecqwdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="51028442"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="51028442"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:48:13 -0800
X-CSE-ConnectionGUID: HWU+sQIMQp6QzNwU1gmo2w==
X-CSE-MsgGUID: IxhBp/1ZRTuYG0obpJ0Qcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134955066"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 21:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgdhF-000zbT-0b;
	Sat, 08 Feb 2025 05:48:05 +0000
Date: Sat, 8 Feb 2025 13:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <quic_jiegan@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
Message-ID: <202502081313.JqJlff9y-lkp@intel.com>
References: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207064213.2314482-5-quic_jiegan@quicinc.com>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on atorgue-stm32/stm32-next linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/Coresight-Add-support-for-new-APB-clock-name/20250207-144657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250207064213.2314482-5-quic_jiegan%40quicinc.com
patch subject: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
config: arm-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081313.JqJlff9y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081313.JqJlff9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081313.JqJlff9y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-core.c:659: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Links or sources will read their existing or alloc a trace ID, if their ID
   drivers/hwtracing/coresight/coresight-core.c:676: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Call this after creating the path and before enabling it. This leaves


vim +659 drivers/hwtracing/coresight/coresight-core.c

   657	
   658	/**
 > 659	 * Links or sources will read their existing or alloc a trace ID, if their ID
   660	 * callback is set.
   661	 */
   662	static int coresight_get_trace_id(struct coresight_device *csdev,
   663					  enum cs_mode mode,
   664					  struct coresight_device *sink)
   665	{
   666		if (csdev->type == CORESIGHT_DEV_TYPE_LINK && link_ops(csdev)->trace_id)
   667			return link_ops(csdev)->trace_id(csdev, mode, sink);
   668	
   669		if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE && source_ops(csdev)->trace_id)
   670			return source_ops(csdev)->trace_id(csdev, mode, sink);
   671	
   672		return 0;
   673	}
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

