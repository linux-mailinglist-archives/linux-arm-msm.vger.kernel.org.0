Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6C34C36F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbiBXUmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbiBXUmP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:42:15 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0C03E5FB
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:41:43 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 8so5197058qvf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H05Y3LYtBgxoWVj/jCjKZTK8tkoARTjC7zIYUEF7hXg=;
        b=rGzP8ZW6JzEqNpAcW38f7TLAwAiVXCnnE2MMBITY+Um6ZI6YmUi+PgMETiPhhw3bzb
         lpzy7yzLNXnprCRH00fi7StBGnY4FV9E3pAB58TGDp8SBZcC0S/7TVE/fzEksPdwD6p0
         c2RGxDFDwi17lG4g817VnNfjsNU66Pc95qeJeg2WpkQ6I2DaX8sDHud7JRp+3Ul8RCr0
         Z4q7oKFLr9NtHDgrUFfADridvKWH0I9P/9lis3J2Q+SiVIQYUN0M9/EGtyMxwJhMsJFh
         EG3BNXCYo4bGUgzbb0tJgK9V3zDzk/NeghRqEA8aUAHDsOy4W2d/kf+RNGtmt1fwrn+S
         nAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H05Y3LYtBgxoWVj/jCjKZTK8tkoARTjC7zIYUEF7hXg=;
        b=tVN62x0zhads2/WRqQF21xofYItDjU3+vgIcDoqD9WnDoiphm8F79hQCVVJKcSduUU
         16E5Gwyx7WNsD17x0fZ7eSesLdEePej06hbq4bcLA2wkOernf5H77QQqIGvTcvInoiom
         t0sq1Otia+Hkd6Q5dupJ1IfoJ4pMFE5Rr08TUMkGAi+Y6UOOKVvqNQu4sHKPselOc8JJ
         BUwSgdJ0Dhz0Pq0ve9Fa0CeyTw/zXbrvLTzTyOEhtWALWals+ELFpBju8IIfa9LnNsxN
         u3Za1Tmwg9k4EJrL7nai+LDm5cXGoJ3Ol1zHhQCdmFJg7lZCngkrj2djfGUZg7kTO2ip
         QPSg==
X-Gm-Message-State: AOAM5300qkUSWfj6CO9bOI2+rV4pJVjZzin8gL1NOe3TX+YIZjfD7p8j
        P7ZPSx7Pz/iBrzslHVtfLIO4X7AxFJe8LOWnHu56Y3lEkME=
X-Google-Smtp-Source: ABdhPJxou3jXqK+REaxLE68NcJH+S2YSjyujOFt6iNAus+VD7yBznRrAsxV/mP4LiM///xZ+QO/EcmpEOLGEeVp0N68=
X-Received: by 2002:a0c:ea8c:0:b0:432:876d:788e with SMTP id
 d12-20020a0cea8c000000b00432876d788emr3427016qvp.73.1645735302929; Thu, 24
 Feb 2022 12:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org> <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
 <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org> <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
In-Reply-To: <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 24 Feb 2022 23:41:31 +0300
Message-ID: <CAA8EJpp5RjazoHD3GEE-1wJZtG3hZV9PRc3TtsBFFCcsB4zCNg@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>
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

On Thu, 24 Feb 2022 at 21:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/18/2022 6:26 PM, Dmitry Baryshkov wrote:
> > On 19/02/2022 02:56, Stephen Boyd wrote:
> >> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
> >>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> >>> enable and disable") the DP driver received a drm_bridge instance, which
> >>> is always attached to the encoder as a root bridge. However it conflicts
> >>> with the panel_bridge support for eDP panels. The panel bridge attaches
> >>> to the encoder before the "dp" bridge has a chace to do so. Change
> >>
> >> s/chace/chance/
> >>
> >>> panel_bridge attachment to come after dp_bridge attachment.
> >>
> >> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
> >> is the "DP driver's drm_bridge instance created in
> >> msm_dp_bridge_init()"?
> >>
> >> My understanding is that we want to pass the bridge created in
> >> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
> >> panel bridge to the output of the DP bridge that's attached to the
> >> encoder.
> >
> > Thanks! I'll update the commit log when pushing the patches.
>
> Please correct if i am missing something here.
>
> You are right that the eDP panel's panel bridge attaches to the encoder
> in dp_drm_connector_init() which happens before msm_dp_bridge_init() and
> hence it will attach directly to the encoder.
>
> But we are talking about different encoders here. DP's dp_display has a
> different encoder compared to the EDP's dp_display.

The encoders are different. However both encoders use the same
codepath, which includes dp_bridge. It controls dp_display by calling
msm_dp_display_foo() functions.

> So DP's bridge will still be attached to its encoder's root.

There is one dp_bridge per each encoder. Consider sc8180x which has 3
DP controllers (and thus 3 dp_bridges).

>
> So what are we achieving with this change?
>
> >
> >>
> >>>
> >>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> >>> enable and disable")
> >>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>
> >>>   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
> >>>   1 file changed, 11 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>> b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>> index d4d360d19eba..26ef41a4c1b6 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>> @@ -169,16 +169,6 @@ struct drm_connector
> >>> *dp_drm_connector_init(struct msm_dp *dp_display)
> >>>
> >>>          drm_connector_attach_encoder(connector, dp_display->encoder);
> >>>
> >>> -       if (dp_display->panel_bridge) {
> >>> -               ret = drm_bridge_attach(dp_display->encoder,
> >>> -                                       dp_display->panel_bridge, NULL,
> >>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>> -               if (ret < 0) {
> >>> -                       DRM_ERROR("failed to attach panel bridge:
> >>> %d\n", ret);
> >>> -                       return ERR_PTR(ret);
> >>> -               }
> >>> -       }
> >>> -
> >>>          return connector;
> >>>   }
> >>>
> >>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct
> >>> msm_dp *dp_display, struct drm_devi
> >>>                  return ERR_PTR(rc);
> >>>          }
> >>>
> >>> +       if (dp_display->panel_bridge) {
> >>> +               rc = drm_bridge_attach(dp_display->encoder,
> >>> +                                       dp_display->panel_bridge,
> >>> bridge,
> >>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>> +               if (rc < 0) {
> >>> +                       DRM_ERROR("failed to attach panel bridge:
> >>> %d\n", rc);
> >>> +                       drm_bridge_remove(bridge);
> >>> +                       return ERR_PTR(rc);
> >>> +               }
> >>> +       }
> >>> +
> >>>          return bridge;
> >>
> >> Not a problem with this patch, but what is this pointer used for? I see
> >> it's assigned to priv->bridges and num_bridges is incremented but nobody
> >> seems to look at that.
> >
> >
> > That's on my todo list. to remove connectors array and to destroy
> > created bridges during drm device destruction.
> >



-- 
With best wishes
Dmitry
