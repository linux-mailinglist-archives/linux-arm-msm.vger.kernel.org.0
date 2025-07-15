Return-Path: <linux-arm-msm+bounces-64955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9BB053A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27BC5605B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA5F273808;
	Tue, 15 Jul 2025 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqILQ5Pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AC272E6D;
	Tue, 15 Jul 2025 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565777; cv=none; b=HsoXR2N55RZGO+hch6vz2J3OTWGixAqr+knezEyNyU7TNR6k2YX3VjiHNTzT0ueMJC7e6oXhIo8MwRvMv5hcLKyw+A90sZX94+148bYHmVig7m2y/tHE8VCFgWDbY+t2GBVwY/wqViHarxe9uyXQOXoJuHCt5qtVO8L2yBaulkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565777; c=relaxed/simple;
	bh=ncOaGHOLrKcO0FG9v/L44yQpuzOwu/hbJMUNcx7R1w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+fDA88PEnDtVAPFQULMs/LnAIXDE4+wU8kDEVWnX+6UB1quC2NBjmc+AnopEOrsp1X2Ou+4Sjs2EB74b/jXVeAsFva8GC5ZdyRg3uwwWhAiTEitVk13ZxB8irzMEl6bdYSFDrVehTygg76M0u8d3d7BIKGr11joZO3o8Lgnz5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqILQ5Pc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752565775; x=1784101775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncOaGHOLrKcO0FG9v/L44yQpuzOwu/hbJMUNcx7R1w0=;
  b=ZqILQ5PcJcAfAoNNBpkvXe+6xsD1Jgh3phtrk65KjWzHlx1/SesfKd09
   Hvy9s5NZ1vmWA8oridr4IogZa2HHDKC8r1VQvEBXvqa5vzQahAhVmskcM
   nefbvt+hwYRPKiuhUtZ3b6TDF2Euiv1Nlo0McKeBhKeohlujRuHRDlZ2f
   qB9aFnJdFI/vsJRuoI+0H1ZFFElePSjA+QPHKmcQbbL6cNQA5VRh/XbZl
   e+Dz9K33a6u4MfpediqOIGrBNzfpd0kFAijdNVXUrfWAnQp7nP+wQPimT
   gNQefLk2QYkkyjc6ej55QPZvYvXqbThMZnry2hyR6PILEE4pWRs0CXVv6
   g==;
X-CSE-ConnectionGUID: 2N4UUyAUSiygIyOkdFK8hQ==
X-CSE-MsgGUID: WST8LeihQrOYVfV2bUa53g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54928515"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54928515"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:49:34 -0700
X-CSE-ConnectionGUID: uUcZuDCkR4iAoRcjWYQrsw==
X-CSE-MsgGUID: bIP7DoUJTEKngzU6a57msg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156802504"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jul 2025 00:49:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubaPo-0009nv-2d;
	Tue, 15 Jul 2025 07:49:28 +0000
Date: Tue, 15 Jul 2025 15:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luo Jie <quic_luoj@quicinc.com>
Subject: Re: [PATCH net-next v2 2/3] net: phy: qcom: qca808x: Support PHY
 counter
Message-ID: <202507151542.rdmfnV5H-lkp@intel.com>
References: <20250714-qcom_phy_counter-v2-2-94dde9d9769f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-qcom_phy_counter-v2-2-94dde9d9769f@quicinc.com>

Hi Luo,

kernel test robot noticed the following build errors:

[auto build test ERROR on b06c4311711c57c5e558bd29824b08f0a6e2a155]

url:    https://github.com/intel-lab-lkp/linux/commits/Luo-Jie/net-phy-qcom-Add-PHY-counter-support/20250714-230346
base:   b06c4311711c57c5e558bd29824b08f0a6e2a155
patch link:    https://lore.kernel.org/r/20250714-qcom_phy_counter-v2-2-94dde9d9769f%40quicinc.com
patch subject: [PATCH net-next v2 2/3] net: phy: qcom: qca808x: Support PHY counter
config: i386-buildonly-randconfig-003-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151542.rdmfnV5H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151542.rdmfnV5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151542.rdmfnV5H-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "qcom_phy_get_stats" [drivers/net/phy/qcom/qca808x.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

