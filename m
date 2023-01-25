Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEF767BD97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbjAYVEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbjAYVEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:04:39 -0500
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [46.30.211.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50492F791
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 13:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=r06bpllZ30BN5nw2fF6dgAcQNrEN0bwvs34HHHR0x90=;
        b=lOQASzRXku++3L0Tc0qGb+h+Kx1uKtws9h+yo98f2FqVui9YPs/BU5za90WVZqmk22FxAUilW2LwI
         a56mgtI/giS56adFnV7EoQRJidS3r4Gw4lG15tc+AwUuoacTh8Hm/96giQ7urIM75LFn1mDImgA47a
         q91TUHD+n3M1Bxdfe1KnxeLqUSQpHx6b3g1EVPdAkeAFF42LsocUiVxEFUlWglsW5n+z515fhFUErp
         jRFMiqID41LwjVEyogv+u9qGVFwC1X5v9Oa65UucrN7nswugetyGFgIM6pTn/RrsxQgWlOErx2fseC
         /hMlDR8Ef/u6uF4pup1cKYqqpRcEN0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=r06bpllZ30BN5nw2fF6dgAcQNrEN0bwvs34HHHR0x90=;
        b=avkE8s1HkDYg7ZYMXlQ4Kw3Z5qWwXIas79ZgkelIohpjH/sdW5NrDzL2tNM4PRL45JRGjMmKhtUx9
         UUPvgWECg==
X-HalOne-ID: ba1794f8-9cf3-11ed-908c-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay1 (Halon) with ESMTPSA
        id ba1794f8-9cf3-11ed-908c-11abd97b9443;
        Wed, 25 Jan 2023 21:03:34 +0000 (UTC)
Date:   Wed, 25 Jan 2023 22:03:33 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
Message-ID: <Y9GZJcRKbaK0cYGo@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125200415.14123-5-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Wed, Jan 25, 2023 at 09:04:09PM +0100, Thomas Zimmermann wrote:
> Initialize the fb-helper structure immediately after its allocation
> in drm_fbdev_generic_setup(). That will make it easier to fill it with
> driver-specific values, such as the preferred BPP.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_fbdev_generic.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 135d58b8007b..63f66325a8a5 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -385,8 +385,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	if (dev->fb_helper)
>  		return drm_fb_helper_hotplug_event(dev->fb_helper);
>  
> -	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
> -
>  	ret = drm_fb_helper_init(dev, fb_helper);
>  	if (ret)
>  		goto err;

From the documentation:
The drm_fb_helper_prepare()
helper must be called first to initialize the minimum required to make
hotplug detection work.
...
To finish up the fbdev helper initialization, the
drm_fb_helper_init() function is called.

So this change do not follow the documentation as drm_fb_helper_init()
is now called before drm_fb_helper_prepare()

I did not follow all the code - but my gut feeling is that the
documentation is right.

	Sam


> @@ -456,12 +454,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>  	if (!fb_helper)
>  		return;
> +	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
>  
>  	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
>  	if (ret) {
> -		kfree(fb_helper);
>  		drm_err(dev, "Failed to register client: %d\n", ret);
> -		return;
> +		goto err_drm_client_init;
>  	}
>  
>  	/*
> @@ -484,5 +482,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>  
>  	drm_client_register(&fb_helper->client);
> +
> +	return;
> +
> +err_drm_client_init:
> +	drm_fb_helper_unprepare(fb_helper);
> +	kfree(fb_helper);
> +	return;
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
> -- 
> 2.39.0
