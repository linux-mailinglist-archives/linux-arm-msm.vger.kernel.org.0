Return-Path: <linux-arm-msm+bounces-75391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60DBA62E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 21:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521553BD661
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 19:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D25227599;
	Sat, 27 Sep 2025 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UB4OS5rq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5816A956;
	Sat, 27 Sep 2025 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759001881; cv=none; b=Za7YaRSPULjbKv/Bq5DCk/Y1eC3LQOqtzT65AkDk7pxg176yBzkRSwtrl2PGmJhL3hLXlOb1YpezEeDRNuOXpBIrY0I7RQbGMFMYEV3Q2JvB9/RqUrrVt/X6klgkBfcQ5o6rnH5Gify+cU0P7hG/wJ1mZ9SwlV+RVIbIYGbskU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759001881; c=relaxed/simple;
	bh=v4tYuKq23IFkP5pTX5xVWeK6wNj4TsUt3W+E4QEibj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwSVBYAjYbExZ7pxno192NVt+yiXkseAat94BWCG8Kkv3tTV+z5QgGBxYwTi6NZPILC97NBGOR763UZxOycf/nZrqnVm6aHY5ykA61kiAue2RNjjbntOe4oIbD29iCy6ThWd6IzpG90TprD4Q1mHBWOzMnPHvztkPc67c8oefS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UB4OS5rq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759001880; x=1790537880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v4tYuKq23IFkP5pTX5xVWeK6wNj4TsUt3W+E4QEibj8=;
  b=UB4OS5rqC9UKfOfsmDTbDCxhsexNF+DlbV9RyulG0ApDkt3HgOymBl5w
   ZLu++sat8F7QFS1Yc9Uj+CrpU9lQrgHhuPD9CT3Y+/R7oRzEGnUwb0ytK
   it/K8fHRHDhiEERXPEH+u7yLVHl6FOz/dx1dhk5k1ujHRDZ6p3NJYK2Kw
   xKfWEXM1fZRMXkJe2Zo776BezLJffN3x1DEyOorvgnQGNuCUJnENri3Mh
   GRNb9hiJfI1d6a0sCEo5g+9WoCYYYEhGgedGS4GWElEKS88N9AiliCMdT
   k4IEEwwHrOVlVTwijLkw0jlWFvs6yyz2F2Z7tyz78MaSw6he0HrqHzy4a
   g==;
X-CSE-ConnectionGUID: LXGPSR7mR8qBnohnPmh9WA==
X-CSE-MsgGUID: levRUB3ZTmWsJw4UJg9tMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="83908958"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="83908958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 12:37:59 -0700
X-CSE-ConnectionGUID: FJxBiAB5RyqbSrOb7oISQg==
X-CSE-MsgGUID: T0kuUb2QSoG4qQMy8NQM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="208615280"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2025 12:37:54 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2ajv-0007IB-1o;
	Sat, 27 Sep 2025 19:37:51 +0000
Date: Sun, 28 Sep 2025 03:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH 8/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW
 panel
Message-ID: <202509280303.sWeQi4ks-lkp@intel.com>
References: <20250925-s6e3fc2x01-v1-8-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-8-9293016768f7@ixit.cz>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ce7f1a983b074f6cf8609068088ca3182c569ee4]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/dt-bindings-panel-Add-Samsung-S6E3FC2X01-DDIC-with-panel/20250925-171444
base:   ce7f1a983b074f6cf8609068088ca3182c569ee4
patch link:    https://lore.kernel.org/r/20250925-s6e3fc2x01-v1-8-9293016768f7%40ixit.cz
patch subject: [PATCH 8/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250928/202509280303.sWeQi4ks-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280303.sWeQi4ks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280303.sWeQi4ks-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c:210:17: warning: unused variable 'dev' [-Wunused-variable]
     210 |         struct device *dev = &ctx->dsi->dev;
         |                        ^~~
>> drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c:256:29: warning: unused variable 'ctx' [-Wunused-variable]
     256 |         struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
         |                                    ^~~
   2 warnings generated.


vim +/dev +210 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c

   206	
   207	static int s6e3fc2x01_prepare(struct drm_panel *panel)
   208	{
   209		struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
 > 210		struct device *dev = &ctx->dsi->dev;
   211		int ret;
   212	
   213		ret = regulator_bulk_enable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
   214		if (ret < 0)
   215			return ret;
   216	
   217		s6e3fc2x01_reset(ctx);
   218	
   219		ret = s6e3fc2x01_on(ctx);
   220		if (ret < 0) {
   221			gpiod_set_value_cansleep(ctx->reset_gpio, 0);
   222			regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
   223			return ret;
   224		}
   225	
   226		return 0;
   227	}
   228	
   229	static int s6e3fc2x01_unprepare(struct drm_panel *panel)
   230	{
   231		struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
   232	
   233		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
   234		regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
   235	
   236		return 0;
   237	}
   238	
   239	static const struct drm_display_mode ams641rw_mode = {
   240		.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
   241		.hdisplay = 1080,
   242		.hsync_start = 1080 + 72,
   243		.hsync_end = 1080 + 72 + 16,
   244		.htotal = 1080 + 72 + 16 + 36,
   245		.vdisplay = 2340,
   246		.vsync_start = 2340 + 32,
   247		.vsync_end = 2340 + 32 + 4,
   248		.vtotal = 2340 + 32 + 4 + 18,
   249		.width_mm = 68,
   250		.height_mm = 145,
   251	};
   252	
   253	static int s6e3fc2x01_get_modes(struct drm_panel *panel,
   254						struct drm_connector *connector)
   255	{
 > 256		struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
   257		struct drm_display_mode *mode;
   258	
   259		mode = drm_mode_duplicate(connector->dev, &ams641rw_mode);
   260		if (!mode)
   261			return -ENOMEM;
   262	
   263		drm_mode_set_name(mode);
   264	
   265		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
   266		connector->display_info.width_mm = mode->width_mm;
   267		connector->display_info.height_mm = mode->height_mm;
   268		drm_mode_probed_add(connector, mode);
   269	
   270		return 1;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

