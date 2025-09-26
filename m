Return-Path: <linux-arm-msm+bounces-75238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE66BA273E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B781C04651
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 05:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB56277C9D;
	Fri, 26 Sep 2025 05:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jchZUabM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190602773E6;
	Fri, 26 Sep 2025 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758865038; cv=none; b=Nf6jg1lrGTuWThIzxhYxKqfS3D2mrPcM6PlUGsWV0V3sXMYu9/mdp1PEniqnLKTF6AXEdm3Jw6xUvAP/V1UBKSkzNlZDr8Ou63mNTsbCwmqoMfP/bFDT9P4kF3Fhh/B7Mmkm10jALTEk5qQjbflNGlWOoZe22MGQz8qAg0xPDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758865038; c=relaxed/simple;
	bh=XBtpFSVJKzXQ0qNjtHFKFElOPIss1lIui+FxMIA0hqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBy9zoHc2zBzl3PjI9+GFJ4Hk7ITb66oT7k+dAbf6oOso0LSJFYDK9Yt44MaMwfSB6o32XcP6/9Du9cf2sErQG58QoupNSAlLVp0BMwJssPXvFfDZyP1S/dDr4IDHPNy4M0CGck3IXnv8NLhGNzsD5kmwkePAXxCvYMfNwuJ6gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jchZUabM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758865035; x=1790401035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBtpFSVJKzXQ0qNjtHFKFElOPIss1lIui+FxMIA0hqQ=;
  b=jchZUabMWD8x5Fd2kt3W7agxUT93nVXGBVVyZmtYRSc2CH5p32IDItFn
   odoNUNQ1raSG03BgENdPK2k8WSwOkDEGydNY8OIOXnB5RCROj+q31azuv
   rIFVji25SVntFHUYvtMEmxWejm2piRwMKgXlk1Fhevm3fBXjSi3oLNSce
   wCpdG1VCwY4vunIin1OPDraP67i7Am8eEwLxextZLHnnLcxmTqExeZrpj
   MzsTJUSeLGzyLcqnM4BDYfFNH/BzWHG3+gSJp35TFtIwlqSLEGTv4iizp
   TnnrclQSDVZPo4JTGZ5T4tOdxtIUa5z7ckpNMhVAHtYDFZcILKv4dMnlS
   Q==;
X-CSE-ConnectionGUID: PA5PP5CYQzm3UiU0sDq2zQ==
X-CSE-MsgGUID: EIWf0zSuQbe3WF99cpQxHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60403409"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="60403409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 22:37:14 -0700
X-CSE-ConnectionGUID: Imc5zKtpRRirvIUv7DWMbQ==
X-CSE-MsgGUID: 7PrIWsRhSZuKlBo2LpuEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="176795862"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2025 22:37:10 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v218l-0005w5-0v;
	Fri, 26 Sep 2025 05:37:07 +0000
Date: Fri, 26 Sep 2025 13:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
Message-ID: <202509261315.O9CiiXjb-lkp@intel.com>
References: <20250924-knp-audio-v1-1-5afa926b567c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-audio-v1-1-5afa926b567c@oss.qualcomm.com>

Hi Jingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/ASoC-codecs-va-macro-Rework-version-checking/20250925-080338
base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
patch link:    https://lore.kernel.org/r/20250924-knp-audio-v1-1-5afa926b567c%40oss.qualcomm.com
patch subject: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.O9CiiXjb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/lpass-va-macro.c:1479:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1479 |         maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
         |               ^
   1 error generated.


vim +/FIELD_GET +1479 sound/soc/codecs/lpass-va-macro.c

  1471	
  1472	static int va_macro_set_lpass_codec_version(struct va_macro *va)
  1473	{
  1474		int version = LPASS_CODEC_VERSION_UNKNOWN;
  1475		u32 maj, min, step;
  1476		u32 val;
  1477	
  1478		regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &val);
> 1479		maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
  1480	
  1481		regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &val);
  1482		if (!FIELD_GET(CORE_ID_1_HAS_VAMACRO, val)) {
  1483			dev_err(va->dev, "This is not a VA macro instance\n");
  1484			return -ENODEV;
  1485		}
  1486	
  1487		regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &val);
  1488		min = FIELD_GET(CORE_ID_2_REV_MIN, val);
  1489		step = FIELD_GET(CORE_ID_2_REV_STEP, val);
  1490	
  1491		if (maj == 1) {
  1492			version = LPASS_CODEC_VERSION_2_0;
  1493		} else if (maj == 2) {
  1494			switch (min) {
  1495			case 0:
  1496				version = LPASS_CODEC_VERSION_2_0;
  1497				break;
  1498			case 5:
  1499				version = LPASS_CODEC_VERSION_2_5;
  1500				break;
  1501			case 6:
  1502				version = LPASS_CODEC_VERSION_2_6;
  1503				break;
  1504			case 7:
  1505				version = LPASS_CODEC_VERSION_2_7;
  1506				break;
  1507			case 8:
  1508				version = LPASS_CODEC_VERSION_2_8;
  1509				break;
  1510			case 9:
  1511				version = LPASS_CODEC_VERSION_2_9;
  1512				break;
  1513			default:
  1514				break;
  1515			}
  1516		}
  1517	
  1518		if (version == LPASS_CODEC_VERSION_UNKNOWN) {
  1519			dev_err(va->dev, "VA Macro v%u.%u.%u is not supported\n",
  1520				maj, min, step);
  1521			return -EOPNOTSUPP;
  1522		}
  1523	
  1524		lpass_macro_set_codec_version(version);
  1525	
  1526		dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));
  1527	
  1528		return 0;
  1529	}
  1530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

