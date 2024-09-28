Return-Path: <linux-arm-msm+bounces-32709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E109989207
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 01:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89D2328263C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 23:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFF0188002;
	Sat, 28 Sep 2024 23:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUz9WOzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD0188591;
	Sat, 28 Sep 2024 23:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727567108; cv=none; b=l7i2wmVrjBtg1fSVNlg5F2R8jWiogOYjuqA4x6sSzZbU2OdREtoEv6chj+j6r9m997Cj3E2IW2vEhRK3Cf2ny78rEUbMrHqdxrcDLXR5BZRqJOfCf6RbQuyw07PfuSg0/WjZfT33Bz90pmBtz8TyrBHBmiNFH4i3nTlSIVgLpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727567108; c=relaxed/simple;
	bh=sRtstZyamgTFvaWC2HT26A4k0j5wMsLi6ZRHUYxbr60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gq/ovcUS3hfP3H8/2Tyx3PDRKsMcBtiVIbrL/DglB/3enY5SuhW5JBwmDvQ5faq1DTg05MwYVFtn5BBUviJZMZIL3+L6I8ntDWPYlRv8uwkDv0t0sSyRJWccr3FxG5PHUpSIM+ICDwUVDZZP0R9shmGtetyFiqhD5A8unCY03J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUz9WOzS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727567105; x=1759103105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRtstZyamgTFvaWC2HT26A4k0j5wMsLi6ZRHUYxbr60=;
  b=WUz9WOzS9BIiTZaBhzFoKkMMG/TsnKudIYjOh2mR4/md1N5M8LaXKb5t
   ANUq+yHIz6gFLnDr0coIjKyz1KJXtk5K9N31SQRgh630IBhYg9gEl31i8
   PIi0u1QiqZycWyO0s/3bFuN4UL0YQZ5HbJsE47omIAj3+yx62NFHOoytK
   LwDiRS7hXuwIx5DJBB2UzWDDR/Ga8xs9U4++yTPtCh1krdUV5/6dNUmA2
   jv3v4ztuNte0hCyLfZmfuEmCql++KfVSYNlInGxGZsuWwfYez1pfb8qDU
   UQ8++1y1i1EkcYDCuOTA+Azn7xorB12gZ7Q4lz3hLh6Ua5lTb9T0Hw+Kn
   A==;
X-CSE-ConnectionGUID: kk6aZLPNRA+8fOw/uON2EQ==
X-CSE-MsgGUID: eoV/FNreT2WdoU8Npx1U+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26192343"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26192343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 16:45:05 -0700
X-CSE-ConnectionGUID: KI4+d7XNS7iUtlrv57V2gg==
X-CSE-MsgGUID: LwqmGFfYR5CYkeryjZ8msQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="103705533"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2024 16:45:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suh7U-000Nkv-22;
	Sat, 28 Sep 2024 23:45:00 +0000
Date: Sun, 29 Sep 2024 07:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH v5 2/2] gcc-sdm845: Add general purpose clock ops
Message-ID: <202409290702.jlF0XWJZ-lkp@intel.com>
References: <20240617-starqltechn_integration_upstream-v5-2-761795ea5084@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-2-761795ea5084@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92fc9636d1471b7f68bfee70c776f7f77e747b97]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/clk-qcom-clk-rcg2-document-calc_rate-function/20240926-184051
base:   92fc9636d1471b7f68bfee70c776f7f77e747b97
patch link:    https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-2-761795ea5084%40gmail.com
patch subject: [PATCH v5 2/2] gcc-sdm845: Add general purpose clock ops
config: i386-buildonly-randconfig-006-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290702.jlF0XWJZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290702.jlF0XWJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290702.jlF0XWJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/clk-rcg2.c:431:13: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     431 |         int i = 2, count = 0;
         |                    ^
   1 warning generated.


vim +/count +431 drivers/clk/qcom/clk-rcg2.c

   427	
   428	static void clk_rcg2_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f,
   429				unsigned int mnd_max, unsigned int pre_div_max)
   430	{
 > 431		int i = 2, count = 0;
   432		unsigned int pre_div = 1;
   433		unsigned long rates_gcd, scaled_parent_rate;
   434		u16 m, n = 1, n_candidate = 1, n_max;
   435	
   436		rates_gcd = gcd(parent_rate, rate);
   437		m = div64_u64(rate, rates_gcd);
   438		scaled_parent_rate = div64_u64(parent_rate, rates_gcd);
   439		while (scaled_parent_rate > (mnd_max + m) * pre_div_max) {
   440			// we're exceeding divisor's range, trying lower scale.
   441			if (m > 1) {
   442				m--;
   443				scaled_parent_rate = mult_frac(scaled_parent_rate, m, (m + 1));
   444			} else {
   445				f->n = mnd_max + m;
   446				f->pre_div = pre_div_max;
   447				f->m = m;
   448			}
   449		}
   450	
   451		n_max = m + mnd_max;
   452	
   453		while (scaled_parent_rate > 1) {
   454			while (scaled_parent_rate % i == 0) {
   455				n_candidate *= i;
   456				if (n_candidate < n_max)
   457					n = n_candidate;
   458				else if (pre_div * i < pre_div_max)
   459					pre_div *= i;
   460				else
   461					clk_rcg2_split_div(i, &pre_div, &n, pre_div_max);
   462	
   463				scaled_parent_rate /= i;
   464			}
   465			i++;
   466			count++;
   467		}
   468	
   469		f->m = m;
   470		f->n = n;
   471		f->pre_div = pre_div > 1 ? pre_div : 0;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

