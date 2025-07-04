Return-Path: <linux-arm-msm+bounces-63599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE2AF86C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 06:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5957C1C86116
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 04:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDD91E5B82;
	Fri,  4 Jul 2025 04:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwXPbPGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB021DBB0C;
	Fri,  4 Jul 2025 04:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751603229; cv=none; b=AxZRjUGYX5q/T+t7rneBQpiXvfwDvl3l4I3Il5IcBELhiI4N0datYkTUqS2YDCy+u9YGpoEjY2xPlHdapCj4HhjRT5/SX503Dv96jLbYG98K7TGDkqlpopdhyedDTkJwuMBRYZCFIDJopFrsNpxaN9IYiJC2t6wBKgOxvrjSimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751603229; c=relaxed/simple;
	bh=GKXto71WjEelALVNdhvteys9iJZSXbhQ+UrUOK5zL+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpG66m8yx1Cepj31FaFu0JD0Lu0ayrxK18zPkKNG0pkv0e6vLduvG2DyL4xOf3JwDFzy50USO8uMAvYrR1rUFsNTOzWzPTcJ3IE3zyhBgNWmMJCl25Q/M6CMaXXju3figmggB/eH8vAYFd6sjx3tjPJJBjpwHBGLEAlHA/r+iYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwXPbPGf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751603228; x=1783139228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKXto71WjEelALVNdhvteys9iJZSXbhQ+UrUOK5zL+Q=;
  b=QwXPbPGfzhcjO8wTFj+vNefF/3i+sUa6++TnAQhYvtqoSRwxPNgR0m2b
   rub786yZbAHx4sa7SXXN2F4wgyEkxWZp7w9ulsRtiXBtEiz5DEaMDAS5u
   4Q5Nt0eQxvHdkcRNmNLxthsK98oRm6vd30L5/1O87GYbSvXzMajets3Ph
   +Wd5napfcOzwYePhNJs/QzTrqgcWr1CPCuRsExtmREJ7OH8Yu5v4fXWj/
   CNGLf58HwpUyqJEZfHaxyrO+XNcxxVa8bGnzu1ZaZxUimFSEOC3JaBISr
   p/zwl1/XkvAWzGertOrAIQm2xJRPp5mI4u18gYF0DLHSmwRKnE+xrqAgh
   Q==;
X-CSE-ConnectionGUID: ioWjBK3HR3u7pV9aBCGkaw==
X-CSE-MsgGUID: kOXR6wjFTyKlKUzZyAoLvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64629310"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64629310"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 21:27:07 -0700
X-CSE-ConnectionGUID: NARYHCX/SiKnG2tHm0XMgA==
X-CSE-MsgGUID: e6fRi3aoSTqQyVlz1ODRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158577679"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2025 21:27:05 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXY0s-0003Kh-2r;
	Fri, 04 Jul 2025 04:27:02 +0000
Date: Fri, 4 Jul 2025 12:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc-owner@vger.kernel.org
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: Add eMMC support for qcs8300
Message-ID: <202507041209.XrPwGbTd-lkp@intel.com>
References: <20250702085927.10370-3-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702085927.10370-3-quic_sayalil@quicinc.com>

Hi Sayali,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sayali-Lokhande/dt-bindings-mmc-Add-sdhci-compatible-for-qcs8300/20250702-170136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250702085927.10370-3-quic_sayalil%40quicinc.com
patch subject: [PATCH V3 2/3] arm64: dts: qcom: Add eMMC support for qcs8300
config: arm64-randconfig-051-20250703 (https://download.01.org/0day-ci/archive/20250704/202507041209.XrPwGbTd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041209.XrPwGbTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041209.XrPwGbTd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/qcs8300.dtsi:3867.19-20 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

