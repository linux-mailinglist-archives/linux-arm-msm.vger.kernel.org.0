Return-Path: <linux-arm-msm+bounces-50425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7330BA53F13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 01:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5DB3A4F72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 00:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B18D299;
	Thu,  6 Mar 2025 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLEdmGpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494DCF9F8;
	Thu,  6 Mar 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741220846; cv=none; b=iAo+9YK5oQWXrb+RXecGgvsEb6UMHqhIsOvvvRL6a20c8tNI+KC/d9PoY56oS79sKdgrnWRvl9IYqv0rbSbUiWrP5X2P2Y8uT/hzrHE+141n9uzJLr3sKes5KS24Pjm5tUGY+3H4N/f4yhoH+HlbK+4o1rhi47wMSUCdl3tvdK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741220846; c=relaxed/simple;
	bh=QFerc3MN+Vcg4N4CJd1sGKbxHJtzh0GIWoPMvNoGuiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EToWyKJmEYKWq0kq3PUyxYjEAi/0oA0L+QCHivSvqLWVm64YLx/Evq7RRipFFNBV/nAXYwEaR6obNu19ShwJzFEUk50nIBhXNjmqH6p3iRSJFsVQ++w9c3Uzl394fw4+J9Mu7DOUF+kBpa40NUFT0F02bhje2aXWb5+svSyV0tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLEdmGpK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741220844; x=1772756844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QFerc3MN+Vcg4N4CJd1sGKbxHJtzh0GIWoPMvNoGuiU=;
  b=gLEdmGpKVoWV4Ov3e6/juI0hmvwnvQHW5vS+q+2/PNCCJOg9263SuOzW
   OSrYJnhOBnqH28YrGaCUifvCdav+Zn1VRjMA6NyblpjHnk/AkeGJHD3tH
   DfYykncGGsvbdNJamTBhGptNG5RV6e4QPTGghYmSm9ybltO7+ShtruKoC
   p6ERrCtXLC6zY7uTVe/GuS7XeWVeeLhOhIOCc9rK8bNR4maaTstsq+9tO
   f2CG9xNRKHxGlTsHbSIqUcJkjE5UK0gJVPxdMCV0qnvnaUKi3xwkWHA57
   vUY0CvMgnMYm3dLrzunxEPVdxF167/DIJlH0kbI6ZdRLsW06oV1/LSZ9M
   w==;
X-CSE-ConnectionGUID: /qcFzmZAQUOrQlzkiCop3g==
X-CSE-MsgGUID: tB83c6HJT7Wny/z1vONKlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52850315"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="52850315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 16:27:23 -0800
X-CSE-ConnectionGUID: 0ryAj4sxQ/igPnw3Nkbr7Q==
X-CSE-MsgGUID: tHucV7FcQ9iTV6bfg7HsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="142078639"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2025 16:27:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpz54-000MLq-0N;
	Thu, 06 Mar 2025 00:27:18 +0000
Date: Thu, 6 Mar 2025 08:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
Message-ID: <202503060748.jOvlkjJf-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/dt-bindings-mailbox-Document-qcom-tmel-qmp/20250228-125707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228045356.3527662-3-quic_srichara%40quicinc.com
patch subject: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503060748.jOvlkjJf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060748.jOvlkjJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060748.jOvlkjJf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/qcom-tmel-qmp.c:196:55: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     196 |                 dev_err(mdev->dev, "Unsupported packet size %ld\n", pkt->iov_len);
         |                                                             ~~~     ^~~~~~~~~~~~
         |                                                             %zu
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:406:22: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |         msg_hdr->msg_type = TMEL_MSG_UID_MSG_TYPE(msg_uid);
         |                             ^
   include/linux/mailbox/tmelcom-qmp.h:16:34: note: expanded from macro 'TMEL_MSG_UID_MSG_TYPE'
      16 | #define TMEL_MSG_UID_MSG_TYPE(v)        FIELD_GET(GENMASK(15, 8), v)
         |                                         ^
   drivers/mailbox/qcom-tmel-qmp.c:502:4: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     501 |                 dev_err(tdev->dev, "Invalid pkt.size received size: %ld, expected: %zu\n",
         |                                                                     ~~~
         |                                                                     %zu
     502 |                         tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:541:35: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     541 |         ret = tmel_process_request(tdev, TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
         |                                          ^
   include/linux/mailbox/tmelcom-qmp.h:55:43: note: expanded from macro 'TMEL_MSG_UID_SECBOOT_SEC_AUTH'
      55 | #define TMEL_MSG_UID_SECBOOT_SEC_AUTH       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                             ^
   include/linux/mailbox/tmelcom-qmp.h:13:3: note: expanded from macro 'TMEL_MSG_UID_CREATE'
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |          ^
   drivers/mailbox/qcom-tmel-qmp.c:572:35: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     572 |         ret = tmel_process_request(tdev, TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN,
         |                                          ^
   include/linux/mailbox/tmelcom-qmp.h:58:43: note: expanded from macro 'TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN'
      58 | #define TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                                 ^
   include/linux/mailbox/tmelcom-qmp.h:13:3: note: expanded from macro 'TMEL_MSG_UID_CREATE'
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |          ^
   drivers/mailbox/qcom-tmel-qmp.c:595:7: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     595 |         case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
         |              ^
   include/linux/mailbox/tmelcom-qmp.h:55:43: note: expanded from macro 'TMEL_MSG_UID_SECBOOT_SEC_AUTH'
      55 | #define TMEL_MSG_UID_SECBOOT_SEC_AUTH       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                             ^
   include/linux/mailbox/tmelcom-qmp.h:13:3: note: expanded from macro 'TMEL_MSG_UID_CREATE'
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |          ^
   drivers/mailbox/qcom-tmel-qmp.c:595:7: error: expression is not an integer constant expression
     595 |         case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mailbox/tmelcom-qmp.h:55:43: note: expanded from macro 'TMEL_MSG_UID_SECBOOT_SEC_AUTH'
      55 | #define TMEL_MSG_UID_SECBOOT_SEC_AUTH       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      56 |                                             TMEL_ACTION_SECBOOT_SEC_AUTH)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mailbox/tmelcom-qmp.h:13:3: note: expanded from macro 'TMEL_MSG_UID_CREATE'
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:598:7: error: expression is not an integer constant expression
     598 |         case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mailbox/tmelcom-qmp.h:58:43: note: expanded from macro 'TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN'
      58 | #define TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |                                                 TMEL_ACTION_SECBOOT_SS_TEAR_DOWN)
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mailbox/tmelcom-qmp.h:13:3: note: expanded from macro 'TMEL_MSG_UID_CREATE'
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 6 errors generated.


vim +196 drivers/mailbox/qcom-tmel-qmp.c

   177	
   178	/**
   179	 * qmp_send_data() - Copy the data to the channel's mailbox and notify
   180	 *		     remote subsystem of new data. This function will
   181	 *		     return an error if the previous message sent has
   182	 *		     not been read. Cannot Sleep.
   183	 * @mdev: qmp_device to send the data to.
   184	 * @data: Data to be sent to remote processor, should be in the format of
   185	 *	  a kvec.
   186	 *
   187	 * Return: 0 on success or standard Linux error code.
   188	 */
   189	static int qmp_send_data(struct qmp_device *mdev, void *data)
   190	{
   191		struct kvec *pkt = (struct kvec *)data;
   192		void __iomem *addr;
   193		unsigned long flags;
   194	
   195		if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
 > 196			dev_err(mdev->dev, "Unsupported packet size %ld\n", pkt->iov_len);
   197			return -EINVAL;
   198		}
   199	
   200		if (atomic_read(&mdev->tx_sent))
   201			return -EAGAIN;
   202	
   203		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   204			mdev->mcore.val, mdev->ucore.val);
   205	
   206		addr = mdev->mcore_desc + QMP_CTRL_DATA_SIZE;
   207		memcpy_toio(addr, pkt->iov_base, pkt->iov_len);
   208	
   209		mdev->mcore.bits.frag_size = pkt->iov_len;
   210		mdev->mcore.bits.rem_frag_count = 0;
   211	
   212		dev_dbg(mdev->dev, "Copied buffer to mbox, sz: %d",
   213			mdev->mcore.bits.frag_size);
   214	
   215		atomic_set(&mdev->tx_sent, 1);
   216	
   217		spin_lock_irqsave(&mdev->tx_lock, flags);
   218		mdev->mcore.bits.tx = !(mdev->mcore.bits.tx);
   219		qmp_send_irq(mdev);
   220		spin_unlock_irqrestore(&mdev->tx_lock, flags);
   221	
   222		return 0;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

