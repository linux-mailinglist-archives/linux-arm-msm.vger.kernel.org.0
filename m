Return-Path: <linux-arm-msm+bounces-73904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C34BB7D8C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6896C3B45BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 11:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA2B2BF012;
	Wed, 17 Sep 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e10JiuyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB692BEC42;
	Wed, 17 Sep 2025 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107135; cv=none; b=AaYJ3Ygzlvlsi8OpgnIRCJHpkG6fCCUrf/aR7f+1B86C794Y4dzN37FA73eIEJk8LUajvfwz5PnXydkFyXLieSPDjHTOlOI47CQoEpAWdC6Qlic3LyFj5BYIlgSzKmDpgSATtmGk6cEmQVYi2WSrhJh4QULlzdU6Z25kT64WAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107135; c=relaxed/simple;
	bh=aYfiGscODZY08nTaVOaMHh+BkAmQFeULqygoaWas8mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGPqkWxKAWzpIEwRHs2z5pH0OvNqoqj/Zm6eIyh/FIxvBxNvYs69Fo8Ii8pQUbgXXcnNObO18IfGHMfAdUIpjEjBJXfs21ZesDasEz7SMXlhEv0mxMsmX8eNHAvBFK7AxQcKchNaNrSoiQP+JgmkH6H9pP2C1jxbHSpwkke0o7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e10JiuyG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758107133; x=1789643133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aYfiGscODZY08nTaVOaMHh+BkAmQFeULqygoaWas8mk=;
  b=e10JiuyGMW/VSs95vPJz/T5yhXtT90is6xUc0b98eFP1NOjtjboMh+Oh
   7QAM+wg4CfeCqAS3hnftb2TqIZ4YDekOszRa9oJu9wHsDkag+tYG87xa2
   t4WB8r5G3HIONglexOPVJp0mOAe9CIRaKe9yRqvt+5nxkSyh5WJvAAMUw
   a5ACtfbl0BD0yewORz4TcBXcxSJP0+k611wcfIIJX+hnZarS1DG4+uiq6
   Idh7mwrSimGqTTYeZZMtBrW796oJ9NP2MERuXxYC8DRTk7+c57m9+fu8t
   wEhDExKFW6H7paaokR65eqVRIg1wbAadNp63AByr1C8ZPiQy//PcqIFjP
   A==;
X-CSE-ConnectionGUID: Wj3QbtN0TeiVwHmVwRMSpA==
X-CSE-MsgGUID: kfjVKoiVQna12zW9EVix0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="78014332"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="78014332"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 04:05:32 -0700
X-CSE-ConnectionGUID: K61CCjLJSi2MLr0tbHiVbQ==
X-CSE-MsgGUID: DjGYdbNkTqy4ceeBIqZFDA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 04:05:29 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uypyZ-0001Pf-2G;
	Wed, 17 Sep 2025 11:05:27 +0000
Date: Wed, 17 Sep 2025 19:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 3/4] regulator: rpmh-regulator: Add support for new
 resource name format
Message-ID: <202509171822.oRjF64pS-lkp@intel.com>
References: <20250916-glymur-rpmh-regulator-driver-v2-3-c6593ff9b4be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-glymur-rpmh-regulator-driver-v2-3-c6593ff9b4be@oss.qualcomm.com>

Hi Kamal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c3067c2c38316c3ef013636c93daa285ee6aaa2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Wadhwa/dt-bindings-rpmh-regulator-Add-compatibles-for-PMH01XX-PMCX0102/20250916-210231
base:   c3067c2c38316c3ef013636c93daa285ee6aaa2e
patch link:    https://lore.kernel.org/r/20250916-glymur-rpmh-regulator-driver-v2-3-c6593ff9b4be%40oss.qualcomm.com
patch subject: [PATCH v2 3/4] regulator: rpmh-regulator: Add support for new resource name format
config: i386-buildonly-randconfig-001-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171822.oRjF64pS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171822.oRjF64pS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171822.oRjF64pS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/qcom-rpmh-regulator.c:47 Enum value 'NUM_REGULATOR_TYPES' not described in enum 'regulator_hw_type'
>> Warning: drivers/regulator/qcom-rpmh-regulator.c:167 bad line:                                 on the PMIC.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

