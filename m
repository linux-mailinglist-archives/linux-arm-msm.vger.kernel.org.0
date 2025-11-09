Return-Path: <linux-arm-msm+bounces-80852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA70DC43835
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 04:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49AFC4E4203
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 03:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05F818C008;
	Sun,  9 Nov 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB6CrVDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EDB849C;
	Sun,  9 Nov 2025 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762659037; cv=none; b=ZUTK+xtIpeWT0dVD+wzyd49LaArkfkZm+rkCQ64kDLLqXY2/viDqX2+Kacc/mL+mJzmfi5T4mnXuPcQhXvVFP0RRM+hRPxdSXG67iWI+pleE3/AY08rejYfpkCb1ovg1Lam+CQ50t6qQKxzrMSCXl8PsI1+jh1UWbMEitD7+cwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762659037; c=relaxed/simple;
	bh=yZEAGwURIMOpNzUf3sxYiyZAyBr02IHF5nAGfKtPkWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9VcwI8e/bbzuXGfrCY47K2gtiPLFisjPaFmh8sTuZ8+EkC3O6PiYsbfhc09+yCr07w6jgtWqTthaKgaN9Nvkpe7K9XozT/fFHd3rI5lcJyG/58oHnFUptFIamht2Kgj4PtGE8B+rqIti1QrNqC/5vSpcYSHXbKmCsaYMBZNbvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB6CrVDv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762659035; x=1794195035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZEAGwURIMOpNzUf3sxYiyZAyBr02IHF5nAGfKtPkWQ=;
  b=aB6CrVDvuxnwwl9it4fAOuE70jDS9Yf3Gobmu/albaq1yofJ79zIZ+jb
   /nXwGMbQWXpHFh1M74ccFL+1wn6KHQL9oaKIwlPME76GD0R1tcY8qAF/b
   wy34E3VllVuXwqLZ4xwwMhvvroiTSVcJP4cg/s3WyGXa903PnaN0DYExm
   SJ2z6ZEysY/OSDlayByc2X8yZMMKdFlhmNxHYoI1MaG6p20jimOtvALLb
   eXXtGAyNuiuZC2bnUMzTqj2vlUnkd/EvJnrcbJvF6KcFS/nt+hc2qcyG+
   T5kYHb3xr7XRh6T8ZcBwp3eIzr/WaF3a36qC6F62aFLxIrAhOEgJCTcB8
   A==;
X-CSE-ConnectionGUID: TAMDRmHrQwONZVZd9ZlsMg==
X-CSE-MsgGUID: HOPUaL/QRc6mtU43U2gR1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64682658"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64682658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 19:30:35 -0800
X-CSE-ConnectionGUID: rwuu/ZJ7QQWX2vhcHh3YPQ==
X-CSE-MsgGUID: 3SOf6dZuR7e+sb/YSRa2mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192766924"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2025 19:30:32 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHw8L-0001jj-1S;
	Sun, 09 Nov 2025 03:30:29 +0000
Date: Sun, 9 Nov 2025 11:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] media: iris: Add support for AV1 format in iris
 decoder
Message-ID: <202511091157.56GOf0kL-lkp@intel.com>
References: <20251107-av1d_stateful_v3-v5-3-351652ba49cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-av1d_stateful_v3-v5-3-351652ba49cd@oss.qualcomm.com>

Hi Deepa,

kernel test robot noticed the following build errors:

[auto build test ERROR on 163917839c0eea3bdfe3620f27f617a55fd76302]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-uapi-videodev2-Add-support-for-AV1-stateful-decoder/20251108-122511
base:   163917839c0eea3bdfe3620f27f617a55fd76302
patch link:    https://lore.kernel.org/r/20251107-av1d_stateful_v3-v5-3-351652ba49cd%40oss.qualcomm.com
patch subject: [PATCH v5 3/5] media: iris: Add support for AV1 format in iris decoder
config: powerpc-randconfig-002-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091157.56GOf0kL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091157.56GOf0kL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091157.56GOf0kL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:20:48: error: array has incomplete element type 'struct iris_fmt'
      20 | static struct iris_fmt platform_fmts_sm8250_dec[] = {
         |                                                ^
   drivers/media/platform/qcom/iris/iris_platform_common.h:217:9: note: forward declaration of 'struct iris_fmt'
     217 |         struct iris_fmt *inst_iris_fmts;
         |                ^
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:21:3: error: use of undeclared identifier 'IRIS_FMT_H264'
      21 |         [IRIS_FMT_H264] = {
         |          ^~~~~~~~~~~~~
   2 errors generated.


vim +20 drivers/media/platform/qcom/iris/iris_platform_sm8250.c

    19	
  > 20	static struct iris_fmt platform_fmts_sm8250_dec[] = {
  > 21		[IRIS_FMT_H264] = {
    22			.pixfmt = V4L2_PIX_FMT_H264,
    23			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    24		},
    25		[IRIS_FMT_HEVC] = {
    26			.pixfmt = V4L2_PIX_FMT_HEVC,
    27			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    28		},
    29		[IRIS_FMT_VP9] = {
    30			.pixfmt = V4L2_PIX_FMT_VP9,
    31			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    32		},
    33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

