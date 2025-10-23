Return-Path: <linux-arm-msm+bounces-78631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E1C02C72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 19:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE983A51A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 17:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD56347BD7;
	Thu, 23 Oct 2025 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVeFlUr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EEE3112D5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761241437; cv=none; b=hOD8PHurcZLmSaNw0KjLW1Uegrc/uqUvcEFbTPGMtVyGQWyEEfvdeIZhqwPnsmBYg16MLkDjABs0IBEgG7KUxKysxdwFqU2S4RMZqHH3diRe+p2hO71AFh4eREP4dmfoueLWitwZw0ORooZtJNS8NQl8l+EFHOvrwGl69Ijz3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761241437; c=relaxed/simple;
	bh=OPmFaWma6y4YW8vwhdFuBehBTVgNJVOFP3M1cphhH8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXMw9qn9Q2UB5jctfKvm5hf3Y90xrjMTdjZb5TNtAmcEhOMFvqMU+Vu/eViFIqvfgrQ6OHZ42KQi2FztodP57gV5Zz72JzkRPNIfovYue95bAjYCWI8H6qFSOFsnbbdCbkrRCO6zodscjXXHi/4stRdT8OVIce9ssIXg0MD5jGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVeFlUr/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761241436; x=1792777436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPmFaWma6y4YW8vwhdFuBehBTVgNJVOFP3M1cphhH8g=;
  b=JVeFlUr/9/CLb2N+Rvd7YZsj9ITnBIcODVAVkTS4XmnJWi34NoByIKHY
   05TSfNWP9q8dJR8Nj9zdJA3suBg/QXaOxnkzvQgab7/IzJ8JE+wPQF8wn
   K286cv9qSrAgUK9z8N4dLsYV64kmNYlE2Dcy6xSrKh8hp84qEwaugL16M
   IQ7KEkhjtLZDD/giwEvbdMI/DulstQi8UFZ7Hb6kUkTGxpfC+L1Mgv/Pc
   GprcWlxycH1rVM/V8fz4YkpteAbEyC/gfwBI2fJ2ckrbQ6B03oXsYRj7B
   8zHUXydttcSSNupN+LDcC+5JwbbRasCD7E9PJQ3jeQ25GvISYUp9vI8fZ
   A==;
X-CSE-ConnectionGUID: VQ3R61PISze7wRv7LLJ+7Q==
X-CSE-MsgGUID: bGVIRfTBTDqftjfCvsN+3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67066255"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="67066255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 10:43:56 -0700
X-CSE-ConnectionGUID: gCMptSLHQvGzxmqyUN3+eA==
X-CSE-MsgGUID: jjGlo5O6SB6ztosuZedC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="184116064"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 10:43:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBzL6-000DkT-1T;
	Thu, 23 Oct 2025 17:43:50 +0000
Date: Fri, 24 Oct 2025 01:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
	troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, ogabbay@kernel.org, lizhi.hou@amd.com,
	karol.wachowski@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
Message-ID: <202510240118.dkdhMpfy-lkp@intel.com>
References: <20251022202527.3873558-2-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022202527.3873558-2-youssef.abdulrahman@oss.qualcomm.com>

Hi Youssef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc2 next-20251023]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youssef-Samir/accel-qaic-Add-DMA-Bridge-Channel-DBC-sysfs-and-uevents/20251023-042723
base:   linus/master
patch link:    https://lore.kernel.org/r/20251022202527.3873558-2-youssef.abdulrahman%40oss.qualcomm.com
patch subject: [PATCH 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251024/202510240118.dkdhMpfy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240118.dkdhMpfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240118.dkdhMpfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/qaic/qaic_sysfs.c: In function 'qaic_sysfs_init':
>> drivers/accel/qaic/qaic_sysfs.c:74:58: warning: '_state' directive output may be truncated writing 6 bytes into a region of size between 3 and 10 [-Wformat-truncation=]
      74 |                 snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
         |                                                          ^~~~~~
   drivers/accel/qaic/qaic_sysfs.c:74:17: note: 'snprintf' output between 11 and 18 bytes into a destination of size 14
      74 |                 snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_state +74 drivers/accel/qaic/qaic_sysfs.c

    56	
    57	int qaic_sysfs_init(struct qaic_drm_device *qddev)
    58	{
    59		struct device *kdev = to_accel_kdev(qddev);
    60		struct drm_device *drm = to_drm(qddev);
    61		u32 num_dbc = qddev->qdev->num_dbc;
    62		struct dbc_attribute *dbc_attrs;
    63		int i, ret;
    64	
    65		dbc_attrs = drmm_kcalloc(drm, num_dbc, sizeof(*dbc_attrs), GFP_KERNEL);
    66		if (!dbc_attrs)
    67			return -ENOMEM;
    68	
    69		for (i = 0; i < num_dbc; ++i) {
    70			struct dbc_attribute *dbc_attr = &dbc_attrs[i];
    71	
    72			sysfs_attr_init(&dbc_attr->dev_attr.attr);
    73			dbc_attr->dbc_id = i;
  > 74			snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
    75			dbc_attr->dev_attr.attr.name = dbc_attr->name;
    76			dbc_attr->dev_attr.attr.mode = 0444;
    77			dbc_attr->dev_attr.show = dbc_state_show;
    78			ret = sysfs_create_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
    79			if (ret) {
    80				int j;
    81	
    82				for (j = 0; j < i; ++j) {
    83					dbc_attr = &dbc_attrs[j];
    84					sysfs_remove_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
    85				}
    86				drmm_kfree(drm, dbc_attrs);
    87				return ret;
    88			}
    89		}
    90	
    91		qddev->sysfs_attrs = dbc_attrs;
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

