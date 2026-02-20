Return-Path: <linux-arm-msm+bounces-93512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFW1BS5ymGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:39:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4711686FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BB5D30D1759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD9E274B32;
	Fri, 20 Feb 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJ+f7a66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D4B19C546;
	Fri, 20 Feb 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598118; cv=none; b=ixpBn2AQrv8OC1q0glGiGwzuKGHUywgBHKp+w9QCkuxkWCGggr1lUWlopzWFBMq0tZ13+40/q+t9ra0yoKR1kgKKbLJZ0i4nDM2dlHHMdCCRfGMWZ/EK/2kLfxgaUH3pifQv9CiBr34WGPrsFVy9EaGDHfh1PDd/Hyfuki3QwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598118; c=relaxed/simple;
	bh=65fhXrUGMLksU/tzif3tBwyoXu/ZoORUEpg7RQw/eBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERlipzLXDPKmZswb30TI3zazVewVTsMKrEA6fmgeGOpqarvtpt9JMgXDs82Hy6IdnqfCMU8UPcSJpik0/M5qRv6lqtzpPjkc9jUXaY+FdWQvvZJlyOw0+dc4/6f35iPWOdQzLLGIBlQOLh+lZG74RiIju+Zhv3zmo5BqK/uYi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJ+f7a66; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771598118; x=1803134118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=65fhXrUGMLksU/tzif3tBwyoXu/ZoORUEpg7RQw/eBk=;
  b=DJ+f7a66GAguDHAyYWmO+wRZ7BLFlV7s1Qpl5P4xF2QxDhVNu8Jp1rT+
   Hg6+WllvBPlmS5Msx/Fuu/8uWYnN/Gy/1y60Ku2oGx86fT6KC1/dpB1Xh
   qNNi284XlNdr38IdN1zY00bM0AQQBcsT6jOtMCCnH5t2nvkc9j+v4qyMj
   LqGF8gZrOH6rbnm+Qr/KKmZ/rMygA34tCbzr0QVmHyqjx7whKoI860wG0
   N93MnIFzMHKAKMep9z1XiL3XW20sds3+kX0Q+X3+jQLS5OhWRUDq348fi
   XM8FXqBzooXotgO2Ot8o+nCZ7ZmSY+dr9+oPJhq0Gj+xv3SFVKJHNc2w9
   w==;
X-CSE-ConnectionGUID: iZCjTj19S3Oa1JEhgUi5QQ==
X-CSE-MsgGUID: +/uPOfMpQUmlmWdQpBOsdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72391809"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72391809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 06:35:17 -0800
X-CSE-ConnectionGUID: ZSFKqU2JSyCx6FpH2eW0fg==
X-CSE-MsgGUID: 1clzXpwbSyaIxx4PUVEa0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213420626"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2026 06:35:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtRb6-000000014AS-1stg;
	Fri, 20 Feb 2026 14:35:12 +0000
Date: Fri, 20 Feb 2026 22:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: quic_utiwari@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	herbert@gondor.apana.org.au, thara.gopinath@gmail.com,
	davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com,
	quic_utiwari@quicinc.com
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
Message-ID: <202602202238.PjZ0zYoN-lkp@intel.com>
References: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93512-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 6B4711686FB
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.19 next-20260219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/quic_utiwari-quicinc-com/crypto-qce-Add-runtime-PM-and-interconnect-bandwidth-scaling-support/20260220-153052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20260220072818.2921517-1-quic_utiwari%40quicinc.com
patch subject: [PATCH v7] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260220/202602202238.PjZ0zYoN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202238.PjZ0zYoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202238.PjZ0zYoN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/qce/core.c:285:23: error: called object type 'void *' is not a function or function pointer
     285 |         return pm_clk_suspend(dev);
         |                ~~~~~~~~~~~~~~^
   drivers/crypto/qce/core.c:293:21: error: called object type 'void *' is not a function or function pointer
     293 |         ret = pm_clk_resume(dev);
         |               ~~~~~~~~~~~~~^
   drivers/crypto/qce/core.c:304:16: error: called object type 'void *' is not a function or function pointer
     304 |         pm_clk_suspend(dev);
         |         ~~~~~~~~~~~~~~^
   3 errors generated.


vim +285 drivers/crypto/qce/core.c

   278	
   279	static int __maybe_unused qce_runtime_suspend(struct device *dev)
   280	{
   281		struct qce_device *qce = dev_get_drvdata(dev);
   282	
   283		icc_disable(qce->mem_path);
   284	
 > 285		return pm_clk_suspend(dev);
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

