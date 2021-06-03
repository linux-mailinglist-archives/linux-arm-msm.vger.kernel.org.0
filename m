Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95BF39ACE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 23:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFCVbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 17:31:53 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:43734 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhFCVbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 17:31:52 -0400
Received: by mail-pf1-f173.google.com with SMTP id t28so5885364pfg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 14:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Yeh/FjvoGmDvMVI3FhndKEAnDxbRTGa5PVumREo+/U=;
        b=CxbhIwPtH10NEUgChjJXFAa/Kma9UcNFh/9cCYSjXEjz+Z+xBYH79qxj2tLoiCcBxh
         VTKyd/9ozWk/aUphLEgt+/m2POjsNqpzx8S1J6xAdQ+By8aUx6MwBbH6+6TPDadxXfwG
         hGJGk1CkZzfssRK7krjAHRRCm2Ehd0Gncf8rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Yeh/FjvoGmDvMVI3FhndKEAnDxbRTGa5PVumREo+/U=;
        b=ikBzEM2nDpvcoOuZFmrnwZA9XdxGPlXUwUOgvXFiuwo4mo3UjKRc7mzkVXICElztI+
         ZPvtXruu75c44SvPBMJAS4RFLnaDJA4RDQb40YtaisUwrg3pHhVFOJSb9OzEkmrzSAtn
         qVxvz/YSsEnny9v9Ek2IM986uqrTYsEYfhO/qkK4mNSkZTx07d3sUrkmRwtkny7rMEen
         radqmOah8UkwhgXNA+s/Rnjk9iKr3kc5XQXDl06X3ThOE/pDzZ3SnX/sMrSIY5nhdQ/Y
         KfpogCvr5OAKGVtbNxvzfK0Fmg0Tlb5SYKmQjwrSKW7rKjLq2MRvDl0Df4npKINR/Okn
         rGOw==
X-Gm-Message-State: AOAM533/XA11Qld4oMd2RpUb3gAfcAS87jvc2t2uLIOsPkcKpr2VP7rO
        k5pijJoHg5UYIR505y+C29KvWQ==
X-Google-Smtp-Source: ABdhPJyAQKUVj6xeGTKI/EB0Y3dsmWB0IM9MSfak1uIoG3Yp+fIAM1Il/NoO3cJ2xnooyk2IosedYA==
X-Received: by 2002:a63:be45:: with SMTP id g5mr1386784pgo.311.1622755747756;
        Thu, 03 Jun 2021 14:29:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u73sm22479pfc.169.2021.06.03.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:29:07 -0700 (PDT)
Date:   Thu, 3 Jun 2021 14:29:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Herring <robh@kernel.org>, Dave Airlie <airlied@redhat.com>,
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
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
Message-ID: <202106031422.FD9E3C5755@keescook>
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
 <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
 <202106031357.BE2A09DA8F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106031357.BE2A09DA8F@keescook>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 03, 2021 at 02:19:52PM -0700, Kees Cook wrote:
> On Thu, Jun 03, 2021 at 09:19:42PM +0200, Daniel Vetter wrote:
> > On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> > > >
> > > > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > > > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
> > >
> > > pl111_vexpress_clcd_init() starts with:
> > >
> > > if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> > >                 return -ENODEV;
> > >
> > > Isn't that supposed to be enough to avoid an undefined reference?
> 
> Ah! I missed that when reading the code. I see the problem now. It's
> because of:
> 
> CONFIG_VEXPRESS_CONFIG=m
> CONFIG_DRM_PL111=y
> 
> I think the right fix is:
> 
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 80f6748055e3..662fc38f92ba 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -3,6 +3,7 @@ config DRM_PL111
>  	tristate "DRM Support for PL111 CLCD Controller"
>  	depends on DRM
>  	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on VEXPRESS_CONFIG=y || VEXPRESS_CONFIG=DRM

Oops, no, I had this backwairds:

	depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM

_that_ lets me build with:

# CONFIG_VEXPRESS_CONFIG is not set
CONFIG_DRM_PL111=y

CONFIG_VEXPRESS_CONFIG=y
CONFIG_DRM_PL111=y

CONFIG_VEXPRESS_CONFIG=m
CONFIG_DRM_PL111=m

CONFIG_VEXPRESS_CONFIG=y
CONFIG_DRM_PL111=m

and disallows:

CONFIG_VEXPRESS_CONFIG=m
CONFIG_DRM_PL111=y

(this will force CONFIG_DRM_PL111=m)

-Kees

>  	depends on COMMON_CLK
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
> 
> I will go check the defconfigs Rob mentioned...
> 
> > > Making the whole file depend on VEXPRESS_CONFIG is not right either.
> > > Not all platforms need it.
> > 
> > It needs a compile-time status inline then for the functions we're
> > using in pl111.
> 
> FYI, this is the config I was working from, which was throwing link errors:
> https://lore.kernel.org/lkml/202105300926.fX0MYySp-lkp@intel.com/
> 
> > -Daniel
> > 
> > >
> > > >
> > > > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/pl111/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > > > index 80f6748055e3..c5210a5bef1b 100644
> > > > --- a/drivers/gpu/drm/pl111/Kconfig
> > > > +++ b/drivers/gpu/drm/pl111/Kconfig
> > > > @@ -2,7 +2,7 @@
> > > >  config DRM_PL111
> > > >         tristate "DRM Support for PL111 CLCD Controller"
> > > >         depends on DRM
> > > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > > +       depends on VEXPRESS_CONFIG
> > > >         depends on COMMON_CLK
> > > >         select DRM_KMS_HELPER
> > > >         select DRM_KMS_CMA_HELPER
> > > > --
> > > > 2.25.1
> > > >
> > 
> > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Kees Cook

-- 
Kees Cook
