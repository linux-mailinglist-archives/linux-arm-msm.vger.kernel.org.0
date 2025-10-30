Return-Path: <linux-arm-msm+bounces-79559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A91C1E533
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 05:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B26973B693F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 04:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E892E888A;
	Thu, 30 Oct 2025 04:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+ur054I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CC42E427B;
	Thu, 30 Oct 2025 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761797335; cv=none; b=RV2JIY9yAXO2CC/hYBOj12zOTyW7cV0cIyIYD2ZwqgkiOAno1FR2tOyr9qepwtfrxyNPG56BYIdQUpzJOZJhYDwPIX11KdB4F9BzU+3/Iy2xI/zvHv8Hfhju0m6CPtMrOjFu8BUll8ULmZC4KEGozv6LRRA7j1VPjFJ3hFKvxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761797335; c=relaxed/simple;
	bh=B+sOnqt8S6+E72VPgLNfKPsheBwDneDieIaq7l/8ieA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMyL80ShjDPg9XwgwShXRbn4r+45wplPZD0ud7YD/LWquJoPxrGaTLwNoVZAwDrOXaLFGjdYs2ZqbtKF5qBTdi+vV7hE6bCY+bX8NdSg6/soAQf3VQgJ6DHo8j5xYO3aeuwilZ3rxUJaavEqAzuVvOKlq8O2cDV7QRIQvFOqjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+ur054I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761797334; x=1793333334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+sOnqt8S6+E72VPgLNfKPsheBwDneDieIaq7l/8ieA=;
  b=k+ur054INS8wQb+EF4IPiOgbl4/h8j0sd6Y0eh40wEQ5i2BLDGI5VgIK
   rwRSmlhbtd/g31ha77nPs06NyBoRLOMq9BbQ9h2kPoZNwrJUDxbJ5Od1/
   2UAcmOMr4RzEyu6wYsOzAjSaVuP6Au2TpIWz5dZPWqD++x6LnDrB34uGY
   gbhN5lDF6Gsqm2okP3X+maF5QTu+nWuPk6XcjO5+QZa7h3XpRAddENddF
   0Q6iXHcJ6l/gT29hEwkxYY2fQhoTZJn0DrfTicz3Xoug1l0lreLKXEA4b
   OB2Nh9jLQVbu+kxA9LmHbDQ74ojfrqEwkhUFc1bYnYE0u6XZ5At9pJHlF
   w==;
X-CSE-ConnectionGUID: ktKBqzFETDC77P2e7csU3Q==
X-CSE-MsgGUID: bkjJG8W3RUa4Z1viHNmQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67764961"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67764961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:08:54 -0700
X-CSE-ConnectionGUID: jqV37IabRP+Wt4VguqV4Jg==
X-CSE-MsgGUID: XuQ0Lq6oS+aXu+ai9k06Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189916728"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 21:08:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJwy-000LRk-0o;
	Thu, 30 Oct 2025 04:08:04 +0000
Date: Thu, 30 Oct 2025 12:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Raj Chouhan <pc1598@mainlining.org>,
	linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Add support for Xiaomi
 Redmi K20 Pro
Message-ID: <202510301118.DYvzM3NK-lkp@intel.com>
References: <20251022054026.22816-2-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022054026.22816-2-pc1598@mainlining.org>

Hi Piyush,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piyush-Raj-Chouhan/arm64-dts-qcom-sm8150-Add-support-for-Xiaomi-Redmi-K20-Pro/20251022-134317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022054026.22816-2-pc1598%40mainlining.org
patch subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Add support for Xiaomi Redmi K20 Pro
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251030/202510301118.DYvzM3NK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301118.DYvzM3NK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301118.DYvzM3NK-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts:514.2-18 Properties must precede subnodes
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

