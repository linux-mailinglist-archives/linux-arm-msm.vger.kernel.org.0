Return-Path: <linux-arm-msm+bounces-50448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DBA54413
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108D23A5A1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 07:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFB11EDA13;
	Thu,  6 Mar 2025 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5MWJKJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA31DD889;
	Thu,  6 Mar 2025 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741247711; cv=none; b=rQo6F045Ex2QrqH3Ba0zkYNfXC6MwwVcc9ALYhPwPPAHfP/L2f6j8y+HWi6/QLrzRGkbKedwr1MuP08xVGYPMdXKpcfZ5hcsXdDqawIlb30eK3S1VpFo/hFj+4rQfk1LKRn7Qo5Tz2fFK7uGw0O7wKHe/YYM7QTD2P/EYSXNbbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741247711; c=relaxed/simple;
	bh=A0ylyEZSt4tfTskDEXOaB+s6R9eX48Oemn4l6IgDSD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P60UzuRRxsU5Z79YeZ80PcIDe+lB2u5bro2axk1wGzwAtn7AHD4UVudveuSMnsv+ybtKn04lDvx1K0JqiFLOWt0hKNJ0XljV/hD6J1LJ1foDj+zIr4704gFeVD1O/xRBtRfJDiDyfsgO/L6b4xNWQpAxLMMP7s0gMZHy8VeETEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5MWJKJp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741247710; x=1772783710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A0ylyEZSt4tfTskDEXOaB+s6R9eX48Oemn4l6IgDSD4=;
  b=j5MWJKJpOt4LTBGHNg0mqRV73KWK8dRJczy1BhdgUPJEeK8rGxMqC8Mz
   C+3HHD/Di2CrYN6mxRpOCW+MXBdMngbJX1LfOE2eeCgbhfxDR2MAM8aDY
   bLnOpEb/T81iJ7mhcL+MEMEfZotuxN4dw67BSCpl9UbkXmY105cu7vsk6
   PaWhYAZQmv8p3cL91tVgvBiq+BhPRfXgJmSbBiunNAzu6rvJDJkNwrz5A
   sr2L5KzUzWUfJpWaqLvXB3nxCkQcCbqwLcgYAYz5/auNt3MVbCQjzAHHa
   07SKsACEs4l71ZEFXDjoOLQsNGpoatsNhPwTaXC+brrtuQ/8U4kT/Gbqw
   Q==;
X-CSE-ConnectionGUID: TbR+kV/UTEuVQ2gDjIY8ZQ==
X-CSE-MsgGUID: 0l9j1kDyQO+QOUMVUCiH6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64691545"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="64691545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 23:55:08 -0800
X-CSE-ConnectionGUID: VDtXCk1RQbCJchYy/0U69w==
X-CSE-MsgGUID: zt4KIOt6Tri4+kavlfbkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156171827"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2025 23:55:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq63q-000Mj8-1I;
	Thu, 06 Mar 2025 07:54:38 +0000
Date: Thu, 6 Mar 2025 15:53:38 +0800
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
Message-ID: <202503061517.ZTyZF7qx-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503061517.ZTyZF7qx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061517.ZTyZF7qx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061517.ZTyZF7qx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/mailbox/qcom-tmel-qmp.c:6:
   drivers/mailbox/qcom-tmel-qmp.c: In function 'qmp_send_data':
>> drivers/mailbox/qcom-tmel-qmp.c:196:36: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
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
   include/linux/mailbox/tmelcom-qmp.h:16:41: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
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
   include/linux/mailbox/tmelcom-qmp.h:13:10: error: implicit declaration of function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
      13 |         (FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
         |          ^~~~~~~~~~~~~~~~
   include/linux/mailbox/tmelcom-qmp.h:55:45: note: in expansion of macro 'TMEL_MSG_UID_CREATE'
      55 | #define TMEL_MSG_UID_SECBOOT_SEC_AUTH       TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
         |                                             ^~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:541:42: note: in expansion of macro 'TMEL_MSG_UID_SECBOOT_SEC_AUTH'
     541 |         ret = tmel_process_request(tdev, TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_qmp_send_work':
   drivers/mailbox/qcom-tmel-qmp.c:595:9: error: case label does not reduce to an integer constant
     595 |         case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
         |         ^~~~
   drivers/mailbox/qcom-tmel-qmp.c:598:9: error: case label does not reduce to an integer constant
     598 |         case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
         |         ^~~~


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

