Return-Path: <linux-arm-msm+bounces-61842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96427AE0FFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 01:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD3D1BC524A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 23:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDAC2957C3;
	Thu, 19 Jun 2025 23:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIfz47al"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0F2111;
	Thu, 19 Jun 2025 23:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750375201; cv=none; b=h1vbLa8yyrgVudMTGcp58IekyAZfajO91sHl+Qtd4YgR/wtTJpw3LwUnRrdYPTL9DXGFFRm+34vDhqaKQqgdVCTtT7FUmah5q5WxRM1V2iML1Mh6mzIVxpZikoVMtT113idYDHMAOFYFmWHBAMfWmZDlqios/ToQpAC3jgO3+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750375201; c=relaxed/simple;
	bh=j8lHpLt7QIx12mDapL4H8Ev9FToLw7SXkTFbGuqECMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z29YkMiK+yr4pOVla84p+AcReYzSpHmnMyohD/T5vlJTTi7w9vNYpEUi32ZSvTJ0so95DbnppR3E7An7p5OHQONLprpn+8mMI/Axa5ie085/zDPUxB9Phtcn8AgBJ7q/UDA8GDKATGGRzw6zW245GDRTQ6fUKI6++TKhxAtvGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIfz47al; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750375199; x=1781911199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j8lHpLt7QIx12mDapL4H8Ev9FToLw7SXkTFbGuqECMk=;
  b=DIfz47alhUhI4OJVw1FaJ1TZQXo6FXOosJndC98gpaiMSHUttAX1mQxH
   C1SVjHFLF7vLNLe7nCjo086qfPFsZOGTqQ3JJdovc4kjTsMojbcRYtzok
   F52edTqiZ0AdqnvDrI0tiwlbn9AyjhlrJVkkaZftrZrB99dTdwqygdE0S
   YNx/Eo1C2TCIoXtdKNZULeByPtw2YigxhiKqHNA9OVeM8cWOvrEW+VnOi
   e2G1MfH+RPmQyjWk7ZWO7nqw752M2O+UGVvtnhj0d5GmOyxnecGlPu/pm
   nd8vr/90714GvV+UTDfVN43cfRy9WKsjXJ1ChDJXZHdDyaOmOV1OCcktK
   Q==;
X-CSE-ConnectionGUID: MGR5adWiREm0rEf1qMIqkw==
X-CSE-MsgGUID: VawCR+3HSga6y7JhdHVgxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62896523"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="62896523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 16:19:58 -0700
X-CSE-ConnectionGUID: c92D4XivSke6aYKOKXOHig==
X-CSE-MsgGUID: D4Iv79z1TQKDH2Bpi0fy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="156559224"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jun 2025 16:19:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSOXy-000LAQ-00;
	Thu, 19 Jun 2025 23:19:54 +0000
Date: Fri, 20 Jun 2025 07:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
Message-ID: <202506200608.fGUpDcoG-lkp@intel.com>
References: <20250619070224.23428-2-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619070224.23428-2-quic_sayalil@quicinc.com>

Hi Sayali,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sayali-Lokhande/arm64-dts-qcom-Add-eMMC-support-for-qcs8300/20250619-150421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250619070224.23428-2-quic_sayalil%40quicinc.com
patch subject: [PATCH V2 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
config: arm64-randconfig-053-20250619 (https://download.01.org/0day-ci/archive/20250620/202506200608.fGUpDcoG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200608.fGUpDcoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200608.fGUpDcoG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/qcs8300.dtsi:3867.19-20 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

