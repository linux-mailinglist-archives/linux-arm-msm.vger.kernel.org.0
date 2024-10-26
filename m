Return-Path: <linux-arm-msm+bounces-35985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840399B161A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9C2282ED1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 07:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433E717965E;
	Sat, 26 Oct 2024 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUYXYkF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576142CA8;
	Sat, 26 Oct 2024 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729928878; cv=none; b=HxwNGuh9DtyK2c3CaHIgrip9J/jyaSzkauCgXFIbdZ3CCu4wv633EzFRrxO0wntWIs5IBgTsfM8z4CABajpNXeGa6aQ5zBOJYYd/ZMoAlm8KnJ/v1UURQkI+V3sw6K2nPvNYarY1beYDDzeoqpHYiEVUEnDsVsnl8ropGtOwDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729928878; c=relaxed/simple;
	bh=Nfa6c/0dFOh1MjW26Ru9LYvKZz9jbesyT02owl/pNb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDcNT5KvBKK1l85QyhelQMUgymwB1Ikbzl+/cMbQ8M4/mBRPz8GziDpo600fx77dgE+LZJ7jrI9oInN5GIN8Yf41obaMngXvnm3eizTXvIVaxZsSXMZh9UF85k53aVOxIAlSndHZ6AramiXKOfqyTaoYJHm5c6LrBZLzL1V5yOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUYXYkF7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729928875; x=1761464875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nfa6c/0dFOh1MjW26Ru9LYvKZz9jbesyT02owl/pNb8=;
  b=gUYXYkF73CwvTXrwyOPg7Y9a5QJIAw2qpPaoaZanEGvt4tU99X5B1u/y
   aWjrN5Z8tOgJXZ8vl4+5K2aKnqsQcMiI8g5z6rTC4sMucu9M2wdCJSe+N
   6I8LWxvDH3PTkpWMxDXhFKhqtsc1kRs0aHAt2kHEYIBveUbIrpIGUUGNC
   v+hb4u03t/nMEYVo4Y9vee5NMbh6U+DLKwWUPKZXWMJmKIpqfpvjPTx5A
   Lyjbqpn+y7eI9g8DaUM1yd8xabrd08TPMXD+rCsD5b317D4UT+iZ9eWKD
   4g2E9BbD5j8CPIlQelpBND5rHhAjLuO5zIvRPx0zQaP5d0UjwWfsbGXcU
   A==;
X-CSE-ConnectionGUID: ZB6bZaKtQ72lZmATLUlUGQ==
X-CSE-MsgGUID: 2sFUOhIzQLSuU/9aEvWwjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29376231"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29376231"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 00:47:55 -0700
X-CSE-ConnectionGUID: HcvK5A2uTZ2zxPBsI1C0CA==
X-CSE-MsgGUID: 0wejxHNoQVSaZ7WHcbKk8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85902581"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2024 00:47:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4bWY-000ZPU-2Q;
	Sat, 26 Oct 2024 07:47:50 +0000
Date: Sat, 26 Oct 2024 15:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
Message-ID: <202410261552.E8TiGYdV-lkp@intel.com>
References: <20241025084823.475199-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025084823.475199-1-eugen.hristev@linaro.org>

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/soc-qcom-Rework-BCM_TCS_CMD-macro/20241025-165212
base:   linus/master
patch link:    https://lore.kernel.org/r/20241025084823.475199-1-eugen.hristev%40linaro.org
patch subject: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
config: x86_64-buildonly-randconfig-004-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261552.E8TiGYdV-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261552.E8TiGYdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261552.E8TiGYdV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/clk-rpmh.c:270:14: error: call to undeclared function 'u32_encode_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |                 cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
         |                            ^
   include/soc/qcom/tcs.h:71:3: note: expanded from macro 'BCM_TCS_CMD'
      71 |         (u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |     \
         |          ^
   1 error generated.


vim +/u32_encode_bits +270 drivers/clk/qcom/clk-rpmh.c

9c7e47025a6b9a Taniya Das    2018-05-09  250  
04053f4d23a41b David Dai     2019-01-24  251  static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
04053f4d23a41b David Dai     2019-01-24  252  {
04053f4d23a41b David Dai     2019-01-24  253  	struct tcs_cmd cmd = { 0 };
04053f4d23a41b David Dai     2019-01-24  254  	u32 cmd_state;
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  255  	int ret = 0;
04053f4d23a41b David Dai     2019-01-24  256  
04053f4d23a41b David Dai     2019-01-24  257  	mutex_lock(&rpmh_clk_lock);
04053f4d23a41b David Dai     2019-01-24  258  	if (enable) {
04053f4d23a41b David Dai     2019-01-24  259  		cmd_state = 1;
04053f4d23a41b David Dai     2019-01-24  260  		if (c->aggr_state)
04053f4d23a41b David Dai     2019-01-24  261  			cmd_state = c->aggr_state;
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  262  	} else {
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  263  		cmd_state = 0;
04053f4d23a41b David Dai     2019-01-24  264  	}
04053f4d23a41b David Dai     2019-01-24  265  
a4e5af27e6f6a8 Mike Tipton   2024-08-09  266  	cmd_state = min(cmd_state, BCM_TCS_CMD_VOTE_MASK);
a4e5af27e6f6a8 Mike Tipton   2024-08-09  267  
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  268  	if (c->last_sent_aggr_state != cmd_state) {
04053f4d23a41b David Dai     2019-01-24  269  		cmd.addr = c->res_addr;
6311b6521bcc80 Jordan Crouse 2019-08-05 @270  		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
04053f4d23a41b David Dai     2019-01-24  271  
29f66b625281a3 Stephen Boyd  2022-05-17  272  		/*
29f66b625281a3 Stephen Boyd  2022-05-17  273  		 * Send only an active only state request. RPMh continues to
29f66b625281a3 Stephen Boyd  2022-05-17  274  		 * use the active state when we're in sleep/wake state as long
29f66b625281a3 Stephen Boyd  2022-05-17  275  		 * as the sleep/wake state has never been set.
29f66b625281a3 Stephen Boyd  2022-05-17  276  		 */
dad4e7fda4bdc1 Mike Tipton   2020-02-14  277  		ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
04053f4d23a41b David Dai     2019-01-24  278  		if (ret) {
04053f4d23a41b David Dai     2019-01-24  279  			dev_err(c->dev, "set active state of %s failed: (%d)\n",
04053f4d23a41b David Dai     2019-01-24  280  				c->res_name, ret);
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  281  		} else {
04053f4d23a41b David Dai     2019-01-24  282  			c->last_sent_aggr_state = cmd_state;
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  283  		}
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  284  	}
04053f4d23a41b David Dai     2019-01-24  285  
04053f4d23a41b David Dai     2019-01-24  286  	mutex_unlock(&rpmh_clk_lock);
04053f4d23a41b David Dai     2019-01-24  287  
2cf7a4cbcb4e10 Stephen Boyd  2020-03-09  288  	return ret;
04053f4d23a41b David Dai     2019-01-24  289  }
04053f4d23a41b David Dai     2019-01-24  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

