Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6A2309695
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 17:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhA3QSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 11:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhA3QRS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 11:17:18 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE57C061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jan 2021 08:16:22 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id r77so11877165qka.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jan 2021 08:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ejssOulrsTZ3ouHbrBBarxFuH2SuoMwxOAnWZQut8vY=;
        b=fmLNhBeiMEpCT64iXb708ra7uyU/Zu3j1K6JAv36RVHp01n5CleHqXKzoT74F9zaKL
         wncl6lJDD/PlSfUmmKmJdnMKUoo797O6FRVEjLRnyufjvFId6qRLeJQlRkiG6ypIC5+B
         fE5+v0pAHXXbvTEC65/I2ZAMahOFJe4XIbIutYTHZs4bANICZZw7g+HNQ5VwlgpOMUtv
         C1+rSGClaWl1qjmgmV0TJB9xn/iFlgNVbxQpxd+1m3AYeijxvhrI0sT6EDqPsgSEcUUO
         72tMlzC4kQ4hJFXavIUisZ1M3dK7Yf0icFZeWv9toAeRTyfhzKK252rM9jUJSt6+cdA7
         a77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejssOulrsTZ3ouHbrBBarxFuH2SuoMwxOAnWZQut8vY=;
        b=DafkmPhh2XBw3tjZCNBsTiNlGPw+tPAkNIJ3LbVYlU4t9oapzIvcTTyrTEQ7Ux2y2f
         H8HjlJJA2uG+phzfmJNM4Cwsrxm9dgepHch1AcJVfral5XRmXTVlzzhbiOI4zEdvbizx
         jJzPkjme7u6C4SbnhRePv5yKuF4FmIe6Vt2FaeW7jYG0h+bAuugzOc1xhkXOAh6HOWTM
         ZW/4sukbHJ4nv8tx/Gxndkt81A897nyFR4OERvGbd2oHI/MGMgHm290SFKTU/54ElI01
         YPeIzag/FGwP4fPHGTpsH5XpkA5CkaDE2SQOT6qPW2K4ZYFC9wXQvHGuNEzVqx0Hr7Ir
         tWKA==
X-Gm-Message-State: AOAM531v3lLhsra32Y+CwOQMYZbW2dFEWMCVRTXJvMWjb+2rBPAz72dF
        gKLk4NFzOuHpd4HlVvx4OCHCQDA77SK3BfuLjhaIKw==
X-Google-Smtp-Source: ABdhPJxjFzuwpFzrLhh+nGrXrs4raiQtDHat0NUdPD5KVJSQnlTf0MuHS/yGpjPuaALH/of+u93L6laMiPrv5cVnAro=
X-Received: by 2002:a05:620a:ec2:: with SMTP id x2mr8981436qkm.138.1612023381824;
 Sat, 30 Jan 2021 08:16:21 -0800 (PST)
MIME-Version: 1.0
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
 <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org> <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
In-Reply-To: <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 30 Jan 2021 19:16:10 +0300
Message-ID: <CAA8EJprOYwe8pSc+QzptVjxWKiTG-jGxoUh0aa5JTGq-4nnt+g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: save PLL registers across first PHY reset
To:     Benjamin Li <benl@squareup.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        zhengbin <zhengbin13@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Anibal Limon <anibal.limon@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 30 Jan 2021 at 05:00, Benjamin Li <benl@squareup.com> wrote:
>
>
> On 10/30/20 6:55 AM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > On 07/10/2020 03:10, benl-kernelpatches@squareup.com wrote:
> >> From: Benjamin Li <benl@squareup.com>
> >>
> >> Take advantage of previously-added support for persisting PLL
> >> registers across DSI PHY disable/enable cycles (see 328e1a6
> >> 'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
> >> support persisting across the very first DSI PHY enable at
> >> boot.
> >
> > Interesting enough, this breaks exactly on 8016. On DB410c with latest bootloader and w/o splash screen this patch causes boot freeze. Without this patch the board would successfully boot with display routed to HDMI.
>
> Hi Dimtry,
>
> Thanks for your fix for the DB410c breakage ("drm/msm/dsi: do not
> try reading 28nm vco rate if it's not enabled") that this patch
> causes.
>
> I re-tested my patch on top of qcom/linux for-next (3e6a8ce094759)
> which now has your fix, on a DB410c with HDMI display and no splash
> (which seems to be the default using the Linaro SD card image's LK),
> and indeed it is fixed.
>
> I assume you already also did the same & are okay with this going in.
> Appreciate the testing!

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested on RB5 and Dragonboard 845c (RB3).




-- 
With best wishes
Dmitry
