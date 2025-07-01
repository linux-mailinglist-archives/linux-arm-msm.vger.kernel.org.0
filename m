Return-Path: <linux-arm-msm+bounces-63241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BAAEFEBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2201739FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 15:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2799126B775;
	Tue,  1 Jul 2025 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZobNnlw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE64248866
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385504; cv=none; b=YmZVdQysLhSTiJDvXMSVB3USpBKURCGs0ZYiYhbm8GTIPwBCrQR5jfTiY9qk/t6YoNy0uVSVK91NLDeeZ1a7GsixractXZSetHVyaWszZfmw4a2QDG434urDgwzGRV/ye7tkYJkaHm9ZF7brANdIZdC2DDuM7m+lAoJG8Hv3GCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385504; c=relaxed/simple;
	bh=5aZrIAe2eKzhmefAbNX/pN76GNAAeBFFZNyAIjsRjZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm7OgiKtcvwEsaLh34fyv7FjiOmyPwHtRsLPTITx6SMFuliiaz+aJeiYatT1pDrMGUgMHIm55RB5Ybmhoo52qnOVVllmzC4eGQGvuQK2M5UeLPb6RN5p45mrC+IYvkZEw9PYKTauSKJ5M6ceb9uDs69KP4vD+Z1fYs60BegYCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZobNnlw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751385502; x=1782921502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5aZrIAe2eKzhmefAbNX/pN76GNAAeBFFZNyAIjsRjZU=;
  b=eZobNnlwwnsMtJMZVb5uqz7hio7ZZTewLVlgUeaUVZog1J632vt9JCGr
   GJCm5cAGUMxHiXqa2gWLLeVNnIOxcFP5UbxC5nhLoBTBRJ0Q1ywZ0Pc8p
   y3wBjFi+I8SARO+wbG+TGQvd/6tGd/ZMZtB7AKsHI0xOEamYdExIAZEx8
   kqTfw8x/tnTvuEHW1dRRb8mXFLeChwFb/NdoqkO+8VnhqukYKwG0kFOAZ
   4C5fKpgAicb2J9DvsQobVPjpltz3WIXHbSQ4kNGLhJ27xc0OuJCp9ctaA
   VmKwjmVbmaqZkvhAXYHwbQQ2v40srUhMAtfqtOGOfGt3JKix6I1rduysZ
   Q==;
X-CSE-ConnectionGUID: ImotVq2LRWSyP/DVGY2jUw==
X-CSE-MsgGUID: zH1Wiic3RR2gTYwHdYRLGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53528808"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53528808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 08:58:21 -0700
X-CSE-ConnectionGUID: sil2bnhCT96907E+hxr2BA==
X-CSE-MsgGUID: t7PDDZ8XQCqDoAaZlh6+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="190992177"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 08:58:19 -0700
Date: Tue, 1 Jul 2025 17:58:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 1/9] drm/recovery: Wait for devcore to become
 available
Message-ID: <20250701155803.mqaptav2i4mkfl6e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-2-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:08:55 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>

Please change subject, it is now:
[PATCH igt 1/9] drm/recovery: Wait for devcore to become available

and it should be:
[PATCH igt 1/9] tests/msm/msm_recovery: Wait for devcore to become available

or little shorter:
[PATCH igt 1/9] tests/msm/msm_recovery: Wait for devcore

After a resend I will ack it, I have also few nits for other
patches.

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
>  tests/msm/msm_recovery.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index fbe26e687ed3..433392079bd4 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -44,8 +44,12 @@ read_and_clear_devcore(void)
>  	glob_t glob_buf = {0};
>  	int ret, fd;
>  
> -	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
> -	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
> +	/* The devcore shows up asynchronously, so it might not be
> +	 * immediately available:
> +	 */
> +	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
> +			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
> +		      1000, 100))
>  		return;
>  
>  	fd = open(glob_buf.gl_pathv[0], O_RDWR);
> -- 
> 2.50.0
> 

