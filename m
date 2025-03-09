Return-Path: <linux-arm-msm+bounces-50749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F7A585BE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 17:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A32A16B0BE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 16:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608D01DF72E;
	Sun,  9 Mar 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZbGiYZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAF1C6FF4;
	Sun,  9 Mar 2025 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741536708; cv=none; b=BI5Dioj7DBGJXpRlyfr7qgIRW//sSzOjfB4XU7WxP7XcwsXrSvAv7HRG/0rA8dZ9vU5AsdNWACSJsRa9f27hHhm72IYwXzzODad8o+9pw5WSobL/IBCjwYdx18zR8xhGu6KoaKAk6l8tYgVgyyoKeniEvrEFwUcIYyhDRHWWFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741536708; c=relaxed/simple;
	bh=9hCZiuQUrvw8C6VOe681QbTu6p8BIa79fAzB/mklYP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXEEDh+rCdIQ47QT+ImXMhNtqN2LXTFGdGpM65WApGqRHn2LUL41C76PM4NydudfouvG6MhEgTuoX/Pf73ipV1+L5gIMxmzJIANB8/1vxloDLWRPH+aK/lTSyQPXjc4AgOi5iaZJl1rdba1TfG+bn7i/K095J73kXAy36yec19g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZbGiYZo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741536707; x=1773072707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hCZiuQUrvw8C6VOe681QbTu6p8BIa79fAzB/mklYP4=;
  b=YZbGiYZor6PfrgcvcNyBXY5ypy84ve6NQ22SlkMjKE5tgRJ3dna0G1gn
   dr2led+iP31wMj7HLoRuqCzx3MEMcenbAWnei16GxE/gwl7k2P7re9QRE
   FbuYvjeaWVMXnIRn1OCkXXv2HzOMnwgeKxJEvVrwxZbM41qMRGT8iIO20
   MWYwhladsmmHwKE37BdAbIXR5rJOJ+0q0T85BRUxUjaJUkmVayvnjUqRf
   h3xm7G1VhqOI2u1SXcsE8vHYvKi6Dy5U+Vh2vlwHjN1D7mdwCYOQml0I8
   B9Kn1pI8P4FwTbLtvJjnCupJdGsVKBLidRZA5lz+uByU/BmKXsAAt+fnh
   w==;
X-CSE-ConnectionGUID: YLZw3CLtSFCfBdMxuWoEGw==
X-CSE-MsgGUID: pSoZrAsfQN6h4MOaoQeNjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42240133"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42240133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 09:11:46 -0700
X-CSE-ConnectionGUID: igfIiSO4REKuMBuIYyKnfg==
X-CSE-MsgGUID: P9l/zbXRSr+FhzXTflQ3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120680370"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2025 09:11:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trJFb-0003Gk-22;
	Sun, 09 Mar 2025 16:11:39 +0000
Date: Mon, 10 Mar 2025 00:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Ivan Belokobylskiy <belokobylskij@gmail.com>,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v3] ARM: dts: nexus4: Initial dts
Message-ID: <202503092337.8UvZ5rwI-lkp@intel.com>
References: <20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/ARM-dts-nexus4-Initial-dts/20250309-084753
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250309-lg-nexus4-mako-v3-1-1dc2807df296%40ixit.cz
patch subject: [PATCH v3] ARM: dts: nexus4: Initial dts
config: arm-randconfig-002-20250309 (https://download.01.org/0day-ci/archive/20250309/202503092337.8UvZ5rwI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503092337.8UvZ5rwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092337.8UvZ5rwI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts:289.1-10 Label or path pmicintc not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

