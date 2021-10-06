Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0374243AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 19:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJFRHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 13:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhJFRHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 13:07:30 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB82C061753
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 10:05:38 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 24so5051705oix.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a4URSTGZjx+2c7BWZRnuOrjl6WmKin13RZAsMibF1iQ=;
        b=ypUFa5NHFyoIff9jLaFvHEWDJcyh88kUl2DpedE1BCHU4qP9PpUYpsjWfOO3nyKDEr
         910KtvY1PIx659HOC+xv0b3eiyqaFZxFohQd5O7hKVxVmyX/ylJLDQ3ZV0wrYf7OWJnJ
         mI+gSsbQN1Tbvkx3U1i27YTE+gm9N9LvVFD7A77QMt970OwtOSK7jisxelTxRytBl8E/
         nR4Y5QLWn9+rDz0ABMZq0jH1BoSXcS97c+fOyggzAB8UqmZqXm0ruJnCmS2YPUiEdU3I
         mAqETz7HrcVQYh+Q3t6RpswTJuplpBbT+i5J3EgJr1n0xUPb8/RIewuOPNHz+qKzRkVh
         V7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a4URSTGZjx+2c7BWZRnuOrjl6WmKin13RZAsMibF1iQ=;
        b=ps9ttSKJ1FGBmHFKwNP7wryf0Ar3IoshPTe+48TMDSpp/Me5S3c3oLdaSm8H7coG+q
         Q4L6g50FhMvEHuEbB+6vpeYLsa1enXq5Tc78VOS617Vm7AX4ezYjwTTdIrRR937FDlvh
         yGWf+Fx/kWsDnpC+ZFTKGoa+lO33zAem5e0d+00EXHDZifytI6jA8djQgrHhvPsDUW92
         gIR0zhgJi3Cfw/HmqgDsWkA0BTCtv/kqpw3ycFNYTw1nQx6odbTUgLukSeM77EpuoHqn
         mydSh7ulovd7yN/fXO8+EQmdm8fYhjkNxfHfm1bSXRvH3gx6jlfP8n4ua7p0hqTz9FPZ
         723g==
X-Gm-Message-State: AOAM533Bna5XjvgYcVXruDY8UxWlt3Yyc0L8mlvK5ylGYn8xdGi5GPxh
        U/EOWCZrzQr+BkuOj+wqljzFyw==
X-Google-Smtp-Source: ABdhPJxKavagNGJEQGO7lorkHNv+5b7excmxoXkn3jywxwdBrb+D1ma68G3DXIWRqf5eA5OoPQkpDw==
X-Received: by 2002:a05:6808:58:: with SMTP id v24mr8424513oic.144.1633539937479;
        Wed, 06 Oct 2021 10:05:37 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id x34sm4243945ott.52.2021.10.06.10.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 10:05:36 -0700 (PDT)
Date:   Wed, 6 Oct 2021 10:07:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
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
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
Message-ID: <YV3XxadYE/KU2w89@ripper>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org>
 <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
 <YVz/NOL3AFn2zBA0@ripper>
 <CAE-0n513cs282Dh_YFMHK2uKCVFSWxtNyfRaFwWGyUvpfShixw@mail.gmail.com>
 <YV0MAF/Y5BR1e6My@ripper>
 <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53TwEyycpAaWVpRUKPpos4z-gqwrvyUdgobh1V88VUsXg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 21:26 PDT 2021, Stephen Boyd wrote:

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
> 
> Maybe
> 
> 	struct msm_dp_desc {
> 		phys_addr_t io_start;
> 		unsigned int id;

The INTF_<N> constants are a property of the DPU driver and not
available in the DP driver and the msm_dp struct is a property of the DP
driver and can't be dereferenced in the DPU driver.

The proposed way around this is that the descs array defines the order
in priv->dp[N] and this N is used as controller_id.


So the only thing that I don't find straight forward here is that the
eDP controller is considered just a DP controller, so you have to use
INTF_DP, <N> for that, and not just INTF_EDP, 0.

> 	};
> 
> and then have msm_dp_desc::id equal INTF_<N> and then look through the
> intf from DPU here in the DP driver to find the id and type of connector
> that should be used by default? Still sort of fragile because the only
> connection is an unsigned int which isn't great, but at least it's
> explicit instead of implicit based on the array order.

No matter how I look at this, you need to put some number somewhere here
that will be used to match up the INTF with the right DSI/DP encoder.

Using the proposed number scheme follows the numbering of all the DP
controllers from the documentation.

Regards,
Bjorn
