Return-Path: <linux-arm-msm+bounces-83588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3399C8E3E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C7934E1FC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F97E33030A;
	Thu, 27 Nov 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ST2IUyE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F02932B9A5;
	Thu, 27 Nov 2025 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764246283; cv=none; b=tkr8HMFav55R4B5a78DTZzNLoGD0TO/sQR5Zm59MUQ4JDvUs7DOiXKl95oW/aVpUSr8SV8n1Q0Jg7zjvDGiNzvMpDVImQ4SEegvNL8oQttjjtsPbLtj2/ZDq3F+RK4LEgzI+IumA1a0TAW8Eh2wX8g4bjr7DrWe84Gu/X33qbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764246283; c=relaxed/simple;
	bh=iFmA0gfBLZi3VRH7c1aQ06IjGcorTM9TWDyCB6dTNtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eM+rJhHheDIKADEDWHMyTGqSQ4tHKq9KlBlucaL9oDtKE2G4yZOnVk7aiszcD/KIWIRBOIdod8QU3SrIFfuNj39WSddXtSjYZKxu8Z9RvvTsJT3w1lk087HHgKeAQQtOdKLv1LlH2WNEKY8J8vfK6XZGF6tTv5PuEX29DVMI5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ST2IUyE0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764246282; x=1795782282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iFmA0gfBLZi3VRH7c1aQ06IjGcorTM9TWDyCB6dTNtE=;
  b=ST2IUyE0iTz5Tr/jEdJhuczzn1uQR6jxHidA11ahBZgSlDbX06yyjiT9
   3rRZ1sMl0fyTJwig+3EeCySSA0KSQ5LVcj8Kr7QcWTuUAheg65KiX77E8
   RVvUtqQMw6rAD60NGTEMi8h8Nr01KfrLm5UD/no5BWiGMmglbtX+nZoMT
   /krrHdDuy+vUQvuwIlh3RCub+hFWNj179LL+OCadjduR65GRmdx2+gBUb
   xQg0CRuT26rqn/HSVLGrls21qBprcQks8YR8rZhvQQw4U+GBXddhRLfkh
   howRKTpltJSQKUia7OToH4wKEBaY2I6NRJwUHX8YFY9OjEqnVALo4LMO/
   Q==;
X-CSE-ConnectionGUID: JuP9l02yQiWAW81xRlvZLg==
X-CSE-MsgGUID: ks6Sfun3RSKDRTc0FmwkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83685484"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="83685484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 04:24:41 -0800
X-CSE-ConnectionGUID: +S3LMCMKQKKCeX7JLBZV4A==
X-CSE-MsgGUID: OkMQesF8QauVnnjuq5hlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="192474715"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 04:24:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOb33-000000004k1-2N6M;
	Thu, 27 Nov 2025 12:24:33 +0000
Date: Thu, 27 Nov 2025 20:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
	kpallavi@qti.qualcomm.com, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
	quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v4 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <202511272058.teHG4sdy-lkp@intel.com>
References: <20251126094545.2139376-3-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126094545.2139376-3-kumari.pallavi@oss.qualcomm.com>

Hi Kumari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus robh/for-next soc/for-next linus/master v6.18-rc7 next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumari-Pallavi/dt-bindings-misc-qcom-fastrpc-Add-compatible-for-Kaanapali/20251126-175106
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251126094545.2139376-3-kumari.pallavi%40oss.qualcomm.com
patch subject: [PATCH v4 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
config: arm-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511272058.teHG4sdy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511272058.teHG4sdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511272058.teHG4sdy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:328:6: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     327 |                                         "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                             ~~~~
         |                                                                             %x
     328 |                                         map->dma_addr, map->len, err);
         |                                         ^~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:823:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     822 |                                 "Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                          ~~~~
         |                                                                          %x
     823 |                                 map->dma_addr, map->len, err);
         |                                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:1318:6: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1317 |                                         "Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                                  ~~~~
         |                                                                                  %x
    1318 |                                         fl->cctx->remote_heap->dma_addr,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:1373:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1372 |                         dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                                    ~~~~
         |                                                                                    %x
    1373 |                                 fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:1953:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1952 |                                 "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d",
         |                                                                     ~~~~
         |                                                                     %x
    1953 |                                 buf->dma_addr, buf->size, err);
         |                                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   5 warnings generated.


vim +328 drivers/misc/fastrpc.c

   307	
   308	static void fastrpc_free_map(struct kref *ref)
   309	{
   310		struct fastrpc_map *map;
   311	
   312		map = container_of(ref, struct fastrpc_map, refcount);
   313	
   314		if (map->table) {
   315			if (map->attr & FASTRPC_ATTR_SECUREMAP) {
   316				struct qcom_scm_vmperm perm;
   317				int vmid = map->fl->cctx->vmperms[0].vmid;
   318				u64 src_perms = BIT(QCOM_SCM_VMID_HLOS) | BIT(vmid);
   319				int err = 0;
   320	
   321				perm.vmid = QCOM_SCM_VMID_HLOS;
   322				perm.perm = QCOM_SCM_PERM_RWX;
   323				err = qcom_scm_assign_mem(map->dma_addr, map->len,
   324					&src_perms, &perm, 1);
   325				if (err) {
   326					dev_err(map->fl->sctx->dev,
   327						"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
 > 328						map->dma_addr, map->len, err);
   329					return;
   330				}
   331			}
   332			dma_buf_unmap_attachment_unlocked(map->attach, map->table,
   333							  DMA_BIDIRECTIONAL);
   334			dma_buf_detach(map->buf, map->attach);
   335			dma_buf_put(map->buf);
   336		}
   337	
   338		if (map->fl) {
   339			spin_lock(&map->fl->lock);
   340			list_del(&map->node);
   341			spin_unlock(&map->fl->lock);
   342			map->fl = NULL;
   343		}
   344	
   345		kfree(map);
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

