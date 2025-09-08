Return-Path: <linux-arm-msm+bounces-72629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C7B49845
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8853ABB68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846AD31B81F;
	Mon,  8 Sep 2025 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7dR2oSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5873A8F7;
	Mon,  8 Sep 2025 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757355996; cv=none; b=A0OwjV1YWLQvNF5a2qvbjDJ5JkhEriWRGLweq4/mWy2z41hJOo+2vI/FsjDPUDlRgm/FQOJgLx8ZBW22WoxhF8ov6qZp3PfYRXOmoNjzUFSTBE9gttLyY+INipCSuPo4LEbno+AZT+xxYkbBRTokg452JDiSWFh2YvlU8PLZLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757355996; c=relaxed/simple;
	bh=1FS5scoih1u+HaSjmztbMQ4nC1lS+/D7jKLkfmmmHTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftEJDjsJgrsuQKGX/w5vv55f4DMeOsQdZxfytTs5X842jSV+ztsWZGMwfxvtfk2qnpdmq5Rm5KoClGjsWuM91Ih3zsF7lP7Gh0SjeRIrFWUNVAPafgFdD19wB0ta4aHsulvbmlJZ3zxoj/4oSyrQ7Z+w3Csfxp5/5HMMSaGAF28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7dR2oSh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757355995; x=1788891995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FS5scoih1u+HaSjmztbMQ4nC1lS+/D7jKLkfmmmHTk=;
  b=E7dR2oShvIRbMdX48aNu4vYiNVTxnf4Zhdkx7Oe63PacVbBRsEN7iM0f
   MmqdfpJwHTOzfwnsUgjGJbt/HABnDL/4YaytliVLqv01PF0B1WOHalJ8F
   KX/67kC2nVJTRYpdyxS7CM2FHl/0/ccj99Lg8mhWN2qwzjjzIjIAxlr9U
   9RVGPeAkK25VSNsirTWJjWFDd4p3hs8KDnjra5zFCqMcsPaPAWRCGMlGz
   vvAKRCU4gLj1R8T1yR7x/YjStphwJ7pdv3zuiRKBPnaOLT+CedAQdh1zh
   nRS9yJu11HyQrzZadJxE1cUFLhFVdGkIy5jBgO9SAK4wiTIke+PtIZLkO
   g==;
X-CSE-ConnectionGUID: ybG6PPmCR4+Sd6Gf9q0s/w==
X-CSE-MsgGUID: DG5ukmaPTumnXUF+ehjW1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59550948"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59550948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 11:26:34 -0700
X-CSE-ConnectionGUID: MllgzNCGQFq6WgvL3jDGrQ==
X-CSE-MsgGUID: HekVWCbyQaKYkp2vSYwe/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="177201647"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2025 11:26:31 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvgZR-00044h-2P;
	Mon, 08 Sep 2025 18:26:29 +0000
Date: Tue, 9 Sep 2025 02:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Message-ID: <202509090115.dVhd78BE-lkp@intel.com>
References: <20250907181412.2174616-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907181412.2174616-3-krishna.kurapati@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next next-20250908]
[cannot apply to usb/usb-linus linus/master v6.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/usb-dwc3-core-Introduce-glue-callbacks-for-flattened-implementations/20250908-021710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250907181412.2174616-3-krishna.kurapati%40oss.qualcomm.com
patch subject: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
config: hexagon-randconfig-r132-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090115.dVhd78BE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce: (https://download.01.org/0day-ci/archive/20250909/202509090115.dVhd78BE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090115.dVhd78BE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/dwc3/dwc3-qcom.c:605:22: sparse: sparse: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?

vim +/dwc3_qcom_glue_ops +605 drivers/usb/dwc3/dwc3-qcom.c

   604	
 > 605	struct dwc3_glue_ops dwc3_qcom_glue_ops = {
   606		.pre_set_role	= dwc3_qcom_set_role_notifier,
   607		.pre_run_stop	= dwc3_qcom_run_stop_notifier,
   608	};
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

