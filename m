Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7F623E99E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 10:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgHGI5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 04:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgHGI5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 04:57:45 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7FCC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2020 01:57:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k8so1113719wma.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=H73Msn3ig8oo+rXLBRFR40qhkjSySvB7pfbrGJDIkto=;
        b=P5BLbM7NaQMP5e2hJpp/jGb9n9cEXDqguDO01xB7EI9UcQR7OyzK98j0PVhTipFk+W
         TQ70UzqxnBDEJangW88G9Dq+lqyXD9Rf/jm+IVd7toPT5l6IrZDIoKO127KmFgkwabTs
         W14uS0QIQXZq8BKcRvIVDm4eJj+ZOC+728qNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=H73Msn3ig8oo+rXLBRFR40qhkjSySvB7pfbrGJDIkto=;
        b=kJU31aW9U9S/6G2RhVY+GbSpHj08BCjzW+fO1L1AwMZQ84arpx2JIHu5cTXPr3KBt3
         uhYHUF1SsT2MwNn1MHbyQnDQsQG4CzBQmPif5G3Cl3GHWiizIY80fffBtudkMwcmj/Cp
         Wb6AhkbbI4OTMqsbx57X22QlRm9FxNyZS7Efpd8zpCBUcrN2Su8x9BVzNBxGZ7F8ab2i
         jc2UvJ/yYXUFB47QALHJVvcBl9GH0Qf6fFX/0u5zu2jQWVgGLOOsd5HYgZ/EfGoS96Xg
         gNKqmVuNg1Y676RPEBbmVup8MEMoFpA7XWKE0BtvdnPsqmsZzKdhtOQ4f1e8pkoNzUSC
         4i1Q==
X-Gm-Message-State: AOAM533+D27HdjOByEMUqW8g0AmYZIb3iU8OBoO+vC1Xm/E0ncKYvd1q
        wVY0b0n790VzAuM9Iy2ZZTryRw==
X-Google-Smtp-Source: ABdhPJynkqQfgSYGXyIhXXRsLuU2JaYCqT62Ezi3rAu3TCxoggostYXPfA0lWy6VQU0lDkGUgE8khA==
X-Received: by 2002:a1c:df02:: with SMTP id w2mr12869666wmg.137.1596790663593;
        Fri, 07 Aug 2020 01:57:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o30sm9643520wra.67.2020.08.07.01.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:57:42 -0700 (PDT)
Date:   Fri, 7 Aug 2020 10:57:40 +0200
From:   daniel@ffwll.ch
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [v1] drm/msm/dpu: Fix reservation failures in modeset
Message-ID: <20200807085740.GR6419@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 05, 2020 at 08:48:34AM -0700, Rob Clark wrote:
> On Wed, Aug 5, 2020 at 6:34 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > In TEST_ONLY commit, rm global_state will duplicate the
> > object and request for new reservations, once they pass
> > then the new state will be swapped with the old and will
> > be available for the Atomic Commit.
> >
> > This patch fixes some of missing links in the resource
> > reservation sequence mentioned above.
> >
> > 1) Creation of a duplicate state in test_only commit (Rob)
> > 2) Allow resource release only during crtc_active false.
> >
> > For #2
> > In a modeset operation, swap state happens well before disable.
> > Hence clearing reservations in disable will cause failures
> > in modeset enable.
> >
> > Sequence:
> >     Swap state --> old, new
> >     modeset disables --> virt disable
> >     modeset enable --> virt modeset
> >
> > Allow reservations to be cleared only when crtc active is false
> > as in that case there wont be any modeset enable after disable.
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 63976dc..b85a576 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
> >         dpu_kms = to_dpu_kms(priv->kms);
> >         mode = &crtc_state->mode;
> >         adj_mode = &crtc_state->adjusted_mode;
> > -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > +       global_state = dpu_kms_get_global_state(crtc_state->state);
> >         trace_dpu_enc_atomic_check(DRMID(drm_enc));
> >
> >         /*
> > @@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> >         struct msm_drm_private *priv;
> >         struct dpu_kms *dpu_kms;
> >         struct dpu_global_state *global_state;
> > +       struct drm_crtc_state *crtc_state;
> >         int i = 0;
> >
> >         if (!drm_enc) {
> > @@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> >         priv = drm_enc->dev->dev_private;
> >         dpu_kms = to_dpu_kms(priv->kms);
> >         global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > +       crtc_state = drm_enc->crtc->state;
> >
> >         trace_dpu_enc_disable(DRMID(drm_enc));
> >
> > @@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> >
> >         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
> >
> > -       dpu_rm_release(global_state, drm_enc);
> > +       if (crtc_state->active_changed && !crtc_state->active)
> > +               dpu_rm_release(global_state, drm_enc);
> 
> I still think releasing the state in the atomic_commit() path is the
> wrong thing to do.  In the commit path, the various state objects
> should be immutable.. ie. in the atomic_test() path you derive the new
> hw state (including assignment/release of resources), and
> atomic_commit() is simply pushing the state down to the hw.
> 
> Otherwise, this looks better than v1.

Yeah this races and is total no-go. If you touch your state in commit
(except some very specific exceptions), then a next TEST_ONLY atomic_check
might duplicate the atomic state object in an incosistent state, and fail.

Worse, this looks like if you race like that then you might duplicate an
object with old reservations still in place, and then we've essentially
leaked those resources and need to reboot. Yes most compositors use
blocking modesets, but some actually do full nonblocking modesets.

This stuff needs to be moved into the atomic_check code, and your commit
code needs to be careful to use the right state (old or new) when pushing
it into hw.

Cheers, Daniel

> 
> BR,
> -R
> 
> >
> >         mutex_unlock(&dpu_enc->enc_lock);
> >  }
> > --
> > 1.9.1
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
