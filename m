Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B083865D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 22:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbhEQULE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 16:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbhEQULE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 16:11:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0F1C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:47 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so253883pjt.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCGEEwwwRGKD1oMDJbEPaJuXUMyc6FPUtNPA7l9y81o=;
        b=iwVQ4Y/uu3y3K160d47Xbb0z1F+EyQFQLfmkL66fXDaXo4r5PyawAg+Uq6mkotYAj3
         hVNW95HY7wvcTT58I+7Pupa+orb2LxOcGP93Yize1SpSmimlYxp5fR1RUq7w2wwPIAol
         z/PIrf+h4gxCuMubj6BjMmffuxSjkhRv9fi4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCGEEwwwRGKD1oMDJbEPaJuXUMyc6FPUtNPA7l9y81o=;
        b=fdibDNw9BGgvWmiVO1prncohpak+RyTYjBGnof77C7Xc8fiw9vD4aR8DRGZNkZi09w
         KYhyjkobL+Ad250gn1RJ0ehQlqYs1sf8QziDFEckOk79t1n4pIfgCuAr0Fp70roaZ48V
         aN9sUouT02svWDsaSgsRClHV5SXsLfxtrSPkLdBf/WSxVpRNcVAPyzGAd+iBzA3EVrA0
         jKQ65XlPJeQozSmBmeluDVYDxsdZavRgpl/ipOjLftPoFY4T9wtnXLyfjJ3JWMJfbn5r
         S4mv/gMmM0R7jNuevLa1NhB+5dS3iK/Jg8vEc8oKUQqt1uuZKN1j4j+lv/SGA/4bX2NK
         jMCg==
X-Gm-Message-State: AOAM531ZCllmh+SB5UEDR44rn3UT5YV5HBupXC5bn0nHp2Ids6C1B4//
        RSU9/6+2fKXQ2/qvyjPnjrg5Gw==
X-Google-Smtp-Source: ABdhPJzGJfCkJeK4TET+/0o4NbufssT9iOPSlLD7v+MwbNWHa2NMCrFnNscDFpQl9cxD6dEmN5BF9Q==
X-Received: by 2002:a17:902:b101:b029:ed:56c1:e01d with SMTP id q1-20020a170902b101b02900ed56c1e01dmr227482plr.54.1621282186567;
        Mon, 17 May 2021 13:09:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:bc91:c597:ded0:7930])
        by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:09:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, robdclark@chromium.org,
        Steev Klimaszewski <steev@kali.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/10] drm: Fix EDID reading on ti-sn65dsi86 by introducing the DP AUX bus
Date:   Mon, 17 May 2021 13:08:57 -0700
Message-Id: <20210517200907.1459182-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The primary goal of this series is to try to properly fix EDID reading
for eDP panels using the ti-sn65dsi86 bridge.

Previously we had a patch that added EDID reading but it turned out
not to work at bootup. This caused some extra churn at bootup as we
tried (and failed) to read the EDID several times and also ended up
forcing us to use the hardcoded mode at boot. With this patch series I
believe EDID reading is reliable at boot now and we never use the
hardcoded mode.

High level note: in this series the EDID reading is driven by the
panel driver, not by the bridge chip driver. I believe this makes a
reasonable amount of sense since the panel driver already _could_
drive reading the EDID if provided with the DDC bus and in future
planned work we'll want to give the panel driver the DDC bus (to make
decisions based on EDID) and the AUX bus (to control the
backlight). There are also planned patches from Laurent to make
ti-sn65dsi86 able to drive full DP monitors. In that case the bridge
chip will still be in charge of reading the EDID, but it's not hard to
make this dynamic.

This series is the logical successor to the 3-part series containing
the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
if refclk") [1].

This patch was tested against drm-misc-next commit 60a6b73dd821
("drm/ingenic: Fix pixclock rate for 24-bit serial panels") on a
sc7180-trogdor-lazor device.

At v7 now, this patch series grew a bit from v6 because it introduces
the DP AUX bus.

Between v2 and v3, high-level view of changes:
- stop doing the EDID caching in the core.

Between v3 and v4, high-level view of changes:
- EDID reading is actually driven by the panel driver now. See above.
- Lots of chicken-and-egg problems solved w/ sub-devices.

Between v4 and v5, high-level view of changes.
- Some of the early patches landed, so dropped from series.
- New pm_runtime_disable() fix (fixed a patch that already landed).
- Added Bjorn's tags to most patches
- Fixed problems when building as a module.
- Reordered debugfs patch and fixed error handling there.
- Dropped last patch. I'm not convinced it's safe w/out more work.

Between v5 and v6, high-level view of changes:
- Added the patch ("drm/dp: Allow an early call to register DDC i2c
  bus")
- Many patches had been landed, so only a few "controversial" ones
  left.

Between v6 and v7, high-level view of changes:
- New AUX DP bus!

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/

Changes in v7:
- pm_runtime_dont_use_autosuspend() fix new for v7.
- List hpd properties bindings patch new for v7.
- ti-sn65dsi86: Add aux-bus child patch new for v7.
- Patch introducing the DP AUX bus is new for v7.
- Patch to allow panel-simple to be DP AUX EP new for v7.
- Patch using the DP AUX for DDC new for v7.
- Remove use of now-dropped drm_dp_aux_register_ddc() call.
- Beefed up commit message in context of the DP AUX bus.
- Set the proper sub-device "dev" pointer in the AUX structure.
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
- Adjusted commit message to talk about DP AUX bus.
- Panel now under bridge chip instead of getting a link to ddc-i2c

Changes in v6:
- Use new drm_dp_aux_register_ddc() calls.

Douglas Anderson (10):
  drm/panel: panel-simple: Add missing pm_runtime_dont_use_autosuspend()
    calls
  dt-bindings: display: simple: List hpd properties in panel-simple
  dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
  drm: Introduce the DP AUX bus
  drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint
    device
  drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

 .../bindings/display/bridge/ti,sn65dsi86.yaml |  22 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  30 +-
 drivers/gpu/drm/Kconfig                       |   5 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 111 ++++--
 drivers/gpu/drm/drm_dp_aux_bus.c              | 322 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 drivers/gpu/drm/panel/panel-simple.c          |  66 +++-
 include/drm/drm_dp_aux_bus.h                  |  57 ++++
 11 files changed, 563 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 include/drm/drm_dp_aux_bus.h

-- 
2.31.1.751.gd2f1c929bd-goog

