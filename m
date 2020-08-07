Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFE523F0BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 18:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGQLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 12:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgHGQLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 12:11:45 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA27C061757
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2020 09:11:44 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o23so2664809ejr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y9D1KRUva+vEZ2yw/RUAbLSmKMRhybgAq31n6MCUn2w=;
        b=h8dgkoz8y/OiP85im29r03TQUoi5ZKfJewD54te1FYPtv/KEpTqZ+Da+Zaa0mlPEzE
         csDJUwYUPnrshDjQ6xV40Ux3iDsSemGp/pg5DQtAWRaB1aGrbcaG9gUW+rtMRRyLTgQ1
         ncC2qUcZI2kRdy542DbHxGfUEqUYiTPyZUafAliFIznk/rTpMgi5ASJ+4ySkCniKIYMH
         NT/hAK1qje2Ml/rNoKixLn77hnR0JvTBdLS+KtPpJPZMdhr7cQOtZqWHfQgUL/vZkkk7
         E9brMTW0uk6z/ioIWdFAof0g60jFqE3pnegpob1E+DCmYgk2LVRWhJjiwf5Qz2gjAWiK
         Gb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9D1KRUva+vEZ2yw/RUAbLSmKMRhybgAq31n6MCUn2w=;
        b=m4uOeQUJTuXhq0qAZSOGp7Qc7cxg1o0z3qpuWbCdkOtF0t0pnhUhTysy9GpmbmosLI
         kaXfThIwec/FzFZz69DGDZggTJYzJFYi/UyId/uuSTvsrSpMkvA7X+tVOlWqzZW2J/8e
         DYx1ICU653B1P8bx2+ZFT9EhX8cTDMLL8FlpdhCFo6J1cxr+JCSirg10U1tZFladKpoA
         fCtrvCsAKsBKAlyd9kNLUzgJssbUOR1Zg4gvvMQKuXa448K+2lYUfEI4H3RchaFP0nKg
         vymC8p0bufTda8azq7kbNu4mXup8jYF7F5IiRorhATNAwLl3vq/4L49Y+mbDwE3EFBzJ
         lgvw==
X-Gm-Message-State: AOAM530irZLEQK0XbEOBPGbUtcJiLiE5KcN/MdZWg+sHZvHnxqJf2qfR
        oodjJLtzILNvMBKbbDTKMswQqfcKo4d2kr1XtV7TFA==
X-Google-Smtp-Source: ABdhPJyrYrsX5pEESa8H+K7koPpEjRogCNgaqAF5EHjcrBUY1fHtp+5JeCDPHY/P9J9KeauYe50jhbLLuLbLdMYGuqM=
X-Received: by 2002:a17:906:9399:: with SMTP id l25mr9939694ejx.212.1596816703233;
 Fri, 07 Aug 2020 09:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org> <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org> <CAF6AEGvLrR2LPTF2DDEcxRwQY+pEEcooZh=NBSr5WOs+TUk0Dw@mail.gmail.com>
In-Reply-To: <CAF6AEGvLrR2LPTF2DDEcxRwQY+pEEcooZh=NBSr5WOs+TUk0Dw@mail.gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Fri, 7 Aug 2020 09:11:32 -0700
Message-ID: <CABXOdTeYOVWKNWfJxxVDC6Mdu1aisCs6yDCAdxRQGuUp8r2EQA@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To:     Rob Clark <robdclark@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 7, 2020 at 8:48 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > index 6deaa7d01654..ea3c4d094d09 100644
> > > --- a/drivers/gpu/drm/msm/Kconfig
> > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
> > >       help
> > >         Choose this option to enable HDCP state machine
> > >
> > > +config DRM_MSM_DP
> > > +     bool "Enable DP support in MSM DRM driver"
> >
> >         bool "Enabled DisplayPort support in MSM DRM driver"
> >
> > > +     depends on DRM_MSM
> > > +     help
> > > +       Compile in support for DP driver in msm drm driver. DP external
> >
> >                                               MSM DRM
> >
> > Also:
> > I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
> > What does it mean?
>
> I believe it stands for "Mobile Station Modem".. in the pre-devicetree
> days it was the name of the qcom platform.  Things later shifted to
> "qcom" instead, but that was after this driver was merged.  At this
> point it is just three letters ;-)
>

FWIW: https://en.wikichip.org/wiki/qualcomm/msm

Guenter

> BR,
> -R
>
> > > +       display support is enabled through this config option. It can
> > > +       be primary or secondary display on device.
> > > +
> > >  config DRM_MSM_DSI
> > >       bool "Enable DSI support in MSM DRM driver"
> > >       depends on DRM_MSM
> >
> > thanks.
> > --
> > ~Randy
> >
