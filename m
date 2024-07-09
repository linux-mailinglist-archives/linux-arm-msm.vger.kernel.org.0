Return-Path: <linux-arm-msm+bounces-25600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D592B568
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164601F23A19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2D4156886;
	Tue,  9 Jul 2024 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3An3I3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBAF2E62D;
	Tue,  9 Jul 2024 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720521270; cv=none; b=NZ7iIKWVP1cGi2HP7devdbfeo46xb/2LYGzxQUR2KGI8vU1VTiDWLKwBBQm5AmpIS7dF0ut+DvzE2kRAp1tAuXOtYbyWk1euHlRmjP/dTI3Jr+rG0u9XIhJonqWyBwxzoI2XX7lkS8Kixj7AockeP1+Uim1SefWP4b/qn3iu1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720521270; c=relaxed/simple;
	bh=yN2LLjJT3sCW/Z7UY8+eDCPVXP7mmixlUlULkXk9xKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJXrGYWcgjMDl4mJN12w1C5mZJqlRmk172njtKEiLcd4NcLPr5BWU4DgSBqvlhkPwHMxNB+eY5wIxbhJ+poAsHeG3MNJ3iCL9SyxS00zSF9geDZulCM+Z+RP712EEztfKv3XN7zblEDLrylkQ8H19IWz2k+HToDt6sX3s8tey00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3An3I3O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720521269; x=1752057269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yN2LLjJT3sCW/Z7UY8+eDCPVXP7mmixlUlULkXk9xKo=;
  b=C3An3I3Oeu6SKZo/Wx3/1LHu85IAHXXtSZ7cSETIgQUS9I2i08N4w7RP
   /o+B3aOkg1g8BsTzFRhEvBkwT8XfDJYapW91A+WBAwnPGh3rBu3W7mUyO
   pjmRFe0XFACLJNyYS6X1ii6EyoUcpu/cU3ZK8vlT1A9Z+99ymBSMnYXu0
   rEzbUez/gprGOmPomIi09d7yc4UJDunic7n71jGdjP0UP9N2+IvADb7VG
   wkd9c96ri9qGg1otTNZymsiFXCmYkRcy9ZNLa/jJZtPIZa2aE5x2Z3vgD
   PbWNffe+4EaQha63T58ayGhSV5R9/b3f96J1kRMHOXfUidYJOtoMBmSoN
   g==;
X-CSE-ConnectionGUID: oz0NMMHoRwC+RDiPhmvY3g==
X-CSE-MsgGUID: i1+JFU+dS5WuJjSD/kujfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17870397"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17870397"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:34:28 -0700
X-CSE-ConnectionGUID: YT7fd2qWR5eAuFUzN6L/ag==
X-CSE-MsgGUID: onLi0RA5S2KrMKFJAvqkyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47780121"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2024 03:34:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR8Av-000WZU-0J;
	Tue, 09 Jul 2024 10:34:21 +0000
Date: Tue, 9 Jul 2024 18:33:27 +0800
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
Subject: Re: [PATCH v2 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Message-ID: <202407091813.9IlBCkUP-lkp@intel.com>
References: <20240708-hci_qca_refactor-v2-2-b6e83b3d1ca5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-hci_qca_refactor-v2-2-b6e83b3d1ca5@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0b58e108042b0ed28a71cd7edf5175999955b233]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/dt-bindings-bluetooth-qualcomm-describe-the-inputs-from-PMU-for-wcn7850/20240708-175040
base:   0b58e108042b0ed28a71cd7edf5175999955b233
patch link:    https://lore.kernel.org/r/20240708-hci_qca_refactor-v2-2-b6e83b3d1ca5%40linaro.org
patch subject: [PATCH v2 2/6] Bluetooth: hci_qca: schedule a devm action for disabling the clock
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240709/202407091813.9IlBCkUP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091813.9IlBCkUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091813.9IlBCkUP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/hci_qca.c:2495:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    2495 |         }
         |         ^
>> drivers/bluetooth/hci_qca.c:2494:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2494 |         default:
         |         ^
   drivers/bluetooth/hci_qca.c:2494:2: note: insert '__attribute__((fallthrough));' to silence this warning
    2494 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/bluetooth/hci_qca.c:2494:2: note: insert 'break;' to avoid fall-through
    2494 |         default:
         |         ^
         |         break; 
   2 warnings generated.


vim +2494 drivers/bluetooth/hci_qca.c

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
d12f113a15e826 Bartosz Golaszewski            2024-07-08  2492  		if (power->vregs_on)
c2d7827338618a Balakrishna Godavarthi         2018-08-22  2493  			qca_power_shutdown(&qcadev->serdev_hu);
691d54d0f7cb14 Neil Armstrong                 2023-08-16 @2494  	default:
691d54d0f7cb14 Neil Armstrong                 2023-08-16 @2495  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2496  
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2497  	hci_uart_unregister_device(&qcadev->serdev_hu);
05ba533c5c1155 Thierry Escande                2018-03-29  2498  }
05ba533c5c1155 Thierry Escande                2018-03-29  2499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

