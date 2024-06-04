Return-Path: <linux-arm-msm+bounces-21564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 945088FAE78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E32D286F54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423EC1448D9;
	Tue,  4 Jun 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QONPOjyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A76C1442FB;
	Tue,  4 Jun 2024 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492309; cv=none; b=h9+7lzEIG4011uyl6/9+4n1IsvZqtHKEo3XjROOi2EVd11slcYRmOvEVUZegHy+nSNNIMQyai3NrVKps/F9Wl6HY3Po+Lc6GNVhyxr12WrX5XcSmn5fVZ9//J6P9daXWaIxvaDqci7KrOAzqeAtdofVeBiYnD9TWOmaoaWvhZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492309; c=relaxed/simple;
	bh=vhRGBF5u2soD1b1ZxX2Vte9C9U3uPwpV5XFLBTuyFyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNZNa9xpYab/5JAkB7NemvjM6TjBAYd8O0KvzKHkZLMrnmq1KBaisAD380Qf4UjWyo25OrlWlGOUwvzIt5Z3ySAbTWghPRebYxkbTpL8QQ2Ci78La2SoFzLDuXPiDDf2E8yaZCzx4tWKlxpIzsjOOdV1hg1Eg+ouwagEEdpfR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QONPOjyD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717492308; x=1749028308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhRGBF5u2soD1b1ZxX2Vte9C9U3uPwpV5XFLBTuyFyc=;
  b=QONPOjyDMFGv9wuVzJgThFOvenblOJZsakUVOUEszPONS7Ha9HyqYrL7
   a3dCkcQKz85yPOhyMoplEE5TvdOF2sUD+UcyuRDFJGjH6zJlSi1fHL/yU
   31SzjNlm9Ag7biH5waVtGmoXXd0PxIK8wlDKZrX8IL5AeJuDHtMTRL6DM
   oU2Swh3ib7FwF7l2MhCTJ61CATr3sYWgD1sAvzEflZBUAMLe9o3VLeo/m
   X/YU2zF2wM7mgQ2jw4uzIwbRsLom71K/7OOBM+9xeQKtRvggFYjLpIML7
   dBKmP8+pcBdXX02R9DNbv18soP9nzTYQ7E3k7Ro2oaDNfPLyS7ZQ+AHvE
   g==;
X-CSE-ConnectionGUID: AO+h+O7aSxufhIXnGYliYg==
X-CSE-MsgGUID: aFqblQlLQ+q/rqVjTEdbgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24689355"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="24689355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 02:11:46 -0700
X-CSE-ConnectionGUID: pisztONWSemSgBojbjX2tA==
X-CSE-MsgGUID: 8XMlt/GLQYy/LtwSjtP/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="68343439"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2024 02:11:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEQCg-000MzX-20;
	Tue, 04 Jun 2024 09:11:38 +0000
Date: Tue, 4 Jun 2024 17:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	quic_sibis@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com, abel.vesa@linaro.org
Subject: Re: [PATCH V5 2/5] mailbox: Add support for QTI CPUCP mailbox
 controller
Message-ID: <202406041620.FyEU8GRv-lkp@intel.com>
References: <20240603205859.2212225-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603205859.2212225-3-quic_sibis@quicinc.com>

Hi Sibi,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.10-rc2 next-20240604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sibi-Sankar/dt-bindings-mailbox-qcom-Add-CPUCP-mailbox-controller-bindings/20240604-050256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240603205859.2212225-3-quic_sibis%40quicinc.com
patch subject: [PATCH V5 2/5] mailbox: Add support for QTI CPUCP mailbox controller
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240604/202406041620.FyEU8GRv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041620.FyEU8GRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041620.FyEU8GRv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/qcom-cpucp-mbox.c: In function 'qcom_cpucp_mbox_irq_fn':
>> drivers/mailbox/qcom-cpucp-mbox.c:54:18: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      54 |         status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
         |                  ^~~~~
         |                  readb
>> drivers/mailbox/qcom-cpucp-mbox.c:65:17: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
      65 |                 writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
         |                 ^~~~~~
         |                 writeb
   cc1: some warnings being treated as errors


vim +54 drivers/mailbox/qcom-cpucp-mbox.c

    47	
    48	static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
    49	{
    50		struct qcom_cpucp_mbox *cpucp = data;
    51		u64 status;
    52		int i;
    53	
  > 54		status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
    55	
    56		for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
    57			u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
    58			struct mbox_chan *chan = &cpucp->chans[i];
    59			unsigned long flags;
    60	
    61			/* Provide mutual exclusion with changes to chan->cl */
    62			spin_lock_irqsave(&chan->lock, flags);
    63			if (chan->cl)
    64				mbox_chan_received_data(chan, &val);
  > 65			writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
    66			spin_unlock_irqrestore(&chan->lock, flags);
    67		}
    68	
    69		return IRQ_HANDLED;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

