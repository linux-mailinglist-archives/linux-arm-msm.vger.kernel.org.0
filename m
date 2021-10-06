Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7E24243DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 19:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237843AbhJFRVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 13:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhJFRVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 13:21:02 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAF1C061753
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 10:19:10 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id n63so4990255oif.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KCyDxwCSIkYTEL945Ad8UN+jbcwXEwy+nElDO3WCm5U=;
        b=AcCQ3DwE27wRfzYEcoJxXVjW1mku4CvXcu9MdCy62Hr7YmeiYBzTQAy+8yMD6lGym5
         eAZ/c7o7r1QTE07j3X3gt7PBw7sa8SnF/8tetrqdJeIFscstW6KKcyY/pIXoyxmw0Klp
         laxBS6OFSIKVB/U6uSqU1mY6tQ7ijM0dubGHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KCyDxwCSIkYTEL945Ad8UN+jbcwXEwy+nElDO3WCm5U=;
        b=l8Yf1ONNFtM5uI2v/9UhUih4y+vyxRUFQ+lEXLhzWwxq3xxMDRntQMY6yYvna/1Bd7
         NpmkZYqb6tRAu0sL1hcBYT16Xi4mlKyk34QUlHNwwU9NfwXgTXc8KwbrVJWYwpTOZKne
         EAc6ti5j4qMF0KoWGzJkqzJI+p78O+We0Vi7VzEGJ8vQGKp2nqi60Ft2uWpsQAA1ZJ27
         1ckgT1lF8yR/HW87NSKwSPhRJ4fu/4vRDPQ7cG3IMiZ0VqhPPY5I8PwO+6QeMPJr5Wjg
         RtsVK773DHnyLtqHhCE416z3CbxuS71IarmevgpnG6ZOUnoa7uYG+Vi8v6RQ5CFvEdtQ
         jmuA==
X-Gm-Message-State: AOAM532jLRzZscUoGCKEhTnrFo18teXTIWkGgdNv3ton1CV0FxuhZAcP
        +no7TnXHzwXa7IJyXOe7eSRJ0QjIAb9NDHq7FSX1/w==
X-Google-Smtp-Source: ABdhPJxNO6XyURZRt8S9b/YCR45+rINmMoTOs7+TbO6eaAIXMDIrqSS/NDJZCbj4dbHEgxJbT9Y60pR/hVQnlL87xzc=
X-Received: by 2002:a05:6808:f8f:: with SMTP id o15mr8142802oiw.164.1633540749920;
 Wed, 06 Oct 2021 10:19:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Oct 2021 10:19:09 -0700
MIME-Version: 1.0
In-Reply-To: <YV3XxadYE/KU2w89@ripper>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org> <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper> <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper> <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
 <YV3XxadYE/KU2w89@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 6 Oct 2021 10:19:09 -0700
Message-ID: <CAE-0n52q=iEhRO1V-ked6SEesJGozLWv-H1mK81oyP7zAeO6QQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-06 10:07:17)
> On Tue 05 Oct 21:26 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-05 19:37:52)
> > > On Tue 05 Oct 19:06 PDT 2021, Stephen Boyd wrote:
> > >
> > > > Quoting Bjorn Andersson (2021-10-05 18:43:16)
> > > > > On Tue 05 Oct 17:43 PDT 2021, Stephen Boyd wrote:
> > > > >
> > > > > > Quoting Bjorn Andersson (2021-10-05 16:13:21)
> > > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > index bdaf227f05dc..674cddfee5b0 100644
> > > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > > > > >         if (!dp)
> > > > > > >                 return -ENOMEM;
> > > > > > >
> > > > > > > -       desc = dp_display_get_desc(pdev);
> > > > > > > +       desc = dp_display_get_desc(pdev, &dp->id);
> > > > > >
> > > > > > I'm sad that dp->id has to match the number in the SoC specific
> > > > > > dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > > still. Is there any way we can avoid that? Also, notice how those arrays
> > > > > > already have INTF_DP macros, which makes me think that it may be better
> > > > > > to connect this to those arrays instead of making an msm_dp_desc
> > > > > > structure and then make sure the 'type' member matches a connector
> > > > > > type number. Otherwise this code is super fragile.
> > > > > >
> > > > >
> > > > > I'm afraid I don't understand what you're proposing. Or which part you
> > > > > consider fragile, the indices of the INTF_DP instances aren't going to
> > > > > move around...
> > > > >
> > > > > I have N instances of the DP driver that I need to match to N entries
> > > > > from the platform specific intf array, I need some stable reference
> > > > > between them. When I started this journey I figured I could rely on the
> > > > > of_graph between the DPU and the interface controllers, but the values
> > > > > used there today are just bogus, so that was a no go.
> > > > >
> > > > > We can use whatever, as long as _dpu_kms_initialize_displayport() can
> > > > > come up with an identifier to put in h_tile_instance[0] so that
> > > > > dpu_encoder_setup_display() can find the relevant INTF.
> > > > >
> > > >
> > > > To make it more concrete we can look at sc7180
> > > >
> > > > static const struct dpu_intf_cfg sc7180_intf[] = {
> > > >         INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> > > > INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > >                                                      ^
> > > >                                                      |
> > > >
> > > > intf0 is irrelevant. Also the address is irrelevant. But here we have a
> > > > zero, the number after INTF_DP, and that is very relevant. That number
> > > > needs to match the dp->id. Somewhere we have a match between
> > > > controller_id and dp->id in the code.
> > >
> > > That number (the 0, not INTF_0) is what the code matches against dp->id
> > > in _dpu_kms_initialize_displayport(), in order to figure out that this
> > > is INTF_0 in dpu_encoder_setup_display().
> > >
> > > I.e. look at the sc8180x patch:
> > >
> > > INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > > INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > > INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > > /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > > INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > > INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > > INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> > >
> > > Where the DP driver defines the 3 controllers with dp->id of 0, 1 and 2,
> > > which the DPU code will match against to INTF_0, INTF_4 and INTF_5.
> > >
> >
> > Yep. I'm saying that having to make that number in this intf array match
> > the order of the register mapping descriptor array is fragile. Why can't
> > we indicate the interface is DP or eDP with INTF_DP or INTF_EDP and then
> > map from the descriptor array to this intf array somehow so that the
> > order of the descriptor array doesn't matter? Then we don't have to put
> > the connector type in the descriptor array, and we don't have to keep
> > the order of the array a certain way to match this intf descriptor.
> >
> > Maybe
> >
> >       struct msm_dp_desc {
> >               phys_addr_t io_start;
> >               unsigned int id;
>
> The INTF_<N> constants are a property of the DPU driver and not
> available in the DP driver and the msm_dp struct is a property of the DP
> driver and can't be dereferenced in the DPU driver.
>
> The proposed way around this is that the descs array defines the order
> in priv->dp[N] and this N is used as controller_id.

I'm pretty sure I'm following along.

>
> So the only thing that I don't find straight forward here is that the
> eDP controller is considered just a DP controller, so you have to use
> INTF_DP, <N> for that, and not just INTF_EDP, 0.
>
> >       };
> >
> > and then have msm_dp_desc::id equal INTF_<N> and then look through the
> > intf from DPU here in the DP driver to find the id and type of connector
> > that should be used by default? Still sort of fragile because the only
> > connection is an unsigned int which isn't great, but at least it's
> > explicit instead of implicit based on the array order.
>
> No matter how I look at this, you need to put some number somewhere here
> that will be used to match up the INTF with the right DSI/DP encoder.

Correct.

>
> Using the proposed number scheme follows the numbering of all the DP
> controllers from the documentation.
>

Maybe I can make a better example. I have this for sc7280 in dpu_hw_catalog.c:

	static const struct dpu_intf_cfg sc7280_intf[] = {
		INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, CONTROLLER_ID_A, 24,
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
		INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24,
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
		INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, CONTROLLER_ID_B, 24,
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
	};

And then this array for sc7280 in dp_display.c:

	static const struct msm_dp_desc sc7280_dp_cfg = {
		.desc = {
			[CONTROLLER_ID_A] = { 0xaea0000, DRM_MODE_CONNECTOR_eDP },
			[CONTROLLER_ID_B] = { 0xae90000, DRM_MODE_CONNECTOR_DisplayPort },
		},
		.num_dp = 2,
	};

So these two arrays must match based on CONTROLLER_ID_{A,B}. I don't
like having to make these two numbers match so if it was explicit, even
possibly by having a bunch of macros put in both places then I would be
happy. I spent a few hours when I messed up the order of the
sc7280_dp_cfg.desc array trying to figure out why things weren't
working.
