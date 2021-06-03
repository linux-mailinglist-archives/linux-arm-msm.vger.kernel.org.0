Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC0B39AAE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 21:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFCTWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 15:22:52 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37411 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhFCTWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 15:22:51 -0400
Received: by mail-ot1-f41.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so6809344otp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XDuTHy+WSy89MPdjzMkB+2AAnStth5q1riD/MqItVU4=;
        b=OI+T3T0cL+t14gfJunetRWN2tgWBdLvB4KxFRPyK5DVeHqTxqvLnfDIA5BvAnl6X2Q
         3QPRLndKmLybEGc4bt8aZ34d10UMz+vVibFdpJL+LApb1vVQutb06CCJcPEC7QV5PXDj
         TBdhq3qXqsTYTBozWkE7SUSfa41pqf+LXpaAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XDuTHy+WSy89MPdjzMkB+2AAnStth5q1riD/MqItVU4=;
        b=aq/1TgZq8/nf/b8lHgD4pS8tYaJphdRb3H/tIzHTWSVMABZwsvGC5IHUzycxgD2jrn
         rvgmbW1I15+2qVX7gp+St2Pe/NyhKBhmGCVdEFfCxi6FRfPZYf/KkCoKJmOYGBpQPoA8
         8rYR/IGsqD6jlHbje+6KzxxDR5OzobtzsgP2+Gnrkf6MX284KFkIjgoce824yy75Ejzy
         3Vxuu/uCWTMhkpBxV0whB/f8bkN6pWswPqMFLxx10sXTfKtYuBsICSlaTIOzVSDYCYrd
         gvxKatBU9LhZiYFTOu9HfEJlmKo84iM/y+aKopm9KBSTRdWzoFDQ0Hk2CjMto9Qy1Y4W
         kWYQ==
X-Gm-Message-State: AOAM530xlKHb5g4/xRxjI5PR9JzQ1e9YJyLEeHmQPKqxBLGsqQecYyJY
        7FU45nj1eExe16EXztRhVUhUAEXR/KjAVwfc3/t3cwvq5w0=
X-Google-Smtp-Source: ABdhPJxn3K6b7ZhhEb/4cSo+a3w6aFxRrwtuOfV0rALuSFrFAk8eTzKE1DKQNbbx3q34atx5iWRm6vKzm7Sjgap1ebk=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr687970otb.281.1622747993300;
 Thu, 03 Jun 2021 12:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org> <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
In-Reply-To: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 3 Jun 2021 21:19:42 +0200
Message-ID: <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
To:     Rob Herring <robh@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Dave Airlie <airlied@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Arnd Bergmann <arnd@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> >
> > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
>
> pl111_vexpress_clcd_init() starts with:
>
> if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
> Isn't that supposed to be enough to avoid an undefined reference?
>
> Making the whole file depend on VEXPRESS_CONFIG is not right either.
> Not all platforms need it.

It needs a compile-time status inline then for the functions we're
using in pl111.
-Daniel

>
> >
> > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/gpu/drm/pl111/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > index 80f6748055e3..c5210a5bef1b 100644
> > --- a/drivers/gpu/drm/pl111/Kconfig
> > +++ b/drivers/gpu/drm/pl111/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_PL111
> >         tristate "DRM Support for PL111 CLCD Controller"
> >         depends on DRM
> > -       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on VEXPRESS_CONFIG
> >         depends on COMMON_CLK
> >         select DRM_KMS_HELPER
> >         select DRM_KMS_CMA_HELPER
> > --
> > 2.25.1
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
