Return-Path: <linux-arm-msm+bounces-33466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B29993C67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 03:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED9171C22B35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 01:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92C91EA6F;
	Tue,  8 Oct 2024 01:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrBMh57k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D118C3E;
	Tue,  8 Oct 2024 01:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728351755; cv=none; b=Sj5XBifY/IvJas3YkGIUOwCTmMvVqieMSnx4RByFitZDo3Gmah1rJ/tIjmJVr+l7+8dFJQA5DEW4wWTaYg4w1r1ybdYo3TOGW1uTpfHq+OrqcmZOHZwUgC2f6NjO4Hk7bXWyyKlXUeQKP7IpUj8K9EeCs8zd7IriQY7MZNPNE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728351755; c=relaxed/simple;
	bh=5rbrBv9GV4LUUrlEqbf06277AN5BK7aUbXun41u4U+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDBlLWaQLCKPPEk+8aCuLoT+lGyzglQgaJu2u9XuVVZxq2LpRH/NBaqs9DkRsaK4VZr+bhwpnSMJaikovjXaBCLqWR8xL+MxPtZyux/RaMuImbjF1I6QIy6qB4GoigbJRC/U9G2zs6hVLaHxTQaqd+Nv0h/YRtspQdWY/XI66Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrBMh57k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728351754; x=1759887754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rbrBv9GV4LUUrlEqbf06277AN5BK7aUbXun41u4U+A=;
  b=BrBMh57kKI9c6BE91KJ1ZwCF/FmLngZ0R7lUKFgG5sZtNXQpDtGv7F8t
   ORYjCXf8/x1eUx6JEK4ZCW62u0/P/XFi8Ow7civxlphx4dYYwDaPZedG4
   QIEwW/vxGRIEsma+i07KcHGmOMglCFBldezsJkbh6kPTzatfRxLMLG1q8
   +jDZaYX4pShp/cP+kv1DrQPeDemFPojqcVW/2E80Z6bWIajMEOR8Kr12p
   GD3xwRZwsuFn+3kORQ1u4btdoN8Sw15WMXCuxWZn5hvHjK1Ln076Kj4tj
   g7+9Mk0y4wPJ7ivvmiMNZEZgT//qN3SwSnxWbXQHFZTqCCwaZLDUZQiJ6
   w==;
X-CSE-ConnectionGUID: B3tmx2E9SEaYDudJf7cqbg==
X-CSE-MsgGUID: oSBpwFPGSeetiQgspaP/rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27691186"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27691186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 18:42:30 -0700
X-CSE-ConnectionGUID: lr/CiGJzR9GiP4F5Jt7jzA==
X-CSE-MsgGUID: cl0324zZQJ2DfzvDBux3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="80455774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2024 18:42:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxzF2-0005kq-2p;
	Tue, 08 Oct 2024 01:42:24 +0000
Date: Tue, 8 Oct 2024 09:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <202410080940.S7Rar8Zi-lkp@intel.com>
References: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>

Hi Ekansh,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Add-CRC-support-using-invokeV2-request/20241007-164734
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241007084518.3649876-2-quic_ekangupt%40quicinc.com
patch subject: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2 request
config: arm-randconfig-002-20241008 (https://download.01.org/0day-ci/archive/20241008/202410080940.S7Rar8Zi-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080940.S7Rar8Zi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080940.S7Rar8Zi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/fastrpc.c:7:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/misc/fastrpc.c:1696:12: error: incompatible pointer to integer conversion assigning to '__u64' (aka 'unsigned long long') from 'struct fastrpc_invoke_args *' [-Wint-conversion]
    1696 |         inv->args = args;
         |                   ^ ~~~~
>> drivers/misc/fastrpc.c:1716:8: error: incompatible integer to pointer conversion passing '__u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
    1716 |         kfree(inv.args);
         |               ^~~~~~~~
   include/linux/slab.h:446:24: note: passing argument to parameter 'objp' here
     446 | void kfree(const void *objp);
         |                        ^
   drivers/misc/fastrpc.c:1734:8: error: incompatible integer to pointer conversion passing '__u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
    1734 |         kfree(inv2.inv.args);
         |               ^~~~~~~~~~~~~
   include/linux/slab.h:446:24: note: passing argument to parameter 'objp' here
     446 | void kfree(const void *objp);
         |                        ^
   1 warning and 3 errors generated.


vim +1696 drivers/misc/fastrpc.c

  1677	
  1678	static int fastrpc_copy_args(struct fastrpc_invoke *inv)
  1679	{
  1680		struct fastrpc_invoke_args *args = NULL;
  1681		u32 nscalars;
  1682	
  1683		/* nscalars is truncated here to max supported value */
  1684		nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
  1685		if (nscalars) {
  1686			args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
  1687			if (!args)
  1688				return -ENOMEM;
  1689	
  1690			if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
  1691					   nscalars * sizeof(*args))) {
  1692				kfree(args);
  1693				return -EFAULT;
  1694			}
  1695		}
> 1696		inv->args = args;
  1697	
  1698		return 0;
  1699	}
  1700	
  1701	static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
  1702	{
  1703		struct fastrpc_invoke_v2 ioctl = {0};
  1704		struct fastrpc_invoke inv;
  1705		int err;
  1706	
  1707		if (copy_from_user(&inv, argp, sizeof(inv)))
  1708			return -EFAULT;
  1709	
  1710		err = fastrpc_copy_args(&inv);
  1711		if (err)
  1712			return err;
  1713	
  1714		ioctl.inv = inv;
  1715		err = fastrpc_internal_invoke(fl, false, &ioctl);
> 1716		kfree(inv.args);
  1717	
  1718		return err;
  1719	}
  1720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

