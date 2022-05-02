Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71988517A44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 01:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbiEBXEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 19:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbiEBXEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 19:04:46 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52AB2CCBA
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 16:01:15 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k25-20020a056830169900b00605f215e55dso7319601otr.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 16:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9uBc6wx6A1a4MRCc/L1WnfFMg3syq5u1vN3tb0t35I8=;
        b=Y0mb8OxwrSC9tg53D5Xcqhy3aRh4UhGD73qWWPPXSi4mL1kN0csWb7v35/oLyNl0Em
         ykx2lNucOFTMkItDRtuOdUOMoLgJAOq8YqxtyAc2k0pSgxzaca+bvTxzyFa50UUXlFjl
         AAAqXopgjky1yp3qBsFt9oY8j+VzrPoWWq49PQ4L564ZAgK0eXTGd1GoWDo072Gcf17n
         pPU93I7KrprUhc7BYO3fJsYnqypbgOgDeyqoxH6ELeLLFIXSxk2QHPOpevIbNX9rsZW6
         MGzI+8PlCNiWlyTAVsm1jWkg07/4BK9mNlNa4rdP+q+L299qpWwCIlNf7BchLMx+7BZA
         bcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9uBc6wx6A1a4MRCc/L1WnfFMg3syq5u1vN3tb0t35I8=;
        b=RPh7S55qP7jwsGlIKDbtPfBqvqLl7QrF3RdOgvARQtvIQwzR6rA9TJaDhNdZlHnHG3
         tmghG2o4Aq9JgPM7WUfzRuGs5dGwqW9h5o3IuxSV8iSyQMEIiwhusnkQNJAA6fkP9kBA
         9QrgZumHxgJ7uVQA1KI5z2TkCl4cyY5OQDrkW3/YISLRKXr93LaDY9ljTa10Fu7JqPES
         +GamRyEfT78vUFr78DUHBNeRrCV+2ZpBXY5yeRg4Qte6NQjrgK3y1NjzkTDHGImKoQ79
         gM+jshkyC0bhV1m5NjYwqkhX9XEWlX3gzPPuAAqxVwSY3Sg3TAiy5Qo9SVe0HCY2sjUP
         XCoA==
X-Gm-Message-State: AOAM533MFeOs3wImX+7IzGgWycpqKrrN7HhgD5QIMz0ohtoJEdFlZsKV
        CLX335iBFiko2KnSUNyYcoFLRA==
X-Google-Smtp-Source: ABdhPJytt3Tbg6QZv3CVggHguL18N+UfgIjzPltsIfz/bl72lz7f3aFg8SQL6YAX3FebihBBM5zipw==
X-Received: by 2002:a9d:ed1:0:b0:605:e54f:b8e3 with SMTP id 75-20020a9d0ed1000000b00605e54fb8e3mr4910759otj.47.1651532474936;
        Mon, 02 May 2022 16:01:14 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x4-20020a9d6d84000000b0060603d8be2dsm3346796otp.67.2022.05.02.16.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:01:14 -0700 (PDT)
Date:   Mon, 2 May 2022 16:02:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 5/5] drm/msm/dp: Implement hpd_notify()
Message-ID: <YnBjI1HyL//X4KOn@ripper>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
 <20220502165316.4167199-6-bjorn.andersson@linaro.org>
 <672e7dac-fe3b-591f-6837-3ce06a0b44c2@quicinc.com>
 <YnBbNO31bwNUoRQL@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnBbNO31bwNUoRQL@ripper>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 May 15:29 PDT 2022, Bjorn Andersson wrote:

> On Mon 02 May 13:59 PDT 2022, Kuogee Hsieh wrote:
> 
> > 
> > On 5/2/2022 9:53 AM, Bjorn Andersson wrote:
> > > The Qualcomm DisplayPort driver contains traces of the necessary
> > > plumbing to hook up USB HPD, in the form of the dp_hpd module and the
> > > dp_usbpd_cb struct. Use this as basis for implementing the
> > > hpd_notify() callback, by amending the dp_hpd module with the
> > > missing logic.
> > > 
> > > Overall the solution is similar to what's done downstream, but upstream
> > > all the code to disect the HPD notification lives on the calling side of
> > > drm_connector_oob_hotplug_event().
> > > 
> > > drm_connector_oob_hotplug_event() performs the lookup of the
> > > drm_connector based on fwnode, hence the need to assign the fwnode in
> > > dp_drm_connector_init().
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > > 
> > > Changes since v3:
> > > - Implements hpd_notify instead of oob_hotplug_event
> > > - Rebased on new cleanup patch from Dmitry
> > > - Set hpd_state to ST_MAINLINK_READY when dp_display_usbpd_configure() succeeds
> > > 
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 26 ++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
> > >   drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
> > >   4 files changed, 32 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index b447446d75e9..080294ac6144 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -83,6 +83,8 @@ struct dp_display_private {
> > >   	bool hpd_irq_on;
> > >   	bool audio_supported;
> > > +	bool connected;
> > > +
> > >   	struct drm_device *drm_dev;
> > >   	struct platform_device *pdev;
> > >   	struct dentry *root;
> > > @@ -1271,6 +1273,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > >   	if (!desc)
> > >   		return -EINVAL;
> > > +	dp->dp_display.dev = &pdev->dev;
> > >   	dp->pdev = pdev;
> > >   	dp->name = "drm_dp";
> > >   	dp->dp_display.connector_type = desc->connector_type;
> > > @@ -1760,3 +1763,26 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> > >   	dp_display->dp_mode.h_active_low =
> > >   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> > >   }
> > > +
> > > +void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > > +			  enum drm_connector_status status)
> > > +{
> > > +	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
> > > +	struct msm_dp *dp = dp_bridge->dp_display;
> > > +	struct dp_display_private *dp_display = container_of(dp, struct dp_display_private, dp_display);
> > > +	int ret;
> > > +
> > > +	drm_dbg_dp(dp_display->drm_dev, "status: %d connected: %d\n", status, dp_display->connected);
> > > +
> > > +	if (!dp_display->connected && status == connector_status_connected) {
> > > +		dp_display->connected = true;
> > > +		ret = dp_display_usbpd_configure(dp_display);
> > > +		if (!ret)
> > > +			dp_display->hpd_state = ST_MAINLINK_READY;
> > > +	} else if (status != connector_status_connected) {
> > > +		dp_display->connected = false;
> > > +		dp_display_notify_disconnect(dp_display);
> > > +	} else {
> > > +		dp_display_usbpd_attention(dp_display);
> > > +	}
> > > +}
> > 
> > I would assume dp_bridge_hpd_notify() will server same purpose as
> > dp_display_irq_handler() if hpd_notification is enabled.
> > 
> 
> I agree with this statement.
> 
> > In that case, should dp_bridge_hpd_notify() add
> > EV_HPD_PLUG_INT/EV_IRQ_HPD_INT/EV_HPD_UNPLUG_INT
> > 
> 
> I tried this originally, but couldn't get it to work and expected that
> as the downstream driver doesn't do this, there was some good reason for
> me not to do it either.
> 
> > into event q to kick off corresponding
> > dp_hpd_plug_handle()/dp_irq_hpd_handle()/dp_hpd_unplug_handle()?
> > 
> 
> But since then the driver has been cleaned up significantly, so I
> decided to give it a test again.
> Unfortunately it still doesn't work, but now it's easier to trace.
> 
> Replacing the 3 cases with relevant calls to dp_add_event() results in
> us inserting a EV_HPD_UNPLUG_INT event really early, before things has
> been brought up. This will result in dp_hpd_unplug_handle() trying to
> disable the dp_catalog_hpd_config_intr(), which will crash as the
> hardware isn't yet clocked up.
> 

As I sent that I realized and have now confirmed that if I get a HPD
connect before dp_display_host_init() things will not be in an
appropriate state to either and the board will crash...

I will dig a little bit more to see what we can do about this.

Regards,
Bjorn

> Further more, this points out the main difference between the normal HPD
> code and the USB HPD code; dp_catalog_hpd_config_intr() will enable the
> plug/unplug interrupts, which it shouldn't do for USB-controlled.
> 
> 
> So it seems we need two code paths after all.
> 
> > By the way, I am going to test this patch out.
> > 
> > Any patches I have to pull in before apply this serial patches?
> > 
> 
> The patches applies on Dmitry's msm-next-staging, which I've merged on
> top of linux-next together with a number of pending patches to get the
> DPU up on SM8350 and a pmic_glink driver which I'm about to post.
> 
> But to validate that it doesn't affect your non-USB case, Dmitry's
> branch should be sufficient.
> 
> Thanks,
> Bjorn
> 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index 4f9fe4d7610b..2d2614bc5a14 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -11,6 +11,7 @@
> > >   #include "disp/msm_disp_snapshot.h"
> > >   struct msm_dp {
> > > +	struct device *dev;
> > >   	struct drm_device *drm_dev;
> > >   	struct device *codec_dev;
> > >   	struct drm_bridge *bridge;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > > index 62d58b9c4647..821cfd37b1fb 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > > @@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
> > >   	.mode_valid   = dp_bridge_mode_valid,
> > >   	.get_modes    = dp_bridge_get_modes,
> > >   	.detect       = dp_bridge_detect,
> > > +	.hpd_notify   = dp_bridge_hpd_notify,
> > >   };
> > >   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> > > @@ -138,6 +139,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
> > >   	if (IS_ERR(connector))
> > >   		return connector;
> > > +	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
> > > +
> > >   	drm_connector_attach_encoder(connector, dp_display->encoder);
> > >   	return connector;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> > > index f4b1ed1e24f7..3b7480a86844 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> > > @@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
> > >   void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> > >   			const struct drm_display_mode *mode,
> > >   			const struct drm_display_mode *adjusted_mode);
> > > +void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > > +			  enum drm_connector_status status);
> > >   #endif /* _DP_DRM_H_ */
