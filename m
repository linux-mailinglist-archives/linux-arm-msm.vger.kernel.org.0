Return-Path: <linux-arm-msm+bounces-26813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E3939168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 17:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EEDB280BD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 15:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6A616DEB9;
	Mon, 22 Jul 2024 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kl/safPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D7F16DC3D;
	Mon, 22 Jul 2024 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660814; cv=none; b=Ux9AB1Z9Cvv22lPAEJ1M8UDe4UhpzUy2468bhLeVBpKQFQpvL+CwbFTOUVhD9tH5BP8IhSYj3CY1V7HyiPDt1FMq6YQ1PhEGFoGU4sfcLr4Be0/a4Qvigg2Ty08zLbUV9C/fWCNy8fYIuVQgyNiiFdGkCY9wOMOGdoJe3cpoS54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660814; c=relaxed/simple;
	bh=aZ7BsDnXlA3I6klMj9Z+4CCz2vqZVb0ofDti2dlrCzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyGJXC2oLi26mdtttH7yVCJzjZaMxSx85n1LIG6k+dXjtX8cBAviwAP3xvlj0BYbHW0FqdLU9AaNchnlW/eiGJ5K45zPWUpPw1J6w8tjrh54b5Xn/qWn56IeITFpEBBrfkv+UWwPyUQkArQMjy7k2viktOvSJTVYNahvG3mEaSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kl/safPF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721660812; x=1753196812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aZ7BsDnXlA3I6klMj9Z+4CCz2vqZVb0ofDti2dlrCzA=;
  b=kl/safPF5qW02GrIE/h0isHMFjbfAmIrHHCVWRZv61PmNS88UyBwrg5J
   7kK5Pg+r2d6Si5QIEWYbYcHbN6Q6QngtFwHTH94X+q0G8DnPcASv9yGDO
   KUFVImJhH8/QIsP/Mdmphgaa4cWzDGuQqwq5pf7BK1sdXkFh5XYjjKtkL
   GYv8yLrNR+F2vArri5xADf7zP50MdocJ1LIENkkZnRkd+Nc0EZlecoF2S
   Kd0CB0QK58hhFbQCD5UpFLz6AwPGYO/pcW/JkAbMaV29WGUEurmpAewfc
   hcDBcJdoJOQFmxTtS+3ZRckWiqZpIb4e+JQZPsWtPx+9Ap9uXd0a8NR2w
   g==;
X-CSE-ConnectionGUID: EdiDnQ2cReKJfH9jB/GkMA==
X-CSE-MsgGUID: g8jHfjAiSBmk+wK16bVGWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="22135497"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="22135497"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 08:06:51 -0700
X-CSE-ConnectionGUID: SxwhqaicQ7iJTK0IQswn0g==
X-CSE-MsgGUID: 7XGkkMdQTEGWUnBUK4nv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="52515983"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2024 08:06:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVucd-000lCi-1o;
	Mon, 22 Jul 2024 15:06:43 +0000
Date: Mon, 22 Jul 2024 23:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH 4/4] ASoC: qcom: apq8016_sbc: Add support for
 msm8953/msm8976 SoC
Message-ID: <202407222218.NKjhMM5n-lkp@intel.com>
References: <20240722095147.3372-5-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722095147.3372-5-a39.skl@gmail.com>

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10]
[also build test WARNING on linus/master next-20240722]
[cannot apply to broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Skladowski/ASoC-qcom-apq8016_sbc-c-Add-Quinary-support/20240722-181331
base:   v6.10
patch link:    https://lore.kernel.org/r/20240722095147.3372-5-a39.skl%40gmail.com
patch subject: [PATCH 4/4] ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240722/202407222218.NKjhMM5n-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407222218.NKjhMM5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407222218.NKjhMM5n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/qcom/apq8016_sbc.c:6:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/qcom/apq8016_sbc.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/qcom/apq8016_sbc.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/qcom/apq8016_sbc.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/qcom/apq8016_sbc.c:250:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     250 |         if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/apq8016_sbc.c:252:6: note: uninitialized use occurs here
     252 |         if (ret)
         |             ^~~
   sound/soc/qcom/apq8016_sbc.c:250:2: note: remove the 'if' if its condition is always true
     250 |         if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     251 |                 ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
>> sound/soc/qcom/apq8016_sbc.c:250:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     250 |         if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/apq8016_sbc.c:252:6: note: uninitialized use occurs here
     252 |         if (ret)
         |             ^~~
   sound/soc/qcom/apq8016_sbc.c:250:6: note: remove the '&&' if its condition is always true
     250 |         if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/apq8016_sbc.c:238:15: note: initialize the variable 'ret' to silence this warning
     238 |         int mi2s, ret;
         |                      ^
         |                       = 0
   19 warnings generated.


vim +250 sound/soc/qcom/apq8016_sbc.c

   231	
   232	static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
   233	{
   234		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   235		struct snd_soc_card *card = rtd->card;
   236		struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
   237		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   238		int mi2s, ret;
   239	
   240		mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
   241		if (mi2s < 0)
   242			return mi2s;
   243	
   244		if (++data->mi2s_clk_count[mi2s] > 1)
   245			return 0;
   246		/*
   247		 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
   248		 * so we have to request clock from machine driver using V1 API)
   249		 */
 > 250		if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
   251			ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
   252		if (ret)
   253			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
   254	
   255		ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
   256		if (ret)
   257			dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
   258		return ret;
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

