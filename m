Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A695E51C428
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 17:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380909AbiEEPse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 11:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380888AbiEEPsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 11:48:33 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B062532F3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 08:44:53 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id m20so9486432ejj.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=quJEpHcp/xQptAms2+pqVJe+BALCjwpz/XJpAyA2rOQ=;
        b=LtUWKtWwjEvzaJgwc+Y/Pc6ZtJYCCkbtEkwMj1kQLWR6QFKfyiqJlhG7vN+64C/904
         xP1Ersi2F/t8PVceS5QerFuVP5j/3gPomyLsiSTKmZBksKXz8GSeR+BShI51vCfXE6u3
         smVhw88erVhJUBtIhFgT/WIVkntmQ4UTU7dtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=quJEpHcp/xQptAms2+pqVJe+BALCjwpz/XJpAyA2rOQ=;
        b=C/x22YFoKiutwAghGb50oBEwNlJ+L/tfjvNnk4k1nqQJ3AKN7bWSqzlkUOGLzuABXs
         XhyMJfNtzpGEoqkdUG/1gijotmsQTPHU3qeuYcndLbOx8pGffPRg3RJL8RdxePYyxKW9
         8EKuh3LfW1oNCcjbhsdXrZdji4DTMY2Mk+e9/nU5OpQWThXood6I2xPIUk+rp3TFXkU2
         ncnZBakWh0kd0fqCZLd+bGUSHwgdlMORuWbHQpJL+e2MGnWiyMKCOAigVCOCRAsqHKlG
         s+j86Cw8PuWx3DgIjvWgmuBruFxHtMaNdEHDqzuwCGKxDNLu8X1IgkVmEF0qnotnVCj+
         lElg==
X-Gm-Message-State: AOAM533Y7mWpBl/vLqQ9+vp/kGGQb2Hyy88COh+2hkCAWvaHu65YvSak
        FzOLh+7r25cKYF1gDEjOZcHwMYbVtYY15xhXH8w=
X-Google-Smtp-Source: ABdhPJzXdsxfrKKQBGWQk7TN9WmpqH/rzYoLICDh8E5LN97/96L49jtwKBn/byrbsyEwh5nbAB8iiQ==
X-Received: by 2002:a17:906:9b96:b0:6f5:cba:b665 with SMTP id dd22-20020a1709069b9600b006f50cbab665mr1053255ejc.505.1651765491206;
        Thu, 05 May 2022 08:44:51 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id w9-20020a170906184900b006f3ef214dcesm871006eje.52.2022.05.05.08.44.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 08:44:50 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id i20-20020a05600c355400b0039456976dcaso2752890wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 08:44:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr5718669wmq.34.1651765489131; Thu, 05 May
 2022 08:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
In-Reply-To: <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 May 2022 08:44:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
Message-ID: <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
To:     dri-devel <dri-devel@lists.freedesktop.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ville,

On Tue, Apr 26, 2022 at 11:47 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> mode.
>
> A DP compliance test expected us to utilize the above fact when all
> modes it presented to the DP source were not achievable. It presented
> only modes that would be achievable with more lanes and/or higher
> speeds than we had available and expected that when we couldn't do
> that then we'd fall back to 640x480 even though it didn't advertise
> this size.
>
> In order to pass the compliance test (and also support any users who
> might fall into a similar situation with their display), we need to
> add 640x480 into the list of modes. However, we don't want to add
> 640x480 all the time. Despite the fact that the DP spec says all sinks
> _shall support_ 640x480, they're not guaranteed to support it
> _well_. Continuing to read the spec you can see that the display is
> not required to really treat 640x480 equal to all the other modes. It
> doesn't need to scale or anything--just display the pixels somehow for
> failsafe purposes. It should also be noted that it's not hard to find
> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> display via a DP to HDMI adapter and that screen definitely doesn't
> support 640x480.
>
> As a compromise solution, let's only add the 640x480 mode if:
> * We're on DP.
> * All other modes have been pruned.
>
> This acknowledges that 640x480 might not be the best mode to use but,
> since sinks are _supposed_ to support it, we will at least fall back
> to it if there's nothing else.
>
> Note that we _don't_ add higher resolution modes like 1024x768 in this
> case. We only add those modes for a failed EDID read where we have no
> idea what's going on. In the case where we've pruned all modes then
> instead we only want 640x480 which is the only defined "Fail Safe"
> resolution.
>
> This patch originated in response to Kuogee Hsieh's patch [1].
>
> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)

I think this patch is fairly safe / non-controversial, but someone
suggested you might have an opinion on it and another patch I posted
recently [1] so I wanted to double-check. Just to be clear: I'm hoping
to land _both_ this patch and [1]. If you don't have an opinion,
that's OK too.

Abhinav: I think maybe you're happy with this now? Would you be
willing to give a Reviewed-by?

[1] https://lore.kernel.org/r/20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

-Doug
