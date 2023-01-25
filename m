Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2DFB67AE02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbjAYJcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235293AbjAYJcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44ECC1A968
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e/WkTUKbzuIyITLmeh/5Sbr5wRBScMiQq+Y/7HiPtGw=;
        b=OfK3zKcB1isdL/EGhdqOytLkF69cqVhTSaO1ki1ytPPq1xlE1KkWuW7+T181WAtGXfM3bH
        7/TOaM3XjJ0k8g/OMvefkK2wOh7TGlyQxu5QLAYrDRCTaj7WXKNNTaCl/po4D+kmlrbQL9
        2313j4I//YcaU/GJwoom02tsDLgjrRI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-rraQn0T5MGasI0qTDBZLVQ-1; Wed, 25 Jan 2023 04:31:08 -0500
X-MC-Unique: rraQn0T5MGasI0qTDBZLVQ-1
Received: by mail-wr1-f70.google.com with SMTP id o11-20020adf8b8b000000b002be143c4827so3036552wra.19
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/WkTUKbzuIyITLmeh/5Sbr5wRBScMiQq+Y/7HiPtGw=;
        b=d40PZM4/kcO8OlqAcqL/EMjYF7FeL0cAr+A+gMgPmoOearMLIlzaaK0ZZBH7lloGxS
         SsXuHWTl+GlGZesJpeXHNugUVCSxt5F7HVC4V6vVX3lX5tt/dZ3x+JQu2Ft+jKQLK1Ir
         uOsWDlamB+/EDJ54ET18TvbpTxtoQL0vFYO2uwNBd9uFiqedU0NQjq45pGKBhuxU3z1P
         sEX4o516/77hsy7Xt60M16/VLppS5GZBD/CrzKAH5uYJWjgz2Mttor+JJDsbKOsM8EuQ
         3rSxRHrgu9Lbh9qVuUE9rZ+FDBTlEuDnDNT/9KNB7kqrTlUtt/TVsDdSreNSpidgEUCL
         NfVw==
X-Gm-Message-State: AFqh2kqvVMt+VjEK8jwsr0cyScm2rsfDuWmGbs/uqbg+uAa75w3vdMqC
        bya7xXGub3F/I6JEF0bQBlOt8WgQkPceXaD8b8HihnartjMSM03pqC122/CXDq1DnX5H73yffb2
        j8boVPno/ZBGBWvAJmJtIG3B6tg==
X-Received: by 2002:a05:600c:c10:b0:3da:f5e6:a320 with SMTP id fm16-20020a05600c0c1000b003daf5e6a320mr35822721wmb.22.1674639066894;
        Wed, 25 Jan 2023 01:31:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFX/Kp2mSluNmLe5a+pgmO0l5es7cQOLhWqEKWjvp22TqYJWLpxeu0OJ4sOlzZNMpRvS8iog==
X-Received: by 2002:a05:600c:c10:b0:3da:f5e6:a320 with SMTP id fm16-20020a05600c0c1000b003daf5e6a320mr35822702wmb.22.1674639066649;
        Wed, 25 Jan 2023 01:31:06 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t20-20020adfa2d4000000b002bdcce37d31sm4573358wra.99.2023.01.25.01.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:31:06 -0800 (PST)
Message-ID: <6bb09a17-2f13-4920-b156-3be80e507f48@redhat.com>
Date:   Wed, 25 Jan 2023 10:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 05/10] drm/fb-helper: Remove preferred_bpp parameter
 from fbdev internals
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
 <20230124134010.30263-6-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Store the console's preferred BPP value in struct drm_fb_helper
> and remove the respective function parameters from the internal
> fbdev code.
> 
> The BPP value is only required as a fallback and will now always
> be available in the fb-helper instance.
> 
> No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

That's much better indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

