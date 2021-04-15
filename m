Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54A135FF33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 03:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhDOBUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 21:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhDOBTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 21:19:55 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A39C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 18:19:31 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id m16so16365543qtx.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aPyvheTo359M1XDribOD0pZhfeuF44YjhQwSBPOIAw=;
        b=hS2JR6sElgLAeSGeeiC5NWKU6wJRmnDZZwZmROkbPRe18b3qtT1n+5v07HhUKGaCpI
         h42fJ2GHWGoGhhhKrYomCGkV+pb05xvk1n9OUFq5pOBr152EvEXvhdKx+JmLpEPZZVvy
         LQUPTj550/2FqR3G/xrsZcVXYBV8n6AwO44fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aPyvheTo359M1XDribOD0pZhfeuF44YjhQwSBPOIAw=;
        b=rAkqQGz9GobMpzibd5SnwE2uLXm1q4eo1oTCxRXnUnWVVSktVwzphNIxZJsUj1egIk
         q/TRl78uC4yNEtwQFU0ulxYvfeCSt8uFFmoSUU4HkMZr4+34EW9Np1EiUNeEiNoktqgX
         jExOlUdgdNYB3ifVMdWlOrmHqm4wji0O2gM8irDNZdNm99tYBsOBHuhNc0XUU1ScfGtV
         GlbGTriAKmnSwEp0NewzcFv+wmpY2KJ9hd9KBP8E6IJheh9TCndA8q3lbw3TUtnvt67m
         QAe7xAU/zClb5o5Dmgb7uZMRHdhjTMghlADs5tb3eyFNOuQyOGwMwSaXMXwuw4ReZCvg
         pOIw==
X-Gm-Message-State: AOAM53268ri698nUHx9BtMLUkD+9zxOqbQXvPxteRJK7MK+cvwi4IiJZ
        XagORK7w1WJTkpgeLbJ2gwp6IxBt4xnKRw==
X-Google-Smtp-Source: ABdhPJxBgl7nZXwzGDn0FTw3sVseC/j8RAoZ8TwWRwNeWKm0q6ZWKiwY2I9LsqNqaMeByOo7/dzjwQ==
X-Received: by 2002:a05:622a:49:: with SMTP id y9mr916814qtw.0.1618449569681;
        Wed, 14 Apr 2021 18:19:29 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id o7sm892510qkb.104.2021.04.14.18.19.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 18:19:26 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id x76so14277017ybe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 18:19:25 -0700 (PDT)
X-Received: by 2002:a25:58d5:: with SMTP id m204mr1191125ybb.32.1618449565216;
 Wed, 14 Apr 2021 18:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid> <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
In-Reply-To: <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Apr 2021 18:19:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
Message-ID: <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Apr 4, 2021 at 5:50 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> > The drm_bridge_chain_pre_enable() is not the proper opposite of
> > drm_bridge_chain_post_disable(). It continues along the chain to
> > _before_ the starting bridge. Let's fix that.
> >
> > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/drm_bridge.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 64f0effb52ac..044acd07c153 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> >               if (iter->funcs->pre_enable)
> >                       iter->funcs->pre_enable(iter);
> > +
> > +             if (iter == bridge)
> > +                     break;
>
> This looks good as it matches drm_atomic_bridge_chain_disable().
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your review here and several of the other patches. Can you
suggest any plan for getting them landed? It would at least be nice to
get the non-controversial ones landed.


> I'm curious though, given that the bridge passed to the function should
> be the one closest to the encoder, does this make a difference ?

Yes, that's how I discovered it originally. Let's see. So if I don't
have this patch but have the rest of the series then I get a splat at
bootup. This shows that dsi_mgr_bridge_pre_enable() must be "earlier"
in the chain than my bridge chip. Here's the splat:

 msm_dsi_host_get_phy_clk_req: unable to calc clk rate, -22
 ------------[ cut here ]------------
 disp_cc_mdss_ahb_clk status stuck at 'off'
 WARNING: CPU: 7 PID: 404 at drivers/clk/qcom/clk-branch.c:92
clk_branch_toggle+0x194/0x280
 Modules linked in: joydev
 CPU: 7 PID: 404 Comm: frecon Tainted: G    B             5.12.0-rc3-lockdep+ #2
 Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
 pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
 pc : clk_branch_toggle+0x194/0x280
 lr : clk_branch_toggle+0x190/0x280
 ...
 Call trace:
  clk_branch_toggle+0x194/0x280
  clk_branch2_enable+0x28/0x34
  clk_core_enable+0x2f4/0x6b4
  clk_enable+0x54/0x74
  dsi_phy_enable_resource+0x80/0xd8
  msm_dsi_phy_enable+0xa8/0x4a8
  enable_phy+0x9c/0xf4
  dsi_mgr_bridge_pre_enable+0x23c/0x4b0
  drm_bridge_chain_pre_enable+0xac/0xe4
  ti_sn_bridge_connector_get_modes+0x134/0x1b8
  drm_helper_probe_single_connector_modes+0x49c/0x1358
  drm_mode_getconnector+0x460/0xe98
  drm_ioctl_kernel+0x144/0x228
  drm_ioctl+0x418/0x7cc
  drm_compat_ioctl+0x1bc/0x230
  __arm64_compat_sys_ioctl+0x14c/0x188
  el0_svc_common+0x128/0x23c
  do_el0_svc_compat+0x50/0x60
  el0_svc_compat+0x24/0x34
  el0_sync_compat_handler+0xc0/0xf0
  el0_sync_compat+0x174/0x180
