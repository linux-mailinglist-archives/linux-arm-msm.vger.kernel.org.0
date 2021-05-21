Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D6638D1D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 01:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhEUXJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 19:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33741 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229548AbhEUXJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 19:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621638475;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t5x32sH9FTLo/rOte6ws3ixMoIaQGzFRrnYxt29GbYg=;
        b=YzKb5Gg0uRT8472LtqguuUeK6sZO5v9wGd3N0Jwv72+BHVYtX4hLX7APpT542krZBC8Lnz
        lhGji6j7vzBNBKaZswDf42zSbrHHALgYA0r8iU+GKuoR3CZmzCSLXuajODjLHuaTLpPEAV
        7lgKJ9NZN/nW72NEC6Sta0FIprOaqEE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-_XDOHYTAPYmhqTyiyaOucw-1; Fri, 21 May 2021 19:07:54 -0400
X-MC-Unique: _XDOHYTAPYmhqTyiyaOucw-1
Received: by mail-qv1-f71.google.com with SMTP id a29-20020a0ca99d0000b02901ec0ad2c871so18704737qvb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 16:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=t5x32sH9FTLo/rOte6ws3ixMoIaQGzFRrnYxt29GbYg=;
        b=D5l2QbLa+HgnZZyRjf3n9al6Xgsx5urvxcNefb4y1SM67nXXRiLoNjtuScaeVIVWkH
         gue3jMlgNBq1czFS52ih7aO6U202JyiqBPATdsEVrKabBeVkLw4DM5z7s/WJFOQnHKol
         v5VaFmkecQpsR7hj7D1xexINChGmbPanCJidCklmEGa5AAhxmDCu0XhPkGd10imUHFep
         zISAibvtGix5AuKxq4szl+Ual/6T+fc2yntTaBthCn2Tp7GyKpPrsnd0Tz89mJ5S/LSF
         nNVugaDSJOayOVoDGmdaQPm2X/9TwYNblxFzk242IfYlLIX7J/sn7uAQIEh4ZPGKS4xW
         yq2Q==
X-Gm-Message-State: AOAM530LJgKJdWIa3sQYM3zyKeS2tLPdJPUL/yKepj7EiCC4DpUJAsC5
        +zCk2XjWT5tAJAjAD6Yt8ZAqCQa3+mDuD8flpx/42lDUTunSUnGeMbjPnMF8N8kaNpuYb6eVX5V
        45L4GudOBfHY4T8YZ7HKSrFgRyA==
X-Received: by 2002:a0c:e905:: with SMTP id a5mr16048342qvo.58.1621638473770;
        Fri, 21 May 2021 16:07:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1csHPAR7pKPC24QGsef6tDvHmZuB4/hl7VbeRUaeK0SVoYasuR87do+h/FzKWRnoPB3KDLg==
X-Received: by 2002:a0c:e905:: with SMTP id a5mr16048317qvo.58.1621638473555;
        Fri, 21 May 2021 16:07:53 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id u2sm5841011qkk.75.2021.05.21.16.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 16:07:53 -0700 (PDT)
Message-ID: <2536404ca2ab0e7b785a104ec6b4efb48943a438.camel@redhat.com>
Subject: Re: [PATCH v7 00/10] drm: Fix EDID reading on ti-sn65dsi86 by
 introducing the DP AUX bus
From:   Lyude Paul <lyude@redhat.com>
Reply-To: lyude@redhat.com
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, robdclark@chromium.org,
        Steev Klimaszewski <steev@kali.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 21 May 2021 19:07:51 -0400
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For patches 5, and 6:

Reviewed-by: Lyude Paul <lyude@redhat.com>

This week got really busy so I wasn't able to look at the rest of them, but next
week is going to be a lot less busy so I should be able to look at them then

On Mon, 2021-05-17 at 13:08 -0700, Douglas Anderson wrote:
> The primary goal of this series is to try to properly fix EDID reading
> for eDP panels using the ti-sn65dsi86 bridge.
> 
> Previously we had a patch that added EDID reading but it turned out
> not to work at bootup. This caused some extra churn at bootup as we
> tried (and failed) to read the EDID several times and also ended up
> forcing us to use the hardcoded mode at boot. With this patch series I
> believe EDID reading is reliable at boot now and we never use the
> hardcoded mode.
> 
> High level note: in this series the EDID reading is driven by the
> panel driver, not by the bridge chip driver. I believe this makes a
> reasonable amount of sense since the panel driver already _could_
> drive reading the EDID if provided with the DDC bus and in future
> planned work we'll want to give the panel driver the DDC bus (to make
> decisions based on EDID) and the AUX bus (to control the
> backlight). There are also planned patches from Laurent to make
> ti-sn65dsi86 able to drive full DP monitors. In that case the bridge
> chip will still be in charge of reading the EDID, but it's not hard to
> make this dynamic.
> 
> This series is the logical successor to the 3-part series containing
> the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
> if refclk") [1].
> 
> This patch was tested against drm-misc-next commit 60a6b73dd821
> ("drm/ingenic: Fix pixclock rate for 24-bit serial panels") on a
> sc7180-trogdor-lazor device.
> 
> At v7 now, this patch series grew a bit from v6 because it introduces
> the DP AUX bus.
> 
> Between v2 and v3, high-level view of changes:
> - stop doing the EDID caching in the core.
> 
> Between v3 and v4, high-level view of changes:
> - EDID reading is actually driven by the panel driver now. See above.
> - Lots of chicken-and-egg problems solved w/ sub-devices.
> 
> Between v4 and v5, high-level view of changes.
> - Some of the early patches landed, so dropped from series.
> - New pm_runtime_disable() fix (fixed a patch that already landed).
> - Added Bjorn's tags to most patches
> - Fixed problems when building as a module.
> - Reordered debugfs patch and fixed error handling there.
> - Dropped last patch. I'm not convinced it's safe w/out more work.
> 
> Between v5 and v6, high-level view of changes:
> - Added the patch ("drm/dp: Allow an early call to register DDC i2c
>   bus")
> - Many patches had been landed, so only a few "controversial" ones
>   left.
> 
> Between v6 and v7, high-level view of changes:
> - New AUX DP bus!
> 
> [1]
> https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
> 
> Changes in v7:
> - pm_runtime_dont_use_autosuspend() fix new for v7.
> - List hpd properties bindings patch new for v7.
> - ti-sn65dsi86: Add aux-bus child patch new for v7.
> - Patch introducing the DP AUX bus is new for v7.
> - Patch to allow panel-simple to be DP AUX EP new for v7.
> - Patch using the DP AUX for DDC new for v7.
> - Remove use of now-dropped drm_dp_aux_register_ddc() call.
> - Beefed up commit message in context of the DP AUX bus.
> - Set the proper sub-device "dev" pointer in the AUX structure.
> - Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
> - Adjusted commit message to talk about DP AUX bus.
> - Panel now under bridge chip instead of getting a link to ddc-i2c
> 
> Changes in v6:
> - Use new drm_dp_aux_register_ddc() calls.
> 
> Douglas Anderson (10):
>   drm/panel: panel-simple: Add missing pm_runtime_dont_use_autosuspend()
>     calls
>   dt-bindings: display: simple: List hpd properties in panel-simple
>   dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
>   drm: Introduce the DP AUX bus
>   drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint
>     device
>   drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
>   drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
>   drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
>   drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
>   arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml |  22 +-
>  .../bindings/display/panel/panel-simple.yaml  |   2 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  30 +-
>  drivers/gpu/drm/Kconfig                       |   5 +
>  drivers/gpu/drm/Makefile                      |   2 +
>  drivers/gpu/drm/bridge/Kconfig                |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 111 ++++--
>  drivers/gpu/drm/drm_dp_aux_bus.c              | 322 ++++++++++++++++++
>  drivers/gpu/drm/panel/Kconfig                 |   1 +
>  drivers/gpu/drm/panel/panel-simple.c          |  66 +++-
>  include/drm/drm_dp_aux_bus.h                  |  57 ++++
>  11 files changed, 563 insertions(+), 56 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
>  create mode 100644 include/drm/drm_dp_aux_bus.h
> 

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

