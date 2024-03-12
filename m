Return-Path: <linux-arm-msm+bounces-13900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37F878FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 09:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4C41F21E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 08:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F6877A0E;
	Tue, 12 Mar 2024 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULFVxWRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FA77A1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710233192; cv=none; b=l963ey9gj0cgzchr8jnqp+MZo0MTSPuAHAmlwxA1SYmvH4Q6c+M/2Mjyr1nygJTArzGbaOCO77PRkARM/lIM5YJb/1m6c2IxkOoElO6DwRJA1ldEYclJ3zIi7Yo5zG6zZSGnjFyBKS95lpXrwxvvvZyO4nLkW1vd+LzyAfCyEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710233192; c=relaxed/simple;
	bh=5Ko/VT+i8QS/Cf3MYddfAVm1qXw1bPA+rqXN4vv3cMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfss503Lxb78xSFloPEh0QethMwTwJPweYqNdZGIXITwrQK3QyzsiPNtzKI7/4Jxx1wMUyx6GbiTTgYS1ixEy9wncuQi12Kpntyyl4WQ8PR4mQmg7zASc0lh3bVqRnQV7KOv9ySLFbG51C/9EdsnlA2umF0Hg0H3DwBcUpqI4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULFVxWRL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710233188; x=1741769188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Ko/VT+i8QS/Cf3MYddfAVm1qXw1bPA+rqXN4vv3cMA=;
  b=ULFVxWRLRD8M7vdeQkwLzFgzYLdz/f4Yyac6oRQ+Rs/jRLe+e1MON/xO
   nIuilk8gCO7pqAvtBW45CV+V7R+aKjoa8e8Z16BbJDJ8EQZ1QXkKJekum
   VtoPNtkv6+GQWSWIbhOHPokgyfETLhnUHEIou7ZmEAFaN772JcUTqUlmQ
   dEo9dnzppAazAZ2jHP3fo3W8sgk9muQ/viTOCitDSKSa9IjnLBU1EdMHe
   +Z38ZM3EPQX+yiWmm1UVDLE9kL6KlFRFSX73wpnLLcBzUABTfozz4xe7m
   RBcVBJN2oHRlZROWyfDefO/WOP31XTlyAWmSObxTaTVnSHwIprnTrqNU+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4783447"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="4783447"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 01:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11532773"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2024 01:46:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjxmB-0009z1-0r;
	Tue, 12 Mar 2024 08:46:23 +0000
Date: Tue, 12 Mar 2024 16:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
	quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
	jacek.lawrynowicz@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 2/3] accel/qaic: Add fifo size debugfs
Message-ID: <202403121628.x2PPKBRx-lkp@intel.com>
References: <20240311165826.1728693-3-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311165826.1728693-3-quic_jhugo@quicinc.com>

Hi Jeffrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20240312]
[cannot apply to linus/master v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/accel-qaic-Add-bootlog-debugfs/20240312-010045
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240311165826.1728693-3-quic_jhugo%40quicinc.com
patch subject: [PATCH 2/3] accel/qaic: Add fifo size debugfs
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240312/202403121628.x2PPKBRx-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121628.x2PPKBRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121628.x2PPKBRx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/qaic/qaic_debugfs.c: In function 'qaic_debugfs_init':
>> drivers/accel/qaic/qaic_debugfs.c:112:55: warning: '%03u' directive output may be truncated writing between 3 and 10 bytes into a region of size 6 [-Wformat-truncation=]
     112 |                 snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
         |                                                       ^~~~
   drivers/accel/qaic/qaic_debugfs.c:112:51: note: directive argument in the range [0, 4294967294]
     112 |                 snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
         |                                                   ^~~~~~~~~
   drivers/accel/qaic/qaic_debugfs.c:112:17: note: 'snprintf' output between 7 and 14 bytes into a destination of size 9
     112 |                 snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +112 drivers/accel/qaic/qaic_debugfs.c

    99	
   100	void qaic_debugfs_init(struct qaic_drm_device *qddev)
   101	{
   102		struct qaic_device *qdev = qddev->qdev;
   103		struct dentry *debugfs_root;
   104		struct dentry *debugfs_dir;
   105		char name[QAIC_DBC_DIR_NAME];
   106		u32 i;
   107	
   108		debugfs_root = to_drm(qddev)->debugfs_root;
   109	
   110		debugfs_create_file("bootlog", 0400, debugfs_root, qdev, &bootlog_fops);
   111		for (i = 0; i < qdev->num_dbc; ++i) {
 > 112			snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
   113			debugfs_dir = debugfs_create_dir(name, debugfs_root);
   114			debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
   115		}
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

