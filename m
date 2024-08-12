Return-Path: <linux-arm-msm+bounces-28309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3994EE4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613E01F213A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 13:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87B717D35C;
	Mon, 12 Aug 2024 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2rBjxwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8217C9F1;
	Mon, 12 Aug 2024 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469632; cv=none; b=WLwgGupQty6tkFsDoOTtUHHuuepVkfJ+2v4d38XBVvYVGHhOioMhRRRq4mSCQ05i4WY4FvrAtkuKyazewUKy/i2Azi68l1zAYDA9+B0FCrRDhd+DdOFdgE/7orA116piJ8N22yxC0WjbDaaGP3SBxeXtfowz8OeUuzK0a7Dk1nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469632; c=relaxed/simple;
	bh=svcb61qn8AxKiXVDKBeXBAH0VVejCzMPT1CCJAMUGFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF+HMtbUj8lMSw9xAmZQyldsEKp6Yu5FlnCXLrVCNbZtDl8gG38UF3EBq3kJ2mnwtrqgcVeox0Id7kwDW5VCo2W6vjgEFJttRnSd7v/p1zad6s56NB13lIpUX47QMWIgWUp5EDj3JB89c2HgkxdTfYn8RtW43RMXHIp7s78kc3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2rBjxwk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723469631; x=1755005631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svcb61qn8AxKiXVDKBeXBAH0VVejCzMPT1CCJAMUGFI=;
  b=i2rBjxwkIKMPuel9doBjdIcZbIWCNeGIgsTtIdvIpeghUk8F3jL2wnSB
   genB9BPgImDqNcKmM3RURHAMCBeZxHljtT3icr/fdSTtFCO5+8FjwW1D8
   7K6e+CZ46orAL2o9WBzs/tTPn+KyzC9PWP3dOSdyPAM7V6SclvCuurMBx
   AxyJfvxbPBCxd5RWvk8bQczA0dx5ZA5SxQ3usQTKK00U0oDyqwnoscqYF
   6VY5YJeKKQQPXClKP3QVTHl3u6Tbrz+JUkGZiccDG5gsFZPuAT44ziNAM
   iR4QnFzHGF4asV9moRic/QL+HhXK84AodbdECUF492Avbwj54HrJhlTQ9
   g==;
X-CSE-ConnectionGUID: xja2chZJRbKeGykZCH51+w==
X-CSE-MsgGUID: qb6Dd3MRSSqZq6MU0Ify7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="12963955"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="12963955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 06:33:50 -0700
X-CSE-ConnectionGUID: zCoNAwmISMu73RPe9ooqcQ==
X-CSE-MsgGUID: 6xzCFAvQRWu5p+ijHJzn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63197764"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2024 06:33:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdVB9-000Bpv-2w;
	Mon, 12 Aug 2024 13:33:43 +0000
Date: Mon, 12 Aug 2024 21:33:15 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <202408122114.xvZqrjZ7-lkp@intel.com>
References: <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>

Hi Bjorn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 864b1099d16fc7e332c3ad7823058c65f890486c]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/dt-bindings-usb-snps-dwc3-Split-core-description/20240812-111102
base:   864b1099d16fc7e332c3ad7823058c65f890486c
patch link:    https://lore.kernel.org/r/20240811-dwc3-refactor-v2-6-91f370d61ad2%40quicinc.com
patch subject: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
config: i386-buildonly-randconfig-002-20240812 (https://download.01.org/0day-ci/archive/20240812/202408122114.xvZqrjZ7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122114.xvZqrjZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408122114.xvZqrjZ7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-qcom.c:28:10: fatal error: 'glue.h' file not found
      28 | #include "glue.h"
         |          ^~~~~~~~
   1 error generated.


vim +28 drivers/usb/dwc3/dwc3-qcom.c

  > 28	#include "glue.h"
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

