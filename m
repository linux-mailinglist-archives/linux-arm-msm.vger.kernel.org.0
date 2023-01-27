Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A00367F124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 23:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjA0Wdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 17:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjA0Wdo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 17:33:44 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48B768ADA
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 14:33:41 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id v6so17467451ejg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 14:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k39JeK/tscCaD3C4RfVccw1Sb99iqo7z63JWfOxSkO8=;
        b=Hn51vOoNAYMxN20PcAOTJvAHrRl6aErdpjByOew2DwRFzAQelDC21fDB6fc2el0ipV
         j4LoW6+1f7TRiaSO9uCPteScT1J0C6AxA/ubE5Tg/ChVzrIywP+20qvQQz7zPNXRK7WR
         0s7qd/QSYN5cVxgartOkILpfQJXW3KjorF0jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k39JeK/tscCaD3C4RfVccw1Sb99iqo7z63JWfOxSkO8=;
        b=j9lHrz+RuC+dwZUguFbkaZ3Ta9b+LpUBa46v7iGZF0eIWYy76nPxjP3pK0iGA3xu+y
         bLkxKx2OEOMliTpT4Ra0ghGgGfFemolhFwHcUhMu+i2QAGguQkzAVcfq8oVtG/8NhJXk
         CBr+G2jqnzvQqe8D2zMwwy3bP65WE7FBcJvwJwopMnTyOprKPLLE5oaTIQPMokBXbtnV
         i47ByVvqkf+eXY9Jc2R3ZeSzoa9rH3YDKPgsJTpCzWT0WYUqBFk/wl4LrAD+6bdVt3FL
         bvngeipkOavsFVkBnfrTyW6SeM6eVBYtZCq9SpcEdI1irRUbP0IcrMhi60Zbe2ViaikX
         NSlA==
X-Gm-Message-State: AFqh2kpva+KE4L91K/ULT2XuDr4/hNMaoZXctPp3nkGjRZUPXwW35hZz
        1u70eYYoVsDlk4qIdkV48xHjGYxfrBqqwAGRjnk=
X-Google-Smtp-Source: AMrXdXunz8NVFvDOS4KPa4vawq9QzB3CFdNqKxAWiARa8O3WC5Oo6RRj/WigRu3hunvRAYphyvqdRQ==
X-Received: by 2002:a17:906:2683:b0:7bd:43e9:d3ab with SMTP id t3-20020a170906268300b007bd43e9d3abmr39851557ejc.52.1674858820189;
        Fri, 27 Jan 2023 14:33:40 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709064c9200b0085ff3202ce7sm2956246eju.219.2023.01.27.14.33.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:33:38 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so6365148wml.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 14:33:37 -0800 (PST)
X-Received: by 2002:a05:600c:c19:b0:3db:1212:beec with SMTP id
 fm25-20020a05600c0c1900b003db1212beecmr2925999wmb.57.1674858817437; Fri, 27
 Jan 2023 14:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid> <31a0b303-64a4-8ac4-383d-6656f05a541b@quicinc.com>
In-Reply-To: <31a0b303-64a4-8ac4-383d-6656f05a541b@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 27 Jan 2023 14:33:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XCq8urY2vEjLwJ_nYkntaz=dZhxLTnZGvY+xcQrJo9OQ@mail.gmail.com>
Message-ID: <CAD=FV=XCq8urY2vEjLwJ_nYkntaz=dZhxLTnZGvY+xcQrJo9OQ@mail.gmail.com>
Subject: Re: [Freedreno] [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally
 powering up DSI hosts at modeset
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Robert Foss <robert.foss@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
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

On Fri, Jan 27, 2023 at 10:54 AM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> On 1/13/2023 3:56 PM, Douglas Anderson wrote:
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
>
> Why is the patch title showing 2/2? I am not seeing any 1/2 here.

Is it a problem with your mail filters? You can see it at:

https://lore.kernel.org/r/20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid/

You are listed on the "To:" line. ;-)


> > @@ -349,7 +297,16 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> >   host1_en_fail:
> >       msm_dsi_host_disable(host);
> >   host_en_fail:
> > -
> > +     msm_dsi_host_disable_irq(host);
> > +     if (is_bonded_dsi && msm_dsi1) {
> > +             msm_dsi_host_disable_irq(msm_dsi1->host);
> > +             msm_dsi_host_power_off(msm_dsi1->host);
> > +     }
>
> In addition to Dmitry's comment of keeping the bridge_power_on() name,
>
> this part of the change seems independent of the patch. This was missing
> cleanup for DSI1 (esp the disable_irq part).
>
> So can we break it up into two parts.
>
> 1) Add missing cleanup for DSI1
> 2) Just get rid of dsi_mgr_power_on_early() and keep the call
> dsi_mgr_bridge_power_on() in dsi_mgr_bridge_pre_enable() unconditionally.

I didn't intentionally fix any bug in my patch--I just reverted it all
back to how it was before. ;-)

So looking more closely, it looks like overall the current code (AKA
what's landed today and without ${SUBJECT} patch) doesn't really
handle errors with dsi_mgr_bridge_power_on() very well. The normal
case of calling dsi_mgr_bridge_power_on() from modeset is totally
ignored because modeset returns no error. Then the special workaround
for ps8640 just followed the same pattern and assumed that
dsi_mgr_bridge_power_on() succeeded. It also assumed that if the rest
of dsi_mgr_bridge_pre_enable() failed that it didn't need to undo
dsi_mgr_bridge_power_on() because it wouldn't have undone it in the
modeset case.

While the current code isn't the best, it's not like the pre_enable()
call could have returned errors anyway. It probably wasn't truly the
end of the world to behave the way it did.

With all that, I guess my plan would be to do as Dmitry says and just
always call dsi_mgr_bridge_power_on() from
dsi_mgr_bridge_pre_enable(). In the first patch I'll just do that and
remove the ps8640 workaround. Then I can add a 2nd patch that improves
the error handling by having dsi_mgr_bridge_power_on() return an error
code and then adding a matching dsi_mgr_bridge_power_off() that will
undo it and include the extra cleanup.

-Doug
