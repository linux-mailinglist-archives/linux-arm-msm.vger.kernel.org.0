Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170E46135B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 13:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJaMSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 08:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbiJaMSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 08:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C931C6446
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z23uByta1RO7RusYzzGag4IvKSimSY8jEax7dgozF+A=;
        b=h2tegKMiWIGtbIk1/P01ccdMrYTydj+qUma62OUP27owChMflrAYUaX0UCIMtyAGOulfVl
        MbG9Bqha3GFz3BhqgEIiDvfqNNFUB99VrPNnql90ki0vhdjYxOQw015F+jEPQkb695ipFk
        cKkWIllZzxiR654pwom76ElSOogoI+U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-Dg4q6V-_NFK9zpghCjfDuQ-1; Mon, 31 Oct 2022 08:17:10 -0400
X-MC-Unique: Dg4q6V-_NFK9zpghCjfDuQ-1
Received: by mail-wm1-f70.google.com with SMTP id r6-20020a1c4406000000b003cf4d3b6644so1050163wma.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 05:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z23uByta1RO7RusYzzGag4IvKSimSY8jEax7dgozF+A=;
        b=GhaeL2O0C9Mca6hTC9AfOArSmat8CIdbYttVtC7zlFvcVrzdRFzQzETuXZEJAyz6Qh
         TXbVSt3Mx3s42DYNzz/hdcpmosbOUOFnl6v22VNFHOnFYZUl5Jooly88EIFmUEucaina
         0AYk8mXaNDs2BU71lUy0iZ9e3+QVeS58xRauqOPPTvl6UBT0LmWxvLJlOT/osev3guNT
         nFjL9aiGmwKjZmrUmdNmt6Es30seXcjih/NqGyV/qNlKwHDVzQAhbGaZPujubTj5ZGdy
         HfEswI9QHoPZuamvNR5jTQvJn7pi9q6GUizvT38t7XyNJJ9Vh+XuNBpWvZbAwsQ2EpdZ
         kJjw==
X-Gm-Message-State: ACrzQf3DVfuqG6Txa4jOJKf5XN7jNzUF9d6MyVobyNi1sxRcvRn8Bk60
        wtQfIQpWc/E45ITXP4kS0uMe/fBDvuEK06s1gd0GJKHNtR7x/WcTeMy++PJscY0yPN4ffWw2rld
        DckAW0su+TqCRyiYd/jZiwQiZ6Q==
X-Received: by 2002:a5d:6da2:0:b0:236:7916:a9b2 with SMTP id u2-20020a5d6da2000000b002367916a9b2mr7921496wrs.393.1667218629373;
        Mon, 31 Oct 2022 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67BGVEVFx5kckaS0oDiow+E3wYJXdivRHIvOOROl9hHnAsaKyVcMk8ZYE1a2HK4LSTJkXvEg==
X-Received: by 2002:a5d:6da2:0:b0:236:7916:a9b2 with SMTP id u2-20020a5d6da2000000b002367916a9b2mr7921473wrs.393.1667218629159;
        Mon, 31 Oct 2022 05:17:09 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id cc6-20020a5d5c06000000b002364835caacsm7133274wrb.112.2022.10.31.05.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:17:08 -0700 (PDT)
Message-ID: <efe0c7bd-0b14-b829-cc41-fda316952a51@redhat.com>
Date:   Mon, 31 Oct 2022 13:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 06/21] drm/ingenic: Don't set struct
 drm_driver.output_poll_changed
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
 <20221024111953.24307-7-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as ingenic uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian, Sergey)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

