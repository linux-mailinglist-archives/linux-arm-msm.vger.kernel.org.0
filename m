Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7FB3F7F06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 01:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbhHYX31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 19:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhHYX30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 19:29:26 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C14C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:28:40 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t35so1719012oiw.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fb57+7PyfP47yH5wT1DY5fSf8sXx5sPLlldolea85mg=;
        b=Dbr6q+54t7tRlQixbRvsB//aYQikUgbCdg0u6066BOvuHDoB+TevAAbcZ/ZjNq+ItR
         VwzKvEarqroeUXMZaNWUaETe8oWoZvmEvveDNAYjfrlTjLB2HtkCG3FDkl/W39M6C3b5
         xGEWBy3AKUYLwgOBuVoiTVPB0+eBql04U/ETLmSrWdBy52Q3SY6/7n0UljZCv8tzCF8y
         ljYcORbdcg4ZImsNwvoAPrxVy2UOjt5o068vIPgIMuY9HIWVXiprxMFhysIVCDTOftIK
         rA5dCbEGX/dWUomD/6mVuISygHk6LIz3IuMFg20Zl/W+ywiCwEswZIjV1oo6UHGre6dY
         HFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fb57+7PyfP47yH5wT1DY5fSf8sXx5sPLlldolea85mg=;
        b=uQE774Y8Kwsn+pdgLJ6T44YfNgmTa8PpePVZ3FV+cwkemv85yGc0kNKmPRhmVJvrzy
         QYgJF21eimVGAHB/DI27y//NWDTkurLYRGvHy8usoCeR+s47ekr+ddjf9kdEvBABqDYi
         DB+YaHTlL8PaRjP0AzS52cGSSDZNSNi3f8xyNcjFcOvQERuabCh8otgvGJMB1sYV8A2C
         hQbUzfhCVV2AhTdy3v9OYLYQ5h2Hw91T8ynxDAmqUMTa98+tcMpGZ+zobXMh9ztS0LnQ
         og56tZlRuBC7OdB1tepsZZmv2aoS4XrqkE8lPizeiAPV5b1/1ukM5Ne+j5xUsreAdlHi
         tNSw==
X-Gm-Message-State: AOAM533v9DO+zbTn0WLwvz8qwNuTEklQMZLnfYz43n+paWbsEue3JNmG
        Je27HBhCzOIUo1SU45ZfFvSPrw==
X-Google-Smtp-Source: ABdhPJxBGz1Q5a1J5n6yKIj0kIvh0gvLL4haMQ9fLpPGk+quv0yykLiQ2SuY0wn+VzLEwZy3N5JjFg==
X-Received: by 2002:aca:ab93:: with SMTP id u141mr347516oie.151.1629934119758;
        Wed, 25 Aug 2021 16:28:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bg9sm312101oib.26.2021.08.25.16.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 16:28:39 -0700 (PDT)
Date:   Wed, 25 Aug 2021 18:28:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YSbSJbJ51oC447Gb@builder.lan>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <3bb5dc26-6779-6cb4-b9dd-e64c306e9ae6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb5dc26-6779-6cb4-b9dd-e64c306e9ae6@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 29 Jul 04:59 CDT 2021, Dmitry Baryshkov wrote:

> On 27/07/2021 02:13, Bjorn Andersson wrote:
> > eDP panels might need some power sequencing and backlight management,
> > so make it possible to associate a drm_panel with a DP instance and
> > prepare and enable the panel accordingly.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The idea looks good from my point of view.

Thanks.

> For v1 could you please extend it with the `if (panel)` checks and
> handling of the error codes.

Passing NULL to the drm_panel_* api is valid and a nop, and I run the
same code for both eDP and DP.

Would you still like it to indicate to a future reader that this might
be NULL?

Regards,
Bjorn

> 
> > ---
> > 
> > This solves my immediate problem on my 8cx laptops, of indirectly controlling
> > the backlight during DPMS. But my panel is powered when I boot it and as such I
> > get the hpd interrupt and I don't actually have to deal with a power on
> > sequence - so I'm posting this as an RFC, hoping to get some input on these
> > other aspects.
> > 
> > If this is acceptable I'd be happy to write up an accompanying DT binding
> > change that marks port 2 of the DP controller's of_graph as a reference to the
> > attached panel.
> > 
> >   drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++++--
> >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> >   drivers/gpu/drm/msm/dp/dp_parser.c  | 19 +++++++++++++++++++
> >   drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
> >   4 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 206bf7806f51..1db5a3f752d2 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/component.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/delay.h>
> > +#include <drm/drm_panel.h>
> >   #include "msm_drv.h"
> >   #include "msm_kms.h"
> > @@ -252,6 +253,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
> >   		goto end;
> >   	}
> > +	dp->dp_display.drm_panel = dp->parser->drm_panel;
> > +
> >   	rc = dp_aux_register(dp->aux, drm);
> >   	if (rc) {
> >   		DRM_ERROR("DRM DP AUX register failed\n");
> > @@ -867,8 +870,10 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
> >   	return 0;
> >   }
> > -static int dp_display_prepare(struct msm_dp *dp)
> > +static int dp_display_prepare(struct msm_dp *dp_display)
> >   {
> > +	drm_panel_prepare(dp_display->drm_panel);
> > +
> >   	return 0;
> >   }
> > @@ -886,6 +891,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
> >   	if (!rc)
> >   		dp_display->power_on = true;
> > +	drm_panel_enable(dp_display->drm_panel);
> > +
> >   	return rc;
> >   }
> > @@ -915,6 +922,8 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
> >   	if (!dp_display->power_on)
> >   		return 0;
> > +	drm_panel_disable(dp_display->drm_panel);
> > +
> >   	/* wait only if audio was enabled */
> >   	if (dp_display->audio_enabled) {
> >   		/* signal the disconnect event */
> > @@ -939,8 +948,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
> >   	return 0;
> >   }
> > -static int dp_display_unprepare(struct msm_dp *dp)
> > +static int dp_display_unprepare(struct msm_dp *dp_display)
> >   {
> > +	drm_panel_unprepare(dp_display->drm_panel);
> > +
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > index 8b47cdabb67e..ce337824c95d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > @@ -15,6 +15,7 @@ struct msm_dp {
> >   	struct device *codec_dev;
> >   	struct drm_connector *connector;
> >   	struct drm_encoder *encoder;
> > +	struct drm_panel *drm_panel;
> >   	bool is_connected;
> >   	bool audio_enabled;
> >   	bool power_on;
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index fc8a6452f641..e6a6e9007bfd 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/of_gpio.h>
> >   #include <linux/phy/phy.h>
> > +#include <drm/drm_of.h>
> >   #include <drm/drm_print.h>
> >   #include "dp_parser.h"
> > @@ -276,6 +277,20 @@ static int dp_parser_clock(struct dp_parser *parser)
> >   	return 0;
> >   }
> > +static int dp_parser_find_panel(struct dp_parser *parser)
> > +{
> > +	struct device_node *np = parser->pdev->dev.of_node;
> > +	int rc;
> > +
> > +	rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > +	if (rc == -ENODEV)
> > +		rc = 0;
> > +	else if (rc)
> > +		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> > +
> > +	return rc;
> > +}
> > +
> >   static int dp_parser_parse(struct dp_parser *parser)
> >   {
> >   	int rc = 0;
> > @@ -297,6 +312,10 @@ static int dp_parser_parse(struct dp_parser *parser)
> >   	if (rc)
> >   		return rc;
> > +	rc = dp_parser_find_panel(parser);
> > +	if (rc)
> > +		return rc;
> > +
> >   	/* Map the corresponding regulator information according to
> >   	 * version. Currently, since we only have one supported platform,
> >   	 * mapping the regulator directly.
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> > index 3266b529c090..994ca9336acd 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> > @@ -122,6 +122,7 @@ struct dp_parser {
> >   	struct dp_display_data disp_data;
> >   	const struct dp_regulator_cfg *regulator_cfg;
> >   	u32 max_dp_lanes;
> > +	struct drm_panel *drm_panel;
> >   	int (*parse)(struct dp_parser *parser);
> >   };
> > 
> 
> 
> -- 
> With best wishes
> Dmitry
