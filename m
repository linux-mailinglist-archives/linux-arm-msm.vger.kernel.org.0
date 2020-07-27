Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F2622F98D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 21:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgG0TzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 15:55:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:43558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgG0TzN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 15:55:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F8622072E;
        Mon, 27 Jul 2020 19:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595879712;
        bh=Eihzj9yY4QhXjvJiGtP5cGNyIPMsxel19lv/3GimdaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cIeEb6PNzza0iwI8PApMML3SFVNmb2l/86jCWN8qMkxnxHpVLbGi7g8vqsCSG3l6l
         GwATFf6nweneG2V8IPskGfFQsKFd1rCDcXOFfZhUA4THOMmJGpjDEf9b3MEHCHLue3
         uvbmXVlHia5Frt1tZY/Dc96rxzLpiSWN5QFPMTm8=
Date:   Mon, 27 Jul 2020 21:55:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Steve Cohen <cohens@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, sam@ravnborg.org, daniel@ffwll.ch,
        seanpaul@chromium.org, pdhaval@codeaurora.org,
        jsanka@codeaurora.org, adelva@google.com
Subject: Re: [PATCH V2] drm: hold gem reference until object is no longer
 accessed
Message-ID: <20200727195507.GA240123@kroah.com>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
> A use-after-free in drm_gem_open_ioctl can happen if the
> GEM object handle is closed between the idr lookup and
> retrieving the size from said object since a local reference
> is not being held at that point. Hold the local reference
> while the object can still be accessed to fix this and
> plug the potential security hole.
> 
> Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7bf628e..ee2058a 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   * @file_priv: drm file-private structure
>   *
>   * Open an object using the global name, returning a handle and the size.
> - *
> - * This handle (of course) holds a reference to the object, so the object
> - * will not go away until the handle is deleted.
>   */
>  int
>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  
>  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
>  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> -	drm_gem_object_put_unlocked(obj);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	args->handle = handle;
>  	args->size = obj->size;
>  
> -	return 0;
> +err:
> +	drm_gem_object_put_unlocked(obj);
> +	return ret;
>  }
>  
>  /**

As this seems to fix an important issue, any reason it wasn't cc: stable
on it so that it gets backported properly?

How about a "Fixes:" tag so that we know what commit id it fixes so we
know how far back to backport things?

And a hint to the maintainers that "this is an issue that needs to get
into 5.8-final, it shouldn't wait around longer please" would have also
been nice to see :)

And what chagned from v1, aren't you supposed to list that somewhere in
the changelog or below the --- line (never remember what DRM drivers
want here...)

Care to send a v3?

thanks,

greg k-h
