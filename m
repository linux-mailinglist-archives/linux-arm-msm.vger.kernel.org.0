Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3C33D6B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 03:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhG0BFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 21:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhG0BFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 21:05:05 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DF8C061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 18:45:33 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e14so13962321plh.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=djJ42KZbNCYAQLpEgTeLiylrNPhIKMXN/NYPrLGQUTY=;
        b=ct8xWDFmpiwZBZDjoN/NLlL2ytVLjGXfrJpsvHmhq4WrN5p4El1oIZNUS6hRTrXhF/
         HmRQv5/7MFlBnK1xp2+LqsRyNbvgf+TkVThQkZIPYAQRvebZfQOjKsCgPBqrDx+AQdla
         EiikmQ9OtqS+Dm9HyJwWejAhY8woxGb+eyQXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=djJ42KZbNCYAQLpEgTeLiylrNPhIKMXN/NYPrLGQUTY=;
        b=Hz9laakIHpFf2oKPYOhfeVlp8ABWhvq77IJa8gz02YaNS1O4nXMIEcrKpJ4znxcVEk
         NQzMsH4B4gYo7VBheigCh2MNtsuzBPb9AzZi64n2zUEJXkokfed5lmCqAoB3n0zZbZ1Q
         jW5r1nOKv+cFXhSwKbkVQdIin0wWwgd6NfjW96hsUkkDm3VGFTBinjWpCku9Ym3fblny
         jujN0Xoi380PUotU7lleF3K+TyQH4t0PBuofUfDsLGjxeKlXIRqcVJ6wbt3uEHpUqygf
         f98/V7KFd3VCtg0AdKvQ1pAIqpg0WyCAp+r3YfGVTtJxHWWKMENuYsEsSCXYmzPqFQ32
         eVgg==
X-Gm-Message-State: AOAM531RSNThbzPo8+YO/qHH5EMy7iUuIPrvLbI8Mu07vgQAh1q+09fA
        WuuLjqYYLRiUoqLEvMSdAxqGAQ==
X-Google-Smtp-Source: ABdhPJy7zygGZYDzDfMduE3zpHb2543DopspEIs/2lgcAuUDs1bRwb+J65tIwuLRtEQK4tdjq7vLkw==
X-Received: by 2002:a17:902:aa43:b029:12b:d643:6814 with SMTP id c3-20020a170902aa43b029012bd6436814mr13544499plr.34.1627350332840;
        Mon, 26 Jul 2021 18:45:32 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:95:205:bda9:a1ad:31f8:a0da])
        by smtp.gmail.com with ESMTPSA id x16sm894136pjq.0.2021.07.26.18.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:45:31 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@samsung.com>,
        Xin Ji <xji@analogixsemi.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Marek <jonathan@marek.ca>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Yu Jiahua <yujiahua1@huawei.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
Date:   Tue, 27 Jul 2021 09:45:21 +0800
Message-Id: <20210727094435.v3.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many of the DSI flags have names opposite to their actual effects,
e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
be disabled. Fix this by including _NO_ in the flag names, e.g.
MIPI_DSI_MODE_NO_EOT_PACKET.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
---
I considered adding _DISABLE_ instead, but that'd make the
flag names a big too long.

Generated with:
flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
  xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
  xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
  xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
  xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
(then minor format changes)

Changes in v3:
 - Added all R-b tags from v1 and v2 (hopefully didn't miss any).

Changes in v2:
 - Rebased on latest linux-next, after some of the flags got fixed
   (Linus Walleij).

 drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
 drivers/gpu/drm/bridge/lontium-lt8912b.c             | 2 +-
 drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
 drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                   | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
 drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
 include/drm/drm_mipi_dsi.h                           | 8 ++++----
 22 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index aa19d5a40e31..59d718bde8c4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -165,7 +165,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 	dsi->lanes = adv->num_dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
+			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..be987c836891 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1307,7 +1307,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
-		MIPI_DSI_MODE_EOT_PACKET	|
+		MIPI_DSI_MODE_NO_EOT_PACKET	|
 		MIPI_DSI_MODE_VIDEO_HSE;
 
 	if (mipi_dsi_attach(dsi) < 0) {
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index b31281f76117..e6e331071a00 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -829,7 +829,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 	tmp = DIV_ROUND_UP(dsi_cfg.htotal, nlanes) -
 	      DIV_ROUND_UP(dsi_cfg.hsa, nlanes);
 
-	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		tmp -= DIV_ROUND_UP(DSI_EOT_PKT_SIZE, nlanes);
 
 	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
@@ -902,7 +902,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 	tmp = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
 	tmp &= ~(IF_VID_SELECT_MASK | HOST_EOT_GEN | IF_VID_MODE);
 
-	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		tmp |= HOST_EOT_GEN;
 
 	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO)
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 76c720b535fb..1b0c7eaf6c84 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -487,7 +487,7 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM |
-			  MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 8ed8302d6bbb..320f95ae6077 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -825,7 +825,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= TC358768_DSI_CONTROL_HSCKMD;
 
-	if (dsi_dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
+	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		val |= TC358768_DSI_CONTROL_EOTDIS;
 
 	tc358768_write(priv, TC358768_DSI_CONFW, val);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 1d777d8c1a83..e39fac889edc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -809,15 +809,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
 			reg |= DSIM_HSE_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HFP))
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
 			reg |= DSIM_HFP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HBP))
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
 			reg |= DSIM_HBP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSA))
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
 			reg |= DSIM_HSA_MODE;
 	}
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		reg |= DSIM_EOT_DISABLE;
 
 	switch (dsi->format) {
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 34a00d7e9c38..524852ed68f1 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 		DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
 		DSI_MCTL_MAIN_DATA_CTL_READ_EN |
 		DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
-	if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+	if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
 	writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..93b40c245f00 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -404,7 +404,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
 		tmp_reg |= HSTX_CKLP_EN;
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		tmp_reg |= DIS_EOT;
 
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
@@ -481,7 +481,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 			  timing->da_hs_zero + timing->da_hs_exit + 3;
 
 	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
-	delta += dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET ? 2 : 0;
+	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
 
 	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
 	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ed504fe5074f..b466a4af7c3e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -849,11 +849,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	if (flags & MIPI_DSI_MODE_VIDEO) {
 		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
 			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
-		if (flags & MIPI_DSI_MODE_VIDEO_HFP)
+		if (flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
 			data |= DSI_VID_CFG0_HFP_POWER_STOP;
-		if (flags & MIPI_DSI_MODE_VIDEO_HBP)
+		if (flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
 			data |= DSI_VID_CFG0_HBP_POWER_STOP;
-		if (flags & MIPI_DSI_MODE_VIDEO_HSA)
+		if (flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
 			data |= DSI_VID_CFG0_HSA_POWER_STOP;
 		/* Always set low power stop mode for BLLP
 		 * to let command engine send packets
@@ -908,7 +908,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 			  DSI_T_CLK_PRE_EXTEND_INC_BY_2_BYTECLK);
 
 	data = 0;
-	if (!(flags & MIPI_DSI_MODE_EOT_PACKET))
+	if (!(flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		data |= DSI_EOT_PACKET_CTRL_TX_EOT_APPEND;
 	dsi_write(msm_host, REG_DSI_EOT_PACKET_CTRL, data);
 
diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index e95bc9f60b3f..44674ebedf59 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -302,7 +302,7 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |
+			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
 	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 5fbfb71ca3d9..da4a69067e18 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -574,7 +574,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 2;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
-			  MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_NO_EOT_PACKET;
 	dsi->hs_rate = ddata->panel_data->max_hs_rate;
 	dsi->lp_rate = ddata->panel_data->max_lp_rate;
 
diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 4787f0833264..80227617a4d6 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -273,7 +273,7 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 8f6ac1a40c31..a3ec4cbdbf7a 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -809,7 +809,7 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	khadas_ts050 = devm_kzalloc(&dsi->dev, sizeof(*khadas_ts050),
 				    GFP_KERNEL);
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index ed0d5f959037..a5a414920430 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -593,7 +593,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index 3c00e4f8f803..21e48923836d 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -442,7 +442,7 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 45b975dee587..198493a6eb6a 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -184,7 +184,7 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	osd101t2587 = devm_kzalloc(&dsi->dev, sizeof(*osd101t2587), GFP_KERNEL);
 	if (!osd101t2587)
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index b962c817fb30..ccc8ed6fe3ae 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -446,7 +446,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_EOT_PACKET;
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ctx->supplies[0].supply = "vdd3";
 	ctx->supplies[1].supply = "vci";
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index 527371120266..9b3599d6d2de 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -990,8 +990,8 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
-		| MIPI_DSI_MODE_VIDEO_HFP | MIPI_DSI_MODE_VIDEO_HBP
-		| MIPI_DSI_MODE_VIDEO_HSA | MIPI_DSI_MODE_EOT_PACKET
+		| MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
+		| MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET
 		| MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
 
 	ret = s6e8aa0_parse_dt(ctx);
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 16dbf0f353ed..b937e24dac8e 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -282,7 +282,7 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			MIPI_DSI_MODE_VIDEO_HSE |
 			MIPI_DSI_CLOCK_NON_CONTINUOUS |
-			MIPI_DSI_MODE_EOT_PACKET;
+			MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	sharp_nt = devm_kzalloc(&dsi->dev, sizeof(*sharp_nt), GFP_KERNEL);
 	if (!sharp_nt)
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 461794ae4188..f96d48e4b2e6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5006,7 +5006,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
 	},
 	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-		 MIPI_DSI_MODE_EOT_PACKET,
+		 MIPI_DSI_MODE_NO_EOT_PACKET,
 	.format = MIPI_DSI_FMT_RGB888,
 	.lanes = 4,
 };
diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 55172d63a922..d17aae8b71d7 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -311,7 +311,7 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &xpp055c272_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 849d3029e303..af7ba8071eb0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -124,15 +124,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 /* enable hsync-end packets in vsync-pulse and v-porch area */
 #define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)
 /* disable hfront-porch area */
-#define MIPI_DSI_MODE_VIDEO_HFP		BIT(5)
+#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
 /* disable hback-porch area */
-#define MIPI_DSI_MODE_VIDEO_HBP		BIT(6)
+#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
 /* disable hsync-active area */
-#define MIPI_DSI_MODE_VIDEO_HSA		BIT(7)
+#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
 /* flush display FIFO on vsync pulse */
 #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
 /* disable EoT packets in HS mode */
-#define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
+#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
 /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
 #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
 /* transmit data in low power */
-- 
2.32.0.432.gabb21c7263-goog

