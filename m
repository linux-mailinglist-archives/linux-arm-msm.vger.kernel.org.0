Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0593039E4C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 19:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhFGRIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 13:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhFGRIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 13:08:22 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DA7C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 10:06:16 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d16so13528815pfn.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h1KlkStLvRStBVJTSQFYwmRz+Osk/Ua5tWW4TsExsnQ=;
        b=JjGREny0zqtnXUIvzi865hDU8o/5J9xd3glLyUEUxz8AJyDIDzkllfB707Xi93Vncm
         xsLGlCMFwsg8jX6EdLFvztxWNsXfJo8gTSE62syPgNUD8xYgdlq7D65h2Hcp1L3+68Nc
         mui8QFN4XuzfbMUW2HFBr9DMsLiX7w1aANTWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h1KlkStLvRStBVJTSQFYwmRz+Osk/Ua5tWW4TsExsnQ=;
        b=NeXIDJeDpaqvkjEoqVCbTvRKeP0CEz0uocVfVDkRYlUUPa5n15OUWzsGGolq57Ar7c
         M5nYp4mnmLGyUioTbCXf2n0iBxjvstjjYgnNe4oj/WAW365vkFR2aJQbkibZ9Ik3rLft
         8RhvhWYnJO6LktNAlXSFi6guyqRJu5JuT0PVFkknpxrFmizyP9dZPHmG2G2E/t9XA4ks
         PXltngrElwR7l4EBYR9VVdoht+Cpc6W0aFJqZ/VlFHRTpsCmz2L2pcZLggRhjb1SzkYz
         Yk/UkmnDjwV+/4gSBQJvJItTVeJi3I7Lw5ulEgtc8mpFjx4KIe+hA7i/DRiYAAw9A/5R
         eJuQ==
X-Gm-Message-State: AOAM533KpMinUsALABCYqEasAodN3J6WNuZxxknPXVAe5aWZjC8nQkO1
        iB+LIlklpfy6hm4E6q63DQs1LA==
X-Google-Smtp-Source: ABdhPJwEfiZm77qEdH3k3vccPX5tPvVMCtHuG5+GI/0giuu5WAtkte5L9u8ICH/G1ZkDyKcuDboEeg==
X-Received: by 2002:a63:1260:: with SMTP id 32mr18681828pgs.232.1623085575938;
        Mon, 07 Jun 2021 10:06:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f656:ffce:6348:a42a])
        by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 10:06:15 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 00/11] drm: Fix EDID reading on ti-sn65dsi86 by introducing the DP AUX bus
Date:   Mon,  7 Jun 2021 10:05:44 -0700
Message-Id: <20210607170555.4006050-1-dianders@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
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

This patch was tested against drm-misc-next commit 24994b91ecc5
("MAINTAINERS: Add maintainer for hyperv video device") on a
sc7180-trogdor-lazor device.

At v9 now this just had a few tiny tweaks / bugfixes. I also added a
patch to the end to make deferred probe a bit prettier. I _think_ this
series is now ready to land and seems to be fairly well-reviewed. I
believe all that's left is Laurent's official blessing that it's OK
for the panel to drive the EDID reading in this case.

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

Between v7 and v8, high-level view of changes:
- More bindings work.
- Fixed allmodconfig.

Between v8 and v9, high-level view of changes:
- Fixed error/remove in panel.
- Properly handle of_node in sub-devices in sn65dsi86.
- Tiny bindings touchup including dropping "Example" patch.
- Added review tags.
- Added error message cleanup patch at the end.
- First patch (bugfix) dropped (it landed).

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/

Changes in v9:
- ("Improve probe errors") patch new for v9.
- Commit message now notes aux-bus yaml won't have an "Example".
- Fix error handling / remove case when using AUX bus for DDC.
- Properly set the of_node of sn65dsi86 auxbus devices now.
- Rebased atop v9 ("Promote the AUX channel") patch.
- Use an absolute path to refer to aux-bus schema.

Changes in v8:
- Allow dp-aux-bus to be a module to fix allmodconfig builds
- Explain better why HPD needs to be in panel-simple in commit msg.
- Separate DP AUX bus binding is new for v8.
- ti-sn65dsi86 references the new aux bus bindings.

Changes in v7:
- Adjusted commit message to talk about DP AUX bus.
- Beefed up commit message in context of the DP AUX bus.
- List hpd properties bindings patch new for v7.
- Panel now under bridge chip instead of getting a link to ddc-i2c
- Patch introducing the DP AUX bus is new for v7.
- Patch to allow panel-simple to be DP AUX EP new for v7.
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
- Patch using the DP AUX for DDC new for v7.
- Remove use of now-dropped drm_dp_aux_register_ddc() call.
- Set the proper sub-device "dev" pointer in the AUX structure.
- ti-sn65dsi86: Add aux-bus child patch new for v7.

Changes in v6:
- Use new drm_dp_aux_register_ddc() calls.

Douglas Anderson (11):
  dt-bindings: display: simple: List hpd properties in panel-simple
  dt-bindings: drm: Introduce the DP AUX bus
  dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
  drm: Introduce the DP AUX bus
  drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint
    device
  drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  drm/bridge: ti-sn65dsi86: Improve probe errors with dev_err_probe()
  arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

 .../bindings/display/bridge/ti,sn65dsi86.yaml |  20 +-
 .../bindings/display/dp-aux-bus.yaml          |  37 ++
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  30 +-
 drivers/gpu/drm/Kconfig                       |   5 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 129 +++----
 drivers/gpu/drm/drm_dp_aux_bus.c              | 326 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 drivers/gpu/drm/panel/panel-simple.c          |  68 +++-
 include/drm/drm_dp_aux_bus.h                  |  57 +++
 12 files changed, 594 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 include/drm/drm_dp_aux_bus.h

-- 
2.32.0.rc1.229.g3e70b5a671-goog

