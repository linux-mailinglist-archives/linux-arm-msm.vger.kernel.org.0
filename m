Return-Path: <linux-arm-msm+bounces-63249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9933AEFF7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 113731C05757
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100A21F03D7;
	Tue,  1 Jul 2025 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Whd5ip/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB771F4CBF
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386650; cv=none; b=EcPizXPIkkgn+YCj8WIdUA5o41ra9Bo6xHk+PrpNoFRpo8QhFt+bCgOYv0N495r2ECPSUztsXWneQm+l5F65C922ACqWVi6SLXs34ZyivrGTsCz7xO0U/9qPBq2bpfa7XPCHjJ3LoTbeYf08nZjiaaeXmGbakg2FyL7cRZrrnW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386650; c=relaxed/simple;
	bh=LoZP6vnPKqD4j5OLz6FpScwWiS67X0cjWy4fAx7z3No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1Ol1c7JyzUCX8c9B9LqG3Je3KoeIRaK63a6xrgjmDvIEg9iRRoqLVBoquhZXCg9AHGE/JcroPG2+SGaVgOKVMDuLr1cTYaF1wO8cydDEYBHX8O3amnv9qVDuwCDOXREPsgiPh3rIP9DKHxwZey5y5hZ7hK5WZ1T09vn3oPeusM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Whd5ip/9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386648; x=1782922648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LoZP6vnPKqD4j5OLz6FpScwWiS67X0cjWy4fAx7z3No=;
  b=Whd5ip/95slhi6E9BMtqTrHkl0e2JSU4kU1dOP6i59gy3QcFtQjAS2P3
   qrHZjRL1cWL4bx5uGqVWbxcJ9NIHxk+ieRzsCCEr6eibTRLQ0HCjCrgSi
   lDfWytUMgGEkLADu8LsuoDbR2h70m4Sjx8RON8Lm7ondadpaLRwjtD4pK
   d5sUbjZvqQ6TYeeSJ7qF1aKnOZDu1Dotl2hj39W7h/t8MK9HZ2JEBbQyv
   gb50VCJPPphNAcs2bdRybgQsJRkei/HDr4nb3s1+damz0Wd9yJPoDZFl/
   oQ06Ihvv0hydvrM1YMDhy1trofF1H+NH0rum5o1fPlw8gkrquH3gwKATw
   g==;
X-CSE-ConnectionGUID: wDNtzGFQT4aL5zC1Jm3jWg==
X-CSE-MsgGUID: /BC42rIjTBiacaxlJK0EmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52893207"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52893207"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:17:28 -0700
X-CSE-ConnectionGUID: OXJT+QJuRYqbN/ydm/hTgg==
X-CSE-MsgGUID: awzV6v/sRRGdQGecFboR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159328015"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:17:26 -0700
Date: Tue, 1 Jul 2025 18:17:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 5/9] msm/mapping: Add additional subtests
Message-ID: <20250701161724.y5sqpnw3e4yrd3au@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-6-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-6-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:08:59 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

Fix 'From: ' e-mail, also please add to all subjects 'tests/' prefix:

[PATCH igt 5/9] tests/msm/msm_mapping: Add additional subtests

Please apply that also to other tests in series.

Btw, why not a little more desciription in subject?

[PATCH igt 5/9] tests/msm/msm_mapping: Test inaccessible buffers

Regards,
Kamil

> 
> Test a few additional buffers that userspace should not have access to.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 5afbcd081fc7..846385bb5206 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -253,6 +253,36 @@ igt_main
>  		do_mapping_test(pipe, "shadow", false);
>  	}
>  
> +	igt_describe("Test pwrup_reglist mapping, should be inaccessible");
> +	igt_subtest("pwrup_reglist") {
> +		do_mapping_test(pipe, "pwrup_reglist", true);
> +		do_mapping_test(pipe, "pwrup_reglist", false);
> +	}
> +
> +	igt_describe("Test memptrs mapping, should be inaccessible");
> +	igt_subtest("memptrs") {
> +		/*
> +		 * This test will fail on older GPUs without HW_APRIV, but
> +		 * there isn't a good way to test that from userspace, short
> +		 * of maintaining a giant table.  Probably just easier to
> +		 * list it in xfails or skips for those GPUs.
> +		 */
> +		do_mapping_test(pipe, "memptrs", true);
> +		do_mapping_test(pipe, "memptrs", false);
> +	}
> +
> +	igt_describe("Test 'preempt_record ring0' mapping, should be inaccessible");
> +	igt_subtest("preempt_record_ring0") {
> +		do_mapping_test(pipe, "preempt_record ring0", true);
> +		do_mapping_test(pipe, "preempt_record ring0", false);
> +	}
> +
> +	igt_describe("Test 'preempt_smmu_info ring0' mapping, should be inaccessible");
> +	igt_subtest("preempt_smmu_info_ring0") {
> +		do_mapping_test(pipe, "preempt_smmu_info ring0", true);
> +		do_mapping_test(pipe, "preempt_smmu_info ring0", false);
> +	}
> +
>  	igt_fixture {
>  		igt_msm_pipe_close(pipe);
>  		igt_msm_dev_close(dev);
> -- 
> 2.50.0
> 

