Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC1F510946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 21:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239033AbiDZTtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 15:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiDZTtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 15:49:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E312610A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 12:46:06 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r13so38195628ejd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WshltLX0dXHz63rqVl8lSMP+GZQ87XkFUm2jOhui7ss=;
        b=cUrxEaPc0G9XHwXYx21V56yEtHHlbZhQBGAPxA/pY/aydypp3xwMM1xidQb139luUt
         0sUuiCtTvw/Jie0PBIecKbp4NayTszqz7V8SdNR2ufKyQ1S3wejJRJxHxgpu1GcYchhY
         TOXAU7r1pBrIgVrGWz0+/8TWLV0l3kdzkzZ6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WshltLX0dXHz63rqVl8lSMP+GZQ87XkFUm2jOhui7ss=;
        b=fu5jK2lh5/zF0qFkIhpy8s6nFhCx/aruG3jwsP2IBpLue1TVkLgPSB2LY5cE6JQvSy
         com9C0tWadZf2KBgfCyknbIsfncFjQhb9cyWv5We6j2lcn2NQDGOlwaMEjS0OUBtkBFH
         iCLULtjG1rrPFKoTOFUHIkVgGmqwB3X8b54ztZubcy/C4eBu4heC8ioCWUBf54IhG3+R
         XleSvQwjPsm3jWDvm/dpVZq+enFU2fprcO5Exv/d70nc+vbcI81sKgMZxcm4sJHxzJhc
         VT65NIBMCcfVuR4DyEvihBWboGqDGik6yyNRD8ug9ql/T3X5LAYqnQzCsOGrGF4PT0eE
         Vf8g==
X-Gm-Message-State: AOAM533o8LlsY8dl7ghyLu2DoOy5g5RNRWVXh1wlRF+OhvwuX2yyaOq0
        9xP7DpmEvN/s6/gMjhJNu4thL+qDPwNbeXLy4v4=
X-Google-Smtp-Source: ABdhPJw0Knx3jE+nrvI/7Y9cIGNlQQDp+1LDswmDxjyZASbtSBKKoRJkU79WZEG27RJCYGsUr3LkEw==
X-Received: by 2002:a17:906:a089:b0:6ef:e9e6:1368 with SMTP id q9-20020a170906a08900b006efe9e61368mr23169344ejy.626.1651002364356;
        Tue, 26 Apr 2022 12:46:04 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b006f022c00fa6sm5268875ejd.165.2022.04.26.12.46.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 12:46:03 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso1222888wmh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 12:46:02 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr31342901wmb.29.1651002362259; Tue, 26
 Apr 2022 12:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid> <fa49384c-76a5-6686-7d4d-cf11f3e98c75@quicinc.com>
In-Reply-To: <fa49384c-76a5-6686-7d4d-cf11f3e98c75@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 Apr 2022 12:45:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViLSVpTso9PWyBO5fKPCNQoCCfzNwFePekv_mXJZWeiw@mail.gmail.com>
Message-ID: <CAD=FV=ViLSVpTso9PWyBO5fKPCNQoCCfzNwFePekv_mXJZWeiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 26, 2022 at 12:16 PM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> One minor comment below.
>
> But otherwise, looking at this change this should work for us acc to me.
>
> We will test this out with our equipment and then provide R-b.
>
> Thanks
>
> Abhinav
> On 4/26/2022 11:46 AM, Douglas Anderson wrote:
> > As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> > that all detachable sinks shall support 640x480 @60Hz as a fail safe
> > mode.
> >
> > A DP compliance test expected us to utilize the above fact when all
> > modes it presented to the DP source were not achievable. It presented
> > only modes that would be achievable with more lanes and/or higher
> > speeds than we had available and expected that when we couldn't do
> > that then we'd fall back to 640x480 even though it didn't advertise
> > this size.
> >
> > In order to pass the compliance test (and also support any users who
> > might fall into a similar situation with their display), we need to
> > add 640x480 into the list of modes. However, we don't want to add
> > 640x480 all the time. Despite the fact that the DP spec says all sinks
> > _shall support_ 640x480, they're not guaranteed to support it
> > _well_. Continuing to read the spec you can see that the display is
> > not required to really treat 640x480 equal to all the other modes. It
> > doesn't need to scale or anything--just display the pixels somehow for
> > failsafe purposes. It should also be noted that it's not hard to find
> > a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> > all. The HP ZR30w screen I'm sitting in front of has a native DP port
> > and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> > display via a DP to HDMI adapter and that screen definitely doesn't
> > support 640x480.
> >
> > As a compromise solution, let's only add the 640x480 mode if:
> > * We're on DP.
> > * All other modes have been pruned.
> >
> > This acknowledges that 640x480 might not be the best mode to use but,
> > since sinks are _supposed_ to support it, we will at least fall back
> > to it if there's nothing else.
> >
> > Note that we _don't_ add higher resolution modes like 1024x768 in this
> > case. We only add those modes for a failed EDID read where we have no
> > idea what's going on. In the case where we've pruned all modes then
> > instead we only want 640x480 which is the only defined "Fail Safe"
> > resolution.
> >
> > This patch originated in response to Kuogee Hsieh's patch [1].
> >
> > [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
> >   1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index 819225629010..90cd46cbfec1 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -476,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >       const struct drm_connector_helper_funcs *connector_funcs =
> >               connector->helper_private;
> >       int count = 0, ret;
> > -     bool verbose_prune = true;
> >       enum drm_connector_status old_status;
> >       struct drm_modeset_acquire_ctx ctx;
> >
> > @@ -556,8 +555,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >               DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> >                       connector->base.id, connector->name);
> >               drm_connector_update_edid_property(connector, NULL);
> > -             verbose_prune = false;
> > -             goto prune;
> > +             drm_mode_prune_invalid(dev, &connector->modes, false);
> > +             goto exit;
> >       }
> >
> >       count = (*connector_funcs->get_modes)(connector);
> > @@ -580,9 +579,26 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >               }
> >       }
> >
> > -prune:
> > -     drm_mode_prune_invalid(dev, &connector->modes, verbose_prune);
> > +     drm_mode_prune_invalid(dev, &connector->modes, true);
> >
> > +     /*
> > +      * Displayport spec section 5.2.1.2 ("Video Timing Format") says that
> > +      * all detachable sinks shall support 640x480 @60Hz as a fail safe
> > +      * mode. If all modes were pruned, perhaps because they need more
> > +      * lanes or a higher pixel clock than available, at least try to add
> > +      * in 640x480.
> > +      */
> > +     if (list_empty(&connector->modes) &&
> > +         connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> > +             count = drm_add_modes_noedid(connector, 640, 480);
> > +             if (_drm_helper_update_and_validate(connector, maxX, maxY, &ctx)) {
> > +                     drm_modeset_backoff(&ctx);
> > +                     goto retry;
>
> Do we need another retry here? This will again repeat everything from
> get_modes().
> The fact that we are hitting this code is because we have already tried
> that and this is already a second-pass. So I think another retry isnt
> needed?

The retry is still needed. This gets into the whole wait-wound mutexes
that DRM uses, right? Any time we detect deadlock we release all of
our locks and start from scratch. That's still possible here.

-Doug
