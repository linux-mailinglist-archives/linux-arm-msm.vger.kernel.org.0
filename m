Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802801C615F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 21:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgEETxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 15:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726350AbgEETxC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 15:53:02 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEB3C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 12:53:01 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t40so55802pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+v3yXRYBdTDl2IQ3cSUD9x3QkNmu1c3yvGjn11hkD6o=;
        b=eXgdwU2TBfQdWavLRxs2y5/iRl3vmiwWS6NswNs0wL9cavsvf9xF6/lQ0oqivf3eA4
         qkDuUL3Kg4nxS/2JKNla7YdZrhClL1oUid/Bd+bMalzTGF3r0tTUlFQBtnukDRxqHtbk
         H4gEpbvEJKHX+bfTUSkJ7ShyvrTMs/IpePiqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+v3yXRYBdTDl2IQ3cSUD9x3QkNmu1c3yvGjn11hkD6o=;
        b=UaudIVPqnXKJr84MZa9tP+hyXzF+qTRbR+PCpvk5oKH5NZuTSxUBbRR7/FqEqWdVeL
         EaEJxCTVJ+Dq5iRSMJP+ao5DM3lDcweKlCAVmp7XVahtHCwqGPf1A/4DLQqQc+gSvMFb
         0rq51GjMOrFUnLa3aEiJ0iT9gg8DsKLm4HcnVuekpvJQz9L//XZw3FRiV7WA6RfqZCo3
         fo4iZQ7wCtsyd9Ezydo4RGtvOQnyQDQxsFKvxTTMrmylhnKFKjt6oFo+8YsqgrUpuXPM
         HonisgRauYg4NARI3Mr/S/Hfjl9/CL7VgnZWXVMho1amcZDEGcm4tg0LadWZI18crEDk
         Y2+Q==
X-Gm-Message-State: AGi0PuaLbNBtuiupofJnl96+okdX1ztmpX0g1kTZOwLMDAltMlQ24GAw
        CSoD3Kz3IBauxeCAFCEYTuzw4Q==
X-Google-Smtp-Source: APiQypIvJmxfC6YfB9qaWpknOl3wjvxDysY0VfmXMU+FrQLXWMy/7r1rrON3iWj84bN6y2eYj6M4lw==
X-Received: by 2002:a17:90a:d0c3:: with SMTP id y3mr5001545pjw.25.1588708380549;
        Tue, 05 May 2020 12:53:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r78sm2678084pfr.10.2020.05.05.12.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:52:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=Uq6K95FBkKYn=M6+7cfyam11n_f-9AMxosmDBZQYfmsQ@mail.gmail.com>
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid> <158865745768.11125.12003632060774071567@swboyd.mtv.corp.google.com> <CAD=FV=Uq6K95FBkKYn=M6+7cfyam11n_f-9AMxosmDBZQYfmsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Tue, 05 May 2020 12:52:58 -0700
Message-ID: <158870837878.26370.13953763070282841423@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-05-05 11:45:05)
> On Mon, May 4, 2020 at 10:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Douglas Anderson (2020-05-04 21:36:31)
> > >         regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
> > >                            CHA_DSI_LANES_MASK, val);
> > >
> > > +       regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assig=
n);
> > > +       regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_=
MASK,
> > > +                          pdata->ln_polrs << LN_POLRS_OFFSET);
> > > +
> > >         /* set dsi clk frequency value */
> > >         ti_sn_bridge_set_dsi_rate(pdata);
> > >
> > > @@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct =
ti_sn_bridge *pdata)
> > >         return ret;
> > >  }
> > >
> > > +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> > > +                                    struct device_node *np)
> > > +{
> > > +       u32 lane_assignments[SN_MAX_DP_LANES] =3D { 0, 1, 2, 3 };
> > > +       u32 lane_polarities[SN_MAX_DP_LANES] =3D { };
> > > +       struct device_node *endpoint;
> > > +       u8 ln_assign =3D 0;
> > > +       u8 ln_polrs =3D 0;
> >
> > Do we need to assign to 0 to start? Seems like no?
>=20
> Yes.  See usage:
>=20
>   ln_assign =3D ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
>   ln_polrs =3D ln_polrs << 1 | lane_polarities[i];
>=20
> Notably each time we shift a new bit in we base on the old value.  If
> you think it'll make it clearer, I can put this initialization at the
> beginning of the loop.  It's 2 extra lines of code but if it adds
> clarity I'll do it.

No it doesn't really make it any clearer.
