Return-Path: <linux-arm-msm+bounces-6162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2120820954
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98AE7283B8A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD51228EC;
	Sun, 31 Dec 2023 00:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/1DbLeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509C210B
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e7c76897dso4881701e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983446; x=1704588246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQQ9ATVd7VfBQUqKuKta60Fr98a+Dv89kNqnWW4Q8MI=;
        b=N/1DbLeDD3GFSazgVXvbKGfxCxH5oNUnei51x4R9lSXcEWiPsj0sS9zR3Vv96oTQ2t
         y/JKVVu5KwOWuhIuymZDn6dPDCZ3vIJ66jPTMuMRI7X6QYYjLdtbC4mcI6vWldzAOgFq
         KX6XqK6lD7wJymgkRuBYxfoxNzqQlv7QU0FyEjJ31AWY7P4ffsuKcsr6XO00lHwoIKp9
         W7Zf7MdEK17dJwExJea6CzNH3H4w/dmqpxomb1WeoI5dz2m/T4TtySLk1YT1X43yMezw
         mPwPS7uoimUKfak6Xe5o1nYK4L1OC9fPiEzS5INs40bOjrGCehHX6t9IfxQOhHEdxLFi
         MJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983446; x=1704588246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQQ9ATVd7VfBQUqKuKta60Fr98a+Dv89kNqnWW4Q8MI=;
        b=b4R/mFVM/t/TwDMbck1n+FOP+b6v1Ms9eo0+q1vOSZD6vc8t60ZGbRJGq2KSmZujkK
         on6VHTYhFV4qd0egqE8gTlFY4abUEYplktL/B2H2TQgwATPxAUqrEs34ZaDzGfPxy2EC
         zu+5isQVN6fvUnQFcwKlV/wLKJ0/4SE2RpZnOCOGeqrO3SjdPOrXY49iSegq/T5UY0q8
         rvDS3my+km7bjGXOZMlyLVVinb63WWDREPTDufmpDfA1tKab8tN241ATyDzwywsglMOI
         XDqMrLVF3+oa/ub0ULxRbXtwNtya/lhEY8aLYY95orMyJa0SD2oTt4CqYutIqOyAgaHG
         PKQw==
X-Gm-Message-State: AOJu0Yw/HKJk9De8no/DeKEi96io7mYEYKfGP4DKhZ9+u4U3SfF3zl3W
	bKiWKFkraIcXdcWx0xifsU6Z7O3VbLVrNg==
X-Google-Smtp-Source: AGHT+IE+zSSl/K/80t0QvuiS4GMcDMOCUU3/xK4ifOO7ocZ+/jTCEdhDdScNadGUyVb4TW4GmYDGgw==
X-Received: by 2002:a05:6512:3912:b0:50d:6249:17cc with SMTP id a18-20020a056512391200b0050d624917ccmr2663767lfu.245.1703983445766;
        Sat, 30 Dec 2023 16:44:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:44:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:59 +0200
Subject: [PATCH v2 12/15] drm/msm/dp: move all IO handling to dp_catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-12-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=15739;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RVLDduDFSJzfd6PjlCkfVWPfroslvd26lG+KLnLFDlQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlLGM1lApWygVwc8Xf0BjniwVqrXnrYByVZb
 6aW7Tgzf1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SwAKCRCLPIo+Aiko
 1XjxCACPKrT6b130Dg45+5/B8cAfCelVGPrGFk48gsTELt3am3OrhV0KxMGooqituZzc6SB+aia
 YcYWux989gSZgTuJjeaIE3k3Overx2bFryGML9FUviLDiPyFEKqzHztjBRBFcMlEyLow1HCWZqV
 OHCJLWXVeqFoAsgnzhqUB/4qcWywb5OWe3c3bAY4iX3vbdP/YEvIjUXllnyDjThSJ1ZM2yNjYZ3
 OFXF3V7hQIeVEHQT0EQDT3P5IshpdoHA0iIhUcXcVVubM5kw7uczOEhNxPlnKGyBLaXzqt9ZZKQ
 kT09rt58f41GEmqSuELQrhKVYoAmzHrZqGaV35kYP5ToT6Cb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rather than parsing the I/O addresses from dp_parser and then passing
them via a struct pointer to dp_catalog, handle I/O region parsing in
dp_catalog and drop it from dp_parser.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 125 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   6 +-
 drivers/gpu/drm/msm/dp/dp_parser.c  |  73 +--------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  27 +-------
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
index b8388e04bd0f..5ad96989c5f2 100644
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


