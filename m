Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0493E376927
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 18:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238454AbhEGRAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 13:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236002AbhEGRAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 13:00:10 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33879C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 09:59:10 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 4-20020a05600c26c4b0290146e1feccd8so5272952wmv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f4WDLsvKJMxDGO3+bzmGSecNUJim8tE2LEMA4fIetY8=;
        b=CL8xvpvAHG70auywB/Spvy3ss+5QkCld2KRv1eqOt1maC6iB8xp0ExToQWHwYN56Nu
         JaB4JwO8a6v2h3mA/7iNyQSy6NLIvmuiKB7pDd+tA46COmLc5s4t7H5AJGNPgcUBbsP+
         ZneMWoLXa/bsisGUCnVPTbFpuYcndZED/Kpz8vxBk8zqNJkDZA1PAEWah0is5/MF05hv
         +jmN9gGsj6H8YMJ5GYty8V0SWpc291OGZYVcxgF/+yHfkhwn+Qy+Bdtmo9uUkEtlnFNl
         wQNBU5DB80M22GuLYUmfPuOavL+njr6kebiGsJ4RXuD7Oxu2dMVoqW1akJyu85rJ8eS9
         B5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f4WDLsvKJMxDGO3+bzmGSecNUJim8tE2LEMA4fIetY8=;
        b=TJfNoW3CYlsfQdkkx5c+eSWhFqekAsxTM9I5ZscDxHYxJmhi5F7IhKtewc0Vq5HQTq
         54HkOlQvJHALxXZMjEHmeX6xZExcRWVUsY9X3w1ToLDMwJPoT77FgnvcvIjSg8FVVfNi
         qaw8ZDLMh5cXSH8GLIWvYrtmfqFZ1g3oAZ7A02EDmwn0mQNDhpNM159R3vEDkIIWjhmO
         mvna8h9PR+fTH54sFJkPgGdiQLWwbaajKwGQaFMrRD1YKa9GkH6Pp1XtHCH3OPKF7Tz/
         Rv4cHADSv0t26hIzVYZyQ9zWn4KtB7OrJItrvBJLIsJi2tpDdFdHyIHw4t+iBrENTZrY
         hqZw==
X-Gm-Message-State: AOAM531/ezf6aTKetmBdaDfdA0B0Yqy6orMMaCbEUkx4ZAvXx1T2DKWU
        TznL4smEyRQvV+gCLdXmzcb/ToxFkh8PRDwCjxG8KQ/Y
X-Google-Smtp-Source: ABdhPJwHz0UOTtSriaYhPLieL9JH2FIXzvpsM22+FD0bA2bQxAo21M2u2vcZgRZf0DcF6KRujyOP7mZtKl87ZCNv7I4=
X-Received: by 2002:a1c:4954:: with SMTP id w81mr22641820wma.49.1620406748836;
 Fri, 07 May 2021 09:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210507141651.2887-1-sean@poorly.run> <CAF6AEGutiv+0QMNo6QQ8jSDYwxhJ5+62_TZ5zsiT_WxgDm+JiA@mail.gmail.com>
In-Reply-To: <CAF6AEGutiv+0QMNo6QQ8jSDYwxhJ5+62_TZ5zsiT_WxgDm+JiA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 May 2021 10:02:49 -0700
Message-ID: <CAF6AEGud9xdEwDpADN3SpA+JMUCYtRL6UEaGLiq49vy5sqwa7A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix uninitialized var usage in dsi_phy_28nm_8960.c
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 7, 2021 at 9:43 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 7, 2021 at 7:16 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch fixes the following error:
> >
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
> > [-Werror,-Wuninitialized]
> >         snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
> >                  ^~~~~~~~~~~
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
> > note: initialize the variable 'parent_name' to silence this warning
> >         char *clk_name, *parent_name, *vco_name;
> >                                     ^
> >                                      = NULL
> > 1 error generated.
> > make[5]: ***
> > [scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1
> >
> > It looks like the allocation was inadvertently deleted.
> >
> > Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> >
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> Thanks, I'll pick this up for next -fixes pr

Oh, sorry, I lied, I already had the same fix from Dmitry

BR,
-R

>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> > index 582b1428f971..86e40a0d41a3 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> > @@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
> >         if (!vco_name)
> >                 return -ENOMEM;
> >
> > +       parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> > +       if (!parent_name)
> > +               return -ENOMEM;
> > +
> >         clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> >         if (!clk_name)
> >                 return -ENOMEM;
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
