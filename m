Return-Path: <linux-arm-msm+bounces-55797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249EA9D7A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 07:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C85B7AA311
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 05:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68F519DF6A;
	Sat, 26 Apr 2025 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="br8Sn5oJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF029B0;
	Sat, 26 Apr 2025 05:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644779; cv=none; b=e4dzdnQiBQlM9/l4L77qU0ifjgOQ3T9rX3l0kdF10siWEHlHn7/JYzUK5/5XJd2ZL0ZWquJLJx88QkR2LN3aF/r7Ej97sp0r8Sxb3pIJVhTtp6pliSU1g2RdEFKIaxFCXxMN8s6RCrjn7HF6sWYiru+IjmEZcEvF78gMDlFy6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644779; c=relaxed/simple;
	bh=9Tk4kop98w2lSr6Z5mOouvA3XaaXVtHJfJpOm6sjYs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZYUc5VU+Sp9tdfc6reLpIvIQ2j421Hej3+T/SjiVnwGYip76/QtMccA66Pf4P2hcqoDrGkrwnTKo3BrLYsxnPB3nrQkKYbcYWLIWUuKC+UV6KlOxorKWVWg8rrzipPwV3Ad0oOKFy8/PEwaSYDruJTo6Iq3+wSZvb1OzHaTu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=br8Sn5oJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745644778; x=1777180778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Tk4kop98w2lSr6Z5mOouvA3XaaXVtHJfJpOm6sjYs4=;
  b=br8Sn5oJjDmNcdL6DOPMjTop+9b6FUL/vXjwnp/8JWsCGCZkNoki4va0
   EpAxEe3V0Mlm3YUnn8RYlaamqIum31dSTwLk2Nsxd9wcn8/mTCAIkGO0h
   Oe9J9mERpnMgMkFOStTCsjGHaRf0cSCAnuT1gwE8Lqx3w2Fn5tvWu/APl
   ILICAlE3q7/vJIGQtZXYbCY8hKLDd1SuYMQnd7YFSRitGZUD1P39YdcHz
   FLIitr5nnalSCoBkatkGmyNvbZZ6NoXtNPAZB8OcvWm4BOz8DCfYvScl+
   0W88+Y1M7eQ0KNt9or6AEtfhD1+WwEh/4V52G7t5rPQS7NT17Q1VXuKK8
   Q==;
X-CSE-ConnectionGUID: qZLJEgnpQUiOitFpZdi1pA==
X-CSE-MsgGUID: RsJ7DSh8Q8KR6CtDAU8ayQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64725237"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="64725237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 22:19:37 -0700
X-CSE-ConnectionGUID: 0Frs03buSWG25IAdY7GLsA==
X-CSE-MsgGUID: /FaLD0w3R86Tlt1ZOcgp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="137884504"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2025 22:19:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Xwp-0005i5-0u;
	Sat, 26 Apr 2025 05:19:31 +0000
Date: Sat, 26 Apr 2025 13:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] coresight: Add coresight QMI driver
Message-ID: <202504261305.WCDIwfd5-lkp@intel.com>
References: <20250424115854.2328190-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424115854.2328190-3-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-CoreSight-QMI-component-description/20250424-200202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424115854.2328190-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v5 2/5] coresight: Add coresight QMI driver
config: arm64-kismet-CONFIG_QCOM_QMI_HELPERS-CONFIG_CORESIGHT_QMI-0-0 (https://download.01.org/0day-ci/archive/20250426/202504261305.WCDIwfd5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250426/202504261305.WCDIwfd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261305.WCDIwfd5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS when selected by CORESIGHT_QMI
   WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
     Depends on [n]: NET [=n]
     Selected by [y]:
     - CORESIGHT_QMI [=y] && CORESIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

