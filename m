Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32E4493659
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 09:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352500AbiASIcX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 03:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350982AbiASIcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 03:32:23 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4EBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 00:32:22 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id m8-20020a17090a4d8800b001b4f361964fso1949974pjh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dSmyI9DWw4yjUYr1nbkInCEVJfsKrWWmNEo3N5Pb/+8=;
        b=ALKiXykSDyTEQAdxfUqak//n6c0I9iHi2l01AJef/DYgG2GQHArPmubo5KNHrbOreS
         of5NeR6NqgQ74KZ2WEOxDtJ/W0rutGdyD6dQavhGy9ohiXGf0MxS15oFWHcLOgi8vPOg
         Lm0s7HKLAEStRsolrJ6I3VbLcfKOhgABBPiDdIgmJwf1xRTzZSiNp8l1JRH/Ct11F01v
         8LVzQgfrD0TiZsaDVN16goRrt6TIn1xN8b35eNsjs9bJfo6RhDZoXFNv+WkHxdbhgn8j
         FZT42ZpmNEAd7KCW9ENDt2JZrQNqXMNDuS4e8L5dFzB6gYFYNBFObdgBbDUzgCQplcpI
         BjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dSmyI9DWw4yjUYr1nbkInCEVJfsKrWWmNEo3N5Pb/+8=;
        b=wdOnTjRNofidgyNHuwZl8cBGRP9nzcgKGIlFzG/SRc6OKvTwSjOQpcM9+stbFwMeTv
         zRx41qCVsC5qqif6lPDAJCl7gfupzw6Uh2B431ujDh2YwvaoiMs1wX2xw/R5OIpzQZv6
         5aXTar2sWiTE2QU3idyknwbfGEM7hLOKjUX8YfK2y5R8Re9MnesMrxWvE4j9B1iAQV5r
         mai7mEqs1S43Oj6U6JAwcDKBUThV8n9LEU9azVYtYpdxYfjVQrKf6Qv8bAWyDO/gsihD
         76dbx2gbFkSUaBoe9XHyBjc42hZxcaa1WxF/bWZ0UgASkLQDZsxKdQXNOsQmzRbPiETP
         QOPw==
X-Gm-Message-State: AOAM5304lpwmwoshNwma+R59GoU72+bkxEkuMuDWRBx53LSOGhqGvMBH
        scuhu1EqVOH4wzttG+fy1iJtJWAkpNq+Abs+ZQnAmg==
X-Google-Smtp-Source: ABdhPJxDax72AjX8z4FnT10PwvTLx2e5zuOtT54rp12MpXvCqQWd+6XrpPRdBI429DXhFjcp17gIF9WQpBvZSgLgIFQ=
X-Received: by 2002:a17:90a:53:: with SMTP id 19mr2927524pjb.159.1642581142444;
 Wed, 19 Jan 2022 00:32:22 -0800 (PST)
MIME-Version: 1.0
References: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org> <c37daeda-e58e-6a93-36aa-28e392bb06f2@linaro.org>
In-Reply-To: <c37daeda-e58e-6a93-36aa-28e392bb06f2@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 19 Jan 2022 09:44:05 +0100
Message-ID: <CAMZdPi8VLa4VEKk9BsO5i-cSA=itpUTBr6YoQN7Y7AE6Jugo_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: add support for QCM2290 MDSS
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Tue, 18 Jan 2022 at 19:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 18/01/2022 18:47, Loic Poulain wrote:
> > Add compatibility for QCM2290 display subsystem, including
> > required entries in DPU hw catalog.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 175 ++++++++++++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
> >   drivers/gpu/drm/msm/msm_drv.c                  |   1 +
> >   4 files changed, 177 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index ce6f32a..7fa3fc7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -25,6 +25,8 @@
> >   #define VIG_SM8250_MASK \
[...]
> > +static const struct dpu_vbif_cfg qcm2290_vbif[] = {
> > +     {
> > +     .name = "vbif_0", .id = VBIF_0,
> > +     .base = 0, .len = 0x1040,
> > +     .features = BIT(DPU_VBIF_QOS_REMAP),
> > +     .xin_halt_timeout = 0x4000,
> > +     .qos_rt_tbl = {
> > +             .npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> > +             .priority_lvl = sdm845_rt_pri_lvl,
> > +             },
> > +     .memtype_count = 14,
> > +     .memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> > +     },
> > +};
>
> The only difference from sdm845_vbif is the lack of .qos_nrt_tbl. Is
> this on purpose?

Yes, I've not found any info related to non-rt for QCM2290 dpu, but I
assume it would be safe to just use sdm845_vbif here, as the others.

Regards,
Loic
