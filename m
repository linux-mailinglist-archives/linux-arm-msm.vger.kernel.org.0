Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F4A539873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 23:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344852AbiEaVLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 17:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347895AbiEaVLH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 17:11:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7032F9D070
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 14:11:06 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u12so3379620eja.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KHYrrg1OiYZowD6aPazdTTV7Ju3sH7vUcubOYj24fu4=;
        b=UtRwpwucfDR8gD3L7SaGmezgIA5eG73xQodHXxNq0JxfaLvad7Zzy+Lt8+nRFoDSEz
         cDnX8R6alvDMA8xggJQdl89Yyl40Pi+iiv/q9jVII2cMZt/1qu/TD1lCliPIdELSeYqP
         7hpayhSqZL9lkCIf9aX7v909SxUuQrV+NkdbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHYrrg1OiYZowD6aPazdTTV7Ju3sH7vUcubOYj24fu4=;
        b=biO35jwpknTSYhKFkMzSXOeSGNjuMybNT2KjrHmKpGj+XGQO5EK1y0gnmmIL9rearO
         h+wmDAxGUStKIcgCFLOY+nkgx1+XElWBHkOGaqlqHAEWxmvhrhDwUtzxXSSIcZ+WCtF5
         jpE3mhnTr5O9tISaFVH8zsSBEnn3vEm+70y7fJ8PZLkHZ8iy/qu69yO9tfJWNPtixOCj
         OHZktGzaBKF453t8JqurBZ0gHN3zMF1cBcsOl61ToE64PhTh6V09kDcRSiGWIUT9AqEF
         ERs+Yd2/3Llws1ZY/9oxfc4HJ5DOU+042Cq+YU5swIjDTXGvJf0UFhh1nGyuOTGIMEk1
         wPrw==
X-Gm-Message-State: AOAM533KAKdJFj6kkW5vJczaI1BfpQv1N6Zqma09QlLX03Zc22pNa83e
        cRYT070R9H98rsxQV1YaiVLWYVYY8llFrFi8
X-Google-Smtp-Source: ABdhPJzHKr+u0r2ks51OS4tdrq/Fj0CxkuWm2vrmPMRC/asL+NMn88d9Y9FS2+/0O0vhAPQP+BO1wA==
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id ss1-20020a170907038100b006fe9ca8c4b4mr52792083ejb.147.1654031454391;
        Tue, 31 May 2022 14:10:54 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id h16-20020a50cdd0000000b0042bb1e2e2f7sm9179123edj.8.2022.05.31.14.10.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 14:10:54 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id n185so664510wmn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 14:10:53 -0700 (PDT)
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr25847322wmr.15.1654031047944; Tue, 31
 May 2022 14:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 31 May 2022 14:03:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-gW_TMKKJA-5bCETp+KB4sAUDnMuGJMMTwAixb7Ho6w@mail.gmail.com>
Message-ID: <CAD=FV=W-gW_TMKKJA-5bCETp+KB4sAUDnMuGJMMTwAixb7Ho6w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/dp: Make DP AUX bus usage easier; use it on ps8640
To:     dri-devel <dri-devel@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 10, 2022 at 12:30 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch is v3 of the first 2 patches from my RFC series ("drm/dp: Improvements
> for DP AUX channel") [1]. I've broken the series in two so we can make
> progress on the two halves separately.
>
> v2 of this series tries to incorporate all the feedback from v1. Hopefully
> things are less confusing and simpler this time around. The one thing that got
> slightly more confusing is that the done_probing() callback can't return
> -EPROBE_DEFER in most cases so we have to adjust drivers a little more.
>
> v3 takes Dmitry's advice on v2. This now introduces
> devm_drm_bridge_add() (in an extra patch), splits some fixups into
> their own patch, uses a new name for functions, and requires an
> explicit call to done_probing if you have no children.
>
> The idea for this series came up during the review process of
> Sankeerth's series trying to add eDP for Qualcomm SoCs [2].
>
> This _doesn't_ attempt to fix the Analogix driver. If this works out,
> ideally someone can post a patch up to do that.
>
> NOTE: I don't have any ps8640 devices that _don't_ use the aux panel
> underneath them, so I'm relying on code inspection to make sure I
> didn't break those. If someone sees that I did something wrong for
> that case then please yell!
>
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
> [2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/
>
> Changes in v3:
> - Adapt to v3 changes in aux bus.
> - Don't call done_probing() if there are no children; return -ENODEV.
> - Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
> - Split out EXPORT_SYMBOL and kerneldoc fixes to its own patch.
> - Use devm_drm_bridge_add() to simplify.
> - Used Dmitry's proposed name: of_dp_aux_populate_bus()
>
> Changes in v2:
> - Change to assume exactly one device.
> - Have a probe callback instead of an extra sub device.
> - Rewrote atop new method introduced by patch #1.
>
> Douglas Anderson (4):
>   drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
>   drm/dp: Add callbacks to make using DP AUX bus properly easier
>   drm/bridge: Add devm_drm_bridge_add()
>   drm/bridge: parade-ps8640: Handle DP AUX more properly
>
>  drivers/gpu/drm/bridge/parade-ps8640.c   |  74 +++++---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 211 +++++++++++++++--------
>  drivers/gpu/drm/drm_bridge.c             |  23 +++
>  include/drm/display/drm_dp_aux_bus.h     |  34 +++-
>  include/drm/drm_bridge.h                 |   1 +
>  5 files changed, 238 insertions(+), 105 deletions(-)

I'm hoping to get some review for this series. Anyone? Dmitry: I know
you looked at earlier versions of this series. I guess you're happy
enough with it now but don't feel enough ownership to give a full
Reviewed-by?

-Doug
