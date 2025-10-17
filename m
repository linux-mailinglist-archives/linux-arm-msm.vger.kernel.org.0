Return-Path: <linux-arm-msm+bounces-77800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC96BE9A15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0A271893C21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 15:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B387F337117;
	Fri, 17 Oct 2025 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwcaINM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519E2F12AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714049; cv=none; b=mKy5AlNrllfqefprVrjtWJRcyDp7iUS0i9M2FPZZqMuyoxYNnG22x1DM+JURiiNZeCODZM9WWFefxte1NpRFwRdAF2DSl3sO0T2gav/BzjRVZsOLwszsKlRHaOdEED6Wr3wmMo/GunfojfKQy6f/YLB4XT4THKSshnjRDgtl4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714049; c=relaxed/simple;
	bh=WYvJ64RC4Myo0jrdjPfsN1YtT2wWB2zaxB30Gu1WMGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQRQ6WpFLVPen9vHqRdE7JSIxnCpkPIs+fwxe0NKBDuEcFdaCm503kN6RAkhmad7wtiEWGdY1LbisPUJIPmk9q10CsyfWN+/9kNEpwu1+WXmG6Kd3gYQo/h46uDSHqxUSZkpw1ymG109JUDPKE7/d9OOzjaDAdYKq2n/kus9LoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwcaINM6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760714048; x=1792250048;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WYvJ64RC4Myo0jrdjPfsN1YtT2wWB2zaxB30Gu1WMGg=;
  b=GwcaINM6+c+ESjvIQlJiK+cQHLOnVmNNnZeOd12QV+D5r4VdRmx3ghQf
   bVDiDb8UcjAkAkKLGOfjf51MRawV+dHp+SzkxbKEggOCmpJELSVIZJNxK
   dxsV0plXNGny0eTJp4X9VdO7El9x4pwba/pee7lw6zGxM8G3Bcm0Vwvn6
   0VjcnKROxInJBEliUayi214KqkMuWx7z24Q9jrk5FsKqJiIvziLn1zNeQ
   RbzCuc46D9v0bMFbhDcJVhKl1mbf/B5bFp5ZyAvfnVc7i4qsNfhr4hE8w
   o+OCcNVMyd/tCnreQCOf8ZG9XkUgIWfNjtvuLsrDlywTMn1Hil9f7oRWK
   g==;
X-CSE-ConnectionGUID: 3ajMkHoxQcyAFxDwmw6vsA==
X-CSE-MsgGUID: axbBo2I5ST67Va/gZHsqcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62835040"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62835040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 08:14:05 -0700
X-CSE-ConnectionGUID: f8+TNfl4TgiRIuU1y1lG+A==
X-CSE-MsgGUID: ZYNEgyTHTgCxHTMErDQ0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="182567425"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.191]) ([10.246.17.191])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 08:14:03 -0700
Message-ID: <97dee1c9-fc43-404b-bbd1-06fe04718c5a@linux.intel.com>
Date: Fri, 17 Oct 2025 17:13:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 10/15/2025 5:22 PM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
>
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
>
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 797289e9d780..e6f96dbb3382 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -15,6 +15,7 @@
>   #include <linux/math64.h>
>   #include <linux/mm.h>
>   #include <linux/moduleparam.h>
> +#include <linux/overflow.h>
>   #include <linux/scatterlist.h>
>   #include <linux/spinlock.h>
>   #include <linux/srcu.h>
> @@ -1305,17 +1306,17 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
>   	u64 received_ts;
>   	u32 queue_level;
>   	u64 submit_ts;
> +	size_t size;
>   	int rcu_id;
>   	u32 head;
>   	u32 tail;
> -	u64 size;
>   	int ret;
>   
>   	received_ts = ktime_get_ns();
>   
>   	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
> -	n = (unsigned long)size * args->hdr.count;
> -	if (args->hdr.count == 0 || n / args->hdr.count != size)
> +	if (args->hdr.count == 0 ||
> +	    check_mul_overflow((unsigned long)size, (unsigned long)args->hdr.count, &n))
>   		return -EINVAL;
>   
>   	user_data = u64_to_user_ptr(args->data);

