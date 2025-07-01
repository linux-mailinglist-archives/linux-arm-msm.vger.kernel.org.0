Return-Path: <linux-arm-msm+bounces-63250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00344AEFF87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE21A3BC4C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30FE2797B2;
	Tue,  1 Jul 2025 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIayuCJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDF279355
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386820; cv=none; b=hBVVNnU0MAgT2jRn7OTi0ETvEuxDn/K4iL9srI18bXwLe4Cg/lqPQx8gnsDTDY00ZX3xEcnwI5quAtWnhipfIGHK+4PyMobTk26T7+T7wgEGCIjLs7Qxoyo05IFaECNrjSKJozBT47PZI1nSBQfrgCzhYySooFV6dMemX5hGE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386820; c=relaxed/simple;
	bh=3M5nB2E9YcHQNnHX70EgopsKFaxdGgt8GZ249cYL49w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGG1rH7mkHzdfsU8EmBj6Y487BpOAg6oaHtb589GnDK2OJm6fUvLX/M6KxkGVwD9LfpwER6kId27XVKUuo1bGQd3xnd6E7CrUbrA+XuXT0pLNPHT/D5qGOiGTxMesUL1h+Ii5dyj9NjaPrRxdhfJbIXcDfeQWiDmlwtkPAgOwFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIayuCJZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386819; x=1782922819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3M5nB2E9YcHQNnHX70EgopsKFaxdGgt8GZ249cYL49w=;
  b=LIayuCJZ5Wf9t5wDgY9BYw1D0t+mzxHcQdpCxkD3K6iePrP84gm+SxxU
   mip9o3axVqnZOf7kEtoX87T5PPpq+8vwLmZpQ0/prLfOmRE8Ywa/L3Dzn
   nUYanplGp5FWX9BUoCbrLZZihMmG8ic9bEv9/iC/G/iNXANGW5v8hzNGZ
   edImh4mNvhrV1q/mGTMXeSDfm5qWM6xIaElmJuXUfuALqlUREXp/Lhz7C
   F7zmJQOmRHiGeGPtm9x3I661cWJocPg52B3VAYGYmXLKlQCRnQ57obFV6
   RghvxmTIyPv2MaL6mINYQQMIFnOdE9waHWRVmLQuY3oQLOLYXaS7C9FC8
   w==;
X-CSE-ConnectionGUID: +o6zJHCSQvqvi4j4j8as5g==
X-CSE-MsgGUID: ggbgesotRqmp0DTdeA1xwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64356356"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64356356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:20:18 -0700
X-CSE-ConnectionGUID: dSFEQWRlRbq6JBosOBqz9Q==
X-CSE-MsgGUID: X/DS8NV2QRWI8iZqqT3deA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158379298"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:20:17 -0700
Date: Tue, 1 Jul 2025 18:20:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 6/9] msm/mapping: Wait for devcore to become available
Message-ID: <20250701162014.u6lhg7g6gcjebofo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-7-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-7-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:09:00 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>

Is this the same as 1/9 patch?

One more nit just spotted, it is useally 'i-g-t' after PATCH:

[PATCH i-g-t 6/9] tests/msm/msm_mapping: Wait for devcore to become available

Regards,
Kamil

> 
> The devcore could take some time to show up, so add a igt_wait() with
> timeout so we don't fail the test if the devcore is not immediately
> available.
> 
> This addresses a source of flakeyness.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 846385bb5206..03a9e814c931 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -42,14 +42,18 @@
>   */
>  
>  static char *
> -get_and_clear_devcore(void)
> +get_and_clear_devcore(int timeout_ms)
>  {
>  	glob_t glob_buf = {0};
>  	char *buf = NULL;
> -	int ret, fd;
> +	int fd;
>  
> -	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
> -	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
> +	/* The devcore shows up asynchronously, so it might not be
> +	 * immediately available:
> +	 */
> +	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
> +			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
> +		      timeout_ms, 100))
>  		return NULL;
>  
>  	fd = open(glob_buf.gl_pathv[0], O_RDWR);
> @@ -175,7 +179,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	int fence_fd, ret;
>  
>  	/* Clear any existing devcore's: */
> -	while ((devcore = get_and_clear_devcore())) {
> +	while ((devcore = get_and_clear_devcore(0))) {
>  		free(devcore);
>  	}
>  
> @@ -208,7 +212,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	/* And now we should have gotten a devcore from the iova fault
>  	 * triggered by the read or write:
>  	 */
> -	devcore = get_and_clear_devcore();
> +	devcore = get_and_clear_devcore(1000);
>  	igt_fail_on(!devcore);
>  
>  	/* Make sure the devcore is from iova fault: */
> -- 
> 2.50.0
> 

