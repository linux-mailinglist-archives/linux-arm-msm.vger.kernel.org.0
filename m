Return-Path: <linux-arm-msm+bounces-72550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D720BB48A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9075416AFF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38A82F99AA;
	Mon,  8 Sep 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APkbeUll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC02F90CE;
	Mon,  8 Sep 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328089; cv=none; b=V2VfDaaXNW0aKemLr8qHDrP+vLAGPM78p7rN1TuqJV3NorNXBQ75NecyVGn5JbmliZ7V9/C3hJa24Bwpse5odrzZ0c6zLlExsxIVkISD25pIVGiFjZ9QMDdUtouTbgpF/23816ogQGEKH98zpweV6Vpu47jVW06E682wENlXj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328089; c=relaxed/simple;
	bh=nOUtFuHlk/j0pOjb0/mvPkxl+LtCujwsXtiWGXGRNxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZ2RL7XYcdQW3OH4Wke34xvsEc1LQDCvhDE/f9vzateG03lU2bYryoUet+XDDEaH+CwZeCgnafZ2wTVg+Xe17VYDjAnfidmAWGv3glfqrpaMVMsoo9YrKjouAEI57dQCxZsvn5VIBW10vggc4UfxV34rx7ni/Uqw/hql6enVkZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APkbeUll; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757328088; x=1788864088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOUtFuHlk/j0pOjb0/mvPkxl+LtCujwsXtiWGXGRNxU=;
  b=APkbeUllhan/TbjOK0/mWR39SWK5LOOeurfljJK9WUzagVgwMv/CYW/p
   sf+GPbDGWhgN11zIh3KFRSmNUa7kQdmXdJe4yMx+LYVwyvLED/j57y1nq
   jKY7TaMj9e2AvOLQz1dOhAwuXRd7klVmjUI3UdakHhsSv494o17NaFbMA
   dUH+WOIsrbrBXPDgp/E9+a6wgirsiez0M1xqQLb/Hlx8sKOT0V1iV2rNj
   Fp5BgcdJUqCbK1JTcxBUqcvz/kJ4hVnNG51L+gagWEuq6VOESUB/q/bqP
   szqo2ur+DLzpiQBtQVHOtgGvzSf33l3pWmCJLTJfhnx4sPHbQRmL1Sr5X
   w==;
X-CSE-ConnectionGUID: xFPNKKtNRsayXokBfDohYg==
X-CSE-MsgGUID: ubMXzGk5T8iUfarNPFW9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63408374"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63408374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:41:27 -0700
X-CSE-ConnectionGUID: T17NMXmqTBa4QL/Py/YsOw==
X-CSE-MsgGUID: y6i9kVS8SauaAWkYwxatGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172344801"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2025 03:41:24 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvZJK-0003jr-20;
	Mon, 08 Sep 2025 10:41:22 +0000
Date: Mon, 8 Sep 2025 18:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, tiwai@suse.com,
	vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, srini@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v4 07/13] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <202509081839.R4vv3FST-lkp@intel.com>
References: <20250907112201.259405-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907112201.259405-8-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.17-rc5 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-wcd937x-set-the-comp-soundwire-port-correctly/20250907-192533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250907112201.259405-8-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v4 07/13] ASoC: codecs: wcd: add common helper for wcd codecs
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250908/202509081839.R4vv3FST-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081839.R4vv3FST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081839.R4vv3FST-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wcd-common.c: In function 'wcd_dt_parse_micbias_info':
>> sound/soc/codecs/wcd-common.c:34:51: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
      34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
         |                                                   ^
   In function 'wcd_get_micbias_val',
       inlined from 'wcd_dt_parse_micbias_info' at sound/soc/codecs/wcd-common.c:61:26:
   sound/soc/codecs/wcd-common.c:34:9: note: 'sprintf' output between 24 and 33 bytes into a destination of size 32
      34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +34 sound/soc/codecs/wcd-common.c

    28	
    29	static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
    30	{
    31		char micbias[32];
    32		int mv;
    33	
  > 34		sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
    35	
    36		if (of_property_read_u32(dev->of_node, micbias, &mv)) {
    37			dev_err(dev, "%s value not found, using default\n", micbias);
    38			mv = WCD_DEF_MICBIAS_MV;
    39		} else {
    40			/* convert it to milli volts */
    41			mv = mv/1000;
    42		}
    43		if (micb_mv)
    44			*micb_mv = mv;
    45	
    46		mv = wcd_get_micb_vout_ctl_val(dev, mv);
    47		if (mv < 0) {
    48			dev_err(dev, "Unsupported %s voltage (%d mV), falling back to default (%d mV)\n",
    49					micbias, mv, WCD_DEF_MICBIAS_MV);
    50			return wcd_get_micb_vout_ctl_val(dev, WCD_DEF_MICBIAS_MV);
    51		}
    52	
    53		return mv;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

