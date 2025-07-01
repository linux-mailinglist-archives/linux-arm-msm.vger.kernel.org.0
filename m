Return-Path: <linux-arm-msm+bounces-63254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12FAEFFA8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88B4D1C07918
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B2327E7F2;
	Tue,  1 Jul 2025 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJ4CeQOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A127CB06
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386880; cv=none; b=AoxsqIe1iIz7XLQ4xGhQSBEN2y3rjjPzyOQseJOdqBpSfpcHDgo6E0lqvCzu2THl2p/PTth+ZDOKDdvommQLV4/y76i6Ub86KrYc5BJsrzPVoh+14GQYZDC2BROZwEClbQSJDSpYB6ojtKganiFHy3GXzFK5Mn0DC23TvjT1uqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386880; c=relaxed/simple;
	bh=AGLIguVpSl3MR4bFQvhLZVPTx4Q7xFZEVOOvzRz7KRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIrRyPbA2K5Wbg+D3BpivsL18ZkvNXl9dnB8+VCKVsfN2WW3OMHz64jLydZiKyDbh/HbsXl/3v25NKYeBIfdycXVOSBiHsXbfUb8/08zpYi/54V9NGPdVU2AqovWfV9wUCdKbJ8pXj2L5cJszW7GcQscfIJBMIHfoxloD33sDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJ4CeQOx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386879; x=1782922879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AGLIguVpSl3MR4bFQvhLZVPTx4Q7xFZEVOOvzRz7KRo=;
  b=SJ4CeQOxSpuT980iAAxKKj4lN8usPoUgPGzhcxPvsm3o9T3UiDjsXFwK
   1Sg35R85371g/qmn75BVsrFuUPk0PU32YY0JvZr4TLtsLqb0ARIn3qU4O
   rEcoHsDDI0jTI4XoKvkNTJbtZ/5nmc2IyA0CQCJ9bDOz9uTwvK3acEWgS
   t64m20pFJ2DN8IY575TAIH1Tmbo3fvF3L/J/+1LM+GYzjA9Px3Tf3OpBd
   /bXxNMprWbtTi/5sFlHQrQmn8rgKde8xPdAVnuiyfwCxbDNGXT/Nl7J3d
   BdN1FZAa6DXWKcE/vxk1tJJa3lriPzemejSKpzjbFQh2H7Yped8f1JPjx
   g==;
X-CSE-ConnectionGUID: dumBFYs1RQCxXDdyFq58Lg==
X-CSE-MsgGUID: yWL2edX5S3ycGygFtJRHyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57438671"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57438671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:21:19 -0700
X-CSE-ConnectionGUID: kajL1D3FQgqdpsWcdlzfiw==
X-CSE-MsgGUID: lpb+r3gcQnOd9FEnqJJ4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153424658"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:21:17 -0700
Date: Tue, 1 Jul 2025 18:21:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
Message-ID: <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-8-robin.clark@oss.qualcomm.com>

Hi Rob,
On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>
> 
> If running on a system with full desktop environment, the file will be
> much larger than 0x4000 bytes.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 03a9e814c931..978ea18375dd 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
>  static uint64_t
>  get_bo_addr(int drm_fd, const char *name)
>  {
> -	char buf[0x4000];
> +	char buf[0x80000];

If it is that big why not malloc() it?

Regards,
Kamil

>  	char *p = buf;
>  
>  	igt_debugfs_read(drm_fd, "gem", buf);
> -- 
> 2.50.0
> 

