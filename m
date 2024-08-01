Return-Path: <linux-arm-msm+bounces-27748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BE945485
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 00:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFA4D1C23123
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 22:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA3B14C5AA;
	Thu,  1 Aug 2024 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdItHveg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585114BF8F;
	Thu,  1 Aug 2024 22:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722551339; cv=none; b=Te8+L6OVWG9IBGJmm6qed8bWcmQpV/UtdQ82R0rF5nLrq1RjjUvPGknSUvKLAB6swPAZHviwKeJVpf9/YHL2r4Rpo4xo0aFvVXml2tveXw5IApZzwzHmIk74iVEi64cgvSYq9fzeCUuC9MQm14mm/ksWR5EkinvG0zsFJ0wI99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722551339; c=relaxed/simple;
	bh=5J6mExnZ6kyIwXnhYIpO3liFJjrlqOH8Z5QqPPP7/KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZtyeGnvNm57vEGPkFjA4v52518L7dt2YsetCs+NuqGTHoscbVhNY1kGWCoIWfU56YH5qmF6tmp+FRjyRS3prRiUJDRGhE/K+coO0/6UJ6usi+FgDJ0hHuly1PJXB6bjkgkleXzlb1rsegqwoMfNzOq6Fj5ElNro7jSoxidSM9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdItHveg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722551337; x=1754087337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5J6mExnZ6kyIwXnhYIpO3liFJjrlqOH8Z5QqPPP7/KQ=;
  b=BdItHvegmVcNKJwwSfVGU5fifysy0L2wtmylGfvgfNJoai+mMXwYwIgl
   QVAYMYf0mM0u3hsBDxvkrCAerwVr25guv6/xmK3qw3iT9EnqnQVqtODQY
   IW4JdMZAmNF3kZvRtYlE1htBQpcr4LAeBYj6xYonXTIUsm/aBIT2U/xpc
   69MSqlfAsgoQX55BBv1ppVOY+k+ihSsnhByq6g2sWyzgC/T8TFSa36MMl
   Q99cFuuxc1lkyLQncYE5IcnNVUeOdaLR4R4ayQUsgRAfdd2k2M/KGTRJ5
   p4IAiNBkzwOPG8sPtCp4bQIAa19b7h7TYyiu+Dxf0GSlznZIZ2JshUUOn
   g==;
X-CSE-ConnectionGUID: nFByC92NTBi88Z4+qDuVhg==
X-CSE-MsgGUID: Tz9v/xiIQhmVogA9TNt56A==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38006606"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="38006606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 15:28:56 -0700
X-CSE-ConnectionGUID: AMVcz9uqTICt3qcoyWHyeg==
X-CSE-MsgGUID: MAsJlQVzSAaGanaocv86Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="60036909"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2024 15:28:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZeHy-000w5s-1X;
	Thu, 01 Aug 2024 22:28:50 +0000
Date: Fri, 2 Aug 2024 06:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Elson Roy Serrao <quic_eserrao@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: Re: [PATCH 7/8] usb: misc: eud: Handle usb role switch notifications
Message-ID: <202408020600.vU0uKLa7-lkp@intel.com>
References: <20240730222439.3469-8-quic_eserrao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730222439.3469-8-quic_eserrao@quicinc.com>

Hi Elson,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.11-rc1 next-20240801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elson-Roy-Serrao/dt-bindings-soc-qcom-eud-Add-phy-related-bindings/20240801-210521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240730222439.3469-8-quic_eserrao%40quicinc.com
patch subject: [PATCH 7/8] usb: misc: eud: Handle usb role switch notifications
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240802/202408020600.vU0uKLa7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020600.vU0uKLa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020600.vU0uKLa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/misc/qcom_eud.c: In function 'handle_eud_irq_thread':
>> drivers/usb/misc/qcom_eud.c:227:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     227 |         int ret;
         |             ^~~


vim +/ret +227 drivers/usb/misc/qcom_eud.c

9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  223  
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  224  static irqreturn_t handle_eud_irq_thread(int irq, void *data)
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  225  {
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  226  	struct eud_chip *chip = data;
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08 @227  	int ret;
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  228  
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  229  	if (chip->usb_attached)
c007e96bfd0471 Elson Roy Serrao    2024-07-30  230  		ret = eud_usb_role_set(chip, USB_ROLE_DEVICE);
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  231  	else
c007e96bfd0471 Elson Roy Serrao    2024-07-30  232  		ret = eud_usb_role_set(chip, USB_ROLE_HOST);
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  233  
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  234  	/* set and clear vbus_int_clr[0] to clear interrupt */
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  235  	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  236  	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  237  
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  238  	return IRQ_HANDLED;
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  239  }
9a1bf58ccd4432 Souradeep Chowdhury 2022-02-08  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

