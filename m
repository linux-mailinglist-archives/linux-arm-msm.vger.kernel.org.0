Return-Path: <linux-arm-msm+bounces-43766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9179FF3A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2025 10:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA8F3A2434
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2025 09:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB0D38385;
	Wed,  1 Jan 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfIdvZFs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE22EDE;
	Wed,  1 Jan 2025 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735724132; cv=none; b=DSTOYA5gYOQ4FzagGX2fddcJl3HAAdv4azHAzL17ldRVBRs37HYyW1GujUIYSx1/HOtxrrmGdOElfo84H/bIljV1NqNZJFb5/jDMhG102aDMUGOaQrFB4+q2Rg8xm7RqDNxo9yIuZCi0qukYbWwT0wXMUli8bPXt8J0OdeWRG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735724132; c=relaxed/simple;
	bh=72aRAhGShzHCSODJmk+qOiLHXiKulWpbOvEl+YcknxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsjLR6XKGfjISb/sA4bTxCe8WpbXXeoMfhJHIG2tPvpBLu5UxkphKE8F3TJnOC2pzjsur6GWRu+KfBY8r6c3SnkNhK57C3uzrMvV2/JdjXJwYoKe1/+Blgr4MZgDd8SpaDwkMDiYztH093CuNgmJ6dQrFFpDyey1eV8ZcwlDp4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfIdvZFs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735724131; x=1767260131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72aRAhGShzHCSODJmk+qOiLHXiKulWpbOvEl+YcknxY=;
  b=ZfIdvZFs3bZJsj1WPGtwFdTnBNjTvrDx6qz+qdjs6a++h7KjIiCDYR/8
   lIcCqTXQ1REX/B8ULWW/NCLl625n4wXfBKldc5aSgoMeLDlFPUAdcGMhJ
   0F3AzYYQNf4EOH88Taz7nhDb2hwSJovMBDJAX09K4ZS8W7fWhpsipJcqI
   atGdST20m9zhMprbmeX7irnUxyVuzVQxc2hI6CPKUCSh5/cC/BnG08wfe
   9q6UbbYKfWmhkrDycuJsvF2bQepugxzdARyJ80Caj37YAzUs5XykLR4mN
   FYKQD+MzRw8WrfMvzO8rYrLJK6yhmfe9EtacZO3H1KDxRdZYgrZhFiWsl
   A==;
X-CSE-ConnectionGUID: IPc6k93HRp6rbmg7hCaAow==
X-CSE-MsgGUID: yDiZPPxmSImNlDxU5OBVwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="53532345"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="53532345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 01:35:30 -0800
X-CSE-ConnectionGUID: rNEUVw5aSOWMXl4p8dOD3g==
X-CSE-MsgGUID: VyaDlc8cQtqG8m80GonyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101404881"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jan 2025 01:35:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSv8O-0007kd-22;
	Wed, 01 Jan 2025 09:35:24 +0000
Date: Wed, 1 Jan 2025 17:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
Message-ID: <202501011724.6gr0JxBf-lkp@intel.com>
References: <20241231054900.2144961-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231054900.2144961-3-quic_srichara@quicinc.com>

Hi Sricharan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/dt-bindings-mailbox-Document-qcom-tmel-qmp/20241231-135219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241231054900.2144961-3-quic_srichara%40quicinc.com
patch subject: [PATCH V2 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
config: i386-randconfig-005-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011724.6gr0JxBf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011724.6gr0JxBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011724.6gr0JxBf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/qcom-tmel-qmp.c:10:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mailbox/qcom-tmel-qmp.c:312:55: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     312 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                                                             ~~~     ^~~~~~~~~~~~
         |                                                             %zu
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:710:10: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     709 |                 pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
         |                                                         ~~~
         |                                                         %zu
     710 |                        tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:834:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     834 |         int ret;
         |             ^
   4 warnings generated.


vim +312 drivers/mailbox/qcom-tmel-qmp.c

   290	
   291	/**
   292	 * qmp_send_data() - Copy the data to the channel's mailbox and notify
   293	 *		     remote subsystem of new data. This function will
   294	 *		     return an error if the previous message sent has
   295	 *		     not been read. Cannot Sleep.
   296	 * @chan:	mailbox channel that data is to be sent over.
   297	 * @data:	Data to be sent to remote processor, should be in the format of
   298	 *		a kvec.
   299	 *
   300	 * Return: 0 on succes or standard Linux error code.
   301	 */
   302	static int qmp_send_data(struct qmp_device *mdev, void *data)
   303	{
   304		struct kvec *pkt = (struct kvec *)data;
   305		void __iomem *addr;
   306		unsigned long flags;
   307	
   308		if (!mdev || !data || !completion_done(&mdev->ch_complete))
   309			return -EINVAL;
   310	
   311		if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
 > 312			dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
   313			return -EINVAL;
   314		}
   315	
   316		spin_lock_irqsave(&mdev->tx_lock, flags);
   317		if (mdev->tx_sent) {
   318			spin_unlock_irqrestore(&mdev->tx_lock, flags);
   319			return -EAGAIN;
   320		}
   321	
   322		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   323			mdev->mcore.val, mdev->ucore.val);
   324	
   325		addr = mdev->mcore_desc + QMP_CTRL_DATA_SIZE;
   326		memcpy_toio(addr, pkt->iov_base, pkt->iov_len);
   327	
   328		mdev->mcore.bits.frag_size = pkt->iov_len;
   329		mdev->mcore.bits.rem_frag_count = 0;
   330	
   331		dev_dbg(mdev->dev, "Copied buffer to mbox, sz: %d",
   332			mdev->mcore.bits.frag_size);
   333	
   334		mdev->tx_sent = true;
   335		QMP_MCORE_CH_VAR_TOGGLE(mdev, tx);
   336		qmp_send_irq(mdev);
   337		qmp_schedule_tx_timeout(mdev);
   338		spin_unlock_irqrestore(&mdev->tx_lock, flags);
   339	
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

