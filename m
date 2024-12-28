Return-Path: <linux-arm-msm+bounces-43520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E969FD866
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 01:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 434DD7A2099
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 00:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBE7B676;
	Sat, 28 Dec 2024 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixJFcbXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D5B665
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735345210; cv=none; b=FejCzwH3RdeFvKQrglUEEky0L5OWY+OUd5e0z1NWME+3ooLqnLdTBGjomde4D0cqbsXDY0TtXIxyvMHH9qlvdMr1aCvXRGsIa4Y91QZhsifdtDJoMNXxdJzWGsSri4BCbuJowcs3JeGmxPq5szdA6e8hwMBNJp6w7UeGXazO5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735345210; c=relaxed/simple;
	bh=fzl8JZUoeCkO40U7IvbhosdeFL3vTrfTAD4wrTm300U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfA8wZF38KLf/hvGLVaZIWyjQ2oE01HBgesedbbVBGoNVhiQ+1yswy4F0QHTVR6EURIilSIqHyvUt+pNOka08urdoBSSV2cP9e4d7IOPHYJg+mAqT0VuSIZydWLni1s8SAPd3KBrMJ8QozHM3WYAmuuHsbDImlqSbXoFXLuuePg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixJFcbXa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735345208; x=1766881208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fzl8JZUoeCkO40U7IvbhosdeFL3vTrfTAD4wrTm300U=;
  b=ixJFcbXazV7RmoZg92yS7rcK2wvkfn/j6QEcYn5EM/SXEE1E5VSCXXa9
   U4bT1ZYGMmmryfqvhxNUVDxi1L0zLuFiDlItcjFPwVyMEJeBrVUTGQySv
   22wIX9DIrIN0f72+o3WtuVydBHJ9/jsT3y+kUzzM4DkQ271LItxxbMQZp
   Juks3RFyi+0D73z9FpfAIajR7yAmOn8nHCC7q/dYGImFE5CDyrrGDDmSp
   2QjmC9W2YITO8f64I+W8bnprASpn6oRiqSUFltiYeyxY/BQKj6F95gjXo
   uS5oQHx8jen1KJ0R2YX/zy3cAFXnUwJ4TwDe+YewlRmNm6uePQbicb3Dj
   g==;
X-CSE-ConnectionGUID: NUH5WRBrQDiEV5Si/jrFag==
X-CSE-MsgGUID: yNfz1dhhQb2BtFkdWenCmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35898083"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35898083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 16:20:07 -0800
X-CSE-ConnectionGUID: RkT3HwAhRTqPFMVAy7/NjQ==
X-CSE-MsgGUID: S7KfgVNeQLels56W1NRBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100643003"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Dec 2024 16:20:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRKYk-0003ku-1g;
	Sat, 28 Dec 2024 00:20:02 +0000
Date: Sat, 28 Dec 2024 08:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
	manivannan.sadhasivam@linaro.org, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ogabbay@kernel.org,
	lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mhi@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Message-ID: <202412280859.rkIldm5t-lkp@intel.com>
References: <20241213213340.2551697-8-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213213340.2551697-8-quic_jhugo@quicinc.com>

Hi Jeffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc4 next-20241220]
[cannot apply to mani-mhi/mhi-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/bus-mhi-host-Refactor-BHI-BHIe-based-firmware-loading/20241214-053540
base:   linus/master
patch link:    https://lore.kernel.org/r/20241213213340.2551697-8-quic_jhugo%40quicinc.com
patch subject: [PATCH 7/7] accel/qaic: Add AIC200 support
config: i386-randconfig-007-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280859.rkIldm5t-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280859.rkIldm5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280859.rkIldm5t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/qaic/sahara.c:5:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/accel/qaic/sahara.c:781:24: error: assigning to 'const char **' from 'const char *const[76]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     781 |                 context->image_table = aic200_image_table;
         |                                      ^ ~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +781 drivers/accel/qaic/sahara.c

   744	
   745	static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
   746	{
   747		struct sahara_context *context;
   748		int ret;
   749		int i;
   750	
   751		context = devm_kzalloc(&mhi_dev->dev, sizeof(*context), GFP_KERNEL);
   752		if (!context)
   753			return -ENOMEM;
   754	
   755		context->rx = devm_kzalloc(&mhi_dev->dev, SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
   756		if (!context->rx)
   757			return -ENOMEM;
   758	
   759		/*
   760		 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
   761		 * will request for READ_DATA. This is larger than
   762		 * SAHARA_PACKET_MAX_SIZE, and we need 9x SAHARA_PACKET_MAX_SIZE to
   763		 * cover SAHARA_TRANSFER_MAX_SIZE. When the remote side issues a
   764		 * READ_DATA, it requires a transfer of the exact size requested. We
   765		 * can use MHI_CHAIN to link multiple buffers into a single transfer
   766		 * but the remote side will not consume the buffers until it sees an
   767		 * EOT, thus we need to allocate enough buffers to put in the tx fifo
   768		 * to cover an entire READ_DATA request of the max size.
   769		 */
   770		for (i = 0; i < SAHARA_NUM_TX_BUF; ++i) {
   771			context->tx[i] = devm_kzalloc(&mhi_dev->dev, SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
   772			if (!context->tx[i])
   773				return -ENOMEM;
   774		}
   775	
   776		context->mhi_dev = mhi_dev;
   777		INIT_WORK(&context->fw_work, sahara_processing);
   778		INIT_WORK(&context->dump_work, sahara_dump_processing);
   779	
   780		if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
 > 781			context->image_table = aic200_image_table;
   782			context->table_size = ARRAY_SIZE(aic200_image_table);
   783		} else {
   784			context->image_table = aic100_image_table;
   785			context->table_size = ARRAY_SIZE(aic100_image_table);
   786		}
   787	
   788		context->active_image_id = SAHARA_IMAGE_ID_NONE;
   789		dev_set_drvdata(&mhi_dev->dev, context);
   790	
   791		ret = mhi_prepare_for_transfer(mhi_dev);
   792		if (ret)
   793			return ret;
   794	
   795		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, context->rx, SAHARA_PACKET_MAX_SIZE, MHI_EOT);
   796		if (ret) {
   797			mhi_unprepare_from_transfer(mhi_dev);
   798			return ret;
   799		}
   800	
   801		return 0;
   802	}
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

