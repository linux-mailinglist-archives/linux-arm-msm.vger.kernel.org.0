Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DAD48BBB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 01:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbiALAQJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 19:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbiALAQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 19:16:09 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAC9C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 16:16:09 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id c10so1223280qte.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 16:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2K2UmC0bP9JvpFDK04lp6Br3RCH+4+xuKKLFFxC44Qc=;
        b=sLhDfmerJHymKuwC7MWW1onmvUqyDBSn34sAbwLLErcQWF8noxHwCpo/NakwDUCgDV
         V9WiaRTnmMvkyWgtfPj2V/YcAY0R6Daoia5IQH6g7mRiA4p1vopMnVSvciq5spVz8JAf
         YKsfTFkynU+8VX37eu6RepnptK/1qnHQcwIrf4AiyrGh62iVWIZ6j/zXsHVXrN7O7+Bn
         smEyb3bl9+CcTiMJ6mUoiHIt4D9dPdSOj1AY/bYV6Wdx39Wus2QCTaAhGEuIa0iTHmaa
         i0IWDD+olVn2CTIczv8t1P1NbTewRParDs92hvEzvlunWzLWxt3ux7ejwa9fCY8NdZX/
         bmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2K2UmC0bP9JvpFDK04lp6Br3RCH+4+xuKKLFFxC44Qc=;
        b=ixtBS6h8p9aXeSVcNtCAvyS7ypSEHII96Cwc7kHkhtSX4HATM5MN2M67HlmaQi+wSH
         rX7iCTd3sHIfNN9Rgo2n553vER/AtkrZaFDZF03u8Ry1ExbiQ6p4cGQJ5PD1a8nqtT55
         lmKPC0aOvjyEaqra0+W6wquKySkiKJzD6xz3qdWzjaeCGo6HU9HDvtUEWnUg4dW124En
         dW1HmLkaNP1HnmqRomXVhYPlb36M9OpXV+UTTjtDDh5OLy3EToOxBKmC3QK985BivtSW
         NRWVcKr8efzySxlfy72gEbJlDjPkYcpXGi0PZFBBabMBTQypUtf1f/P8/kGZ2r2jemLw
         Cq4A==
X-Gm-Message-State: AOAM532tjqDbNzFAVVkz5gWxuHvmp//r1B+BNvoK/qNpnswumBv+Y1Gk
        Gy+fn9iWy+da+/uzxfM72ALjpUXE75e6z13WJnY0ky2hegfqHQ==
X-Google-Smtp-Source: ABdhPJxeYcI0NBlx89MzlrVr8mcH9E/Ufg76NQoVax/bIpVFJaWuKzmekEyAayfuCtRsQhCzGgo8AUvs9kFVgykkrDo=
X-Received: by 2002:a05:622a:11d4:: with SMTP id n20mr5762816qtk.295.1641946568545;
 Tue, 11 Jan 2022 16:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org> <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
 <a97cec56-5a8d-2b92-2850-af2a6d3fbf09@linaro.org> <7ce0750b-2e0a-1036-f156-3cc8212e6099@quicinc.com>
In-Reply-To: <7ce0750b-2e0a-1036-f156-3cc8212e6099@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 12 Jan 2022 03:15:57 +0300
Message-ID: <CAA8EJpoy-qY9xE5dQReWuk09jojLxs-VddX9GwmqmC-Rdx-PCg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP encoder
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jan 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/6/2022 9:26 PM, Dmitry Baryshkov wrote:
> > On 07/01/2022 06:42, Stephen Boyd wrote:
> >> Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
> >>> Currently DP driver will allocate panel bridge for eDP panels.
> >>> Simplify this code to just check if there is any next bridge in the
> >>> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> >>> field to next_bridge accordingly.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
> >>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
> >>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
> >>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
> >>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
> >>>   5 files changed, 13 insertions(+), 23 deletions(-)
> >>
> >> I like this one, it certainly makes it easier to understand.
> >>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> b/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> index a7acc23f742b..5de21f3d0812 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser
> >>> *parser, int connector_type)
> >>>          if (rc)
> >>>                  return rc;
> >>>
> >>> -       if (connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> >>
> >> It feels like this is on purpose, but I don't see any comment so I hav=
e
> >> no idea. I think qcom folks are concerned about changing how not eDP
> >> works. I'll have to test it out locally.
> >
> > Ah, another thing that should go into the commit message.
> >
> > Current situation:
> > - DP: no external bridges supported.
> > - eDP: only a drm_panel wrapped into the panel bridge
> >
> > After this patch:
> > - both DP and eDP support any chain of bridges attached.
> >
> >
> > While the change means nothing for the DP (IIUC, it will not have any
> > bridges), it simplifies the code path, lowering the amount of checks.
> >
> > And for eDP this means that we can attach any eDP-to-something bridges
> > (e.g. NXP PTN3460).
> >
> >
> > Well... After re-checking the source code for
> > devm_drm_of_get_bridge/drm_of_find_panel_or_bridge I should probably
> > revert removal of the check. The function will return -ENODEV if
> > neither bridge nor panel are specified.
> >
> I am new to drm and  confusing with bridge here.
>
> Isn't bridge used to bridging two different kind of interface together?
>
> for example, dsi <--> bridge <--> dp.
>
> why edp need bridge here?
>
> Can you give me more info regrading what bridge try to do here.

First, there are bridges converting the eDP interface to another
interface. The mentioned NXP PTN3460 converts (embedded) DisplayPort
to LVDS.

Second (and this is the case here) drm_bridge can be used to wrap
drm_panel (panel-bridge), so that the driver doesn't have to care
about the drm_panel interface.

Last, but not least, external display connectors can also be
abstracted as bridges (see display-connector.c).

This becomes even more appealing as the driver can then switch to
drm_bridge_connector, supporting any kinds of pipelines attached to
the encoder, supporting any kind of converters, panel or external
connector pipelines.Think about the following (sometimes crazy, but
possible) examples. With
drm_bridge/panel-bridge/display-connector/drm_bridge_connector there
is no difference for the driver at all:
- DP encoder =E2=87=92 DP port =E2=87=92 DP monitor
- DP encoder =E2=87=92 DP connector supporting generic GPIO as HPD =E2=87=
=92 DP port =E2=87=92
DP monitor
- eDP encoder =E2=87=92 eDP panel
- eDP encoder =E2=87=92 ptn3460 =E2=87=92 fixed LVDS panel
- eDP encoder =E2=87=92 ptn3460 =E2=87=92 LVDS connector with EDID lines fo=
r panel autodetect
- eDP encoder =E2=87=92 ptn3460 =E2=87=92 THC63LVD1024 =E2=87=92 DPI panel.
- eDP encoder =E2=87=92 LT8912 =E2=87=92 DSI panel

> >>
> >>> -               rc =3D dp_parser_find_panel(parser);
> >>> -               if (rc)
> >>> -                       return rc;
> >>> -       }
> >>> +       rc =3D dp_parser_find_next_bridge(parser);
> >>> +       if (rc)
> >>> +               return rc;
> >>>
> >>>          /* Map the corresponding regulator information according to
> >>>           * version. Currently, since we only have one supported
> >>> platform,
> >
> >



--=20
With best wishes
Dmitry
