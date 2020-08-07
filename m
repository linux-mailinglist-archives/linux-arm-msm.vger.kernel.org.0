Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F8723F028
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 17:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgHGPs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 11:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGPs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 11:48:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2894BC061756;
        Fri,  7 Aug 2020 08:48:56 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f12so2084996wru.13;
        Fri, 07 Aug 2020 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yfueNriVUB3p4pHebmB0wN45L+tb5z/FC2duvCDRetg=;
        b=CJ9vNVD3aZLSnY2sCQYl+Y0UKcQT689KbOVAU5udo/ClWsJNreQJZNXU6iAvGe8iDR
         kUAJW4S7GBVyoAtthSfCBaRWUUUBHuimkpYH/5XJ8PNdnJ0eviz+xhFhYSTHH+m1hoS1
         Om3f4I/W2uHDLUkLzi3i0Ls0osGwgF2ZxG1aNXbjGyrts8KjTnTWTJFAEPgA+tZ8/8gq
         rAtbijUFcMirTFEyFAABbC/KVfr4TvvGldj9w0+rqij0vxa1+oe+uTfRS8GVrGTlFISM
         aCs9/zcM6ZIfssVBDnfPocblj1mydfunen5INJAlAuGECk00ksQIJJYfWtYCDmmmXckT
         bTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yfueNriVUB3p4pHebmB0wN45L+tb5z/FC2duvCDRetg=;
        b=KRVVy8Q6REN7fqhtGVYiw6SZVYE1lqlQu0Jq2hWoPne+1CYkFwUkOEE7gyyu1telKM
         dqCvXwKFkqQhmoLGvV9MPoeGkvBHdKug9rNt4WyO2AVBgfOwPbHvlV5RqpueSNvfyeGP
         5bXRHD/i+cv0gkZDlPonC0rX/1bLBT+u8jN66TgMC//h6hXvIyFvwWi6lrTdZ5HlYWJq
         x5tSys87qqa7HiXcqSL79QhHivtVPb1qFCqsrRfvq9Dy/r2qAyVCWF1Ik7vErBjP1afj
         EJ1eAmPeur9aDLWGgQFmH0Nb9AQFPOQyWsj16/LL5NnKl7qVF/VnnoXgOox1jWJrtB1b
         cASw==
X-Gm-Message-State: AOAM530KsNbJMxrP9RTk5ghnnoCnWA0VQXZtaMCQ8K6xn/Ddfmu57T2P
        nptvEX6p5jUj2Y+Qxky51XbE1b3J1KMLfFYapFE=
X-Google-Smtp-Source: ABdhPJytinwBY5iKZBEt+YLwoGWtqqhpouwAznID40D/s5L6USS9h0V+VI8N7EAyG74/0nL5zvsljvf9illVhaeW6Ls=
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr13545017wrs.132.1596815333975;
 Fri, 07 Aug 2020 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org> <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
In-Reply-To: <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Aug 2020 08:49:37 -0700
Message-ID: <CAF6AEGvLrR2LPTF2DDEcxRwQY+pEEcooZh=NBSr5WOs+TUk0Dw@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
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

On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 6deaa7d01654..ea3c4d094d09 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
> >       help
> >         Choose this option to enable HDCP state machine
> >
> > +config DRM_MSM_DP
> > +     bool "Enable DP support in MSM DRM driver"
>
>         bool "Enabled DisplayPort support in MSM DRM driver"
>
> > +     depends on DRM_MSM
> > +     help
> > +       Compile in support for DP driver in msm drm driver. DP external
>
>                                               MSM DRM
>
> Also:
> I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
> What does it mean?

I believe it stands for "Mobile Station Modem".. in the pre-devicetree
days it was the name of the qcom platform.  Things later shifted to
"qcom" instead, but that was after this driver was merged.  At this
point it is just three letters ;-)

BR,
-R

> > +       display support is enabled through this config option. It can
> > +       be primary or secondary display on device.
> > +
> >  config DRM_MSM_DSI
> >       bool "Enable DSI support in MSM DRM driver"
> >       depends on DRM_MSM
>
> thanks.
> --
> ~Randy
>
