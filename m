Return-Path: <linux-arm-msm+bounces-83243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3859C84C97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C08214E30AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02287314A70;
	Tue, 25 Nov 2025 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1/VPxhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ADF27144B;
	Tue, 25 Nov 2025 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071136; cv=none; b=X20DC5K+UzOIUuSucM+eP982rxUYffnoK3S4CGOQuKn34EOVTpl4r9NsQgoJq2JK6032IbQPEAYKU4xftzp0+YQcCgAoAoQ1RGwpJ3JtxUBd+RLHxVzl2QtkBaTJc/bnQxVYNs8ugwHepV+KB/MfcjcaHMCBTPVCn0CYhDEmLVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071136; c=relaxed/simple;
	bh=wxpR9kK07kWmOlQUvX49zrpQRrvjiKoa6JswBCvlN78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lprcN6yflKICYC9DICDA+bzcBlFlFsEyJVzb+GAsoKUYNLp2P/QnX3QU/1IC4OYgmGdcbkDHTi61+LGTjumYFqKaZLDIC4VZZNxOXWtJE9dTiZRwIQn7RJCfcfqZ02ShbSXn+VtXJYPzneXwp/hDHCEN4VGm3ZynInlGJ+4XQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1/VPxhx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764071135; x=1795607135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxpR9kK07kWmOlQUvX49zrpQRrvjiKoa6JswBCvlN78=;
  b=X1/VPxhx+WQznopZ60hliB9kNYmJ/zMgfBvSdvtsuHjCL9OQa3zD9qoT
   +7ofxvgayD1x9sH691Sj60Y6OO5MfOk2j1LLiJ89sfiPAVfc1J4Q/UVGy
   iiVPOwlSdgAL5jQvhrnmhUSlapijHe52qAwY3Xy4jDmnftMdt4jAxsAPY
   BERagq26hJqEwXW/k18pQHbVK15Ps+qoQK1CJEdoqEkrTdJPLbJ2gKYy3
   V+ArYz604XEpslYn4Mioh54Vxy+vvxFShU35mSc+lIG7IZu3dCWG7IR55
   uv5WmCfBC8nvm5rn4/8U99J3SFAFas1Dhfc6zLbzkLHn6Fi89o2wH136I
   Q==;
X-CSE-ConnectionGUID: CI+AQc2vQFe7jrUGdhTD8A==
X-CSE-MsgGUID: 3R3Z61LrSF6hyR7XAS4dRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69946905"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="69946905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:45:35 -0800
X-CSE-ConnectionGUID: 6gsUeQENROGd5YfL7Bnx1Q==
X-CSE-MsgGUID: CBsbMmzkSHGg6iZBiRQoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223290658"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2025 03:45:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrU9-000000001hl-0tl3;
	Tue, 25 Nov 2025 11:45:29 +0000
Date: Tue, 25 Nov 2025 19:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Collins <david.collins@oss.qualcomm.com>,
	konrad.dybcio@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	kamal.wadhwa@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v4 3/3] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
Message-ID: <202511251730.R2wx1j01-lkp@intel.com>
References: <20251124-pmic_arb_v8-v4-3-d91dcbf097c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmic_arb_v8-v4-3-d91dcbf097c7@oss.qualcomm.com>

Hi Jishnu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jishnu-Prakash/dt-bindings-spmi-split-out-common-QCOM-SPMI-PMIC-arbiter-properties/20251124-175115
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251124-pmic_arb_v8-v4-3-d91dcbf097c7%40oss.qualcomm.com
patch subject: [PATCH v4 3/3] spmi: spmi-pmic-arb: add support for PMIC arbiter v8
config: loongarch-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251730.R2wx1j01-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251730.R2wx1j01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251730.R2wx1j01-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spmi/spmi-pmic-arb.c: In function '_pmic_arb_init_apid_v7':
>> drivers/spmi/spmi-pmic-arb.c:1391:13: warning: unused variable 'ret' [-Wunused-variable]
    1391 |         int ret, i;
         |             ^~~


vim +/ret +1391 drivers/spmi/spmi-pmic-arb.c

  1386	
  1387	static int _pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index,
  1388					  int max_buses, unsigned long periph_mask)
  1389	{
  1390		struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
> 1391		int ret, i;
  1392	
  1393		if (index < 0 || index >= max_buses) {
  1394			dev_err(&bus->spmic->dev, "Unsupported bus index %d detected\n",
  1395				index);
  1396			return -EINVAL;
  1397		}
  1398	
  1399		bus->base_apid = 0;
  1400		bus->apid_count = 0;
  1401		for (i = 0; i <= index; i++) {
  1402			bus->base_apid += bus->apid_count;
  1403			bus->apid_count = readl_relaxed(pmic_arb->core +
  1404							PMIC_ARB_FEATURES + i * 4) &
  1405							periph_mask;
  1406		}
  1407	
  1408		if (bus->apid_count == 0) {
  1409			dev_err(&bus->spmic->dev, "Bus %d not implemented\n", index);
  1410			return -EINVAL;
  1411		} else if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
  1412			dev_err(&bus->spmic->dev, "Unsupported max APID %d detected\n",
  1413				bus->base_apid + bus->apid_count);
  1414			return -EINVAL;
  1415		}
  1416	
  1417		return pmic_arb_init_apid_min_max(bus);
  1418	}
  1419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

