Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D183F7FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 03:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhHZBc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 21:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhHZBc3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 21:32:29 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80571C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 18:31:42 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id w19so2111003oik.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 18:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Gg/g05c4UHis1jo3/o9kO4T0lNRRr/zY+8C1O4NlkAo=;
        b=MuAvpb4Hnu812Gso+cfKMYOMAOkd8SRKbrPszY2qFC4onLhQQTr75dfPoV07asaL5a
         0e+FwDK2/mZcbp04o3bidjAUL1go52LPs1mnD/6mhCvZtm6Asydvi9ABfQsCV28JnR6y
         XwoVXUou6hQRhdwox6XFGMUROkYMWNoddlor4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Gg/g05c4UHis1jo3/o9kO4T0lNRRr/zY+8C1O4NlkAo=;
        b=tQIbGQVUoxhxN88BeRbPqAAi1MlEdxqMUCSbfzO6C/9pBBwmUa9U47JRk8BWtxF2P5
         AJUjtJ2QqtmUtQxwaTqhxltZa/tL+jmrF5ApnVJcSFV7nSmpuh3GLIv1eSLp1LpHcCqt
         sFV4JZNpwzH/7/bm1NmnaAZAwZn8hv1cR7J+p6d5GIkl9Qza2HfGG4CAK1XTfihibjSG
         /e+QL5kDFBLMzynEPu2cO64sFKO6rniV43iY/0HqrOK6PaTCI41Qw//YnmU7tq1WC4sn
         qp/kQgvN+lSxyQSdukZ412vCA1Csc+MARfCi/svysumNFcL9AZ1bv7LrDzv2pnNa27v0
         nesg==
X-Gm-Message-State: AOAM533LsmQ8x13pSqzTdaHzGNarNckihNgeU6HCJso/cZ0AyFPYp1l4
        dL/jhRxX8C3ViNJ+uMtAE2STjwVxXcJafJdxMGksqQ==
X-Google-Smtp-Source: ABdhPJy9cJMuZDBFBqUS/RvN9rZv8oug1H4dhxG7roMDR0AVWQ/Fjz6Q1qp2I6zPdZBG5w7LOV8Lv+m7o9XgTaHVDeg=
X-Received: by 2002:a54:468d:: with SMTP id k13mr9218145oic.125.1629941501894;
 Wed, 25 Aug 2021 18:31:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 01:31:41 +0000
MIME-Version: 1.0
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 26 Aug 2021 01:31:41 +0000
Message-ID: <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-26 16:13:51)
> eDP panels might need some power sequencing and backlight management,
> so make it possible to associate a drm_panel with a DP instance and
> prepare and enable the panel accordingly.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> This solves my immediate problem on my 8cx laptops, of indirectly controlling
> the backlight during DPMS. But my panel is powered when I boot it and as such I
> get the hpd interrupt and I don't actually have to deal with a power on
> sequence - so I'm posting this as an RFC, hoping to get some input on these
> other aspects.
>
> If this is acceptable I'd be happy to write up an accompanying DT binding
> change that marks port 2 of the DP controller's of_graph as a reference to the
> attached panel.

dianders@ mentioned creating a connector (and maybe a bridge) for the DP
connector (not eDP)[1]. I'm not sure that's directly related, but I
think with the aux bus code the panel isn't managed in the encoder
driver. Instead the encoder sees a bridge and tries to power it up and
then query things over the aux bus? It's all a little too fuzzy to me
right now so I could be spewing nonsense but I think we want to take
this bridge route if possible.

-Stephen

[1] https://lore.kernel.org/r/CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com/

>
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 19 +++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>  4 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 206bf7806f51..1db5a3f752d2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>  #include <linux/component.h>
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
> +#include <drm/drm_panel.h>
>
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> @@ -252,6 +253,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                 goto end;
>         }
>
> +       dp->dp_display.drm_panel = dp->parser->drm_panel;
> +
>         rc = dp_aux_register(dp->aux, drm);
>         if (rc) {
>                 DRM_ERROR("DRM DP AUX register failed\n");
> @@ -867,8 +870,10 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>         return 0;
>  }
>
> -static int dp_display_prepare(struct msm_dp *dp)
> +static int dp_display_prepare(struct msm_dp *dp_display)
>  {
> +       drm_panel_prepare(dp_display->drm_panel);
> +
>         return 0;
>  }
>
> @@ -886,6 +891,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>         if (!rc)
>                 dp_display->power_on = true;
>
> +       drm_panel_enable(dp_display->drm_panel);
> +
>         return rc;
>  }
>
> @@ -915,6 +922,8 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>         if (!dp_display->power_on)
>                 return 0;
>
> +       drm_panel_disable(dp_display->drm_panel);
> +
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 /* signal the disconnect event */
> @@ -939,8 +948,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>         return 0;
>  }
>
> -static int dp_display_unprepare(struct msm_dp *dp)
> +static int dp_display_unprepare(struct msm_dp *dp_display)
>  {
> +       drm_panel_unprepare(dp_display->drm_panel);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 8b47cdabb67e..ce337824c95d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -15,6 +15,7 @@ struct msm_dp {
>         struct device *codec_dev;
>         struct drm_connector *connector;
>         struct drm_encoder *encoder;
> +       struct drm_panel *drm_panel;
>         bool is_connected;
>         bool audio_enabled;
>         bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index fc8a6452f641..e6a6e9007bfd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
>
> +#include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>
>  #include "dp_parser.h"
> @@ -276,6 +277,20 @@ static int dp_parser_clock(struct dp_parser *parser)
>         return 0;
>  }
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> +       if (rc == -ENODEV)
> +               rc = 0;
> +       else if (rc)
> +               DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> +
> +       return rc;
> +}
> +
>  static int dp_parser_parse(struct dp_parser *parser)
>  {
>         int rc = 0;
> @@ -297,6 +312,10 @@ static int dp_parser_parse(struct dp_parser *parser)
>         if (rc)
>                 return rc;
>
> +       rc = dp_parser_find_panel(parser);
> +       if (rc)
> +               return rc;
> +
>         /* Map the corresponding regulator information according to
>          * version. Currently, since we only have one supported platform,
>          * mapping the regulator directly.
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 3266b529c090..994ca9336acd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -122,6 +122,7 @@ struct dp_parser {
>         struct dp_display_data disp_data;
>         const struct dp_regulator_cfg *regulator_cfg;
>         u32 max_dp_lanes;
> +       struct drm_panel *drm_panel;
>
>         int (*parse)(struct dp_parser *parser);
>  };
> --
