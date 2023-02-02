Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2474E688A0F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 23:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjBBWyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 17:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjBBWyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 17:54:17 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76071F5D7
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 14:54:15 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id bk15so10437638ejb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Zy7sOZ5NJ3j2LxJM2vtlRy4fRlrjKvTjIjmDKiY9Y=;
        b=YXejx0l91bIRJHmBkjw2F1DWFq8WI5oZFDo7cBfimDt7DApqnIDC4jqpiheYZuhv0n
         6PZfAB4Bl+CmDfBPxp3hUUBqwxOutPaU+FPOnHSiQQW/QAORaw1HgVuFFp3aRA9sPUCn
         lwX3pIZfcrI0Rxsc0WablBxbsBANAXHLbI9Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1Zy7sOZ5NJ3j2LxJM2vtlRy4fRlrjKvTjIjmDKiY9Y=;
        b=ovtV6vCJENOLgvF+5h8pK8C0HSSC8zWqbIF7mk0j8OtwLeOK9f/YJPhcMsdyCZpXt8
         Gw92WoI+c9EBtsBFPnufncUj6DAop1CKals12iXeJRxLJVbtD1dPIyU8lgyvbrmSfZBO
         HR8iYXW3EW8HsVdVkTdWg8jL0L3oz4YUbJSU6Ufj+vXD6Lu4wYk+cRrn/sCIADBNx6yg
         XRIzR6YtwKz+LI4L1+4HhBbhuLbtmxwUjX5FB4lo2ZVcRcqbJjscSTP7C/oM8klyNIYk
         +Gv32FWWovhFX6wJLzH6TITMAP0NjBxPKBJ4xV+lK6VesN6rrgCpAQmwJBKOcIyrvnb+
         MDVA==
X-Gm-Message-State: AO0yUKV/7utYp/hyrHqv6wTBOpiQy76DcYpOwnBTmXQvO5dkOnycLVXd
        Bx1K8Wwp1C6qeUIs8Jv9lqvqcvuHj2pd8FilntU=
X-Google-Smtp-Source: AK7set9S0tfUrxGgdDamldsPvx0T//M6dG5mpMLXuTGJXfFn1TDwOoVpwdwIRaw1LOUOMOvJdZn2ag==
X-Received: by 2002:a17:907:6d15:b0:88a:7037:8562 with SMTP id sa21-20020a1709076d1500b0088a70378562mr10603208ejc.31.1675378454296;
        Thu, 02 Feb 2023 14:54:14 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id j17-20020a1709064b5100b00878130e170bsm419413ejv.131.2023.02.02.14.54.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 14:54:14 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so2626199wms.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 14:54:14 -0800 (PST)
X-Received: by 2002:a05:600c:1912:b0:3d7:fa4a:6827 with SMTP id
 j18-20020a05600c191200b003d7fa4a6827mr250843wmq.188.1675378043111; Thu, 02
 Feb 2023 14:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.3.I3c87b53c4ab61a7d5e05f601a4eb44c7e3809a01@changeid> <0419b0c8-fb30-f8df-1b9a-19e106680948@quicinc.com>
In-Reply-To: <0419b0c8-fb30-f8df-1b9a-19e106680948@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Feb 2023 14:46:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xk6qFokozxEa+MaCgii3zpSWZRDe52FoP17E-DOFXoyg@mail.gmail.com>
Message-ID: <CAD=FV=Xk6qFokozxEa+MaCgii3zpSWZRDe52FoP17E-DOFXoyg@mail.gmail.com>
Subject: Re: [Freedreno] [RFT PATCH v2 3/3] drm/msm/dsi: More properly handle
 errors in regards to dsi_mgr_bridge_power_on()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 2, 2023 at 2:37 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> On 1/31/2023 2:18 PM, Douglas Anderson wrote:
> > In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time") the error handling with regards to dsi_mgr_bridge_power_on()
> > got a bit worse. Specifically if we failed to power the bridge on then
> > nothing would really notice. The modeset function couldn't return an
> > error and thus we'd blindly go forward and try to do the pre-enable.
> >
> > In commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time
> > for parade-ps8640") we added a special case to move the powerup back
> > to pre-enable time for ps8640. When we did that, we didn't try to
> > recover the old/better error handling just for ps8640.
> >
> > In the patch ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
> > at modeset") we've now moved the powering up back to exclusively being
> > during pre-enable. That means we can add the better error handling
> > back in, so let's do it. To do so we'll add a new function
> > dsi_mgr_bridge_power_off() that's matches how errors were handled
> > prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to
> > modeset time").
> >
> > NOTE: Now that we have dsi_mgr_bridge_power_off(), it feels as if we
> > should be calling it in dsi_mgr_bridge_post_disable(). That would make
> > some sense, but doing so would change the current behavior and thus
> > should be a separate patch. Specifically:
> > * dsi_mgr_bridge_post_disable() always calls dsi_mgr_phy_disable()
> >    even in the slave-DSI case of bonded DSI. We'd need to add special
> >    handling for this if it's truly needed.
> > * dsi_mgr_bridge_post_disable() calls msm_dsi_phy_pll_save_state()
> >    midway through the poweroff.
> > * dsi_mgr_bridge_post_disable() has a different order of some of the
> >    poweroffs / IRQ disables.
> > For now we'll leave dsi_mgr_bridge_post_disable() alone.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - ("More properly handle errors...") new for v2.
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 32 ++++++++++++++++++++++-----
> >   1 file changed, 26 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index 2197a54b9b96..28b8012a21f2 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -228,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
> >       }
> >   }
> >
> > -static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > +static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >   {
> >       int id = dsi_mgr_bridge_get_id(bridge);
> >       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> > @@ -268,14 +268,31 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >       if (is_bonded_dsi && msm_dsi1)
> >               msm_dsi_host_enable_irq(msm_dsi1->host);
> >
> > -     return;
> > +     return 0;
> >
> >   host1_on_fail:
> >       msm_dsi_host_power_off(host);
> >   host_on_fail:
> >       dsi_mgr_phy_disable(id);
> >   phy_en_fail:
> > -     return;
> > +     return ret;
> > +}
> > +
> > +static void dsi_mgr_bridge_power_off(struct drm_bridge *bridge)
> > +{
> > +     int id = dsi_mgr_bridge_get_id(bridge);
> > +     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> > +     struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> > +     struct mipi_dsi_host *host = msm_dsi->host;
> > +     bool is_bonded_dsi = IS_BONDED_DSI();
> > +
> > +     msm_dsi_host_disable_irq(host);
> > +     if (is_bonded_dsi && msm_dsi1) {
> > +             msm_dsi_host_disable_irq(msm_dsi1->host);
> > +             msm_dsi_host_power_off(msm_dsi1->host);
> > +     }
>
> The order of disabling the IRQs should be opposite of how they were enabled.
>
> So while enabling it was DSI0 and then DSI1.
>
> Hence while disabling it should be DSI1 and then DSI0.
>
> So the order here should be
>
> DSI1 irq disable
> DSI0 irq disable
> DSI1 host power off
> DSI0 host power off

Right. Normally you want to go opposite. I guess a few points, though:

1. As talked about in the commit message, the order I have matches the
order we had prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host
powerup to modeset time").

2. I'd be curious if it matters. The order you request means we need
to check for `(is_bonded_dsi && msm_dsi1)` twice. While that's not a
big deal if it's important, it's nice not to have to do so.

3. As talked about in the commit message, eventually we should
probably resolve this order with the order of things in
dsi_mgr_bridge_post_disable(), which is yet a different ordering.
Ideally this resolution would be done by someone who actually has
proper documentation of the hardware and how it's supposed to work
(AKA not me).

So my preference would be to either land or drop ${SUBJECT} patch
(either is fine with me) and then someone at Qualcomm could then take
over further cleanup.

-Doug
