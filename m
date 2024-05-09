Return-Path: <linux-arm-msm+bounces-19574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC88C0DE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 11:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC675282A99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 09:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D6014AD1B;
	Thu,  9 May 2024 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HConBOP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449214AD1A;
	Thu,  9 May 2024 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715248755; cv=none; b=DYsvwfEuyKDGdrgkQX021zohTjzEPNCoXNCmgoxzd/mwDwvhblYZJUVIOxXzGhFkCMtvPFJ6EK6o4cMb16gZpEGWzn2sEPxi18itn48x/RT+vsUTPDz0wwZD3PwDCMNzxSbfj81MmQKYQuTOdPxL2JrOwHN3EIhODAVHlCsXoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715248755; c=relaxed/simple;
	bh=BB2DcXhMKYh62r1Ocs7rjwSUnV/aJvw4WfGPrdq9u58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NB338JrDacGoKveXBL8Tm0zynStnqLC40Oz73SVMdhnEe9EymkniVRThCfYltbl82wb/UAj+rWV1TClNiUNFv1uX1W5SZyXicON/aARUeyfRRSFGAmSaPM4Q4hcQolCRe+Kp+Nc6gy83fs1GHFGzeExxPy2MbW2DRQyxjhPqroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HConBOP9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715248753; x=1746784753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BB2DcXhMKYh62r1Ocs7rjwSUnV/aJvw4WfGPrdq9u58=;
  b=HConBOP9B8OaNU/E7H9Y9LvmCYJckvMB2Axshd4k2R/J+6EV3Zt5WesD
   Ej8V/QrDT7EBkDLXJifpA2u27Ouk9OmOcbkjbP/H+MBAPucbZIh7eD5Av
   JO555qN4Ovgh2mqoTpLbiEETbGokCreveFx3mLNGoVhV0VcOaZQh+I3+L
   c/WNlqrq/aZcR3+01/+lW6LrVD9ev4yIX/+hZoUVV/cFysaxDH909qqCe
   jGC9nH4Xf+lDK2+42lXh/Uff8UTqCsR4A2WuB6vF/8j0Gpx29H5RvNfm8
   PqlSP6ErUrQ7NhpnUkQvFaQdspFtwqs2AyiuELhkcihSJ4kxOsjLohLZc
   A==;
X-CSE-ConnectionGUID: rOuFClrUTN6RBvXAKZVQ1Q==
X-CSE-MsgGUID: 0GW9m8q+QY6westoi+ZLSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21831038"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="21831038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 02:59:11 -0700
X-CSE-ConnectionGUID: 33+lCoDlRF28UMLgk5vpNg==
X-CSE-MsgGUID: BSOR0QIaQXmZuur+vbCRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="66629975"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2024 02:59:10 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s50YM-0004jg-2i;
	Thu, 09 May 2024 09:59:06 +0000
Date: Thu, 9 May 2024 17:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add static PD restart support
Message-ID: <202405091717.OoQCyKE1-lkp@intel.com>
References: <20240508054250.2922-6-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508054250.2922-6-quic_ekangupt@quicinc.com>

Hi Ekansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.9-rc7 next-20240509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Redesign-remote-heap-management/20240508-134613
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20240508054250.2922-6-quic_ekangupt%40quicinc.com
patch subject: [PATCH v1 5/5] misc: fastrpc: Add static PD restart support
config: i386-kismet-CONFIG_QCOM_PDR_HELPERS-CONFIG_QCOM_FASTRPC-0-0 (https://download.01.org/0day-ci/archive/20240509/202405091717.OoQCyKE1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240509/202405091717.OoQCyKE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091717.OoQCyKE1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_PDR_HELPERS when selected by QCOM_FASTRPC
   WARNING: unmet direct dependencies detected for QCOM_PDR_HELPERS
     Depends on [n]: NET [=n]
     Selected by [y]:
     - QCOM_FASTRPC [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && RPMSG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

