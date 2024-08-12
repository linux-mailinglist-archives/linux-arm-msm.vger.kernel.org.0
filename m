Return-Path: <linux-arm-msm+bounces-28306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269194ECCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 14:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064CAB2168A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 12:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EACE17A5B3;
	Mon, 12 Aug 2024 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGv8S8N7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E672178378;
	Mon, 12 Aug 2024 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465327; cv=none; b=G2m1comORgmRnAH4IrwWOv1kvI4pS84Vhf6b509yF3TMdmQzonFXGzu60eb3SGrcCXxrNpCMmHgduEc+sC1J8C5YwyDWL8y460Hv4aXtQ+lhglJHsmDlisfTDOK1RJ/mgsBXovZoiAu+3KzWe0NugrXOJEimGkOIm6OQbJiZNS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465327; c=relaxed/simple;
	bh=HFV7316f8OL34MS0ZCpJOtEvzcKpfHA6eGe3X0LdvaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UclsJ1bScacyCaNZMniVMnmPeWx+0mfpVXr7c7kmNZsVJbHbDtMFl1fmZ+R4OS1J1Eii8lFNpPLdoMIwtUu2iXdkCQ159KNn7EijQ3qafWeHrqJ7xoy5Z5JFGiWXX8ZJr2YB21DvuErb+etdOQE50r06rgUvQkb9iwHktYjLwXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGv8S8N7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723465325; x=1755001325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFV7316f8OL34MS0ZCpJOtEvzcKpfHA6eGe3X0LdvaM=;
  b=NGv8S8N71s1LAkFkLH+RanhmO341MgDXtBLuU/Tt7dYr6yp9e3tjRyfc
   fMXFZ8tm+LIiQZoTuXsd0ghTxyiSoJFvkcsgUJbqpzSmael/qNGGvPvAY
   y97ewxE4CX1uStfY42gxiakzLpDBYcSt17i4rDB7tvMZhVFee1nWSY8el
   xan1g3y0m3dmWFtu+M5FTMRncJjebvJQdiAMYdDm8JqzRskbB0vE9DJ2P
   q3eW5+K9pfMVn6XRnq9+SkQO0NPP5SQaUuIqgUj0lTMwihw4HvkeDFLuO
   6dmv9gQBP4LwgXuGut/FZeaXjX2HKOWd/hL659c5C+H694+CkTQcMmbJ1
   g==;
X-CSE-ConnectionGUID: N3abWAumQbGNQ1+FYdZaWw==
X-CSE-MsgGUID: 73VYVRm7SSyaA9qfuFeISA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32722577"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="32722577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 05:22:04 -0700
X-CSE-ConnectionGUID: p2VOziQARoKW5YRCpafS5g==
X-CSE-MsgGUID: G9AlV4ecRfuAnFZxlFm4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="81490099"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2024 05:22:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdU3i-000BkD-1C;
	Mon, 12 Aug 2024 12:21:58 +0000
Date: Mon, 12 Aug 2024 20:21:55 +0800
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
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <202408122054.h09BWBT2-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240812 (https://download.01.org/0day-ci/archive/20240812/202408122054.h09BWBT2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122054.h09BWBT2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408122054.h09BWBT2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc3/core.c:39:10: fatal error: 'glue.h' file not found
      39 | #include "glue.h"
         |          ^~~~~~~~
   1 error generated.


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

