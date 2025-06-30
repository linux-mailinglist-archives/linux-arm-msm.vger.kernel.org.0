Return-Path: <linux-arm-msm+bounces-63114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04103AEE68D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C96B23B9926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691B92E3371;
	Mon, 30 Jun 2025 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXsKwFih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FEF244676;
	Mon, 30 Jun 2025 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751307139; cv=none; b=aP19ALzXWp8Iisr0HBN+x3zCej5sNDKUCDP9B4UdREpyXEOPYhZRnfqWUmysN51oXJs+QTlS0bgrJ9RrnQ3copxNRMn1ac5/+Yxe9K8NDdO1c79ZIidYOOdGWVFx9XtWIvOW5TVwSZhDTIwwYNlD8IeZ3Oer4aNC9vxc4Djz5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751307139; c=relaxed/simple;
	bh=I+kVS3NjR7w6E4QkvIa2eJytYERbIRQvZk5z3WhX438=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXsl0FVfycPIVH6cvSs5+gRo2hbKijrdC1YxtXxcXkvwYfdXPWk/VBbx5IeWdASiw/SR5SOnJ592jWqjlbAbtAc/JqWs2qaV0CfL78fQp0wh8qMhU8oZMXRP+LDTuGuPADBAtIAFyqy6lBptmq/snDfChgEftpxj/FqDUYjTSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXsKwFih; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751307137; x=1782843137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+kVS3NjR7w6E4QkvIa2eJytYERbIRQvZk5z3WhX438=;
  b=PXsKwFihe7MCEQfrWix+I5nxV4DPKxlBf6zlV2kk6MR3Rco2WB8l6u9c
   OKv/X6q5DsvPFnmzwVQ+INsKzz4fVgve2YRz0KaaunUmPX/32DkephdZt
   q51jCWZeGhqrZWIzDi4LGyrgEKUXx0H8rI10Ytc+wAjgqequSi+qDN0dn
   KBNceO2Y2TcSrJqnzzADla8cGShZoHpKFH8v641cWfbNxSUxAzAqbmFH3
   N5Kbcga6q25hNKdNQXP+56JQ6u/dal4acVBRZDsAC6la5TJ5XF46yNcK3
   mjjn4nWD7F1qgySsIOKHYYd1sIlt2yjgw7zTqxe3htLgl0j7lsv/goC2e
   g==;
X-CSE-ConnectionGUID: Ms3cCLHSS5O2hkhhfYB5eQ==
X-CSE-MsgGUID: XwnhJEWITguil5mRgo3lag==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="78982269"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="78982269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 11:12:16 -0700
X-CSE-ConnectionGUID: AF3thvOhQIG68tifoh0cIw==
X-CSE-MsgGUID: DnISahm6RA62K58gYs0Uhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153622082"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jun 2025 11:12:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWIzE-000ZFy-0T;
	Mon, 30 Jun 2025 18:12:12 +0000
Date: Tue, 1 Jul 2025 02:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <202507010127.xjmnq7A8-lkp@intel.com>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>

Hi Komal,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Komal-Bajaj/usb-misc-qcom_eud-Access-EUD_MODE_MANAGER2-through-secure-calls/20250627-205244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250627125131.27606-1-komal.bajaj%40oss.qualcomm.com
patch subject: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
config: um-randconfig-r131-20250629 (https://download.01.org/0day-ci/archive/20250701/202507010127.xjmnq7A8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010127.xjmnq7A8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010127.xjmnq7A8-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/usb/misc/qcom_eud.o: in function `eud_remove':
>> qcom_eud.c:(.text+0x6da): undefined reference to `qcom_scm_io_writel'
   /usr/bin/ld: drivers/usb/misc/qcom_eud.o: in function `enable_store':
   qcom_eud.c:(.text+0x7c7): undefined reference to `qcom_scm_io_writel'
>> /usr/bin/ld: qcom_eud.c:(.text+0x848): undefined reference to `qcom_scm_io_writel'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

