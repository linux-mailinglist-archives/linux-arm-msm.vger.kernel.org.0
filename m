Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DBE31CDD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 17:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhBPQRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 11:17:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhBPQRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 11:17:47 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB00C061574;
        Tue, 16 Feb 2021 08:17:07 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id g6so13757893wrs.11;
        Tue, 16 Feb 2021 08:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8DMHu73Y+JgfnuWV12hY+nLT1+5Y4CKMv913XSBj6g=;
        b=EAQnII8aBZPEKDHPX0Q41i8QVgPi4Vo7IiMeoBNZXfLd2r/ed4aWqC5hlvMDl4jFd/
         gn7l7Nj1mNB1hIgk6OoWbM5l5hPjxwxK3z3Y3uv5Eio4Abd+DKn7cIiNCKotJz5RRZQ5
         IyATD9c/hYJkVePgrt6OMaoRuikI5QEr7+adsrhDj7naQ3sKZH3NZbEEaWtJylSGpdL3
         vOvAxQQZUJv0hue+uk4gZSzBPLU9bZ8pVCKBERotZcvFu38kKaEoHgnGK+HgM28DSoT9
         vx0XstJBAhad/rrVD8t59aTIrjATIcTGhUXrI9eAmyK90dJgHji+8U4VZe71tjdLybXA
         9qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8DMHu73Y+JgfnuWV12hY+nLT1+5Y4CKMv913XSBj6g=;
        b=QzaycnyDgS8H/Ip1K9bwfNHP66wzbZXigKzXGCCvYmIXgfn/T3wu0E1JJebKm2QMh5
         dwQcUeqeerSWINauHswzrBYZIe+1bb21cynSABV8YoaBCmWTIxNZQopY4pNgzMhCTJ9B
         BLnMwQoKI2KALu5UQU/f92xLne/EASGSHeB/CVyOqkernovxcPWr6ExbIN4DwsoGgiMy
         tpXz5WSHMVpBZ4ZDxZC3/sXe1I8hTnQ23c3kF17J3SJQ5kS7vG7e24TMG60qNS1d7+K7
         O/7XJ+rwcg9EHps5IF51EwC7KFgCG7hm4EtoKAk3z8cNQTvS3OUVqLN8fsZe7/Lb4Cm2
         OATg==
X-Gm-Message-State: AOAM5327qz44Al9grDoLXIHWe7gmCBlVaaKMsfhYVRbitIPleYmsgDSd
        RDEDoBxE8fPPvGWhjUf9qh8FOU3/jilsAWJsjEZ6aKlOuBw=
X-Google-Smtp-Source: ABdhPJyVvIDYgC3NAbF/rPvfMbsRq4MI3FgnNdjTjJGF+2AtACRvulqCR05rV5jaDFGn0gVM3mMKz8ZTL09kU1F+jso=
X-Received: by 2002:adf:fad2:: with SMTP id a18mr3327511wrs.147.1613492225870;
 Tue, 16 Feb 2021 08:17:05 -0800 (PST)
MIME-Version: 1.0
References: <1608287227-17685-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGvvtDq7FK4NcKCc2FG2sbArBU-YboEA4u73oPR9o3coag@mail.gmail.com>
 <fda3742598a6952c4e6797f31763aea8@codeaurora.org> <CAF6AEGviZ3UssYHa6-Fg2n2tjRmx5-b5FqVxWSY0Z_BqUtQqSQ@mail.gmail.com>
 <fc3b3e609f07603ab6e6f12f2045bfca@codeaurora.org> <CAF6AEGtbdYtHdMad8oP=gGRifmgKrti6rUmGrCVh=T=ij3T1xQ@mail.gmail.com>
 <77252cca5800f9738a01536df2aab115@codeaurora.org>
In-Reply-To: <77252cca5800f9738a01536df2aab115@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 16 Feb 2021 08:19:58 -0800
Message-ID: <CAF6AEGuVLAX-A+KHpc+vjmug=gEMVpVJyYUPhnQz9oNP-pWHYA@mail.gmail.com>
Subject: Re: [Freedreno] [v2] drm/msm/disp/dpu1: turn off vblank irqs
 aggressively in dpu driver
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 7:21 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2021-02-12 23:19, Rob Clark wrote:
> > On Thu, Feb 11, 2021 at 7:31 AM <kalyan_t@codeaurora.org> wrote:
> >>
> >> On 2021-02-11 01:56, Rob Clark wrote:
> >> > On Wed, Feb 10, 2021 at 3:41 AM <kalyan_t@codeaurora.org> wrote:
> >> >>
> >> >> On 2021-02-01 00:46, Rob Clark wrote:
> >> >> > On Fri, Dec 18, 2020 at 2:27 AM Kalyan Thota <kalyan_t@codeaurora.org>
> >> >> > wrote:
> >> >> >>
> >> >> >> Set the flag vblank_disable_immediate = true to turn off vblank irqs
> >> >> >> immediately as soon as drm_vblank_put is requested so that there are
> >> >> >> no irqs triggered during idle state. This will reduce cpu wakeups
> >> >> >> and help in power saving.
> >> >> >>
> >> >> >> To enable vblank_disable_immediate flag the underlying KMS driver
> >> >> >> needs to support high precision vblank timestamping and also a
> >> >> >> reliable way of providing vblank counter which is incrementing
> >> >> >> at the leading edge of vblank.
> >> >> >>
> >> >> >> This patch also brings in changes to support vblank_disable_immediate
> >> >> >> requirement in dpu driver.
> >> >> >>
> >> >> >> Changes in v1:
> >> >> >>  - Specify reason to add vblank timestamp support. (Rob)
> >> >> >>  - Add changes to provide vblank counter from dpu driver.
> >> >> >>
> >> >> >> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >> >> >
> >> >> > This seems to be triggering:
> >> >> >
> >> >> > [  +0.032668] ------------[ cut here ]------------
> >> >> > [  +0.004759] msm ae00000.mdss: drm_WARN_ON_ONCE(cur_vblank !=
> >> >> > vblank->last)
> >> >> > [  +0.000024] WARNING: CPU: 0 PID: 362 at
> >> >> > drivers/gpu/drm/drm_vblank.c:354 drm_update_vblank_count+0x1e4/0x258
> >> >> > [  +0.017154] Modules linked in: joydev
> >> >> > [  +0.003784] CPU: 0 PID: 362 Comm: frecon Not tainted
> >> >> > 5.11.0-rc5-00037-g33d3504871dd #2
> >> >> > [  +0.008135] Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> >> >> > [  +0.006167] pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
> >> >> > [  +0.006169] pc : drm_update_vblank_count+0x1e4/0x258
> >> >> > [  +0.005105] lr : drm_update_vblank_count+0x1e4/0x258
> >> >> > [  +0.005106] sp : ffffffc010003b70
> >> >> > [  +0.003409] x29: ffffffc010003b70 x28: ffffff80855d9d98
> >> >> > [  +0.005466] x27: 0000000000000000 x26: 0000000000fe502a
> >> >> > [  +0.005458] x25: 0000000000000001 x24: 0000000000000001
> >> >> > [  +0.005466] x23: 0000000000000001 x22: ffffff808561ce80
> >> >> > [  +0.005465] x21: 0000000000000000 x20: 0000000000000000
> >> >> > [  +0.005468] x19: ffffff80850d6800 x18: 0000000000000000
> >> >> > [  +0.005466] x17: 0000000000000000 x16: 0000000000000000
> >> >> > [  +0.005465] x15: 000000000000000a x14: 000000000000263b
> >> >> > [  +0.005466] x13: 0000000000000006 x12: ffffffffffffffff
> >> >> > [  +0.005465] x11: 0000000000000010 x10: ffffffc090003797
> >> >> > [  +0.005466] x9 : ffffffed200e2a8c x8 : 0000000000000000
> >> >> > [  +0.005466] x7 : 00000000ffffffff x6 : ffffffed213b2b51
> >> >> > [  +0.005465] x5 : c0000000ffffdfff x4 : ffffffed21218048
> >> >> > [  +0.005465] x3 : 0000000000000000 x2 : 0000000000000000
> >> >> > [  +0.005465] x1 : 0000000000000000 x0 : 0000000000000000
> >> >> > [  +0.005466] Call trace:
> >> >> > [  +0.002520]  drm_update_vblank_count+0x1e4/0x258
> >> >> > [  +0.004748]  drm_handle_vblank+0xd0/0x35c
> >> >> > [  +0.004130]  drm_crtc_handle_vblank+0x24/0x30
> >> >> > [  +0.004487]  dpu_crtc_vblank_callback+0x3c/0xc4
> >> >> > [  +0.004662]  dpu_encoder_vblank_callback+0x70/0xc4
> >> >> > [  +0.004931]  dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
> >> >> > [  +0.005378]  dpu_core_irq_callback_handler+0xf4/0xfc
> >> >> > [  +0.005107]  dpu_hw_intr_dispatch_irq+0x100/0x120
> >> >> > [  +0.004834]  dpu_core_irq+0x44/0x5c
> >> >> > [  +0.003597]  dpu_irq+0x1c/0x28
> >> >> > [  +0.003141]  msm_irq+0x34/0x40
> >> >> > [  +0.003153]  __handle_irq_event_percpu+0xfc/0x254
> >> >> > [  +0.004838]  handle_irq_event_percpu+0x3c/0x94
> >> >> > [  +0.004574]  handle_irq_event+0x54/0x98
> >> >> > [  +0.003944]  handle_level_irq+0xa0/0xd0
> >> >> > [  +0.003943]  generic_handle_irq+0x30/0x48
> >> >> > [  +0.004131]  dpu_mdss_irq+0xe4/0x118
> >> >> > [  +0.003684]  generic_handle_irq+0x30/0x48
> >> >> > [  +0.004127]  __handle_domain_irq+0xa8/0xac
> >> >> > [  +0.004215]  gic_handle_irq+0xdc/0x150
> >> >> > [  +0.003856]  el1_irq+0xb4/0x180
> >> >> > [  +0.003237]  dpu_encoder_vsync_time+0x78/0x230
> >> >> > [  +0.004574]  dpu_encoder_kickoff+0x190/0x354
> >> >> > [  +0.004386]  dpu_crtc_commit_kickoff+0x194/0x1a0
> >> >> > [  +0.004748]  dpu_kms_flush_commit+0xf4/0x108
> >> >> > [  +0.004390]  msm_atomic_commit_tail+0x2e8/0x384
> >> >> > [  +0.004661]  commit_tail+0x80/0x108
> >> >> > [  +0.003588]  drm_atomic_helper_commit+0x118/0x11c
> >> >> > [  +0.004834]  drm_atomic_commit+0x58/0x68
> >> >> > [  +0.004033]  drm_atomic_helper_set_config+0x70/0x9c
> >> >> > [  +0.005018]  drm_mode_setcrtc+0x390/0x584
> >> >> > [  +0.004131]  drm_ioctl_kernel+0xc8/0x11c
> >> >> > [  +0.004035]  drm_ioctl+0x2f8/0x34c
> >> >> > [  +0.003500]  drm_compat_ioctl+0x48/0xe8
> >> >> > [  +0.003945]  __arm64_compat_sys_ioctl+0xe8/0x104
> >> >> > [  +0.004750]  el0_svc_common.constprop.0+0x114/0x188
> >> >> > [  +0.005019]  do_el0_svc_compat+0x28/0x38
> >> >> > [  +0.004031]  el0_svc_compat+0x20/0x30
> >> >> > [  +0.003772]  el0_sync_compat_handler+0x104/0x18c
> >> >> > [  +0.004749]  el0_sync_compat+0x178/0x180
> >> >> > [  +0.004034] ---[ end trace 2959d178e74f2555 ]---
> >> >> >
> >> >> >
> >> >> > BR,
> >> >> > -R
> >> >> >
> >> >> Hi Rob,
> >> >>
> >> >> on DPU HW, with prefetch enabled, the frame count increment and vsync
> >> >> irq are not happening at same instance. This is causing the frame
> >> >> count
> >> >> to mismatch.
> >> >>
> >> >> Example:
> >> >> |----###########--^--|----###########--^--|
> >> >>
> >> >> for the above vsync cycle with prefetch enabled "^" --> marks a fetch
> >> >> counter where in we are asking the hw to start fetching in the front
> >> >> porch so that we will have more time to fetch data by first active
> >> >> line
> >> >> of next frame.
> >> >>
> >> >> In this case, the vsync irq will be triggered at fetch start marker
> >> >> ("^") so that double buffered updates are submitted to HW and the
> >> >> frame
> >> >> count update will happen at the end of front porch ("|")
> >> >
> >> > hmm, this sounds like the difference between a frame-done irq and a
> >> > vsync irq?  IIRC older gens had both..
> >> >
> >> AFAIK frame_done and vblank are more relevant to the command mode
> >> panels,
> >> where in you can transfer to panel G-RAM faster, so that buffers can
> >> be
> >> released early when your frame transfer is complete and retire the
> >> composition
> >> on vsync.
> >>
> >> In this case, we have a video mode panel where panel strictly adheres
> >> to
> >> the
> >> timings i.e we can't transfer faster. however in dpu hw we can still
> >> mark an
> >> interrupt once active period is complete such that HW latency lines
> >> can
> >> be
> >> prefilled in the blanking.
> >>
> >> >> to handle this, can we fallback on the SW vblank counter
> >> >> (drm_vblank_no_hw_counter) ? another way is to run a static counter in
> >> >> the driver irq handler and return that to drm_vblank framework instead
> >> >> reading from the HW block.  can you share your thoughts ?
> >> >
> >> > I'm not quite sure what the best answer is here.. is there actually a
> >> > "real vsync" irq that is signalled when the frame counter increments?
> >> >
> >> > drm is kinda blending two usages with "vsync".. one is "frame done",
> >> > ie we are ready to submit the next frame, userspace is ready to re-use
> >> > the previously on-screen buffer.  And the other is for actual precise
> >> > frame timings.  IIRC some people ultra-precise audio and video
> >> > synchronization (maybe someone else remembers the use-case here?).
> >> > Using frame-done is sufficient for the first case, but I think you
> >> > want to use real vblank for the 2nd
> >> >
> >> > Keeping a counter might work, but what happens when vblank irqs are
> >> > disabled?  Could we record the frame counter when we flush the
> >> > previous atomic update and just detect this case?  What is the
> >> > line-count in this period before the real vblank?
> >> >
> >> Here in our case
> >> dpu_vsync --> triggers on the first line of vertical front porch.
> >> frame_count --> increments at the end of the frame.
> >>
> >> The HW behavior is such that, if prefetch is enabled then vsync will
> >> be triggered at first line of vfp, else it will at end of frame.
> >>
> >> we can turn off prefetch, but it will increase the BW vote for prefill
> >> for panels with low vertical back porch.
> >>
> >> can we do as below snip ?
> >>
> >> int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
> >> {
> >> ...
> >>
> >>         if (phys && phys->ops.get_frame_count)
> >> + //               framecount = phys->ops.get_frame_count(phys);
> >> +        return atomic_read(&phys->vsync_cnt);
> >> ...
> >> }
> >>
> >> we already have a running counter of vsync, and it is incremented upon
> >> the vsync callback, returning that as frame count.
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1297
> >>
> >> If irq's are off then we will still get the last frame count.
> >
> > The expectation (and yes, cmd mode panels kinda break this) is that
> > you can translate between time and vblank.. so we don't really want
> > the frame count to stop incrementing just because irq's are disabled..
> >
> > *Maybe* we can do max(hw_frame_count, &phys->vsync_cnt).. we'd have to
> > adjust the vsync_cnt before enabling vsync irq's.. but that seems ugly
> > and fragile/racy..
> >
> > What will be the value of the hw line count during this window?  Is it
> > something we could use to detect that we are in this post-vsync but
> > pre-new-frame period?
> >
>
> Hi Rob,
>
> <vbp><vactive><vfp><sync>
>
> we will have vfp + sync duration until the frame count increments.
> Added the logic to handle it in the frame_count function, tested ok with
> this approach, kindly let me know your views on it.
>
> @@ -662,6 +662,8 @@ static int dpu_encoder_phys_vid_get_frame_count(
>                 struct dpu_encoder_phys *phys_enc)
>   {
>         struct intf_status s = {0};
> +       u32 fetch_start = 0;
> +       struct drm_display_mode mode = phys_enc->cached_mode;
>
>         if (!dpu_encoder_phys_vid_is_master(phys_enc))
>                 return -EINVAL;
>
>         phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &s);
>
> +       if (s.is_prog_fetch_en && s.is_en) {
> +               fetch_start = mode.vtotal - (mode.vsync_start - mode.vdisplay);
> +               if ((s.line_count > fetch_start) &&
> +                       (s.line_count <= mode.vtotal))
> +                       return s.frame_count + 1;
> +       }
> +
>         return s.frame_count;
>   }

yes, this looks like a better approach

BR,
-R


>
> - Kalyan
>
> > BR,
> > -R
> >
> >>
> >>
> >> > BR,
> >> > -R
> >> >
> >> >> -Kalyan
> >> >> >> ---
> >> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 80
> >> >> >> ++++++++++++++++++++++
> >> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 30 ++++++++
> >> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 11 +++
> >> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  1 +
> >> >> >>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 17 +++++
> >> >> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  5 ++
> >> >> >>  6 files changed, 144 insertions(+)
> >> >> >>
> >> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> >> >> index d4662e8..9a80981 100644
> >> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> >> >> @@ -65,6 +65,83 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
> >> >> >>         kfree(dpu_crtc);
> >> >> >>  }
> >> >> >>
> >> >> >> +static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc
> >> >> >> *crtc)
> >> >> >> +{
> >> >> >> +       struct drm_device *dev = crtc->dev;
> >> >> >> +       struct drm_encoder *encoder;
> >> >> >> +
> >> >> >> +       drm_for_each_encoder(encoder, dev)
> >> >> >> +               if (encoder->crtc == crtc)
> >> >> >> +                       return encoder;
> >> >> >> +
> >> >> >> +       return NULL;
> >> >> >> +}
> >> >> >> +
> >> >> >> +static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> >> >> >> +{
> >> >> >> +       struct drm_encoder *encoder;
> >> >> >> +
> >> >> >> +       encoder = get_encoder_from_crtc(crtc);
> >> >> >> +       if (!encoder) {
> >> >> >> +               DRM_ERROR("no encoder found for crtc %d\n",
> >> >> >> crtc->index);
> >> >> >> +               return false;
> >> >> >> +       }
> >> >> >> +
> >> >> >> +       return dpu_encoder_get_frame_count(encoder);
> >> >> >> +}
> >> >> >> +
> >> >> >> +static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> >> >> >> +                                          bool in_vblank_irq,
> >> >> >> +                                          int *vpos, int *hpos,
> >> >> >> +                                          ktime_t *stime, ktime_t
> >> >> >> *etime,
> >> >> >> +                                          const struct
> >> >> >> drm_display_mode *mode)
> >> >> >> +{
> >> >> >> +       unsigned int pipe = crtc->index;
> >> >> >> +       struct drm_encoder *encoder;
> >> >> >> +       int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
> >> >> >> +
> >> >> >> +       encoder = get_encoder_from_crtc(crtc);
> >> >> >> +       if (!encoder) {
> >> >> >> +               DRM_ERROR("no encoder found for crtc %d\n", pipe);
> >> >> >> +               return false;
> >> >> >> +       }
> >> >> >> +
> >> >> >> +       vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
> >> >> >> +       vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
> >> >> >> +
> >> >> >> +       /*
> >> >> >> +        * the line counter is 1 at the start of the VSYNC pulse and
> >> >> >> VTOTAL at
> >> >> >> +        * the end of VFP. Translate the porch values relative to the
> >> >> >> line
> >> >> >> +        * counter positions.
> >> >> >> +        */
> >> >> >> +
> >> >> >> +       vactive_start = vsw + vbp + 1;
> >> >> >> +       vactive_end = vactive_start + mode->crtc_vdisplay;
> >> >> >> +
> >> >> >> +       /* last scan line before VSYNC */
> >> >> >> +       vfp_end = mode->crtc_vtotal;
> >> >> >> +
> >> >> >> +       if (stime)
> >> >> >> +               *stime = ktime_get();
> >> >> >> +
> >> >> >> +       line = dpu_encoder_get_linecount(encoder);
> >> >> >> +
> >> >> >> +       if (line < vactive_start)
> >> >> >> +               line -= vactive_start;
> >> >> >> +       else if (line > vactive_end)
> >> >> >> +               line = line - vfp_end - vactive_start;
> >> >> >> +       else
> >> >> >> +               line -= vactive_start;
> >> >> >> +
> >> >> >> +       *vpos = line;
> >> >> >> +       *hpos = 0;
> >> >> >> +
> >> >> >> +       if (etime)
> >> >> >> +               *etime = ktime_get();
> >> >> >> +
> >> >> >> +       return true;
> >> >> >> +}
> >> >> >> +
> >> >> >>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> >> >> >>                 struct dpu_plane_state *pstate, struct dpu_format
> >> >> >> *format)
> >> >> >>  {
> >> >> >> @@ -1243,6 +1320,8 @@ static const struct drm_crtc_funcs
> >> >> >> dpu_crtc_funcs = {
> >> >> >>         .early_unregister = dpu_crtc_early_unregister,
> >> >> >>         .enable_vblank  = msm_crtc_enable_vblank,
> >> >> >>         .disable_vblank = msm_crtc_disable_vblank,
> >> >> >> +       .get_vblank_timestamp =
> >> >> >> drm_crtc_vblank_helper_get_vblank_timestamp,
> >> >> >> +       .get_vblank_counter = dpu_crtc_get_vblank_counter,
> >> >> >>  };
> >> >> >>
> >> >> >>  static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
> >> >> >> @@ -1251,6 +1330,7 @@ static const struct drm_crtc_helper_funcs
> >> >> >> dpu_crtc_helper_funcs = {
> >> >> >>         .atomic_check = dpu_crtc_atomic_check,
> >> >> >>         .atomic_begin = dpu_crtc_atomic_begin,
> >> >> >>         .atomic_flush = dpu_crtc_atomic_flush,
> >> >> >> +       .get_scanout_position = dpu_crtc_get_scanout_position,
> >> >> >>  };
> >> >> >>
> >> >> >>  /* initialize crtc */
> >> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> >> >> index f7f5c25..5cd3f31 100644
> >> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> >> >> @@ -425,6 +425,36 @@ int dpu_encoder_helper_unregister_irq(struct
> >> >> >> dpu_encoder_phys *phys_enc,
> >> >> >>         return 0;
> >> >> >>  }
> >> >> >>
> >> >> >> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
> >> >> >> +{
> >> >> >> +       struct dpu_encoder_virt *dpu_enc;
> >> >> >> +       struct dpu_encoder_phys *phys;
> >> >> >> +       int framecount = 0;
> >> >> >> +
> >> >> >> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> >> >> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
> >> >> >> +
> >> >> >> +       if (phys && phys->ops.get_frame_count)
> >> >> >> +               framecount = phys->ops.get_frame_count(phys);
> >> >> >> +
> >> >> >> +       return framecount;
> >> >> >> +}
> >> >> >> +
> >> >> >> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
> >> >> >> +{
> >> >> >> +       struct dpu_encoder_virt *dpu_enc;
> >> >> >> +       struct dpu_encoder_phys *phys;
> >> >> >> +       int linecount = 0;
> >> >> >> +
> >> >> >> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> >> >> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
> >> >> >> +
> >> >> >> +       if (phys && phys->ops.get_line_count)
> >> >> >> +               linecount = phys->ops.get_line_count(phys);
> >> >> >> +
> >> >> >> +       return linecount;
> >> >> >> +}
> >> >> >> +
> >> >> >>  void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
> >> >> >>                                   struct dpu_encoder_hw_resources
> >> >> >> *hw_res)
> >> >> >>  {
> >> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> >> >> index b491346..99a5d73 100644
> >> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> >> >> @@ -156,5 +156,16 @@ void dpu_encoder_prepare_commit(struct
> >> >> >> drm_encoder *drm_enc);
> >> >> >>   */
> >> >> >>  void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
> >> >> >>                                                         u32
> >> >> >> idle_timeout);
> >> >> >> +/**
> >> >> >> + * dpu_encoder_get_linecount - get interface line count for the
> >> >> >> encoder.
> >> >> >> + * @drm_enc:    Pointer to previously created drm encoder structure
> >> >> >> + */
> >> >> >> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
> >> >> >> +
> >> >> >> +/**
> >> >> >> + * dpu_encoder_get_frame_count - get interface frame count for the
> >> >> >> encoder.
> >> >> >> + * @drm_enc:    Pointer to previously created drm encoder structure
> >> >> >> + */
> >> >> >> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
> >> >> >>
> >> >> >>  #endif /* __DPU_ENCODER_H__ */
> >> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> >> >> index f8f2515..ecbc4be 100644
> >> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> >> >> @@ -143,6 +143,7 @@ struct dpu_encoder_phys_ops {
> >> >> >>         void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
> >> >> >>         void (*restore)(struct dpu_encoder_phys *phys);
> >> >> >>         int (*get_line_count)(struct dpu_encoder_phys *phys);
> >> >> >> +       int (*get_frame_count)(struct dpu_encoder_phys *phys);
> >> >> >>  };
> >> >> >>
> >> >> >>  /**
> >> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> >> >> index 9a69fad..f983595 100644
> >> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> >> >> @@ -658,6 +658,22 @@ static int dpu_encoder_phys_vid_get_line_count(
> >> >> >>         return
> >> >> >> phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
> >> >> >>  }
> >> >> >>
> >> >> >> +static int dpu_encoder_phys_vid_get_frame_count(
> >> >> >> +               struct dpu_encoder_phys *phys_enc)
> >> >> >> +{
> >> >> >> +       struct intf_status s = {0};
> >> >> >> +
> >> >> >> +       if (!dpu_encoder_phys_vid_is_master(phys_enc))
> >> >> >> +               return -EINVAL;
> >> >> >> +
> >> >> >> +       if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_status)
> >> >> >> +               return -EINVAL;
> >> >> >> +
> >> >> >> +       phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &s);
> >> >> >> +
> >> >> >> +       return s.frame_count;
> >> >> >> +}
> >> >> >> +
> >> >> >>  static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops
> >> >> >> *ops)
> >> >> >>  {
> >> >> >>         ops->is_master = dpu_encoder_phys_vid_is_master;
> >> >> >> @@ -676,6 +692,7 @@ static void dpu_encoder_phys_vid_init_ops(struct
> >> >> >> dpu_encoder_phys_ops *ops)
> >> >> >>         ops->handle_post_kickoff =
> >> >> >> dpu_encoder_phys_vid_handle_post_kickoff;
> >> >> >>         ops->needs_single_flush =
> >> >> >> dpu_encoder_phys_vid_needs_single_flush;
> >> >> >>         ops->get_line_count = dpu_encoder_phys_vid_get_line_count;
> >> >> >> +       ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
> >> >> >>  }
> >> >> >>
> >> >> >>  struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
> >> >> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> >> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> >> >> index 374b0e8..764a773 100644
> >> >> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> >> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> >> >> @@ -14,6 +14,7 @@
> >> >> >>
> >> >> >>  #include <drm/drm_crtc.h>
> >> >> >>  #include <drm/drm_file.h>
> >> >> >> +#include <drm/drm_vblank.h>
> >> >> >>
> >> >> >>  #include "msm_drv.h"
> >> >> >>  #include "msm_mmu.h"
> >> >> >> @@ -1020,6 +1021,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >> >> >>          */
> >> >> >>         dev->mode_config.allow_fb_modifiers = true;
> >> >> >>
> >> >> >> +       dev->max_vblank_count = 0;
> >> >> >> +       /* Disable vblank irqs aggressively for power-saving */
> >> >> >> +       dev->vblank_disable_immediate = true;
> >> >> >> +
> >> >> >>         /*
> >> >> >>          * _dpu_kms_drm_obj_init should create the DRM related objects
> >> >> >>          * i.e. CRTCs, planes, encoders, connectors and so forth
> >> >> >> --
> >> >> >> 2.7.4
> >> >> >>
> >> >> > _______________________________________________
> >> >> > Freedreno mailing list
> >> >> > Freedreno@lists.freedesktop.org
> >> >> > https://lists.freedesktop.org/mailman/listinfo/freedreno
> >> >> _______________________________________________
> >> >> Freedreno mailing list
> >> >> Freedreno@lists.freedesktop.org
> >> >> https://lists.freedesktop.org/mailman/listinfo/freedreno
> >> > _______________________________________________
> >> > Freedreno mailing list
> >> > Freedreno@lists.freedesktop.org
> >> > https://lists.freedesktop.org/mailman/listinfo/freedreno
> >> _______________________________________________
> >> Freedreno mailing list
> >> Freedreno@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/freedreno
