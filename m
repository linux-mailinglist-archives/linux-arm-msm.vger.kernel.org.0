Return-Path: <linux-arm-msm+bounces-50545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80CA55374
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F34177DD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 17:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E0125B671;
	Thu,  6 Mar 2025 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABRF7DlS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B1525A638;
	Thu,  6 Mar 2025 17:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283454; cv=none; b=BfbW6LhOkkcqe4U3ljIHKb6pzWON1Bm4hQmfIiv0IB1EjLPAVXWGBv/Jgqls2QFPnURW9IplUGOVAnJV/Zs84R2khnGt/763mw3is+vJdIQKEJhkUFxEI/LLBVIp5eydakw51jCtsoSI16Az3ZpC4uclTHlBHWAn097soN1ZU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283454; c=relaxed/simple;
	bh=PbmD1kFv3+1BgQZMJaKX/JavH2z6eXzjqWH/xXgLcCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxCfdhSdsLkFaB87RnFdOzRc0/fKb9iCcqkFd4lpPoifvzCMannlXKNzuoOYka6L/wKQpFeXzuKaDrx3kaow9oEPAN6dHCIyFcn9k13/tsxNOMICF8tYUsUrsCRH2MYUJVYlY0sDQB42Ak5Dnri0MeFWtr2ZlkKNRD05h/Qd5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABRF7DlS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741283453; x=1772819453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PbmD1kFv3+1BgQZMJaKX/JavH2z6eXzjqWH/xXgLcCM=;
  b=ABRF7DlSI8M+V8GByPAyfMnDe3e4XLPfEyeOE99U36NPijqzRUiP/pFw
   cWA0uKPAR1yk/nK0IiE9hHKkwSTOCm2/8tHDTTWvvy4RPTXPp5sO/LObU
   rbsFbEqc8NepvqeOH4FPFkHz7V5ha3Yj+DDOtVRacCJsYWEP1iBeooKrd
   nCL58wrAePnrfZQ9Daf0OHDdeM6YiMcVZr7mCz9dBhzQVAc5/ZKMAAmPq
   2gWP/BY/fikcNg1vYfM6NOC+Ml4kcRhVZMeuT3j/CEyevmfOTvx30vYTF
   ACJPeE6vb8cIUtfgech1v89YQegPMCZih9aqj1zfoa5jIMA0Aic8JkbFN
   g==;
X-CSE-ConnectionGUID: 9c6FRcqJTE6b0Gl+YO6RQg==
X-CSE-MsgGUID: +45iLMv+RrSwFou27kiu9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42445680"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42445680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 09:50:52 -0800
X-CSE-ConnectionGUID: egZ7sObHSZG31vCHuMPaag==
X-CSE-MsgGUID: j2ujJPyGTFK5c7CMR2MRtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119278140"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 09:50:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqFMs-000NOs-2E;
	Thu, 06 Mar 2025 17:50:46 +0000
Date: Fri, 7 Mar 2025 01:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
Message-ID: <202503070135.WJVIL67R-lkp@intel.com>
References: <20250228045356.3527662-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228045356.3527662-3-quic_srichara@quicinc.com>

Hi Sricharan,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/dt-bindings-mailbox-Document-qcom-tmel-qmp/20250228-125707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228045356.3527662-3-quic_srichara%40quicinc.com
patch subject: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503070135.WJVIL67R-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070135.WJVIL67R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070135.WJVIL67R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/mailbox/qcom-tmel-qmp.c:6:
   drivers/mailbox/qcom-tmel-qmp.c: In function 'qmp_send_data':
   drivers/mailbox/qcom-tmel-qmp.c:196:36: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     196 |                 dev_err(mdev->dev, "Unsupported packet size %ld\n", pkt->iov_len);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:196:17: note: in expansion of macro 'dev_err'
     196 |                 dev_err(mdev->dev, "Unsupported packet size %ld\n", pkt->iov_len);
         |                 ^~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:196:63: note: format string is defined here
     196 |                 dev_err(mdev->dev, "Unsupported packet size %ld\n", pkt->iov_len);
         |                                                             ~~^
         |                                                               |
         |                                                               long int
         |                                                             %d
   In file included from drivers/mailbox/qcom-tmel-qmp.c:10:
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_prepare_msg':
>> include/linux/mailbox/tmelcom-qmp.h:16:41: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      16 | #define TMEL_MSG_UID_MSG_TYPE(v)        FIELD_GET(GENMASK(15, 8), v)
         |                                         ^~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:406:29: note: in expansion of macro 'TMEL_MSG_UID_MSG_TYPE'
     406 |         msg_hdr->msg_type = TMEL_MSG_UID_MSG_TYPE(msg_uid);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_process_request':
   drivers/mailbox/qcom-tmel-qmp.c:501:36: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     501 |                 dev_err(tdev->dev, "Invalid pkt.size received size: %ld, expected: %zu\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:501:17: note: in expansion of macro 'dev_err'
     501 |                 dev_err(tdev->dev, "Invalid pkt.size received size: %ld, expected: %zu\n",
         |                 ^~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:501:71: note: format string is defined here
     501 |                 dev_err(tdev->dev, "Invalid pkt.size received size: %ld, expected: %zu\n",
         |                                                                     ~~^
         |                                                                       |
         |                                                                       long int
         |                                                                     %d
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_secboot_sec_auth':
>> include/linux/mailbox/tmelcom-qmp.h:13:10: error: implicit declaration of function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |          ^~~~~~~~~~~~~~~~
   include/linux/mailbox/tmelcom-qmp.h:55:45: note: in expansion of macro 'TMEL_MSG_UID_CREATE'
      55 | #define TMEL_MSG_UID_SECBOOT_SEC_AUTH       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                             ^~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:541:42: note: in expansion of macro 'TMEL_MSG_UID_SECBOOT_SEC_AUTH'
     541 |         ret = tmel_process_request(tdev, TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_qmp_send_work':
>> drivers/mailbox/qcom-tmel-qmp.c:595:9: error: case label does not reduce to an integer constant
     595 |         case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
         |         ^~~~
   drivers/mailbox/qcom-tmel-qmp.c:598:9: error: case label does not reduce to an integer constant
     598 |         case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
         |         ^~~~


vim +/FIELD_GET +16 include/linux/mailbox/tmelcom-qmp.h

     7	
     8	/*
     9	 * Macro used to define unique TMEL Message Identifier based on
    10	 * message type and action identifier.
    11	 */
    12	#define TMEL_MSG_UID_CREATE(msg_type, action_id)	\
  > 13		(FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
    14	
    15	/** Helper macro to extract the messageType from TMEL_MSG_UID. */
  > 16	#define TMEL_MSG_UID_MSG_TYPE(v)	FIELD_GET(GENMASK(15, 8), v)
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

