Return-Path: <linux-arm-msm+bounces-23171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A000E90E1BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 04:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464A71F23094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 02:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C73F4D8DC;
	Wed, 19 Jun 2024 02:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIrbL4kZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F85A38;
	Wed, 19 Jun 2024 02:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718765684; cv=none; b=BPgfyg0OGzMgJCa6UsQOLgem8dfBASWu8ds1KIKRQa4zCjBCvpTfwBOxLVFgnCHD/REQHs0jEYx/8IvSYJgBAZIJY7WEY8p9Qogz/DufwvrOzA1pgQpvxKLXMOHx76jKyEbUck5lER/noSERaw+j2mIV31G5r6FaHYCizdUUkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718765684; c=relaxed/simple;
	bh=ruiJuo0TcIPww1MKnKhDXKjJpEPkKk7FFb1iT/KeR1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZ7cO9omln9venX/dP7HTOAqPLfQVf2waxipZ5GcoiBFeLDPatzbE50FKO8Lt8nrzC2edWVUNaZz9WuRhBzFXBBOXIAUmCR4wEmVsksoNrZVLvxn5/YKiHQUW5znQ7w5+eI70XW2JXrKF0CGA04yCX5MWEVxzKyWoA2nMFtVE54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIrbL4kZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718765682; x=1750301682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ruiJuo0TcIPww1MKnKhDXKjJpEPkKk7FFb1iT/KeR1I=;
  b=KIrbL4kZ3bH10kAUukPQniCzEdRyOQ4IyU5t7WNtlIwQTiGvf3ca0BsZ
   9fbcrMsDKYWbO185AEg1vknMDv2ouTHbXLQsbEwnWIHjAsVMthbmpOBgg
   +1hq8oTUfSEX5ggj6fT+h50/FcOK7PTCBrqH5hY9wqOYsEQe67agbSD3J
   L7PeTGPdgE5T86ql05fMcag2IPFM5pPQktR7opC/zKQ9TYZqenjyQiNC6
   SLuR552WBt3KnDYplhw061DoLZIi6AujCOZ7Upt3dq6FHfpnpwBF6vYOh
   K4yaHO7xPf9JqCrKQxlbqjjftoBEvpAutfglAU8vnulaezkER4WVWJuel
   w==;
X-CSE-ConnectionGUID: U/8bMd1kSuCe5sCm2Q+O7A==
X-CSE-MsgGUID: Jn7KZuO4TTe62OekxBI7yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27098706"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27098706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:54:41 -0700
X-CSE-ConnectionGUID: REFS4McYQWKbyGSnAE9OGA==
X-CSE-MsgGUID: ve6VOm3WTSi6RXgIBjiO6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="41860800"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2024 19:54:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJlT1-0006Cw-34;
	Wed, 19 Jun 2024 02:54:35 +0000
Date: Wed, 19 Jun 2024 10:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Manikantan R <quic_manrav@quicinc.com>
Subject: Re: [PATCH 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling
 vi channels
Message-ID: <202406191005.yMuWtspN-lkp@intel.com>
References: <20240618-lpass-wsa-vi-v1-2-416a6f162c81@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-lpass-wsa-vi-v1-2-416a6f162c81@linaro.org>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-lpass-wsa-macro-Fix-vi-feedback-rate/20240618-221030
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240618-lpass-wsa-vi-v1-2-416a6f162c81%40linaro.org
patch subject: [PATCH 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
config: i386-buildonly-randconfig-002-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191005.yMuWtspN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191005.yMuWtspN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191005.yMuWtspN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/lpass-wsa-macro.c:999:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     999 |         default:
         |         ^
   sound/soc/codecs/lpass-wsa-macro.c:999:2: note: insert 'break;' to avoid fall-through
     999 |         default:
         |         ^
         |         break; 
>> sound/soc/codecs/lpass-wsa-macro.c:1238:6: warning: variable 'tx_reg0' set but not used [-Wunused-but-set-variable]
    1238 |         u32 tx_reg0, tx_reg1;
         |             ^
>> sound/soc/codecs/lpass-wsa-macro.c:1238:15: warning: variable 'tx_reg1' set but not used [-Wunused-but-set-variable]
    1238 |         u32 tx_reg0, tx_reg1;
         |                      ^
   3 warnings generated.


vim +/tx_reg0 +1238 sound/soc/codecs/lpass-wsa-macro.c

0c27e978419e7e Srinivas Kandagatla 2024-06-18  1231  
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1232  static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1233  					struct snd_kcontrol *kcontrol,
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1234  					int event)
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1235  {
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1236  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1237  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05 @1238  	u32 tx_reg0, tx_reg1;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1239  	u32 rate_val;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1240  
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1241  	switch (wsa->pcm_rate_vi) {
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1242  	case 8000:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1243  		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1244  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1245  	case 16000:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1246  		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1247  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1248  	case 24000:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1249  		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1250  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1251  	case 32000:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1252  		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1253  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1254  	case 48000:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1255  		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1256  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1257  	default:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1258  		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1259  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18  1260  	}
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1261  
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1262  	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1263  		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1264  		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1265  	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1266  		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1267  		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1268  	}
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1269  
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1270  	switch (event) {
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1271  	case SND_SOC_DAPM_POST_PMU:
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1272  			/* Enable V&I sensing */
0c27e978419e7e Srinivas Kandagatla 2024-06-18  1273  		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1274  		break;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1275  	case SND_SOC_DAPM_POST_PMD:
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1276  		/* Disable V&I sensing */
0c27e978419e7e Srinivas Kandagatla 2024-06-18  1277  		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1278  		break;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1279  	}
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1280  
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1281  	return 0;
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1282  }
2c4066e5d428d4 Srinivas Kandagatla 2020-11-05  1283  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

