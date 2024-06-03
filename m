Return-Path: <linux-arm-msm+bounces-21492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789B8D85DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 17:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B78C1F2157A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 15:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9E11304A2;
	Mon,  3 Jun 2024 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqCUBfUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8546E619;
	Mon,  3 Jun 2024 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717427768; cv=none; b=qG8rn4HdFCTaBYeFjtrBVrXEfRDefdhcDPxyxUo4o2qPpQCvJr4myP0BiCsMf2WONbZ0Y2/0AbbX6ohiTw8O8Jm58bmlVeZNx5hJ+Fapzxt5WNexfvqITD7F/JvEZmTyDtrPspf/Kx0H8Z7M5g/DfEAc5JKae3MLgMOrpcvqBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717427768; c=relaxed/simple;
	bh=wn74DGayn2LhHF1DS4AIgDk5E4v/Hiu+0yxvri0+M6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG7uMri/j16bKbt3ekkkACLUy+F3WhFEl7NkoK9FmnVNPUP+wojC4oGOg3LUjRKOdzAYOl5jlv97OrJq85uRwYH5NuAkUxPEvRnUdujJjFZvOXYW3ktdxjlvsH5Xyxx6Ov+UaiOxBzAyl+0sP6B3lMM8/PAef27g4ZoVReF1jbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqCUBfUJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717427766; x=1748963766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wn74DGayn2LhHF1DS4AIgDk5E4v/Hiu+0yxvri0+M6Y=;
  b=AqCUBfUJmBXUJu20t9z3b6GR5o03Nr9QNdJV84tvWlcLkR+JI5yqCX3E
   1/JRZn6zaQCfIMIhutPVrzXSKRgpg7ie77y/P2F1ObLtuntpWFDLpAjDt
   ls2guuWEKC2Jpo5b5Nxn6HUzwAG0RoveCORHrvpiOxAaTBVP3MS/eP4fj
   ah910qyBzW5sB/8nNrbCM4qRxHrr56Bq5wp8nbHatmcZLaTy50IKa1FXY
   GZBdBCuIiJSopOs8KIwSMK2iQ6VU0C/xW6K1VhN0GSzCWlZ9CUEuXi7aP
   TXRRoV5zbLLvfcwCAxXlTLTWXaqDFx0onsN4QI/5v+vha6nXd+mKmCdno
   w==;
X-CSE-ConnectionGUID: GbivCDjjQw6wucZg4dtJLQ==
X-CSE-MsgGUID: mukK42OFRMmYlxyx2mQRAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14050604"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14050604"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 08:16:05 -0700
X-CSE-ConnectionGUID: E5y3S27MSJOx6GJBW1SKRg==
X-CSE-MsgGUID: uTkr4zqHT6Cip7CLKCXx7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="37493984"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 08:16:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE9Pi-000LnG-2U;
	Mon, 03 Jun 2024 15:15:58 +0000
Date: Mon, 3 Jun 2024 23:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	songchai <quic_songchai@quicinc.com>
Subject: Re: [PATCH v2 2/3] coresight: Add support to get preferred id for
 system trace sources
Message-ID: <202406032259.9poyd8Ts-lkp@intel.com>
References: <20240603094354.2348-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603094354.2348-3-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on atorgue-stm32/stm32-next linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-trace-id-for-coresight-dummy-source/20240603-175023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240603094354.2348-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/3] coresight: Add support to get preferred id for system trace sources
config: arm-randconfig-001-20240603 (https://download.01.org/0day-ci/archive/20240603/202406032259.9poyd8Ts-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406032259.9poyd8Ts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406032259.9poyd8Ts-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-platform.c:797:12: error: redefinition of 'of_coresight_get_trace_id'
     797 | static int of_coresight_get_trace_id(struct device *dev, u32 *id)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-platform.c:191:12: note: previous definition of 'of_coresight_get_trace_id' with type 'int(struct device *, u32 *)' {aka 'int(struct device *, unsigned int *)'}
     191 | static int of_coresight_get_trace_id(struct device *dev, u32 *id)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwtracing/coresight/coresight-platform.c:191:12: warning: 'of_coresight_get_trace_id' defined but not used [-Wunused-function]
--
   drivers/hwtracing/coresight/coresight-tpda.c: In function 'tpda_init_default_data':
>> drivers/hwtracing/coresight/coresight-tpda.c:254:16: error: too few arguments to function 'coresight_trace_id_get_system_id'
     254 |         atid = coresight_trace_id_get_system_id();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/hwtracing/coresight/coresight-tpda.c:20:
   drivers/hwtracing/coresight/coresight-trace-id.h:126:5: note: declared here
     126 | int coresight_trace_id_get_system_id(int id);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/of_coresight_get_trace_id +797 drivers/hwtracing/coresight/coresight-platform.c

   796	
 > 797	static int of_coresight_get_trace_id(struct device *dev, u32 *id)
   798	{
   799		return -ENODEV;
   800	}
   801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

