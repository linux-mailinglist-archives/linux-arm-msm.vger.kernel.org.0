Return-Path: <linux-arm-msm+bounces-57142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EAFAADD42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 13:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 733577B6FF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 11:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8D123236F;
	Wed,  7 May 2025 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQcJ+BG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1080215F49;
	Wed,  7 May 2025 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617099; cv=none; b=h+8Ojjd0EYH5X/6LGuxn1FZpA9XbhBHnKO+UOPSvNspdAh+R4uj9rYexY6oKaYfkWKni9IJK97qDKRR7GkMxGUcaZ9BcUDVtXuGoeeziZPJccw/6mk6ihzwFj8DaAk47oqKmnJQMoRLCKcGD72hAX6mS3LM9rw1oDwf/Nh/mHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617099; c=relaxed/simple;
	bh=eZJybZdxwASakpoaQMGcFN08228iOOZpqRIN+H3A/QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcqJMsh8rMphz0R2IgtLOr22jZzMsv2y534BuEvUVV4kGVS3KbWEoi8yl5d9QrTAMknySK6MawNVfI50C+PlLSQFXyDQaGwKz6IfRQ7y1N5OjCsVnCVXB/OgEr6ZTsdsKGjcwpPFyWysr1DvKlqz+rv9pR6nPfDr+owK/WS8cds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQcJ+BG6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746617098; x=1778153098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eZJybZdxwASakpoaQMGcFN08228iOOZpqRIN+H3A/QE=;
  b=ZQcJ+BG6gdHnxxvaUUtA3Iqq2GJQJ1pbeonlEfUpBljisdTacGZsWdHn
   l2lV6Vrvpl0iO0JfGpnUajxwKUt46cU7tzLSR8/NJpI3Lebx1pyZnY4dS
   MHi2uIhLpmV4QMC2Y36ZrL3wRNGW/qZKRkRaSRTM89KIvJ0co6MWn9ESQ
   PU4ApBgOyCzkloFHxhJqafdLVJV45zQQW3fRfmxzNUVtTtSGuHSZybljP
   lRclaioyyH/C0UUJ9oXRq+rhMZ1Lotw5ksSOzgd5geOZ21iS3T0AnZHYK
   M99oZPUVQtWt02wZwnt0/Mu7OXqvuqdxl2fiw2OcmE0uqXkthyGykaqYd
   Q==;
X-CSE-ConnectionGUID: gUeCMxigTkCp6Sx1X2ajCg==
X-CSE-MsgGUID: w4SjrgqyS/qoXznf97VjbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48241812"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48241812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:24:57 -0700
X-CSE-ConnectionGUID: pqp/Io6KTYeFgb6dTJ5ubw==
X-CSE-MsgGUID: QXROB2ZTRBKievyOhHhh1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166861156"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 04:24:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCctP-0007fZ-0v;
	Wed, 07 May 2025 11:24:51 +0000
Date: Wed, 7 May 2025 19:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] coresight: Add remote etm support
Message-ID: <202505071921.rDzEb2CH-lkp@intel.com>
References: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc5]
[cannot apply to next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-CoreSight-QMI-component-description/20250424-200202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424115854.2328190-5-quic_jinlmao%40quicinc.com
patch subject: [PATCH v5 4/5] coresight: Add remote etm support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071921.rDzEb2CH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071921.rDzEb2CH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071921.rDzEb2CH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-remote-etm.c:161:27: error: initialization of 'int (*)(struct coresight_device *, struct perf_event *, enum cs_mode,  struct coresight_path *)' from incompatible pointer type 'int (*)(struct coresight_device *, struct perf_event *, enum cs_mode,  struct coresight_trace_id_map *)' [-Wincompatible-pointer-types]
     161 |         .enable         = remote_etm_enable,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-remote-etm.c:161:27: note: (near initialization for 'remote_etm_source_ops.enable')


vim +161 drivers/hwtracing/coresight/coresight-remote-etm.c

   159	
   160	static const struct coresight_ops_source remote_etm_source_ops = {
 > 161		.enable		= remote_etm_enable,
   162		.disable	= remote_etm_disable,
   163	};
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

