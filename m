Return-Path: <linux-arm-msm+bounces-83315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF47C86EC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECDE44EA754
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 20:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E5432B9A6;
	Tue, 25 Nov 2025 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFk85Yno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC6033C198
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101238; cv=none; b=cia2RSDQ6FQs4w7Du32JgC1QGxvlT0V+6wTpa5nucqnVYlTn0M0/KLSHB5GN1rDz4T1NCc/ipnBYu1RDQS7IVnhw34FWzkkjxmm/r6DOpxT22eD1ByCsJlfxEP+1cbVFXwbG7HOpdczIkjapAYAgU8z3ff7CoxlEPgvAkkSegJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101238; c=relaxed/simple;
	bh=KDAMEcekW0GbeCdlt1+A39flE38a3ZcvoP/43pcRNmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGDUH8RB2n6i/edP3rtOGtgVc8TJ0VdF8BWIAA9T4rZPDDADR+SbONr/OUTyT2aG8LckOuB6S5WP2DAkutzhJlqXKfgWVAHq44UsdFP67vnxy3E0ieO8jCPH+Mj1ikJFcEm5Po9WgkfzceWcVOieu9dJXHMDi5ZH5d60c5lcUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFk85Yno; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764101237; x=1795637237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KDAMEcekW0GbeCdlt1+A39flE38a3ZcvoP/43pcRNmI=;
  b=hFk85YnoVJjlsycC9UfOT9Ha7wnEGMUWFw8PKOw6FTdZuwJNTgPgNuQB
   3MAXHkd3X0VJkqJmEs/puN09OSxRJ7cH74J8fRwFRW+u4aArT4GmpxJYS
   JaWkEpOV1KGjmeaw3teQjiJc2x55+RoW3SjfWgSbyhGELWhYuPJnnI/pk
   1iYtKlEyo7msvSlvcBHDKt+66+IjiHIGZgVTa1tOISynoWoZzdQyI6mnC
   ETrOK40l0sa1eh8yi/B+Z7udH6+vB2VNMXfHagNnQ6exQ5wmy9G8/AOlM
   rDZFFP4HEQYtZem/Gsg1+F8vQQvXSd+SqEFxIsiNL6vhU6AAEAtzbJ/if
   A==;
X-CSE-ConnectionGUID: S4F8gDLvTQGqby3IhLfMWA==
X-CSE-MsgGUID: +iBjlMWzT2yWnhGuSmxWlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76814360"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="76814360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:07:15 -0800
X-CSE-ConnectionGUID: /M1ViyviQSqztxx+pfyhCA==
X-CSE-MsgGUID: KvAHAXFBQOqrGjb1oPcNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="193554410"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2025 12:07:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CE696A0; Tue, 25 Nov 2025 21:07:11 +0100 (CET)
Date: Tue, 25 Nov 2025 21:07:11 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
	troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	karol.wachowski@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
Message-ID: <aSYMb4EKFCaYrWTI@black.igk.intel.com>
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: David

On Wed, Oct 15, 2025 at 05:37:15PM +0200, Youssef Samir wrote:
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.

I believe it's the opposite to what has to be done here.
At first glance it should be umin(), but I Cc'ed David
who is the expert in this topic.

> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
>  
>  	/* Request the first chunk of the first image */
>  	context->dump_image = &image_out_table[0];
> -	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
>  	/* Avoid requesting EOI sized data so that we can identify errors */
>  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> @@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
>  
>  	/* Get next image chunk */
>  	dump_length = context->dump_image->length - context->dump_image_offset;
> -	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
>  	/* Avoid requesting EOI sized data so that we can identify errors */
>  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;

-- 
With Best Regards,
Andy Shevchenko



