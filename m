Return-Path: <linux-arm-msm+bounces-72405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7BB4771F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 22:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1835A431A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 20:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCE2299923;
	Sat,  6 Sep 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkI/Kg8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C81C1F12;
	Sat,  6 Sep 2025 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757190270; cv=none; b=suELyppOARipsZV0eESwA+Ls9U19f6IH8Dsw6Rs4NFQiyqZy0rKKkUi59yxRQAL5MSqsg4U9aBXEs4F2YUlsS0SuXRSXP2SUmiI7mo+5dZRcDN7BDYj5p3DeUKsamzdim4PEWsgMzy6OpXcgl+HSAiAQ/Dy5+H/82bQ47IT6wvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757190270; c=relaxed/simple;
	bh=d0rgw9ErN7XHf7GcenPJ7lIMreKkd+NHdRQFHmR0uvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTSGYSuaWXoYqYlOYHIEmRVanx/Q5lP9/+nItv/Ppa+hetGJwpDHqMPeU5wdM0R09LW7pODzM9/ed6FGcQdxdhHALhWRn5vQ73jMTKmcDfKQ1Yjqh7IJhhJ2L9xiP7kqhO0AqPyuwKlqQl6U7ngVj0KshV4dtqS52yYL8gbzn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkI/Kg8n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757190269; x=1788726269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d0rgw9ErN7XHf7GcenPJ7lIMreKkd+NHdRQFHmR0uvA=;
  b=fkI/Kg8nzpBokzBlDYzeviEoAg4u1/4QEvHOO7r1+MC0L3bD3ayH9N7y
   uk5gikmW1c9ZfkzIMEzRBEHi9urOXUUvmtVfD8cTUDCQjBszpNC3x+xyG
   7Ld3ULxZdIQU33fvQrVzEoF647vmY2vli0RXJizWpSChRYLMiXArGAkxe
   R8wuy49k46+kV3vV0b6TPeg4ZTnsISOyLEkfP2sa+hazr3IOk5a2aqBSl
   rjCl7zdvkZh4lvRF5yDwUq8VUmzGhBl3S5uEUtNE5dMC+mLb43z7C5cyR
   skGgho/+5k5pMEboTCuqHvDTkVUmDF4JwHtulbucqyWKy3CAs1k9Nnzzx
   w==;
X-CSE-ConnectionGUID: kUZj+z2pR129XPy8M/J8GA==
X-CSE-MsgGUID: 6CbqF7d1QFi6TxmRROwk9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="59358751"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="59358751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 13:24:28 -0700
X-CSE-ConnectionGUID: n01YQ+WzSrudWDWogZFyhw==
X-CSE-MsgGUID: ZvWkfPETRgeerAi/OWwVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172541727"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Sep 2025 13:24:24 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuzSO-0001mV-39;
	Sat, 06 Sep 2025 20:24:20 +0000
Date: Sun, 7 Sep 2025 04:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, tiwai@suse.com,
	vkoul@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <202509070437.ko5lmTb9-lkp@intel.com>
References: <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-wcd937x-set-the-comp-soundwire-port-correctly/20250905-234841
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250905154430.12268-7-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd codecs
config: x86_64-buildonly-randconfig-001-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070437.ko5lmTb9-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070437.ko5lmTb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070437.ko5lmTb9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/codecs/wcd937x.c: In function 'wcd937x_mbhc_micb_ctrl_threshold_mic':
>> sound/soc/codecs/wcd937x.c:1522:20: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
    1522 |         if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
         |                    ^~
   sound/soc/codecs/wcd937x.c:1525:61: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
    1525 |         micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
         |                                                             ^~
   sound/soc/codecs/wcd937x.c: In function 'wcd937x_set_micbias_data':
>> sound/soc/codecs/wcd937x.c:2432:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
    2432 |                         wcd937x->commmon.micb_vout[0]);
         |                                  ^~~~~~~
         |                                  common
   sound/soc/codecs/wcd937x.c:2434:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
    2434 |                         wcd937x->commmon.micb_vout[1]);
         |                                  ^~~~~~~
         |                                  common
   sound/soc/codecs/wcd937x.c:2436:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
    2436 |                         wcd937x->commmon.micb_vout[2]);
         |                                  ^~~~~~~
         |                                  common
   sound/soc/codecs/wcd937x.c: In function 'wcd937x_probe':
>> sound/soc/codecs/wcd937x.c:2897:41: error: passing argument 1 of 'wcd_dt_parse_micbias_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2897 |         ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
         |                                         ^~~
         |                                         |
         |                                         struct device *
   In file included from sound/soc/codecs/wcd937x.c:24:
   sound/soc/codecs/wcd-common.h:25:50: note: expected 'struct wcd_common *' but argument is of type 'struct device *'
      25 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
         |                               ~~~~~~~~~~~~~~~~~~~^~~~~~
>> sound/soc/codecs/wcd937x.c:2897:15: error: too many arguments to function 'wcd_dt_parse_micbias_info'
    2897 |         ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wcd-common.h:25:5: note: declared here
      25 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wcd937x.c:2905:31: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
    2905 |         cfg->micb_mv = wcd937x->micb2_mv;
         |                               ^~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/wcd-common.c: In function 'wcd_dt_parse_micbias_info':
>> sound/soc/codecs/wcd-common.c:34:41: warning: '-microvolt' directive writing 10 bytes into a region of size between 9 and 19 [-Wformat-overflow=]
      34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
         |                                         ^~~~~~~~~~
   In function 'wcd_get_micbias_val',
       inlined from 'wcd_dt_parse_micbias_info' at sound/soc/codecs/wcd-common.c:61:26:
   sound/soc/codecs/wcd-common.c:34:9: note: 'sprintf' output between 24 and 34 bytes into a destination of size 32
      34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1522 sound/soc/codecs/wcd937x.c

9be3ec196da41b Prasad Kumpatla 2024-05-24  1508  
9be3ec196da41b Prasad Kumpatla 2024-05-24  1509  static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
9be3ec196da41b Prasad Kumpatla 2024-05-24  1510  						int micb_num, bool req_en)
9be3ec196da41b Prasad Kumpatla 2024-05-24  1511  {
9be3ec196da41b Prasad Kumpatla 2024-05-24  1512  	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
9be3ec196da41b Prasad Kumpatla 2024-05-24  1513  	int micb_mv;
9be3ec196da41b Prasad Kumpatla 2024-05-24  1514  
9be3ec196da41b Prasad Kumpatla 2024-05-24  1515  	if (micb_num != MIC_BIAS_2)
9be3ec196da41b Prasad Kumpatla 2024-05-24  1516  		return -EINVAL;
9be3ec196da41b Prasad Kumpatla 2024-05-24  1517  	/*
9be3ec196da41b Prasad Kumpatla 2024-05-24  1518  	 * If device tree micbias level is already above the minimum
9be3ec196da41b Prasad Kumpatla 2024-05-24  1519  	 * voltage needed to detect threshold microphone, then do
9be3ec196da41b Prasad Kumpatla 2024-05-24  1520  	 * not change the micbias, just return.
9be3ec196da41b Prasad Kumpatla 2024-05-24  1521  	 */
9be3ec196da41b Prasad Kumpatla 2024-05-24 @1522  	if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
9be3ec196da41b Prasad Kumpatla 2024-05-24  1523  		return 0;
9be3ec196da41b Prasad Kumpatla 2024-05-24  1524  
9be3ec196da41b Prasad Kumpatla 2024-05-24  1525  	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
9be3ec196da41b Prasad Kumpatla 2024-05-24  1526  
9be3ec196da41b Prasad Kumpatla 2024-05-24  1527  	return wcd937x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
9be3ec196da41b Prasad Kumpatla 2024-05-24  1528  }
9be3ec196da41b Prasad Kumpatla 2024-05-24  1529  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

