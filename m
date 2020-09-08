Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2AD262174
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729692AbgIHUxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:53:00 -0400
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:48204
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730104AbgIHUw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 16:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599598378;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=8IKm0Isv5Oa5ar1k/NOTqlHxZ1ZhkdPDWFXYTLsl6GY=;
        b=Zw5XrRQ6v8hfnLag4esTVR1JTT8Ax8Pctb6S+zX3YA4CB9NpZGMdPW+AhsIzL+2S
        ztnhjUQeu+HmnnM1v7+Zjw7BzcfADeNxnDEdO2Ih5P1xQjhc2T3wZwzwiq07+Fy26Ep
        3tFEsxaIypk1oYM0cWtH+MZETbxQfFV+5/Xjspfk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599598378;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=8IKm0Isv5Oa5ar1k/NOTqlHxZ1ZhkdPDWFXYTLsl6GY=;
        b=heRgyMGUMKWRtyRopKqFkVxPmhTs+4iPJgwHHUHu3ruNCm1nQQO1ph0vL7EiZk9p
        mR29UkU6m4rOuzHwSrw6+mpcX/bBdTJ/NwmDrXq0Cd8j11/8lbzJg1aQZeOorn5p/aq
        cnlHWQx21q7wZTPD3J7ti2zAY2T3VWqJftjsAeBs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 8 Sep 2020 20:52:58 +0000
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: clean up some impossibilities
In-Reply-To: <CAF6AEGsETZxbPEneBycbNBjGD7_OU7V=T8J0TByC_ZTv40q-Og@mail.gmail.com>
References: <20200907170450.370122-1-robdclark@gmail.com>
 <20200907170450.370122-2-robdclark@gmail.com>
 <010101746f3f7667-5ee2e9e4-9b10-41e0-8bbc-65219583cb86-000000@us-west-2.amazonses.com>
 <CAF6AEGsETZxbPEneBycbNBjGD7_OU7V=T8J0TByC_ZTv40q-Og@mail.gmail.com>
Message-ID: <010101746f7e3da4-f7a88051-69ce-4d97-8ad9-01417cc3d1d9-000000@us-west-2.amazonses.com>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.08-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-08 13:11, Rob Clark wrote:
> On Tue, Sep 8, 2020 at 12:44 PM <abhinavk@codeaurora.org> wrote:
>> 
>> On 2020-09-07 10:04, Rob Clark wrote:
>> > From: Rob Clark <robdclark@chromium.org>
>> >
>> > Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

>> > ---
>> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 81 ++++--------------------
>> >  1 file changed, 12 insertions(+), 69 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> > index 89c0245b5de5..ad49b0e17fcb 100644
>> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> > @@ -265,11 +265,6 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct
>> > drm_crtc *crtc)
>> >  {
>> >       struct drm_encoder *encoder;
>> >
>> > -     if (!crtc) {
>> > -             DPU_ERROR("invalid crtc\n");
>> > -             return INTF_MODE_NONE;
>> > -     }
>> > -
>> >       /*
>> >        * TODO: This function is called from dpu debugfs and as part of
>> > atomic
>> >        * check. When called from debugfs, the crtc->mutex must be held to
>> > @@ -500,12 +495,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc
>> > *crtc,
>> >       struct dpu_crtc_state *cstate;
>> >       struct drm_encoder *encoder;
>> >       struct drm_device *dev;
>> > -     unsigned long flags;
>> > -
>> > -     if (!crtc) {
>> > -             DPU_ERROR("invalid crtc\n");
>> > -             return;
>> > -     }
>> >
>> >       if (!crtc->state->enable) {
>> >               DPU_DEBUG("crtc%d -> enable %d, skip atomic_begin\n",
>> > @@ -521,15 +510,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc
>> > *crtc,
>> >
>> >       _dpu_crtc_setup_lm_bounds(crtc, crtc->state);
>> >
>> > -     if (dpu_crtc->event) {
>> > -             WARN_ON(dpu_crtc->event);
>> > -     } else {
>> > -             spin_lock_irqsave(&dev->event_lock, flags);
>> > -             dpu_crtc->event = crtc->state->event;
>> > -             crtc->state->event = NULL;
>> > -             spin_unlock_irqrestore(&dev->event_lock, flags);
>> > -     }
>> > -
>> >       /* encoder will trigger pending mask now */
>> >       drm_for_each_encoder_mask(encoder, crtc->dev,
>> > crtc->state->encoder_mask)
>> >               dpu_encoder_trigger_kickoff_pending(encoder);
>> > @@ -583,14 +563,11 @@ static void dpu_crtc_atomic_flush(struct drm_crtc
>> > *crtc,
>> >               return;
>> >       }
>> >
>> > -     if (dpu_crtc->event) {
>> > -             DPU_DEBUG("already received dpu_crtc->event\n");
>> > -     } else {
>> > -             spin_lock_irqsave(&dev->event_lock, flags);
>> > -             dpu_crtc->event = crtc->state->event;
>> > -             crtc->state->event = NULL;
>> > -             spin_unlock_irqrestore(&dev->event_lock, flags);
>> > -     }
>> > +     WARN_ON(dpu_crtc->event);
>> before the patch "move vblank events to complete_commit()", the 
>> dpu_crtc
>> events
>> were consumed in the _dpu_crtc_complete_flip(). So there was a chance
>> that if the vblank event
>> did not come in time before the next commit, dpu_crtc->event will not 
>> be
>> consumed.
>> 
>> But after the patch, _dpu_crtc_complete_flip() is being signaled in
>> dpu_crtc_complete_commit()
>> which will always happen, so is there any case where we will hit this
>> warning at all or will this
>> catch some other condition?
> 
> The core drm-atomic bits will reject an incoming atomic update if the
> previous one has not completed, so other than a coding bug, this
> WARN_ON() should not be hit..  it's only purpose is to make it very
> obvious if someone breaks something :-)
> 
> BR,
> -R
> 
>> 
>> > +     spin_lock_irqsave(&dev->event_lock, flags);
>> > +     dpu_crtc->event = crtc->state->event;
>> > +     crtc->state->event = NULL;
>> > +     spin_unlock_irqrestore(&dev->event_lock, flags);
>> >
>> >       /*
>> >        * If no mixers has been allocated in dpu_crtc_atomic_check(),
>> > @@ -635,14 +612,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc
>> > *crtc,
>> >  static void dpu_crtc_destroy_state(struct drm_crtc *crtc,
>> >               struct drm_crtc_state *state)
>> >  {
>> > -     struct dpu_crtc_state *cstate;
>> > -
>> > -     if (!crtc || !state) {
>> > -             DPU_ERROR("invalid argument(s)\n");
>> > -             return;
>> > -     }
>> > -
>> > -     cstate = to_dpu_crtc_state(state);
>> > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
>> >
>> >       DPU_DEBUG("crtc%d\n", crtc->base.id);
>> >
>> > @@ -731,14 +701,8 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>> >   */
>> >  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc
>> > *crtc)
>> >  {
>> > -     struct dpu_crtc_state *cstate, *old_cstate;
>> > -
>> > -     if (!crtc || !crtc->state) {
>> > -             DPU_ERROR("invalid argument(s)\n");
>> > -             return NULL;
>> > -     }
>> > +     struct dpu_crtc_state *cstate, *old_cstate =
>> > to_dpu_crtc_state(crtc->state);
>> >
>> > -     old_cstate = to_dpu_crtc_state(crtc->state);
>> >       cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
>> >       if (!cstate) {
>> >               DPU_ERROR("failed to allocate state\n");
>> > @@ -754,19 +718,12 @@ static struct drm_crtc_state
>> > *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>> >  static void dpu_crtc_disable(struct drm_crtc *crtc,
>> >                            struct drm_crtc_state *old_crtc_state)
>> >  {
>> > -     struct dpu_crtc *dpu_crtc;
>> > -     struct dpu_crtc_state *cstate;
>> > +     struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>> > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>> >       struct drm_encoder *encoder;
>> >       unsigned long flags;
>> >       bool release_bandwidth = false;
>> >
>> > -     if (!crtc || !crtc->state) {
>> > -             DPU_ERROR("invalid crtc\n");
>> > -             return;
>> > -     }
>> > -     dpu_crtc = to_dpu_crtc(crtc);
>> > -     cstate = to_dpu_crtc_state(crtc->state);
>> > -
>> >       DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>> >
>> >       /* Disable/save vblank irq handling */
>> > @@ -825,19 +782,13 @@ static void dpu_crtc_disable(struct drm_crtc
>> > *crtc,
>> >  static void dpu_crtc_enable(struct drm_crtc *crtc,
>> >               struct drm_crtc_state *old_crtc_state)
>> >  {
>> > -     struct dpu_crtc *dpu_crtc;
>> > +     struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>> >       struct drm_encoder *encoder;
>> >       bool request_bandwidth = false;
>> >
>> > -     if (!crtc) {
>> > -             DPU_ERROR("invalid crtc\n");
>> > -             return;
>> > -     }
>> > -
>> >       pm_runtime_get_sync(crtc->dev->dev);
>> >
>> >       DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>> > -     dpu_crtc = to_dpu_crtc(crtc);
>> >
>> >       drm_for_each_encoder_mask(encoder, crtc->dev,
>> > crtc->state->encoder_mask) {
>> >               /* in video mode, we hold an extra bandwidth reference
>> > @@ -873,9 +824,9 @@ struct plane_state {
>> >  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>> >               struct drm_crtc_state *state)
>> >  {
>> > -     struct dpu_crtc *dpu_crtc;
>> > +     struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>> > +     struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
>> >       struct plane_state *pstates;
>> > -     struct dpu_crtc_state *cstate;
>> >
>> >       const struct drm_plane_state *pstate;
>> >       struct drm_plane *plane;
>> > @@ -889,16 +840,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc
>> > *crtc,
>> >       int left_zpos_cnt = 0, right_zpos_cnt = 0;
>> >       struct drm_rect crtc_rect = { 0 };
>> >
>> > -     if (!crtc) {
>> > -             DPU_ERROR("invalid crtc\n");
>> > -             return -EINVAL;
>> > -     }
>> > -
>> >       pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
>> >
>> > -     dpu_crtc = to_dpu_crtc(crtc);
>> > -     cstate = to_dpu_crtc_state(state);
>> > -
>> >       if (!state->enable || !state->active) {
>> >               DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
>> >                               crtc->base.id, state->enable, state->active);
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
