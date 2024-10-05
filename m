Return-Path: <linux-arm-msm+bounces-33199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96221991B39
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 00:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFDB01C21465
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 22:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885B416FF37;
	Sat,  5 Oct 2024 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVs4xsl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74716C6B7;
	Sat,  5 Oct 2024 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728167194; cv=none; b=QjFrekLkhcQ6YS+naOgplnlY6j+YdQpMH8RZwbdAnUKYFDNqDtCNPb0ArJDo1Odssh1ko9c0VR5aiv26cJb5KUCkUoL/20T3PmjjAacGyD98CODcuaDAIBM/1WMXj4t0WfJ/oykv1ab9a7DtdFk5v9HC5zA/AnoOJDmHWk9dwhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728167194; c=relaxed/simple;
	bh=DHSscCfjou4BLoP5vE9J6eNZoUi4zFrPpOyrgBRmEuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIRKeAzZh4nqzmYiqtJM2CTQEdoPfJxZwntlyV6iwUWWA+o6fb5f9OSlPF5Oy/tv/f/7S6lMsA1a5zelHd7ipm2bpboNqnsMMtTvZUy+ds4OT7oHKmfSHVsJCJ/8JwKq/RAir+GFLMKQUFdv34DTNnCRA7F0ty/LoESDXpT712U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVs4xsl8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728167193; x=1759703193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DHSscCfjou4BLoP5vE9J6eNZoUi4zFrPpOyrgBRmEuE=;
  b=JVs4xsl8gqLAvF6r0W68bCt0h3oTYpQEKnCj9g5NWvIrPchzbPYgolNy
   CmEMRgtwzcNAmD8mGOib2lW0bL0hGaBdAHdumet5lKJcz8Bo6bF0bVr6Z
   RMLjnHpcqf56/hAPaXPFYDNbiciF7nK2ZswuBYMxn3f3h0hmODH+v2lfg
   cN+SATEs5N3kcRMQZD/4QUiXoWvN6VFtQcI2AbdRNUyxfD6+AwrxdjOkI
   GfjU0XKqIde0/U8E9RVn13x0NrRfPqCDcstBapX0RSnBsHr6QJgHpfE7f
   1q2EJSamB9k3zuC4kUZSR40k6+q8sBg2nDpTzs7Vxg5K5NKuQf1KFa8dj
   w==;
X-CSE-ConnectionGUID: B/Eup9CTRmeKBTAZj6W4Hw==
X-CSE-MsgGUID: 3LXfyDz1TPCdojVKnCAijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27446866"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27446866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 15:26:32 -0700
X-CSE-ConnectionGUID: TTLS3rceRyyIZ3qh+4ehwQ==
X-CSE-MsgGUID: 0Pc0HiPvSg+vP+iFAGYCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="80025740"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 15:26:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxDEI-0003PU-30;
	Sat, 05 Oct 2024 22:26:26 +0000
Date: Sun, 6 Oct 2024 06:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH 5/6] remoteproc: qcom: Add support of SHM bridge to
 enable memory protection
Message-ID: <202410060641.ZedzhoKd-lkp@intel.com>
References: <20241004212359.2263502-6-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004212359.2263502-6-quic_mojha@quicinc.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on robh/for-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-common-Introduce-iommus-and-qcom-devmem-property/20241005-052733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20241004212359.2263502-6-quic_mojha%40quicinc.com
patch subject: [PATCH 5/6] remoteproc: qcom: Add support of SHM bridge to enable memory protection
config: arc-randconfig-001-20241006 (https://download.01.org/0day-ci/archive/20241006/202410060641.ZedzhoKd-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060641.ZedzhoKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060641.ZedzhoKd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/qcom/qcom_tzmem.c:50:12: error: static declaration of 'qcom_tzmem_init_area' follows non-static declaration
      50 | static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
         |            ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/qcom/qcom_tzmem.c:12:
   include/linux/firmware/qcom/qcom_tzmem.h:59:5: note: previous declaration of 'qcom_tzmem_init_area' with type 'int(struct qcom_tzmem_area *)'
      59 | int qcom_tzmem_init_area(struct qcom_tzmem_area *area);
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/qcom/qcom_tzmem.c:55:13: error: static declaration of 'qcom_tzmem_cleanup_area' follows non-static declaration
      55 | static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_tzmem.h:60:6: note: previous declaration of 'qcom_tzmem_cleanup_area' with type 'void(struct qcom_tzmem_area *)'
      60 | void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area);
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/qcom_tzmem_init_area +50 drivers/firmware/qcom/qcom_tzmem.c

84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  49  
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27 @50  static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  51  {
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  52  	return 0;
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  53  }
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  54  
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27 @55  static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  56  {
84f5a7b67b61bf Bartosz Golaszewski 2024-05-27  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

