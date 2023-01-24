Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D571679F1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 17:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbjAXQp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 11:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234642AbjAXQpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 11:45:22 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDF14C0F2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 08:45:15 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id b1so14329823ybn.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqylS5Lo3YH2jz2661PX4pOVQQ/ziJPTaE7wN+OoHEs=;
        b=OpIDwdu/r4cU3OtbGrTpTUn1uaGaVsKSXep/L98p5R65QQm1cokpwVtTor3unuqYty
         Hurk2yVfcMTTBcT2zcEyrMiXheKNkOtYFRwf1NBoCpdaKZE9b2nW7SbiOl1/pw+ORK60
         OZCWIB5l7bShpG0e8HkeNDKzzM4aeKQPLPaqXQdV2ckfyDC4mBm3cWdJsUU5jr6kOVtJ
         84qrTJMR8Cey96o9a0TAEHmKW9l/Id+mOvXPzCFaW4QU+4ggQK5ELW3i2rjuaiCK7VST
         wLuCcF3sjKgM+C8Zfyu1vpQ0X/SeXHKucd5PsGaE1DB0byyPkICaol7swVq9Vwpij8GA
         SAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqylS5Lo3YH2jz2661PX4pOVQQ/ziJPTaE7wN+OoHEs=;
        b=4UVwfhGsMoYJbdYsLjuoBP6bFY8f/Vxsspbt6ni+OJzWR/ty1NS6veJ/ZTKgYSYfoY
         2MCbm8iJJQXX7rUS4P81RH8Dz6F15f1mVWc5Ta2Ig8SxEAEm30uIkNCSHe1qSeGed2KS
         DV5g11310edRa3MIVTrj0kpbYfeZeLIwhWtasLLmFuyBRdLXXeGBATbwp8LjIwh9DtUE
         QKKr9OAxxat6f4vLR2gNb+hPj30nrPOpJR/xPT3p6ig1YWmCkoux51rHvnlGvOX48g1w
         G4kLmirDQHD2DA8KmzRSxkH558qCqNci5wjcmsY0ebrcroauC8XpL2zlsSQW/KwRY3Pt
         t9Mw==
X-Gm-Message-State: AFqh2koQPz1+3OcEacxwwCtr5sI1kjvRdNkjk3XJ2NJl/c/ZExISWMxL
        dsvG9c12KHZz2GZC8mY5wdG1FAlo9lQAALs9w8hufw==
X-Google-Smtp-Source: AMrXdXtZPEVLbt4E2y7ClbN4olSQU0OIa8qgWqubL2tDIH+VU4Fh/bQQNeOcjXxjCOKFPpXRS+UVtpEo3UMHpXeoYjs=
X-Received: by 2002:a25:99c7:0:b0:6e0:c7d3:f026 with SMTP id
 q7-20020a2599c7000000b006e0c7d3f026mr3293665ybo.275.1674578714375; Tue, 24
 Jan 2023 08:45:14 -0800 (PST)
MIME-Version: 1.0
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-6-git-send-email-quic_vpolimer@quicinc.com>
 <4a359748-e53c-a178-de09-2c999eb69013@linaro.org> <BN0PR02MB8173B73AC4E3DB9A7D0509DCE4C99@BN0PR02MB8173.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8173B73AC4E3DB9A7D0509DCE4C99@BN0PR02MB8173.namprd02.prod.outlook.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Jan 2023 18:45:03 +0200
Message-ID: <CAA8EJpr_YAD185VKtLD2TDmbYPpe7S4KPkoP-8N95nwKRt9Y=g@mail.gmail.com>
Subject: Re: [PATCH Resend v11 05/15] drm/msm/dp: disable self_refresh_aware
 after entering psr
To:     Vinod Polimera <vpolimer@qti.qualcomm.com>
Cc:     "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Jan 2023 at 17:10, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Tuesday, January 24, 2023 5:52 AM
> > To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
> > devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> > freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
> > Cc: Sankeerth Billakanti (QUIC) <quic_sbillaka@quicinc.com>; linux-
> > kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
> > swboyd@chromium.org; Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>;
> > Kuogee Hsieh (QUIC) <quic_khsieh@quicinc.com>; Vishnuvardhan
> > Prodduturi (QUIC) <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
> > <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
> > <quic_abhinavk@quicinc.com>
> > Subject: Re: [PATCH Resend v11 05/15] drm/msm/dp: disable
> > self_refresh_aware after entering psr
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary
> > of any links or attachments, and do not enable macros.

I hope such headers can be fixed on your side rather than being sent to the ML.

> >
> > On 19/01/2023 16:26, Vinod Polimera wrote:
> > > From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > >
> > > Updated frames get queued if self_refresh_aware is set when the
> > > sink is in psr. To support bridge enable and avoid queuing of update
> > > frames, reset the self_refresh_aware state after entering psr.
> >
> > I'm not convinced by this change. E.g. analogix code doesn't do this.
> > Could you please clarify, why do you need to toggle the
> > self_refresh_aware flag?
> >
> This was done to fix a bug reported by google. The use case is as follows:
>         CPU was running in a low frequency with debug build.
>         When self refresh was triggered by the library, due to system latency, the queued work was not scheduled.
>         There in another commit came and reinitialized the timer for the next PSR trigger.
>         This sequence happened multiple times  and we found there were multiple works which are stuck and yet to be run.

Where were workers stuck? Was it a busy loop around -EDEADLK /
drm_modeset_backoff()? Also, what were ther ewma times for entry/exit
avg times?

I'm asking because the issue that you are describing sounds like a
generic one, not the driver-specific issue. And being generic it
should be handled in a generic fascion, in drm_self_refresh_helper.c.

For example, I can imagine adding a variable to sr_data telling that
the driver is in the process of transitioning to SR. Note: I did not
perform a full research if it is a working solution or not. But from
your description the driver really has to bail out early from
drm_self_refresh_helper_entry_work().

>         As PSR trigger is guarded by self_refresh_aware, we initialized the variable such that, if we are in PSR then until PSR exit, there cannot be any further PSR entry again.
>                 https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/tags/v5.15.90/drivers/gpu/drm/drm_self_refresh_helper.c#105

Yes, and that's what triggered my attention. We are using a set of
helpers, that depend on the self_refresh_aware being true. And
suddenly under the hood we disable this flag. I'd say that I can not
predict the effect this will have on the helpers library behaviour.

>         This has solved few flicker issues during the stress testing.
> > >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_drm.c | 27
> > ++++++++++++++++++++++++++-
> > >   1 file changed, 26 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
> > b/drivers/gpu/drm/msm/dp/dp_drm.c
> > > index 029e08c..92d1a1b 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > > @@ -134,6 +134,8 @@ static void edp_bridge_atomic_enable(struct
> > drm_bridge *drm_bridge,
> > >       struct drm_crtc_state *old_crtc_state;
> > >       struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
> > >       struct msm_dp *dp = dp_bridge->dp_display;
> > > +     struct drm_connector *connector;
> > > +     struct drm_connector_state *conn_state = NULL;
> > >
> > >       /*
> > >        * Check the old state of the crtc to determine if the panel
> > > @@ -150,10 +152,22 @@ static void edp_bridge_atomic_enable(struct
> > drm_bridge *drm_bridge,
> > >
> > >       if (old_crtc_state && old_crtc_state->self_refresh_active) {
> > >               dp_display_set_psr(dp, false);
> > > -             return;
> > > +             goto psr_aware;
> > >       }
> > >
> > >       dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
> > > +
> > > +psr_aware:
> > > +     connector =
> > drm_atomic_get_new_connector_for_encoder(atomic_state,
> > > +                                                     drm_bridge->encoder);
> > > +     if (connector)
> > > +             conn_state =
> > drm_atomic_get_new_connector_state(atomic_state,
> > > +                                                             connector);
> > > +
> > > +     if (conn_state) {
> > > +             conn_state->self_refresh_aware = dp->psr_supported;
> > > +     }
> >
> > No need to wrap a single line statement in brackets.
> >
> > > +
> > >   }
> > >
> > >   static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> > > @@ -164,6 +178,14 @@ static void edp_bridge_atomic_disable(struct
> > drm_bridge *drm_bridge,
> > >       struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
> > >       struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
> > >       struct msm_dp *dp = dp_bridge->dp_display;
> > > +     struct drm_connector *connector;
> > > +     struct drm_connector_state *conn_state = NULL;
> > > +
> > > +     connector =
> > drm_atomic_get_old_connector_for_encoder(atomic_state,
> > > +                                                     drm_bridge->encoder);
> > > +     if (connector)
> > > +             conn_state =
> > drm_atomic_get_new_connector_state(atomic_state,
> > > +                                                             connector);
> > >
> > >       crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state,
> > >                                                  drm_bridge->encoder);
> > > @@ -190,6 +212,9 @@ static void edp_bridge_atomic_disable(struct
> > drm_bridge *drm_bridge,
> > >        * when display disable occurs while the sink is in psr state.
> > >        */
> > >       if (new_crtc_state->self_refresh_active) {
> > > +             if (conn_state)
> > > +                     conn_state->self_refresh_aware = false;
> > > +
> > >               dp_display_set_psr(dp, true);
> > >               return;
> > >       } else if (old_crtc_state->self_refresh_active) {
> >
> > --
> > With best wishes
> > Dmitry
>
> Thanks,
> Vinod P.
>


-- 
With best wishes
Dmitry
