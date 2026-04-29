Return-Path: <linux-arm-msm+bounces-105270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCW2KQR38mkHrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 23:24:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D743F49A922
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 23:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3334B3011C72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 21:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740173A874D;
	Wed, 29 Apr 2026 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkg/HS3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984D3939AE;
	Wed, 29 Apr 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777497839; cv=none; b=RYjBApKpv4ZRBrS4T83IFu3U4W4LIHHuH8g1wqNkd9qzNwkt5LaAP81/7Xzu74Dimwr4HoUI0ClBakWZa6DD0YcJ20nlWSONU6rzrPNxj/1XgGbDa6flaoEKITWS/HBSXGcQ8mlZIoDAsrGV6f2EWE952tsfF3mth4+kQzwQCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777497839; c=relaxed/simple;
	bh=XGfI1KD8DtydVr0FNfE/k4FUZDiwOjIIhcZY5jB1c7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buSbv9KdOOnHmZMyV5sJMputBe1TwllfkvEy4G34kAebkDxznwmCrECAoZJ+YIPsW5ZH4QPrF/LSgo8yI0vifMkgi1Vz4ynPbKavUk/qxEENFm4RlzqhWRVJiNTAde2yKVOi7jwGMR+gU4ef1TZv5e/KBoU2uUNzZXQK9j7j8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkg/HS3p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777497837; x=1809033837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XGfI1KD8DtydVr0FNfE/k4FUZDiwOjIIhcZY5jB1c7c=;
  b=gkg/HS3p9UhIFdQtkkp8p2z4REUuxeqsBgOx2n57SHQJhTXpSYa1/Q7h
   SsYkoWxpi8kHtIa0kv9JOqmopmAXPNfWidjaIlhHVBYB4mXXL6h3VHzg6
   PjXWdyyCHs8yzuk0kul+Ejl7AWfQ8r6fu35X2NSUecK5czPQyjD4QsX1A
   ILROe0FTkBL2ndlwlB+Ac6LhhLxH+17/B65dxDa6VabSLPrjiBj1GRXGJ
   C5+geKyeeqa0gMoxapBbrZ/ujAOjnxAc8dN3TptihK2ZBareYo4HWHvnJ
   poSoCd4ESne4QE1ianO2A4eU3vIEterPl4/Blzpha+LSjP/BaiGydbrFz
   g==;
X-CSE-ConnectionGUID: 1n3skWgGSIGGDTZGoQvxsg==
X-CSE-MsgGUID: xCgw04TyTM67IOKEUoQYsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78358416"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78358416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:23:57 -0700
X-CSE-ConnectionGUID: LQgLPGanRPa9vXmI1M2ucw==
X-CSE-MsgGUID: n5KkpAWPSc2gy/lnPaiJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="233541641"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2026 14:23:53 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICNp-00000000BYS-3jfU;
	Wed, 29 Apr 2026 21:23:49 +0000
Date: Thu, 30 Apr 2026 05:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	thierry.escande@linaro.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
	stable@kernel.org
Subject: Re: [PATCH] misc: fastrpc: fix UAF and kernel panic during cleanup
 on process abort
Message-ID: <202604300542.cRI7jldQ-lkp@intel.com>
References: <20260427105310.4056-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427105310.4056-1-jianping.li@oss.qualcomm.com>
X-Rspamd-Queue-Id: D743F49A922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105270-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]

Hi Jianping,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianping-Li/misc-fastrpc-fix-UAF-and-kernel-panic-during-cleanup-on-process-abort/20260428-043358
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260427105310.4056-1-jianping.li%40oss.qualcomm.com
patch subject: [PATCH] misc: fastrpc: fix UAF and kernel panic during cleanup on process abort
config: arm64-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300542.cRI7jldQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300542.cRI7jldQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300542.cRI7jldQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:437:7: error: call to undeclared function 'FASTRPC_PHYS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     437 |                                   FASTRPC_PHYS(buf->phys));
         |                                   ^
>> drivers/misc/fastrpc.c:437:25: error: no member named 'phys' in 'struct fastrpc_buf'
     437 |                                   FASTRPC_PHYS(buf->phys));
         |                                                ~~~  ^
   drivers/misc/fastrpc.c:465:70: error: no member named 'phys' in 'struct fastrpc_buf'
     465 |                 buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys, GFP_KERNEL);
         |                                                                               ~~~  ^
   3 errors generated.


vim +/FASTRPC_PHYS +437 drivers/misc/fastrpc.c

   427	
   428	static void fastrpc_buf_free(struct fastrpc_buf *buf)
   429	{
   430		struct fastrpc_user *fl = buf->fl;
   431	
   432		if (!fl)
   433			return;
   434		mutex_lock(&fl->sctx->mutex);
   435		if (fl->sctx->dev) {
   436			dma_free_coherent(buf->dev, buf->size, buf->virt,
 > 437					  FASTRPC_PHYS(buf->phys));
   438			kfree(buf);
   439		}
   440		mutex_unlock(&fl->sctx->mutex);
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

