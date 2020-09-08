Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF19F26203E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbgIHULE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730225AbgIHULD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 16:11:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0FDC061573;
        Tue,  8 Sep 2020 13:11:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e11so354047wme.0;
        Tue, 08 Sep 2020 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yzHMC2S9hw3LivUK+L9xHHI0BFCPx/rS6YcunGqWP+Q=;
        b=AsuLnoHid63keqb3a3aAiVm40YhHvd24VUZswDdiiAfMYTidoHne/V2fdoapvvIgtt
         zPREkN98Jc4XFhA9nvH3Wffp1ZhAySVVBUskS8NPIHh+qKpPPL1KuOhuJ6Y1qh2t6S87
         g+S/rFxDzTlE/ZLz5SZ5Swzj+5EivrHWE191c39OE1DWN739YU7XduuwyHRVuPS9iyak
         QErFakO41kP+GsHOy5R8XCGx6Y7x3HHptma0RqeAo9Avgl7sH6sUWLWMkAa2hIzGUT2z
         zV1f2jsoKmb4vTBiNlTQtdIO1lwY4WMk9PaWC3nbm/HXCQftiwMh4bMoiLDU1d/iEv4Q
         Lalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yzHMC2S9hw3LivUK+L9xHHI0BFCPx/rS6YcunGqWP+Q=;
        b=SKukoDG12rF0LclSrbp6iIAllJCxyx0Fl3l1I6WNXbfJHRFLFJqYWGlt7OJd7Zt6J6
         NELVcdyI1X1dWxh2h5EbkMX9PEiie0M3X44BXmtX/+NZLoBIn68amxosjhiM70mlZHjp
         TDCKhEil9Odls0YJJTDpsSFApnJWH+FlKb88zPT3WF36v7e6wKgGWYr+tXvHbpkyn359
         EVvNUZIeHuU6FePGeSBtJw5o3iIGLHdPwlOGhQ57l9ym817w9dU4LbOJCKDasbLmmZRW
         4ETHiHBK8MZWhJlLe6RNoJKyp0wd8pMNpilGGiXcz4z2sP9gMdoQBYgSgYaDOdnSSG+S
         Kz2w==
X-Gm-Message-State: AOAM530NPjQxNMxM1NpIBvNiNH1+CyvQyYfabymZCPUgVZryMaNxhs3F
        VKBB37wMKmWX7aG2LY3DtxDYyOsle2fC27Wf808=
X-Google-Smtp-Source: ABdhPJyS31lmD0DlhCHYxY2dbCD2oBLGMebc9qboBKCALDZlzN9qcXDpegy/Dq/ciwr/yp7T7nYsBF6XxhchLVOVS7Q=
X-Received: by 2002:a1c:105:: with SMTP id 5mr87698wmb.175.1599595860788; Tue,
 08 Sep 2020 13:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200907170450.370122-1-robdclark@gmail.com> <20200907170450.370122-2-robdclark@gmail.com>
 <010101746f3f7667-5ee2e9e4-9b10-41e0-8bbc-65219583cb86-000000@us-west-2.amazonses.com>
In-Reply-To: <010101746f3f7667-5ee2e9e4-9b10-41e0-8bbc-65219583cb86-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Sep 2020 13:11:56 -0700
Message-ID: <CAF6AEGsETZxbPEneBycbNBjGD7_OU7V=T8J0TByC_ZTv40q-Og@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: clean up some impossibilities
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 8, 2020 at 12:44 PM <abhinavk@codeaurora.org> wrote:
>
> On 2020-09-07 10:04, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 81 ++++--------------------
> >  1 file changed, 12 insertions(+), 69 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 89c0245b5de5..ad49b0e17fcb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -265,11 +265,6 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct
> > drm_crtc *crtc)
> >  {
> >       struct drm_encoder *encoder;
> >
> > -     if (!crtc) {
> > -             DPU_ERROR("invalid crtc\n");
> > -             return INTF_MODE_NONE;
> > -     }
> > -
> >       /*
> >        * TODO: This function is called from dpu debugfs and as part of
> > atomic
> >        * check. When called from debugfs, the crtc->mutex must be held to
> > @@ -500,12 +495,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc
> > *crtc,
> >       struct dpu_crtc_state *cstate;
> >       struct drm_encoder *encoder;
> >       struct drm_device *dev;
> > -     unsigned long flags;
> > -
> > -     if (!crtc) {
> > -             DPU_ERROR("invalid crtc\n");
> > -             return;
> > -     }
> >
> >       if (!crtc->state->enable) {
> >               DPU_DEBUG("crtc%d -> enable %d, skip atomic_begin\n",
> > @@ -521,15 +510,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc
> > *crtc,
> >
> >       _dpu_crtc_setup_lm_bounds(crtc, crtc->state);
> >
> > -     if (dpu_crtc->event) {
> > -             WARN_ON(dpu_crtc->event);
> > -     } else {
> > -             spin_lock_irqsave(&dev->event_lock, flags);
> > -             dpu_crtc->event = crtc->state->event;
> > -             crtc->state->event = NULL;
> > -             spin_unlock_irqrestore(&dev->event_lock, flags);
> > -     }
> > -
> >       /* encoder will trigger pending mask now */
> >       drm_for_each_encoder_mask(encoder, crtc->dev,
> > crtc->state->encoder_mask)
> >               dpu_encoder_trigger_kickoff_pending(encoder);
> > @@ -583,14 +563,11 @@ static void dpu_crtc_atomic_flush(struct drm_crtc
> > *crtc,
> >               return;
> >       }
> >
> > -     if (dpu_crtc->event) {
> > -             DPU_DEBUG("already received dpu_crtc->event\n");
> > -     } else {
> > -             spin_lock_irqsave(&dev->event_lock, flags);
> > -             dpu_crtc->event = crtc->state->event;
> > -             crtc->state->event = NULL;
> > -             spin_unlock_irqrestore(&dev->event_lock, flags);
> > -     }
> > +     WARN_ON(dpu_crtc->event);
> before the patch "move vblank events to complete_commit()", the dpu_crtc
> events
> were consumed in the _dpu_crtc_complete_flip(). So there was a chance
> that if the vblank event
> did not come in time before the next commit, dpu_crtc->event will not be
> consumed.
>
> But after the patch, _dpu_crtc_complete_flip() is being signaled in
> dpu_crtc_complete_commit()
> which will always happen, so is there any case where we will hit this
> warning at all or will this
> catch some other condition?

The core drm-atomic bits will reject an incoming atomic update if the
previous one has not completed, so other than a coding bug, this
WARN_ON() should not be hit..  it's only purpose is to make it very
obvious if someone breaks something :-)

BR,
-R

>
> > +     spin_lock_irqsave(&dev->event_lock, flags);
> > +     dpu_crtc->event = crtc->state->event;
> > +     crtc->state->event = NULL;
> > +     spin_unlock_irqrestore(&dev->event_lock, flags);
> >
> >       /*
> >        * If no mixers has been allocated in dpu_crtc_atomic_check(),
> > @@ -635,14 +612,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc
> > *crtc,
> >  static void dpu_crtc_destroy_state(struct drm_crtc *crtc,
> >               struct drm_crtc_state *state)
> >  {
> > -     struct dpu_crtc_state *cstate;
> > -
> > -     if (!crtc || !state) {
> > -             DPU_ERROR("invalid argument(s)\n");
> > -             return;
> > -     }
> > -
> > -     cstate = to_dpu_crtc_state(state);
> > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> >
> >       DPU_DEBUG("crtc%d\n", crtc->base.id);
> >
> > @@ -731,14 +701,8 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
> >   */
> >  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc
> > *crtc)
> >  {
> > -     struct dpu_crtc_state *cstate, *old_cstate;
> > -
> > -     if (!crtc || !crtc->state) {
> > -             DPU_ERROR("invalid argument(s)\n");
> > -             return NULL;
> > -     }
> > +     struct dpu_crtc_state *cstate, *old_cstate =
> > to_dpu_crtc_state(crtc->state);
> >
> > -     old_cstate = to_dpu_crtc_state(crtc->state);
> >       cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
> >       if (!cstate) {
> >               DPU_ERROR("failed to allocate state\n");
> > @@ -754,19 +718,12 @@ static struct drm_crtc_state
> > *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
> >  static void dpu_crtc_disable(struct drm_crtc *crtc,
> >                            struct drm_crtc_state *old_crtc_state)
> >  {
> > -     struct dpu_crtc *dpu_crtc;
> > -     struct dpu_crtc_state *cstate;
> > +     struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
> >       struct drm_encoder *encoder;
> >       unsigned long flags;
> >       bool release_bandwidth = false;
> >
> > -     if (!crtc || !crtc->state) {
> > -             DPU_ERROR("invalid crtc\n");
> > -             return;
> > -     }
> > -     dpu_crtc = to_dpu_crtc(crtc);
> > -     cstate = to_dpu_crtc_state(crtc->state);
> > -
> >       DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
> >
> >       /* Disable/save vblank irq handling */
> > @@ -825,19 +782,13 @@ static void dpu_crtc_disable(struct drm_crtc
> > *crtc,
> >  static void dpu_crtc_enable(struct drm_crtc *crtc,
> >               struct drm_crtc_state *old_crtc_state)
> >  {
> > -     struct dpu_crtc *dpu_crtc;
> > +     struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> >       struct drm_encoder *encoder;
> >       bool request_bandwidth = false;
> >
> > -     if (!crtc) {
> > -             DPU_ERROR("invalid crtc\n");
> > -             return;
> > -     }
> > -
> >       pm_runtime_get_sync(crtc->dev->dev);
> >
> >       DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
> > -     dpu_crtc = to_dpu_crtc(crtc);
> >
> >       drm_for_each_encoder_mask(encoder, crtc->dev,
> > crtc->state->encoder_mask) {
> >               /* in video mode, we hold an extra bandwidth reference
> > @@ -873,9 +824,9 @@ struct plane_state {
> >  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >               struct drm_crtc_state *state)
> >  {
> > -     struct dpu_crtc *dpu_crtc;
> > +     struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> >       struct plane_state *pstates;
> > -     struct dpu_crtc_state *cstate;
> >
> >       const struct drm_plane_state *pstate;
> >       struct drm_plane *plane;
> > @@ -889,16 +840,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc
> > *crtc,
> >       int left_zpos_cnt = 0, right_zpos_cnt = 0;
> >       struct drm_rect crtc_rect = { 0 };
> >
> > -     if (!crtc) {
> > -             DPU_ERROR("invalid crtc\n");
> > -             return -EINVAL;
> > -     }
> > -
> >       pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
> >
> > -     dpu_crtc = to_dpu_crtc(crtc);
> > -     cstate = to_dpu_crtc_state(state);
> > -
> >       if (!state->enable || !state->active) {
> >               DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
> >                               crtc->base.id, state->enable, state->active);
