Return-Path: <linux-arm-msm+bounces-22113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B240900FB6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 08:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56DDF1F223E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 06:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72091FDD;
	Sat,  8 Jun 2024 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHXY3ENL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987F13C83E;
	Sat,  8 Jun 2024 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717828227; cv=none; b=Kmw4TSOqEciKmXLyCnyh2MEaGRQvJoHpmPXZ8rt48qVPW5gil0AdyKmMCLT67V3q2XspqqY+PQcFTPbkf3oJh3cdeqt+hK+bzKF9EakZHgjSY5HsAEeep3t7QNpfOl0NuxRR2rix/j+07giRbgbWDsc4hnLS+KJLG0aramKfs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717828227; c=relaxed/simple;
	bh=OVVmvhztRK1B65JgvaZedaE3P8Kz8iPkk9tDYvE0ud4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6mA5NSUS83FPcOibIKUlD+xOcuaIpXVD27Jrpa8iY8pzPaXYQPGtzyxtTuBSgRgpnsfl6HB69rVqTspFhLl4cZ1z16nUYnkb3CkVpW7numaB5W6HFUvx0XbFgyCpnwgPsF/lD8pABKemVT7vjYUcEOBoK9w7FUfrImLwtqo45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHXY3ENL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717828225; x=1749364225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OVVmvhztRK1B65JgvaZedaE3P8Kz8iPkk9tDYvE0ud4=;
  b=bHXY3ENLYQjdtnDja+6Jadh+bNdlhNRkvuYC0IrJh0Fx9R0C9iC/NKl6
   TtiTTqdMBoEc5YKeUliL2defU5ClIb06pDyUzD5dTBH9mNVI+6r08fNf5
   7pp0LD+Vp3BP//Ay4yPfdpp/US+onukZ3YSDKRPcBxrKME2KGJIIwIcLE
   EFYbj/W9D2R+3yhevVE3Ny2b+gdQBSz9ZfZ8LfgUPpAVXY0Ij7AZAn0zP
   maK8b5QTrCFuGuId30Ccm7jUVeUtap/CJoe4WHbTPMwrtROOJEHQpwpzq
   sv0B+9SKnpGgXUyP1s3lSzHEMGd4cxPPfmB82wfZzJzWyRenqV7egdz3O
   w==;
X-CSE-ConnectionGUID: 5s5cPUgdRtStFEsE9NBZWw==
X-CSE-MsgGUID: fv1nuds6TqW/01qJbOCckw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14693634"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14693634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 23:30:23 -0700
X-CSE-ConnectionGUID: zMr/zwMASayxaDCEoS0SSg==
X-CSE-MsgGUID: bOKnJvd2TR2Kwm6+47teDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38387654"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2024 23:30:20 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFpaj-0001As-2X;
	Sat, 08 Jun 2024 06:30:17 +0000
Date: Sat, 8 Jun 2024 14:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Slark Xiao <slark_xiao@163.com>, manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org, quic_qianyu@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: Re: [PATCH v1 1/2] bus: mhi: host: Import link_id item
Message-ID: <202406081406.LxqJw00r-lkp@intel.com>
References: <20240607100114.452979-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607100114.452979-1-slark_xiao@163.com>

Hi Slark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Slark-Xiao/net-wwan-Fix-SDX72-ping-failure-issue/20240607-180828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/20240607100114.452979-1-slark_xiao%40163.com
patch subject: [PATCH v1 1/2] bus: mhi: host: Import link_id item
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240608/202406081406.LxqJw00r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081406.LxqJw00r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081406.LxqJw00r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pci_generic.c:57: warning: Function parameter or struct member 'link_default' not described in 'mhi_pci_dev_info'


vim +57 drivers/bus/mhi/host/pci_generic.c

48f98496b1de13 drivers/bus/mhi/host/pci_generic.c Qiang Yu      2024-04-24  32  
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  33  /**
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  34   * struct mhi_pci_dev_info - MHI PCI device specific information
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  35   * @config: MHI controller configuration
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  36   * @name: name of the PCI module
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  37   * @fw: firmware path (if any)
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  38   * @edl: emergency download mode firmware path (if any)
48f98496b1de13 drivers/bus/mhi/host/pci_generic.c Qiang Yu      2024-04-24  39   * @edl_trigger: capable of triggering EDL mode in the device (if supported)
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  40   * @bar_num: PCI base address register to use for MHI MMIO register space
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  41   * @dma_data_width: DMA transfer word size (32 or 64 bits)
5c2c85315948c4 drivers/bus/mhi/pci_generic.c      Richard Laing 2021-07-15  42   * @mru_default: default MRU size for MBIM network packets
56f6f4c4eb2a71 drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt 2021-07-16  43   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
56f6f4c4eb2a71 drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt 2021-07-16  44   *		   of inband wake support (such as sdx24)
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  45   */
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  46  struct mhi_pci_dev_info {
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  47  	const struct mhi_controller_config *config;
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  48  	const char *name;
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  49  	const char *fw;
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  50  	const char *edl;
48f98496b1de13 drivers/bus/mhi/host/pci_generic.c Qiang Yu      2024-04-24  51  	bool edl_trigger;
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  52  	unsigned int bar_num;
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  53  	unsigned int dma_data_width;
5c2c85315948c4 drivers/bus/mhi/pci_generic.c      Richard Laing 2021-07-15  54  	unsigned int mru_default;
56f6f4c4eb2a71 drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt 2021-07-16  55  	bool sideband_wake;
f749b1f6758869 drivers/bus/mhi/host/pci_generic.c Slark Xiao    2024-06-07  56  	unsigned int link_default;
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21 @57  };
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain  2020-10-21  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

