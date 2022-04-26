Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71255101C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 17:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242031AbiDZPY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 11:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352357AbiDZPX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 11:23:59 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14C73BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 08:20:50 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i19so5094917eja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FxMfS7UIDPB0BqIdG4SF2VXJUvIqt1cCgiROpOYupQQ=;
        b=RTHK8Xrvu2zrmhQ76xjVUP8c1fGwlKC/cxCYm2FsdZSD40LDLIhuOUrWvCl5YnWaNz
         8Eqsf21NxZAPSLBp9I1YCDU2fNZLN+rKXaurzXnOUckXluuipBSgy4ONvHCtb3RUKYc/
         S0UzFODdYjDIXksbpQwZyJvGCs92gQK/iWdJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxMfS7UIDPB0BqIdG4SF2VXJUvIqt1cCgiROpOYupQQ=;
        b=GWg8i9MooQRF6Xj5ye00x8+yws3YgN0L6qlx3Ub35M6MpNFBkaBG1/Tn7UFaNzrlxn
         YkHUXlVsGhFYbZxXSAnxv8g3IB38PCMwRr+28soW2C1SQ4hdusTI6SdbE6CG5wKD4lIg
         gpNaUZ4YGFofdAFol8oba35KYTMoo6K5TIsJlvDoxd55R5xMHJC1e65O0LjnzhzF3ZRT
         O/uBJ371GOJlgw9RdvWQ4SyOyEdE/kcZ7hXfvW6cAxljQiy/uP7wqk3STvfg8ytBkEcn
         8DP6869VqnQSWV8Pw3RKIVI5h3HRdTmPWsQ9VzXzXsttdDKWteQ6Rxcnw5gwsR3jzPt3
         TmMA==
X-Gm-Message-State: AOAM53102yjGvwsmKd8bN8LgBneqaqvq9ih0pvH7+ga2G+JzLB5BOzRv
        pkxjMuB2Q+YGOYGHadoRWXHffeCfMKjhe2PV
X-Google-Smtp-Source: ABdhPJxt+dvXQDG4MmWvTLokVxV0sOSqsiYhq+AWhc2qZzx+QtW/5AwmcapdzrwCxjwRz11v+J0sLg==
X-Received: by 2002:a17:906:699:b0:6f3:a7a3:d3 with SMTP id u25-20020a170906069900b006f3a7a300d3mr5948611ejb.650.1650986448092;
        Tue, 26 Apr 2022 08:20:48 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id k12-20020a50cb8c000000b00425fc01cf10sm1325204edi.9.2022.04.26.08.20.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:20:46 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso1719760wme.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 08:20:46 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr21699787wmb.199.1650986446015; Tue, 26
 Apr 2022 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org> <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com> <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com> <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
 <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com>
In-Reply-To: <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 Apr 2022 08:20:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2WPdiY2zq6JC_-10kOqzDuiUYQOdYbyRyw2k-fbXFXQ@mail.gmail.com>
Message-ID: <CAD=FV=W2WPdiY2zq6JC_-10kOqzDuiUYQOdYbyRyw2k-fbXFXQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to dp_connector_get_mode()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
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

On Mon, Apr 25, 2022 at 8:35 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On 4/25/2022 7:18 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Apr 25, 2022 at 6:42 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>>> 2) When there was a valid EDID but no 640x480 mode
> >>>>
> >>>> This is the equipment specific case and the one even I was a bit
> >>>> surprised. There is a DP compliance equipment we have in-house and while
> >>>> validation, it was found that in its list of modes , it did not have any
> >>>> modes which chromebook supported ( due to 2 lanes ). But my
> >>>> understanding was that, all sinks should have atleast 640x480 but
> >>>> apparently this one did not have that. So to handle this DP compliance
> >>>> equipment behavior, we had to do this.
> >>>
> >>> That doesn't seem right. If there's a valid EDID and the valid EDID
> >>> doesn't contain 640x480, are you _sure_ you're supposed to be adding
> >>> 640x480? That doesn't sound right to me. I've got a tiny display in
> >>> front of me for testing that only has one mode:
> >>>
> >>>     #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
> >>>
> >>
> >> As I had wrote, DRM core kicks in only when the count of modes is 0.
> >> Here what is happening is the count was not 0 but 640x480 was not
> >> present in the EDID. So we had to add it explicitly.
> >>
> >> Your tiny display is a display port display?
> >>
> >> I am referring to only display port monitors. If your tiny display is
> >> DP, it should have had 640x480 in its list of modes.
> >
> > My tiny display is actually a HDMI display hooked up to a HDMI to DP
> > (active) adapter.
> >
> > ...but this is a legal and common thing to have. I suppose possibly my
> > HDMI display is "illegal"?
> >
> > OK, so reading through the spec more carefully, I do see that the DP
> > spec makes numerous mentions of the fact that DP sinks _must_ support
> > 640x480. Even going back to DP 1.4, I see section "5.2.1.2 Video
> > Timing Format" says that we must support 640x480. It seems like that's
> > _intended_ to be used only if the EDID read fails, though or if we
> > somehow have to output video without knowledge of the EDID. It seems
> > hard to believe that there's a great reason to assume a display will
> > support 640x480 if we have more accurate knowledge.
> >
> > In any case, I guess I would still say that adding this mode belongs
> > in the DRM core. The core should notice that it's a DP connection
> > (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) and that 640x480 was
> > left out and it should add it. We should also make sure it's not
> > "preferred" and is last in the list so we never accidentally pick it.
> > If DP truly says that we should always give the user 640x480 then
> > that's true for everyone, not just Qualcomm. We should add it in the
> > core. If, later, someone wants to hide this from the UI it would be
> > much easier if they only needed to modify one place.
> >
>
> So I debugged with kuogee just now using the DP compliance equipment.
> It turns out, the issue is not that 640x480 mode is not present.
>
> The issue is that it is not marked as preferred.
>
> Hence we missed this part during debugging this equipment failure.
>
> We still have to figure out the best way to either mark 640x480 as
> preferred or eliminate other modes during the test-case so that 640x480
> is actually picked by usermode.
>
> Now that being said, the fix still doesn't belong in the framework. It
> has to be in the msm/dp code.
>
> Different vendors handle this failure case differently looks like.
>
> Lets take below snippet from i915 as example.
>
> 3361    if (intel_connector->detect_edid == NULL ||
> 3362        connector->edid_corrupt ||
> 3363        intel_dp->aux.i2c_defer_count > 6) {
> 3364            /* Check EDID read for NACKs, DEFERs and corruption
> 3365             * (DP CTS 1.2 Core r1.1)
> 3366             *    4.2.2.4 : Failed EDID read, I2C_NAK
> 3367             *    4.2.2.5 : Failed EDID read, I2C_DEFER
> 3368             *    4.2.2.6 : EDID corruption detected
> 3369             * Use failsafe mode for all cases
> 3370             */
> 3371            if (intel_dp->aux.i2c_nack_count > 0 ||
> 3372                    intel_dp->aux.i2c_defer_count > 0)
> 3373                    drm_dbg_kms(&i915->drm,
> 3374                                "EDID read had %d NACKs, %d DEFERs\n",
> 3375                                intel_dp->aux.i2c_nack_count,
> 3376                                intel_dp->aux.i2c_defer_count);
> 3377            intel_dp->compliance.test_data.edid = INTEL_DP_RESOLUTION_FAILSAFE;

Just because Intel DRM has its own solution for something doesn't mean
everyone else should copy them and implement their own solution. Up
until recently DP AUX backlights were baked into different DRM
drivers. A recent effort was made to pull it out. I think the Intel
DRM code was the "first one" to the party and it wasn't clear how
things should be broken up to share with other drivers, so mostly it
did everything itself, but that's not the long term answer.

I'm not saying that we need to block your change on a full re-design
or anything, but I'm just saying that:

* You're trying to implement a generic DP rule, not something specific
to Qualcomm hardware. That implies that, if possible, it shouldn't be
in a Qualcomm driver.

* It doesn't seem like it would be terrible to handle this in the core.


> This marks the fail safe mode and IGT test case reads this to set this
> mode and hence the test passes.
>
> We rely on the chromeOS usermode to output pixel data for this test-case
> and not IGT. We use IGT only for video pattern CTS today but this is a
> different test-case which is failing.
>
> ChromeOS usermode will not pick 640x480 unless we mark it as preferred
> or other modes are eliminated.
>
> So we have to come up with the right way for the usermode to pick 640x480.
>
> We will discuss this a bit more and come up with a different change.

Can you provide the exact EDID from the failing test case? Maybe that
will help shed some light on what's going on. I looked at the original
commit and it just referred to 4.2.2.1, which I assume is "EDID Read
upon HPD Plug Event", but that doesn't give details that seem relevant
to the discussion here.

I guess maybe what's happening is that the test case is giving an EDID
where all the modes are not supportable by the current clock rate /
lanes? ...and then somehow we're not falling back to 640x480. It's
always possible that this is a userspace problem.

In any case, would you object to a revert of the patches in the short term?

-Doug
