Return-Path: <linux-arm-msm+bounces-25444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE209295E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 01:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4A8BB2153C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 23:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7729A46B80;
	Sat,  6 Jul 2024 23:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtAFVVc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AACF45BF3;
	Sat,  6 Jul 2024 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720308508; cv=none; b=B0lOwXRKhvEx4hjdX/bTKWz93CtWjpiG0Ymjffi4LeOv967YOC9201ESSHeaHmaik51U8huuENiKew/3f15jvGSdJPSxkpPCzKKn1pOQrukZAUcA8Tlt9LFKhLoop43thIYi7+zAxgzWiI17EDUKi7asTa/S80Ov7B6lxMWSsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720308508; c=relaxed/simple;
	bh=KKo+oGs4TSAe84B4lLvyAQD2Yu0uFJMI3pTFZWerumM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAdwvZyULWK6FMXVdivkACWv0T6QcCKoNGxAo5PPdgayBpxJvjsXTZXJI48KEZ4iF9lpRMblI7KalzckTmQ9GKhKSIE8op25kuaeeHAamjydJVSQkWI10pdFBRDoOVh8RCcz0s6VcasnLvqfq17bugOH/s4SwtMfZfDxhFSnyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtAFVVc9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720308506; x=1751844506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KKo+oGs4TSAe84B4lLvyAQD2Yu0uFJMI3pTFZWerumM=;
  b=LtAFVVc9oQ9TYYB595lSx5624xyobtEGQXTkE72IZC1ZP+uPJAcc/8ho
   Fp+7Z90bLd+1dHuRLWFuRmp9Ew2fzermxPZEK9lhBYiSdfKyUoL+wDmpI
   IbTU7PY918a191+LQpHZrWsfz+pFII9qaFa1rCtMgxSgrqJnhdoyBWakz
   m/go3b4OcGK+LajBczZbPRcNjsRQXsfBoSvHts7qB3TPXAr14nWK0CRU3
   LLscBG5HjBHp2FQJ4qJwpBMveTP+ZwL7ppkIVKyT3M1LnWKxxRuve9t2y
   /YbngZrUj9rpjBFu6KWCq7fuzI941mX7jR9AYX0bMQtJf6Yvl/bPw4el2
   A==;
X-CSE-ConnectionGUID: pHiW6EWaSoyNDOeJCq4GXg==
X-CSE-MsgGUID: C2C2CCkCT42/3nnr5x9kRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21317109"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="21317109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 16:28:25 -0700
X-CSE-ConnectionGUID: 89uIwiqsRbS9b7F/jfaP2A==
X-CSE-MsgGUID: dp1IKG+zTt+nmFQzyBu1Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="46930242"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2024 16:28:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQEpF-000UOo-23;
	Sat, 06 Jul 2024 23:28:17 +0000
Date: Sun, 7 Jul 2024 07:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Message-ID: <202407070754.L1XER9qH-lkp@intel.com>
References: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0b58e108042b0ed28a71cd7edf5175999955b233]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/dt-bindings-bluetooth-qualcomm-describe-the-inputs-from-PMU-for-wcn7850/20240706-055822
base:   0b58e108042b0ed28a71cd7edf5175999955b233
patch link:    https://lore.kernel.org/r/20240705-hci_qca_refactor-v1-2-e2442121c13e%40linaro.org
patch subject: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for disabling the clock
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407070754.L1XER9qH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070754.L1XER9qH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070754.L1XER9qH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2229:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/bluetooth/hci_qca.c:23:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/bluetooth/hci_qca.c:2499:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    2499 |         }
         |         ^
   8 warnings generated.


vim +2499 drivers/bluetooth/hci_qca.c

05ba533c5c1155 Thierry Escande                2018-03-29  2478  
05ba533c5c1155 Thierry Escande                2018-03-29  2479  static void qca_serdev_remove(struct serdev_device *serdev)
05ba533c5c1155 Thierry Escande                2018-03-29  2480  {
05ba533c5c1155 Thierry Escande                2018-03-29  2481  	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
054ec5e94a46b0 Venkata Lakshmi Narayana Gubba 2020-09-10  2482  	struct qca_power *power = qcadev->bt_power;
05ba533c5c1155 Thierry Escande                2018-03-29  2483  
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2484  	switch (qcadev->btsoc_type) {
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2485  	case QCA_WCN3988:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2486  	case QCA_WCN3990:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2487  	case QCA_WCN3991:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2488  	case QCA_WCN3998:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2489  	case QCA_WCN6750:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2490  	case QCA_WCN6855:
e0c1278ac89b03 Neil Armstrong                 2023-08-16  2491  	case QCA_WCN7850:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2492  		if (power->vregs_on) {
c2d7827338618a Balakrishna Godavarthi         2018-08-22  2493  			qca_power_shutdown(&qcadev->serdev_hu);
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2494  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2495  		}
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2496  		fallthrough;
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2497  
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2498  	default:
691d54d0f7cb14 Neil Armstrong                 2023-08-16 @2499  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2500  
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2501  	hci_uart_unregister_device(&qcadev->serdev_hu);
05ba533c5c1155 Thierry Escande                2018-03-29  2502  }
05ba533c5c1155 Thierry Escande                2018-03-29  2503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

