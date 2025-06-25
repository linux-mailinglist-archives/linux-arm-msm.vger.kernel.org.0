Return-Path: <linux-arm-msm+bounces-62271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C11AE76E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 08:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D05A97A938F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 06:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9AD1E990E;
	Wed, 25 Jun 2025 06:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDn6Q2vH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ADE23AD;
	Wed, 25 Jun 2025 06:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832310; cv=none; b=Pw9448DADMhADGZGJv+eFerQcylpF/SHqnqnPvdWlG4qwHwves2we5mDQDfPiW6N5LIFerfqS3ktEOgOQDooPAswigg48mGSUbOfj+T0/2ajzw4SsDhpcGpwjOG0y6ggJIlZ7EGOKEs9o0MTvbLoU90EzSGWTQUgLSWsFxqsUJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832310; c=relaxed/simple;
	bh=v8dGxdpXvhwjMLSxtF/xObVxeM0eFoe68UmmiFX3esY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIo0YI3myhP0Jf3/jJmbDi8vT6a1S7PsX5qOYpKJw6xtN3qd6KoTAL7PKKEYC0ooeU8WZ27HjClP/9OyXYMbpsB7riJQxFyz0/ty/0qz3mRVg9+A11DKzaxn7e79C6CK5r5cOE2NBhwTIW9Qr9B6hU6pmq2735hZ8PnfcXssGTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDn6Q2vH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750832308; x=1782368308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8dGxdpXvhwjMLSxtF/xObVxeM0eFoe68UmmiFX3esY=;
  b=LDn6Q2vHZG0rMXB0T95iwUg1HA07fH1Pyej/kB7dIqAM8yOjXiNCL0lP
   7BigNKszp1hTV4AhMZna5W4KULzFUZjUOrw8Iq8hf7jtnHhE3sA0kiR09
   iRebdbJopnrhSLAJ4lolwyW5U5lq5BbkTUco7v6LdcLwYZvPTE/4s97d0
   ewuHMTpvXbinxNGPByYsN+c9/GSWJlNDF/rzx1x1ruSnvayJ/XeIYF/p7
   it3X941eU7ash1y9draCTfJ+RUREiv6L5KrszVovzXzemUK4HYEglgMFh
   cb1rbILwW2qsvkBFFdUj0pBsj56vLGJkvoCyL9ss8lLfYgtV+hCK5aXmu
   Q==;
X-CSE-ConnectionGUID: ZUP59z1eTI2YEcS9BTlLZA==
X-CSE-MsgGUID: Het6v8EkR5KuveHWIg8EqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63351727"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="63351727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:18:06 -0700
X-CSE-ConnectionGUID: 61QiRcVBRhaW/fx0UykyOw==
X-CSE-MsgGUID: SyFgvC+DRVaCzbOgdTJ5wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="157624492"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2025 23:18:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUJSI-000So2-0t;
	Wed, 25 Jun 2025 06:17:58 +0000
Date: Wed, 25 Jun 2025 14:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>, Len Brown <len.brown@intel.com>,
	Benno Lossin <lossin@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>,
	Hong Zhu <vanyang@smail.nju.edu.cn>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
Message-ID: <202506251320.oOPGzTPQ-lkp@intel.com>
References: <20250617092929.1492750-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617092929.1492750-4-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-vendor-prefixes-Add-Ntmer/20250617-173338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250617092929.1492750-4-mitltlatltl%40gmail.com
patch subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for Ntmer TW220
config: arm64-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250625/202506251320.oOPGzTPQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251320.oOPGzTPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251320.oOPGzTPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts:751.1-10 Label or path gpi_dma0 not found
>> Error: arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts:755.1-10 Label or path gpi_dma1 not found
>> Error: arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts:759.1-10 Label or path gpi_dma2 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

