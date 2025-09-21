Return-Path: <linux-arm-msm+bounces-74371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBCB8E2E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 20:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D4D63BF831
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 18:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0949D2749C0;
	Sun, 21 Sep 2025 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgDzWBw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F109254B19;
	Sun, 21 Sep 2025 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758478098; cv=none; b=g13uPumySOTADgQytZ8ugS1feTZc53Gw+r8SxKZPbGfguo9x5TAljPFOT7puHvszSxFvITJ3pY2FlVzRnml4MzQMiGiFANrDNo8+TdN6yo2ziFJUKRWyHp4sDn+G+blbEro0Vgmk+R3G081arLp5lOiOnkwLTVoCWesBKZT5C3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758478098; c=relaxed/simple;
	bh=29O2r18L5h5k9tMHESiP8SbFSGsjDajPABR1syF2lSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYlTRmBdwYgHgAhl/CcC5sGJxMGbAaH9ad/5l2KNZEGKN56hIrUuJN4jD8t8C4KjYiSgd6gHt6As7zzi6yRa5jqTSp2iqMw++qEGShzwMTfNAm4YEPpAbjooxyn1VXNZhBv1fvOzHce3dJs35T2hmGXr8pooVo2+sJEYlPpZCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgDzWBw2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758478096; x=1790014096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=29O2r18L5h5k9tMHESiP8SbFSGsjDajPABR1syF2lSc=;
  b=kgDzWBw24t4nuohOOqA9wMH6LoEH/oRDp3oVKJq7s1q1sHRLzSgXrIha
   MlgZYFyXir4PFNs+mrplXO7ACDG2Lu+rpM+Yg1PkpC11g4TzW5hG8ALDv
   vTA/tBnRqzMJ/GPX2AG7IDpT0S5hNcnMLgKWQH7WLSyqJisni7mXnBqfk
   o1c2IIth2nOE4mUuYS7BhAgw+CJjPObN0IWXxEsFQu9lQOt7qorVuDH8N
   dT7SxwXFjNFc9ul784eHOBcJIab2E3FskMzxYr1q5aSBEfNfZTtBj7rDP
   zhWD+7altLsZApUGAFfkkqxeZYBwOG4Lp6mjGvtuOJ7nw0EDxt5kYIEKp
   w==;
X-CSE-ConnectionGUID: GHTYWN7vS7i1/R1hCnkG5Q==
X-CSE-MsgGUID: 138peNyOQX+1j9uaFb9pfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59790121"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="59790121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 11:08:15 -0700
X-CSE-ConnectionGUID: kyWGG7/RTeKeC6tgM24SkQ==
X-CSE-MsgGUID: K9p1Qzi2QJi1nS2PfQSEQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176126326"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2025 11:08:11 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0OTo-0000xF-1m;
	Sun, 21 Sep 2025 18:08:08 +0000
Date: Mon, 22 Sep 2025 02:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <202509220147.nsw5xumc-lkp@intel.com>
References: <20250921-kvm_rproc_pas-v3-10-458f09647920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-kvm_rproc_pas-v3-10-458f09647920@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 846bd2225ec3cfa8be046655e02b9457ed41973e]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-Add-iommus-property/20250921-041055
base:   846bd2225ec3cfa8be046655e02b9457ed41973e
patch link:    https://lore.kernel.org/r/20250921-kvm_rproc_pas-v3-10-458f09647920%40oss.qualcomm.com
patch subject: [PATCH v3 10/12] remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250922/202509220147.nsw5xumc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220147.nsw5xumc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220147.nsw5xumc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_parse_firmware':
>> drivers/remoteproc/qcom_q6v5_pas.c:452:45: error: passing argument 1 of 'qcom_scm_pas_get_rsc_table' makes pointer from integer without a cast [-Wint-conversion]
     452 |         ret = qcom_scm_pas_get_rsc_table(pas->pas_id, table, table_sz, &output_rt,
         |                                          ~~~^~~~~~~~
         |                                             |
         |                                             int
   In file included from drivers/remoteproc/qcom_q6v5_pas.c:22:
   include/linux/firmware/qcom/qcom_scm.h:97:57: note: expected 'struct qcom_scm_pas_ctx *' but argument is of type 'int'
      97 | int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_ctx *ctx, void *input_rt,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +/qcom_scm_pas_get_rsc_table +452 drivers/remoteproc/qcom_q6v5_pas.c

   411	
   412	static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
   413	{
   414		size_t output_rt_size = MAX_RSCTABLE_SIZE;
   415		struct qcom_pas *pas = rproc->priv;
   416		struct resource_table *table = NULL;
   417		void *output_rt;
   418		size_t table_sz;
   419		int ret;
   420	
   421		ret = qcom_register_dump_segments(rproc, fw);
   422		if (ret) {
   423			dev_err(pas->dev, "Error in registering dump segments\n");
   424			return ret;
   425		}
   426	
   427		if (!rproc->has_iommu)
   428			return ret;
   429	
   430		ret = rproc_elf_load_rsc_table(rproc, fw);
   431		if (ret)
   432			dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
   433	
   434		table = rproc->table_ptr;
   435		table_sz = rproc->table_sz;
   436	
   437		/*
   438		 * Qualcomm remote processor may rely on static and dynamic resources for
   439		 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
   440		 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
   441		 * is managed by present hypervisor. Dynamic resources if it is present for
   442		 * a remote processor will always be coming from secure world via SMC call
   443		 * while static resources may be present in remote processor firmware binary
   444		 * or it may be coming from SMC call along with dynamic resources.
   445		 *
   446		 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
   447		 * or not and if it is not having then we pass NULL and zero as input resource
   448		 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
   449		 * and this is even true for Qualcomm remote processor who does follow remoteproc
   450		 * framework.
   451		 */
 > 452		ret = qcom_scm_pas_get_rsc_table(pas->pas_id, table, table_sz, &output_rt,
   453						 &output_rt_size);
   454		if (ret) {
   455			dev_err(pas->dev, "error %d getting resource_table\n", ret);
   456			return ret;
   457		}
   458	
   459		kfree(rproc->cached_table);
   460		rproc->cached_table = output_rt;
   461		rproc->table_ptr = rproc->cached_table;
   462		rproc->table_sz = output_rt_size;
   463	
   464		return ret;
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

