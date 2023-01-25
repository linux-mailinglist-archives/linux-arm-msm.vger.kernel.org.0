Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9448C67BD79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 21:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236621AbjAYU5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 15:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbjAYU5r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 15:57:47 -0500
X-Greylist: delayed 327 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Jan 2023 12:57:45 PST
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FB926AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=FddS8pQv/6N7S7CMs/WawleURHMuXHTM9+g9+0jG880=;
        b=Q4DqmMj2qG61SlFw8qecn3Zv3ANavPIkleUeaqKg3lhum5sea6L8QtfPvyqngR5LL4vUeNV90m09p
         uonsBiiKhXq8Pk7KocmQNCqG/ABZZ0gmWkhRuK508C1z/FPUxdGpn4Y4c3R51yU65h2v3iqC1XGhYw
         UUXjUuRZcKK7Zzu3aUyu2cbEaj6f0eZwKYd2y+q446pSkaw+YF0whvhAY4FVvF7cBSxSFzzku8h7RI
         qtz9sDUumNfpmPAlb1Hs8II2CEMT1P4iUgG5HdAGjVBTaLISGdeSZbitv7apTi1raOCH9jG1gsq1t2
         krPmMWYJSnswQQ6WRPKS3C68eOlqFnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=FddS8pQv/6N7S7CMs/WawleURHMuXHTM9+g9+0jG880=;
        b=8xlT7TEKGtLozhjeIkvi2rGfmQKeQK7NF0ZFx3Gf7Wf3kJllRuw4VQMYF7cfSsp56qg37EFB7iOLW
         ezqMK+kDQ==
X-HalOne-ID: e844ec46-9cf2-11ed-a54d-3df7d73157c4
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay2 (Halon) with ESMTPSA
        id e844ec46-9cf2-11ed-a54d-3df7d73157c4;
        Wed, 25 Jan 2023 20:57:43 +0000 (UTC)
Date:   Wed, 25 Jan 2023 21:57:41 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 02/10] drm/client: Add hotplug_failed flag
Message-ID: <Y9GXxcwSnuftoUQh@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125200415.14123-3-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Wed, Jan 25, 2023 at 09:04:07PM +0100, Thomas Zimmermann wrote:
> Signal failed hotplugging with a flag in struct drm_client_dev. If set,
> the client helpers will not further try to set up the fbdev display.
> 
> This used to be signalled with a combination of cleared pointers in
> struct drm_fb_helper,
I failed to find where we clear the pointers. What do I miss?
(I had assumed we would stop clearing the pointers after this change).

	Sam

which prevents us from initializing these pointers
> early after allocation.
> 
> The change also harmonizes behavior among DRM clients. Additional DRM
> clients will now handle failed hotplugging like fbdev does.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_client.c        | 5 +++++
>  drivers/gpu/drm/drm_fbdev_generic.c | 4 ----
>  include/drm/drm_client.h            | 8 ++++++++
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 09ac191c202d..009e7b10455c 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -208,8 +208,13 @@ void drm_client_dev_hotplug(struct drm_device *dev)
>  		if (!client->funcs || !client->funcs->hotplug)
>  			continue;
>  
> +		if (client->hotplug_failed)
> +			continue;
> +
>  		ret = client->funcs->hotplug(client);
>  		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
> +		if (ret)
> +			client->hotplug_failed = true;
>  	}
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 3d455a2e3fb5..135d58b8007b 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -382,10 +382,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	struct drm_device *dev = client->dev;
>  	int ret;
>  
> -	/* Setup is not retried if it has failed */
> -	if (!fb_helper->dev && fb_helper->funcs)
> -		return 0;
> -
>  	if (dev->fb_helper)
>  		return drm_fb_helper_hotplug_event(dev->fb_helper);
>  
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 4fc8018eddda..39482527a775 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -106,6 +106,14 @@ struct drm_client_dev {
>  	 * @modesets: CRTC configurations
>  	 */
>  	struct drm_mode_set *modesets;
> +
> +	/**
> +	 * @hotplug failed:
> +	 *
> +	 * Set by client hotplug helpers if the hotplugging failed
> +	 * before. It is usually not tried again.
> +	 */
> +	bool hotplug_failed;
>  };
>  
>  int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
> -- 
> 2.39.0
