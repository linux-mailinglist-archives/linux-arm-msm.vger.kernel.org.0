Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BE84237C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 08:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhJFGM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 02:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhJFGM2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 02:12:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A72CC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 23:10:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u18so5599227lfd.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 23:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3T+TGBencEJy/MKc2XUOgA2q8UY2iUX505rMJLcxVPU=;
        b=DSU2Xui7RKW2g87nUyIyZbNLWpR7VY0zb0Siqg3NgYzxfwWdIy6m0sv7Jkwa6m956a
         TPB8DUa9gv/n3Q8Qtf3GLCbR9qyw2Y3wp0t3/PEMvRTITDJfg+scIw/phYAPIxhqoMfI
         BViqRuZfh1US6E6i+9kkLB3CNvPsbJZThUmePt93eiyWHgw8S70HTAXkAGBkBnOoRp02
         RNi3zhl2alU2jklWChItxJcAFimg9fV54P82zS9OLGN9QJCFTIdDHqMALdose+mCyPbK
         8dQYWlprl/vtEnbQ7Y69XpScVZMU4K1w56M3XJzIzRGIHUl0sbeFNaXXicIfyFAVn8o9
         UBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3T+TGBencEJy/MKc2XUOgA2q8UY2iUX505rMJLcxVPU=;
        b=fEhD/DXQ+00jm8HIyQHigDEZRY0tUvwiOB4xMV2xNJkYxm3irdxLEzixsuCe4Gj1gT
         Do2w+yhAc0IJCpExEWrPIjL/yyOJh9i/aLZya+8lwTqwRvDKK3+OQUaj48Gcb/xDE7V8
         J11jYv/BFJyLJhVrQAYsXBOcYIomooAA8PTAoAuPDevscBVOXKz7VBsk5dMUkEyrB7FT
         eeEh0JassMg0TnR8EpDYNmv28FjaTJ3DpPBqqH1n7zP2pOGDrcJkjYZECZAnb/wiYr0A
         A95qZYWaxM32k5l4zM9EubSCxD2N9DWmGn7ztPzOeDmFtUH51lwypHa5i+6Xw8/D8t3g
         n3Sg==
X-Gm-Message-State: AOAM531gFmob66TKl9UWhA8SGr9Zqj+VU1jxULvX7ZHPMqLxSX2ETL5G
        lPLdn7Y1xSJLko/2vJb8wjiaGfLlv0bKRiUBay+PKg==
X-Google-Smtp-Source: ABdhPJzO+apCwef8cLQQwpcGjkrWqV+43TqdVlOY9h4HLN/9nOrH2qyRklw6CuHGeUoO1UwZorl+ezY3+UcwYEC1JFU=
X-Received: by 2002:a2e:bd0b:: with SMTP id n11mr26003927ljq.71.1633500634461;
 Tue, 05 Oct 2021 23:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org> <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper> <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper> <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
In-Reply-To: <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Oct 2021 09:10:22 +0300
Message-ID: <CAA8EJpou8ssBD2VGqfKKg43Gu031X-Bm+eirS_AL3Dr2AcdOJg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Oct 2021 at 07:26, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-10-05 19:37:52)
> > On Tue 05 Oct 19:06 PDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-10-05 18:43:16)
> > > > On Tue 05 Oct 17:43 PDT 2021, Stephen Boyd wrote:
> > > >
> > > > > Quoting Bjorn Andersson (2021-10-05 16:13:21)
> > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > index bdaf227f05dc..674cddfee5b0 100644
> > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > > > >         if (!dp)
> > > > > >                 return -ENOMEM;
> > > > > >
> > > > > > -       desc = dp_display_get_desc(pdev);
> > > > > > +       desc = dp_display_get_desc(pdev, &dp->id);
> > > > >
> > > > > I'm sad that dp->id has to match the number in the SoC specific
> > > > > dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > > still. Is there any way we can avoid that? Also, notice how those arrays
> > > > > already have INTF_DP macros, which makes me think that it may be better
> > > > > to connect this to those arrays instead of making an msm_dp_desc
> > > > > structure and then make sure the 'type' member matches a connector
> > > > > type number. Otherwise this code is super fragile.
> > > > >
> > > >
> > > > I'm afraid I don't understand what you're proposing. Or which part you
> > > > consider fragile, the indices of the INTF_DP instances aren't going to
> > > > move around...
> > > >
> > > > I have N instances of the DP driver that I need to match to N entries
> > > > from the platform specific intf array, I need some stable reference
> > > > between them. When I started this journey I figured I could rely on the
> > > > of_graph between the DPU and the interface controllers, but the values
> > > > used there today are just bogus, so that was a no go.
> > > >
> > > > We can use whatever, as long as _dpu_kms_initialize_displayport() can
> > > > come up with an identifier to put in h_tile_instance[0] so that
> > > > dpu_encoder_setup_display() can find the relevant INTF.
> > > >
> > >
> > > To make it more concrete we can look at sc7180
> > >
> > > static const struct dpu_intf_cfg sc7180_intf[] = {
> > >         INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> > > INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > >                                                      ^
> > >                                                      |
> > >
> > > intf0 is irrelevant. Also the address is irrelevant. But here we have a
> > > zero, the number after INTF_DP, and that is very relevant. That number
> > > needs to match the dp->id. Somewhere we have a match between
> > > controller_id and dp->id in the code.
> >
> > That number (the 0, not INTF_0) is what the code matches against dp->id
> > in _dpu_kms_initialize_displayport(), in order to figure out that this
> > is INTF_0 in dpu_encoder_setup_display().
> >
> > I.e. look at the sc8180x patch:
> >
> > INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> > INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> > INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> > /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> > INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> > INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> > INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> >
> > Where the DP driver defines the 3 controllers with dp->id of 0, 1 and 2,
> > which the DPU code will match against to INTF_0, INTF_4 and INTF_5.
> >
>
> Yep. I'm saying that having to make that number in this intf array match
> the order of the register mapping descriptor array is fragile. Why can't
> we indicate the interface is DP or eDP with INTF_DP or INTF_EDP and then
> map from the descriptor array to this intf array somehow so that the
> order of the descriptor array doesn't matter? Then we don't have to put
> the connector type in the descriptor array, and we don't have to keep
> the order of the array a certain way to match this intf descriptor.

The order of the descriptor array does not matter currently (or we do
not understand fully your concern).
The encoder is mapped to intf using type + controller_id (next field
after INTF_foo).
Also having the controller_id in the descs array allows us to simplify
DSI code (where DSI_0 is master and DSI_1 is slave, no matter which
INTF they are associated with).

Last, but not least, maybe I'd point you to one of the proposed
cleanup patches:
https://lore.kernel.org/linux-arm-msm/20210515225757.1989955-5-dmitry.baryshkov@linaro.org/
It removes one extra level of indirection in interface association.

>
> Maybe
>
>         struct msm_dp_desc {
>                 phys_addr_t io_start;
>                 unsigned int id;
>         };
>
> and then have msm_dp_desc::id equal INTF_<N> and then look through the
> intf from DPU here in the DP driver to find the id and type of connector
> that should be used by default? Still sort of fragile because the only
> connection is an unsigned int which isn't great, but at least it's
> explicit instead of implicit based on the array order.

It would move indirection, because we'd still have to map INTF_N <->
priv->dp[j].

-- 
With best wishes
Dmitry
