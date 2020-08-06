Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA58923DC0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 18:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgHFQow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 12:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgHFQoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 12:44:46 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDA5C0A8921;
        Thu,  6 Aug 2020 09:44:46 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c10so5921598edk.6;
        Thu, 06 Aug 2020 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7j5tR0m8H3OjMJuPim98FwiN1aMkbIjxdxVhuyjo0Ew=;
        b=eoPd66cTTjH9l86GoO63fQ8X+ctw+Tj6hSPmE5nYp/Vdw7ql/bdp4r9RzKYlJMfuc6
         Uv8D1gdE4B+TP1mfI9optHvVmRoSLmApmaSXNVcECB65pZ8tz+2AyjO9ruPRFC25iy7P
         GUKejLwQ/2ZaTbOxLdkbRqTHAS7Pf8nC9vskid09nzG5twd6YAD24ztc9/h6xh5r/wS8
         IxPxwM73RIb7oiyYJwFcLdvxiVLKrNZLEgBmui6leAyfg2ByBszOKKDeCehFyiG9JPsm
         K4eQ1HVC6piC9IOLSV2KMGGIbEXbSenlSoNegi0W7skQxYA720JZqAWd99NG0vJG3oe2
         rXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7j5tR0m8H3OjMJuPim98FwiN1aMkbIjxdxVhuyjo0Ew=;
        b=hAkF1lbYeNCZFijXsiDk3SbtrBrVXg8sZ86tD+Aayf8RUylTCerVFt6frl2MMMwqfQ
         k755u8odwthqIgOnX++qrN1IIIHTZXnbVQj9xENANWVgBYypEbrJTkj+ayywWzrcNmw/
         uLTiUpME1QgJvW9mQTdwnlPv9qSSGDY8L98N+25zB5SG35SDzjsCgw5cCLXSaoHXgQHo
         LStdYKt7a07CKKjSyBUVZhBcwd2OhxgImD8eZBk5MPIKBVJzhwTbGA+LLA+IBMrut2GS
         cpx9bYo7qAu3yZbP+8aoHq5rSHjapwKZUJygOhQZTLgNoaR/B5yBSfAXk0bxyfJG1BNB
         uBbw==
X-Gm-Message-State: AOAM533TpVzbHddcFJSZv+bontlBIJ8h3uqTg6J/0RtZa9TSXM173UQk
        IB7TM1bD6u5QlGD2i5QfsC2Ir43VmVb85rqUR/s=
X-Google-Smtp-Source: ABdhPJwR1WrcmmYyv3xVh2Lg73XDm1Qy31RKbQCdDoen+3KsX/nStphPf+QMMn9o4Ud82k5K1qcstkFDVwFQJCjr5Ao=
X-Received: by 2002:a05:6402:a5b:: with SMTP id bt27mr5003305edb.120.1596732284503;
 Thu, 06 Aug 2020 09:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com> <1101abba0c8082da196f36636ef07a84@codeaurora.org>
In-Reply-To: <1101abba0c8082da196f36636ef07a84@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 6 Aug 2020 09:45:28 -0700
Message-ID: <CAF6AEGu2Lfb94kjnd7+GU_c93z0Zw2SgQ==UcrjPg3Wah=24ng@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: Fix reservation failures in modeset
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 6, 2020 at 7:46 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2020-08-05 21:18, Rob Clark wrote:
> > On Wed, Aug 5, 2020 at 6:34 AM Kalyan Thota <kalyan_t@codeaurora.org>
> > wrote:
> >>
> >> In TEST_ONLY commit, rm global_state will duplicate the
> >> object and request for new reservations, once they pass
> >> then the new state will be swapped with the old and will
> >> be available for the Atomic Commit.
> >>
> >> This patch fixes some of missing links in the resource
> >> reservation sequence mentioned above.
> >>
> >> 1) Creation of a duplicate state in test_only commit (Rob)
> >> 2) Allow resource release only during crtc_active false.
> >>
> >> For #2
> >> In a modeset operation, swap state happens well before disable.
> >> Hence clearing reservations in disable will cause failures
> >> in modeset enable.
> >>
> >> Sequence:
> >>     Swap state --> old, new
> >>     modeset disables --> virt disable
> >>     modeset enable --> virt modeset
> >>
> >> Allow reservations to be cleared only when crtc active is false
> >> as in that case there wont be any modeset enable after disable.
> >>
> >> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 63976dc..b85a576 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
> >>         dpu_kms = to_dpu_kms(priv->kms);
> >>         mode = &crtc_state->mode;
> >>         adj_mode = &crtc_state->adjusted_mode;
> >> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >> +       global_state = dpu_kms_get_global_state(crtc_state->state);
> >>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
> >>
> >>         /*
> >> @@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct
> >> drm_encoder *drm_enc)
> >>         struct msm_drm_private *priv;
> >>         struct dpu_kms *dpu_kms;
> >>         struct dpu_global_state *global_state;
> >> +       struct drm_crtc_state *crtc_state;
> >>         int i = 0;
> >>
> >>         if (!drm_enc) {
> >> @@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct
> >> drm_encoder *drm_enc)
> >>         priv = drm_enc->dev->dev_private;
> >>         dpu_kms = to_dpu_kms(priv->kms);
> >>         global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >> +       crtc_state = drm_enc->crtc->state;
> >>
> >>         trace_dpu_enc_disable(DRMID(drm_enc));
> >>
> >> @@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct
> >> drm_encoder *drm_enc)
> >>
> >>         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
> >>
> >> -       dpu_rm_release(global_state, drm_enc);
> >> +       if (crtc_state->active_changed && !crtc_state->active)
> >> +               dpu_rm_release(global_state, drm_enc);
> >
> > I still think releasing the state in the atomic_commit() path is the
> > wrong thing to do.  In the commit path, the various state objects
> > should be immutable.. ie. in the atomic_test() path you derive the new
> > hw state (including assignment/release of resources), and
> > atomic_commit() is simply pushing the state down to the hw.
> >
> > Otherwise, this looks better than v1.
> >
> > BR,
> > -R
> >
> okay. Should we avoid reservation all together if active=0 on that crtc
> and trigger rm_release on the enc during atomic_check ?
> how do you see the approach ?

Yeah, I suppose something like:

   if (drm_atomic_crtc_needs_modeset()) {
      reserve()
   } else if (active_changed && !active) {
      release()
   }

I think it could happen (at least with atomic api) that you get a
modeset without active_changed, so we might need to release() and then
reserve() in that case?  (This is probably where starting to run more
IGT tests would be useful)

BR,
-R

> -Kalyan
> >>
> >>         mutex_unlock(&dpu_enc->enc_lock);
> >>  }
> >> --
> >> 1.9.1
> >>
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
