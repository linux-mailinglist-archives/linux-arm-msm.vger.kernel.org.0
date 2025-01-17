Return-Path: <linux-arm-msm+bounces-45460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE09A15699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 19:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18DDB188A701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA901A726B;
	Fri, 17 Jan 2025 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixAvVGxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD81A4F0C;
	Fri, 17 Jan 2025 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737138625; cv=none; b=ExWlnPqkpQLYoxLc4ttkJgrS9Fr2oSVXN3dpanTFLRlZv8iozQhWgswl4R2D/yxQwrEalQtLF7Es1ASFEzDvfw85xEQjQc69nt+/6VkT89lVkKv+o+1a2rcULLKyrrE5PvvyCj4GXh9IzU5Sae3oMt9MiplvvBRcKrM9q57KY0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737138625; c=relaxed/simple;
	bh=f8cAEq+ekutiXA8y00ycva89kbJIgBSuD+TagmH4Oxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ5LGV0ugVc4Ps1wa75FItl2iXSaqdOVPWIF0QByCw//i3fYODy1qKrDF5hhntYSRx0ndbXiJlfSZ2UskJ3TMffBW+ytMuOGJ3H/XzydQzIxsmEMDt2Y05az59HqOX6VuNKq/Kr3RYirbllv4ifFNt/RYXPR97lf8ndJ/Bay8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixAvVGxr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737138623; x=1768674623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f8cAEq+ekutiXA8y00ycva89kbJIgBSuD+TagmH4Oxo=;
  b=ixAvVGxrdeKA4sLMqjKKSA8DZCqEhDTi+292ed8l5vfavVwNJzmXNAd+
   o/Gs1Q5Oa/EdSrpithMRkSOqEAV9V9syRnC8B20B8Y5jbzZI3e3N8Qr+e
   BS0YZZ1RFzgmVhoi9RSpUNYr+zQpQ1+/IXyQNCmtBm1JOoHDV4OQ7d2o8
   AWR/0kLZWymqXLO3eN3D3UWCE/QSPhMppHwSzagzvizpHZGIEvhSsSB0d
   +FJc6ymk0B3SVoeZI0+61q8z7MR5/akKDvFn4J4+N4mcA8utvuyS+k33C
   f0yF2WegRt2iSFydeitX1r6EveaV9CJbtryCoqyJGFCUQPlpEPHahAK4o
   g==;
X-CSE-ConnectionGUID: kl4LpH7kQf6yOhGRiJ4T/Q==
X-CSE-MsgGUID: txZnBnkST6SMBL781Eb4YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37272516"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37272516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 10:30:22 -0800
X-CSE-ConnectionGUID: gJ1ujV3FSOm/sXeqXFyLlg==
X-CSE-MsgGUID: N4OI+Tr/SombvVB9vl2CzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106470713"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 10:30:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYr6n-000TZX-1z;
	Fri, 17 Jan 2025 18:30:17 +0000
Date: Sat, 18 Jan 2025 02:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Melody Olvera <quic_molvera@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>
Subject: Re: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Message-ID: <202501180248.1JzWcFb9-lkp@intel.com>
References: <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>

Hi Melody,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 37136bf5c3a6f6b686d74f41837a6406bec6b7bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Melody-Olvera/dt-bindings-cache-qcom-llcc-Document-SM8750-LLCC-block/20250114-053146
base:   37136bf5c3a6f6b686d74f41837a6406bec6b7bc
patch link:    https://lore.kernel.org/r/20250113-sm8750_llcc_master-v1-2-5389b92e2d7a%40quicinc.com
patch subject: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
config: mips-randconfig-r073-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180248.1JzWcFb9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180248.1JzWcFb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180248.1JzWcFb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/llcc-qcom.c: In function '_qcom_llcc_cfg_program_v6':
>> drivers/soc/qcom/llcc-qcom.c:3937:13: warning: variable 'sz' set but not used [-Wunused-but-set-variable]
    3937 |         u32 sz = 0;
         |             ^~
>> drivers/soc/qcom/llcc-qcom.c:3936:41: warning: variable 'slice_cfg' set but not used [-Wunused-but-set-variable]
    3936 |         const struct llcc_slice_config *slice_cfg;
         |                                         ^~~~~~~~~
   drivers/soc/qcom/llcc-qcom.c: At top level:
   drivers/soc/qcom/llcc-qcom.c:3223:18: warning: 'llcc_v6_reg_offset' defined but not used [-Wunused-const-variable=]
    3223 | static const u32 llcc_v6_reg_offset[] = {
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/llcc-qcom.c:3183:42: warning: 'llcc_v6_edac_reg_offset' defined but not used [-Wunused-const-variable=]
    3183 | static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sz +3937 drivers/soc/qcom/llcc-qcom.c

  3924	
  3925	static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
  3926					  const struct qcom_llcc_config *cfg)
  3927	{
  3928		int ret;
  3929		u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
  3930		u32 attr0_val, attr1_val, attr2_val, attr3_val;
  3931		u32 disable_cap_alloc, wren, wr_cache_en;
  3932		u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
  3933		u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
  3934		u32 slice_offset, reg_offset;
  3935		struct llcc_slice_desc *desc;
> 3936		const struct llcc_slice_config *slice_cfg;
> 3937		u32 sz = 0;
  3938	
  3939		slice_cfg = cfg->sct_data;
  3940		sz = cfg->size;
  3941	
  3942		attr0_cfg = LLCC_V6_TRP_ATTR0_CFGn(config->slice_id);
  3943		attr1_cfg = LLCC_V6_TRP_ATTR1_CFGn(config->slice_id);
  3944		attr2_cfg = LLCC_V6_TRP_ATTR2_CFGn(config->slice_id);
  3945		attr3_cfg = LLCC_V6_TRP_ATTR3_CFGn(config->slice_id);
  3946	
  3947		attr0_val = config->res_ways;
  3948		attr1_val = config->bonus_ways;
  3949		attr2_val = config->cache_mode;
  3950		attr2_val |= config->probe_target_ways << ATTR2_PROBE_TARGET_WAYS_SHIFT;
  3951		attr2_val |= config->fixed_size << ATTR2_FIXED_SIZE_SHIFT;
  3952		attr2_val |= config->priority << ATTR2_PRIORITY_SHIFT;
  3953	
  3954		attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
  3955		attr3_val /= drv_data->num_banks;
  3956		attr3_val >>= CACHE_LINE_SIZE_SHIFT;
  3957	
  3958		ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
  3959		if (ret)
  3960			return ret;
  3961	
  3962		ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
  3963		if (ret)
  3964			return ret;
  3965	
  3966		ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
  3967		if (ret)
  3968			return ret;
  3969	
  3970		ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
  3971		if (ret)
  3972			return ret;
  3973	
  3974		slice_offset = config->slice_id % 32;
  3975		reg_offset = (config->slice_id / 32) * 4;
  3976	
  3977		if (!cfg->skip_llcc_cfg) {
  3978			disable_cap_alloc = config->dis_cap_alloc << slice_offset;
  3979			ret = regmap_write(drv_data->bcast_regmap,
  3980				LLCC_V6_TRP_SCID_DIS_CAP_ALLOC + reg_offset,
  3981				disable_cap_alloc);
  3982	
  3983			if (ret)
  3984				return ret;
  3985		}
  3986	
  3987		wren = config->write_scid_en << slice_offset;
  3988		ret = regmap_update_bits(drv_data->bcast_regmap,
  3989				LLCC_V6_TRP_WRSC_EN + reg_offset,
  3990				BIT(slice_offset), wren);
  3991		if (ret)
  3992			return ret;
  3993	
  3994		wr_cache_en = config->write_scid_cacheable_en << slice_offset;
  3995		ret = regmap_update_bits(drv_data->bcast_regmap,
  3996				LLCC_V6_TRP_WRSC_CACHEABLE_EN + reg_offset,
  3997				BIT(slice_offset), wr_cache_en);
  3998		if (ret)
  3999			return ret;
  4000	
  4001		stale_en = config->stale_en << slice_offset;
  4002		ret = regmap_update_bits(drv_data->bcast_regmap,
  4003				LLCC_V6_TRP_ALGO_CFG1 + reg_offset,
  4004				BIT(slice_offset), stale_en);
  4005		if (ret)
  4006			return ret;
  4007	
  4008		stale_cap_en = config->stale_cap_en << slice_offset;
  4009		ret = regmap_update_bits(drv_data->bcast_regmap,
  4010				LLCC_V6_TRP_ALGO_CFG2 + reg_offset,
  4011				BIT(slice_offset), stale_cap_en);
  4012		if (ret)
  4013			return ret;
  4014	
  4015		mru_uncap_en = config->mru_uncap_en << slice_offset;
  4016		ret = regmap_update_bits(drv_data->bcast_regmap,
  4017				LLCC_V6_TRP_ALGO_CFG3 + reg_offset,
  4018				BIT(slice_offset), mru_uncap_en);
  4019		if (ret)
  4020			return ret;
  4021	
  4022		mru_rollover = config->mru_rollover << slice_offset;
  4023		ret = regmap_update_bits(drv_data->bcast_regmap,
  4024				LLCC_V6_TRP_ALGO_CFG4 + reg_offset,
  4025				BIT(slice_offset), mru_rollover);
  4026		if (ret)
  4027			return ret;
  4028	
  4029		alloc_oneway_en = config->alloc_oneway_en << slice_offset;
  4030		ret = regmap_update_bits(drv_data->bcast_regmap,
  4031				LLCC_V6_TRP_ALGO_CFG5 + reg_offset,
  4032				BIT(slice_offset), alloc_oneway_en);
  4033		if (ret)
  4034			return ret;
  4035	
  4036		ovcap_en = config->ovcap_en << slice_offset;
  4037		ret = regmap_update_bits(drv_data->bcast_regmap,
  4038				LLCC_V6_TRP_ALGO_CFG6 + reg_offset,
  4039				BIT(slice_offset), ovcap_en);
  4040		if (ret)
  4041			return ret;
  4042	
  4043		ovcap_prio = config->ovcap_prio << slice_offset;
  4044		ret = regmap_update_bits(drv_data->bcast_regmap,
  4045				LLCC_V6_TRP_ALGO_CFG7 + reg_offset,
  4046				BIT(slice_offset), ovcap_prio);
  4047		if (ret)
  4048			return ret;
  4049	
  4050		vict_prio = config->vict_prio << slice_offset;
  4051		ret = regmap_update_bits(drv_data->bcast_regmap,
  4052				LLCC_V6_TRP_ALGO_CFG8 + reg_offset,
  4053				BIT(slice_offset), vict_prio);
  4054		if (ret)
  4055			return ret;
  4056	
  4057		if (config->activate_on_init) {
  4058			desc = llcc_slice_getd(config->usecase_id);
  4059			if (PTR_ERR_OR_ZERO(desc))
  4060				return -EINVAL;
  4061	
  4062			ret = llcc_slice_activate(desc);
  4063		}
  4064	
  4065		return ret;
  4066	}
  4067	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

