Return-Path: <linux-arm-msm+bounces-6105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33E820273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A1B283CD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD98A154A1;
	Fri, 29 Dec 2023 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMqCqbh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190415488
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e8ca6c76dso1884411e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890619; x=1704495419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AwJoYSjAQWusDI7zeWRWOjgm6qNRpa3IL5Kih1qDww=;
        b=iMqCqbh0DcDd8jk0QJ/1vE1coywh7GHmGuSCDH6LPYfdEllvc1jU7vYB32+u4ZjxHU
         vGQ5naGpe6QrTD3DOfZUXOJn9q+hy7i4VQ90e3LU+xzjWTpe6DqPoMy8qcn4R/wB/UPh
         aW1y+vt81LrVk+xpkny3fe/ld/R+cW32ZlhjHPWb65bn/iQZF5JvQmmd+8yvToilwr3g
         w6ctdWReRLo9wK/xwP+R6EwAc9XDoxBauetmjghqITKIhSvQlvMNwlyZNVWVZ7lwKbOb
         2i8fsSRcUkZbRlh7YqfAlUSVWqPCK93Sn63VOsi63a5bgBUhK+FLdILyjgKU00z5LRuw
         c+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890619; x=1704495419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AwJoYSjAQWusDI7zeWRWOjgm6qNRpa3IL5Kih1qDww=;
        b=WDhR4irBvmDpU39zvZ0Ef97yGLHwYsrKKa9JoJV6DuPgaUWMloFsgrrcxrGsLMP2bn
         fbSdSFjjw1/tJAdqIvzL4KGjd9JBfDJN8mdsnI58fG9qOoaE9RS0bVKpLIYQkNDmkl2J
         ABjj2XOVxrDXAoyqzoFaedcem4kLJ7SEnSoh3bevF5lAOvUpLS8bczNwg+rL7L9Br6Wu
         XK3aFpukE6PfF/u2mrosCy5w+PvNTfclpHtAPWOvv9RzD0h7MQG23zL2wGGhyGhiwSw6
         M8Nw+EiF3qbHitxO+ZGDKoa7DoHlJinzXxpiOQq7bp3YzUqEVRxAKOTQ9vilYb5V9aS3
         o23g==
X-Gm-Message-State: AOJu0Yw+5TOHa07L6R+4Zx57Csk+nJ3l0WHjBlo/ZBBhyl9Ol8sTHzMA
	2lgy4GcTjuNlodj41qOdJpLkeZ6Ba4qV1Q==
X-Google-Smtp-Source: AGHT+IEPTIdNzekUrWV+o3JW++zmn1jOaDA1HohcZ/PcaTJ5fa1PYaiCcjZiEEunEdiysi6J1l5aFg==
X-Received: by 2002:a05:6512:e86:b0:50e:7b00:8c83 with SMTP id bi6-20020a0565120e8600b0050e7b008c83mr3958979lfb.120.1703890619757;
        Fri, 29 Dec 2023 14:56:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 11/14] drm/msm/dp: move all IO handling to dp_catalog
Date: Sat, 30 Dec 2023 00:56:47 +0200
Message-Id: <20231229225650.912751-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than parsing the I/O addresses from dp_parser and then passing
them via a struct pointer to dp_catalog, handle I/O region parsing in
dp_catalog and drop it from dp_parser.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 125 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   6 +-
 drivers/gpu/drm/msm/dp/dp_parser.c  |  73 +---------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  27 +-----
 5 files changed, 115 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4c6207797c99..541aac2cb246 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/platform_device.h>
 #include <linux/rational.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -53,10 +54,31 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_DEFAULT_AHB_OFFSET	0x0000
+#define DP_DEFAULT_AHB_SIZE	0x0200
+#define DP_DEFAULT_AUX_OFFSET	0x0200
+#define DP_DEFAULT_AUX_SIZE	0x0200
+#define DP_DEFAULT_LINK_OFFSET	0x0400
+#define DP_DEFAULT_LINK_SIZE	0x0C00
+#define DP_DEFAULT_P0_OFFSET	0x1000
+#define DP_DEFAULT_P0_SIZE	0x0400
+
+struct dss_io_region {
+	size_t len;
+	void __iomem *base;
+};
+
+struct dss_io_data {
+	struct dss_io_region ahb;
+	struct dss_io_region aux;
+	struct dss_io_region link;
+	struct dss_io_region p0;
+};
+
 struct dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct dp_io *io;
+	struct dss_io_data io;
 	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct dp_catalog dp_catalog;
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
@@ -66,7 +88,7 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 			struct dp_catalog_private, dp_catalog);
-	struct dss_io_data *dss = &catalog->io->dp_controller;
+	struct dss_io_data *dss = &catalog->io;
 
 	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
 	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
@@ -76,7 +98,7 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io->dp_controller.aux.base + offset);
+	return readl_relaxed(catalog->io.aux.base + offset);
 }
 
 static inline void dp_write_aux(struct dp_catalog_private *catalog,
@@ -86,12 +108,12 @@ static inline void dp_write_aux(struct dp_catalog_private *catalog,
 	 * To make sure aux reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.aux.base + offset);
+	writel(data, catalog->io.aux.base + offset);
 }
 
 static inline u32 dp_read_ahb(const struct dp_catalog_private *catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io->dp_controller.ahb.base + offset);
+	return readl_relaxed(catalog->io.ahb.base + offset);
 }
 
 static inline void dp_write_ahb(struct dp_catalog_private *catalog,
@@ -101,7 +123,7 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.ahb.base + offset);
+	writel(data, catalog->io.ahb.base + offset);
 }
 
 static inline void dp_write_p0(struct dp_catalog_private *catalog,
@@ -111,7 +133,7 @@ static inline void dp_write_p0(struct dp_catalog_private *catalog,
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.p0.base + offset);
+	writel(data, catalog->io.p0.base + offset);
 }
 
 static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
@@ -121,12 +143,12 @@ static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io->dp_controller.p0.base + offset);
+	return readl_relaxed(catalog->io.p0.base + offset);
 }
 
 static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io->dp_controller.link.base + offset);
+	return readl_relaxed(catalog->io.link.base + offset);
 }
 
 static inline void dp_write_link(struct dp_catalog_private *catalog,
@@ -136,7 +158,7 @@ static inline void dp_write_link(struct dp_catalog_private *catalog,
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.link.base + offset);
+	writel(data, catalog->io.link.base + offset);
 }
 
 /* aux related catalog functions */
@@ -248,7 +270,7 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	/* poll for hpd connected status every 2ms and timeout after 500ms */
-	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
+	return readl_poll_timeout(catalog->io.aux.base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
 				2000, 500000);
@@ -276,7 +298,7 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
-	struct dss_io_data *io = &catalog->io->dp_controller;
+	struct dss_io_data *io = &catalog->io;
 
 	pr_info("AHB regs\n");
 	dump_regs(io->ahb.base, io->ahb.len);
@@ -500,7 +522,7 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link.base +
+	ret = readx_poll_timeout(readl, catalog->io.link.base +
 					REG_DP_MAINLINK_READY,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -563,7 +585,7 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(catalog->io->dp_controller.link.base +
+	ret = readl_poll_timeout(catalog->io.link.base +
 				REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -945,21 +967,84 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
 	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
-struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io)
+static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
-	struct dp_catalog_private *catalog;
+	struct resource *res;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
+	if (!IS_ERR(base))
+		*len = resource_size(res);
+
+	return base;
+}
+
+static int dp_catalog_get_io(struct dp_catalog_private *catalog)
+{
+	struct platform_device *pdev = to_platform_device(catalog->dev);
+	struct dss_io_data *dss = &catalog->io;
+
+	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
+	if (IS_ERR(dss->ahb.base))
+		return PTR_ERR(dss->ahb.base);
 
-	if (!io) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-EINVAL);
+	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
+	if (IS_ERR(dss->aux.base)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -EINVAL here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux.base) == -EINVAL) {
+			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
+			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
+			dss->aux.len = DP_DEFAULT_AUX_SIZE;
+			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
+			dss->link.len = DP_DEFAULT_LINK_SIZE;
+			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
+			dss->p0.len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
+			return PTR_ERR(dss->aux.base);
+		}
+	} else {
+		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
+		if (IS_ERR(dss->link.base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
+			return PTR_ERR(dss->link.base);
+		}
+
+		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
+		if (IS_ERR(dss->p0.base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
+			return PTR_ERR(dss->p0.base);
+		}
 	}
 
+	return 0;
+}
+
+struct dp_catalog *dp_catalog_get(struct device *dev)
+{
+	struct dp_catalog_private *catalog;
+	int ret;
+
 	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
 	if (!catalog)
 		return ERR_PTR(-ENOMEM);
 
 	catalog->dev = dev;
-	catalog->io = io;
+
+	ret = dp_catalog_get_io(catalog);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return &catalog->dp_catalog;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f3f58d4b8de..989e4c4fd6fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -126,7 +126,7 @@ void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
 void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
 
-struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io);
+struct dp_catalog *dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
 void dp_catalog_audio_get_header(struct dp_catalog *catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 405cd30c8d7e..9e0217a9ec07 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -721,7 +721,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->catalog = dp_catalog_get(dev, &dp->parser->io);
+	dp->catalog = dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
 		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
@@ -730,7 +730,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->aux = dp_aux_get(dev, dp->catalog,
-			     dp->parser->io.phy,
+			     dp->parser->phy,
 			     dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
@@ -761,7 +761,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
 			       dp->catalog,
-			       dp->parser->io.phy);
+			       dp->parser->phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index de7cfc340f0c..2d0dd4353cdf 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -13,80 +13,13 @@
 #include "dp_parser.h"
 #include "dp_reg.h"
 
-#define DP_DEFAULT_AHB_OFFSET	0x0000
-#define DP_DEFAULT_AHB_SIZE	0x0200
-#define DP_DEFAULT_AUX_OFFSET	0x0200
-#define DP_DEFAULT_AUX_SIZE	0x0200
-#define DP_DEFAULT_LINK_OFFSET	0x0400
-#define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
-
-static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
-{
-	struct resource *res;
-	void __iomem *base;
-
-	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
-	if (!IS_ERR(base))
-		*len = resource_size(res);
-
-	return base;
-}
-
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
 	struct platform_device *pdev = parser->pdev;
-	struct dp_io *io = &parser->io;
-	struct dss_io_data *dss = &io->dp_controller;
-
-	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
-	if (IS_ERR(dss->ahb.base))
-		return PTR_ERR(dss->ahb.base);
-
-	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
-	if (IS_ERR(dss->aux.base)) {
-		/*
-		 * The initial binding had a single reg, but in order to
-		 * support variation in the sub-region sizes this was split.
-		 * dp_ioremap() will fail with -EINVAL here if only a single
-		 * reg is specified, so fill in the sub-region offsets and
-		 * lengths based on this single region.
-		 */
-		if (PTR_ERR(dss->aux.base) == -EINVAL) {
-			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-				DRM_ERROR("legacy memory region not large enough\n");
-				return -EINVAL;
-			}
-
-			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-			dss->aux.len = DP_DEFAULT_AUX_SIZE;
-			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-			dss->link.len = DP_DEFAULT_LINK_SIZE;
-			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-			dss->p0.len = DP_DEFAULT_P0_SIZE;
-		} else {
-			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
-			return PTR_ERR(dss->aux.base);
-		}
-	} else {
-		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
-		if (IS_ERR(dss->link.base)) {
-			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
-			return PTR_ERR(dss->link.base);
-		}
-
-		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
-		if (IS_ERR(dss->p0.base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
-			return PTR_ERR(dss->p0.base);
-		}
-	}
 
-	io->phy = devm_phy_get(&pdev->dev, "dp");
-	if (IS_ERR(io->phy))
-		return PTR_ERR(io->phy);
+	parser->phy = devm_phy_get(&pdev->dev, "dp");
+	if (IS_ERR(parser->phy))
+		return PTR_ERR(parser->phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index b28052e87101..1e2ca4efb029 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -14,37 +14,16 @@
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
-struct dss_io_region {
-	size_t len;
-	void __iomem *base;
-};
-
-struct dss_io_data {
-	struct dss_io_region ahb;
-	struct dss_io_region aux;
-	struct dss_io_region link;
-	struct dss_io_region p0;
-};
-
-/**
- * struct dp_ctrl_resource - controller's IO related data
- *
- * @dp_controller: Display Port controller mapped memory address
- * @phy_io: phy's mapped memory address
- */
-struct dp_io {
-	struct dss_io_data dp_controller;
-	struct phy *phy;
-};
-
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
  * @pdev: platform data of the client
+ * @io: Display Port controller mapped memory address
+ * @phy: PHY handle
  */
 struct dp_parser {
 	struct platform_device *pdev;
-	struct dp_io io;
+	struct phy *phy;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
-- 
2.39.2


