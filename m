Return-Path: <linux-arm-msm+bounces-45931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E06EDA1A16C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD933AA46A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E3F20C48A;
	Thu, 23 Jan 2025 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmqttcI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC15234;
	Thu, 23 Jan 2025 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626741; cv=none; b=A2V28fR4vTWQfkWdGP0aiLi5LckTOSGJG/d3R+YggQnat4K8xu9XFBP4pxL7rQkyunU9L4RrgQa0GMENvNamC3e53AskeEJhYySZ0GgWhKBstBBvT4eJNkIKRHfTYe0jfWzobxaTWTvVRT69Rg1lukVVMRTncNzAD9HCGUkUUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626741; c=relaxed/simple;
	bh=Oi9/D0PWYyy7brJ0Vu9h1l6qWwLdFOLmHoN6QamUPlE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a1Q4Am5th7gf7EvzRrpzge1qhCzQ2K4a9vjeaHa5eUl2yWW2qGsgMa9siVazUEHFLej6SDrb9dZnJFXEBmtP/ZC16GwnxogVWD3VVEty1PqMnnaloZ0rMPWp+16DLedzZ08beAMne1WKT6ZfPc1R2q/79m2BW/lIsjwGcBVlVis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmqttcI0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737626739; x=1769162739;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Oi9/D0PWYyy7brJ0Vu9h1l6qWwLdFOLmHoN6QamUPlE=;
  b=dmqttcI0vhMQbHxIq+mOytj6HU8yTC72GHoLa4TyVwg+qEYiQZL90FHA
   gCNu7izzA0GyD8xhVhTyReUTREwwnnsFLV25GIs455FSj+4tuRkcXJ1hR
   HD4R4rjtPzwV6Cy4OC6VaygdJR4Xlu6XueamWd4Bhgco3j/OD8OXNkVRG
   iTk0W3h4Pdzq7Bq4Oz/lQ/tJ9OCxI/0IIjg4x1LKQfaf+IP4Vg5VfTYH/
   uwdZ5UMP2pVU5gTiHra9H8jb1MX0NzzftH6ttnnE02kB97spkdfaFztge
   FcfAPBqqunc6i6UgRb0WyCwHsxGqTB/Zbo+oQ4x5PmZ8WQ/Ekm48qp4fG
   w==;
X-CSE-ConnectionGUID: e4H88Ik3Q/yj1Roj+OGCJw==
X-CSE-MsgGUID: V4K6mIOaS+2yKM2DGgiwEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49108660"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="49108660"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:05:37 -0800
X-CSE-ConnectionGUID: 0nbPCXCIS0ay8X7qslfq7Q==
X-CSE-MsgGUID: MDiba6P7ROqZRshMBJWnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="138278355"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.98])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:05:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
Date: Thu, 23 Jan 2025 12:05:29 +0200
Message-ID: <87tt9pn8uu.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

This might be one of the few places where the old functions and the old
return value was used in a sensible manner.

BR,
Jani.

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> @@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  			break;
>  		}
>  
> -		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
> -
> +		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
>  		if (res <= 0)
>  			break;
>  
> -		if (copy_to_iter(buf, res, to) != res) {
> +		if (copy_to_iter(buf, todo, to) != todo) {
>  			res = -EFAULT;
>  			break;
>  		}
>  
> -		pos += res;
> +		pos += todo;
>  	}
>  
>  	if (pos != iocb->ki_pos)
> @@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			break;
>  		}
>  
> -		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
> -
> +		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
>  		if (res <= 0)
>  			break;
>  
> -		pos += res;
> +		pos += todo;
>  	}
>  
>  	if (pos != iocb->ki_pos)

-- 
Jani Nikula, Intel

