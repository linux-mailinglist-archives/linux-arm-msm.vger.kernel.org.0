Return-Path: <linux-arm-msm+bounces-63259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51CAEFFC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DDBF1882567
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F107F27933C;
	Tue,  1 Jul 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpody61W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B41B0421
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387242; cv=none; b=m9Y7ob/vRFElVeCfn7Mo4+2X4HQvw9tpkhaPleKcuC0Zr4eHa8HhuKC81kaScHd+3yvU3mjdYfHDf9dCoX8LYTbuUXnakFuj1vmeRZhm1LvW97xSR8KpD7dzDb8b6kFEIrta5FatptMjrr7e7FsCCH7pT0O0PfQW2DxiAqxIbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387242; c=relaxed/simple;
	bh=r8aCbOrvK5yXRlAjcwtL1RGpAvHh8bEw7Cetc8lBD0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrokubxZ+fGJ3JPcQhDnhokhl3saTLbX7o/F8CXQgpAVZRzGxZDL3O+mKSPtnUfdXguMxSCiAvYYFsYsXAt7xO3uslvxQ4mQw3BVTpM6nqWI440S8j1IFoNXzlCJBP2MXw3AgULVFSp43emxJsKtRraBGwyaVWDgf0ow3hBVtlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpody61W; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751387241; x=1782923241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r8aCbOrvK5yXRlAjcwtL1RGpAvHh8bEw7Cetc8lBD0o=;
  b=dpody61WBeNs3m3rgjxceyR3hTOFdcrW9l0vBpi+0KBq+Ze+1sW9N39l
   EyDWqaioNZZ0GAnxiCO6mvuxasj/TH8DBvyyD9pGv+15vRPFgNZqFNpoJ
   qjOhaFBEn1LW9rXvBO6+CEyySy8Jm5VcTI5pi1iGFBhV34ULF/XnWYPge
   ytf5JLL1pMURY6Fy/T7baA4xm+5KX+DHlgWXzH9PsKLG77WLyxfBbUmnd
   QijuGYtKVinJcLBzoLxcqQASY+e1HbQ7KlKZ5/peVy17eotCA+4MAUlr9
   qLPhnsYseJGnv5QWGlNwFf0uzRizDRulTV5jx9FsS6z8esmzxjtuXAFoF
   Q==;
X-CSE-ConnectionGUID: 3LfzOff2TtOkakhanghxww==
X-CSE-MsgGUID: 07N+thC7Qc2CTF0YP/8UCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53524130"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53524130"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:27:21 -0700
X-CSE-ConnectionGUID: kVo0tJiYS3arhTndJSgJiw==
X-CSE-MsgGUID: jN8EM2HRQWiH2Bfh2P9pTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153228196"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:27:19 -0700
Date: Tue, 1 Jul 2025 18:27:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 9/9] msm/mapping: Free devcore
Message-ID: <20250701162716.hrlbt2uecrv65nys@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-10-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-10-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:09:03 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>

imho:

[PATCH i-g-t 9/9] tests/msm/msm_mapping: Fix memory leak

Also imho this should be your first patch, so fixes first,
but it is up to you.

Regards,
Kamil

> 
> We shouldn't leak the devcore.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 7e2f5c7eadc8..b735d5f014c3 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -249,6 +249,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	igt_fail_on(ret != 1);
>  	igt_fail_on(addr != fault_addr);
>  
> +	free(devcore);
> +
>  	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
>  	 * would not generate a devcore:
>  	 */
> -- 
> 2.50.0
> 

