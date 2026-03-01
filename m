Return-Path: <linux-arm-msm+bounces-94732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOqnGa47pGlnawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:14:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E41CFD0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DD44300443B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 13:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266FD322B6F;
	Sun,  1 Mar 2026 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYno3AFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F232720C;
	Sun,  1 Mar 2026 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370855; cv=none; b=WLhJEPlJGNwJKdZpIb4z6mypx9krO/LiySFWkXA6CAX4c/HPv+1xfV41GDoTX6kcdkFE3ICm1kXmJpSiO3iiE5R0vSn3US/w8Ew9wCcEyRlHSr2KC4mMnl5cojylRsUfBPAJH6itG1vV4T+TGcTp2jJNu+OajPgxQniI0MO/x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370855; c=relaxed/simple;
	bh=2PmoXQbOC5LdLEh4aeiEYZz4GmnSYI7Jxdm/V7UByy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCLvXbvMIeHjaGaPaZvLpuDj/rhDT1f7ToiPev01eAscKbLVykG9HSOLz9pPfNHU0hHXDi3piS9jnlDJt0rF1AVexq1P5zleVLWJZtVLA7JtcEajVWwx+1qYYFsNdqHLZXFvmAstgKoM6GLWD2YB5xBVJBlAcs9dh6gIxWo3MlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYno3AFw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772370853; x=1803906853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2PmoXQbOC5LdLEh4aeiEYZz4GmnSYI7Jxdm/V7UByy0=;
  b=lYno3AFwEAFOfoWK8d/sf+EMjkaVsBUcjsH79RdL8WMnHQYz8+YQlNLW
   i8qzshT37wBpEafG2qhRMyUurEW5buPmsVLlIDdIyYqv7B1z4nwQELktv
   EMHANvlN/Z0yMyW4ZIUb+tlDzXyaQKpqgetpHWkqZtfsINAcu0l7QUec0
   0yH1eytF9AsELGMbd6fVFntaSZIb3UYYEjCcjJQKiprs2WQnZF9l0qSqw
   qb3ZSlrtRO5JiHb8NlKYv6FOTuiJuCTlIF32VrYK8yFybFEFm8tDCuQqZ
   v9Qk7QGD0E/3pJGy65eNNsXQO6YhymtFcBJ0AeuCITZTADUm3vC5Sehxv
   g==;
X-CSE-ConnectionGUID: Nas/S1amSa2iJ8+dvSm/7g==
X-CSE-MsgGUID: 7jOkrr/oQfCzfNTPD3gNaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96012548"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="96012548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 05:14:12 -0800
X-CSE-ConnectionGUID: waAqbHMNTNaLu3rzGxmBvw==
X-CSE-MsgGUID: NC4b4tKZTsSyFzcS3FUlrQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Mar 2026 05:14:10 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwgcZ-000000001Sz-1qQM;
	Sun, 01 Mar 2026 13:14:07 +0000
Date: Sun, 1 Mar 2026 21:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <202603012105.z3eOjLcb-lkp@intel.com>
References: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-94732-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 4F3E41CFD0C
X-Rspamd-Action: no action

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/soc-qcom-ubwc-disable-bank-swizzling-for-Glymur-platform/20260301-040744
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7%40oss.qualcomm.com
patch subject: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur platform
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260301/202603012105.z3eOjLcb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012105.z3eOjLcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012105.z3eOjLcb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:234:19: error: expected '}'
           .ubwc_swizzle = 0;
                            ^
   drivers/soc/qcom/ubwc_config.c:231:54: note: to match this '{'
   static const struct qcom_ubwc_cfg_data glymur_data = {
                                                        ^
>> drivers/soc/qcom/ubwc_config.c:235:2: error: expected identifier or '('
           .ubwc_bank_spread = true,
           ^
>> drivers/soc/qcom/ubwc_config.c:239:1: error: extraneous closing brace ('}')
   };
   ^
   3 errors generated.


vim +234 drivers/soc/qcom/ubwc_config.c

   230	
   231	static const struct qcom_ubwc_cfg_data glymur_data = {
   232		.ubwc_enc_version = UBWC_5_0,
   233		.ubwc_dec_version = UBWC_5_0,
 > 234		.ubwc_swizzle = 0;
 > 235		.ubwc_bank_spread = true,
   236		/* TODO: highest_bank_bit = 15 for LP_DDR4 */
   237		.highest_bank_bit = 16,
   238		.macrotile_mode = true,
 > 239	};
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

