Return-Path: <linux-arm-msm+bounces-55822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E3EA9DC3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 18:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5698092191E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 16:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D899203704;
	Sat, 26 Apr 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvUg6ll5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06F1C5486;
	Sat, 26 Apr 2025 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684963; cv=none; b=IP+mOd/XII1DAB/T5kfNv20WEAp029ZRe5b4xDqTxKCjT/X5x+/0OcCovCAKj50QG4MaBmcr8LeFuHPd0QmLML64nsWOlXNcZ1dnEZxITTZmDuf8mNAil5oMUCNYPgBRT/5nqNj1bm6KlJRdZS8D76u+NLnDKi2wtzIc1ZI/hhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684963; c=relaxed/simple;
	bh=2GWhl92P7oAW9ExEf7++CKsqJSUvpkesZH5ExqqP6yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zvbc0BTNC6aH2czuMQ39PFWU42gesxLGOiSXPvYUxpODmgEwalPXbj3JyNspESOPEhEdGtFw1fzVX3lVGJYgF+WCXggSv0uv3YIKmucQHehFEdLaYIf7TrFc26PmQ7mCgPhNCVnckcQbslXFqCH2mcrvI1qVxZ/Tc+O0etwi7Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvUg6ll5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745684962; x=1777220962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2GWhl92P7oAW9ExEf7++CKsqJSUvpkesZH5ExqqP6yI=;
  b=XvUg6ll53Squ+koQ+RxwhvaG5GmN7BLKB8lyumSRMghkUHMmAy1CodGR
   wylDp/+Wa8lTaKhXo4WIgP5JNTK095bCGRTT/bkRPCnbeXH1JNz3+Ei1v
   NTQeg4S4XwNFLpqYnjdiYIu6qx3Rc1haM4K/w2D4Cbo8rmmEDjSfSArQO
   /vSykO6reagKzUSTqFL35v+W5xHrOdrOoQVLx+Nz04xMyivHtfKHk6fiy
   1DHpXmiAW501lOxjSqsGkvgQf7BLxbkujB6RX88eafxL+2BJK5UMH/9Z0
   uK9His8VBxvAKJE7Xe1zGMAtMIBAw3ez7LdztdpfKwVPFIk9F5RJMzZ0T
   w==;
X-CSE-ConnectionGUID: uUWuzlPNSGGC2r3grSIx2A==
X-CSE-MsgGUID: Nni3UlnfR1+GE200hyXRow==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47409888"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47409888"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 09:29:21 -0700
X-CSE-ConnectionGUID: EGaZ1FxsSOanIGctfTMPHA==
X-CSE-MsgGUID: iwt7+TXJSHGMZGg0Ez2+EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="170359922"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2025 09:29:19 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8iOy-0005uv-1V;
	Sat, 26 Apr 2025 16:29:16 +0000
Date: Sun, 27 Apr 2025 00:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
Message-ID: <202504270011.Jftyvklb-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250427/202504270011.Jftyvklb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270011.Jftyvklb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270011.Jftyvklb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/socinfo.c: In function 'socinfo_debugfs_init':
>> drivers/soc/qcom/socinfo.c:613:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
     613 |                 debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     614 |                                    &qcom_socinfo->info.raw_package_type);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/socinfo.c:615:9: note: here
     615 |         case SOCINFO_VERSION(0, 19):
         |         ^~~~


vim +613 drivers/soc/qcom/socinfo.c

   592	
   593	static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
   594					 struct socinfo *info, size_t info_size)
   595	{
   596		struct smem_image_version *versions;
   597		struct dentry *dentry;
   598		size_t size;
   599		int i;
   600		unsigned int num_pmics;
   601		unsigned int pmic_array_offset;
   602	
   603		qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
   604	
   605		qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
   606	
   607		debugfs_create_x32("info_fmt", 0444, qcom_socinfo->dbg_root,
   608				   &qcom_socinfo->info.fmt);
   609	
   610		switch (qcom_socinfo->info.fmt) {
   611		case SOCINFO_VERSION(0, 20):
   612			qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
 > 613			debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
   614					   &qcom_socinfo->info.raw_package_type);
   615		case SOCINFO_VERSION(0, 19):
   616			qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
   617			qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
   618			qcom_socinfo->info.boot_core = __le32_to_cpu(info->boot_core);
   619	
   620			debugfs_create_u32("num_func_clusters", 0444, qcom_socinfo->dbg_root,
   621					   &qcom_socinfo->info.num_func_clusters);
   622			debugfs_create_u32("boot_cluster", 0444, qcom_socinfo->dbg_root,
   623					   &qcom_socinfo->info.boot_cluster);
   624			debugfs_create_u32("boot_core", 0444, qcom_socinfo->dbg_root,
   625					   &qcom_socinfo->info.boot_core);
   626			fallthrough;
   627		case SOCINFO_VERSION(0, 18):
   628		case SOCINFO_VERSION(0, 17):
   629			qcom_socinfo->info.oem_variant = __le32_to_cpu(info->oem_variant);
   630			debugfs_create_u32("oem_variant", 0444, qcom_socinfo->dbg_root,
   631					   &qcom_socinfo->info.oem_variant);
   632			fallthrough;
   633		case SOCINFO_VERSION(0, 16):
   634			qcom_socinfo->info.feature_code = __le32_to_cpu(info->feature_code);
   635			qcom_socinfo->info.pcode = __le32_to_cpu(info->pcode);
   636	
   637			debugfs_create_u32("feature_code", 0444, qcom_socinfo->dbg_root,
   638					   &qcom_socinfo->info.feature_code);
   639			debugfs_create_u32("pcode", 0444, qcom_socinfo->dbg_root,
   640					   &qcom_socinfo->info.pcode);
   641			fallthrough;
   642		case SOCINFO_VERSION(0, 15):
   643			qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
   644	
   645			debugfs_create_u32("nmodem_supported", 0444, qcom_socinfo->dbg_root,
   646					   &qcom_socinfo->info.nmodem_supported);
   647			fallthrough;
   648		case SOCINFO_VERSION(0, 14):
   649			qcom_socinfo->info.num_clusters = __le32_to_cpu(info->num_clusters);
   650			qcom_socinfo->info.ncluster_array_offset = __le32_to_cpu(info->ncluster_array_offset);
   651			qcom_socinfo->info.num_subset_parts = __le32_to_cpu(info->num_subset_parts);
   652			qcom_socinfo->info.nsubset_parts_array_offset =
   653				__le32_to_cpu(info->nsubset_parts_array_offset);
   654	
   655			debugfs_create_u32("num_clusters", 0444, qcom_socinfo->dbg_root,
   656					   &qcom_socinfo->info.num_clusters);
   657			debugfs_create_u32("ncluster_array_offset", 0444, qcom_socinfo->dbg_root,
   658					   &qcom_socinfo->info.ncluster_array_offset);
   659			debugfs_create_u32("num_subset_parts", 0444, qcom_socinfo->dbg_root,
   660					   &qcom_socinfo->info.num_subset_parts);
   661			debugfs_create_u32("nsubset_parts_array_offset", 0444, qcom_socinfo->dbg_root,
   662					   &qcom_socinfo->info.nsubset_parts_array_offset);
   663			fallthrough;
   664		case SOCINFO_VERSION(0, 13):
   665			qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
   666	
   667			debugfs_create_u32("nproduct_id", 0444, qcom_socinfo->dbg_root,
   668					   &qcom_socinfo->info.nproduct_id);
   669			DEBUGFS_ADD(info, chip_id);
   670			fallthrough;
   671		case SOCINFO_VERSION(0, 12):
   672			qcom_socinfo->info.chip_family =
   673				__le32_to_cpu(info->chip_family);
   674			qcom_socinfo->info.raw_device_family =
   675				__le32_to_cpu(info->raw_device_family);
   676			qcom_socinfo->info.raw_device_num =
   677				__le32_to_cpu(info->raw_device_num);
   678	
   679			debugfs_create_x32("chip_family", 0444, qcom_socinfo->dbg_root,
   680					   &qcom_socinfo->info.chip_family);
   681			debugfs_create_x32("raw_device_family", 0444,
   682					   qcom_socinfo->dbg_root,
   683					   &qcom_socinfo->info.raw_device_family);
   684			debugfs_create_x32("raw_device_number", 0444,
   685					   qcom_socinfo->dbg_root,
   686					   &qcom_socinfo->info.raw_device_num);
   687			fallthrough;
   688		case SOCINFO_VERSION(0, 11):
   689			num_pmics = le32_to_cpu(info->num_pmics);
   690			pmic_array_offset = le32_to_cpu(info->pmic_array_offset);
   691			if (pmic_array_offset + 2 * num_pmics * sizeof(u32) <= info_size)
   692				DEBUGFS_ADD(info, pmic_model_array);
   693			fallthrough;
   694		case SOCINFO_VERSION(0, 10):
   695		case SOCINFO_VERSION(0, 9):
   696			qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
   697	
   698			debugfs_create_u32("foundry_id", 0444, qcom_socinfo->dbg_root,
   699					   &qcom_socinfo->info.foundry_id);
   700			fallthrough;
   701		case SOCINFO_VERSION(0, 8):
   702		case SOCINFO_VERSION(0, 7):
   703			DEBUGFS_ADD(info, pmic_model);
   704			DEBUGFS_ADD(info, pmic_die_rev);
   705			fallthrough;
   706		case SOCINFO_VERSION(0, 6):
   707			qcom_socinfo->info.hw_plat_subtype =
   708				__le32_to_cpu(info->hw_plat_subtype);
   709	
   710			debugfs_create_u32("hardware_platform_subtype", 0444,
   711					   qcom_socinfo->dbg_root,
   712					   &qcom_socinfo->info.hw_plat_subtype);
   713			fallthrough;
   714		case SOCINFO_VERSION(0, 5):
   715			qcom_socinfo->info.accessory_chip =
   716				__le32_to_cpu(info->accessory_chip);
   717	
   718			debugfs_create_u32("accessory_chip", 0444,
   719					   qcom_socinfo->dbg_root,
   720					   &qcom_socinfo->info.accessory_chip);
   721			fallthrough;
   722		case SOCINFO_VERSION(0, 4):
   723			qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
   724	
   725			debugfs_create_u32("platform_version", 0444,
   726					   qcom_socinfo->dbg_root,
   727					   &qcom_socinfo->info.plat_ver);
   728			fallthrough;
   729		case SOCINFO_VERSION(0, 3):
   730			qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
   731	
   732			debugfs_create_u32("hardware_platform", 0444,
   733					   qcom_socinfo->dbg_root,
   734					   &qcom_socinfo->info.hw_plat);
   735			fallthrough;
   736		case SOCINFO_VERSION(0, 2):
   737			qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
   738	
   739			debugfs_create_u32("raw_version", 0444, qcom_socinfo->dbg_root,
   740					   &qcom_socinfo->info.raw_ver);
   741			fallthrough;
   742		case SOCINFO_VERSION(0, 1):
   743			DEBUGFS_ADD(info, build_id);
   744			break;
   745		}
   746	
   747		versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
   748					 &size);
   749	
   750		for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
   751			if (!socinfo_image_names[i])
   752				continue;
   753	
   754			dentry = debugfs_create_dir(socinfo_image_names[i],
   755						    qcom_socinfo->dbg_root);
   756			debugfs_create_file("name", 0444, dentry, &versions[i],
   757					    &qcom_image_name_ops);
   758			debugfs_create_file("variant", 0444, dentry, &versions[i],
   759					    &qcom_image_variant_ops);
   760			debugfs_create_file("oem", 0444, dentry, &versions[i],
   761					    &qcom_image_oem_ops);
   762		}
   763	}
   764	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

