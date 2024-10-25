Return-Path: <linux-arm-msm+bounces-35975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EB9B117E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 23:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E2A285471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8D5213158;
	Fri, 25 Oct 2024 21:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWiT0Xzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653FB20BB5C;
	Fri, 25 Oct 2024 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890454; cv=none; b=p5+iZnQo1Qfmw2TuK2rvaWHqM9mLdhC6tTA+rhxUgHHcYdFHmws6h33kJCfUsN5AcrxUNY4ixVwlbnZPeao9oxYx3IzNx3vF7gnyYTQcrrmAqwvE3uqJmR/NylfxtfqquTK2uIsq6BFdeFxwN8FFcW7HYJqiDJdTIkzyQEtX4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890454; c=relaxed/simple;
	bh=gGK8EXx//dG9QBfHCEWNHrWMhtoIG8BxydlxXToXjMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZA3zz8AodleiHzTgUs25i/xr7i4u0UwLFRHsvBoap4HA+HRulZZet8DNxHRj4fyX9Kcon0e29gH2RCmj405kkYBf3yVXKp9ZI88NVcT6bdWKCdjtpPjxlZZ8s3dFYIuEykC8DJNIlPTcOav3Hn1HyPDuqoV1mvl0R7DpgpRYuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWiT0Xzf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729890452; x=1761426452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gGK8EXx//dG9QBfHCEWNHrWMhtoIG8BxydlxXToXjMw=;
  b=FWiT0Xzf7FS8fNstxX4EWyC/a6wfmyLjrhNH1rzvbDHBbBrBbffbGDJm
   SRV9hunNW03yDL9Q06CGXddQzdnvLqVwZ+4EGVO6ntRuSNF1QTkZ+apbb
   I6ygIsxLQUvN5kw8vAZod+63XkJj6Xfhkr7gTazh2xNTjejSKSSAnPXic
   pVIBMz44Q4l63UrKFkzY5wTOyEU7TImmfrl7/92lwaFGTAf2Si7efsIl4
   9eqRSKOVIq6shuBd1GTOQCsfmYj22+NvR3ygtxR8d8Cap43Wd4Jooftfp
   16J8YD0cPhOzxSJdbY4ocF/CESAVPmUfSUTL5EdvW9CQMZMVwMwmaTX+e
   g==;
X-CSE-ConnectionGUID: IKLnzVw0QjKlSgraQy9KlQ==
X-CSE-MsgGUID: gDJwt4eKQpObw9GZrvZ+PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40189898"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="40189898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:07:32 -0700
X-CSE-ConnectionGUID: v0/eymLOSSicaUdy5+b0aA==
X-CSE-MsgGUID: JINDhuP5Se6vXwIo+J7S5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="118494132"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2024 14:07:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4RWq-000Yte-04;
	Fri, 25 Oct 2024 21:07:28 +0000
Date: Sat, 26 Oct 2024 05:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andersson@kernel.org,
	konradybcio@kernel.org, linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
Message-ID: <202410260419.qGKBvJHZ-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410260419.qGKBvJHZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260419.qGKBvJHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260419.qGKBvJHZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/soc/qcom/rpmh.h:9,
                    from drivers/clk/qcom/clk-rpmh.c:13:
   drivers/clk/qcom/clk-rpmh.c: In function 'clk_rpmh_bcm_send_cmd':
>> include/soc/qcom/tcs.h:71:10: error: implicit declaration of function 'u32_encode_bits' [-Werror=implicit-function-declaration]
      71 |         (u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |     \
         |          ^~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-rpmh.c:270:28: note: in expansion of macro 'BCM_TCS_CMD'
     270 |                 cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
         |                            ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/u32_encode_bits +71 include/soc/qcom/tcs.h

    68	
    69	/* Construct a Bus Clock Manager (BCM) specific TCS command */
    70	#define BCM_TCS_CMD(commit, valid, vote_x, vote_y)		\
  > 71		(u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |	\
    72		u32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |	\
    73		u32_encode_bits((__force u32)cpu_to_le32(vote_x),	\
    74				BCM_TCS_CMD_VOTE_X_MASK) |		\
    75		u32_encode_bits((__force u32)cpu_to_le32(vote_y),	\
    76				BCM_TCS_CMD_VOTE_Y_MASK))
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

