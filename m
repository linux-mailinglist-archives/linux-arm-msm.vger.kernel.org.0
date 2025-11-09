Return-Path: <linux-arm-msm+bounces-80853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36471C438F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 06:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A57F0347734
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 05:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F54123EA85;
	Sun,  9 Nov 2025 05:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvCt0oIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9501A9F88;
	Sun,  9 Nov 2025 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762667929; cv=none; b=GnqrBxkFiSH8hAx7/v2Jo+YicHRN5iC8mooQfgpJnPvumDQBpuzIFmba4dEsRTLLonTNdTIYWQAXuEDihllWoFjJjux1RCATaxJ3/TMlMJudGN+FfdSKEQtEpMPMATINIfjKABCGXbl7LAZJFIyPezN1VZ2/PmXWsBzUjRj6PAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762667929; c=relaxed/simple;
	bh=dJDKBI9C/t3oC8rzuP3IFu6rPxvZkeXCeHJ+1VHh/oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fmp8MJO8QMY42qRLmyhozGnNjf/2x+W4yoJwpM9Sjti8Cej7D/ndBEgoyAuR8gxxx/DUaiJosqBExFnmXpMkBZhJTiUNRSyDGkMNr8UMZThKRufEnQGfylk26qOoUUYOPWqkz7Gbu2mqZ2rO8ygKsvSSQsVdG2cv7GOo97r4w8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvCt0oIC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762667927; x=1794203927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJDKBI9C/t3oC8rzuP3IFu6rPxvZkeXCeHJ+1VHh/oI=;
  b=RvCt0oICgu0eCezi7zWxWp9gYvdFgzncmp+u2RjzugQlgGD7IaWVlazD
   wVNW3wUdksOkUkaHGkdRffa+9+J91L/SW7IbsRAbEq5+jQet6m1gW7Xqt
   yZsUNOVTrJCBLZNPYRgQBENXIZ93XhdKzEMwT+LYKCysvmMrqDvdACV50
   96oSAOBGI1Los3HSWpk1RjnbiQtwj5+pZgVYmQmKU69eR1JpDL7G+mMwq
   T6FE5fXLf5SVpk7I+QQQyNCVfDvUP2M7GahPysavWgmRTwt/1W8M3FRym
   YU68Qv2eqGQAiIgRqV9kkqcsKf869fO7e2RQH869NVLoaAlLJwvNbuRCt
   w==;
X-CSE-ConnectionGUID: KWqcI2gwRiex9ur+q+ZjVw==
X-CSE-MsgGUID: XY5C3zcBSqqKm3uKTOfvHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64685602"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64685602"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 21:58:47 -0800
X-CSE-ConnectionGUID: yoGoFhiLQZ6PRUbwZTIMSw==
X-CSE-MsgGUID: xnAORxazRya8mgr2lz4Zzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192784861"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2025 21:58:44 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHyRl-0001oF-1f;
	Sun, 09 Nov 2025 05:58:41 +0000
Date: Sun, 9 Nov 2025 13:57:59 +0800
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
Message-ID: <202511091302.TuplwHhw-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-005-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091302.TuplwHhw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091302.TuplwHhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091302.TuplwHhw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/iris/iris_platform_sm8250.c:20:48: error: array has incomplete element type 'struct iris_fmt'
      20 | static struct iris_fmt platform_fmts_sm8250_dec[] = {
         |                                                ^
   drivers/media/platform/qcom/iris/iris_platform_common.h:217:9: note: forward declaration of 'struct iris_fmt'
     217 |         struct iris_fmt *inst_iris_fmts;
         |                ^
   drivers/media/platform/qcom/iris/iris_platform_sm8250.c:21:3: error: use of undeclared identifier 'IRIS_FMT_H264'
      21 |         [IRIS_FMT_H264] = {
         |          ^
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:25:3: error: use of undeclared identifier 'IRIS_FMT_HEVC'
      25 |         [IRIS_FMT_HEVC] = {
         |          ^
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:29:3: error: use of undeclared identifier 'IRIS_FMT_VP9'
      29 |         [IRIS_FMT_VP9] = {
         |          ^
   4 errors generated.


vim +/IRIS_FMT_HEVC +25 drivers/media/platform/qcom/iris/iris_platform_sm8250.c

    19	
    20	static struct iris_fmt platform_fmts_sm8250_dec[] = {
    21		[IRIS_FMT_H264] = {
    22			.pixfmt = V4L2_PIX_FMT_H264,
    23			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    24		},
  > 25		[IRIS_FMT_HEVC] = {
    26			.pixfmt = V4L2_PIX_FMT_HEVC,
    27			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    28		},
  > 29		[IRIS_FMT_VP9] = {
    30			.pixfmt = V4L2_PIX_FMT_VP9,
    31			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    32		},
    33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

