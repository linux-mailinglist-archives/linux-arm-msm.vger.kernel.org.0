Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A37E55C883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238864AbiF0UGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237972AbiF0UF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:05:59 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148C31D327
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:05:57 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 2so1763061qvc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/YNIIo1OfJZKBOf0su0gdSWMRajt9bfTLqLNeOeO4Y=;
        b=v0xAz+DZeFRyWeSKh+7LCrjx3NjVWydYH4Jjniy060BfBvCJ++TFGpNNnMMGMZmJL8
         ZETVJOqNENRp5YzTaPPF23EjOwQMsIKvJjDwt0v+xJgwdkTBJmwJr6NAadZr7HFSuPDb
         9bTuOwn03ON3kbc9rcwGxJE9ebcyH9sCzXyLMnLCeYfKIoSgr1TGsHcN170aUsspQ0bK
         WjmibuGKw1anaRM7too1lWzRIGIFnsne3c2NgMnkNDefryjg8wMCQsXMcp4HSIR9eB/T
         nhYqlcLL4IG/ZZaXaeRQYWH2nMFljQK+kU9+Bd8YRgYgcvpTYAwvJD4Fs2zAMh+mnVQE
         dW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/YNIIo1OfJZKBOf0su0gdSWMRajt9bfTLqLNeOeO4Y=;
        b=W0HzgqaBYLCZfiMq0ePwYJGAy4fF2hcQkdJOazibvTOyt3dbkY5LHVPb+zmX3rPG0/
         2zICfkD/vDjiCNmP5M99v8ENu75/aZQyHd6bavOYSZZjM5venOYXHu72ZW04XOfV01yK
         9VcfQrpZRHCz3R7djnVGhV2dQDM/+Ye30B9Gt+HcT29gaBKgfcuhXH+d5abHdCBkE0/U
         ChxgL257t+Sq036uqa1NGiQSgtSm8LD+9AymCZhQxsrLxiYZZfQ4EpayCHbYIu6WkAiI
         lXc43P3sMb0F4G1m8th4ykg9qOcdJNDFNFXTLA/zUDtXddRDHJxZZmNYgpvtvTwLnJAa
         ZvPQ==
X-Gm-Message-State: AJIora8LMQRtpUlt4ouz5cWts7Wlo1teAjxrQrhOpfwnwJU5ZaiasBZl
        SEHRgtaNS1sVkMGGckyD4osCqxkycsLtKE4lKGCflQ==
X-Google-Smtp-Source: AGRyM1t8TUCoMm1sgNDxPUTsFBn9RdMMW4h/okgLyvJyGwbpiRC4mQQKp1jppN6JlrTCD13/QPtdnx+/ags1m87CMTs=
X-Received: by 2002:ad4:596d:0:b0:470:7f34:fa13 with SMTP id
 eq13-20020ad4596d000000b004707f34fa13mr1030321qvb.55.1656360356878; Mon, 27
 Jun 2022 13:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org> <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
In-Reply-To: <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 27 Jun 2022 23:05:45 +0300
Message-ID: <CAA8EJprR23ugdi926BDtGOGdGEqvWBgOQfekyJjD_OFE3yx0Aw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Jun 2022 at 22:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
> > If for some reason the msm_dp_config::descs array starts from non-zero
> > index or contains the hole, setting the msm_dp_config::num_descs might
> > be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> > rather than encoding the value manually.
> >
> > Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
> >   1 file changed, 27 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index f87fa3ba1e25..6fed738a9467 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -131,35 +131,43 @@ struct msm_dp_config {
> >       size_t num_descs;
> >   };
> >
> > +static const struct msm_dp_desc sc7180_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +};
> > +
> >   static const struct msm_dp_config sc7180_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -     },
> > -     .num_descs = 1,
> > +     .descs = sc7180_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc7180_dp_descs),
> > +};
> > +
>
> why you want to do that?
>
> It is very clear only one entry, why you want to make it 2 entry here?
>
> can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?

Because we had enough stories of using a manually set 'number of
something' field. So I'd prefer to have it done automatically.
Also using the indexed array spares us from 'look for the DP
controller number N' functions. You can just get it.

>
> > +static const struct msm_dp_desc sc7280_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> >   };
> >
> >   static const struct msm_dp_config sc7280_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > -     },
> > -     .num_descs = 2,
> > +     .descs = sc7280_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc7280_dp_descs),
> > +};
> > +
> > +static const struct msm_dp_desc sc8180x_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +     [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> >   };
> >
> >   static const struct msm_dp_config sc8180x_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -             [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> > -     },
> > -     .num_descs = 3,
> > +     .descs = sc8180x_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc8180x_dp_descs),
> > +};
> > +
> > +static const struct msm_dp_desc sm8350_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> >   };
> >
> >   static const struct msm_dp_config sm8350_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -     },
> > -     .num_descs = 1,
> > +     .descs = sm8350_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sm8350_dp_descs),
> >   };
> >
> >   static const struct of_device_id dp_dt_match[] = {



-- 
With best wishes
Dmitry
