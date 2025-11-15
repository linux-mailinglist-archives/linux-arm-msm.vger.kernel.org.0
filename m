Return-Path: <linux-arm-msm+bounces-81952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C62B7C60DF2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 00:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1D817357210
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 23:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D4827B34D;
	Sat, 15 Nov 2025 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwQ6nvw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77525F97C;
	Sat, 15 Nov 2025 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763250850; cv=none; b=LXFhB1U16LbXxD7hacBxIFMb37Gr6nntghjVzB7DpHKbSZXMT1NdXV7BsDCXwYYBWEIdVY1zSHY/Ct9xIPK4rwRRIl4jH3daoWVgC8NgmnS19ajQsWHaRhgHT9q/MC5EZbci/aw8QtXNUOHiizaEDqoqKBWyqeL+nh53IDRTAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763250850; c=relaxed/simple;
	bh=D8WoOI+gppvZIMnVLNAEUdHzU6Alj036nY1pL0ZtroU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCd4hm5VFz3ndk2g426mqgBwRVlDkHnnFEvWbGPNEEzTBf8A025/cD6zqqVxf5/M0Blb8gLIfjGX6ulHc/5BlSP2tlgET6TifFPe0n2XP/9dY9Bh008eViyYUBW3t/04Va0ZlooRCXmU0NtKX/jiczQ9jmB89WR4cUpXDZ5l5aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwQ6nvw2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763250849; x=1794786849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D8WoOI+gppvZIMnVLNAEUdHzU6Alj036nY1pL0ZtroU=;
  b=TwQ6nvw23pIMr9C7YvuBUTaP6HQpmZyBtEWq2kk0FclMC12ZRNni5VB7
   MxDr+cqEJ7/4nXzN54keMDMbVdN2MViZgbOF6u7Y+sTJdTXU0owtcLqO8
   XIa8wdMHnprpHsT5EdkF/GEjE8PrCJ1slwitQ0bZU/XCnZnFraBtvayz7
   vWHmvDCkJjx9fBEUXSMFYcuGYD+m4BWRD9DEUskW4WIMxONIrQuJrJnOv
   0puQbenM+J56Z8TDUuGu/oRWoaxAyYdcxJ3Z7U8MtEUUsF353ue4963sW
   ydg0Kn4r3hL/OejZYvZKX68/VSgKWNkfic0/K9POP7FiNz2OMCNqLeJgx
   A==;
X-CSE-ConnectionGUID: sSk4qqRzR+ueuMS2sfRwVg==
X-CSE-MsgGUID: phezhA8TT/y7Cmzo9f+HPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76404770"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="76404770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 15:54:08 -0800
X-CSE-ConnectionGUID: r+ho4jq0R3K+dftKK4xIcA==
X-CSE-MsgGUID: G1FD0U3pRbm7BmaR+zfg5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="195067611"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Nov 2025 15:54:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKQ5j-0008Lj-1n;
	Sat, 15 Nov 2025 23:54:03 +0000
Date: Sun, 16 Nov 2025 07:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au,
	thara.gopinath@gmail.com, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_neersoni@quicinc.com
Subject: Re: [PATCH v3] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
Message-ID: <202511160711.Q6ytYvlG-lkp@intel.com>
References: <20251115084851.2750446-1-quic_utiwari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115084851.2750446-1-quic_utiwari@quicinc.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/quic_utiwari-quicinc-com/crypto-qce-Add-runtime-PM-and-interconnect-bandwidth-scaling-support/20251115-165032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251115084851.2750446-1-quic_utiwari%40quicinc.com
patch subject: [PATCH v3] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251116/202511160711.Q6ytYvlG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160711.Q6ytYvlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160711.Q6ytYvlG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/qce/core.c:295:12: warning: 'qce_runtime_resume' defined but not used [-Wunused-function]
     295 | static int qce_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/crypto/qce/core.c:286:12: warning: 'qce_runtime_suspend' defined but not used [-Wunused-function]
     286 | static int qce_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/qce_runtime_resume +295 drivers/crypto/qce/core.c

   285	
 > 286	static int qce_runtime_suspend(struct device *dev)
   287	{
   288		struct qce_device *qce = dev_get_drvdata(dev);
   289	
   290		icc_disable(qce->mem_path);
   291	
   292		return 0;
   293	}
   294	
 > 295	static int qce_runtime_resume(struct device *dev)
   296	{
   297		struct qce_device *qce = dev_get_drvdata(dev);
   298		int ret = 0;
   299	
   300		ret = icc_enable(qce->mem_path);
   301		if (ret)
   302			return ret;
   303	
   304		ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
   305		if (ret)
   306			goto err_icc;
   307	
   308		return 0;
   309	
   310	err_icc:
   311		icc_disable(qce->mem_path);
   312		return ret;
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

