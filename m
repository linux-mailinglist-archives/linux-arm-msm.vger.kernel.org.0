Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF0B6A87D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 18:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjCBR0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 12:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCBR0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 12:26:06 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C94A24C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 09:26:01 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id s8so96037ilv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 09:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaTqYDyLafiZL0B3tSJBwk7qRC++RXXMoAq4jrwnI7o=;
        b=C826dozkSH2GhW7IjIMlV8In/06pLnzjwoHZB+d+h/IYrBwP0YZqr/fF9tgX08GhF6
         rZLr3jiUcxiSCRgDVaX+2PqjWd99zGCQLT+nq3vj5P/GQ08fy/JwwaElBZ9jHnBQM9qM
         6pjrbGtsEd/78qwHv5h9HrKcYWNVf/uZuGwW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaTqYDyLafiZL0B3tSJBwk7qRC++RXXMoAq4jrwnI7o=;
        b=Py9y/TD8Lu73W0PLCUQc7xehsCci2xWoEkiCthIjjzYbO0wVrQaZ9jduHPKdqX/aEZ
         YKC56W47R6Ytc87rlC2KRS+j/25607Ke8THX0OI1pAABUmEpX+RED4oUooKs7/OvjqAQ
         VntTrXPBxRo4+fs6HCnFcHUl2iKwYDey09qvDlLKPiNtdJBQHtYYIsAEKHJC0B81JVxP
         YX0KUgmOh4ey9FYl/3A5aw+OFbg+/PwxakIiN999LsaUVYvu9E+XEtoP+KxxZCm8WsG7
         QKd2aUs966vVd9iPiq7HrDjHB8oPbbEv4u9OD1ljiQNpClPAd9JDu/S2zmCSLFkacBFR
         lEwA==
X-Gm-Message-State: AO0yUKXWNaf6YlC9TCebxdl4sO/bBM487qO6UYqbc+cZviQiP3mkrYnN
        X5JuuAzn0H9mzbNr8qdUqM65Mh7EufVJme80
X-Google-Smtp-Source: AK7set8/9Z4uOtlXQMabycjxE+hYxAo46L+e7MihLuWT6aUZ3c5V0xIwILEfC2duJW+k4Ez/JCjxUA==
X-Received: by 2002:a05:6e02:1d1b:b0:315:586a:c123 with SMTP id i27-20020a056e021d1b00b00315586ac123mr8859709ila.14.1677777960507;
        Thu, 02 Mar 2023 09:26:00 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id u19-20020a02aa93000000b003e4a3c070adsm11286jai.133.2023.03.02.09.25.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 09:25:59 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id i12so115482ila.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 09:25:59 -0800 (PST)
X-Received: by 2002:a92:a005:0:b0:316:ff39:6bbf with SMTP id
 e5-20020a92a005000000b00316ff396bbfmr4912637ili.6.1677777959145; Thu, 02 Mar
 2023 09:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
 <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com> <e077d60d-5881-1ccc-a17a-fbe64392e29d@linaro.org>
In-Reply-To: <e077d60d-5881-1ccc-a17a-fbe64392e29d@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Mar 2023 09:25:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W_FVUOD6T0Lx-JTqrqaP9gPgb4R-2TaSqKwkaBkqHJmQ@mail.gmail.com>
Message-ID: <CAD=FV=W_FVUOD6T0Lx-JTqrqaP9gPgb4R-2TaSqKwkaBkqHJmQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 27, 2023 at 5:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/02/2023 02:26, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Feb 1, 2023 at 1:51=E2=80=AFAM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> >>
> >> On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.org>=
 wrote:
> >>>
> >>> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> >>> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> >>> order"). This should allow us to revert commit ec7981e6c614
> >>> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> >>> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> >>> time").
> >>
> >> I see no reference in the TC358762 datasheet to requiring the DSI
> >> interface to be in any particular state.
> >> However, setting this flag does mean that the DSI host doesn't need to
> >> power up and down for each host_transfer request from
> >> tc358762_pre_enable/tc358762_init, so on that basis I'm good with it.
> >>
> >> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>> (no changes since v1)
> >>>
> >>>   drivers/gpu/drm/bridge/tc358762.c | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/brid=
ge/tc358762.c
> >>> index 0b6a28436885..77f7f7f54757 100644
> >>> --- a/drivers/gpu/drm/bridge/tc358762.c
> >>> +++ b/drivers/gpu/drm/bridge/tc358762.c
> >>> @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device =
*dsi)
> >>>          ctx->bridge.funcs =3D &tc358762_bridge_funcs;
> >>>          ctx->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
> >>>          ctx->bridge.of_node =3D dev->of_node;
> >>> +       ctx->bridge.pre_enable_prev_first =3D true;
> >>>
> >>>          drm_bridge_add(&ctx->bridge);
> >
> > Abhinav asked what the plan was for landing this [1]. Since this isn't
> > urgent, I guess the plan is to land patch #1 in drm-misc-next. Then we
> > sit and wait until it percolates into mainline and, once it does, then
> > patch #2 and #3 can land.
> >
> > Since I have Dave's review I can commit this to drm-misc-next myself.
> > My plan will be to wait until Thursday or Friday of this week (to give
> > people a bit of time to object) and then land patch #1. Then I'll
> > snooze things for a while and poke Abhinav and Dmitry to land patch #2
> > / #3 when I notice it in mainline. If, at any point, someone comes out
> > of the woodwork and yells that this is breaking them then, worst case,
> > we can revert.
>
> This plan sounds good to me.

Pushed to drm-misc-next:

55cac10739d5 drm/bridge: tc358762: Set pre_enable_prev_first

If my math is right then I'd expect that to get into mainline for
6.4-rc1. I guess that means it'll be in Linus's tree mid-May. I'll
schedule a reminder to suggest landing at patches #2 and #3 again in
late May.

-Doug
