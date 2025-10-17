Return-Path: <linux-arm-msm+bounces-77801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A64BE9CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3215C740BDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 15:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACA332E121;
	Fri, 17 Oct 2025 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJJztOH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE22F12D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714063; cv=none; b=TaZgvRWrKez3QtRI9UcXGtuqDQSV7hWAM1tqepg/TdrIq9TTewKlf5ZJgJeujVwJcncVesz+X+QDT4XCEoU3Sx754g0oo5l4ZhtDbkH8ku98qz28cizabmLk6J8j+WGpjownvx1kSNUL8FA35ddqejyYZ6uMhcjf1k82wSRGYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714063; c=relaxed/simple;
	bh=3E3ghrMfbvU5c1+mUTJuBiacaEFJ8uCkBHo58k55BJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzsvmdyKPVT6OMyOdvfLHh2T7G6/vcONw6GOom4lrHexSAfIAn5z11G9HvE9WSlQ52K3mch9Je8XK95MOtKqjZdp86kLcfM4LJif/uRwoUaaCgBqLS7mVWh++2kgRiy+4JUD7W5u0+fNAEsgPcAXXK1RCbvw0A6sR31OBGUwlCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJJztOH0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760714062; x=1792250062;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3E3ghrMfbvU5c1+mUTJuBiacaEFJ8uCkBHo58k55BJ4=;
  b=VJJztOH0zH9kqSnfjhFoseUaq3DxGBvjtsxI3npJt54LZOqXLERtodRj
   wGfT0Lhms/B3hX9K9t9frmW8PTXn2Z9ercvX+rtMn5IvHtFUP0yFMFOCd
   WMwZ8SapOnmQ2lLTAMOoxl2JHTFLsOVyPtzoRXWShUMRRIXmQqrZQktnI
   /UZz6qn6hgR/8JffRSBI28ZTR2XL1oNsGEFG6hukOXMur6nqFTchgDfJD
   1bjYDY1jwg2+b6YA1fHVCKEsJFGR4gyq+hCWLy4wGdJzI7m+P3QOyhz4n
   3qp81VjKdBA4WHSRzCzy3aH+8ipLFC8Rw9xPWN8yy2fJJHguAj+4OfeRa
   Q==;
X-CSE-ConnectionGUID: wJpZCdmfSaOR00bLoJooKw==
X-CSE-MsgGUID: gUyySosdQjOuWQted0AtHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62835076"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62835076"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 08:14:21 -0700
X-CSE-ConnectionGUID: Rkp/OAfWTg+crrmXiJfz4A==
X-CSE-MsgGUID: lSKmGcyPQwa7jCIAkOp8gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="182567452"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.191]) ([10.246.17.191])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 08:14:17 -0700
Message-ID: <428d5588-969a-494d-8dbe-a99957a763bf@linux.intel.com>
Date: Fri, 17 Oct 2025 17:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 10/15/2025 5:37 PM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
>
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>   drivers/accel/qaic/sahara.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..ed24417d4c8a 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
>   
>   	/* Request the first chunk of the first image */
>   	context->dump_image = &image_out_table[0];
> -	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
>   	/* Avoid requesting EOI sized data so that we can identify errors */
>   	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>   		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> @@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
>   
>   	/* Get next image chunk */
>   	dump_length = context->dump_image->length - context->dump_image_offset;
> -	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
>   	/* Avoid requesting EOI sized data so that we can identify errors */
>   	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>   		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;

