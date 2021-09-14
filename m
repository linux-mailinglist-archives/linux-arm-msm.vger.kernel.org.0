Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6314740B91F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbhINUYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234171AbhINUX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:23:58 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B6BC061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:33 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g184so361157pgc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NH7MouuN+JMnS7u81ABiAaGsF1sGD1a2bltSUGHUySY=;
        b=nXmi+YpSTzMCYrZJaAMZOBpKQUW9w0rdxptvfgfsDNFw/dQXNY9VAVfKWuAYD30Igx
         /cjt3GBnOJX57NmXkHa6p9Z+P5BMTQzKcXinRUzmMoTX+1N7dNmb4seMD/ovJUAWZ0T1
         yJKllp41/v+VogkU01ODGiKyYXwVcvOMxv4/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NH7MouuN+JMnS7u81ABiAaGsF1sGD1a2bltSUGHUySY=;
        b=Ln/7C9EuN65pL2NHOGohZR7aK3Gzk1smSOqn2h0sNgagV0SrWPQIeXg04L60NRfvTz
         ahPiw1U/6U1U0Z/PUW3QjnsrQymS332vh4vKx9DFHlKmTuWyjZm1TZy8QZEKiwR0hmUr
         AVSQNBlMNpWUr70uM20iScsye9F6wkf2qoi6fBghCbcDrYgziGRLkuGR5k4raJoYsb+r
         jyQEhCGSMOaErJ+eD1AL/reUkeDZX0Kc4boqO1SG0XQKo1ai78/bZgdKqHS6Y4qi8xfK
         T3WwLPuEfGswehHLZJEMc/+v6RTuQemtYUtNlxkwJa3br8v3l/q34dJKCGbZQ4wIUWo7
         geaQ==
X-Gm-Message-State: AOAM532YKSHW5GZU2Rd6QbpfVirk9mHz7YHo0S/T6TvRtnG4I3n/Icnp
        c3ZhZeHBfBzQeQ5S4LU4gEuQVg==
X-Google-Smtp-Source: ABdhPJwMBNZmFU9r5aOTYxloWmj0wmtiAESsxTSkGK73dMO0OZXal3Ss5mfDUaNCzryOQsHePNmApQ==
X-Received: by 2002:a63:af4a:: with SMTP id s10mr16957272pgo.469.1631650953277;
        Tue, 14 Sep 2021 13:22:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:32 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Yakir Yang <ykk@rock-chips.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/15] drm/panel-edp: Move some wayward panels to the eDP driver
Date:   Tue, 14 Sep 2021 13:21:55 -0700
Message-Id: <20210914132020.v5.8.I84e36f9f86d5d693fce0641a55ddb264a518a947@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all panels in panel-simple were marked what type of panel they
were. I searched through ARM/ARM64 Chromebooks or Chromebook-related
reference boards that I was aware of and found some panels that needed
to be moved. I also skimmed for panels that had no mode and were "big"
since it's quite rare to see a small eDP panel. Here's what I found:
* auo,b101ean01 - rk3288-veyron-minnie
* auo,b133htn01 - exynos5800-peach-pi
* auo,b133xtn01 - tegra124-nyan-big
* boe,nv101wxmn51 - rk3399-gru-bob
* innolux,p120zdg-bf1 - sdm845-cheza
* lg,lp079qx1-sp0v - rk3399-evb and similar
* lg,lp097qx1-spa1 - According to commit 0355dde26e52 ("drm/panel:
  simple: Add support for LG LP097QX1-SPA1 panel") this is an eDP
  panel.
* lg,lp129qe - tegra124-venice2
* samsung,lsn122dl01-c01 - According to commit 0330eaf39082
  ("drm/panel: simple: Add support for Samsung LSN122DL01-C01 panel")
  this is an eDP panel.
* samsung,ltn140at29-301 - tegra124-nyan-blaze
* sharp,ld-d5116z01b - According to commit cd5e1cbe1f0a ("drm/panel:
  simple: Add support for Sharp LD-D5116Z01B panel") this is an eDP
  panel.
* sharp,lq123p1jx31 - rk3399-gru-kevin
* starry,kr122ea0sra - rk3399-gru-gru (reference board, not upstream)

I won't promise that I didn't miss a single panel, but that's fairly
complete I think.

I'm not sure the full impact of the fact that they didn't have the
connector type specified, but at least as of commit 9f069c6fbc72
("drm/panel: panel-simple: add default connector_type") we may have
been accidentally thinking of them as DPI panels. We also would
certainly have had a warning. In any case since we don't want to
support anything eDP in the old simple-panel driver, we should move
these.

Cc: Yakir Yang <ykk@rock-chips.com>
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- Move wayward panels patch new for v3.

 drivers/gpu/drm/panel/panel-edp.c    | 363 ++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c | 365 ---------------------------
 2 files changed, 363 insertions(+), 365 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a3f609edface..b698594ba43b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -723,6 +723,28 @@ static void panel_edp_shutdown(struct device *dev)
 	drm_panel_unprepare(&panel->base);
 }
 
+static const struct display_timing auo_b101ean01_timing = {
+	.pixelclock = { 65300000, 72500000, 75000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 18, 119, 119 },
+	.hback_porch = { 21, 21, 21 },
+	.hsync_len = { 32, 32, 32 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 8, 8, 8 },
+	.vsync_len = { 18, 20, 20 },
+};
+
+static const struct panel_desc auo_b101ean01 = {
+	.timings = &auo_b101ean01_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+};
+
 static const struct drm_display_mode auo_b116xak01_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -802,6 +824,55 @@ static const struct panel_desc auo_b133han05 = {
 	},
 };
 
+static const struct drm_display_mode auo_b133htn01_mode = {
+	.clock = 150660,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 172,
+	.hsync_end = 1920 + 172 + 80,
+	.htotal = 1920 + 172 + 80 + 60,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 25,
+	.vsync_end = 1080 + 25 + 10,
+	.vtotal = 1080 + 25 + 10 + 10,
+};
+
+static const struct panel_desc auo_b133htn01 = {
+	.modes = &auo_b133htn01_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 293,
+		.height = 165,
+	},
+	.delay = {
+		.prepare = 105,
+		.enable = 20,
+		.unprepare = 50,
+	},
+};
+
+static const struct drm_display_mode auo_b133xtn01_mode = {
+	.clock = 69500,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 48,
+	.hsync_end = 1366 + 48 + 32,
+	.htotal = 1366 + 48 + 32 + 20,
+	.vdisplay = 768,
+	.vsync_start = 768 + 3,
+	.vsync_end = 768 + 3 + 6,
+	.vtotal = 768 + 3 + 6 + 13,
+};
+
+static const struct panel_desc auo_b133xtn01 = {
+	.modes = &auo_b133xtn01_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 293,
+		.height = 165,
+	},
+};
+
 static const struct drm_display_mode auo_b140han06_mode = {
 	.clock = 141000,
 	.hdisplay = 1920,
@@ -829,6 +900,46 @@ static const struct panel_desc auo_b140han06 = {
 	},
 };
 
+static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
+	{
+		.clock = 71900,
+		.hdisplay = 1280,
+		.hsync_start = 1280 + 48,
+		.hsync_end = 1280 + 48 + 32,
+		.htotal = 1280 + 48 + 32 + 80,
+		.vdisplay = 800,
+		.vsync_start = 800 + 3,
+		.vsync_end = 800 + 3 + 5,
+		.vtotal = 800 + 3 + 5 + 24,
+	},
+	{
+		.clock = 57500,
+		.hdisplay = 1280,
+		.hsync_start = 1280 + 48,
+		.hsync_end = 1280 + 48 + 32,
+		.htotal = 1280 + 48 + 32 + 80,
+		.vdisplay = 800,
+		.vsync_start = 800 + 3,
+		.vsync_end = 800 + 3 + 5,
+		.vtotal = 800 + 3 + 5 + 24,
+	},
+};
+
+static const struct panel_desc boe_nv101wxmn51 = {
+	.modes = boe_nv101wxmn51_modes,
+	.num_modes = ARRAY_SIZE(boe_nv101wxmn51_modes),
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		.prepare = 210,
+		.enable = 50,
+		.unprepare = 160,
+	},
+};
+
 static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
 	{
 		.clock = 207800,
@@ -1027,6 +1138,33 @@ static const struct panel_desc innolux_n125hce_gn1 = {
 	},
 };
 
+static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
+	.clock = 206016,
+	.hdisplay = 2160,
+	.hsync_start = 2160 + 48,
+	.hsync_end = 2160 + 48 + 32,
+	.htotal = 2160 + 48 + 32 + 80,
+	.vdisplay = 1440,
+	.vsync_start = 1440 + 3,
+	.vsync_end = 1440 + 3 + 10,
+	.vtotal = 1440 + 3 + 10 + 27,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc innolux_p120zdg_bf1 = {
+	.modes = &innolux_p120zdg_bf1_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 254,
+		.height = 169,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.unprepare = 500,
+	},
+};
+
 static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
 	.clock = 138778,
 	.hdisplay = 1920,
@@ -1080,6 +1218,49 @@ static const struct panel_desc kingdisplay_kd116n21_30nv_a010 = {
 	},
 };
 
+static const struct drm_display_mode lg_lp079qx1_sp0v_mode = {
+	.clock = 200000,
+	.hdisplay = 1536,
+	.hsync_start = 1536 + 12,
+	.hsync_end = 1536 + 12 + 16,
+	.htotal = 1536 + 12 + 16 + 48,
+	.vdisplay = 2048,
+	.vsync_start = 2048 + 8,
+	.vsync_end = 2048 + 8 + 4,
+	.vtotal = 2048 + 8 + 4 + 8,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc lg_lp079qx1_sp0v = {
+	.modes = &lg_lp079qx1_sp0v_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 129,
+		.height = 171,
+	},
+};
+
+static const struct drm_display_mode lg_lp097qx1_spa1_mode = {
+	.clock = 205210,
+	.hdisplay = 2048,
+	.hsync_start = 2048 + 150,
+	.hsync_end = 2048 + 150 + 5,
+	.htotal = 2048 + 150 + 5 + 5,
+	.vdisplay = 1536,
+	.vsync_start = 1536 + 3,
+	.vsync_end = 1536 + 3 + 1,
+	.vtotal = 1536 + 3 + 1 + 9,
+};
+
+static const struct panel_desc lg_lp097qx1_spa1 = {
+	.modes = &lg_lp097qx1_spa1_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 208,
+		.height = 147,
+	},
+};
+
 static const struct drm_display_mode lg_lp120up1_mode = {
 	.clock = 162300,
 	.hdisplay = 1920,
@@ -1102,6 +1283,28 @@ static const struct panel_desc lg_lp120up1 = {
 	},
 };
 
+static const struct drm_display_mode lg_lp129qe_mode = {
+	.clock = 285250,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 48,
+	.hsync_end = 2560 + 48 + 32,
+	.htotal = 2560 + 48 + 32 + 80,
+	.vdisplay = 1700,
+	.vsync_start = 1700 + 3,
+	.vsync_end = 1700 + 3 + 10,
+	.vtotal = 1700 + 3 + 10 + 36,
+};
+
+static const struct panel_desc lg_lp129qe = {
+	.modes = &lg_lp129qe_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 272,
+		.height = 181,
+	},
+};
+
 static const struct drm_display_mode neweast_wjfh116008a_modes[] = {
 	{
 		.clock = 138500,
@@ -1143,8 +1346,132 @@ static const struct panel_desc neweast_wjfh116008a = {
 	},
 };
 
+static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
+	.clock = 271560,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 48,
+	.hsync_end = 2560 + 48 + 32,
+	.htotal = 2560 + 48 + 32 + 80,
+	.vdisplay = 1600,
+	.vsync_start = 1600 + 2,
+	.vsync_end = 1600 + 2 + 5,
+	.vtotal = 1600 + 2 + 5 + 57,
+};
+
+static const struct panel_desc samsung_lsn122dl01_c01 = {
+	.modes = &samsung_lsn122dl01_c01_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 263,
+		.height = 164,
+	},
+};
+
+static const struct drm_display_mode samsung_ltn140at29_301_mode = {
+	.clock = 76300,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 64,
+	.hsync_end = 1366 + 64 + 48,
+	.htotal = 1366 + 64 + 48 + 128,
+	.vdisplay = 768,
+	.vsync_start = 768 + 2,
+	.vsync_end = 768 + 2 + 5,
+	.vtotal = 768 + 2 + 5 + 17,
+};
+
+static const struct panel_desc samsung_ltn140at29_301 = {
+	.modes = &samsung_ltn140at29_301_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 320,
+		.height = 187,
+	},
+};
+
+static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
+	.clock = 168480,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 80,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 3,
+	.vsync_end = 1280 + 3 + 10,
+	.vtotal = 1280 + 3 + 10 + 57,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc sharp_ld_d5116z01b = {
+	.modes = &sharp_ld_d5116z01b_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 260,
+		.height = 120,
+	},
+};
+
+static const struct display_timing sharp_lq123p1jx31_timing = {
+	.pixelclock = { 252750000, 252750000, 266604720 },
+	.hactive = { 2400, 2400, 2400 },
+	.hfront_porch = { 48, 48, 48 },
+	.hback_porch = { 80, 80, 84 },
+	.hsync_len = { 32, 32, 32 },
+	.vactive = { 1600, 1600, 1600 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 33, 33, 120 },
+	.vsync_len = { 10, 10, 10 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc sharp_lq123p1jx31 = {
+	.timings = &sharp_lq123p1jx31_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 259,
+		.height = 173,
+	},
+	.delay = {
+		.prepare = 110,
+		.enable = 50,
+		.unprepare = 550,
+	},
+};
+
+static const struct drm_display_mode starry_kr122ea0sra_mode = {
+	.clock = 147000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 16,
+	.hsync_end = 1920 + 16 + 16,
+	.htotal = 1920 + 16 + 16 + 32,
+	.vdisplay = 1200,
+	.vsync_start = 1200 + 15,
+	.vsync_end = 1200 + 15 + 2,
+	.vtotal = 1200 + 15 + 2 + 18,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc starry_kr122ea0sra = {
+	.modes = &starry_kr122ea0sra_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 263,
+		.height = 164,
+	},
+	.delay = {
+		.prepare = 10 + 200,
+		.enable = 50,
+		.unprepare = 10 + 500,
+	},
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
+		.compatible = "auo,b101ean01",
+		.data = &auo_b101ean01,
+	}, {
 		.compatible = "auo,b116xa01",
 		.data = &auo_b116xak01,
 	}, {
@@ -1153,9 +1480,18 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b133han05",
 		.data = &auo_b133han05,
+	}, {
+		.compatible = "auo,b133htn01",
+		.data = &auo_b133htn01,
+	}, {
+		.compatible = "auo,b133xtn01",
+		.data = &auo_b133xtn01,
 	}, {
 		.compatible = "auo,b140han06",
 		.data = &auo_b140han06,
+	}, {
+		.compatible = "boe,nv101wxmn51",
+		.data = &boe_nv101wxmn51,
 	}, {
 		.compatible = "boe,nv110wtm-n61",
 		.data = &boe_nv110wtm_n61,
@@ -1177,18 +1513,45 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n125hce-gn1",
 		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "innolux,p120zdg-bf1",
+		.data = &innolux_p120zdg_bf1,
 	}, {
 		.compatible = "ivo,m133nwf4-r0",
 		.data = &ivo_m133nwf4_r0,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
+	}, {
+		.compatible = "lg,lp079qx1-sp0v",
+		.data = &lg_lp079qx1_sp0v,
+	}, {
+		.compatible = "lg,lp097qx1-spa1",
+		.data = &lg_lp097qx1_spa1,
 	}, {
 		.compatible = "lg,lp120up1",
 		.data = &lg_lp120up1,
+	}, {
+		.compatible = "lg,lp129qe",
+		.data = &lg_lp129qe,
 	}, {
 		.compatible = "neweast,wjfh116008a",
 		.data = &neweast_wjfh116008a,
+	}, {
+		.compatible = "samsung,lsn122dl01-c01",
+		.data = &samsung_lsn122dl01_c01,
+	}, {
+		.compatible = "samsung,ltn140at29-301",
+		.data = &samsung_ltn140at29_301,
+	}, {
+		.compatible = "sharp,ld-d5116z01b",
+		.data = &sharp_ld_d5116z01b,
+	}, {
+		.compatible = "sharp,lq123p1jx31",
+		.data = &sharp_lq123p1jx31,
+	}, {
+		.compatible = "starry,kr122ea0sra",
+		.data = &starry_kr122ea0sra,
 	}, {
 		/* sentinel */
 	}
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 317bf4f95d87..79cbad7e8c84 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -954,28 +954,6 @@ static const struct panel_desc auo_b101aw03 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct display_timing auo_b101ean01_timing = {
-	.pixelclock = { 65300000, 72500000, 75000000 },
-	.hactive = { 1280, 1280, 1280 },
-	.hfront_porch = { 18, 119, 119 },
-	.hback_porch = { 21, 21, 21 },
-	.hsync_len = { 32, 32, 32 },
-	.vactive = { 800, 800, 800 },
-	.vfront_porch = { 4, 4, 4 },
-	.vback_porch = { 8, 8, 8 },
-	.vsync_len = { 18, 20, 20 },
-};
-
-static const struct panel_desc auo_b101ean01 = {
-	.timings = &auo_b101ean01_timing,
-	.num_timings = 1,
-	.bpc = 6,
-	.size = {
-		.width = 217,
-		.height = 136,
-	},
-};
-
 static const struct drm_display_mode auo_b101xtn01_mode = {
 	.clock = 72000,
 	.hdisplay = 1366,
@@ -999,55 +977,6 @@ static const struct panel_desc auo_b101xtn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b133xtn01_mode = {
-	.clock = 69500,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 48,
-	.hsync_end = 1366 + 48 + 32,
-	.htotal = 1366 + 48 + 32 + 20,
-	.vdisplay = 768,
-	.vsync_start = 768 + 3,
-	.vsync_end = 768 + 3 + 6,
-	.vtotal = 768 + 3 + 6 + 13,
-};
-
-static const struct panel_desc auo_b133xtn01 = {
-	.modes = &auo_b133xtn01_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 293,
-		.height = 165,
-	},
-};
-
-static const struct drm_display_mode auo_b133htn01_mode = {
-	.clock = 150660,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 172,
-	.hsync_end = 1920 + 172 + 80,
-	.htotal = 1920 + 172 + 80 + 60,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 25,
-	.vsync_end = 1080 + 25 + 10,
-	.vtotal = 1080 + 25 + 10 + 10,
-};
-
-static const struct panel_desc auo_b133htn01 = {
-	.modes = &auo_b133htn01_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 293,
-		.height = 165,
-	},
-	.delay = {
-		.prepare = 105,
-		.enable = 20,
-		.unprepare = 50,
-	},
-};
-
 static const struct display_timing auo_g070vvn01_timings = {
 	.pixelclock = { 33300000, 34209000, 45000000 },
 	.hactive = { 800, 800, 800 },
@@ -1391,46 +1320,6 @@ static const struct panel_desc boe_hv070wsa = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
-	{
-		.clock = 71900,
-		.hdisplay = 1280,
-		.hsync_start = 1280 + 48,
-		.hsync_end = 1280 + 48 + 32,
-		.htotal = 1280 + 48 + 32 + 80,
-		.vdisplay = 800,
-		.vsync_start = 800 + 3,
-		.vsync_end = 800 + 3 + 5,
-		.vtotal = 800 + 3 + 5 + 24,
-	},
-	{
-		.clock = 57500,
-		.hdisplay = 1280,
-		.hsync_start = 1280 + 48,
-		.hsync_end = 1280 + 48 + 32,
-		.htotal = 1280 + 48 + 32 + 80,
-		.vdisplay = 800,
-		.vsync_start = 800 + 3,
-		.vsync_end = 800 + 3 + 5,
-		.vtotal = 800 + 3 + 5 + 24,
-	},
-};
-
-static const struct panel_desc boe_nv101wxmn51 = {
-	.modes = boe_nv101wxmn51_modes,
-	.num_modes = ARRAY_SIZE(boe_nv101wxmn51_modes),
-	.bpc = 8,
-	.size = {
-		.width = 217,
-		.height = 136,
-	},
-	.delay = {
-		.prepare = 210,
-		.enable = 50,
-		.unprepare = 160,
-	},
-};
-
 static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -2378,33 +2267,6 @@ static const struct panel_desc innolux_n156bge_l21 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
-	.clock = 206016,
-	.hdisplay = 2160,
-	.hsync_start = 2160 + 48,
-	.hsync_end = 2160 + 48 + 32,
-	.htotal = 2160 + 48 + 32 + 80,
-	.vdisplay = 1440,
-	.vsync_start = 1440 + 3,
-	.vsync_end = 1440 + 3 + 10,
-	.vtotal = 1440 + 3 + 10 + 27,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
-};
-
-static const struct panel_desc innolux_p120zdg_bf1 = {
-	.modes = &innolux_p120zdg_bf1_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 254,
-		.height = 169,
-	},
-	.delay = {
-		.hpd_absent_delay = 200,
-		.unprepare = 500,
-	},
-};
-
 static const struct drm_display_mode innolux_zj070na_01p_mode = {
 	.clock = 51501,
 	.hdisplay = 1024,
@@ -2578,71 +2440,6 @@ static const struct panel_desc lg_lb070wv8 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode lg_lp079qx1_sp0v_mode = {
-	.clock = 200000,
-	.hdisplay = 1536,
-	.hsync_start = 1536 + 12,
-	.hsync_end = 1536 + 12 + 16,
-	.htotal = 1536 + 12 + 16 + 48,
-	.vdisplay = 2048,
-	.vsync_start = 2048 + 8,
-	.vsync_end = 2048 + 8 + 4,
-	.vtotal = 2048 + 8 + 4 + 8,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc lg_lp079qx1_sp0v = {
-	.modes = &lg_lp079qx1_sp0v_mode,
-	.num_modes = 1,
-	.size = {
-		.width = 129,
-		.height = 171,
-	},
-};
-
-static const struct drm_display_mode lg_lp097qx1_spa1_mode = {
-	.clock = 205210,
-	.hdisplay = 2048,
-	.hsync_start = 2048 + 150,
-	.hsync_end = 2048 + 150 + 5,
-	.htotal = 2048 + 150 + 5 + 5,
-	.vdisplay = 1536,
-	.vsync_start = 1536 + 3,
-	.vsync_end = 1536 + 3 + 1,
-	.vtotal = 1536 + 3 + 1 + 9,
-};
-
-static const struct panel_desc lg_lp097qx1_spa1 = {
-	.modes = &lg_lp097qx1_spa1_mode,
-	.num_modes = 1,
-	.size = {
-		.width = 208,
-		.height = 147,
-	},
-};
-
-static const struct drm_display_mode lg_lp129qe_mode = {
-	.clock = 285250,
-	.hdisplay = 2560,
-	.hsync_start = 2560 + 48,
-	.hsync_end = 2560 + 48 + 32,
-	.htotal = 2560 + 48 + 32 + 80,
-	.vdisplay = 1700,
-	.vsync_start = 1700 + 3,
-	.vsync_end = 1700 + 3 + 10,
-	.vtotal = 1700 + 3 + 10 + 36,
-};
-
-static const struct panel_desc lg_lp129qe = {
-	.modes = &lg_lp129qe_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 272,
-		.height = 181,
-	},
-};
-
 static const struct display_timing logictechno_lt161010_2nh_timing = {
 	.pixelclock = { 26400000, 33300000, 46800000 },
 	.hactive = { 800, 800, 800 },
@@ -3313,27 +3110,6 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
-	.clock = 271560,
-	.hdisplay = 2560,
-	.hsync_start = 2560 + 48,
-	.hsync_end = 2560 + 48 + 32,
-	.htotal = 2560 + 48 + 32 + 80,
-	.vdisplay = 1600,
-	.vsync_start = 1600 + 2,
-	.vsync_end = 1600 + 2 + 5,
-	.vtotal = 1600 + 2 + 5 + 57,
-};
-
-static const struct panel_desc samsung_lsn122dl01_c01 = {
-	.modes = &samsung_lsn122dl01_c01_mode,
-	.num_modes = 1,
-	.size = {
-		.width = 263,
-		.height = 164,
-	},
-};
-
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -3359,28 +3135,6 @@ static const struct panel_desc samsung_ltn101nt05 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode samsung_ltn140at29_301_mode = {
-	.clock = 76300,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 64,
-	.hsync_end = 1366 + 64 + 48,
-	.htotal = 1366 + 64 + 48 + 128,
-	.vdisplay = 768,
-	.vsync_start = 768 + 2,
-	.vsync_end = 768 + 2 + 5,
-	.vtotal = 768 + 2 + 5 + 17,
-};
-
-static const struct panel_desc samsung_ltn140at29_301 = {
-	.modes = &samsung_ltn140at29_301_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 320,
-		.height = 187,
-	},
-};
-
 static const struct display_timing satoz_sat050at40h12r2_timing = {
 	.pixelclock = {33300000, 33300000, 50000000},
 	.hactive = {800, 800, 800},
@@ -3405,31 +3159,6 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
-	.clock = 168480,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 48,
-	.hsync_end = 1920 + 48 + 32,
-	.htotal = 1920 + 48 + 32 + 80,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 3,
-	.vsync_end = 1280 + 3 + 10,
-	.vtotal = 1280 + 3 + 10 + 57,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
-};
-
-static const struct panel_desc sharp_ld_d5116z01b = {
-	.modes = &sharp_ld_d5116z01b_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 260,
-		.height = 120,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-};
-
 static const struct drm_display_mode sharp_lq070y3dg3b_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -3504,34 +3233,6 @@ static const struct panel_desc sharp_lq101k1ly04 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct display_timing sharp_lq123p1jx31_timing = {
-	.pixelclock = { 252750000, 252750000, 266604720 },
-	.hactive = { 2400, 2400, 2400 },
-	.hfront_porch = { 48, 48, 48 },
-	.hback_porch = { 80, 80, 84 },
-	.hsync_len = { 32, 32, 32 },
-	.vactive = { 1600, 1600, 1600 },
-	.vfront_porch = { 3, 3, 3 },
-	.vback_porch = { 33, 33, 120 },
-	.vsync_len = { 10, 10, 10 },
-	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
-};
-
-static const struct panel_desc sharp_lq123p1jx31 = {
-	.timings = &sharp_lq123p1jx31_timing,
-	.num_timings = 1,
-	.bpc = 8,
-	.size = {
-		.width = 259,
-		.height = 173,
-	},
-	.delay = {
-		.prepare = 110,
-		.enable = 50,
-		.unprepare = 550,
-	},
-};
-
 static const struct drm_display_mode sharp_ls020b1dd01d_modes[] = {
 	{ /* 50 Hz */
 		.clock = 3000,
@@ -3620,33 +3321,6 @@ static const struct panel_desc starry_kr070pe2t = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-static const struct drm_display_mode starry_kr122ea0sra_mode = {
-	.clock = 147000,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 16,
-	.hsync_end = 1920 + 16 + 16,
-	.htotal = 1920 + 16 + 16 + 32,
-	.vdisplay = 1200,
-	.vsync_start = 1200 + 15,
-	.vsync_end = 1200 + 15 + 2,
-	.vtotal = 1200 + 15 + 2 + 18,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc starry_kr122ea0sra = {
-	.modes = &starry_kr122ea0sra_mode,
-	.num_modes = 1,
-	.size = {
-		.width = 263,
-		.height = 164,
-	},
-	.delay = {
-		.prepare = 10 + 200,
-		.enable = 50,
-		.unprepare = 10 + 500,
-	},
-};
-
 static const struct drm_display_mode tfc_s9700rtwv43tr_01b_mode = {
 	.clock = 30000,
 	.hdisplay = 800,
@@ -4013,18 +3687,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b101aw03",
 		.data = &auo_b101aw03,
-	}, {
-		.compatible = "auo,b101ean01",
-		.data = &auo_b101ean01,
 	}, {
 		.compatible = "auo,b101xtn01",
 		.data = &auo_b101xtn01,
-	}, {
-		.compatible = "auo,b133htn01",
-		.data = &auo_b133htn01,
-	}, {
-		.compatible = "auo,b133xtn01",
-		.data = &auo_b133xtn01,
 	}, {
 		.compatible = "auo,g070vvn01",
 		.data = &auo_g070vvn01,
@@ -4064,9 +3729,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,hv070wsa-100",
 		.data = &boe_hv070wsa
-	}, {
-		.compatible = "boe,nv101wxmn51",
-		.data = &boe_nv101wxmn51,
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
@@ -4181,9 +3843,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n156bge-l21",
 		.data = &innolux_n156bge_l21,
-	}, {
-		.compatible = "innolux,p120zdg-bf1",
-		.data = &innolux_p120zdg_bf1,
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
@@ -4205,15 +3864,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "lg,lb070wv8",
 		.data = &lg_lb070wv8,
-	}, {
-		.compatible = "lg,lp079qx1-sp0v",
-		.data = &lg_lp079qx1_sp0v,
-	}, {
-		.compatible = "lg,lp097qx1-spa1",
-		.data = &lg_lp097qx1_spa1,
-	}, {
-		.compatible = "lg,lp129qe",
-		.data = &lg_lp129qe,
 	}, {
 		.compatible = "logicpd,type28",
 		.data = &logicpd_type_28,
@@ -4292,21 +3942,12 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "rocktech,rk101ii01d-ct",
 		.data = &rocktech_rk101ii01d_ct,
-	}, {
-		.compatible = "samsung,lsn122dl01-c01",
-		.data = &samsung_lsn122dl01_c01,
 	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
-	}, {
-		.compatible = "samsung,ltn140at29-301",
-		.data = &samsung_ltn140at29_301,
 	}, {
 		.compatible = "satoz,sat050at40h12r2",
 		.data = &satoz_sat050at40h12r2,
-	}, {
-		.compatible = "sharp,ld-d5116z01b",
-		.data = &sharp_ld_d5116z01b,
 	}, {
 		.compatible = "sharp,lq035q7db03",
 		.data = &sharp_lq035q7db03,
@@ -4316,9 +3957,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "sharp,lq101k1ly04",
 		.data = &sharp_lq101k1ly04,
-	}, {
-		.compatible = "sharp,lq123p1jx31",
-		.data = &sharp_lq123p1jx31,
 	}, {
 		.compatible = "sharp,ls020b1dd01d",
 		.data = &sharp_ls020b1dd01d,
@@ -4328,9 +3966,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "starry,kr070pe2t",
 		.data = &starry_kr070pe2t,
-	}, {
-		.compatible = "starry,kr122ea0sra",
-		.data = &starry_kr122ea0sra,
 	}, {
 		.compatible = "tfc,s9700rtwv43tr-01b",
 		.data = &tfc_s9700rtwv43tr_01b,
-- 
2.33.0.309.g3052b89438-goog

