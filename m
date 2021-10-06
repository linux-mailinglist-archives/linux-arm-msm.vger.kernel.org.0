Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E3F423718
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 06:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJFE2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 00:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJFE2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 00:28:16 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5BFC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 21:26:24 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so1554307ota.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 21:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lpo3jySHVpuECP223gucHzK6qPCa78lLyTG8fTbUCo0=;
        b=ThymPaq4pAQseP8pjGIzPhYU0jBZgINzCAXU+02yprRKuRVcVnntiVBge5fbOfF1RF
         W8kxfZqaNE8gFDoJPaGn802Vgto0JPchR2hb+G8Q5ANj+OaO6mji9CvK6kyTxeimq/TW
         b00JBCvRa9213DYDkviCzfF9Un4myvLxKzxB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lpo3jySHVpuECP223gucHzK6qPCa78lLyTG8fTbUCo0=;
        b=lCXIRB//0sC6TD83XR74x8hcH+iy97hCwVIklFvnHzoHdUzpII/EcqWIZaOKwgs+jr
         vntRukHHSyQj/R32TKcCP+C1eiiZ/H7hTVUM9JNVo7NRPEMVcTQ/mBQoFJttaSnzXNJ7
         HYZtg2+yStroieykD6m1T4kDGf9pMKWnA27c5lcPy7VJy23548btV/dHkKZ0JHupfaJj
         hVOt3IB4w9Idf50PKWQY+5DNW6vr+thB/0U3uHayEmnjYnS+QSBPosJ1DR++SmvDbYCb
         8D6v0zS6okklYz69fv5ExFqgiAQSQPy3jZXHJTwGp47NMq3Ke3nRjaCQfuhxCOb6pxGu
         F6rA==
X-Gm-Message-State: AOAM531baCJrISD8JCefFI2Z9ngvjOiYAtSTLM09MGrrCwRTyxoFGLi6
        rEWhaK/EUDWtRO8zBEh+bCom9HH0MFoeeECO0Wo3eA==
X-Google-Smtp-Source: ABdhPJyqbzfyuJgjhBaq32N9NwF+pauRq+8vq/c8zppXAuy0EqIE7jhu1C7daYuBbpWdAykWQtLHt93NS0DMt6rPzcA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr18218054otn.126.1633494383457;
 Tue, 05 Oct 2021 21:26:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 21:26:22 -0700
MIME-Version: 1.0
In-Reply-To: <YV0MAF/Y5BR1e6My@ripper>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org> <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper> <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 21:26:22 -0700
Message-ID: <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
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

Quoting Bjorn Andersson (2021-10-05 19:37:52)
> On Tue 05 Oct 19:06 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-05 18:43:16)
> > > On Tue 05 Oct 17:43 PDT 2021, Stephen Boyd wrote:
> > >
> > > > Quoting Bjorn Andersson (2021-10-05 16:13:21)
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > index bdaf227f05dc..674cddfee5b0 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > > > >         if (!dp)
> > > > >                 return -ENOMEM;
> > > > >
> > > > > -       desc = dp_display_get_desc(pdev);
> > > > > +       desc = dp_display_get_desc(pdev, &dp->id);
> > > >
> > > > I'm sad that dp->id has to match the number in the SoC specific
> > > > dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > > still. Is there any way we can avoid that? Also, notice how those arrays
> > > > already have INTF_DP macros, which makes me think that it may be better
> > > > to connect this to those arrays instead of making an msm_dp_desc
> > > > structure and then make sure the 'type' member matches a connector
> > > > type number. Otherwise this code is super fragile.
> > > >
> > >
> > > I'm afraid I don't understand what you're proposing. Or which part you
> > > consider fragile, the indices of the INTF_DP instances aren't going to
> > > move around...
> > >
> > > I have N instances of the DP driver that I need to match to N entries
> > > from the platform specific intf array, I need some stable reference
> > > between them. When I started this journey I figured I could rely on the
> > > of_graph between the DPU and the interface controllers, but the values
> > > used there today are just bogus, so that was a no go.
> > >
> > > We can use whatever, as long as _dpu_kms_initialize_displayport() can
> > > come up with an identifier to put in h_tile_instance[0] so that
> > > dpu_encoder_setup_display() can find the relevant INTF.
> > >
> >
> > To make it more concrete we can look at sc7180
> >
> > static const struct dpu_intf_cfg sc7180_intf[] = {
> >         INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> > INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> >                                                      ^
> >                                                      |
> >
> > intf0 is irrelevant. Also the address is irrelevant. But here we have a
> > zero, the number after INTF_DP, and that is very relevant. That number
> > needs to match the dp->id. Somewhere we have a match between
> > controller_id and dp->id in the code.
>
> That number (the 0, not INTF_0) is what the code matches against dp->id
> in _dpu_kms_initialize_displayport(), in order to figure out that this
> is INTF_0 in dpu_encoder_setup_display().
>
> I.e. look at the sc8180x patch:
>
> INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>
> Where the DP driver defines the 3 controllers with dp->id of 0, 1 and 2,
> which the DPU code will match against to INTF_0, INTF_4 and INTF_5.
>

Yep. I'm saying that having to make that number in this intf array match
the order of the register mapping descriptor array is fragile. Why can't
we indicate the interface is DP or eDP with INTF_DP or INTF_EDP and then
map from the descriptor array to this intf array somehow so that the
order of the descriptor array doesn't matter? Then we don't have to put
the connector type in the descriptor array, and we don't have to keep
the order of the array a certain way to match this intf descriptor.

Maybe

	struct msm_dp_desc {
		phys_addr_t io_start;
		unsigned int id;
	};

and then have msm_dp_desc::id equal INTF_<N> and then look through the
intf from DPU here in the DP driver to find the id and type of connector
that should be used by default? Still sort of fragile because the only
connection is an unsigned int which isn't great, but at least it's
explicit instead of implicit based on the array order.
