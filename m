Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5639C3F8D71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhHZSAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhHZSAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:00:48 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E0AC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 11:00:00 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so4589092otg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RcIYF9R/pHJGqLoLVM8C2PNIjlEdG+08V6XIw2z0GXA=;
        b=bEcMfQI7Jf4WT5ynaI3vWPhlVDv8Cva8+DmGatup6oPvlw20KIo97L2C2ScgUKHhVC
         hdUPgZ6+b4k87ono5IHVsrFOPhC67bHf4R3Tt00XuS3+xegaCJtLSJtW8sUdyUqUBR7b
         Ep9YqQSIAcuV+fwTcLMpIY5lLK3AD/zdnpTu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RcIYF9R/pHJGqLoLVM8C2PNIjlEdG+08V6XIw2z0GXA=;
        b=PORPGdplrPPqovxIJ+D/PV37vPZo4XxdDwyI7HI1ZAo6QBLpTwD1onZKhFubWIVHNS
         inphKyhyS5lyf7tlWntEjg+szjULCOp/3qYAjRQPpw/cXgcUhpXa5ZiA2Gl8Rr1SIyFy
         z6LGm4qYqqiWcaGIM+KJNF+JGK3JBRe1j4zJawTo6j6Ob5VFdBBXqu18gGSMQzsg3TdH
         /4pag1Liw1fiFsfLMUDJx/zOE7G18d8KAjyxczW6YLFHqeiHCsccO+KLC1ibIF3RkUTb
         lCn029M4QThl3k5oBocOkme+beulR/ipIMWZq+kUcFHg8mLz4bk3Ya9iExghzvpzWjCM
         bgTw==
X-Gm-Message-State: AOAM532SX3iuOsidWYR9QxHcr369x099AQv6zwx3Yac+Kwvbp8jOZPdB
        0ioyiJyx24pwqjhsto7jln/1CoISUE12DiLIyzARdQ==
X-Google-Smtp-Source: ABdhPJyu2G2XRMt2TFHuTq1cHhTZmiAqHMH+7NXBJGNrokExA+VfOjpgGhUKc4kR5HSTLWP8EzKT6YUkZBeBKGhkVvw=
X-Received: by 2002:a05:6830:2b24:: with SMTP id l36mr4312663otv.25.1630000799901;
 Thu, 26 Aug 2021 10:59:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 17:59:59 +0000
MIME-Version: 1.0
In-Reply-To: <YSfH7j+24OMa3rVE@ripper>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org> <CAE-0n50JXw6KL-u70csWS-9F6YhZy0pNah91h4e9a_9MnjJzmA@mail.gmail.com>
 <YSfH7j+24OMa3rVE@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 26 Aug 2021 17:59:59 +0000
Message-ID: <CAE-0n50xdTugw_gw97b2VLXjAFp-E064_NfLJ9tzkfaUvq3UvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-08-26 09:57:18)
> On Thu 26 Aug 00:13 PDT 2021, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-08-25 16:42:31)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> [..]
> > > @@ -203,8 +204,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
> > >         dpu_debugfs_vbif_init(dpu_kms, entry);
> > >         dpu_debugfs_core_irq_init(dpu_kms, entry);
> > >
> > > -       if (priv->dp)
> > > -               msm_dp_debugfs_init(priv->dp, minor);
> > > +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> > > +               msm_dp_debugfs_init(priv->dp[i], minor);
> >
> > Does this need the same if (!priv->dp) continue check like the other
> > loops over priv->dp?
> >
> [..]
> > > @@ -800,7 +809,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
> > >         if (!priv)
> > >                 return -EINVAL;
> > >
> > > -       msm_dp_irq_postinstall(priv->dp);
> > > +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> > > +               msm_dp_irq_postinstall(priv->dp[i]);
> >
> > This one too? Or maybe those gained NULL pointer checks.
> >
>
> This already has a NULL check, that's why I added one to the adjacent
> msm_dp_debugfs_init() as well.

Ok.

>
> > >
> > >         return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> [..]
> > > @@ -1194,6 +1230,10 @@ static int dp_display_probe(struct platform_device *pdev)
> > >         if (!dp)
> > >                 return -ENOMEM;
> > >
> > > +       dp->id = dp_display_get_id(pdev);
> >
> > Ah ok, it's signed for this error check. Maybe assign dp->id in the
> > function and return 0 instead of assigning it here?
> > dp_display_assign_id()
> >
>
> I like the fact that the "getter" doesn't have side effects, but making
> dp->id unsigned makes sense. So let's pay the price of a local signed
> variable here.
>

Sure. If that's the only change then feel free to add

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

on the next version.
