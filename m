Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F0667ABC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 09:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbjAYIbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 03:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbjAYIbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 03:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C924FCDC
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 00:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674635447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kr0S8akD6qUBjK/SM2fF6lu+0ihmEwSHU9fQtaMUMNo=;
        b=c82vQHfGvl69RfAXVYFrW2N0W8Ijsjsjpnjk1bowJm/pXrJxdkxGqIuUhU5SsgTTLLfChe
        WCLgudtbd4i2a67T5yUtWti3Rrnvc7tjBjBAa2DISqSv0KJPjNuKUh2mamIk8uLrVTgKsh
        45QcAOaKX2KrCFHZDN0PbyR4zQgJDHI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-Zbda1sw5Mj6C-o5AvGLLmg-1; Wed, 25 Jan 2023 03:30:45 -0500
X-MC-Unique: Zbda1sw5Mj6C-o5AvGLLmg-1
Received: by mail-wr1-f71.google.com with SMTP id v5-20020adf8b45000000b002bde0366b11so3002882wra.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 00:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr0S8akD6qUBjK/SM2fF6lu+0ihmEwSHU9fQtaMUMNo=;
        b=MI03L7dmGLDmy1ijx2JztvRGkbS6XB+G1A6y0kppbhStIkSmLO0QsbV7MYfckqgniW
         X6YJW6oNrNaMEboTtnLK/8R6C4telcIzduCTU8yupA87fomHpJJXGYmy1/7bNC2OfKXT
         anh3KGnztifqY98XK1WYdu5dKD+sLLhED+5VO0FL/I+hr1vHTHoD2VLTBRNZEdItFViE
         b9kkiPP4hA/L7WCJOFb5EGOBaUsKGFOLTQa/tF9cwu/iePAKKslYBeovfsaxoqXN4Lvc
         j+QZ9bNk2DT1vVbzxqv2gOQTLULmqSAny8/YUSRLol7SX6sxOM/ptqg5QBW2SdO+3ECb
         8jqQ==
X-Gm-Message-State: AFqh2krtFxbi+hR8w+0NhTjn+XXbTjM0xFryOODhnkErJpuBlkN3YIU9
        NCZuHdPrZprlq46KHUZ1RCGTwo9nLTTkTvF+ZQqSJJfiN98c11iuriqTUAlmVbNiia/MubYz3p2
        2tg06WJiz8KUKVU+wtbORpABPTw==
X-Received: by 2002:a05:6000:388:b0:2bc:7ec3:8b2 with SMTP id u8-20020a056000038800b002bc7ec308b2mr29736119wrf.68.1674635444579;
        Wed, 25 Jan 2023 00:30:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJXEPl3F4VP/2Wui1NMuiLkn1RDtzF7t2lLspd9Qgz+v3EiIOxwRmTCt+QhhFH4DIAkfWI6g==
X-Received: by 2002:a05:6000:388:b0:2bc:7ec3:8b2 with SMTP id u8-20020a056000038800b002bc7ec308b2mr29736083wrf.68.1674635444065;
        Wed, 25 Jan 2023 00:30:44 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d67d1000000b002425be3c9e2sm3716862wrw.60.2023.01.25.00.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 00:30:43 -0800 (PST)
Message-ID: <296bcff0-9d75-3d6b-e101-dddb26edadf1@redhat.com>
Date:   Wed, 25 Jan 2023 09:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/10] drm/client: Test for connectors before sending
 hotplug event
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-2-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-2-tzimmermann@suse.de>
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

Hello Thomas,

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Test for connectors in the client code and remove a similar test
> from the generic fbdev emulation. Do nothing if the test fails.
> Not having connectors indicates a driver bug.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

but I've a question below.

>  drivers/gpu/drm/drm_client.c        | 5 +++++
>  drivers/gpu/drm/drm_fbdev_generic.c | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)

[...]

> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -389,11 +389,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	if (dev->fb_helper)
>  		return drm_fb_helper_hotplug_event(dev->fb_helper);
>  
> -	if (!dev->mode_config.num_connector) {
> -		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
> -		return 0;
> -	}
> -

What about the following code snippet:

	if (!drm_drv_uses_atomic_modeset(dev))
		drm_helper_disable_unused_functions(dev);

that seems to be something that should be in the core client dev hotplug
as well, since it isn't specific to the fbdev emulation client ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

