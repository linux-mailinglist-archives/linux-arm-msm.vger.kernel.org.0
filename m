Return-Path: <linux-arm-msm+bounces-3513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F0806806
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 08:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E51491F215CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 07:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63B15499;
	Wed,  6 Dec 2023 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfORvOVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2403C135;
	Tue,  5 Dec 2023 23:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701846676; x=1733382676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xffnH9F5/s2eglTFcbaIqO0o3VhqJC3mGV+1KbfvF1U=;
  b=VfORvOVIC7YOn3ELU3BleiEeRPduebZE2GKvIZdqCqW+a38IM8D5aun0
   cYAGI0udZn0E9IDuUW7h4aXGMoGdQyiDqXuqQcJelJA6nqsh4MqFVFHav
   AbqsHmvSteFfumkXW2tDvqtcwomOAbOwLVbNZEChXRhklgGfxGlsStzLb
   SMIAubf5bnIksCmeC25WB+6+huinhwr8RRreivZmaaWzkoY2EaMBdRyKs
   bU6py/IJEfGVrMf3OLVM4SRW4+xSbf+D+NdKJXLvBvsKm7jjI2KOjC9L7
   N3gPVRb2xSuaH82C+5dDpOYR+2y2ML+FD6Sliall8s1DmfGhirTj6bgcm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480215905"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="480215905"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 23:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="862019409"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="862019409"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 23:11:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAm3m-000ARm-1q;
	Wed, 06 Dec 2023 07:11:07 +0000
Date: Wed, 6 Dec 2023 15:10:44 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <202312061428.ck8TrWdU-lkp@intel.com>
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
config: x86_64-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231206/202312061428.ck8TrWdU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061428.ck8TrWdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061428.ck8TrWdU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: typec_switch_unregister
   >>> referenced by wcd939x.c:3610 (sound/soc/codecs/wcd939x.c:3610)
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fwnode_typec_switch_get
   >>> referenced by wcd939x.c:3369 (sound/soc/codecs/wcd939x.c:3369)
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_bind) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: typec_switch_put
   >>> referenced by wcd939x.c:3483 (sound/soc/codecs/wcd939x.c:3483)
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_bind) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

