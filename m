Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFCE3E9B33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhHKXYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhHKXYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:24:52 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A839AC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 16:24:27 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so3116086wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 16:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YSRp/2wpbh3JDX/tJHWCDCOEZsOZPWPJrbeJZiKAnDk=;
        b=ASBr9BChtMBest36Ug+2+MFL3d2R2L4oUnTGCL7OMs7P+W/4f31q02zwk7eQnJ8CMq
         IIkZzEGdk9hD5ywdXLIPcfgUmh0CihxIjVqJCqfomQ/+zGYIOJ1X6a8bnfdKqjb51uhP
         pbu0ltLZ6bl72yS511rhXN7KQmyoAdlA62qRfrFe69e/xcOyia9ii+a8iHz7DrotceCZ
         W4xfsQ/XHDl8q7u01u6KYhdpUDmu00ZMfAYiaESv80JfySmndVQebcI29nPhl+Pmwa1t
         mT/29lxEKDRuCnGAq69ySknO+GrAs3GiEAMyA+J49dYSFtYh3PoraaGFJarptwhr73Dd
         oUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YSRp/2wpbh3JDX/tJHWCDCOEZsOZPWPJrbeJZiKAnDk=;
        b=Svuww4jmKuAKBF12EloXiht7ZO4VCS3hXhqGaofcbl5WKT6aFDi72nCFy2U7OPp09W
         anMPJgACej5U2Fb0+O4nd2fEf0EtjZAY4m4Uyha1M5BLC3wxIUCVojBPmu6lxilruSlP
         i/VMioexzWemVjPu0xeZUAtHjTSFiWEf3G4FfvjJvl5zbIjAJSCYGY6VarY5tlqIdcTK
         RI850dIdVnkRwWTWo8/cVj/+QjP25bO+WUFphLtrKmoAqtjiRhKveP6Vp9KuXJFh4Lm7
         Z1yO7aPT9+3Id0A6B2vPV9HqG/dxxotm3RKjxrf712b1jWVmt1x1sNhaTl4mp7fSp40I
         yfMw==
X-Gm-Message-State: AOAM533yO5dYu5PlnHSU1pUsE9+HNM7aeMC9HKUuJkDYROct2VTjdj4T
        m+1Kg6ATY09a0IljJbJIwF42k9uYQjPNz6Ied8A=
X-Google-Smtp-Source: ABdhPJx5lhhvX/oZoO4Bt+ctWdNJUSrosRw1QA559pHfuS9fzMugm82vBhZb9EEvfGh/mVWgOt4VGIkGW4IekQY6kjo=
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr12387315wmg.164.1628724266164;
 Wed, 11 Aug 2021 16:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210811180844.2130484-1-markyacoub@chromium.org>
 <CAF6AEGveSFBOQkP=NXeRZAuAeL_yQc5Sq6LO+huf4bJO6c2yKA@mail.gmail.com> <105abb2369fdd47a76e330857024c96a@codeaurora.org>
In-Reply-To: <105abb2369fdd47a76e330857024c96a@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 11 Aug 2021 16:28:41 -0700
Message-ID: <CAF6AEGuJ3c7WTN68HJKECu_uCeZoi_js1S8XOuEQ-nNSWbCybw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Read frame_count and line_count even
 when disabled.
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Mark Yacoub <markyacoub@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Yacoub <markyacoub@google.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 4:11 PM <abhinavk@codeaurora.org> wrote:
>
> On 2021-08-11 11:43, Rob Clark wrote:
> > On Wed, Aug 11, 2021 at 11:12 AM Mark Yacoub <markyacoub@chromium.org>
> > wrote:
> >>
> >> From: Mark Yacoub <markyacoub@google.com>
> >>
> >> [why]
> >> Reading frame count register used to get the vblank counter, which
> >> calls
> >> dpu_encoder_phys to get the frame count. Even when it's disabled, the
> >> vblank counter (through frame count) should return a valid value for
> >> the
> >> count. An invalid value of 0, when compared to vblank->last (in
> >> drm_vblank.c::drm_update_vblank_count()) returns an invalid number
> >> that
> >> throws off the vblank counter for the lifetime of the process.
> >>
> >> Rationale:
> >> In drm_vblank.c::drm_update_vblank_count(), the new diff is calculated
> >> through:
> >> diff = (cur_vblank - vblank->last) & max_vblank_count;
> >> cur_vblank comes from: cur_vblank = __get_vblank_counter(dev, pipe);
> >> When the value is 0, diff results in a negative number (a very large
> >> number as it's unsigned), which inflates the vblank count when the
> >> diff
> >> is added to the current vblank->count.
> >>
> >> [How]
> >> Read frame_count register whether interface timing engine is enabled
> >> or
> >> not.
> >>
> >> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> >> Tested on ChromeOS Trogdor(msm)
> >>
> >> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> >
> > Reviewed-by: Rob Clark <robdclark@chromium.org>
> >
> > But I suspect we may have a bit more work for the display-off case..
> > or at least I'm not seeing anything obviously doing a pm_runtime_get()
> > in this call path.
> >
> > I'm also not sure if the line/frame-count registers loose state across
> > a suspend->resume cycle, it might be that we need to save/restore
> > these registers in the suspend/resume path?  Abhinav?
> >
> > BR,
> > -R
> >
> I spent sometime checking this and I dont think we should go ahead with
> this change.
> So when the timing engine is off, I believe the reason this works is
> that the clocks are still not OFF yet
> so this should be returning the last value of the vsync counter before
> the timing engine was turned OFF.
> If the clocks got turned OFF and there is a power collapse, I expect the
> frame_count and line_count to get reset
> to 0.

I think if the interface clocks are off, it will be worse.. reading
any register will make things go *boom*, won't it?

That said, I don't think this patch is making that particular issue worse.

>
> I was also looking at the stack in which this error will start
> happening. So I believe the sequence is like this
> (mark can correct me if wrong):
>
> drm_crtc_vblank_off(crtc); ---> drm_vblank_disable_and_save ---->
> drm_update_vblank_count ----> __get_vblank_counter().
>
> crtc is disabled after the encoder so this path triggers an incorrect
> value because encoder was already disabled (hence timing
> engine was too). Clocks were still ON as full suspend hasnt happened
> yet.
>
> To fix this, I think we should do what the downstream drivers did, so
> something like this:
>
> 5471 static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> 5472 {
> 5473    struct drm_encoder *encoder;
>          struct dpu_encoder_virt *dpu_enc = NULL;
>
>          dpu_enc = to_dpu_encoder_virt(drm_enc);
> 5480
> ***********************************************************
> 5485            return dpu_encoder_get_frame_count(encoder);
> ************************************************************
>
> this just returns phys->vsync_cnt (which is just an atomic counter which
> doesnt reset during disable)
> So in other words instead of relying on the hw register value which can
> be unpredictable when the timing engine is off,
> use a sw counter

I don't think that a sw counter will do the job, unless we never
disable the vblank irq (or I am misunderstanding you).. the frame
counter is expected to keep incrementing regardless of whether vblank
is enabled or not.

But it does sound like on suspend we need to store the current frame
count, and add that offset later when asked for the current frame
counter.

BR,
-R

> 5486    }
> 5487
> 5488    return 0;
> 5489 }
>
>
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 ++-------
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
> >>  2 files changed, 3 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 116e2b5b1a90f..c436d901629f3 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -266,13 +266,8 @@ static void dpu_hw_intf_get_status(
> >>
> >>         s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
> >>         s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) &
> >> BIT(31));
> >> -       if (s->is_en) {
> >> -               s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> >> -               s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> >> -       } else {
> >> -               s->line_count = 0;
> >> -               s->frame_count = 0;
> >> -       }
> >> +       s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> >> +       s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> >>  }
> >>
> >>  static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> index 3568be80dab51..877ff48bfef04 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> @@ -41,7 +41,7 @@ struct intf_prog_fetch {
> >>  struct intf_status {
> >>         u8 is_en;               /* interface timing engine is enabled
> >> or not */
> >>         u8 is_prog_fetch_en;    /* interface prog fetch counter is
> >> enabled or not */
> >> -       u32 frame_count;        /* frame count since timing engine
> >> enabled */
> >> +       u32 frame_count; /* frame count since timing engine first
> >> enabled */
> >>         u32 line_count;         /* current line count including
> >> blanking */
> >>  };
> >>
> >> --
> >> 2.33.0.rc1.237.g0d66db33f3-goog
> >>
