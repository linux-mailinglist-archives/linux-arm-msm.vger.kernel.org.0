Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16393381EAA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 14:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbhEPMT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 08:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhEPMT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 08:19:56 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8315C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 05:18:41 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id r13so1849268qvm.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O1mGXyme0tS5V31oK5nRfRtDEHh64dhToBqvFaoH8HI=;
        b=bCB9ldPhw5dRnQiT21Ov+ncDDR1ggHpXO5zFG2rqwWN8fs2hNqcfazX2XON54mjxaj
         o2zFrPqCqD+Zb4u8ZUhB4DLqLdb85GA1s0ZzHVe11jmOHtWeul2hcrE/D0GyBbVKxzhC
         qokRjsVy5Ep1ngkVkqkHaETlt35jDQqkPlQ0JY2rsrFOKOqNvUFojoYcswuse1v2+J5+
         wnjbSOkiCyCj8XEM1rsaSXMYyn4TpRO8HS9QHdOAjUP8zgQjnyN2JwYS/X+iOJSotebE
         wAqwPovrujWP3q9j+Gw4CWVpYT/PGLkdoXVrsje2JXdW4P3URgRWpy0Sxzcu8UGleg0D
         wUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O1mGXyme0tS5V31oK5nRfRtDEHh64dhToBqvFaoH8HI=;
        b=PbWdlWf9Bl2A7UBud+HyoprqBhRTf0QDdKlQ5tx3jdi1heGxEruB84GLE2xdtsafSH
         7NJhoHwP5YQ6Zq3frMb/05193NySwRnIjT2HH9gIp+Y0aszvs2Fjm9AkoZBFwP0Y/KUJ
         4hMEPPrJlVf89mlSFmcR7PzjSE4teoZ5ltIW8z5+Pu68fGQP5l47wlqieSrBnqNqCHo2
         QmoBedQjnvBUaoOatOLBViLQbIyrJdYBJIbRPCImmnoYX/v0ZClHHk24ZEOf3sf3Jyyn
         PC3KudlV1hM2iwsODo+jLmHcu2/mt1dWGpTQbx/t0chI4FY5iodtRmeKYQsT3ahlDKsX
         UlNg==
X-Gm-Message-State: AOAM530Iq1Jen/f6ZJtDM4r69CfDf7yoORxcGVxS09adz62hBzpI/ZOl
        EVw9J0C4xIz2RKkSzcxp6f1RtOl6/S1Woj+SpT1D5A==
X-Google-Smtp-Source: ABdhPJxpbwGFs0dCzeVTVlYolK+rSHjDPFYgDXjIG8TMySQLA9zXCvDteMJNlxBZmmHntuS1acUZtYkggrNLg18Ro6A=
X-Received: by 2002:a0c:ca0c:: with SMTP id c12mr21679965qvk.47.1621167521075;
 Sun, 16 May 2021 05:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org> <20210516054136.GR2484@yoga>
In-Reply-To: <20210516054136.GR2484@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 16 May 2021 15:18:31 +0300
Message-ID: <CAA8EJpq4tUQRuzXjW58mbzi9KhZHnxzhrTdLGBh3Zw4qmCcmCA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove most of usbpd-related remains
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 16 May 2021 at 08:41, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 15 May 14:56 CDT 2021, Dmitry Baryshkov wrote:
>
> > Remove most of remains of downstream usbpd code. Mainline kernel uses
> > different approach for managing Type-C / USB-PD, so this remains unused.
> > Do not touch usbpd callbacks for now, since they look usefull enough as
> > an example of how to handle connect/disconnect (to be rewritten into .
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Makefile        |  1 -
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
> >  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
> >  drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
> >  drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c | 36 ++-------------
> >  drivers/gpu/drm/msm/dp/dp_hpd.c     | 69 -----------------------------
> >  drivers/gpu/drm/msm/dp/dp_hpd.h     | 51 ---------------------
> >  drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
> >  drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
> >  10 files changed, 11 insertions(+), 168 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
> >
> [..]
> > diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
>
> It seems to me that this would be a reasonable place to plug in the
> typec_mux stuff. And as we're starting that exercise we should perhaps
> hold off on applying until we've figured out how that would look?

I'm fine with holding this for a while. Note, that actual code
handling the connection/disconnection is left in place. I've just
dropped unused data structures and related code.
In fact this started as I started looking for the place to put
typec-mux code and whether fields from dp_usbpd struct are used or not
(they are not).



-- 
With best wishes
Dmitry
