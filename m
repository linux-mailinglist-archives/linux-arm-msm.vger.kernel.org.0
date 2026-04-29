Return-Path: <linux-arm-msm+bounces-105271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PQ1IFt88ml2rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 23:47:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21249AAFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 23:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93E9A301CD94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 21:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDBF379EEF;
	Wed, 29 Apr 2026 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFs6JYIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C022749D6;
	Wed, 29 Apr 2026 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499221; cv=none; b=Dssu3m6rAry5+jIdA9QVEZdb0kU8AG4JzFFZO4dlST9VZtZFKIBa8B0GpUw5sj4NY4kcohRVXfzT2wN8Z12qRp/+94mqiY6Rp8fnAD+hCt16FAB6/VyEAkl/fxTueCyp2yqS7D2RVoTDN/5PloJBY4N1ljVix8wvMaPJCFiBTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499221; c=relaxed/simple;
	bh=RKADrjlZxdvKzWuwSS/wN7ViwlvtwGzupRWk4o1EfP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYHmkkQnA/PQQ0IykhUQCJhx8+yu7uthvlg68nQK7vlzeyi1K/wAF1ssUsBTqCK7eMdSunuAzXbZCPsvScM5wC1loee8P+jbS4d7Iqdrq2SF7g97pkW6EOH7ZgpawTevrPZ5qD/EphxWJH3nHh5GvfE53NT6y1gtrZ+m4v5X7qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFs6JYIW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777499220; x=1809035220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RKADrjlZxdvKzWuwSS/wN7ViwlvtwGzupRWk4o1EfP0=;
  b=lFs6JYIWHbQTb0Q9n0zxWYDVbJfRIMbyOJywgRswsihHJC1+ZypSb9gt
   0JTAy70jH65uI2XtcbQYHOiT+9JdP71ExapJj2A7lLwEQJagIVibEyu5G
   CenuGJBNkAfK6cC8AT2meelf/Y0t0aASwzqayXNWEtHIftkU3FTpQt+x1
   myPfLoXM6yv40C4VTTdc5WKJcFw421OuFhLwFkkYcTxGl8ykZTLlVfPxC
   wCYdeHE+KuJXLWrzqvV55kdUEk2cwZtJFvu/haGl1dX6p4irGj+uHXH2s
   TCSGPF01T/znocIQm5qH6J93iwghPtA3dO9hUMxVy3OFeIhvM0/u6XOiQ
   A==;
X-CSE-ConnectionGUID: PORmGPyMQrKUopao8KYJsQ==
X-CSE-MsgGUID: NmpB1gFlQXyEO4296bilRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88751148"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="88751148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:46:59 -0700
X-CSE-ConnectionGUID: h2jE8+PaQ4K3VP8aSOXY4g==
X-CSE-MsgGUID: M5SMprO9RGuiaeMJ9cmd4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234266688"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 14:46:56 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICk8-00000000BZW-3OJr;
	Wed, 29 Apr 2026 21:46:52 +0000
Date: Thu, 30 Apr 2026 05:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	thierry.escande@linaro.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
	stable@kernel.org
Subject: Re: [PATCH] misc: fastrpc: fix UAF and kernel panic during cleanup
 on process abort
Message-ID: <202604300523.sGVh9WHp-lkp@intel.com>
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
X-Rspamd-Queue-Id: EF21249AAFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105271-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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
config: csky-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300523.sGVh9WHp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300523.sGVh9WHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300523.sGVh9WHp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/fastrpc.c: In function 'fastrpc_buf_free':
>> drivers/misc/fastrpc.c:437:35: error: implicit declaration of function 'FASTRPC_PHYS' [-Wimplicit-function-declaration]
     437 |                                   FASTRPC_PHYS(buf->phys));
         |                                   ^~~~~~~~~~~~
>> drivers/misc/fastrpc.c:437:51: error: 'struct fastrpc_buf' has no member named 'phys'
     437 |                                   FASTRPC_PHYS(buf->phys));
         |                                                   ^~
   drivers/misc/fastrpc.c: In function '__fastrpc_buf_alloc':
   drivers/misc/fastrpc.c:465:82: error: 'struct fastrpc_buf' has no member named 'phys'
     465 |                 buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys, GFP_KERNEL);
         |                                                                                  ^~


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

