Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2083F67AEE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbjAYJyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:54:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbjAYJyE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:54:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C261D11651
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674640375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
        b=Me5xzdffngrvzZpGFVd46r/jO+Nmk5jIx/+DkECjn4Yod4D5ysHr9Xo3Q4DnVvVjcISnqp
        W7wVuQqZYU6Pez2WB94h/npBjrcV1c6Ry8zw1S+w/HdT6fs/RK7jLT+37EGpjeDlpyPF9C
        tnjD8egfnBqu7+Aesc0SyTprCFL8LyI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-6jkjKJ8VOCiollRGiJ1qVQ-1; Wed, 25 Jan 2023 04:52:51 -0500
X-MC-Unique: 6jkjKJ8VOCiollRGiJ1qVQ-1
Received: by mail-wr1-f71.google.com with SMTP id e29-20020adf9bdd000000b002bb0d0ea681so3093158wrc.20
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
        b=LbQ9ipR8xHShu/3PkJ6WsYaYvYDR3leraHw/ncQjIL1rWxqFBFO9fbm0tJYyu9kOPj
         UWv9co4gSYYmzNIIw0AzfXYoabvxU51pKGnnQ1FMvfc4LfC0FU0J+LGCQhrwCofZ1DTv
         o0APgbZH6b7q5h6tq7ucUXfKxKsHlOSsQFKRDwMVTxTxtrFwX23H9IiXRAaJUfjKtW1E
         bzoD1Bnm8nAexquaVzxVYv01LY/ppdiY539G+2wiZOozWbqqI0YJ/uN0WzMcCDQriOjj
         sBU0jdBd8dCg5qMPisY59y26Ia5ZzqHU6FL+8KL+F+u7aRdflGIyIDkcyUXpt7zE67Z3
         LYMA==
X-Gm-Message-State: AFqh2krcrIeck7YJsxtVNoQ1T9qsw/33rNORcRNESCbGbLgHPvpTKo3L
        p1l3kK1my/TH0QhJ7B0KVxIUGAUhbvD3P2PRa4vGcW02iRgDQCEanb4klUFgOBHwm2udanRaIvt
        klkMiyK2WpglAUeiKwHc4AVuThA==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr26349578wrl.4.1674640370486;
        Wed, 25 Jan 2023 01:52:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvmq2QmH2lib1EOjSoV1HyQPmQn7B/0nRysa3FFY81sXz4YqkvR1qkRuVsXj3rXTMZ7umf1Q==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr26349557wrl.4.1674640370241;
        Wed, 25 Jan 2023 01:52:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q14-20020adff78e000000b002be07cbefb2sm4747862wrp.18.2023.01.25.01.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:52:49 -0800 (PST)
Message-ID: <8e5bb4ed-11fb-272d-4d70-f25252a0c5c5@redhat.com>
Date:   Wed, 25 Jan 2023 10:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/10] drm/fbdev-generic: Inline clean-up helpers into
 drm_fbdev_fb_destroy()
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
 <20230124134010.30263-10-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-10-tzimmermann@suse.de>
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
> The fbdev framebuffer cleanup in drm_fbdev_fb_destroy() calls
> drm_fbdev_release() and drm_fbdev_cleanup(). Inline both into the
> caller. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

