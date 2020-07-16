Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002AB222CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 22:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgGPU35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 16:29:57 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51124 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgGPU35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 16:29:57 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 0CD4E20024;
        Thu, 16 Jul 2020 22:29:53 +0200 (CEST)
Date:   Thu, 16 Jul 2020 22:29:52 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Steve Cohen <cohens@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, adelva@google.com,
        seanpaul@chromium.org, pdhaval@codeaurora.org
Subject: Re: [PATCH] drm: hold gem reference until object is no longer
 accessed
Message-ID: <20200716202952.GF2254583@ravnborg.org>
References: <1594420826-4897-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594420826-4897-1-git-send-email-cohens@codeaurora.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8 a=e5mUnYsNAAAA:8
        a=7NIp_XQ0yF2F6IRQXbcA:9 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steve and others.

On Fri, Jul 10, 2020 at 06:40:26PM -0400, Steve Cohen wrote:
> BUG: KASAN: use-after-free in drm_gem_open_ioctl
> 
> There is potential for use-after-free here if the GEM object
> handle is closed between the idr lookup and retrieving the size
> from the object since a local reference is not being held at that
> point. Hold the local reference while the object can still be
> accessed to resolve this.
> 
> Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_gem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7bf628e..4b2891c 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -898,14 +898,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  
>  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
>  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> -	drm_gem_object_put_unlocked(obj);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	args->handle = handle;
>  	args->size = obj->size;
>  
> -	return 0;
> +out:
> +	drm_gem_object_put_unlocked(obj);
> +	return ret;

Lookign at drm_gem_flink_ioctl() that is implmented just above this
functions there are two things that I noted.

1) In drm_gem_flink_ioctl() the label is named "err:" - and my OCD likes
that similar labels have the same name.

2) The function takes the object_name_lock but fails to release it in
the error situation.

Danile Vetter updated the locking in
20228c447846da9399ead53fdbbc8ab69b47788a ("drm/gem: completely close gem_open vs. gem_close races")

but I failed to follow it all.

	Sam

>  }
>  
>  /**
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
