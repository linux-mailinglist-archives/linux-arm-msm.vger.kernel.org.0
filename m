Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F2268684F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 15:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjBAOda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 09:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbjBAOd3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 09:33:29 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A5149013
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 06:33:28 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id me3so51987752ejb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 06:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bltqkr1sg0pNhxWiFSaqOu4KLSvgA4P8R645R0umaT4=;
        b=MUyYmiIgYK0KvPfJGx+PT/BoYMovWZN84nzOepalN21d2CzKtHVvbAcQkFQWZTL/Qx
         Z9GTXgkmOKOwde1Mjl/JKnGdMXPVqtrnrg7UDlf/NZcjbeQXjHviOJyyogmg4p9AsyV4
         osP4p6xx6eKRARDizd1unrTY4ZmwhU0C9ykj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bltqkr1sg0pNhxWiFSaqOu4KLSvgA4P8R645R0umaT4=;
        b=3NuQob433Q2CgW01EJnm7KhSZZ+mRqMtRxlA1XlbRk515JAnUpCfAfU4veO7BTV83a
         hv3mreKYM8rpLp+W08rTYX0xfr1rTZyZECJWZcY/pAe9hGVzX6tdweneQ3fuU82BjPf5
         1fikc6E4s82Papq0Su3nywk/Y0ykW6NvAbPLn0VzJmlfQ+uQ2IaysSunHvEB18zicA/B
         IIu5qvcxP1JXGXgqT/Ltj/w0hTneStvFrDaWQylJ/+AP0Xtq5FTkZNNg7Mo1o0mNV5OE
         EnSQqH7Ck8N3cCWfuLx7fndt7WocRaSB27A7QbAJ6PMuIjozfQ44Ao5axQcEP94x72fy
         jxlA==
X-Gm-Message-State: AO0yUKVQnYxN1Kew3Bwa7i0fIFElo2uvAdplUbENEn75dqmn77R1y320
        lsvnqJXBi23gwSb0vbHJftdbzRUNHuHQ2ERLBXo=
X-Google-Smtp-Source: AK7set/OsIRhw4dhRA3X/FFLja/Ea6YDRsfCDH+fDKEbMXHEtD91SvhihbPn/WAdjgUzYiOckEfHuw==
X-Received: by 2002:a17:907:34c6:b0:889:e4b1:56b3 with SMTP id zy6-20020a17090734c600b00889e4b156b3mr2013292ejb.73.1675262006806;
        Wed, 01 Feb 2023 06:33:26 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id z4-20020a170906714400b0087223b8d6efsm10266025ejj.16.2023.02.01.06.33.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 06:33:26 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso1558676wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 06:33:25 -0800 (PST)
X-Received: by 2002:a05:600c:a03:b0:3dc:42e7:8d38 with SMTP id
 z3-20020a05600c0a0300b003dc42e78d38mr115107wmp.93.1675262005713; Wed, 01 Feb
 2023 06:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid> <43095d93-29c8-b30a-08c0-0a452770c1ce@quicinc.com>
In-Reply-To: <43095d93-29c8-b30a-08c0-0a452770c1ce@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 1 Feb 2023 06:33:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X6A4aZVCaqhT9yP0tD82R3fnaDak67w+p8+Z=WkaRxfw@mail.gmail.com>
Message-ID: <CAD=FV=X6A4aZVCaqhT9yP0tD82R3fnaDak67w+p8+Z=WkaRxfw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 2/3] drm/msm/dsi: Stop unconditionally powering up
 DSI hosts at modeset
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Vinod Koul <vkoul@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 31, 2023 at 3:32 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On 1/31/2023 2:18 PM, Douglas Anderson wrote:
> > In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time"), we moved powering up DSI hosts to modeset time. This wasn't
> > because it was an elegant design, but there were no better options.
> >
> > That commit actually ended up breaking ps8640, and thus was born
> > commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> > parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> > the old way of doing things. It turns out that ps8640 _really_ doesn't
> > like its pre_enable() function to be called after
> > dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> > because I have any inside knowledge), it looks like the assertion of
> > "RST#" in the ps8640 runtime resume handler seems like it's not
> > allowed to happen after dsi_mgr_bridge_power_on()
> >
> > Recently, Dave Stevenson's series landed allowing bridges some control
> > over pre_enable ordering. The meaty commit for our purposes is commit
> > 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> > bridge init order"). As documented by that series, if a bridge doesn't
> > set "pre_enable_prev_first" then we should use the old ordering.
> >
> > Now that we have the commit ("drm/bridge: tc358762: Set
> > pre_enable_prev_first") we can go back to the old ordering, which also
> > allows us to remove the ps8640 special case.
> >
> > One last note is that even without reverting commit 7d8e9a90509f
> > ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> > revert the ps8640 special case and try it out then it doesn't seem to
> > fail anymore. I spent time bisecting / debugging this and it turns out
> > to be mostly luck, so we still want this patch to make sure it's
> > solid. Specifically the reason it sorta works these days is because
> > we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> > "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> > implemented means that we actually power the bridge chip up just a wee
> > bit earlier and then the bridge happens to stay on because of
> > autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
> >
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Don't fold dsi_mgr_bridge_power_on() back into dsi_mgr_bridge_pre_enable()
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 38 +--------------------------
> >   1 file changed, 1 insertion(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index 1bbac72dad35..2197a54b9b96 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
> >   #define IS_SYNC_NEEDED()    (msm_dsim_glb.is_sync_needed)
> >   #define IS_MASTER_DSI_LINK(id)      (msm_dsim_glb.master_dsi_link_id == id)
> >
> > -#ifdef CONFIG_OF
> > -static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> > -{
> > -     struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
> > -
> > -     /*
> > -      * If the next bridge in the chain is the Parade ps8640 bridge chip
> > -      * then don't power on early since it seems to violate the expectations
> > -      * of the firmware that the bridge chip is running.
> > -      *
> > -      * NOTE: this is expected to be a temporary special case. It's expected
> > -      * that we'll eventually have a framework that allows the next level
> > -      * bridge to indicate whether it needs us to power on before it or
> > -      * after it. When that framework is in place then we'll use it and
> > -      * remove this special case.
> > -      */
> > -     return !(next_bridge && next_bridge->of_node &&
> > -              of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
> > -}
> > -#else
> > -static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> > -{
> > -     return true;
> > -}
> > -#endif
> > -
> >   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
> >   {
> >       return msm_dsim_glb.dsi[id];
> > @@ -265,12 +239,6 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >       int ret;
> >
> >       DBG("id=%d", id);
> > -     if (!msm_dsi_device_connected(msm_dsi))
> > -             return;
> > -
> > -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
> > -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
> > -             return;
> >
>
> Why are these two checks removed?

After this patch there is now one caller to this function and the one
caller does those exact same two checks immediately before calling
this function. Thus, they no longer do anything useful.

-Doug
