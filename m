Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D31034DECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhC3CyQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhC3CyB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:01 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC14C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id p12so6032884pgj.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pyzpcly5+oL22ifqA9LcP9BWqlXKnbYel2OHd9y5j2k=;
        b=kvMdz9ZBBO2CD3j+PC6tdVvNoYqpgwii81QhShzrYQgX8quKvl6YgQEHZtzMQ4wyZM
         GSfXE8Q2D4AECcXNk+RA7NWljGszHvrR11DgRy0GA0mIXlhx8DYWJMVsKIttJwLT0Es5
         m/5ZuBbBDE3VdZqM4XsmavbD8gkXnU1kozoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pyzpcly5+oL22ifqA9LcP9BWqlXKnbYel2OHd9y5j2k=;
        b=nEVfyFS70Js8T5jc/hSeEK7m3jmqv5qHg/Q3MN8516Dt0I5k1g5WX60trJU+IFPGK+
         8mknkLka8RQIl9eXhom0rXq2HzlXZqaNVFMtMa2wsjtH+xa242XkDVnYTCot7cGXScfi
         Bny9Ea0n/pViA3qrPy0xc6mI14qQlNDO5erMO3tP+HwGjV9S7EonKMkwQHJEUQXxfgRn
         9dC8vscTMKfiRV0UdstZsjZH+TbCtU2vZWlJdVuxZ01dgN2Ix72an7VIbeMZiGGr+BKN
         bnx9/DodnVPK4WFAtqZONimgzNd6wevkI9ZF3zp8QiUt3e9qofQdtid5FxBWU1zvWrJJ
         kxIw==
X-Gm-Message-State: AOAM533ZmRjc1J1i+uWA730FaeiX0tBZIewZCWENIrmeiP5sI3+SFl/+
        o+pN/LUuZPF1aCwd4JdLoAdFL6ApCWZHnRep
X-Google-Smtp-Source: ABdhPJxSUvOXB9xrV/3JE5ZxT6ZkmAYWYDE+3PyLVvxsATrMI2E+/vKGASjep6ASrmsst+pXmFjlqg==
X-Received: by 2002:a63:1e56:: with SMTP id p22mr26342059pgm.375.1617072840452;
        Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/14] drm: Fix EDID reading on ti-sn65dsi86
Date:   Mon, 29 Mar 2021 19:53:31 -0700
Message-Id: <20210330025345.3980086-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
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

This series is the logical successor to the 3-part series containing
the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
if refclk") [1] though only one actual patch is the same between the
two.

This series starts out with some general / obvious fixes and moves on
to some more specific and maybe controversial ones. I wouldn't object
to some of the earlier ones landing if they look ready.

This patch was developed against drm-misc-next on a
sc7180-trogdor-lazor device. To get things booting for me, I had to
use Stephen's patch [2] to keep from crashing but otherwise all the
patches I needed were here.

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
[2] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/

Changes in v2:
- Removed 2nd paragraph in commit message.

Douglas Anderson (14):
  drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
  drm/bridge: ti-sn65dsi86: Simplify refclk handling
  drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
  drm/bridge: ti-sn65dsi86: Reorder remove()
  drm/bridge: ti-sn65dsi86: Move MIPI detach() / unregister() to
    detach()
  drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable()
  drm/bridge: ti-sn65dsi86: Get rid of the useless detect() function
  drm/bridge: ti-sn65dsi86: Remove extra call:
    drm_connector_update_edid_property()
  drm/edid: Use the cached EDID in drm_get_edid() if eDP
  drm/bridge: ti-sn65dsi86: Stop caching the EDID ourselves
  drm/bridge: ti-sn65dsi86: Power things properly for reading the EDID
  drm/bridge: ti-sn65dsi86: Read the EDID only if refclk was provided
  drm/bridge: ti-sn65dsi86: Print an error if we fallback to panel modes
  drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare /
    prepare

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 125 ++++++++++++++++----------
 drivers/gpu/drm/drm_bridge.c          |   3 +
 drivers/gpu/drm/drm_edid.c            |  32 ++++++-
 drivers/gpu/drm/panel/Kconfig         |   1 +
 drivers/gpu/drm/panel/panel-simple.c  |  93 ++++++++++++++-----
 5 files changed, 184 insertions(+), 70 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

