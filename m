Return-Path: <linux-arm-msm+bounces-63242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD2AEFF26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A675166694
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369171A0BF3;
	Tue,  1 Jul 2025 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9lc2hpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081C1E32D3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386160; cv=none; b=RtUuMDD/+W77GQj6Oe89sLOFBeYGrg6KoG6CY6O+3EW1zwSWoaFRl02qD0bRakUzBmH5snREbhIAlw8Zowv/vJCkzTDyO+fAI69BuaEu4R8CkZLNULO72JCUxj8YD86bqNWERCpywt0Z1IY8Ys9j6lIAe4hLA++Y84Y/03JEFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386160; c=relaxed/simple;
	bh=+wHArhLIQ8X6LOJbWLKMls1Djn74F5eDK9f0wvi/eZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq6Zl6uVek+VlAIPMbJexkvtgjoWFliwJVlRJ5uPppZIB17OAdqR0A6FWVFONSMkzcZENjHxKBW/fN4G6DyUac2k7+hnmS5IsXNDn6MSUf6LZdEeJSyg/8y729W1QlMwIFnPiwAK4lUdDLS2tefO/BFAbzMK/WBE3VtTN+jetes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9lc2hpz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386158; x=1782922158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+wHArhLIQ8X6LOJbWLKMls1Djn74F5eDK9f0wvi/eZM=;
  b=P9lc2hpz7H9PAlXVAV0KZ5aR8tBRkpfIdhfxlLAK36FBpMSbf9rJS1nl
   ucY1VNYM7Qva6QsEohzXIJJxXOngDZ1FeN/Abpihe4oabWv1XCmFuw2st
   r9ez7DW2S3HJaryohi/klTxcbdFCrFjx6lzovt+Sdu8LFhjh+wdRYD4Sp
   YydrVr+GE1xTtdDfXW4/tohsa2sogDXMsmBVrZHJmp1FxskQoMz9LlY4e
   YEdFMtZ6U48aSZZs3h6VbG2wBNUsJulXa0zi3qyq1FFjZbBwDme40ClB0
   drTpRKk4ZG6VPjwggcswGzp+DWsYRsad/3sD15nlBdt4YTeLmhEeVveAT
   A==;
X-CSE-ConnectionGUID: E2fW721zSsKstMNnRPzeNQ==
X-CSE-MsgGUID: 6PqnLIUISPuoHkniEpvUNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="76210431"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="76210431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:09:15 -0700
X-CSE-ConnectionGUID: 2bwetq6DQnCikLDQ7OnH9Q==
X-CSE-MsgGUID: W4xuiwVyTaGa5NZEVqrmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="177481055"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:09:13 -0700
Date: Tue, 1 Jul 2025 18:09:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 2/9] drm/recovery: add iova-fault-stress test
Message-ID: <20250701160911.6rcsripyyuztn5wm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-3-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:08:56 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

This 'From: ' do no match your s-o-b below, please fix it.

Please run checkpatch.pl from Linux kernel on your patches.
Few helpfull options could be found in CONTRIBUTING.md

Also improve subject to:
[PATCH igt 2/9] tests/msm/msm_recovery: add iova-fault-stress test

> 
> Add a test which triggers many faults to test robustness.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_recovery.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index 433392079bd4..8a83a6f24c41 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -195,6 +195,23 @@ do_parallel_test(struct msm_pipe *pipe, int child)
>  	igt_msm_cmd_free(cmd);
>  }
>  
> +static void
> +do_fault_test(struct msm_pipe *pipe, bool stress)
> +{
> +	struct msm_cmd *cmd =
> +		igt_msm_cmd_new(pipe, 0x10000);

Why not in one line? Imho this is better:

	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x10000);

> +	unsigned cnt = stress ? 0x10000/16 : 1;

Use 'unsigned int' here, also

Place space around '/', also make 0x10000 a const or define it.

For example:
	const unsigned int f_cnt = 0x10000;
	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, f_cnt);
	unsigned int cnt = stress ? f_cnt / 16 : 1;

> +
> +	for (unsigned i = 0; i < cnt; i++) {

Use 'unsigned int' here:

	for (unsigned int i = 0; i < cnt; i++) {

Regards,
Kamil

> +		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> +		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> +		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> +		msm_cmd_emit(cmd, 0x123);                /* VAL */
> +	}
> +
> +	igt_wait_and_close(igt_msm_cmd_submit(cmd));
> +}
> +
>  /*
>   * Tests for drm/msm hangcheck, recovery, and fault handling
>   */
> @@ -242,18 +259,16 @@ igt_main
>  
>  	igt_describe("Test iova fault handling");
>  	igt_subtest("iova-fault") {
> -		struct msm_cmd *cmd;
> -
>  		igt_require(dev->gen >= 6);
>  
> -		cmd = igt_msm_cmd_new(pipe, 0x1000);
> +		do_fault_test(pipe, false);
> +	}
>  
> -		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> -		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> -		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> -		msm_cmd_emit(cmd, 0x123);                /* VAL */
> +	igt_describe("Test iova fault handling (stress)");
> +	igt_subtest("iova-fault-stress") {
> +		igt_require(dev->gen >= 6);
>  
> -		igt_wait_and_close(igt_msm_cmd_submit(cmd));
> +		do_fault_test(pipe, true);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.50.0
> 

