Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB03341FF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 15:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhCSOpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 10:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhCSOot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 10:44:49 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4564BC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 07:44:49 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id j18so9384917wra.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoA5tf0GuXXI+tYehfknPh/CinyOHHXvGycSwmOWV6U=;
        b=SE6jiw6/KOeKjqbFrwXeOcbFgAIAeL20+UhrXgkSZwYcieoXo7X/q//43L48nDoQln
         j48/V+x0E4hLlO8V7ZS/YCtmvsh60EVI7AEek6nK6Ffyz0GkFeSF+ER+0zZy06/vAF8e
         d853rMAvzi5sp61lUG6vGFhPR5iuRooCya6LuVpEKjuhZ1YHzkQnsyxmyicQxoLj0ort
         PdOAiXlaOBlK4buQrtQtf38QTE+BFdLXcnKgQaZqJGBdeqD8UegJvj/F7sDRTWHysuoV
         X+sUCJw7YjF9xAyqN0sych61qoaTfwhtuF9AAAJ4QYdJse8MsTI19CBrxvtsQ/dn1J3N
         u2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoA5tf0GuXXI+tYehfknPh/CinyOHHXvGycSwmOWV6U=;
        b=IvAOYgnI7kXq2mJfh+9FPmz1POWqMdnAX6RF2u97mwtLtIi41bzAxFULW12DdV0Jqx
         q2gqbFkZBteHbKXoSV9N1oeG2Mv/s206l+TXM2cAMYnNQmEsxMp86bBF8wkf/bMT5QGs
         ARKa+4S6s0HJKGPFOWFqDWZ6V0tz2iGZkFw0uCxfUMlssVAZS204Kyyzw8nJzVu8k1+J
         MLol2ytitbQQgCw+sLssS85YGL2Enn4T1r6/U3OaVvlhoXok5z7UNGx8X5tWHIcEXqBW
         hvHJe55lgJItHydfULwJ3XymbTH5d7rrhrSWCEAIwSpwERL2khyhl3M9Ywq+TocSGEu+
         WnPw==
X-Gm-Message-State: AOAM532u4QlOGEvFJpv0Tl7nqa3LcPRNQHHexVuYC1Wy0UOIsLngxKdq
        Ix2djI7TuucdXnOMWceFUwaIXa3woma8vjy05yk=
X-Google-Smtp-Source: ABdhPJwF/ZP1XE3jOliuzyxtyE+s2gp3DriuVOeO6ryYMPBGwclLGu7uPtr4UPvtTrHfi2aafpOocaR4c9e3ATavNEo=
X-Received: by 2002:adf:f587:: with SMTP id f7mr4928235wro.147.1616165087988;
 Fri, 19 Mar 2021 07:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org> <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
In-Reply-To: <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 19 Mar 2021 07:47:59 -0700
Message-ID: <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 19, 2021 at 5:09 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Mar 1, 2021 at 6:41 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> > index 6a326761dc4a..2fd0cf6421ad 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> >         struct msm_kms *kms = priv->kms;
> >         struct drm_crtc *async_crtc = NULL;
> >         unsigned crtc_mask = get_crtc_mask(state);
> > -       bool async = kms->funcs->vsync_time &&
> > +       bool async;
> > +
> > +       if (!kms)
> > +               return;
> > +
> > +       async = kms->funcs->vsync_time &&
> >                         can_do_async(state, &async_crtc);
>
> I also see the same issue on a i.MX53:
> https://lists.freedesktop.org/archives/freedreno/2021-January/009369.html
>
> Then I got a different suggestion from Rob. Please check:
>
> https://www.spinics.net/lists/dri-devel/msg286648.html
> and
> https://www.spinics.net/lists/dri-devel/msg286649.html
>
> Does this series fix the issue in your platform too?

I think that might not help if something fails to probe due to (for
example) a missing dependency, so !priv->kms is probably a better
check to cover both cases.  But the 2nd patch makes a good point, that
the suspend/resume path probably needs the same treatment

BR,
-R
