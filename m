Return-Path: <linux-arm-msm+bounces-72408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6AB4775A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 23:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA0416B86D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 21:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245631DFDA1;
	Sat,  6 Sep 2025 21:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcJc2737"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC51C84B8;
	Sat,  6 Sep 2025 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757193393; cv=none; b=naWYYtM2x6aLwafPlns78IHjRHko/FFjKgv0iMY1GktpD+pTBSsTbSkRna2PM/jHCnKIISZr0FdrfIl5iULsfdDr0FVd4Z2zghVrSjxRUcItHczUSFMeBtDGqbWW3/YxrjwHRjTIYfYjKSlYR1LUQ1xirP+uzLqAwIrsA3dX1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757193393; c=relaxed/simple;
	bh=i6CUUxly2IJ+rfNNC5LP5pWnMei5uz2TtnCN/pi8/aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZAj0fGxaENoOORUbhsCJEMaYlODkX1uQVCBv9H6n2KIe6XoHx7fxA2wuxMzrLDsAxkkEZbp0rgeiq0GVZ1MTa4P6ChNsTvouS6ybW9DoMCVnGu9A57VQOZ5Odjfkr+xD+wab/LMkJyVUSTj4QXB9aR1nprs6uc+9arG+pmPuAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcJc2737; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757193391; x=1788729391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6CUUxly2IJ+rfNNC5LP5pWnMei5uz2TtnCN/pi8/aI=;
  b=QcJc2737IUP6tyrZn4YBX8W8Nrn79mzKi1wh8qCSwgPdyYMR+eaXZq0h
   Yi5GOkvL8HihkhGwhfTP+ecCDgu1PhjNktiytIDpgRziDnMqQdYvPlc9s
   dvY5LFdPpqXyB4GGJJv2ha9TBtR076mDW0oVU2DIsKep5ETzyt+3K2vi4
   fl3lW9LuEkbrhckQe60DtnvpDUPBbQBiyXZ7pWIjjdDYpKcxUd9K9cCmn
   mQZCb2661szdVfrz90cuIoLSsEymHQ0lLE5lV6GWuJUrKjCtF3lwXHSLN
   SWeaFdroBKRtyhVEWWPVGEG6Gs/dWhR5uP8lJfHalxvxohajVyc24pbX8
   Q==;
X-CSE-ConnectionGUID: qzWZW6VJQYavMGjfIyzYcA==
X-CSE-MsgGUID: N2stPripSz+ox6AdO/PCzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="62131844"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="62131844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 14:16:30 -0700
X-CSE-ConnectionGUID: NZb7BFmIS2WbeOzrA9ejkw==
X-CSE-MsgGUID: XDZRCbTWTKCQHCAkhoU+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172366459"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Sep 2025 14:16:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv0Gm-0001nZ-2G;
	Sat, 06 Sep 2025 21:16:24 +0000
Date: Sun, 7 Sep 2025 05:15:56 +0800
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
Subject: Re: [PATCH v3 07/12] ASoC: codecs: wcd-common: move WCD_SDW_CH to
 common
Message-ID: <202509070539.WhfiRSpY-lkp@intel.com>
References: <20250905154430.12268-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-8-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-wcd937x-set-the-comp-soundwire-port-correctly/20250905-234841
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250905154430.12268-8-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v3 07/12] ASoC: codecs: wcd-common: move WCD_SDW_CH to common
config: x86_64-buildonly-randconfig-001-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070539.WhfiRSpY-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070539.WhfiRSpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070539.WhfiRSpY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/wcd937x.h:10,
                    from sound/soc/codecs/wcd937x.c:26:
>> sound/soc/codecs/wcd-common.h:17:8: error: redefinition of 'struct wcd_sdw_ch_info'
      17 | struct wcd_sdw_ch_info {
         |        ^~~~~~~~~~~~~~~
   In file included from sound/soc/codecs/wcd937x.c:24:
   sound/soc/codecs/wcd-common.h:17:8: note: originally defined here
      17 | struct wcd_sdw_ch_info {
         |        ^~~~~~~~~~~~~~~
>> sound/soc/codecs/wcd-common.h:28:8: error: redefinition of 'struct wcd_common'
      28 | struct wcd_common {
         |        ^~~~~~~~~~
   sound/soc/codecs/wcd-common.h:28:8: note: originally defined here
      28 | struct wcd_common {
         |        ^~~~~~~~~~
>> sound/soc/codecs/wcd-common.h:36:5: error: conflicting types for 'wcd_dt_parse_micbias_info'; have 'int(struct wcd_common *)'
      36 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wcd-common.h:36:5: note: previous declaration of 'wcd_dt_parse_micbias_info' with type 'int(struct wcd_common *)'
      36 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wcd937x.c: In function 'wcd937x_connect_port':
>> sound/soc/codecs/wcd937x.c:1186:53: error: initialization of 'const struct wcd937x_sdw_ch_info *' from incompatible pointer type 'struct wcd_sdw_ch_info *' [-Werror=incompatible-pointer-types]
    1186 |         const struct wcd937x_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
         |                                                     ^
>> sound/soc/codecs/wcd937x.c:1187:30: error: invalid use of undefined type 'const struct wcd937x_sdw_ch_info'
    1187 |         u8 port_num = ch_info->port_num;
         |                              ^~
   sound/soc/codecs/wcd937x.c:1188:29: error: invalid use of undefined type 'const struct wcd937x_sdw_ch_info'
    1188 |         u8 ch_mask = ch_info->ch_mask;
         |                             ^~
   sound/soc/codecs/wcd937x.c:1195:31: error: invalid use of undefined type 'const struct wcd937x_sdw_ch_info'
    1195 |         mstr_ch_mask = ch_info->master_ch_mask;
         |                               ^~
   sound/soc/codecs/wcd937x.c: In function 'wcd937x_mbhc_micb_ctrl_threshold_mic':
   sound/soc/codecs/wcd937x.c:1522:20: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
    1522 |         if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
         |                    ^~
   sound/soc/codecs/wcd937x.c:1525:61: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
    1525 |         micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
         |                                                             ^~
   sound/soc/codecs/wcd937x.c: In function 'wcd937x_set_micbias_data':
   sound/soc/codecs/wcd937x.c:2432:34: error: 'struct wcd937x_priv' has no member named 'commmon'; did you mean 'common'?
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
   sound/soc/codecs/wcd937x.c:2897:41: error: passing argument 1 of 'wcd_dt_parse_micbias_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2897 |         ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
         |                                         ^~~
         |                                         |
         |                                         struct device *
   sound/soc/codecs/wcd-common.h:36:50: note: expected 'struct wcd_common *' but argument is of type 'struct device *'
      36 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
         |                               ~~~~~~~~~~~~~~~~~~~^~~~~~
   sound/soc/codecs/wcd937x.c:2897:15: error: too many arguments to function 'wcd_dt_parse_micbias_info'
    2897 |         ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wcd-common.h:36:5: note: declared here
      36 | int wcd_dt_parse_micbias_info(struct wcd_common *common);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wcd937x.c:2905:31: error: 'struct wcd937x_priv' has no member named 'micb2_mv'
    2905 |         cfg->micb_mv = wcd937x->micb2_mv;
         |                               ^~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/wcd937x-sdw.c: In function 'wcd9370_probe':
>> sound/soc/codecs/wcd937x-sdw.c:1075:40: error: 'struct wcd_sdw_ch_info' has no member named 'master_ch_mask'
    1075 |                         wcd->ch_info[i].master_ch_mask = WCD937X_SWRM_CH_MASK(master_ch_mask[i]);
         |                                        ^
   sound/soc/codecs/wcd937x-sdw.c:1092:40: error: 'struct wcd_sdw_ch_info' has no member named 'master_ch_mask'
    1092 |                         wcd->ch_info[i].master_ch_mask = WCD937X_SWRM_CH_MASK(master_ch_mask[i]);
         |                                        ^


vim +17 sound/soc/codecs/wcd-common.h

    16	
  > 17	struct wcd_sdw_ch_info {
    18		int port_num;
    19		unsigned int ch_mask;
    20	};
    21	
    22	#define WCD_SDW_CH(id, pn, cmask)	\
    23		[id] = {			\
    24			.port_num = pn,		\
    25			.ch_mask = cmask,	\
    26		}
    27	
  > 28	struct wcd_common {
    29		struct device *dev;
    30		int max_bias;
    31		u32 micb_mv[WCD_MAX_MICBIAS];
    32		u32 micb_vout[WCD_MAX_MICBIAS];
    33	};
    34	
    35	int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
  > 36	int wcd_dt_parse_micbias_info(struct wcd_common *common);
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

