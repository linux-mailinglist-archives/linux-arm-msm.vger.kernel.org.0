Return-Path: <linux-arm-msm+bounces-104380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A/cMxAC62laHQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:39:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD2459F33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7F493003804
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 05:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AC2335546;
	Fri, 24 Apr 2026 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU9Lqbdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487583451AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009162; cv=none; b=X7mjNplanyg47BDADOu9zjV4m1FF/wxg2n9Qmv7LncobLvd7tbDJLG0/KMtQ6mqOtswXUOT0mv1cLsQxdGzLZgbh56JqVWoT6torqlRmtA35zi9TKRlBrX7CvPw4LbdU6iY6MioHe3HulyvEyx16mhjDJGFXupUmZSnh6iAZvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009162; c=relaxed/simple;
	bh=i72CY4gqZclW2HGVs581T5Bd7V3pdqJvrzwY2ReUjys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyJelDAWnmt5siYoN40BVEXAlIVIe+KyCkR17W3gn9DgmB+fDxN2mW6SCetH9k6SHnWPVc4U5clF1tt6x5BDdqEIU/0YGylVcqzfWEXkHWHL7d4LnvACC/uHVEXiSPtFoFYmhQbsyVedWKpVDnDjBWb53rkNztafgNdR5jpwD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU9Lqbdn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777009162; x=1808545162;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i72CY4gqZclW2HGVs581T5Bd7V3pdqJvrzwY2ReUjys=;
  b=PU9Lqbdn1MZY2Khozm95z4Qvqq07xw0C5pqCJEd1aG+fmwfZZEzzS79p
   1BG/I3wAvEXGfVcHPm7xoBOJliuRKJpbukkNc7X7oxVEwgkvT+fFYzOGD
   jcdBGmMG3Jnhc2SCoKVd3TmTmGwEZxV01xlY3QW9pUV16Pk2XIIhEsIBT
   cIL1/RtNb1rgNyhTfyBGMUVHWt8CRNQf83vahMcDFFEeiQtFd8yeRp6rf
   qpeqQqA7CuUNzuOL6nJZC6stAdrMVg2WlKVI2aUSFmGmtw6FSyH5E80/B
   viuxXdF9bjqCVyAbJqyv33KRy6aFZG/rwaRdTBZLS/BabkuPIwl+rw6TQ
   g==;
X-CSE-ConnectionGUID: fSYYM2N1SEqKdtZr6T/GKA==
X-CSE-MsgGUID: Xk6NK0zITJef3QeQBCpBIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77894181"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77894181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 22:39:21 -0700
X-CSE-ConnectionGUID: +Ar+qhrYSWaePDIEBxqNRQ==
X-CSE-MsgGUID: T8N3xlkQRJ+xzM/l0/nK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="230197519"
Received: from brehonyx-mobl.ger.corp.intel.com (HELO [10.245.64.94]) ([10.245.64.94])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 22:39:19 -0700
Message-ID: <2a4e7ce2-64dc-4c17-ae51-5e53c59669cf@linux.intel.com>
Date: Fri, 24 Apr 2026 07:39:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add overflow check to remap_pfn_range during
 mmap
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 youssef.abdulrahman@oss.qualcomm.com, jeff.hugo@oss.qualcomm.com,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lukas Maar <lukas.maar@tugraz.at>
References: <20260423204412.2861046-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260423204412.2861046-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CDBD2459F33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104380-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]

On 4/23/2026 10:44 PM, Zack McKevitt wrote:
> The call to remap_pfn_range in qaic_gem_object_mmap is susceptible to
> (re)mapping beyond the VMA if the BO is too large. This can cause use
> after free issues when munmap() unmaps only the VMA region and not the
> additional mappings. To prevent this, check the remaining size of the
> VMA before remapping and truncate the remapped length if sg->length is
> too large.
> 
> Reported-by: Lukas Maar <lukas.maar@tugraz.at>
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 95300c2f7d8a..8a6948f11346 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -606,8 +606,11 @@ static const struct vm_operations_struct drm_vm_ops = {
>  static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
>  	struct qaic_bo *bo = to_qaic_bo(obj);
> +	unsigned long remap_start;
>  	unsigned long offset = 0;
> +	unsigned long remap_end;
>  	struct scatterlist *sg;
> +	unsigned long length;
>  	int ret = 0;
>  
>  	if (drm_gem_is_imported(obj))
> @@ -615,11 +618,24 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
>  
>  	for (sg = bo->sgt->sgl; sg; sg = sg_next(sg)) {
>  		if (sg_page(sg)) {
> +			/* if sg is too large for the VMA, so truncate it to fit */
> +			if (check_add_overflow(vma->vm_start, offset, &remap_start))
> +				return -EINVAL;
> +			if (check_add_overflow(remap_start, sg->length, &remap_end))
> +				return -EINVAL;
> +			if (remap_end >= vma->vm_end)

nit: seems that remap_end == vma->vmd_end would fit, shouldn't this
check be?
if (remap_end > vma->vm_end)

> +				length = vma->vm_end - remap_start;
> +			else
> +				length = sg->length;
> +
> +			if (length <= 0)
nit: unsigned long length can't really go negative
> +				goto out;
> +
>  			ret = remap_pfn_range(vma, vma->vm_start + offset, page_to_pfn(sg_page(sg)),
> -					      sg->length, vma->vm_page_prot);
> +					      length, vma->vm_page_prot);
>  			if (ret)
>  				goto out;
> -			offset += sg->length;
> +			offset += length;
>  		}
>  	}
>  

With these
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

