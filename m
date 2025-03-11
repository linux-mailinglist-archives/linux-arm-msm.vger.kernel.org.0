Return-Path: <linux-arm-msm+bounces-51074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09CA5D32B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 00:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF899189CB74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 23:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951B9231A42;
	Tue, 11 Mar 2025 23:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhHxR1iq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6EB1F4CB7;
	Tue, 11 Mar 2025 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741736118; cv=none; b=CcdzuEKKk+Ob5skMfItc3l+rElAhD15KasUrpO0jMzKzglL3QJILH2UzKj/CHU2oW4TotrzXAzIod9si1MBy35qEQ5VbU2IQl5WOn6JzCAbLTSr7hgG+olgAKZEHbauVBL8ZcnleOskXnKdJwLfb9H4PjDX3O3ucyTrAg0M8oh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741736118; c=relaxed/simple;
	bh=elqNsF85TWhSgJAwnZme8MoszZ89P0pZ9HDqIv+k/+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm6malm8hgPWZfukwmKKwqsAeyUr+zCwpnF4WiuqAmlxc+R+xHSuxLNXJHK4di4EsJOM5dSlS4df+59Ac/WtUBwFJHWCwXJMHpBueAtJiuq2qZNJwvphWOVQFYYzC83FnQD4dLt53kJt7NddZ5a/wsy4zaM2n4qarkv7Kt7ncUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhHxR1iq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741736116; x=1773272116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=elqNsF85TWhSgJAwnZme8MoszZ89P0pZ9HDqIv+k/+4=;
  b=mhHxR1iqfiLk12Dol0zGoGQEnrgu9QP2GSd7z1+s2GG/qQYkdAw+C9Np
   58CfDlVCDOYLnCRk4WeADTqjgHqaPlHwPKkUYlCjP0MBJYkdHaxwpkX6F
   DaACXcEMROpKxLbOyAeNEE2gX3gyL5weQWr++5s6+gubCMw0KiZrU2WYC
   /BvLFCfX1EIujrT+/xTNdeYM666FahgrqilJRZsegZykwZqjBbM2J3Aj1
   ghEcTa50CjrigisO9ngpibNDr7Bsq45yF4APiKUGPLIjC9C1axW9n8mSo
   /qCytKIsoS8jK+ZRaZpQS5Wigw30Hhn3/FbzDEo5ROpGdHHr4XKr/nmEa
   g==;
X-CSE-ConnectionGUID: slNoh0tISPS8LM6Y/GtICQ==
X-CSE-MsgGUID: cDsWz8FuSQiMBr73Lbz4wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54169624"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="54169624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 16:35:15 -0700
X-CSE-ConnectionGUID: CF1404RcSfuQSV8CuiITiw==
X-CSE-MsgGUID: Jur65i+1S0GENA6ydQlL3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125361340"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2025 16:35:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts97r-0007wm-1B;
	Tue, 11 Mar 2025 23:35:07 +0000
Date: Wed, 12 Mar 2025 07:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 3/9] net: stmmac: remove of_get_phy_mode()
Message-ID: <202503120741.lpX5066n-lkp@intel.com>
References: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-of_get_phy_mode/20250311-001446
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1trbxk-005qYA-Up%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 3/9] net: stmmac: remove of_get_phy_mode()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503120741.lpX5066n-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120741.lpX5066n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120741.lpX5066n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c:11:
   In file included from include/linux/of_net.h:9:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c:94:4: warning: variable 'phy_mode' is uninitialized when used here [-Wuninitialized]
      94 |                         phy_mode);
         |                         ^~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c:67:2: note: variable 'phy_mode' is declared here
      67 |         phy_interface_t phy_mode;
         |         ^
   4 warnings generated.


vim +/phy_mode +94 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c

2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   61  
41b984be408c088 Russell King (Oracle  2025-03-10   62) static struct anarion_gmac *
41b984be408c088 Russell King (Oracle  2025-03-10   63) anarion_config_dt(struct platform_device *pdev,
41b984be408c088 Russell King (Oracle  2025-03-10   64) 		  struct plat_stmmacenet_data *plat_dat)
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   65  {
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   66  	struct anarion_gmac *gmac;
0c65b2b90d13c1d Andrew Lunn           2019-11-04   67  	phy_interface_t phy_mode;
0c65b2b90d13c1d Andrew Lunn           2019-11-04   68  	void __iomem *ctl_block;
0c65b2b90d13c1d Andrew Lunn           2019-11-04   69  	int err;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   70  
ad124aa34e51439 YueHaibing            2019-08-21   71  	ctl_block = devm_platform_ioremap_resource(pdev, 1);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   72  	if (IS_ERR(ctl_block)) {
51fe084b17e795f Simon Horman          2023-04-06   73  		err = PTR_ERR(ctl_block);
51fe084b17e795f Simon Horman          2023-04-06   74  		dev_err(&pdev->dev, "Cannot get reset region (%d)!\n", err);
51fe084b17e795f Simon Horman          2023-04-06   75  		return ERR_PTR(err);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   76  	}
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   77  
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   78  	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   79  	if (!gmac)
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   80  		return ERR_PTR(-ENOMEM);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   81  
9f12541d684b925 Simon Horman          2023-04-06   82  	gmac->ctl_block = ctl_block;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   83  
41b984be408c088 Russell King (Oracle  2025-03-10   84) 	switch (plat_dat->phy_interface) {
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   85  	case PHY_INTERFACE_MODE_RGMII:
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   86  		fallthrough;
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   87  	case PHY_INTERFACE_MODE_RGMII_ID:
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   88  	case PHY_INTERFACE_MODE_RGMII_RXID:
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   89  	case PHY_INTERFACE_MODE_RGMII_TXID:
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   90  		gmac->phy_intf_sel = GMAC_CONFIG_INTF_RGMII;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   91  		break;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   92  	default:
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   93  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n",
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04  @94  			phy_mode);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   95  		return ERR_PTR(-ENOTSUPP);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   96  	}
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   97  
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   98  	return gmac;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   99  }
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

