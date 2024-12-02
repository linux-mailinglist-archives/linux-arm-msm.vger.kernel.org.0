Return-Path: <linux-arm-msm+bounces-39879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5029E027D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF5F1674B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661481FE46A;
	Mon,  2 Dec 2024 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIG2m5o2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE21FDE05;
	Mon,  2 Dec 2024 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143917; cv=none; b=UDehlimmr4Q2xF+qcACPayaogS6LCFDQ+jw4h7VdoCPHgQcWLdb2+KoWEK6+zi6aXiWMqeOhav+sRcuOw63o3mm1MEFdH3yNjeXfCe++UIJIjFUq3yfbQtVjUhrAXWNvztYI3SkG/wdMptSxxjGX6r6Hndof4D3eodBd/2u782U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143917; c=relaxed/simple;
	bh=TI1eNec6e71hXIflgWeSYtQQA2WlLOWs5lDyHo3slqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITIGmJios8V+6ayIgdgEeW6CzV6Qf8Vix9tuqoIGThWIrkn46gSnqNUdfAu5fq6PoZ7LTk0p4SXkL3eDJoeW1Cow/9XKNCKvIPGXp4PpjoJ+zfoLmkzZSlcVWbaAUXoLi9DOHZM+ESbRM+ePveUyzCS4G+qByda1r1/scAbpJnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIG2m5o2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733143915; x=1764679915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TI1eNec6e71hXIflgWeSYtQQA2WlLOWs5lDyHo3slqs=;
  b=GIG2m5o2WZuz7r0Zn1f6WIiQQQrTFS6CGAN87j/oo9F5+Bc85I3ZiiL0
   00dadTGplS5VlgjRF/lLg9Oayvh/5VR6n/l8REBEIUEX6jCawcjmXJA8Z
   3Z5dyz1igMiQXH5up3ps/j1aypNnoXlz/shLGDSFZ2tQxu/7+wnDon1Gd
   /tg6Dtp1eBmW9AiM43i6nVnc0NuBhvu6CorJl2qjXDe/XKfwXMQJladHB
   e3MkFvsMQRa/tn0iAAaMQTaTJCGSDtQZtxdXc4aNYFjxutbdlFfzzM+yT
   TXnodsIc4ZiY02sSWt3NtXz4mx7C825qCGTRXEMCmYfcHonnSbclFU8RW
   Q==;
X-CSE-ConnectionGUID: 1PGML8j6QAW9jLHUO5GYqA==
X-CSE-MsgGUID: 4QbpHJFeR2KyxLBq3lIbRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="36172263"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="36172263"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 04:51:54 -0800
X-CSE-ConnectionGUID: hZZzPD2sS56sMvWpKO/qqA==
X-CSE-MsgGUID: QLZ/Vjq/Rn2q1j2B+4Fdww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93267633"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2024 04:51:50 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI5tz-0002Qj-2c;
	Mon, 02 Dec 2024 12:51:47 +0000
Date: Mon, 2 Dec 2024 20:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sachin Gupta <quic_sachgupt@quicinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
	quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com, quic_sachgupt@quicinc.com,
	quic_sartgarg@quicinc.com
Subject: Re: [PATCH] mmc: sdhci-msm: Command Queue (CQ) Register changes for
 v5.0
Message-ID: <202412022051.5NYO7EbI-lkp@intel.com>
References: <20241202085631.13468-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085631.13468-1-quic_sachgupt@quicinc.com>

Hi Sachin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sachin-Gupta/mmc-sdhci-msm-Command-Queue-CQ-Register-changes-for-v5-0/20241202-170044
base:   linus/master
patch link:    https://lore.kernel.org/r/20241202085631.13468-1-quic_sachgupt%40quicinc.com
patch subject: [PATCH] mmc: sdhci-msm: Command Queue (CQ) Register changes for v5.0
config: arm64-randconfig-001-20241202 (https://download.01.org/0day-ci/archive/20241202/202412022051.5NYO7EbI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022051.5NYO7EbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022051.5NYO7EbI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:24,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/mmc/host/sdhci-msm.c:8:
   drivers/mmc/host/sdhci-msm.c: In function 'sdhci_msm_dump_vendor_regs':
>> drivers/mmc/host/sdhci-msm.c:2289:38: warning: 'cq_host' is used uninitialized [-Wuninitialized]
    2289 |                 readl_relaxed(cq_host->mmio + CQHCI_VENDOR_CFG + offset));
         |                               ~~~~~~~^~~~~~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/mmc/host/sdhci-msm.c:2257:9: note: in expansion of macro 'pr_err'
    2257 |         pr_err("%s: " DRV_NAME ": " f, mmc_hostname(host->mmc), ## x)
         |         ^~~~~~
   drivers/mmc/host/sdhci-msm.c:2288:9: note: in expansion of macro 'CQHCI_DUMP'
    2288 |         CQHCI_DUMP("Vendor cfg 0x%08x\n",
         |         ^~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2264:28: note: 'cq_host' was declared here
    2264 |         struct cqhci_host *cq_host;
         |                            ^~~~~~~


vim +/cq_host +2289 drivers/mmc/host/sdhci-msm.c

  2250	
  2251	#define DRIVER_NAME "sdhci_msm"
  2252	#define SDHCI_MSM_DUMP(f, x...) \
  2253		pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
  2254	
  2255	#define DRV_NAME "cqhci"
  2256	#define CQHCI_DUMP(f, x...) \
  2257		pr_err("%s: " DRV_NAME ": " f, mmc_hostname(host->mmc), ## x)
  2258	
  2259	static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
  2260	{
  2261		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  2262		struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
  2263		const struct sdhci_msm_offset *msm_offset = msm_host->offset;
  2264		struct cqhci_host *cq_host;
  2265		int offset = 0;
  2266	
  2267		if (msm_host->cqhci_offset_changed)
  2268			offset = CQE_V5_VENDOR_CFG;
  2269	
  2270		SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
  2271	
  2272		SDHCI_MSM_DUMP(
  2273				"DLL sts: 0x%08x | DLL cfg:  0x%08x | DLL cfg2: 0x%08x\n",
  2274			readl_relaxed(host->ioaddr + msm_offset->core_dll_status),
  2275			readl_relaxed(host->ioaddr + msm_offset->core_dll_config),
  2276			readl_relaxed(host->ioaddr + msm_offset->core_dll_config_2));
  2277		SDHCI_MSM_DUMP(
  2278				"DLL cfg3: 0x%08x | DLL usr ctl:  0x%08x | DDR cfg: 0x%08x\n",
  2279			readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3),
  2280			readl_relaxed(host->ioaddr + msm_offset->core_dll_usr_ctl),
  2281			readl_relaxed(host->ioaddr + msm_offset->core_ddr_config));
  2282		SDHCI_MSM_DUMP(
  2283				"Vndr func: 0x%08x | Vndr func2 : 0x%08x Vndr func3: 0x%08x\n",
  2284			readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec),
  2285			readl_relaxed(host->ioaddr +
  2286				msm_offset->core_vendor_spec_func2),
  2287			readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3));
  2288		CQHCI_DUMP("Vendor cfg 0x%08x\n",
> 2289			readl_relaxed(cq_host->mmio + CQHCI_VENDOR_CFG + offset));
  2290	}
  2291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

