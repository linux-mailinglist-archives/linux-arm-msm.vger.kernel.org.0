Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A8523F099
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 18:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgHGQKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 12:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgHGQKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 12:10:02 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81522C061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2020 09:10:02 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a26so2652089ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e0+XcafvkYqFAISI9FsWYXqr0NzOr+9r9ZHvTjYtkXc=;
        b=SSP5OEKD8fj8yOVmeHuyAsd7v5SDawwciuLl0spQMxOn1ma+BoYKRaRpEMNGoBSqCw
         wHu499nyL9wVoU/h6acqvIropQ032VOLjJRuhf/0UGaesQO6e5UPVCy8fIN9e7J1BQHT
         yrH8BaIB+7/l2ZAnparNyoAIh2P1OrkzU+y5DXex7BxCn3s6Oe6WbRxPQIJMyHZUOxc7
         ZPPCNI6uYEhToABA87QGOi9nWIFXJ6cTXz9p4htArMo5RwDdkuJ+xkbfuZbrhVS7BMRa
         q4Lqlv6/40JS7T0d3rmheoRNp0NkEQSID42YY31Mv5Bx5IeDSetS5HCVwikDMePvA4js
         w2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e0+XcafvkYqFAISI9FsWYXqr0NzOr+9r9ZHvTjYtkXc=;
        b=aIA9+SWYvgNr0mBSclcqbng+eLcpWBA/M6SrsMGeifBhkKq67oe1C15z4RP+HlKMSW
         veVZRDw+ApNjfJhJAtyX5Yc28rLWgLSd1nDu0aNjppXWNdp5k1rZ05PmSQE1f4g5hbtI
         JsPIXryWynvmvDVub1ZP5gmOp0XQJky9SYOz8k7c1HMHde8AhEqKuirnYdzJKw3B2G2n
         BWXkgvsqdji7TlqDkd8uGF7LLKdpZuPZcCkJhMkL42D1BRVZTn8b3K8HZ1PgXWum8fOO
         wy9Z9q4deKsb3oOc4D18BECrgtbyI6gQDzo9UBkOlE4/WUu+23PPhCLig/JP9MN6WAbW
         egrQ==
X-Gm-Message-State: AOAM53334JhbHy94BXILHlmXfK4MZXm5WOaLJVXzOw1JyhX/i08V4S/e
        q8Wu0dQzGPVyUq9vhbD8BA/R5Sz6J1u7HOrM+An8Jw==
X-Google-Smtp-Source: ABdhPJzdcRdTkOs+1G2pCdfkm+OyrYACJDw4v+tP3FYbX5unsdmggkgMqGmRVjVfrIDE5rOzWCzhoWk91aR3GjYmu9g=
X-Received: by 2002:a17:906:e87:: with SMTP id p7mr9829318ejf.547.1596816600939;
 Fri, 07 Aug 2020 09:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org> <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
In-Reply-To: <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
From:   Guenter Roeck <groeck@google.com>
Date:   Fri, 7 Aug 2020 09:09:50 -0700
Message-ID: <CABXOdTf6be2-O_aBakamNFswt+Xk0urJ7_x9hgwuuFO6=NDeew@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
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
Why "Enabled" ? This would be quite unusual for a Kconfig entry.

Guenter

> > +     depends on DRM_MSM
> > +     help
> > +       Compile in support for DP driver in msm drm driver. DP external
>
>                                               MSM DRM
>
> Also:
> I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
> What does it mean?
>
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
