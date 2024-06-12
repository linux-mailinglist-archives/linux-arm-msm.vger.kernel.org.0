Return-Path: <linux-arm-msm+bounces-22501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5DC905AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D5DB1C21CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECA659B4A;
	Wed, 12 Jun 2024 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8ii8SpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F654AEF4;
	Wed, 12 Jun 2024 18:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217074; cv=none; b=r2bhK0xl0STKEdLf07GqJJQz04c9SopgDDvwC6wmmSiQ3hS/Rc3PKZX8kVffe/ODnT1LVHNe2hvMn3GnIOXiCv+6RZyc0N5npv4MinK2rx+3kKW8aC3mJbhv5kxvB2CtZVByWQJDmmcFH1pIWNkdGZBHaCGaPOotpomLKfJidS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217074; c=relaxed/simple;
	bh=6zChqabg+jrjms+BmIotaOqJm9mHGdH7DbrkmgDnhkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4Eb6g9WcLLZv0iifQlh9iYb7dUABMVA78am5SRKAh7XDqIXbGOUwuiz/H+jEd++ouXF0HO0S9v4lId+ICvB18kvp9H6yUxNAW8JuqKwWFZ/5jYuMa/3wXsKuFt+O8Zc1htX6mJ0TC/o0x7pEeUy5WqjfvOZYovDbM8VMpJGVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8ii8SpZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718217072; x=1749753072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6zChqabg+jrjms+BmIotaOqJm9mHGdH7DbrkmgDnhkA=;
  b=F8ii8SpZ+1CFkNvxHxEpzJ3/ElBnkzdQ75bNnEAqIwDaBA76BX8VZeym
   ZW3B0PVTW4ia72Mj4WbvsIpgnM9n/SxU1Pm04qIGvVtWYIsr7OSll4QyG
   c/b5spcc5QKBhxwi1XqWz7OLLyDYVvN/h6UQhR7wnv1p7ekQjmJvZrzQY
   jZScObl/Yg1dnHvy1o83SdMnNoBtWP1aRcf7wWmfIHKagb/dQ/VG6Cn0D
   XfbnhiTQ5gvjxX/D1yl1Ol/FNxbi/4FXNTbxaYbnQoxOjSOBPE0n1q5Le
   jt5wy41VchgzbbbwbbdeMsskpX654VwGj9+1kS5RQzTEwvOwd06utiVpf
   Q==;
X-CSE-ConnectionGUID: ow5u5epJQeGm4fw8CCBe0g==
X-CSE-MsgGUID: j8oanuLARlKbN9fmpliqgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14802777"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14802777"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:31:12 -0700
X-CSE-ConnectionGUID: 3Rbjk7C7QFGkdQjv3VdJmw==
X-CSE-MsgGUID: w7BvMGymTKGvtmdm7uyvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40352179"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 11:31:09 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHSkU-0001os-1R;
	Wed, 12 Jun 2024 18:31:06 +0000
Date: Thu, 13 Jun 2024 02:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Slark Xiao <slark_xiao@163.com>, manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, quic_jhugo@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Slark Xiao <slark_xiao@163.com>
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Message-ID: <202406130220.gq15Sjzk-lkp@intel.com>
References: <20240612093842.359805-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612093842.359805-1-slark_xiao@163.com>

Hi Slark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on linus/master v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Slark-Xiao/net-wwan-mhi-make-default-data-link-id-configurable/20240612-174242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/20240612093842.359805-1-slark_xiao%40163.com
patch subject: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240613/202406130220.gq15Sjzk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130220.gq15Sjzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130220.gq15Sjzk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pci_generic.c:57: warning: Function parameter or struct member 'mux_id' not described in 'mhi_pci_dev_info'


vim +57 drivers/bus/mhi/host/pci_generic.c

48f98496b1de132f drivers/bus/mhi/host/pci_generic.c Qiang Yu      2024-04-24  32  
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  33  /**
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  34   * struct mhi_pci_dev_info - MHI PCI device specific information
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  35   * @config: MHI controller configuration
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  36   * @name: name of the PCI module
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  37   * @fw: firmware path (if any)
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  38   * @edl: emergency download mode firmware path (if any)
48f98496b1de132f drivers/bus/mhi/host/pci_generic.c Qiang Yu      2024-04-24  39   * @edl_trigger: capable of triggering EDL mode in the device (if supported)
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  40   * @bar_num: PCI base address register to use for MHI MMIO register space
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  41   * @dma_data_width: DMA transfer word size (32 or 64 bits)
5c2c85315948c42c drivers/bus/mhi/pci_generic.c      Richard Laing 2021-07-15  42   * @mru_default: default MRU size for MBIM network packets
56f6f4c4eb2a710e drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt 2021-07-16  43   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
56f6f4c4eb2a710e drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt 2021-07-16  44   *		   of inband wake support (such as sdx24)
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  45   */
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  46  struct mhi_pci_dev_info {
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  47  	const struct mhi_controller_config *config;
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  48  	const char *name;
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  49  	const char *fw;
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  50  	const char *edl;
48f98496b1de132f drivers/bus/mhi/host/pci_generic.c Qiang Yu      2024-04-24  51  	bool edl_trigger;
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  52  	unsigned int bar_num;
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  53  	unsigned int dma_data_width;
5c2c85315948c42c drivers/bus/mhi/pci_generic.c      Richard Laing 2021-07-15  54  	unsigned int mru_default;
56f6f4c4eb2a710e drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt 2021-07-16  55  	bool sideband_wake;
2b153f167f41516b drivers/bus/mhi/host/pci_generic.c Slark Xiao    2024-06-12  56  	unsigned int mux_id;
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21 @57  };
855a70c12021bdc5 drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

