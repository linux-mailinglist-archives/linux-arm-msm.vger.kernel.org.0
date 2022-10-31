Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 971B561364C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 13:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiJaM1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 08:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJaM1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 08:27:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F87D316
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667219211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=;
        b=AkQsTEKR1y9Fem7oTJ0E3dmo3tSyUuX34g7YcIEBfU/OXBSKRL/QiVX4biNYbj4VOFhn4W
        OCYtrt/Yx9m3DzmtnpA8LOacAJbORJ9GshIUa4dxrFXoxCS8kBtwGlqp6K0QEQc7VI3zeI
        6gqkmpi5G0SI5+1pENUOav6Ir2O/Na4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-11P-9nnEPZiMzq0CMRZDcQ-1; Mon, 31 Oct 2022 08:26:50 -0400
X-MC-Unique: 11P-9nnEPZiMzq0CMRZDcQ-1
Received: by mail-wm1-f70.google.com with SMTP id e8-20020a05600c218800b003cf634f5280so926485wme.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 05:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=;
        b=s8t+NGP4V/lIRc1q2f3bu/xludCFsF2C0tbDZgp85fuc3Ld8Mb4IktT1ck2z4/au+M
         iYtdMx8/53aPhEKCazPnsuTSFwToYipPw3kdm2UsaWVYOeB3ldmmmv8D+lkseJ28CZf3
         /9HBeFqvcSFMSkyYjz4od2igI8yssAXYuf5LMsZAajGIm7Ly/ULoeEcPK2wxtgd+wdT9
         H7aZkAB8MhYwDgtTIddUItaCj2uwJNuPoT3yU98+41X47PRy1Trl3msfq2KO2Ci7snaf
         nfLrHNoeCxKxOEu9YstzNrDlv+56ELdfpPYiEwqfjbj/u0SZ7LBEc3i1VIjBEHB+nZ5U
         +jKQ==
X-Gm-Message-State: ACrzQf3AnArzc+CmEmzQiDA6hNVk6WQU3GsK3mUdFEgyJZY5p8E8wEBX
        +ilGGxHxbZaX1YP1d7buhOMq+2AS5Qewt8tIOn5xu4cPwfH+rCyxHLxqtEnv2Rxu61HDBW+/cix
        dkSeTrk0CnNZoljeWR43Jr4JujQ==
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id l16-20020a05600c4f1000b003c6dcc651d7mr7887410wmq.91.1667219208972;
        Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eCY6FaPESRi0FBsuwSJAU0ypknopcItEy1BimghpIISJ8Db9xrgTY3spCPjOXKZ6zCgaGzA==
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id l16-20020a05600c4f1000b003c6dcc651d7mr7887399wmq.91.1667219208796;
        Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003b476cabf1csm4889352wmc.26.2022.10.31.05.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
Message-ID: <0d2250e4-dc26-2fc9-e429-0d43ef280e5b@redhat.com>
Date:   Mon, 31 Oct 2022 13:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 13/21] drm/fb-helper: Rename drm_fb_helper_alloc_fbi()
 to use _info postfix
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
 <20221024111953.24307-14-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-14-tzimmermann@suse.de>
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
> Rename drm_fb_helper_alloc_fbi() to drm_fb_helper_alloc_info() as
> part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

