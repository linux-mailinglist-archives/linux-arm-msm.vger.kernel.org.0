Return-Path: <linux-arm-msm+bounces-74290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAFB8CDA4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D3F3BC6CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0169E305946;
	Sat, 20 Sep 2025 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRs16w05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F61228CB8;
	Sat, 20 Sep 2025 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758388351; cv=none; b=SZLb8rW17VpKYPddOy7LhoWxv/NYV3nhHwk+5ikxBZ9dnTvhvqv7wba9Jt7v514OIAx05Wd7DSXK8Q95X6eMv30dM73U3XZuGgxpP++3WBfRGJwIm8VfhHpFoBECUEitRlDeixDkZo/DteFAfWK1goMgtzApgc8tIfmRkTiPCV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758388351; c=relaxed/simple;
	bh=q79LSJRIN+4CMGDHGwwOtCi+446YUY7DGBcf9uK/a+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWLJRI+P3NJ7IfIHipyl9gR97ZGSU4TgOld3M8LZnPeIz9UAvdoI0F0gMmVFS55is2/EM69ibKBEtxQrA405ueOu98GRKWKWNUrina4ewtV0KFP7q40Yqbx3zsmz4HN/cPQ6mcq2kaUy+Xce1+UyFbheUH8WDSys6o9DMB/ci3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRs16w05; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758388350; x=1789924350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q79LSJRIN+4CMGDHGwwOtCi+446YUY7DGBcf9uK/a+8=;
  b=YRs16w05LEWGg1ab6Gp6Tr8zYriZsk50wWXiC+bD+HJaP9yi4pbGdzp+
   CP1TFXHWX8VUrukvlweYdoFyF3b9Lt2ZpTK0KRS0BjY2EjR3+YF0h9j3j
   vahtJBhN/DaoYY958Hqc0lac3Hx1cBwJHOxxu3Up+1Dlksn6DliYxEoOg
   cB+q+M2us3uPRM0WdyzC9xJP4w+9JMcHJLUj14wi4Xv8hsY3D7FSakagw
   +GYlel1oEVkzKzy3YUAj4WQCR4s4bcPDy05tDzHBsF3EbIzedJAcTLJHg
   9YNgd/7sDaSCuO9Ug9G87fRVFwFVKhArkIfssXiS52f2wv7sythJv6iCn
   A==;
X-CSE-ConnectionGUID: G3XQyPbyTcOe7+2k0RzzYQ==
X-CSE-MsgGUID: ECIFiZiOSfKeDvlqtsqvgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="78316339"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="78316339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 10:12:29 -0700
X-CSE-ConnectionGUID: pt82aHB0SAS5SO5GndB+ZQ==
X-CSE-MsgGUID: BsB7TnlMQ+qllss3tERJeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="180354343"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Sep 2025 10:12:25 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v018J-0005Zb-0J;
	Sat, 20 Sep 2025 17:12:23 +0000
Date: Sun, 21 Sep 2025 01:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, kishon@kernel.org, vkoul@kernel.org,
	gregkh@linuxfoundation.org, robh@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH 6/9] phy: qualcomm: qmp-combo: Update QMP PHY with Glymur
 settings
Message-ID: <202509210051.o1oMhgXv-lkp@intel.com>
References: <20250920032108.242643-7-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-7-wesley.cheng@oss.qualcomm.com>

Hi Wesley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wesley-Cheng/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-phy-Add-Glymur-compatible/20250920-112504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250920032108.242643-7-wesley.cheng%40oss.qualcomm.com
patch subject: [PATCH 6/9] phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
config: x86_64-buildonly-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250921/202509210051.o1oMhgXv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210051.o1oMhgXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509210051.o1oMhgXv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1745:38: warning: unused variable 'glymur_usb43dp_pcs_misc_tbl' [-Wunused-const-variable]
    1745 | static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/glymur_usb43dp_pcs_misc_tbl +1745 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

  1744	
> 1745	static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
  1746		QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),
  1747	};
  1748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

