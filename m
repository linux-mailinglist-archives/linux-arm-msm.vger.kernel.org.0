Return-Path: <linux-arm-msm+bounces-28454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A09514D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 08:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D86D2837FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 06:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B9E7FBA2;
	Wed, 14 Aug 2024 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PebwvEop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492EB374F6;
	Wed, 14 Aug 2024 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723618665; cv=none; b=B3TBmIHb9ZHOaV6FfBM+/deiuZkTagn6QPmrno/fs0GSbePBQ7JKV+JMwsA2Y5XsLXuUHsdtoCOtBm255jVmV9lzbcKtYMwc1F1vv5jQ1oo8cYmBUuEXQXvXPNNqXDIb1Nh3ahP04QCp/PbRUx8L+ShSrrMDYjndKaRcqkkuwQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723618665; c=relaxed/simple;
	bh=KbjC+8/jzw6Q9BrnTVAM/narvymSlwbeb8erjHMmhvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=riFa4AFefGHJ4XBFpQ1RFKwCVzwGf0fyTMhszf1xPX9ZC5nvB1AVov5Lax3RzqLeMty9u4wg0bxsKWxeQnQy3QCYhejbMfyTx1dYuF08nCKj4tJgX0HFOsA0qgCXcbuRVQIMcUHx8/bK6K7uSrugSn6l2F+bwP5BrRFpsdO/Wcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PebwvEop; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723618664; x=1755154664;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=KbjC+8/jzw6Q9BrnTVAM/narvymSlwbeb8erjHMmhvY=;
  b=PebwvEopFPubn4zZ2ZyanWzhJKsmdkKNJXtilpwlu4ACSuHiFtjvYsZq
   qWnCtnUTgzr/96kanPKxs9XJI4Ng4JNre27F/XvOp1V8pBKjbqU0CGsoU
   FOoOsY0l5nM+62LGNXRsBJwC8hOjzgjVg+0mU0JntJ5XsZTsGiwtAcSds
   1gIz5TzWfw+BWMt7J8Oae4+Ez+gExDMjK/ufG0t7q79KhQBxcnixzxGhx
   CWp23M0En3Qr8+LikyEikcQXHGdeVDhu0sGC5tLNdQMUua3NWTI371XlQ
   Eqws7lK951+56hAu8cjB/QxEBYc8XcFvLUwOLb4jk3VTBjCGHAHejJIx2
   A==;
X-CSE-ConnectionGUID: XSmA39yeRomrMVTczTwmpw==
X-CSE-MsgGUID: Xe2AVseNS8KL/yRoITr0RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25616268"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="25616268"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 23:57:43 -0700
X-CSE-ConnectionGUID: IfreNJmLQJ6Fmwazs/raPw==
X-CSE-MsgGUID: 4eGjZP04TA6E/T/EX9iWgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="59022609"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.65])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 23:57:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 akinobu.mita@gmail.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/3] fault-inject: improve build for
 CONFIG_FAULT_INJECTION=n
In-Reply-To: <20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
Date: Wed, 14 Aug 2024 09:57:31 +0300
Message-ID: <87cymbzj50.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 13 Aug 2024, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Tue, 13 Aug 2024 15:12:35 +0300 Jani Nikula <jani.nikula@intel.com> wrote:
>
>> The fault-inject.h users across the kernel need to add a lot of #ifdef
>> CONFIG_FAULT_INJECTION to cater for shortcomings in the header. Make
>> fault-inject.h self-contained for CONFIG_FAULT_INJECTION=n, and add
>> stubs for DECLARE_FAULT_ATTR(), setup_fault_attr(), should_fail_ex(),
>> and should_fail() to allow removal of conditional compilation.
>> 
>> --- a/include/linux/fault-inject.h
>> +++ b/include/linux/fault-inject.h
>>  
>> -#include <linux/types.h>
>> -#include <linux/debugfs.h>
>
> Removing a nested include exposes all those sites which were
> erroneously depending upon that nested include.  Here's what I have
> found so far, there will be more.

Right. I didn't hit them with the configs I tried... though I wonder why
not, especially lib/fault-inject.c puzzles me.

How do you want to proceed? Arguably uncovering and fixing those places
is good, but that's kind of an unintended consequence here.

BR,
Jani.


>
> --- a/mm/failslab.c~fault-inject-improve-build-for-config_fault_injection=n-fix
> +++ a/mm/failslab.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/fault-inject.h>
>  #include <linux/error-injection.h>
> +#include <linux/debugfs.h>
>  #include <linux/slab.h>
>  #include <linux/mm.h>
>  #include "slab.h"
> --- a/lib/fault-inject.c~fault-inject-improve-build-for-config_fault_injection=n-fix
> +++ a/lib/fault-inject.c
> @@ -2,6 +2,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/random.h>
> +#include <linux/debugfs.h>
>  #include <linux/sched.h>
>  #include <linux/stat.h>
>  #include <linux/types.h>
> --- a/kernel/futex/core.c~fault-inject-improve-build-for-config_fault_injection=n-fix
> +++ a/kernel/futex/core.c
> @@ -34,6 +34,7 @@
>  #include <linux/compat.h>
>  #include <linux/jhash.h>
>  #include <linux/pagemap.h>
> +#include <linux/debugfs.h>
>  #include <linux/plist.h>
>  #include <linux/memblock.h>
>  #include <linux/fault-inject.h>
> _
>

-- 
Jani Nikula, Intel

