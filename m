Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D686C67ADA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbjAYJTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjAYJTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:19:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7256646D61
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674638330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a55Ot/a9auPBUYlSWbJ1dfW1qxB2YBfP2IFn3I6erq0=;
        b=id71cs2y0pmpBUX+4jkURRpJX4LMm70nAveHI+GNSVU2Ga+DHms5wMpS8mpvOgRqBuWoPy
        0JZfPGkQSMa9IVxN5nhosqk+o+o/OawdLTPEirT8u1v8jprBYQsYsGzI/eWe9nVzMqMUEy
        COoJdsvJrwKUMLQh35JeJDQ7av5D02c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-jXEDh2P9PA2CSt5i1BAZZQ-1; Wed, 25 Jan 2023 04:18:49 -0500
X-MC-Unique: jXEDh2P9PA2CSt5i1BAZZQ-1
Received: by mail-wm1-f70.google.com with SMTP id n16-20020a05600c3b9000b003db127e03c5so1618438wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a55Ot/a9auPBUYlSWbJ1dfW1qxB2YBfP2IFn3I6erq0=;
        b=bTJG/hF2HHeTcCjgwKni12GDf2Xd9zAGS1r+BrO4vgxrJeWL330lT865ErT+P6cbFC
         mtXqWhvzp4P4LJqr130Rugp9YgyVnBIsBWKYa2XfJuM3jes+pCcj0GiMB/Smwx1aJl4e
         oIJN7MjqgF92axv+Jqu9gAOvQmk0Q9RwYNWcxkmBCSeHx1F9+p1x9T0j8TPTI63OPILA
         lmTJgu2sJYcw8Q9hj4LrWVuoI+E40EaTf6q0za4Uo2cN5I+mPGPRtS2+G4RF5hR7iwEh
         B/2l6t4yjYITX7VWrDjan3jTlyFKncYzkRyzXJOFWmIiFiGLsZxXlhVckqM2itvacabd
         0gOg==
X-Gm-Message-State: AFqh2kq+gXqYQM7+YO303IDAsHBm5tqaF176KHjv41CcgG0XMprz0iMm
        cPPRE3r5QqCH4uRaKthMz87PY91p5qbbaax/KsG58E/edLzrj/AXV6UsNvGD0LJdmjXoWIgXPuj
        VVnMGeJRU3hqvb22XACb0f4qTuA==
X-Received: by 2002:adf:feca:0:b0:2bf:9582:1378 with SMTP id q10-20020adffeca000000b002bf95821378mr16119709wrs.37.1674638328235;
        Wed, 25 Jan 2023 01:18:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMVsply5zUceDY+rfGRdP7xOLgJXzgPpsW/TV5uP5Pe3bOpgzxt5mZhJQXuF/HpRE9cQuOiw==
X-Received: by 2002:adf:feca:0:b0:2bf:9582:1378 with SMTP id q10-20020adffeca000000b002bf95821378mr16119688wrs.37.1674638328019;
        Wed, 25 Jan 2023 01:18:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b002bfb5618ee7sm2235669wrb.91.2023.01.25.01.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:18:47 -0800 (PST)
Message-ID: <2a007c84-1dd6-ed8a-39ac-8c7c070513f3@redhat.com>
Date:   Wed, 25 Jan 2023 10:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/10] drm/fb-helper: Introduce
 drm_fb_helper_unprepare()
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-4-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Move the fb-helper clean-up code into drm_fb_helper_unprepare(). No
> functional changes.
> 
> v2:
> 	* declare as static inline (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 14 +++++++++++++-
>  include/drm/drm_fb_helper.h     |  5 +++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index c5c13e192b64..4379bcd7718b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -435,6 +435,18 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>  }
>  EXPORT_SYMBOL(drm_fb_helper_prepare);
>  
> +/**
> + * drm_fb_helper_unprepare - clean up a drm_fb_helper structure
> + * @fb_helper: driver-allocated fbdev helper structure to set up
> + *
> + * Cleans up the framebuffer helper. Inverse of drm_fb_helper_prepare().
> + */
> +void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
> +{
> +	mutex_destroy(&fb_helper->lock);
> +}

I like that we have an _unprepare that is the inverse of the _prepare, but
since is only destroying the mutex, maybe is an unneeded indirection level?

Or do you plan to add more cleanup to that _unprepare function? Otherwise I
would just make it an inline function.

> +EXPORT_SYMBOL(drm_fb_helper_unprepare);
> +

Does it have to be an exported symbol? AFAICT the only user for now is the
drm_fb_helper_fini() function, so the function could be a static inline.

[...]

> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index f443e1f11654..39710c570a04 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -230,6 +230,7 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>  void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>  			   const struct drm_fb_helper_funcs *funcs);
> +void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper);
>  int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *helper);
>  void drm_fb_helper_fini(struct drm_fb_helper *helper);
>  int drm_fb_helper_blank(int blank, struct fb_info *info);
> @@ -296,6 +297,10 @@ static inline void drm_fb_helper_prepare(struct drm_device *dev,
>  {
>  }
>  
> +static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
> +{
> +}
> +

And you should be able to remove this stub if you limit the scope of the helper.

No strong opinion though. So if you prefer to keep it as is, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

