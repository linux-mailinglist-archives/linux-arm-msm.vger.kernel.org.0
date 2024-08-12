Return-Path: <linux-arm-msm+bounces-28307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5394ECD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 14:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2232B22721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 12:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87F617ADE5;
	Mon, 12 Aug 2024 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE1NfAln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80817A59C;
	Mon, 12 Aug 2024 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465327; cv=none; b=S6gJu2HXcs16zIRw3cTZtP9Dqs6fy1UOQdvw+bcZqLoRVngED+wh98zo1JhmlbnQkORPCwnuEadcvZYphpi52Nlj+gDZ+HwB6bXovi/4cmYL8EGEk4nFUov9WbAyfrGjyGWRgf3FZhTtId7TL1AOwZ4AeAnMabZTHyQFz904EHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465327; c=relaxed/simple;
	bh=fQTaTJa3Vns6xQDbErgbezBPiTJXGAQdCWOhK/XdmjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7SqnhnfePrzkUpy05SmS7CqN27gQRPeHAoSJ6CcHKnbCrhr25+YbwXPxwZulD+dIvrSHTZZNAnArGinUBzfuueTFKhhhR36MrYTYLdzKtPoaFp4VQDuas50FryqTyE5PnE+fET9KZdvC8JFNCWiZDELNi/YmDl9O3+ZkCC416k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE1NfAln; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723465327; x=1755001327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fQTaTJa3Vns6xQDbErgbezBPiTJXGAQdCWOhK/XdmjQ=;
  b=TE1NfAlnxLHS8xM+mcK3cYx+Mj8Aq+F+g39rl8QvRJt7oRQfSJkIDcIQ
   MZcemXFkNsDT+BuwYnn442oxXYyQzFWjGBKMy4ejC9XlrLlmOyIHLIFlT
   EjKQeNXuJHzPv01OVKLKMykr0Z26w5ih5vg8s4sEoQGcXJzCm21yyVmjE
   wjGm2MJby821sJl37IStKnAfgd1G33vws8v+mnlT3nQsGNJBoXOAHeGsL
   O2HAbZCxsTnExHwdj4RO2UCAypjhJ1lBtOoFsq0LfnbloEuegm1y5eOkB
   Pw7Q8nLcBCQS1e+6EbBx1foqweizpBTeZyvPugHxAe0T6XXISIGq2TaFn
   Q==;
X-CSE-ConnectionGUID: Hg5r73c8RhanDkOnUYxg6w==
X-CSE-MsgGUID: hEV8kfeDTEum0x+08BSM4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44088258"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="44088258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 05:22:06 -0700
X-CSE-ConnectionGUID: IeZuDjrlTpyLCyyp5nX4zg==
X-CSE-MsgGUID: aJlPSRTESu2lPOrr9THy7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58326917"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 05:22:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdU3i-000BkB-12;
	Mon, 12 Aug 2024 12:21:58 +0000
Date: Mon, 12 Aug 2024 20:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <202408122011.adSQGOUp-lkp@intel.com>
References: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>

Hi Bjorn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 864b1099d16fc7e332c3ad7823058c65f890486c]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/dt-bindings-usb-snps-dwc3-Split-core-description/20240812-111102
base:   864b1099d16fc7e332c3ad7823058c65f890486c
patch link:    https://lore.kernel.org/r/20240811-dwc3-refactor-v2-4-91f370d61ad2%40quicinc.com
patch subject: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
config: i386-buildonly-randconfig-005-20240812 (https://download.01.org/0day-ci/archive/20240812/202408122011.adSQGOUp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122011.adSQGOUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408122011.adSQGOUp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc3/core.c:39:10: fatal error: glue.h: No such file or directory
      39 | #include "glue.h"
         |          ^~~~~~~~
   compilation terminated.


vim +39 drivers/usb/dwc3/core.c

    36	
    37	#include "core.h"
    38	#include "gadget.h"
  > 39	#include "glue.h"
    40	#include "io.h"
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

