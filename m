Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04474123BC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfLRAs0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:48:26 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44369 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRAsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:48:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id d199so191538pfd.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DrIzy5/3+qkJlfpz8zly2ElwPJDQSn8JS7CVJj6CmpA=;
        b=JWFEQFsiP9BZC5HbLcv7+tioUvurGoS6OgIQC2MaUnDA64JkWBCBk610oHn+V0vr8N
         PDRCLaQ5jYucZEkmdQLB91uGNP2fgXlrhrrsH84luz+qRJkTfaIKf6FXAH4FlWAMk3bZ
         cNm7bnuAgLqnn5XJzzPEJa8R+iBtoIcKkD+NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DrIzy5/3+qkJlfpz8zly2ElwPJDQSn8JS7CVJj6CmpA=;
        b=nR5HnG1+NmQcQ6pnjzsEsDs63t6rgNeFXSR7h43VdsvIjpQWEY9Z6+LWB1M1gMjWCP
         L/58AtwuAaLlQ4cADmLOR29hBtxZZn0goxXohEId74X8+EoY5nb1X+c6A8KlepbX3Dr1
         aBvPl/ip7sAniA9V7KfYG9WxVuyrC8ZCjIZ5pGEq6mROiYD2lLYVSMwpoCzSvUQDMua4
         osGvweuXMqX5PilOkfIjTdHWA+coRSgzvmULBlHJI3igB6wqRvRlnt13qbZJ4nojL883
         3mJQbJjbj9EOKL4QkQU8YQMvtgcv2K2MaiaDTKBe2auKxMwnFijG1GexiCIoXL3ziKkM
         B2rQ==
X-Gm-Message-State: APjAAAXnbXdS0zV71MFX27uvaH5Tkm9IXzNQ6iA+XgXKAkiEfWe/ynvy
        xifPwDellj6jd0Lc6Z4zg334Wg==
X-Google-Smtp-Source: APXvYqxgKMKNXSTeOoH7rDK5JVWi87oIv+P52BpWmaSqjQua5pSstDNqLp+GxjHfJWeE4vbc2mC6dg==
X-Received: by 2002:a63:bc01:: with SMTP id q1mr300743pge.442.1576630105100;
        Tue, 17 Dec 2019 16:48:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 16:48:24 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, seanpaul@chromium.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 0/9] drm/bridge: ti-sn65dsi86: Improve support for AUO B116XAK01 + other DP
Date:   Tue, 17 Dec 2019 16:47:32 -0800
Message-Id: <20191218004741.102067-1-dianders@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains a pile of patches that was created to support
hooking up the AUO B116XAK01 panel to the eDP side of the bridge.  In
general it should be useful for hooking up a wider variety of DP
panels to the bridge, especially those with lower resolution and lower
bits per pixel.

The overall result of this series:
* Allows panels with fewer than 4 DP lanes hooked up to work.
* Optimizes the link rate for panels with 6 bpp.
* Supports trying more than one link rate when training if the main
  link rate didn't work.
* Avoids invalid link rates.

It's not expected that this series will break any existing users but
testing is always good.

To support the AUO B116XAK01, we could actually stop at the ("Use
18-bit DP if we can") patch since that causes the panel to run at a
link rate of 1.62 which works.  The patches to try more than one link
rate were all developed prior to realizing that I could just use
18-bit mode and were validated with that patch reverted.

These patches were tested on sdm845-cheza atop mainline as of
2019-12-13 and also on another board (the one with AUO B116XAK01) atop
a downstream kernel tree.

This patch series doesn't do anything to optimize the MIPI link and
only focuses on the DP link.  For instance, it's left as an exercise
to the reader to see if we can use the 666-packed mode on the MIPI
link and save some power (because we could lower the clock rate).

I am nowhere near a display expert and my knowledge of DP and MIPI is
pretty much zero.  If something about this patch series smells wrong,
it probably is.  Please let know and I'll try to fix it.

Changes in v2:
- Squash in maybe-uninitialized fix from Rob Clark.
- Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")

Douglas Anderson (9):
  drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
  drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
  drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
  drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
  drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
  drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
  drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
  drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
  drm/bridge: ti-sn65dsi86: Avoid invalid rates

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 277 ++++++++++++++++++++++----
 1 file changed, 234 insertions(+), 43 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

