Return-Path: <linux-arm-msm+bounces-93535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL+rMP/HmGngMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 21:45:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4A16ABA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 21:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79E263037431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 20:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8D22FF154;
	Fri, 20 Feb 2026 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mN6i4ZVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F82D7DEF;
	Fri, 20 Feb 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771620334; cv=none; b=qWmcDqK+7DfrGUC+BDcpUJySUi1ECPQBwqnVt83t0ga2LX18UxwCE1QBDwU8iyaeDz51gaYlXjFfW2T41Xjvu8G9bOt4kme74Yvquz8R6aky7bJQY0GJDRLmpyLjQn6HMQIkF0JL2MhPKUmU8MpQx6gili6BRKwxhIEkCGVPH74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771620334; c=relaxed/simple;
	bh=hfYEovSptZFg5jSs3vZA6H/NzLnh/a2Mu/MOyrony4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oouxpZkFa7g6IzCYAwgOHyNZZL7eUJibTjlxl4KtpLdFduZOnFdE/IetFqW7jHDj4gFF19Fm2btyIl5USSH6bNXxCoroG5Gn4xb/bjHrRRjBAwRw87NwXdOpzpYVb8QSkEs7hWzj7mq7XtMjoGQoVIhkI3ZjaqbpVbmQ6bq9O58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mN6i4ZVs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771620332; x=1803156332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hfYEovSptZFg5jSs3vZA6H/NzLnh/a2Mu/MOyrony4A=;
  b=mN6i4ZVs2vS4SltVE9rb1xBbxWa32F+DbjFSU4OdJ3srylG/SZTzVd9z
   +v7a4e2SpgOA0GCTPj1GbcnIAJgVcYhe4YTMoJcRdsf7MrnCRqxsDF/e+
   hEWE3KhC3d9CRD2d2bpklfZEd4p0Br1SRjc6ws+8j3c6da/ygfLBEJZHY
   O2E5xIgFpMvfgvCxGXUUXVZo9rCfshugrko63wPV24pUQ3vhIN5fM4xyM
   MoZDSuQhWBzCdnUiv+CJTWFDtTZtmLYAfI1gJs8HmF5Fbhh9DDFR2mVwC
   OUVI7+MpoACqhGqQ+vfWiHKH0csuLE+KIqXgkq/Fpxl120KfqWA8WSu+a
   A==;
X-CSE-ConnectionGUID: neeO9JAzTSiaQv6x5pJbIw==
X-CSE-MsgGUID: 93PB6O24RQqVHMhC4qVq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83434420"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83434420"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:45:31 -0800
X-CSE-ConnectionGUID: jpMjX0KqSTifzBgpQjwRbw==
X-CSE-MsgGUID: oqN9twAHQ9+nO0UT0QyPFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213476982"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2026 12:45:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtXNP-000000014Sq-1zkA;
	Fri, 20 Feb 2026 20:45:27 +0000
Date: Sat, 21 Feb 2026 04:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: quic_utiwari@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	herbert@gondor.apana.org.au, thara.gopinath@gmail.com,
	davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_neersoni@quicinc.com, quic_utiwari@quicinc.com
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
Message-ID: <202602210452.d7at3UQJ-lkp@intel.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93535-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26E4A16ABA6
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/quic_utiwari-quicinc-com/crypto-qce-Add-runtime-PM-and-interconnect-bandwidth-scaling-support/20260220-153052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20260220072818.2921517-1-quic_utiwari%40quicinc.com
patch subject: [PATCH v7] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
config: x86_64-buildonly-randconfig-004-20260221 (https://download.01.org/0day-ci/archive/20260221/202602210452.d7at3UQJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210452.d7at3UQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210452.d7at3UQJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380,
                    from include/linux/cleanup.h:5,
                    from drivers/crypto/qce/core.c:6:
   drivers/crypto/qce/core.c: In function 'qce_runtime_suspend':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   drivers/crypto/qce/core.c:285:16: note: in expansion of macro 'pm_clk_suspend'
     285 |         return pm_clk_suspend(dev);
         |                ^~~~~~~~~~~~~~
   drivers/crypto/qce/core.c: In function 'qce_runtime_resume':
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:78:25: note: in expansion of macro 'NULL'
      78 | #define pm_clk_resume   NULL
         |                         ^~~~
   drivers/crypto/qce/core.c:293:15: note: in expansion of macro 'pm_clk_resume'
     293 |         ret = pm_clk_resume(dev);
         |               ^~~~~~~~~~~~~
   include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   drivers/crypto/qce/core.c:304:9: note: in expansion of macro 'pm_clk_suspend'
     304 |         pm_clk_suspend(dev);
         |         ^~~~~~~~~~~~~~
   drivers/crypto/qce/core.c: In function 'qce_runtime_suspend':
>> drivers/crypto/qce/core.c:286:1: warning: control reaches end of non-void function [-Wreturn-type]
     286 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]


vim +286 drivers/crypto/qce/core.c

   278	
   279	static int __maybe_unused qce_runtime_suspend(struct device *dev)
   280	{
   281		struct qce_device *qce = dev_get_drvdata(dev);
   282	
   283		icc_disable(qce->mem_path);
   284	
   285		return pm_clk_suspend(dev);
 > 286	}
   287	
   288	static int __maybe_unused qce_runtime_resume(struct device *dev)
   289	{
   290		struct qce_device *qce = dev_get_drvdata(dev);
   291		int ret = 0;
   292	
   293		ret = pm_clk_resume(dev);
   294		if (ret)
   295			return ret;
   296	
   297		ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
   298		if (ret)
   299			goto err_icc;
   300	
   301		return 0;
   302	
   303	err_icc:
 > 304		pm_clk_suspend(dev);
   305		return ret;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

