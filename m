Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81FF759EF57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 00:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiHWWl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 18:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiHWWlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 18:41:55 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C4A7EFF8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 15:41:53 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g14so1969042qto.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tmxFA8XSvwIm8HlHyhE9XTjlheeI6AT92oC1qgqk/ko=;
        b=VlUDgifGvKKcVjmHRXcMLhcgWZnHzLOcFO/K5egkPKE7D8qy8DvNxZsvJvcf0WvdAn
         BIkWLKysb7IDc+BGOBHlLKp6kbHDqnFl6zcV53fvvP6+yyoZHd0Iflpqj2gGGdP96I4W
         FvqlC66NHcM3dwql7tmJZ4oTJUPZvCz2YjBaS51kWdBWlCUcRA0xoHWQWszOVOYwhdLB
         04dM+HB1wZSkngA1Vw+o8hGXsqJHontDTtBKgMO1X6cYQ6cndd7aNDXAbGsDnHvRd9QU
         nZl2wuFIezwnWeDArX0WyV8KujnQ7gOrUyczVhQQE5LHPju6xewn8cngxXL/wVu8yWfZ
         mjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tmxFA8XSvwIm8HlHyhE9XTjlheeI6AT92oC1qgqk/ko=;
        b=6tCsioSnxtpqBKdFUWgeJ5QmGH0z4Cp2Y0fg2daDKmkaowSTtW9aXR/3ZfNdOPDvNl
         ueLfJwF+p5iXOjCYdu1R2fW+BE8pwRSuMUjIK8hvIG6qiaf9a/IDZehiZeqQzRoNNb9U
         eIUyejNgCQAYyb7mOWps9VlmunJqo2kFxJj95cAgpqUBQPBI2Irn555yAV+5ILILTCEX
         wQi07SJmKGyu/wQDVus9J1zDPQnz6RadXfH1jAUM2GeuGQRae3iTcrEKEQj9akv2w4Vm
         0c/R6Yasn1apk/CR9WZwpiL9yxA5EAF5sORD+G189mpfzO3eKo3Wzr3jUO1MqY76r0V8
         pScQ==
X-Gm-Message-State: ACgBeo3OR6EWns7FmglcLRcHbGYHqkx8j1pW4XN2iyh6gAQQtWKqEVIQ
        Co6SHwf/CkM2yc06mz44xB5hUn91O78Ka5diUiRNnQ==
X-Google-Smtp-Source: AA6agR75yA2KbFaZD1uT3K+uARlXtm24+WaheKsxQP2G1OsidZvndZBZPEkYsbXUigc0aLfOA+ZX5GkycvKiJPaAk3k=
X-Received: by 2002:ac8:5815:0:b0:343:726b:cc2c with SMTP id
 g21-20020ac85815000000b00343726bcc2cmr21229227qtg.682.1661294513036; Tue, 23
 Aug 2022 15:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <1660759314-28088-1-git-send-email-quic_khsieh@quicinc.com>
 <f211520a-cb9c-1202-0752-7bb200726ae8@linaro.org> <d4b3c303-fc20-537d-0e69-6e19826b6e59@quicinc.com>
 <266c0531-344e-5589-2143-02ab1fe9b276@linaro.org> <724d695d-0293-db81-7014-57cb96bd6d4b@quicinc.com>
 <bb153360-6567-c4d5-dc23-8586549df8c8@linaro.org> <13509c06-cf2b-e37b-d8ec-b5cc5370f566@quicinc.com>
In-Reply-To: <13509c06-cf2b-e37b-d8ec-b5cc5370f566@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 24 Aug 2022 01:41:41 +0300
Message-ID: <CAA8EJprzE_U0crAQxu5xvQxadu8jUovEXOWzV2cTc_BQeHjyow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add atomic_check to bridge ops
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
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

On Wed, 24 Aug 2022 at 01:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 8/22/2022 11:33 AM, Dmitry Baryshkov wrote:
> > On 22/08/2022 20:32, Abhinav Kumar wrote:
> >>
> >>
> >> On 8/22/2022 9:49 AM, Dmitry Baryshkov wrote:
> >>> On 22/08/2022 19:38, Abhinav Kumar wrote:
> >>>> Hi Dmitry
> >>>>
> >>>> On 8/22/2022 9:18 AM, Dmitry Baryshkov wrote:
> >>>>> On 17/08/2022 21:01, Kuogee Hsieh wrote:
> >>>>>> DRM commit_tails() will disable downstream crtc/encoder/bridge if
> >>>>>> both disable crtc is required and crtc->active is set before pushing
> >>>>>> a new frame downstream.
> >>>>>>
> >>>>>> There is a rare case that user space display manager issue an extra
> >>>>>> screen update immediately followed by close DRM device while down
> >>>>>> stream display interface is disabled. This extra screen update will
> >>>>>> timeout due to the downstream interface is disabled but will cause
> >>>>>> crtc->active be set. Hence the followed commit_tails() called by
> >>>>>> drm_release() will pass the disable downstream crtc/encoder/bridge
> >>>>>> conditions checking even downstream interface is disabled.
> >>>>>> This cause the crash to happen at dp_bridge_disable() due to it
> >>>>>> trying
> >>>>>> to access the main link register to push the idle pattern out
> >>>>>> while main
> >>>>>> link clocks is disabled.
> >>>>>>
> >>>>>> This patch adds atomic_check to prevent the extra frame will not
> >>>>>> be pushed down if display interface is down so that crtc->active
> >>>>>> will not be set neither. This will fail the conditions checking
> >>>>>> of disabling down stream crtc/encoder/bridge which prevent
> >>>>>> drm_release() from calling dp_bridge_disable() so that crash
> >>>>>> at dp_bridge_disable() prevented.
> >>>>>
> >>>>> I must admit I had troubles parsing this description. However if I
> >>>>> got you right, I think the check that the main link clock is
> >>>>> running in the dp_bridge_disable() or dp_ctrl_push_idle() would be
> >>>>> a better fix.
> >>>>
> >>>> Originally, thats what was posted
> >>>> https://patchwork.freedesktop.org/patch/496984/.
> >>>
> >>> This patch is also not so correct from my POV. It checks for the hpd
> >>> status, while in reality it should check for main link clocks being
> >>> enabled.
> >>>
> >>
> >> We can push another fix to check for the clk state instead of the hpd
> >> status. But I must say we are again just masking something which the
> >> fwk should have avoided isnt it?
> >>
> >> As per the doc in the include/drm/drm_bridge.h it says,
> >>
> >> "*
> >>   * The bridge can assume that the display pipe (i.e. clocks and timing
> >>   * signals) feeding it is still running when this callback is called.
> >>   *"
> >
> > Yes, that's what I meant about this chunk begging to go to the core. In
> > my opinion, if we are talking about the disconnected sinks, it is the
> > framework who should disallow submitting the frames to the disconnected
> > sinks.
> >
> >>
> >> By adding an extra layers of protection in the driver, we are just
> >> avoiding another issue but the commit should not have been issued in
> >> the first place.
> >>
> >> So shouldnt we do both then? That is add protection to check if clock
> >> is ON and also, reject commits when display is disconnected.
> >>
> >>>>
> >>>> Then it seemed like we were just protecting against an issue in the
> >>>> framework which was allowing the frames to be pushed even after the
> >>>> display was disconnected. The DP driver did send out the disconnect
> >>>> event correctly and as per the logs, this frame came down after that
> >>>> and the DRM fwk did allow it.
> >>>>
> >>>> So after discussing on IRC with Rob, we came up with this approach that
> >>>> if the display is not connected, then atomic_check should fail. That
> >>>> way the commit will not happen.
> >>>>
> >>>> Just seemed a bit cleaner instead of adding all our protections.
> >>>
> >>> The check to fail atomic_check if display is not connected seems out
> >>> of place. In its current way it begs go to the upper layer,
> >>> forbidding using disconnected sinks for all the drivers. There is
> >>> nothing special in the MSM DP driver with respect to the HPD events
> >>> processing and failing atomic_check() based on that.
> >>>
> >>
> >> Why all the drivers? This is only for MSM DP bridge.
> >
> > Yes, we change the MSM DRM driver. But the check is generic enough. I'm
> > not actually insisting on pushing the check to the core, just trying to
> > understand the real cause here.
> >
> >>
>
> I actually wanted to push this to the core and thats what I had
> originally asked on IRC because it does seem to be generic enough that
> it should belong to the core but after discussion with Rob on freedreno,
> he felt this was a better approach because for some of the legacy
> connectors like VGA, this need not belong to the DRM core, hence we went
> with this approach.

It might be better to whitelist such connectors (S-VIDEO/composite
comes to my mind rather than VGA).

> >>>>>> SError Interrupt on CPU7, code 0x00000000be000411 -- SError
> >>>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
> >>>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
> >>>>>> pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>>>>> pc : __cmpxchg_case_acq_32+0x14/0x2c
> >>>>>> lr : do_raw_spin_lock+0xa4/0xdc
> >>>>>> sp : ffffffc01092b6a0
> >>>>>> x29: ffffffc01092b6a0 x28: 0000000000000028 x27: 0000000000000038
> >>>>>> x26: 0000000000000004 x25: ffffffd2973dce48 x24: 0000000000000000
> >>>>>> x23: 00000000ffffffff x22: 00000000ffffffff x21: ffffffd2978d0008
> >>>>>> x20: ffffffd2978d0008 x19: ffffff80ff759fc0 x18: 0000000000000000
> >>>>>> x17: 004800a501260460 x16: 0441043b04600438 x15: 04380000089807d0
> >>>>>> x14: 07b0089807800780 x13: 0000000000000000 x12: 0000000000000000
> >>>>>> x11: 0000000000000438 x10: 00000000000007d0 x9 : ffffffd2973e09e4
> >>>>>> x8 : ffffff8092d53300 x7 : ffffff808902e8b8 x6 : 0000000000000001
> >>>>>> x5 : ffffff808902e880 x4 : 0000000000000000 x3 : ffffff80ff759fc0
> >>>>>> x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffffff80ff759fc0
> >>>>>> Kernel panic - not syncing: Asynchronous SError Interrupt
> >>>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
> >>>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
> >>>>>> Call trace:
> >>>>>>   dump_backtrace.part.0+0xbc/0xe4
> >>>>>>   show_stack+0x24/0x70
> >>>>>>   dump_stack_lvl+0x68/0x84
> >>>>>>   dump_stack+0x18/0x34
> >>>>>>   panic+0x14c/0x32c
> >>>>>>   nmi_panic+0x58/0x7c
> >>>>>>   arm64_serror_panic+0x78/0x84
> >>>>>>   do_serror+0x40/0x64
> >>>>>>   el1h_64_error_handler+0x30/0x48
> >>>>>>   el1h_64_error+0x68/0x6c
> >>>>>>   __cmpxchg_case_acq_32+0x14/0x2c
> >>>>>>   _raw_spin_lock_irqsave+0x38/0x4c
> >
> > You know, after re-reading the trace, I could not help but notice that
> > the issue seems to be related to completion/timer/spinlock memory
> > becoming unavailable rather than disabling the main link clock.
> > See, the SError comes in the spin_lock path, not during register read.
> >
> > Thus I think the commit message is a bit misleading.
> >
>
> No, this issue is due to unclocked access. Please check this part of the
> stack:

Well, if it were for the unlocked access, we would see SError on the
register access, wouldn't we? However in this case the SError comes
from the raw spinlock code.

>  >>>>>>   wait_for_completion_timeout+0x2c/0x54
>  >>>>>>   dp_ctrl_push_idle+0x40/0x88
>  >>>>>>   dp_bridge_disable+0x24/0x30
>  >>>>>>   drm_atomic_bridge_chain_disable+0x90/0xbc
>  >>>>>>   drm_atomic_helper_commit_modeset_disables+0x198/0x444
>  >>>>>>   msm_atomic_commit_tail+0x1d0/0x374
>  >>>>>>   commit_tail+0x80/0x108
>  >>>>>>   drm_atomic_helper_commit+0x118/0x11c
>  >>>>>>   drm_atomic_commit+0xb4/0xe0
>  >>>>>>   drm_client_modeset_commit_atomic+0x184/0x224
>  >>>>>>   drm_client_modeset_commit_locked+0x58/0x160
>  >>>>>>   drm_client_modeset_commit+0x3c/0x64
>
> > Can we please get a trace checking which calls were actually made for
> > the dp bridge and if the dp/dp->ctrl memory pointers are correct?
> >
> > I do not see the dp_display_disable() being called. Maybe I just missed
> > the call.
> >
>
> Yes it is called, please refer to the above part of the stack that I
> have pasted.

The stacktrace mentions dp_bridge_disable(), not dp_display_disable()
(which I asked for).

-- 
With best wishes
Dmitry
