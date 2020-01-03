Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA81F12FC9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 19:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgACSex (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 13:34:53 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45409 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbgACSex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 13:34:53 -0500
Received: by mail-pl1-f194.google.com with SMTP id b22so19318317pls.12;
        Fri, 03 Jan 2020 10:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Dusf/4KDqcrQi/VonO+4x5vUuCsxZgl6QQ8UNNQfZ0=;
        b=DNo7kR9vKKDTlqoxQ8AOGZwUhmfVgoLHQ/GJPi8L8/TwGW9RmPmJL3RgsmW5koUk8r
         R13GnTuZM90xCE8Td4Cj1s74JKKQD/0CXRns0wHW9qEDaGQfv4l8UUkoQN1PgbUafQdP
         4KrO4C/jJz9b0nSPejTbElePBzrFPvWA73N5k5hticNG4TCmzfuMEu8ivh336xtVYlNV
         3GYOnZrarUvl+QyQF7seSqhB1dTmW2jVYjKpIGuNkvSh2LB59qj/ufaKl/BgY+7KUH+d
         hD25nntUoYn5dkFq40YOucrUbpMlAeHiI+6MmUxt8KOlqfpTjLzkE6f7cLQT0f3zw4Bl
         f4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Dusf/4KDqcrQi/VonO+4x5vUuCsxZgl6QQ8UNNQfZ0=;
        b=q8nLrCWuD3dy4fn9AHKg9ZX+zD404g32wsYmWumKpLpV4hIEOsl0LJMcuQs4Gsu3w5
         xIHbsNVVTxRm6qMS7+8gpV/u03da2DJ0FVfgzdv/ML6AGzCHAq3DYQ0BDC+qHhKmrYT3
         QrsXTFOjKDUvOWbjgFBP0ZEGly1rLtC790qc42cx3IevqThTrATJbbMb/m2A9d0PZNS+
         /BVfuaIJ/NVXvbJO9QeGrkHi+5w7uHhP+Vtve5CMurrVsK3ArXFisOIkYNU1NnOFIOOI
         9wG8IsWJcKK4YsrihxZRXVMuiKA7GQSIsitQT3APRB+m5sRDouTXhiFj77yeEriOidEv
         Vq8Q==
X-Gm-Message-State: APjAAAXxo7b2NO3fpCHGcZ9taHqAVszWVjLqvwFu4J4jITvOHQOxduwt
        /WuqtiRV87plMuLuHCIqmxU=
X-Google-Smtp-Source: APXvYqx9m7oZjNsk+KdmrE/zTv6Qh85g23ksK74cqcggdeWZztPomG0rZabNyWSNWbmvPGqxpCDWYg==
X-Received: by 2002:a17:902:8342:: with SMTP id z2mr89565186pln.181.1578076492887;
        Fri, 03 Jan 2020 10:34:52 -0800 (PST)
Received: from localhost ([100.118.89.215])
        by smtp.gmail.com with ESMTPSA id r14sm68677143pfh.10.2020.01.03.10.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 10:34:52 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
Date:   Fri,  3 Jan 2020 10:30:24 -0800
Message-Id: <20200103183025.569201-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200103183025.569201-1-robdclark@gmail.com>
References: <20200103183025.569201-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d487686d25c..895a25cfc54f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -680,6 +680,35 @@ static const struct panel_desc auo_b116xw03 = {
 	},
 };
 
+static const struct drm_display_mode auo_b116xak01_mode = {
+	.clock = 69300,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 48,
+	.hsync_end = 1366 + 48 + 32,
+	.htotal = 1366 + 48 + 32 + 10,
+	.vdisplay = 768,
+	.vsync_start = 768 + 4,
+	.vsync_end = 768 + 4 + 6,
+	.vtotal = 768 + 4 + 6 + 15,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc auo_b116xak01 = {
+	.modes = &auo_b116xak01_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct drm_display_mode auo_b133xtn01_mode = {
 	.clock = 69500,
 	.hdisplay = 1366,
@@ -3125,6 +3154,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b133htn01",
 		.data = &auo_b133htn01,
+	}, {
+		.compatible = "auo,b116xa01",
+		.data = &auo_b116xak01,
 	}, {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
-- 
2.24.1

