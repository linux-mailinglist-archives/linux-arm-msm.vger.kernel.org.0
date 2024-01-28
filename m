Return-Path: <linux-arm-msm+bounces-8698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2B83F5B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 15:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4DA5B21EE4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5472377B;
	Sun, 28 Jan 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbI9EWaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37B23746
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706450615; cv=none; b=f35Y4l4TkEYy82ayBoiZCCgrKq4vvq1oXqhqSyG4Gbj0eoBuC5HCSfYz7E/1GGSXktzgrsTerSrMTldMn8UX05KWCL6lPmXMBoXcQzsXxAMcXR7tusOZs4XJLBD2N3mmGqmMbvQxiloycR8YKpR/flkE5nbx2v4c0UZiLKC9G7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706450615; c=relaxed/simple;
	bh=y4IeGf5G5kXp/QvjFIs2djdjcL7GIzEtTnjrGf1k2sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UakuwIBbZeQOwNuGWLXVUygvNglquSrTr3+DIYn5YK75txWjCN0QkMBFYIRqGd/T4Iv7PNFG3zpDme20nx+91ixrg16Md1EDF01bgVzhafCnl0b2/1qIlcoWW//LLnVLvPbFVhQXUklle81pVaBFfumXujPyaC7zFesT5cFR5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbI9EWaM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706450614; x=1737986614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y4IeGf5G5kXp/QvjFIs2djdjcL7GIzEtTnjrGf1k2sA=;
  b=KbI9EWaMSHUQlr/aYVfOV1X8pJejBJbfTGXo1BteNXV5FQZ+Jog/zcI7
   fiaAxLJX/7NXmYdZEPl+G6W6/H8mgSTLaD0aLvK11Y68yUWZYIyu0BxmW
   j6+iFZ3/SVclWo2XvmXzyGhHOviW8AlYtK1VZuqSDlh8wxB/LhK3IB6GR
   l3Rka6skTNayMBDdXoLzeW8OJ9847FUpRZJZht/LIyoMtUfNX+J47jqaR
   taLdTDsNDZh5O20tqgraqy1mn6lhApFIfL8jbGRK1VHLJgF4tMkAxHVcX
   ecfEVxMd1zvsPJocjiMyOqSdZEwIq3sPjYw5iGGPbvXGOBJnxqs/XRTaS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2604466"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2604466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 06:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29273410"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2024 06:03:29 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU5ks-0003RG-1G;
	Sun, 28 Jan 2024 14:03:26 +0000
Date: Sun, 28 Jan 2024 22:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Paloma Arellano <quic_parellan@quicinc.com>,
	freedreno@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	neil.armstrong@linaro.org, marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
	dri-devel@lists.freedesktop.org, swboyd@chromium.org,
	seanpaul@chromium.org, quic_jesszhan@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Paloma Arellano <quic_parellan@quicinc.com>,
	quic_khsieh@quicinc.com
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Message-ID: <202401282131.j7UUVG6P-lkp@intel.com>
References: <20240125193834.7065-11-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125193834.7065-11-quic_parellan@quicinc.com>

Hi Paloma,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.8-rc1]
[also build test ERROR on linus/master next-20240125]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paloma-Arellano/drm-msm-dpu-allow-dpu_encoder_helper_phys_setup_cdm-to-work-for-DP/20240126-034233
base:   v6.8-rc1
patch link:    https://lore.kernel.org/r/20240125193834.7065-11-quic_parellan%40quicinc.com
patch subject: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show major and minor val
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240128/202401282131.j7UUVG6P-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401282131.j7UUVG6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401282131.j7UUVG6P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_catalog.c:547:11: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           *major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
                    ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:27:34: note: expanded from macro 'DP_HW_VERSION_MAJOR'
   #define DP_HW_VERSION_MAJOR(reg)        FIELD_GET(GENMASK(31, 28), reg)
                                           ^
   1 error generated.


vim +/FIELD_GET +547 drivers/gpu/drm/msm/dp/dp_catalog.c

   531	
   532	/**
   533	 * dp_catalog_hw_revision() - retrieve DP hw revision
   534	 *
   535	 * @dp_catalog: DP catalog structure
   536	 *
   537	 * Return: void
   538	 *
   539	 */
   540	void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
   541	{
   542		const struct dp_catalog_private *catalog = container_of(dp_catalog,
   543					struct dp_catalog_private, dp_catalog);
   544		u32 reg_dp_hw_version;
   545	
   546		reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
 > 547		*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
   548		*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
   549	}
   550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

