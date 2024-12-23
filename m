Return-Path: <linux-arm-msm+bounces-43168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432E9FB7E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 00:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A55162987
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 23:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758331C5F31;
	Mon, 23 Dec 2024 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtWosel2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D17462;
	Mon, 23 Dec 2024 23:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734996165; cv=none; b=M0JWjCCTDeAEJqC9J05ZbXtzxIoyTuDI9nLAwLf/y8VI1CYFGPYrRfVzVu5ubuVPK8Byucfq5zsV7Jk2hxKx0b/t4gWq+joEVsb/ViEwFW31bLrcEuGMh+Zb04lv+aVSUjLa97kA/Ca+Nj2SOlyc3XP1aK+raAOUegXFvUW4sss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734996165; c=relaxed/simple;
	bh=MUf3O2CuGvHUkRiStqT9EpSnNnkeEfGYf3wmtOYBB0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeW1rIObbu89LLYxwyUwulAg3wV33K6PIDMjXfV1rWaYeWjSH7BCyzVRJroFzrFw08sIHznecS7yF6o8gYx+nPOOJXcfqu0cai+XjYBsqPlLieIFZQxCSFJWcgrdGFiJ4bXS3EnYkO79dI3SASNMKRKEZ4MEvCqXO/1rsRZfK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtWosel2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734996163; x=1766532163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUf3O2CuGvHUkRiStqT9EpSnNnkeEfGYf3wmtOYBB0c=;
  b=QtWosel2ksVafXlIzWR7LHphpfguGtkRwt/uXWGYvIsTrDbHS0nPSadW
   mf2xGWc+0siIiXAD0eHd0LiZJ/sg3Gki71L07tqgZPv96L9XmN8pKX752
   gMtKymfBviKhtgYHSYRP7sc8tJZ3tKYDQ2SCdeDY/fMx61mVBc1lJmFX/
   qmJGmIkfeVu8q+XDiVSfENiMx0xDCksDu9vF+4LvQjV398Dg/UO2xSbod
   xwFsl5DI1mFLj8dfljoYXZnkQJRtLTp+7DM2KmQbKVEJfSEy3RGyRgTGu
   12WvknnBfJ6IuzvdFEAFK9q5npBoOSzGC87Fe7DX0udHLypBN6dX9utJP
   A==;
X-CSE-ConnectionGUID: 4aIVPVRsT+CtLuCswRqZLQ==
X-CSE-MsgGUID: YyPbkSExQqS8BXxbeVknRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="57928569"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="57928569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 15:22:42 -0800
X-CSE-ConnectionGUID: m69gGBCQRbyPUwO0x4NKdQ==
X-CSE-MsgGUID: Iw/N6R7ZRja/Rrs1OsjxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122594367"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2024 15:22:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPrkw-0000gd-0H;
	Mon, 23 Dec 2024 23:22:34 +0000
Date: Tue, 24 Dec 2024 07:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lei Wei <quic_leiwei@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	quic_leiwei@quicinc.com, srinivas.kandagatla@linaro.org,
	bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com,
	john@phrozen.org
Subject: Re: [PATCH net-next v3 2/5] net: pcs: Add PCS driver for Qualcomm
 IPQ9574 SoC
Message-ID: <202412240600.yT4YVoQ8-lkp@intel.com>
References: <20241216-ipq_pcs_6-13_rc1-v3-2-3abefda0fc48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-ipq_pcs_6-13_rc1-v3-2-3abefda0fc48@quicinc.com>

Hi Lei,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Wei/dt-bindings-net-pcs-Add-Ethernet-PCS-for-Qualcomm-IPQ9574-SoC/20241216-214452
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241216-ipq_pcs_6-13_rc1-v3-2-3abefda0fc48%40quicinc.com
patch subject: [PATCH net-next v3 2/5] net: pcs: Add PCS driver for Qualcomm IPQ9574 SoC
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241224/202412240600.yT4YVoQ8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240600.yT4YVoQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240600.yT4YVoQ8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
>> ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/net/pcs/pcs-qcom-ipq9574.ko] undefined!
>> ERROR: modpost: "devm_clk_hw_register" [drivers/net/pcs/pcs-qcom-ipq9574.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

