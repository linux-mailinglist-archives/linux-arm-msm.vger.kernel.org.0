Return-Path: <linux-arm-msm+bounces-704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F17EC523
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FC1CB20B16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A006A1EB41;
	Wed, 15 Nov 2023 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASgSpeI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479FD2D046
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 14:27:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB61C8;
	Wed, 15 Nov 2023 06:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700058441; x=1731594441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYhYhApETD3WaI4adC9XBOsh3iVZc0Tijeg2BL85FTo=;
  b=ASgSpeI/3ja6DmV8GPY0Nluk2a/eq1pAPz1ImfRo+epMb8AIoPz2WKq+
   6ckviktzHOAwW7zvvHCuoKsAzVeVD3OT1/RhsRCgZkd0lGsI5e8z8h6xF
   PljxyIrbrnsGKty7v9iwc7DiVUHZ20mD09pFfIjjZ8/URmwoKSGtWZGdE
   jhfSfo47AxNNXiVtKZLIKKumDmdSB/aHaGmNg5fyHD+W8wqfyRrWeCauu
   t7iFj+T5D9nilVulck4d09C+ZTp2mls/Zu3FzKM2guUhLMz5HpcTwsliD
   t/pd9O7fqcgOaA2aHj0bt81X9zXFPLrig6uUDJHe3uSWzRHT5h+jRndPQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9519395"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="9519395"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768595544"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="768595544"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2023 06:27:16 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3GrK-0000Oy-0y;
	Wed, 15 Nov 2023 14:27:14 +0000
Date: Wed, 15 Nov 2023 22:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org,
	Michael Bottini <michael.a.bottini@linux.intel.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 1/6] PCI/ASPM: Add locked helper for enabling link state
Message-ID: <202311152225.ZdVv0ufT-lkp@intel.com>
References: <20231114135553.32301-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114135553.32301-2-johan+linaro@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/PCI-ASPM-Add-locked-helper-for-enabling-link-state/20231114-220117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20231114135553.32301-2-johan%2Blinaro%40kernel.org
patch subject: [PATCH 1/6] PCI/ASPM: Add locked helper for enabling link state
config: x86_64-randconfig-002-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152225.ZdVv0ufT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152225.ZdVv0ufT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152225.ZdVv0ufT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/aspm.c:1186: warning: expecting prototype for pci_enable_link_state(). Prototype was for pci_enable_link_state_locked() instead


vim +1186 drivers/pci/pcie/aspm.c

  1172	
  1173	/**
  1174	 * pci_enable_link_state - Clear and set the default device link state so that
  1175	 * the link may be allowed to enter the specified states. Note that if the
  1176	 * BIOS didn't grant ASPM control to the OS, this does nothing because we can't
  1177	 * touch the LNKCTL register. Also note that this does not enable states
  1178	 * disabled by pci_disable_link_state(). Return 0 or a negative errno.
  1179	 *
  1180	 * @pdev: PCI device
  1181	 * @state: Mask of ASPM link states to enable
  1182	 *
  1183	 * Context: Caller holds pci_bus_sem read lock.
  1184	 */
  1185	int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
> 1186	{
  1187		lockdep_assert_held_read(&pci_bus_sem);
  1188	
  1189		return __pci_enable_link_state(pdev, state, true);
  1190	}
  1191	EXPORT_SYMBOL(pci_enable_link_state_locked);
  1192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

