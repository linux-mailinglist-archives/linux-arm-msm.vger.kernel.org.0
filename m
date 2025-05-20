Return-Path: <linux-arm-msm+bounces-58812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8800ABE63F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CE3D17DBED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479A225E818;
	Tue, 20 May 2025 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azUdx4vz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E01025E834;
	Tue, 20 May 2025 21:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777426; cv=none; b=FEeF3CWOcsbnOtpjdn2N9I6Ozjif2gLFxG3GKdTd+A0ED71/0MKp7NeVtAbMvoUJBy8EK8D1J5gRbcrhpjT1b2SujuccwEPFEKSLFYsXgRb6QgS3Ve54q0bJDBSAU22NlwAJuePiVSmGCoXPGHwj6w3A5oHB9vyl6aWQS/JSDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777426; c=relaxed/simple;
	bh=3Uwzu0x4Ol7jQHWlBgnHzcOFIw3Xt2G7jzzTCuvsxA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ls9HlOzPGG4CVFBDzwLkF1tXyknypjMJvg75wTwiioCjIJFiopl6KXrSoSsWpeypfFV4OMCi4xd0jxpySEjRv5ZURZ0FmQvhMtY5/iwLJzg840wnZwqwRadzUJ5VvsWeC42+hWNX1qYxVWXwIbYjyGzv8apSULFe5j8kUPyB2qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azUdx4vz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747777424; x=1779313424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Uwzu0x4Ol7jQHWlBgnHzcOFIw3Xt2G7jzzTCuvsxA8=;
  b=azUdx4vzotGu0CYUKO3vh3ScAZ+l+10KiEau6TGXRIYQht+S2hBBNvvK
   68xkvQ94PojbKrPcFHJ3Tehv/lnHxfGavzRvS63uehGTlQhHrJK8i5u5k
   MmSjZL1Ix6nnW/vNu3j34WCB78uM2UUUjkv6S/8WFAhJXa1C8ozSLtCdG
   9wI7IdVIihH6+JeuxyaURjKbIEWpcP/HI9J08bYgMTdc1RMyu+GrDTIQL
   7vsD4kIfuYDGWwy+j8/fxi/JLFn4zuc2SOplS95r7yehcl4/Dhj6OpTC/
   4wlhfDANR1s3wN7QYM5Kqlt3D9GLztN/pi0+LrPeEPs4tKAa2XNh6lbi2
   Q==;
X-CSE-ConnectionGUID: ZWaH8tt1RNqe+g7zulRMgA==
X-CSE-MsgGUID: OpCSTDmiRAm/sPAkgyR3tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49435925"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49435925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:43:43 -0700
X-CSE-ConnectionGUID: 3+/Jn4AWQHeWHUJykGSFxg==
X-CSE-MsgGUID: EXveqf+TQbqRz9yutsdNTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139721317"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 14:43:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUkI-000Nb2-0B;
	Tue, 20 May 2025 21:43:34 +0000
Date: Wed, 21 May 2025 05:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ai Chao <aichao@kylinos.cn>, johannes@sipsolutions.net, perex@perex.cz,
	tiwai@suse.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, jbrunet@baylibre.com,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, srinivas.kandagatla@linaro.org,
	kuninori.morimoto.gx@renesas.com, zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org, ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com, alexey.klimov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: meson: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <202505210557.EpJig9BQ-lkp@intel.com>
References: <20250520091131.4150248-5-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520091131.4150248-5-aichao@kylinos.cn>

Hi Ai,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus wireless-next/main wireless/main linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ai-Chao/ASoC-ppc-Use-helper-function-for_each_child_of_node_scoped/20250520-171556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250520091131.4150248-5-aichao%40kylinos.cn
patch subject: [PATCH 4/6] ASoC: meson: Use helper function for_each_child_of_node_scoped()
config: arc-randconfig-002-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210557.EpJig9BQ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210557.EpJig9BQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210557.EpJig9BQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/sound/soc.h:15,
                    from sound/soc/meson/meson-card-utils.c:8:
   sound/soc/meson/meson-card-utils.c: In function 'meson_card_set_be_link':
>> sound/soc/meson/meson-card-utils.c:166:71: error: 'np' undeclared (first use in this function); did you mean 'up'?
     166 |                 dev_err(card->dev, "error setting %pOFn link name\n", np);
         |                                                                       ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:166:17: note: in expansion of macro 'dev_err'
     166 |                 dev_err(card->dev, "error setting %pOFn link name\n", np);
         |                 ^~~~~~~
   sound/soc/meson/meson-card-utils.c:166:71: note: each undeclared identifier is reported only once for each function it appears in
     166 |                 dev_err(card->dev, "error setting %pOFn link name\n", np);
         |                                                                       ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:166:17: note: in expansion of macro 'dev_err'
     166 |                 dev_err(card->dev, "error setting %pOFn link name\n", np);
         |                 ^~~~~~~


vim +166 sound/soc/meson/meson-card-utils.c

aa9c3b7273a58b Jerome Brunet     2020-02-13  134  
aa9c3b7273a58b Jerome Brunet     2020-02-13  135  int meson_card_set_be_link(struct snd_soc_card *card,
aa9c3b7273a58b Jerome Brunet     2020-02-13  136  			   struct snd_soc_dai_link *link,
aa9c3b7273a58b Jerome Brunet     2020-02-13  137  			   struct device_node *node)
aa9c3b7273a58b Jerome Brunet     2020-02-13  138  {
aa9c3b7273a58b Jerome Brunet     2020-02-13  139  	struct snd_soc_dai_link_component *codec;
aa9c3b7273a58b Jerome Brunet     2020-02-13  140  	int ret, num_codecs;
aa9c3b7273a58b Jerome Brunet     2020-02-13  141  
aa9c3b7273a58b Jerome Brunet     2020-02-13  142  	num_codecs = of_get_child_count(node);
aa9c3b7273a58b Jerome Brunet     2020-02-13  143  	if (!num_codecs) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  144  		dev_err(card->dev, "be link %s has no codec\n",
aa9c3b7273a58b Jerome Brunet     2020-02-13  145  			node->full_name);
aa9c3b7273a58b Jerome Brunet     2020-02-13  146  		return -EINVAL;
aa9c3b7273a58b Jerome Brunet     2020-02-13  147  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  148  
aa9c3b7273a58b Jerome Brunet     2020-02-13  149  	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
aa9c3b7273a58b Jerome Brunet     2020-02-13  150  	if (!codec)
aa9c3b7273a58b Jerome Brunet     2020-02-13  151  		return -ENOMEM;
aa9c3b7273a58b Jerome Brunet     2020-02-13  152  
aa9c3b7273a58b Jerome Brunet     2020-02-13  153  	link->codecs = codec;
aa9c3b7273a58b Jerome Brunet     2020-02-13  154  	link->num_codecs = num_codecs;
aa9c3b7273a58b Jerome Brunet     2020-02-13  155  
6c05494fd8e28e Ai Chao           2025-05-20  156  	for_each_child_of_node_scoped(node, np) {
2e1dbea1f8a358 Kuninori Morimoto 2023-06-20  157  		ret = meson_card_parse_dai(card, np, codec);
6c05494fd8e28e Ai Chao           2025-05-20  158  		if (ret)
aa9c3b7273a58b Jerome Brunet     2020-02-13  159  			return ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  160  
aa9c3b7273a58b Jerome Brunet     2020-02-13  161  		codec++;
aa9c3b7273a58b Jerome Brunet     2020-02-13  162  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  163  
aa9c3b7273a58b Jerome Brunet     2020-02-13  164  	ret = meson_card_set_link_name(card, link, node, "be");
aa9c3b7273a58b Jerome Brunet     2020-02-13  165  	if (ret)
aa9c3b7273a58b Jerome Brunet     2020-02-13 @166  		dev_err(card->dev, "error setting %pOFn link name\n", np);
aa9c3b7273a58b Jerome Brunet     2020-02-13  167  
aa9c3b7273a58b Jerome Brunet     2020-02-13  168  	return ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  169  }
aa9c3b7273a58b Jerome Brunet     2020-02-13  170  EXPORT_SYMBOL_GPL(meson_card_set_be_link);
aa9c3b7273a58b Jerome Brunet     2020-02-13  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

