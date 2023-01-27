Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD51867DD37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 06:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjA0FtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 00:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjA0FtC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 00:49:02 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164E8367CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 21:49:01 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5063029246dso53653997b3.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 21:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x7K7wszx3PlmIkyWFmqCcc/yrBEdNN/cXM5RnXYgcaU=;
        b=LCJ3aHR9FsrRDzjCEpHf8FoobPT4acjXfv1zRhRSNyw48zmuKf4Z4iPLRRMQ2SIqMz
         zdCk/Grj7c62mc8hO8LRK22bMHf13OcMBsTxxVba9u3HxOuQP+jzpLCNpQAqE31zEYj/
         kqAKT8YD34wMx+3xbeGOrorfx+Y+2IUH7fEw7+Mr1ZawUXb7NUXZ9IWxNe4Z0r7o05V1
         Wy8ZyYRIM0Qe06mbpE87OSciM936eiwhKdIeZ0t+vff2ZVgQUO+P/6BEocPL8KqcSKuI
         +4SDbkfUTizi51jtRPAkh//lXKujlxDeetvDMjM1laMHZUYl64bi4dLtZw/UDP8JgaHA
         adNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7K7wszx3PlmIkyWFmqCcc/yrBEdNN/cXM5RnXYgcaU=;
        b=BiulQ/u/RSmsib6JSh1yogNVEaDcn1Y6Sq7QZ3KkndMdGq6hR12t6jl0JPu7ac1T0Y
         K46w3yfQwzjnmeBZYxdxwOy4TzYbFhaKTSK7/EPwa1gbXpUGotzOoI8+LUk3mh+nCGXL
         kfQk9MTKM/JhZ3oSDHTZyoGysPn5zggnoM0/pkn/V/2cqcKwAHt7VJcPrfP81jyt1Q5t
         CYVtV81xxA40XwI9W8OJtYJ7vCxhceMXnqc95l6CHhVvubEHPfa2z3dEy6o0y6jxE1uc
         jwpPzQ6xxdMr5NBzU72cV/H9so9ATg94n3kE3h0oFOy4vfCO+e0y7ZsgY/MlK4RL7AEf
         oGpg==
X-Gm-Message-State: AFqh2krKOLKL+UL7UeKnrFbuvSGRgHsqbf0jW3elvzZ34gos0k7J5uw/
        qG4pkOSG5pin9JHeJAR1TPiE5IbYeGB+Xky/oqUYrQ==
X-Google-Smtp-Source: AMrXdXtQXtfDBhpKPCT9/Dhn1xIPimIrtwTNyQrYmPbxZ2zSTHS40O4lV72dkhcNW16ltcKPZ+s/VoY08Y4KlKZHTzk=
X-Received: by 2002:a0d:fd07:0:b0:3d6:2151:4038 with SMTP id
 n7-20020a0dfd07000000b003d621514038mr4486411ywf.418.1674798540299; Thu, 26
 Jan 2023 21:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
In-Reply-To: <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Jan 2023 07:48:48 +0200
Message-ID: <CAA8EJprBPNfjhx1Op4rnHTx9DXDGkgc0q3cZzBHtahi6EaKS_w@mail.gmail.com>
Subject: Re: [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally powering up DSI
 hosts at modeset
To:     Douglas Anderson <dianders@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, 14 Jan 2023 at 01:56, Douglas Anderson <dianders@chromium.org> wrote:
>
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time"), we moved powering up DSI hosts to modeset time. This wasn't
> because it was an elegant design, but there were no better options.
>
> That commit actually ended up breaking ps8640, and thus was born
> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> the old way of doing things. It turns out that ps8640 _really_ doesn't
> like its pre_enable() function to be called after
> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> because I have any inside knowledge), it looks like the assertion of
> "RST#" in the ps8640 runtime resume handler seems like it's not
> allowed to happen after dsi_mgr_bridge_power_on()
>
> Recently, Dave Stevenson's series landed allowing bridges some control
> over pre_enable ordering. The meaty commit for our purposes is commit
> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> bridge init order"). As documented by that series, if a bridge doesn't
> set "pre_enable_prev_first" then we should use the old ordering.
>
> Now that we have the commit ("drm/bridge: tc358762: Set
> pre_enable_prev_first") we can go back to the old ordering, which also
> allows us to remove the ps8640 special case.
>
> One last note is that even without reverting commit 7d8e9a90509f
> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> revert the ps8640 special case and try it out then it doesn't seem to
> fail anymore. I spent time bisecting / debugging this and it turns out
> to be mostly luck, so we still want this patch to make sure it's
> solid. Specifically the reason it sorta works these days is because
> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> implemented means that we actually power the bridge chip up just a wee
> bit earlier and then the bridge happens to stay on because of
> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().

I had a small comment on your patch, but then I was distracted and
forgot to send it. See below.

>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 68 +++++----------------------
>  1 file changed, 11 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 3a1417397283..5e6b8d423b96 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
>  #define IS_SYNC_NEEDED()       (msm_dsim_glb.is_sync_needed)
>  #define IS_MASTER_DSI_LINK(id) (msm_dsim_glb.master_dsi_link_id == id)
>
> -#ifdef CONFIG_OF
> -static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> -{
> -       struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
> -
> -       /*
> -        * If the next bridge in the chain is the Parade ps8640 bridge chip
> -        * then don't power on early since it seems to violate the expectations
> -        * of the firmware that the bridge chip is running.
> -        *
> -        * NOTE: this is expected to be a temporary special case. It's expected
> -        * that we'll eventually have a framework that allows the next level
> -        * bridge to indicate whether it needs us to power on before it or
> -        * after it. When that framework is in place then we'll use it and
> -        * remove this special case.
> -        */
> -       return !(next_bridge && next_bridge->of_node &&
> -                of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
> -}
> -#else
> -static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> -{
> -       return true;
> -}
> -#endif
> -
>  static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>  {
>         return msm_dsim_glb.dsi[id];
> @@ -254,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
>         }
>  }
>
> -static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)

Can you please keep the dsi_mgr_bridge_power_on() as is and just
remove the now-legacy dsi_mgr_power_on_early().

>  {
>         int id = dsi_mgr_bridge_get_id(bridge);
>         struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> @@ -300,36 +274,10 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>         if (is_bonded_dsi && msm_dsi1)
>                 msm_dsi_host_enable_irq(msm_dsi1->host);
>
> -       return;
> -
> -host1_on_fail:
> -       msm_dsi_host_power_off(host);
> -host_on_fail:
> -       dsi_mgr_phy_disable(id);
> -phy_en_fail:
> -       return;
> -}
> -
> -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> -{
> -       int id = dsi_mgr_bridge_get_id(bridge);
> -       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -       struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> -       struct mipi_dsi_host *host = msm_dsi->host;
> -       bool is_bonded_dsi = IS_BONDED_DSI();
> -       int ret;
> -
> -       DBG("id=%d", id);
> -       if (!msm_dsi_device_connected(msm_dsi))
> -               return;
> -
>         /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>         if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>                 return;
>
> -       if (!dsi_mgr_power_on_early(bridge))
> -               dsi_mgr_bridge_power_on(bridge);
> -
>         ret = msm_dsi_host_enable(host);
>         if (ret) {
>                 pr_err("%s: enable host %d failed, %d\n", __func__, id, ret);
> @@ -349,7 +297,16 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>  host1_en_fail:
>         msm_dsi_host_disable(host);
>  host_en_fail:
> -
> +       msm_dsi_host_disable_irq(host);
> +       if (is_bonded_dsi && msm_dsi1) {
> +               msm_dsi_host_disable_irq(msm_dsi1->host);
> +               msm_dsi_host_power_off(msm_dsi1->host);
> +       }
> +host1_on_fail:
> +       msm_dsi_host_power_off(host);
> +host_on_fail:
> +       dsi_mgr_phy_disable(id);
> +phy_en_fail:
>         return;
>  }
>
> @@ -438,9 +395,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>         msm_dsi_host_set_display_mode(host, adjusted_mode);
>         if (is_bonded_dsi && other_dsi)
>                 msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
> -
> -       if (dsi_mgr_power_on_early(bridge))
> -               dsi_mgr_bridge_power_on(bridge);
>  }
>
>  static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
> --
> 2.39.0.314.g84b9a713c41-goog
>


-- 
With best wishes
Dmitry
