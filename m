Return-Path: <linux-arm-msm+bounces-58222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 903BDAB9CF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 15:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA50B189B6D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F132417F2;
	Fri, 16 May 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPClHFTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B6242D8B;
	Fri, 16 May 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400989; cv=none; b=u+TF3oBuxvWXVu3HUO3//j9Uo+0dpn7JECGDxgaBgp5CSSGyME9fY9EBGrX5OwmI8MS9R4WqjfoycVLyRPMJTMjhzYnHuiSdxcJ9r/bZdg5IOafbPcgMOwz0bhhqd5mBljjBglolg0tL11VnfYjBMMvicxv2S8vooy3L48Xg6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400989; c=relaxed/simple;
	bh=kgV4jLI+lHbevVtE/xrY035nKOIawFE2ady5GL4s7Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+b/IuCce2DeT+hKZc4iKyzh2lHT4Eoq2WbbpFhAIlKdBX1ZNnWMcqiZJvEBTrVEwZpvUXhEHAXRmYVFFv6+ZfTAVHDTaSY5HYz9RPIgyX8tJa/jyiQysx0e98gM+Xd8aTOBqaxe454sbQ1Q1VD8HBgD8ue5vLVgSU6x5oDfg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPClHFTp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747400988; x=1778936988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kgV4jLI+lHbevVtE/xrY035nKOIawFE2ady5GL4s7Ro=;
  b=cPClHFTpFWKKq/0xgJvowD4D5hnwUEl4GyXU5W+XNgv4QfxB1eGPRTzn
   HQ5gyAoyzcimgWIX4s5q6PqW5STATMLCIKjKQ8MYcdnT/+9MGG2E0Ws4C
   C0ZDfSYntZBpRJMRZT8Id23Ka4+7GwFddpZNUkdvOobF1nTKvhI+LgE/u
   Tkg4LRZXgYgV0T4LFbDlWN6vvVRTZ9HMRasGblnD5rifg6CFSBGFMMSqD
   Zjn0xz+bBU5xrRkt2Q7Y/KnqiU8lUMTwKe1uzCekfaYAuVEp/FPiaA4s4
   enx9FUnWRRdfLwSvUiHL6Wbjf9GyLE1aCETKVkvCb+t6VnDVGp9KbaZWC
   g==;
X-CSE-ConnectionGUID: BmaIt31gSEiePPo1AGCLYw==
X-CSE-MsgGUID: mzyS6wPbQqWcjWdRC7G+VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60010924"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60010924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 06:09:47 -0700
X-CSE-ConnectionGUID: RCWs+DXOSeapkbm9PVWYEA==
X-CSE-MsgGUID: AIqY6aH4QA6e6m/Zp5UAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143810615"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 May 2025 06:09:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFuon-000JMZ-20;
	Fri, 16 May 2025 13:09:41 +0000
Date: Fri, 16 May 2025 21:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: dt
 definition for Thinkbook 16
Message-ID: <202505162035.hYLdjmWr-lkp@intel.com>
References: <20250515-tb16-dt-v1-4-dc5846a25c48@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-tb16-dt-v1-4-dc5846a25c48@oldschoolsolutions.biz>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on bdd609656ff5573db9ba1d26496a528bdd297cf2]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Glathe-via-B4-Relay/dt-bindings-arm-qcom-Add-Lenovo-Thinkbook-16/20250516-044052
base:   bdd609656ff5573db9ba1d26496a528bdd297cf2
patch link:    https://lore.kernel.org/r/20250515-tb16-dt-v1-4-dc5846a25c48%40oldschoolsolutions.biz
patch subject: [PATCH 4/4] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: dt definition for Thinkbook 16
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505162035.hYLdjmWr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505162035.hYLdjmWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505162035.hYLdjmWr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts:22.15-30 Label or path pm8010_thermal not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

