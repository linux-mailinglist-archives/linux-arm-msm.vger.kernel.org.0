Return-Path: <linux-arm-msm+bounces-21561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D93438FAD4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 10:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1668A1C21DFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 08:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F116142634;
	Tue,  4 Jun 2024 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKIY4mzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86EB22075;
	Tue,  4 Jun 2024 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717489005; cv=none; b=sUxYJ61014arVHv0Agwq66LLltr7j1ETPKkRhizWOWX5BUBRAU1yD6EAbiWPtVJqOznrvBt5sI8xIIBITDMBv9p2e/ksZ9ze/AzmJ4n1JF36yPgHvMNDMYVIATQWiLEnQewlrh+rv0KKCSFHlUgHK4D15w/t1zW1IfIiBNNrsZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717489005; c=relaxed/simple;
	bh=koOHc2NS464wH6xsfwIHBVZlJYpQFcthV4zIR7D/mpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA+G0QGjZH2KwWkvPDzqsx99QjGhcMLNztVdaF5CtrN8I9KGkAgzt6CgYDe4USafQh11ebtTNrTuRBRHIhZ8P0HnSXbUVA7wEgGD5xfhMaAMdW9RW6fVenrgTdLj7aE6oMQQ0kf0mrsI/wMSpE/JcNz3slKHC4fVsexkq/vSK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKIY4mzt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717489003; x=1749025003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=koOHc2NS464wH6xsfwIHBVZlJYpQFcthV4zIR7D/mpM=;
  b=gKIY4mztgjeLi5TuB62kpj138zXxb5+ltLgKbAeujIgtABQ7QkyZ7O5X
   jqtGEB7r7PLaAL+fBfcgGEK+yWSfWReHdcPRAziR4Yd4Trfao60ID0LAf
   2BwLjPW78DA2qt0tlmcrMwTOTtaqd6nAP8pGATlWRoyRePXK9BqIBvOm/
   odJk5kcaamd85DJW6+MMECxgUWWVnpU6k0OjM+i4JAJLRK+SnOY5vGCSZ
   YidbKC/7OrWuhiAAcfAkJgsK4X5T2/r67jAb/8EpsFXP3CXB3sLHNKnBM
   QhWQ6X3p0wpHDOaS0qyIIRG2Jl3hyUb/r+8k5+2U6Mz/C9yWStRNNQqyI
   Q==;
X-CSE-ConnectionGUID: Wi8Wf9KvQTSVpas5J2j3jQ==
X-CSE-MsgGUID: FxXwsFSHTN6P0w8l9SxjWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13898527"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="13898527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:16:42 -0700
X-CSE-ConnectionGUID: MeNOPR+RSwS5qdqHUEncSw==
X-CSE-MsgGUID: Hvd/HeXqTdmdDAdMqYbCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37215229"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2024 01:16:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEPLO-000MwZ-3D;
	Tue, 04 Jun 2024 08:16:34 +0000
Date: Tue, 4 Jun 2024 16:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, quic_sibis@quicinc.com,
	conor+dt@kernel.org, quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com, abel.vesa@linaro.org
Subject: Re: [PATCH V5 2/5] mailbox: Add support for QTI CPUCP mailbox
 controller
Message-ID: <202406041546.kXkVH9Ww-lkp@intel.com>
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
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240604/202406041546.kXkVH9Ww-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041546.kXkVH9Ww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041546.kXkVH9Ww-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mailbox/qcom-cpucp-mbox.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mailbox/qcom-cpucp-mbox.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mailbox/qcom-cpucp-mbox.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mailbox/qcom-cpucp-mbox.c:54:11: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      54 |         status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
         |                  ^
>> drivers/mailbox/qcom-cpucp-mbox.c:65:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      65 |                 writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
         |                 ^
   drivers/mailbox/qcom-cpucp-mbox.c:78:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |         val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |               ^
   drivers/mailbox/qcom-cpucp-mbox.c:80:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |         ^
   drivers/mailbox/qcom-cpucp-mbox.c:91:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |         val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |               ^
   drivers/mailbox/qcom-cpucp-mbox.c:93:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      93 |         writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |         ^
   drivers/mailbox/qcom-cpucp-mbox.c:132:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |         ^
   6 warnings and 7 errors generated.


vim +/readq +54 drivers/mailbox/qcom-cpucp-mbox.c

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

