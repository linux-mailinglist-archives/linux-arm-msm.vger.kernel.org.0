Return-Path: <linux-arm-msm+bounces-63257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39DAEFFA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBE9F7AC97F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38CD274B5D;
	Tue,  1 Jul 2025 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL+2JWEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B326FA62
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387065; cv=none; b=fkIfe5XaKGYIA2USyWopwBDt34sYLAHJ4cOtrCpK3omFZvpSTgnuHDkQagok3g8s7JhT4TVlmeXJAH4Zzy/Rd1sv5NZQ6oMeVsmMxGJ6D23ImHIslyelJSZB1P9a+Czhpu563Y5uy6aV0k8xxv0r+li/Bunok0FTA3xlMyFd9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387065; c=relaxed/simple;
	bh=1jir6hF7qNaX5vAt6+/hLSpgtvVjNWultV2KwJJ6HvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBjW3J7f8X83aFh1Cayu+09h0r/tXT7nkOhLeZf+X9t+EwvbShjaak4ah8pj3CfKGMuTvBp9AOgTc1XLt4CIbQ4gcE1X0+xpcBNLEgeAFpT5K3TXTWxc1LvK5wFym+N/A1tK4vxdZCTsh7wYIy5XnS9CBUJYH8p9v1xzHWbfWkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL+2JWEJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751387065; x=1782923065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1jir6hF7qNaX5vAt6+/hLSpgtvVjNWultV2KwJJ6HvE=;
  b=IL+2JWEJE4JwweDgLHB0T6YkZliW5EhLB9SxDcTmliJOBBrlAIAJv9/M
   5tKKnPT+WDxPkTEVHj33OAUNAL0N2J3njSb4jiycUINNj9wnUdKPophEB
   lOWvd1XJLyiTeHFUOFf0Zf3vuJyHFXXVqMHHTKU/Htm5XLszcv8TrW9U0
   pM7MTrVZ+gm4Wr1Jfadou1cjAuqn9hYgDwRXz2Km4WXm/0A2m2f0ki2C4
   gR53Heaiy+DqW67/PCbHnX3+8sU2lM5YiyIv0D3CwmrjRLvpuPeQGqh5b
   I7+u37SdPxTlo1LglkrAZkaKq4hEIrXKkUJQG6AT2paXp16hK6UoKWIOH
   w==;
X-CSE-ConnectionGUID: BFCcg4uFRQmzDXkvVezsxw==
X-CSE-MsgGUID: ZeDvAPwSTfiNj0/DHj6crg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53767618"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53767618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:24:24 -0700
X-CSE-ConnectionGUID: OYZSXrj2R9+K8CIm35iZlw==
X-CSE-MsgGUID: 0kQUAW5+SDKKSVU98K58vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="190996242"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:24:23 -0700
Date: Tue, 1 Jul 2025 18:24:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 8/9] msm/mapping: Add wait for stall-on-fault to
 re-arm
Message-ID: <20250701162420.7dndnmld2p73atex@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-9-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-9-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:09:02 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>
> 
> Newer kernels disable stall-on-fault for a grace period, to avoid a
> flood of faults causing instability with memory translations that
> the hw attempts with the translation stalled.  Fortunately it adds a

Is it system-wide or only for msm driver?

Please improve subject:

[PATCH igt 8/9] tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm

imho it could be shorter:

[PATCH igt 8/9] tests/msm/msm_mapping: Wait for stall-on-fault

Regards,
Kamil

> debugfs file so we can know how long we need to wait for stall-on-
> fault to be re-enabled.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 978ea18375dd..7e2f5c7eadc8 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
>  	return buf;
>  }
>  
> +static void
> +wait_for_stall_on_fault(int drm_fd)
> +{
> +	char buf[64] = "\0";
> +
> +	do {
> +		int us;
> +
> +		igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
> +		if (!strlen(buf)) {
> +			/* Not supported on older kernels: */
> +			return;
> +		}
> +
> +		us = atoi(buf);
> +		if (!us) {
> +			/* Done waiting: */
> +			return;
> +		}
> +
> +		usleep(us);
> +	} while (true);
> +}
> +
>  /*
>   * Helper to find named buffer address
>   */
> @@ -224,6 +248,11 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
>  	igt_fail_on(ret != 1);
>  	igt_fail_on(addr != fault_addr);
> +
> +	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
> +	 * would not generate a devcore:
> +	 */
> +	wait_for_stall_on_fault(pipe->dev->fd);
>  }
>  
>  /*
> -- 
> 2.50.0
> 

