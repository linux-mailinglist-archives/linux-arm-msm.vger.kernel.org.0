Return-Path: <linux-arm-msm+bounces-3471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F59805AEC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 18:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C5981F21E36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 17:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CDF692A6;
	Tue,  5 Dec 2023 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYqKDZYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20464A9;
	Tue,  5 Dec 2023 09:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701796392; x=1733332392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BmifUTMaKj9dY4/DK95TnLsaZxvxHwv5Do/Twvz99vk=;
  b=TYqKDZYvjw9GhQCnF+VMSEXEXZsOuiGCpqDGxXauUJSrlOLL5d+qQMK8
   Xt5ly7QWGeTkrWHuvC/f4Th6TGPoG/VFEfsXMLcnyvGpDD205B5sniJGk
   uK4EPjl3aGFGwluB6Vra1ojBQOeRYnLq+y6VrM0XPK+mYVP9KTjaF7qua
   NlpnDdwTfkF7b95ShWYw+TwxtrmOrMF4hphH0JjWqL2TxSqrcGf5hsK6f
   6zXSPkgYjcgoyKtBuoHmtoqEx09BLyN0nwNrjSgKimXeyO14/bC+anzME
   MMp37CDvdkr00zzdmhCqsrXVwq49oe8bIreMqmKsw8NBPTZ7tHslZreaL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="984046"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="984046"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861813064"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="861813064"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 09:13:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYyl-0009Qk-27;
	Tue, 05 Dec 2023 17:13:03 +0000
Date: Wed, 6 Dec 2023 01:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <202312060158.z29IZpw9-lkp@intel.com>
References: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>

Hi Neil,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
config: arm64-randconfig-r123-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060158.z29IZpw9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060158.z29IZpw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060158.z29IZpw9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: typec_switch_set
   >>> referenced by wcd939x.c
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_swap_gnd_mic) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

