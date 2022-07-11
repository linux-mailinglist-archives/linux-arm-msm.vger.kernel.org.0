Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFE856D6CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 09:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiGKH3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 03:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiGKH3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 03:29:31 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0972716582
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:29:30 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id a21so5163742qtw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vn9RnGOLMiTjJq2R61BybdGrozv2mqJxAh2DpK7q6tQ=;
        b=tWwSOiaN4TprmmHVh9rGZZCc2LadOLcC7C/vFVx6N7kvE9yQX5Z9g3NYB5ZwPtmRkO
         5qDuorpXM0XkWBFVrbP/Ai2gGR25Gww+hzZQ+KW2I7S2QqrH1NjmPa/0Nzwg1bpU+5XL
         4gzGxUY6qA1ZSdkCZNuc8jcqWy44saqUVSLL33qKPXR2ux041OCfW720km7Rj4uM9mAI
         odBhA/Kdn6zT9ShElii+c3EzMWYFac7EXZ6ueNl88UU7pCqrGBOeTESxbSlBHV7C7IOH
         PZAi3pKCIc+lb33UGU4ncl9j93wOm9AeZBoG40qqqX1yio+jpPjjjafT4zhpvqc984vb
         JM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vn9RnGOLMiTjJq2R61BybdGrozv2mqJxAh2DpK7q6tQ=;
        b=h+0evdpX3xckXy9J97as35ZNMiybrwPo6pTIm1ti9CF1TPjL7SLoLCPqrqb3x4AWya
         i3qujPjx06wWmGgN4dSQwC+gZvrqZv0WP1GP2ChccmOM6IiXow29E4JQNUOH+R9DKwk0
         PIjoRRh3dlVmhN38fX2pxBwIiPcu5+SuoUk4K1/0Z1Vrox8xGOVFCZkZVz1x4Gv/r8yx
         tVOv03/TiBFdFswGfuDlRnzSFobqeaj/4BCqYRa4ZO2Bc0QwqUnVqGP9xN1abgK9/2i+
         IMjUwFKiRMuy4vOCUlCoC66cJ+gzEjvN35CXq/98UdU1GJW2RFtMWPGr3cV2/pHjNV8G
         QIIw==
X-Gm-Message-State: AJIora/jOj9U4aXKc+GXF+f7DZVYD2qEw1+YAwqAmtJyiYMqytW1rUAw
        cQL9XqTPI6O8w6rWUiqcYimc4wMoeP7R/CaC1PzvjA==
X-Google-Smtp-Source: AGRyM1tQhMOlFA4dzCEZxBWibccQVLVlffa7HebJhI4b8ogv/f/fDbItnpLk1YzxgoCFEnSET9X88SV6zp0S2C6v7BU=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr12575411qtx.370.1657524568595; Mon, 11
 Jul 2022 00:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-2-dmitry.baryshkov@linaro.org> <YssivkHHpKFhw3cr@ravnborg.org>
In-Reply-To: <YssivkHHpKFhw3cr@ravnborg.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 10:29:17 +0300
Message-ID: <CAA8EJppwg54N4HPDSFCgUA_5kpxxOm7wh0eCZWZ0wKCjv=5pkg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to atomic ops
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
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

On Sun, 10 Jul 2022 at 22:04, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry,
>
> On Sun, Jul 10, 2022 at 09:45:34PM +0300, Dmitry Baryshkov wrote:
> > Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
> > / atomic_post_disable rather than their non-atomic versions.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> a more or less identical patch was applied to drm-misc-next
> the other day.
> See d8b599bf625d1d818fdbb322a272fd2a5ea32e38.

Ugh, thanks for pointing this out.

>
>         Sam
>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 8cad662de9bb..01171547f638 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> >       return MODE_OK;
> >  }
> >
> > -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                     struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >
> > @@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
> >       return ret;
> >  }
> >
> > -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                    struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >       const char *last_err_str = "No supported DP rate";
> > @@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >                          VSTREAM_ENABLE);
> >  }
> >
> > -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >
> > @@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> >       usleep_range(100, 110);
> >  }
> >
> > -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > +                                          struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >
> > @@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> >       .mode_valid = ti_sn_bridge_mode_valid,
> > -     .pre_enable = ti_sn_bridge_pre_enable,
> > -     .enable = ti_sn_bridge_enable,
> > -     .disable = ti_sn_bridge_disable,
> > -     .post_disable = ti_sn_bridge_post_disable,
> > +     .atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> > +     .atomic_enable = ti_sn_bridge_atomic_enable,
> > +     .atomic_disable = ti_sn_bridge_atomic_disable,
> > +     .atomic_post_disable = ti_sn_bridge_atomic_post_disable,
> >  };
> >
> >  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > --
> > 2.35.1



-- 
With best wishes
Dmitry
