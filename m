Return-Path: <linux-arm-msm+bounces-73916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01970B7EDAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FE9C525096
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 12:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A5737058B;
	Wed, 17 Sep 2025 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+ByiqB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97672319611;
	Wed, 17 Sep 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113672; cv=none; b=MQfe09PWPSGAQJi/aBOpKpdSWkIBW5mmV8+8CMrCm8Fi19SLx4vK8H6yzk9uF/6l10uddLCo4fhiAfEHlcMklRt7yO7HmwXSPMET0XYuhv8xh3wOMG//pdgzC9/TmM58meu5Xk1L48f5RFeYnfDoOO5OVaBbBXlclpm3ep29pl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113672; c=relaxed/simple;
	bh=KsLpdDb9EDz/2nzPdDmF4P1YvgEiDXBWVoR5B/mbGwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzGA2uZ97MLJ/RMqvz6Xbcfw47K5OlLFYoAQ6qSvPSvYck02WviAWp7pb6cD90/R3u/cFiOdfv6vFEUj/M5Ba70fBL0oQ24XmXjWsRdZOI7c4COAIDAggEXGQcxOCi0VCRvBpnj2nIsyUOV/lw2QJWS0g78CYEnZhHEQm/DmisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+ByiqB7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113670; x=1789649670;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KsLpdDb9EDz/2nzPdDmF4P1YvgEiDXBWVoR5B/mbGwA=;
  b=K+ByiqB7UKnEk+9UGJL+mw6b+dDZxRBS5+qt1JkmXJjnwMSezBoTzgW+
   V2wy06/8qehFELUJ5bRDOgYBo62W+YjaayVS7UXSKxaWBUxvb9ASu8j3C
   lqg/E/s8Eh1PqiR3wwb5fGYrCWApWfE6qR+x/KVmB3NOXiVyoNZ4iUVWY
   +yx4lmcIxWqu23HtJD3AVnqCLETIxcN9M0KagyMOHUt6grLjEhxL6nYKz
   yzKy3Z9qQ9NEpg/aDL7M0d6YSlCpYKSF+5AQVyvpRaHa0XD4JHUI3WZ03
   vC4+xrwDh9wSQfNehtbxrWZGov3gv7hE1aR4DXSlil0NgRU2dw08iS7dQ
   A==;
X-CSE-ConnectionGUID: FGmr+EPzTpCpA6WrfrFZMg==
X-CSE-MsgGUID: IXQv0mggRIecJTpx6WXdXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="63051747"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="63051747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:54:30 -0700
X-CSE-ConnectionGUID: oR2ODkYfQ4y1vxW+qKNyow==
X-CSE-MsgGUID: aguxj3SpQyu9C+MX8A6uSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="180503357"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.124.106]) ([10.245.124.106])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:54:28 -0700
Message-ID: <b1ef69f5-e485-4e05-b9ca-6ea73200455a@linux.intel.com>
Date: Wed, 17 Sep 2025 14:54:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

On 9/17/2025 2:48 PM, Thorsten Blum wrote:
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify qaic_attach_slice_bo_ioctl().
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/accel/qaic/qaic_data.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 797289e9d780..202bdca58847 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -18,6 +18,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/spinlock.h>
>  #include <linux/srcu.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <linux/wait.h>
> @@ -984,18 +985,12 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
>  
>  	user_data = u64_to_user_ptr(args->data);
>  
> -	slice_ent = kzalloc(arg_size, GFP_KERNEL);
> -	if (!slice_ent) {
> -		ret = -EINVAL;
> +	slice_ent = memdup_user(user_data, arg_size);
> +	if (IS_ERR(slice_ent)) {
> +		ret = PTR_ERR(slice_ent);
>  		goto unlock_dev_srcu;
>  	}
>  
> -	ret = copy_from_user(slice_ent, user_data, arg_size);
> -	if (ret) {
> -		ret = -EFAULT;
> -		goto free_slice_ent;
> -	}
> -
>  	obj = drm_gem_object_lookup(file_priv, args->hdr.handle);
>  	if (!obj) {
>  		ret = -ENOENT;

