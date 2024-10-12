Return-Path: <linux-arm-msm+bounces-34179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BE99B07A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 05:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 705901C210BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 03:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8FB84FAD;
	Sat, 12 Oct 2024 03:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Onmg9MY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2B41C6E;
	Sat, 12 Oct 2024 03:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728704275; cv=none; b=BoIzl74tesKgSRk/JXYmLQ/lYLNuHAcronOj1C9bly3TudMpH+pXNMh+bU8HQeFVdLOlUGV47wi/93wXtfrHx8zWO7nQovnBBpnrjyInoISln3+Mwxlf2GjywCLlu+UwzMFBe3RSHRuLl/wc2myNvbLaaheuAPBHns+XlLAP+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728704275; c=relaxed/simple;
	bh=nDTLNW21/SY6L/1mKys6bWAEfSqQxK7ebVskE/LZEU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0Y0JraxDTBDDW+CMULE8SaIr1uBl1tRpFlWxVEOJeg2g9Ox6oh20+VmKdrjHIZ60spufHSdqjYBlNtkrMrBy7eoKGM8cXKkx0hv39G4tmZR8JkvmwoMjpC6h1TG4ivQyGYyyA9mCU4ptfAqHJazd7w7u12bsnA5omw1KzwWkv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Onmg9MY+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728704274; x=1760240274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nDTLNW21/SY6L/1mKys6bWAEfSqQxK7ebVskE/LZEU4=;
  b=Onmg9MY+R2xtj3pq1bd4j6xv8QMaln1iK+m/yIU+eBW3PAio8VfWhwcw
   I1fTPbOuh1GkS46L7TyEg3oRlD7vwpT63EuytEXlofpbdWW/jmDNRKxcS
   Vt9O2TfhYMQkkI+LbKX/eu9cUOrLw1sTFxuvVCHNiMLs3zzDNvMq/YZnd
   3FWqd1QbhGexjE65qTXgRSvPKSdvsRM6fhJYLB+uJlhSTD7Uybdgd1iiK
   vPmSU+dv7iQI3HCWbNS1D0agydoBcsx+WlkmbMlNbv0CqwvPwDI3Z7Zi0
   nlqKavuxp1vwe2gr5QXf9sY/+FKhGNhP4NZs+TKayi0u+cbKrtBhe9sQt
   Q==;
X-CSE-ConnectionGUID: SEAZWXkIQgq07nDam9VJQA==
X-CSE-MsgGUID: kAMzX8qcQEGcwjzdtUlPKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45589902"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="45589902"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 20:37:54 -0700
X-CSE-ConnectionGUID: UWAFK5xlQImDOpIn5TSDug==
X-CSE-MsgGUID: /sCsxcU+TXWuOY4tkY0i7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77557665"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Oct 2024 20:37:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szSwu-000D0l-1M;
	Sat, 12 Oct 2024 03:37:48 +0000
Date: Sat, 12 Oct 2024 11:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH] ASoC: qcom: sc7280: Fix missing Soundwire runtime stream
 alloc
Message-ID: <202410121144.H6lBicv6-lkp@intel.com>
References: <20241010054109.16938-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010054109.16938-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/ASoC-qcom-sc7280-Fix-missing-Soundwire-runtime-stream-alloc/20241010-134305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20241010054109.16938-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
config: powerpc64-randconfig-r052-20241011 (https://download.01.org/0day-ci/archive/20241012/202410121144.H6lBicv6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121144.H6lBicv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121144.H6lBicv6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
>> ERROR: modpost: "qcom_snd_sdw_startup" [sound/soc/qcom/snd-soc-sc7280.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

