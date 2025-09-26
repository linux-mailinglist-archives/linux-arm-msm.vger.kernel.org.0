Return-Path: <linux-arm-msm+bounces-75237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF1BA2674
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 525F91BC3A6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 04:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC23F274670;
	Fri, 26 Sep 2025 04:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cW9LP/3F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E122AD35;
	Fri, 26 Sep 2025 04:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758862145; cv=none; b=clPapjP5w1Z9bCROfKh61Kk8wltlNeCLJY7UM3BKBA1rMmL/7MD5pZX0ZfRx90GSPJgxc2Np17LN38Z/t3VQ7HofGM501EGp1GwfMQH3IU6q/ZOyZzisJN0/pWQsmmMROkjZ3CPsLA0CtTDoOch/mcv+6SvtYgiUNX/OGOyAe7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758862145; c=relaxed/simple;
	bh=4na2MwMkmmAaDECDNWbXVEGbVQneUVLeyfZhzwMWr2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmGZWzzfAleVPwM/8/YtZ0eASPKvteG0GXjq+v7Ioia+goJ8O0GtT82XKz8uiCynDPDIpARxcBh6WJBG1LGYa8j0MLLacHdFjiChPqkx4wjwjyHDKeKb58xp5oHPMy2nIxkhAsmallFJnbatRGfuJTEJ1sevaEa5bYWQrxbXZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cW9LP/3F; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758862143; x=1790398143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4na2MwMkmmAaDECDNWbXVEGbVQneUVLeyfZhzwMWr2Q=;
  b=cW9LP/3FKm+8MQb5qhBNKcYvdynZbgPOTauxG05/ebQDKotNva3fGY18
   eyJYj8XTHIOallLNSdO9+Sj0A4jwhxOBMhfiF+VRL89gQxMyEFbsht4oo
   pCEkeFlcDsJJHg8TXe3lOIJDkZpyzsaHDHYVOFj2vZBnGgKhkaocmSiEf
   tvNTF23UVVcDW8Pyo7VQhsqmswiyX0E3xjDbKaEY7CEu58V1sTxZl6pw3
   n9VB0ahIv8GFKkJTeP7RRvldGTm7nJ4bYRhdwMu8xn3oJuVLNhgAu8zxC
   m759VLY6Pw6Sd8TsXbSWJ82CFntJZqNpnQK0UQo4HmBo5yuF6q3po97Xw
   g==;
X-CSE-ConnectionGUID: IpIY2hFmQiufR59exh4RpQ==
X-CSE-MsgGUID: CTk3TcPMRx+1BPUl60PkPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60890654"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="60890654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 21:49:03 -0700
X-CSE-ConnectionGUID: 5NSCml62RnC5bGQ7ZNzxUg==
X-CSE-MsgGUID: xhQYA/zoQXmI+yKr9TDkmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="176634376"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2025 21:48:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v20O7-0005uP-3A;
	Fri, 26 Sep 2025 04:48:55 +0000
Date: Fri, 26 Sep 2025 12:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
Message-ID: <202509261209.yuXsEYB5-lkp@intel.com>
References: <20250924-glymur-spmi-v8-v2-2-202fc7a66a97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-spmi-v8-v2-2-202fc7a66a97@oss.qualcomm.com>

Hi Kamal,

kernel test robot noticed the following build errors:

[auto build test ERROR on c3067c2c38316c3ef013636c93daa285ee6aaa2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Wadhwa/dt-bindings-spmi-add-bindings-for-glymur-spmi-pmic-arb-arbiter-v8/20250925-010123
base:   c3067c2c38316c3ef013636c93daa285ee6aaa2e
patch link:    https://lore.kernel.org/r/20250924-glymur-spmi-v8-v2-2-202fc7a66a97%40oss.qualcomm.com
patch subject: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter v8
config: csky-randconfig-002-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261209.yuXsEYB5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261209.yuXsEYB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261209.yuXsEYB5-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:10: note: in expansion of macro 'FIELD_PREP'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |          ^~~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:21: note: in expansion of macro 'GENMASK'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |                     ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:953:22: note: in expansion of macro 'spec_to_hwirq'
     953 |         *out_hwirq = spec_to_hwirq(intspec[0], intspec[1], intspec[2], apid);
         |                      ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:554:23: note: in definition of macro '__compiletime_assert'
     554 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:574:9: note: in expansion of macro '_compiletime_assert'
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:10: note: in expansion of macro 'FIELD_PREP'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |          ^~~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:21: note: in expansion of macro 'GENMASK'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |                     ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:953:22: note: in expansion of macro 'spec_to_hwirq'
     953 |         *out_hwirq = spec_to_hwirq(intspec[0], intspec[1], intspec[2], apid);
         |                      ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/spmi/spmi-pmic-arb.c:125:10: note: in expansion of macro 'FIELD_PREP'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |          ^~~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:21: note: in expansion of macro 'GENMASK'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |                     ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:953:22: note: in expansion of macro 'spec_to_hwirq'
     953 |         *out_hwirq = spec_to_hwirq(intspec[0], intspec[1], intspec[2], apid);
         |                      ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:116:63: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:21: note: in expansion of macro 'GENMASK'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |                     ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:953:22: note: in expansion of macro 'spec_to_hwirq'
     953 |         *out_hwirq = spec_to_hwirq(intspec[0], intspec[1], intspec[2], apid);
         |                      ^~~~~~~~~~~~~
>> include/linux/compiler_types.h:574:45: error: call to '__compiletime_assert_283' declared with attribute error: FIELD_PREP: mask is zero
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:555:25: note: in definition of macro '__compiletime_assert'
     555 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:574:9: note: in expansion of macro '_compiletime_assert'
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:10: note: in expansion of macro 'FIELD_PREP'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |          ^~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:953:22: note: in expansion of macro 'spec_to_hwirq'
     953 |         *out_hwirq = spec_to_hwirq(intspec[0], intspec[1], intspec[2], apid);
         |                      ^~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c: In function 'qpnpint_irq_domain_activate':
   include/linux/compiler_types.h:574:45: error: call to '__compiletime_assert_273' declared with attribute error: FIELD_GET: mask is zero
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:555:25: note: in definition of macro '__compiletime_assert'
     555 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:574:9: note: in expansion of macro '_compiletime_assert'
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:130:30: note: in expansion of macro 'FIELD_GET'
     130 | #define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
         |                              ^~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:888:19: note: in expansion of macro 'hwirq_to_sid'
     888 |         u16 sid = hwirq_to_sid(d->hwirq);
         |                   ^~~~~~~~~~~~
   In function 'periph_interrupt',
       inlined from 'pmic_arb_chained_irq' at drivers/spmi/spmi-pmic-arb.c:737:9:
   include/linux/compiler_types.h:574:45: error: call to '__compiletime_assert_208' declared with attribute error: FIELD_PREP: mask is zero
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:555:25: note: in definition of macro '__compiletime_assert'
     555 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:574:9: note: in expansion of macro '_compiletime_assert'
     574 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:125:10: note: in expansion of macro 'FIELD_PREP'
     125 |         (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
         |          ^~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:686:40: note: in expansion of macro 'spec_to_hwirq'
     686 |                                        spec_to_hwirq(sid, per, id, apid));
         |                                        ^~~~~~~~~~~~~


vim +/__compiletime_assert_283 +574 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  572   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @574  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  575  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

