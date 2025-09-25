Return-Path: <linux-arm-msm+bounces-75223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B898BA1F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 01:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB6A1621754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6426D2D46DD;
	Thu, 25 Sep 2025 23:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etl119aQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87E1C831A;
	Thu, 25 Sep 2025 23:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758842185; cv=none; b=kNujs/d9v44OE7Ri0qlw9I0ikOP6N5M7NMP/GkkCeLrFAdKtpK1NEpYK38zCiEcF46y6dPlyD3PoN48ar1Q13LRsoeJT33Dgzrmr2MQqdxd7c7r/QPhwu7PnjawJeaEgNeMiPrh1F0aAYt/12Rqo8Ahuq34CFqaoB1BkUvBBHQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758842185; c=relaxed/simple;
	bh=moV+f4gCBC1qfazBctyv0QJ2cMUxIEDpv3d4OjwPEZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxAG8XruOLb9NqWQ60E0XFnKj/jqjenrHoe6UQ2trzyMl4wtkuk9tfhi8Kl51FMdBoGUj0pUizlfwj1LAed8oZ7EsbzQjZd1/Y4RYo/vGoxQACoo71boyGHrukq10DTYPU3t29orJ91ODDSysReQ9xZmZf8jleVM9Vi4A/whXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etl119aQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758842184; x=1790378184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=moV+f4gCBC1qfazBctyv0QJ2cMUxIEDpv3d4OjwPEZA=;
  b=etl119aQDzaysgeITzZ7ksnmaI72c1nWQglrycCDck17dmkrQ3o1jHNQ
   7hl6W3nHy4AfZQ5OkhHd+0iVj9NRbWXhAlecmjBjMedkQYIKPPv/rsJ5/
   0AQboYvMJ3JH5tbv8EPTE5/UPybp6AjdNJtn3DKnFd2iynpwqBeixB61T
   KWXr6Oor2kvOP1pO/d1eFkKvYpaMM5pg7OAxP7OD1HQfYz/C7W2yNIs1I
   BzOKyLyviYDwhbW13O6QnkVuH/mO+cOY7f4QmUZYP9qxrDCPymTS8pR4k
   nn3x02Y4L/eJ9sLWk2egosqhl2POusoeGzhf/bo7gqHfd1+A1dldHbN7G
   g==;
X-CSE-ConnectionGUID: YYNaOdFSSLSKOm8yNZgjkg==
X-CSE-MsgGUID: KGvFLkmcRF6sV7IIEHqhSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61094501"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="61094501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 16:16:23 -0700
X-CSE-ConnectionGUID: le1XJv8kRXy9X77xuX6F+w==
X-CSE-MsgGUID: c1KF4yyIQCm8ewlLpMqN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="181759216"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2025 16:16:20 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1vCD-0005iX-2E;
	Thu, 25 Sep 2025 23:16:17 +0000
Date: Fri, 26 Sep 2025 07:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
Message-ID: <202509260638.JQl4hfnp-lkp@intel.com>
References: <20250924-glymur-spmi-v8-v2-2-202fc7a66a97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-spmi-v8-v2-2-202fc7a66a97@oss.qualcomm.com>

Hi Kamal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c3067c2c38316c3ef013636c93daa285ee6aaa2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Wadhwa/dt-bindings-spmi-add-bindings-for-glymur-spmi-pmic-arb-arbiter-v8/20250925-010123
base:   c3067c2c38316c3ef013636c93daa285ee6aaa2e
patch link:    https://lore.kernel.org/r/20250924-glymur-spmi-v8-v2-2-202fc7a66a97%40oss.qualcomm.com
patch subject: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter v8
config: x86_64-buildonly-randconfig-004-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260638.JQl4hfnp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260638.JQl4hfnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260638.JQl4hfnp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spmi/spmi-pmic-arb.c:155 bad line:                         particular SPMI bus instance

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

