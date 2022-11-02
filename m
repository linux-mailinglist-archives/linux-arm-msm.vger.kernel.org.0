Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B1E615EF3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiKBJIW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiKBJHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E037528E1D
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667379910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
        b=OzS3FtPz1uPNDoQeyCzJdARX0sS/hWTqkr+I7yR3fM/QEYw35yFiFJnYQciIcQcZHeRxr9
        wLEXhOJYx3XlFH6UPn7uRvFUW6wtGVL+hYKnw4xY2fxLwifw7T1/6Ya5yO2R6Jrwl5qS97
        +ob6d3hL08fyB6ctyIjfddRV7Xj48LM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-Eft9WSQkMGKFS4HL-l6dNA-1; Wed, 02 Nov 2022 05:05:05 -0400
X-MC-Unique: Eft9WSQkMGKFS4HL-l6dNA-1
Received: by mail-wm1-f71.google.com with SMTP id i7-20020a1c3b07000000b003c5e6b44ebaso792756wma.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
        b=QS96I/G69u0GtaO7PSDvbpYA9d/nIuaa6yeOAlmU8FTPOeZDmspxL2kff7xXzlOEoG
         Vc7QyfTiYJFKJmVFgTfQcSjIR/3+fHd3ofvksdsaGD9171ymZEXFMpr9Bh12R51ip5Cu
         YRohaj1GkDhQfF+/u2SK7llKX3XeUpf0bNwEfJSkZcbmaQ63bY9O46lupeGtMaRbuh3x
         1pOEkmM3dJqXRlKEOMq/PyqqxQPg0faeMGV6GQOJNEEFkvLZ86/WDl2GMUn1IJy4+7Pj
         myHgR2o7nepMlS3w1mGHYRpDTUknJfgnX3EwKzesNktRQdXsIt9t7/Z2tZVuaXL8nSrK
         kAiA==
X-Gm-Message-State: ACrzQf22K5KfDllvTrXXxx7BevzCi4eLbK5fg/2JHtMjKPv9sNoAx/Wu
        XHsixfGGXoGB0JRWuvKEkEGUcGillvVAotGbdl1Y6tD/TOzIhrkJSOJdFh/fC4VZSeLC2mmwGIy
        P0d4g0rnW3WcNEBNM+NwMvM3zig==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id o8-20020a5d6488000000b0022b3b0b5e72mr14464153wri.138.1667379904740;
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ug/7BR+PMLuqwC0wiYVRKEgerXkzKho5yFNKIDT0bC26SnYKpkqpAn1quqQ9FNF9E1JGkLg==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id o8-20020a5d6488000000b0022b3b0b5e72mr14464139wri.138.1667379904487;
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b00228d52b935asm12402687wrq.71.2022.11.02.02.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Message-ID: <a96d57d8-486d-5a48-a00a-39df6275cbb5@redhat.com>
Date:   Wed, 2 Nov 2022 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 16/21] drm/fb-helper: Call fb_sync in I/O functions
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-17-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-17-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
> behavior of fbdev. Fbdev implementations of fb_read and fb_write in
> struct fb_ops invoke fb_sync to synchronize with outstanding operations
> before I/O. Doing the same in DRM implementations will allow us to use
> them throughout DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

