Return-Path: <linux-arm-msm+bounces-33467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE7993CF1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 04:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71CA1F25EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 02:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4472D208A7;
	Tue,  8 Oct 2024 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5dXEYOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848BA225D7;
	Tue,  8 Oct 2024 02:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728354815; cv=none; b=Nal4Z7kbwAG9FLx5HDexeqWmrrb2MwFRxSTXwwnygEoKOE5yBPCKQnDnHQRnOiTPjWvL475bqfis0VexuRyoYQhnijPFcSvQMFdMZEz1lqd+P88OsnIwcPCwUFBiYU4shY3vp/FMdQhLb5lpT+0VzubsU6QjACzQvLdJKZgduH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728354815; c=relaxed/simple;
	bh=+Ol8DrfUuYqDiik4Xvulvzq2xvK6ejziirI75juhn7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ4AXebfG9DJFARb4NN1sSIjgE3bEuvcA+LVqkfJyeeyNk9kbk8XpWEyMPV31gMwPyn9yKPlP8RCVA92GOG6TACCJJsg2lvRRcLRqIMAHB4Qk+e68T/YF1XCKLmBGg58VKWC0XOofhJFqopvpulVAS0N3BOMfItGkn8yzM0LaZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5dXEYOG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728354813; x=1759890813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Ol8DrfUuYqDiik4Xvulvzq2xvK6ejziirI75juhn7w=;
  b=E5dXEYOGail1HDbwyIY6xgyIXz4BRAvA3Tj4ySLWC1MPmmVrUHg3UBWb
   I3et82W5yqquDwyI8GtBItGdnxr7hSVUhuk0KkHXuPgk81VNhix0X0Bki
   k9LSl/8/06SJpI+q7G6kIzOkLzxSqcCu964pEx3Yqi2bljvlii9K7sd+D
   vQBpf+EO02nGrYrxZRUkqkiGl/gWyE3KiSxbOBHZsve/1NLa5skK+sF+t
   OIQmE5XcBJvG6o47ZA2TIcOecQDKDdT1wb+UOqCgSvdrGEtVQeZ9Yoo8J
   kZgycF2F7UdF9dxL1i99fbazH1GV7duhgUrRtN2OOwF+mY+wM6C02sK1H
   Q==;
X-CSE-ConnectionGUID: hSQ1G3MsRhGvxvEXmN4jDA==
X-CSE-MsgGUID: VXDSx3UiTY2B8FjCZ2+9AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27658220"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27658220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 19:33:33 -0700
X-CSE-ConnectionGUID: eo6H48AfSGmamQx+eO6zqg==
X-CSE-MsgGUID: ft74ZwX0QwmliVRXcOljYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="80093239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2024 19:33:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy02S-0005oq-0r;
	Tue, 08 Oct 2024 02:33:28 +0000
Date: Tue, 8 Oct 2024 10:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <202410081016.Nuyub4XK-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241008/202410081016.Nuyub4XK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081016.Nuyub4XK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081016.Nuyub4XK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/fastrpc.c: In function 'fastrpc_copy_args':
>> drivers/misc/fastrpc.c:1696:19: error: assignment to '__u64' {aka 'long long unsigned int'} from 'struct fastrpc_invoke_args *' makes integer from pointer without a cast [-Wint-conversion]
    1696 |         inv->args = args;
         |                   ^
   drivers/misc/fastrpc.c: In function 'fastrpc_invoke':
>> drivers/misc/fastrpc.c:1716:18: error: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
    1716 |         kfree(inv.args);
         |               ~~~^~~~~
         |                  |
         |                  __u64 {aka long long unsigned int}
   In file included from include/linux/fs.h:45,
                    from arch/loongarch/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/misc/fastrpc.c:6:
   include/linux/slab.h:446:24: note: expected 'const void *' but argument is of type '__u64' {aka 'long long unsigned int'}
     446 | void kfree(const void *objp);
         |            ~~~~~~~~~~~~^~~~
   drivers/misc/fastrpc.c: In function 'fastrpc_invokev2':
   drivers/misc/fastrpc.c:1734:23: error: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
    1734 |         kfree(inv2.inv.args);
         |               ~~~~~~~~^~~~~
         |                       |
         |                       __u64 {aka long long unsigned int}
   include/linux/slab.h:446:24: note: expected 'const void *' but argument is of type '__u64' {aka 'long long unsigned int'}
     446 | void kfree(const void *objp);
         |            ~~~~~~~~~~~~^~~~


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

