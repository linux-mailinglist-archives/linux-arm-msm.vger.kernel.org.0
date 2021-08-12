Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD513EAB8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 22:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbhHLURG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 16:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbhHLURF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 16:17:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05134C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:16:40 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g21so11648376edb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3T97fjnbVeYFY55mcTyXZGeNt/LBhTUv9CkpM+Z/1c=;
        b=kRVB6tCTbTHA9cU6W1O81oxD2Uod99Sr5s2u9ufrsQqsQOfP44okXieSjAVyBGmZWK
         53D0A7N1squpYTy8gwzHqgxkYV+E2miY5/jC9LtyTfeCRUJNjzK4bEO4fUcsE3iwx2xJ
         Y6naLaxWytVa28iVdOceSoZzNGMyjjbaqL37w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3T97fjnbVeYFY55mcTyXZGeNt/LBhTUv9CkpM+Z/1c=;
        b=ilsOgE4SC4+MDP1G7e3cUyzcIfplLBdiRxpuylB9rz4jOY//GXhDxQlyggN6wv8Y0n
         wCLVcVxcP3O0y8BgPyQHqTCz1ctqdD4VsamxK13PVLNnerZzxbCyNH8+2pQpb3oFJsD8
         3odnQeis7x+8poZk2swZezVKJQazgcpM50JJYeymoFmIsPm19VSSBZMpcKzeoI3FoSWj
         tIyqGxhNxr2VR5RRw3WV8t7bMxV2J+AyoW5vutXfi92P8fBqTv2wNQFieQ8Z6wwwANFM
         gdlfVTW4w563SJvgjgPqX1yYvUzBug/jSxKeU1luXdiEfiaZ12dzT38Kgits35MYqI5c
         8kKg==
X-Gm-Message-State: AOAM532UTWQtmlvRC7GebRwUsYVa4ORqaonfiwSgf3LCuX1GADyE7Yw3
        dat2DxtWpORdIuCSDir26RZT1dc2iIjiUAqqxv+r4g==
X-Google-Smtp-Source: ABdhPJwWWqQ5XOSqkHsSYS4OEktfkZGmQ+cM+taO8698xIfP4Ee0BzwKHSvkzV4h3QB2DE4iPzjFQoeurX1Zallnz8g=
X-Received: by 2002:a50:fd82:: with SMTP id o2mr1481970edt.294.1628799398501;
 Thu, 12 Aug 2021 13:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210811180844.2130484-1-markyacoub@chromium.org>
 <CAF6AEGveSFBOQkP=NXeRZAuAeL_yQc5Sq6LO+huf4bJO6c2yKA@mail.gmail.com>
 <105abb2369fdd47a76e330857024c96a@codeaurora.org> <CAF6AEGuJ3c7WTN68HJKECu_uCeZoi_js1S8XOuEQ-nNSWbCybw@mail.gmail.com>
 <3f363089ffc7da3289204139ac275c3b@codeaurora.org>
In-Reply-To: <3f363089ffc7da3289204139ac275c3b@codeaurora.org>
From:   Mark Yacoub <markyacoub@chromium.org>
Date:   Thu, 12 Aug 2021 16:16:27 -0400
Message-ID: <CAJUqKUqWU2aBK+K2M+SYgt9jC0cTQXZBUNu=ndHNMnMqCDFB+A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Read frame_count and line_count even
 when disabled.
To:     abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Yacoub <markyacoub@google.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 7:37 PM <abhinavk@codeaurora.org> wrote:
>
> On 2021-08-11 16:28, Rob Clark wrote:
> > On Wed, Aug 11, 2021 at 4:11 PM <abhinavk@codeaurora.org> wrote:
> >>
> >> On 2021-08-11 11:43, Rob Clark wrote:
> >> > On Wed, Aug 11, 2021 at 11:12 AM Mark Yacoub <markyacoub@chromium.org>
> >> > wrote:
> >> >>
> >> >> From: Mark Yacoub <markyacoub@google.com>
> >> >>
> >> >> [why]
> >> >> Reading frame count register used to get the vblank counter, which
> >> >> calls
> >> >> dpu_encoder_phys to get the frame count. Even when it's disabled, the
> >> >> vblank counter (through frame count) should return a valid value for
> >> >> the
> >> >> count. An invalid value of 0, when compared to vblank->last (in
> >> >> drm_vblank.c::drm_update_vblank_count()) returns an invalid number
> >> >> that
> >> >> throws off the vblank counter for the lifetime of the process.
> >> >>
> >> >> Rationale:
> >> >> In drm_vblank.c::drm_update_vblank_count(), the new diff is calculated
> >> >> through:
> >> >> diff = (cur_vblank - vblank->last) & max_vblank_count;
> >> >> cur_vblank comes from: cur_vblank = __get_vblank_counter(dev, pipe);
> >> >> When the value is 0, diff results in a negative number (a very large
> >> >> number as it's unsigned), which inflates the vblank count when the
> >> >> diff
> >> >> is added to the current vblank->count.
> >> >>
> >> >> [How]
> >> >> Read frame_count register whether interface timing engine is enabled
> >> >> or
> >> >> not.
> >> >>
> >> >> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> >> >> Tested on ChromeOS Trogdor(msm)
> >> >>
> >> >> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> >> >
> >> > Reviewed-by: Rob Clark <robdclark@chromium.org>
> >> >
> >> > But I suspect we may have a bit more work for the display-off case..
> >> > or at least I'm not seeing anything obviously doing a pm_runtime_get()
> >> > in this call path.
> >> >
> >> > I'm also not sure if the line/frame-count registers loose state across
> >> > a suspend->resume cycle, it might be that we need to save/restore
> >> > these registers in the suspend/resume path?  Abhinav?
> >> >
> >> > BR,
> >> > -R
> >> >
> >> I spent sometime checking this and I dont think we should go ahead
> >> with
> >> this change.
> >> So when the timing engine is off, I believe the reason this works is
> >> that the clocks are still not OFF yet
> >> so this should be returning the last value of the vsync counter before
> >> the timing engine was turned OFF.
> >> If the clocks got turned OFF and there is a power collapse, I expect
> >> the
> >> frame_count and line_count to get reset
> >> to 0.
> >
> > I think if the interface clocks are off, it will be worse.. reading
> > any register will make things go *boom*, won't it?
> >
> > That said, I don't think this patch is making that particular issue
> > worse.
>
> Yes any unclocked access will cause an abort. What I am trying to
> emphasize here
> is that returning the register value after timing engine is off is
> unreliable and should
> not be done. Its working because even though timing engine is off, the
> clocks are not
> yet, so it returns the last value. But we should not rely on it because
> its incorrect
> to check these registers after timing engine off.
>
> >
> >>
> >> I was also looking at the stack in which this error will start
> >> happening. So I believe the sequence is like this
> >> (mark can correct me if wrong):
> >>
> >> drm_crtc_vblank_off(crtc); ---> drm_vblank_disable_and_save ---->
> >> drm_update_vblank_count ----> __get_vblank_counter().
> >>
> >> crtc is disabled after the encoder so this path triggers an incorrect
> >> value because encoder was already disabled (hence timing
> >> engine was too). Clocks were still ON as full suspend hasnt happened
> >> yet.
> >>
> >> To fix this, I think we should do what the downstream drivers did, so
> >> something like this:
> >>
> >> 5471 static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> >> 5472 {
> >> 5473    struct drm_encoder *encoder;
> >>          struct dpu_encoder_virt *dpu_enc = NULL;
> >>
> >>          dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> 5480
> >> ***********************************************************
> >> 5485            return dpu_encoder_get_frame_count(encoder);
> >> ************************************************************
I'm not quite following what's happening here, this doesn't look much
like the function i see on cros.
> >>
> >> this just returns phys->vsync_cnt (which is just an atomic counter
> >> which
> >> doesnt reset during disable)
> >> So in other words instead of relying on the hw register value which
> >> can
> >> be unpredictable when the timing engine is off,
> >> use a sw counter
> >
> > I don't think that a sw counter will do the job, unless we never
> > disable the vblank irq (or I am misunderstanding you).. the frame
> > counter is expected to keep incrementing regardless of whether vblank
> > is enabled or not.
> >
> > But it does sound like on suspend we need to store the current frame
> > count, and add that offset later when asked for the current frame
> > counter.
> >
> > BR,
> > -R
> the sw counter which i am referring to is already present in
> dpu_encoder.c
> its never reset during disable and should do the job.
>
> Yes, in principle yes, we need to store the current frame count before
> suspend.
> Thats what the phys->vsync_cnt will do and wont get reset.
So i ran the code for both values, when it's on, i see them both
having positive integers but they're not equal in any way. vsync count
seems to be off
```
[   83.627347] [drm:drm_mode_object_put] OBJ ID: 58 (1)
[   83.643559] get_frame_count->4887 3962<-vsync_cnt
[   83.643595] msm ae00000.mdss:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : v
p(0,-33)@ 83.606630 -> 83.607121 [e 2 us, 0 rep]
[   83.643663] get_frame_count->4887 3962<-vsync_cnt
[   83.643677] msm ae00000.mdss: [drm:drm_update_vblank_count]
updating vblank count on crtc 0: current=38654714967, diff=1, hw=4887
hw_last=4886
[   83.643722] msm ae00000.mdss: [drm:vblank_disable_fn] disabling
vblank on crtc 0
[   83.643750] get_frame_count->4887 3962<-vsync_cnt
[   83.643763] msm ae00000.mdss:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : v
p(0,-22)@ 83.606803 -> 83.607131 [e 1 us, 0 rep]
[   83.643811] get_frame_count->4887 3962<-vsync_cnt
[   83.643823] msm ae00000.mdss: [drm:drm_update_vblank_count]
updating vblank count on crtc 0: current=38654714968, diff=0, hw=4887
hw_last=4887
```

I see vsync always having values though (at enabling and disabling)
```
[   82.887961] [drm:dpu_crtc_disable] crtc51
[   82.887977] msm ae00000.mdss: [drm:drm_crtc_vblank_off] crtc 0,
vblank enabled 1, inmodeset 0
[   82.887998] get_frame_count->0 3939<-vsync_cnt
[   82.888008] msm ae00000.mdss:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : v
p(0,-38)@ 82.851427 -> 82.851992 [e 1 us, 0 rep]
[   82.888038] get_frame_count->0 3939<-vsync_cnt
```

should we create a s->frame_count_cached and save the value of
frame_count whenever it's read when s->is_en?

>
> >
> >> 5486    }
> >> 5487
> >> 5488    return 0;
> >> 5489 }
> >>
> >>
> >> >> ---
> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 ++-------
> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
> >> >>  2 files changed, 3 insertions(+), 8 deletions(-)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> >> index 116e2b5b1a90f..c436d901629f3 100644
> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> >> @@ -266,13 +266,8 @@ static void dpu_hw_intf_get_status(
> >> >>
> >> >>         s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
> >> >>         s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) &
> >> >> BIT(31));
> >> >> -       if (s->is_en) {
> >> >> -               s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> >> >> -               s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> >> >> -       } else {
> >> >> -               s->line_count = 0;
> >> >> -               s->frame_count = 0;
> >> >> -       }
> >> >> +       s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> >> >> +       s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> >> >>  }
> >> >>
> >> >>  static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> >> index 3568be80dab51..877ff48bfef04 100644
> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> >> @@ -41,7 +41,7 @@ struct intf_prog_fetch {
> >> >>  struct intf_status {
> >> >>         u8 is_en;               /* interface timing engine is enabled
> >> >> or not */
> >> >>         u8 is_prog_fetch_en;    /* interface prog fetch counter is
> >> >> enabled or not */
> >> >> -       u32 frame_count;        /* frame count since timing engine
> >> >> enabled */
> >> >> +       u32 frame_count; /* frame count since timing engine first
> >> >> enabled */
> >> >>         u32 line_count;         /* current line count including
> >> >> blanking */
> >> >>  };
> >> >>
> >> >> --
> >> >> 2.33.0.rc1.237.g0d66db33f3-goog
> >> >>
