Return-Path: <linux-arm-msm+bounces-55823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C314A9DC9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 19:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C0B27B4248
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 17:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165CD1A5B8C;
	Sat, 26 Apr 2025 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxGp4SFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE86725B675;
	Sat, 26 Apr 2025 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745688689; cv=none; b=jC4LTi196ZvXJ5Y5mmyxXIdjq5nDfxe372HVe1gTR0mrlJNItZahKbMeQH+P3av+gwzTw/jgapZerblBhLxSwMIQZ5UZUHafdJDPraa8i9IbByQAVBMbksDpEnqH2k1kZpPIqb92r2m0YIdRZo0ASHuibIVyYLD35KRbbnOxdSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745688689; c=relaxed/simple;
	bh=CHU0soLpRm5/jW/mOR7/yy3kXhvyHM4H0SQCs8LBx+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbopcwpjxiDIjN35/cWb95Wq2I9g9Kgjwv+4JuE88symgVgpGu5xRLLL0tZBRuNX2tHpFOXzmrDps4aFlNu2ySb29OnTyt6C85+QxTQncemT/YF3mkV4YKBHf+ZeuZMgoxxvlTrEXQHQBfMkKvJk0xOyNqwysepgfWxacoeVXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxGp4SFY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745688686; x=1777224686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CHU0soLpRm5/jW/mOR7/yy3kXhvyHM4H0SQCs8LBx+k=;
  b=XxGp4SFYIbbC85GrjvlIAcfV92vfktJsb2ccAMHJtRz3TX7O9R8eDdzB
   J7+uwV1omy1o7maT2TMaak/nM8PnE9V48CC29+86a49UNAcyta5YtJSew
   WsdoL8Kk5u5Q1TZsB1WHL6vtNhzS8GJTVP/b2RYQGOhhqPyLOR30aGEUI
   uX4umRhuZY53HPA4xLA/Ycf9S01puM8OxEZe89BxhV0qUpLI45rFMw/kt
   kuv9GgqW8+uZJkSrDhnEqFBIUPDyO4zbb5JrRM6AvFDQn1TWLeIeRsiib
   NBBty5wlApPqpuY/zabY1NRXGRsYp4qjSkdf+6+U9DCnkUVsLgUXyf1kK
   w==;
X-CSE-ConnectionGUID: Fnx3qalZT2qxrHUHoRPoCA==
X-CSE-MsgGUID: fFOcNlnYT9yr7tOczRQ3PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="69821221"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="69821221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 10:31:25 -0700
X-CSE-ConnectionGUID: I8cxCpomSNWN4abeF/fmWA==
X-CSE-MsgGUID: IKUyeOGtSeSG8EeiwuJewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="134090217"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2025 10:31:22 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8jN2-0005w5-2S;
	Sat, 26 Apr 2025 17:31:20 +0000
Date: Sun, 27 Apr 2025 01:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
Message-ID: <202504270129.LBGxvK4p-lkp@intel.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/soc-qcom-socinfo-Add-support-for-new-fields-in-revision-21/20250425-220213
base:   linus/master
patch link:    https://lore.kernel.org/r/20250425135946.1087065-1-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250427/202504270129.LBGxvK4p-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270129.LBGxvK4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270129.LBGxvK4p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/socinfo.c:615:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     615 |         case SOCINFO_VERSION(0, 19):
         |         ^
   drivers/soc/qcom/socinfo.c:615:2: note: insert '__attribute__((fallthrough));' to silence this warning
     615 |         case SOCINFO_VERSION(0, 19):
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/soc/qcom/socinfo.c:615:2: note: insert 'break;' to avoid fall-through
     615 |         case SOCINFO_VERSION(0, 19):
         |         ^
         |         break; 
   1 warning generated.


vim +615 drivers/soc/qcom/socinfo.c

cd23d1405be666a Vaishali Thakkar    2019-07-24  592  
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  593  static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
734c78e7febf879 Dmitry Baryshkov    2020-12-22  594  				 struct socinfo *info, size_t info_size)
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  595  {
cd23d1405be666a Vaishali Thakkar    2019-07-24  596  	struct smem_image_version *versions;
cd23d1405be666a Vaishali Thakkar    2019-07-24  597  	struct dentry *dentry;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  598  	size_t size;
cd23d1405be666a Vaishali Thakkar    2019-07-24  599  	int i;
734c78e7febf879 Dmitry Baryshkov    2020-12-22  600  	unsigned int num_pmics;
734c78e7febf879 Dmitry Baryshkov    2020-12-22  601  	unsigned int pmic_array_offset;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  602  
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  603  	qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  604  
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  605  	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  606  
8333b2c26c2f38e Stephen Boyd        2020-12-15  607  	debugfs_create_x32("info_fmt", 0444, qcom_socinfo->dbg_root,
50f85d16200eee1 Dmitry Baryshkov    2020-05-25  608  			   &qcom_socinfo->info.fmt);
50f85d16200eee1 Dmitry Baryshkov    2020-05-25  609  
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  610  	switch (qcom_socinfo->info.fmt) {
d9ccd28132cc435 Mukesh Ojha         2025-04-25  611  	case SOCINFO_VERSION(0, 20):
d9ccd28132cc435 Mukesh Ojha         2025-04-25  612  		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
d9ccd28132cc435 Mukesh Ojha         2025-04-25  613  		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
d9ccd28132cc435 Mukesh Ojha         2025-04-25  614  				   &qcom_socinfo->info.raw_package_type);
d9c2a255cfe026c Naman Jain          2023-06-06 @615  	case SOCINFO_VERSION(0, 19):
d9c2a255cfe026c Naman Jain          2023-06-06  616  		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
d9c2a255cfe026c Naman Jain          2023-06-06  617  		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
d9c2a255cfe026c Naman Jain          2023-06-06  618  		qcom_socinfo->info.boot_core = __le32_to_cpu(info->boot_core);
d9c2a255cfe026c Naman Jain          2023-06-06  619  
d9c2a255cfe026c Naman Jain          2023-06-06  620  		debugfs_create_u32("num_func_clusters", 0444, qcom_socinfo->dbg_root,
d9c2a255cfe026c Naman Jain          2023-06-06  621  				   &qcom_socinfo->info.num_func_clusters);
d9c2a255cfe026c Naman Jain          2023-06-06  622  		debugfs_create_u32("boot_cluster", 0444, qcom_socinfo->dbg_root,
d9c2a255cfe026c Naman Jain          2023-06-06  623  				   &qcom_socinfo->info.boot_cluster);
d9c2a255cfe026c Naman Jain          2023-06-06  624  		debugfs_create_u32("boot_core", 0444, qcom_socinfo->dbg_root,
d9c2a255cfe026c Naman Jain          2023-06-06  625  				   &qcom_socinfo->info.boot_core);
d9c2a255cfe026c Naman Jain          2023-06-06  626  		fallthrough;
158826c73d48097 Naman Jain          2023-06-06  627  	case SOCINFO_VERSION(0, 18):
6bdab60d5cbd799 Naman Jain          2023-01-27  628  	case SOCINFO_VERSION(0, 17):
6bdab60d5cbd799 Naman Jain          2023-01-27  629  		qcom_socinfo->info.oem_variant = __le32_to_cpu(info->oem_variant);
6bdab60d5cbd799 Naman Jain          2023-01-27  630  		debugfs_create_u32("oem_variant", 0444, qcom_socinfo->dbg_root,
6bdab60d5cbd799 Naman Jain          2023-01-27  631  				   &qcom_socinfo->info.oem_variant);
6bdab60d5cbd799 Naman Jain          2023-01-27  632  		fallthrough;
f02a537357a61e7 Naman Jain          2022-11-25  633  	case SOCINFO_VERSION(0, 16):
f02a537357a61e7 Naman Jain          2022-11-25  634  		qcom_socinfo->info.feature_code = __le32_to_cpu(info->feature_code);
f02a537357a61e7 Naman Jain          2022-11-25  635  		qcom_socinfo->info.pcode = __le32_to_cpu(info->pcode);
f02a537357a61e7 Naman Jain          2022-11-25  636  
f02a537357a61e7 Naman Jain          2022-11-25  637  		debugfs_create_u32("feature_code", 0444, qcom_socinfo->dbg_root,
f02a537357a61e7 Naman Jain          2022-11-25  638  				   &qcom_socinfo->info.feature_code);
f02a537357a61e7 Naman Jain          2022-11-25  639  		debugfs_create_u32("pcode", 0444, qcom_socinfo->dbg_root,
f02a537357a61e7 Naman Jain          2022-11-25  640  				   &qcom_socinfo->info.pcode);
f02a537357a61e7 Naman Jain          2022-11-25  641  		fallthrough;
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  642  	case SOCINFO_VERSION(0, 15):
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  643  		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  644  
8333b2c26c2f38e Stephen Boyd        2020-12-15  645  		debugfs_create_u32("nmodem_supported", 0444, qcom_socinfo->dbg_root,
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  646  				   &qcom_socinfo->info.nmodem_supported);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  647  		fallthrough;
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  648  	case SOCINFO_VERSION(0, 14):
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  649  		qcom_socinfo->info.num_clusters = __le32_to_cpu(info->num_clusters);
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  650  		qcom_socinfo->info.ncluster_array_offset = __le32_to_cpu(info->ncluster_array_offset);
d9c2a255cfe026c Naman Jain          2023-06-06  651  		qcom_socinfo->info.num_subset_parts = __le32_to_cpu(info->num_subset_parts);
d9c2a255cfe026c Naman Jain          2023-06-06  652  		qcom_socinfo->info.nsubset_parts_array_offset =
d9c2a255cfe026c Naman Jain          2023-06-06  653  			__le32_to_cpu(info->nsubset_parts_array_offset);
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  654  
8333b2c26c2f38e Stephen Boyd        2020-12-15  655  		debugfs_create_u32("num_clusters", 0444, qcom_socinfo->dbg_root,
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  656  				   &qcom_socinfo->info.num_clusters);
8333b2c26c2f38e Stephen Boyd        2020-12-15  657  		debugfs_create_u32("ncluster_array_offset", 0444, qcom_socinfo->dbg_root,
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  658  				   &qcom_socinfo->info.ncluster_array_offset);
d9c2a255cfe026c Naman Jain          2023-06-06  659  		debugfs_create_u32("num_subset_parts", 0444, qcom_socinfo->dbg_root,
d9c2a255cfe026c Naman Jain          2023-06-06  660  				   &qcom_socinfo->info.num_subset_parts);
d9c2a255cfe026c Naman Jain          2023-06-06  661  		debugfs_create_u32("nsubset_parts_array_offset", 0444, qcom_socinfo->dbg_root,
d9c2a255cfe026c Naman Jain          2023-06-06  662  				   &qcom_socinfo->info.nsubset_parts_array_offset);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  663  		fallthrough;
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  664  	case SOCINFO_VERSION(0, 13):
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  665  		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  666  
8333b2c26c2f38e Stephen Boyd        2020-12-15  667  		debugfs_create_u32("nproduct_id", 0444, qcom_socinfo->dbg_root,
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  668  				   &qcom_socinfo->info.nproduct_id);
0f12fe7f1e660ac Dmitry Baryshkov    2020-05-25  669  		DEBUGFS_ADD(info, chip_id);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  670  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  671  	case SOCINFO_VERSION(0, 12):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  672  		qcom_socinfo->info.chip_family =
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  673  			__le32_to_cpu(info->chip_family);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  674  		qcom_socinfo->info.raw_device_family =
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  675  			__le32_to_cpu(info->raw_device_family);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  676  		qcom_socinfo->info.raw_device_num =
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  677  			__le32_to_cpu(info->raw_device_num);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  678  
8333b2c26c2f38e Stephen Boyd        2020-12-15  679  		debugfs_create_x32("chip_family", 0444, qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  680  				   &qcom_socinfo->info.chip_family);
8333b2c26c2f38e Stephen Boyd        2020-12-15  681  		debugfs_create_x32("raw_device_family", 0444,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  682  				   qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  683  				   &qcom_socinfo->info.raw_device_family);
8333b2c26c2f38e Stephen Boyd        2020-12-15  684  		debugfs_create_x32("raw_device_number", 0444,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  685  				   qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  686  				   &qcom_socinfo->info.raw_device_num);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  687  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  688  	case SOCINFO_VERSION(0, 11):
734c78e7febf879 Dmitry Baryshkov    2020-12-22  689  		num_pmics = le32_to_cpu(info->num_pmics);
734c78e7febf879 Dmitry Baryshkov    2020-12-22  690  		pmic_array_offset = le32_to_cpu(info->pmic_array_offset);
734c78e7febf879 Dmitry Baryshkov    2020-12-22  691  		if (pmic_array_offset + 2 * num_pmics * sizeof(u32) <= info_size)
734c78e7febf879 Dmitry Baryshkov    2020-12-22  692  			DEBUGFS_ADD(info, pmic_model_array);
734c78e7febf879 Dmitry Baryshkov    2020-12-22  693  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  694  	case SOCINFO_VERSION(0, 10):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  695  	case SOCINFO_VERSION(0, 9):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  696  		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  697  
8333b2c26c2f38e Stephen Boyd        2020-12-15  698  		debugfs_create_u32("foundry_id", 0444, qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  699  				   &qcom_socinfo->info.foundry_id);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  700  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  701  	case SOCINFO_VERSION(0, 8):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  702  	case SOCINFO_VERSION(0, 7):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  703  		DEBUGFS_ADD(info, pmic_model);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  704  		DEBUGFS_ADD(info, pmic_die_rev);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  705  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  706  	case SOCINFO_VERSION(0, 6):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  707  		qcom_socinfo->info.hw_plat_subtype =
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  708  			__le32_to_cpu(info->hw_plat_subtype);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  709  
8333b2c26c2f38e Stephen Boyd        2020-12-15  710  		debugfs_create_u32("hardware_platform_subtype", 0444,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  711  				   qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  712  				   &qcom_socinfo->info.hw_plat_subtype);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  713  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  714  	case SOCINFO_VERSION(0, 5):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  715  		qcom_socinfo->info.accessory_chip =
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  716  			__le32_to_cpu(info->accessory_chip);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  717  
8333b2c26c2f38e Stephen Boyd        2020-12-15  718  		debugfs_create_u32("accessory_chip", 0444,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  719  				   qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  720  				   &qcom_socinfo->info.accessory_chip);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  721  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  722  	case SOCINFO_VERSION(0, 4):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  723  		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  724  
8333b2c26c2f38e Stephen Boyd        2020-12-15  725  		debugfs_create_u32("platform_version", 0444,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  726  				   qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  727  				   &qcom_socinfo->info.plat_ver);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  728  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  729  	case SOCINFO_VERSION(0, 3):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  730  		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  731  
8333b2c26c2f38e Stephen Boyd        2020-12-15  732  		debugfs_create_u32("hardware_platform", 0444,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  733  				   qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  734  				   &qcom_socinfo->info.hw_plat);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  735  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  736  	case SOCINFO_VERSION(0, 2):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  737  		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  738  
8333b2c26c2f38e Stephen Boyd        2020-12-15  739  		debugfs_create_u32("raw_version", 0444, qcom_socinfo->dbg_root,
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  740  				   &qcom_socinfo->info.raw_ver);
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  741  		fallthrough;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  742  	case SOCINFO_VERSION(0, 1):
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  743  		DEBUGFS_ADD(info, build_id);
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  744  		break;
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  745  	}
cd23d1405be666a Vaishali Thakkar    2019-07-24  746  
cd23d1405be666a Vaishali Thakkar    2019-07-24  747  	versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
cd23d1405be666a Vaishali Thakkar    2019-07-24  748  				 &size);
cd23d1405be666a Vaishali Thakkar    2019-07-24  749  
cd23d1405be666a Vaishali Thakkar    2019-07-24  750  	for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
cd23d1405be666a Vaishali Thakkar    2019-07-24  751  		if (!socinfo_image_names[i])
cd23d1405be666a Vaishali Thakkar    2019-07-24  752  			continue;
cd23d1405be666a Vaishali Thakkar    2019-07-24  753  
cd23d1405be666a Vaishali Thakkar    2019-07-24  754  		dentry = debugfs_create_dir(socinfo_image_names[i],
cd23d1405be666a Vaishali Thakkar    2019-07-24  755  					    qcom_socinfo->dbg_root);
8333b2c26c2f38e Stephen Boyd        2020-12-15  756  		debugfs_create_file("name", 0444, dentry, &versions[i],
cd23d1405be666a Vaishali Thakkar    2019-07-24  757  				    &qcom_image_name_ops);
8333b2c26c2f38e Stephen Boyd        2020-12-15  758  		debugfs_create_file("variant", 0444, dentry, &versions[i],
cd23d1405be666a Vaishali Thakkar    2019-07-24  759  				    &qcom_image_variant_ops);
8333b2c26c2f38e Stephen Boyd        2020-12-15  760  		debugfs_create_file("oem", 0444, dentry, &versions[i],
cd23d1405be666a Vaishali Thakkar    2019-07-24  761  				    &qcom_image_oem_ops);
cd23d1405be666a Vaishali Thakkar    2019-07-24  762  	}
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  763  }
9c84c1e78634bd7 Vaishali Thakkar    2019-07-24  764  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

