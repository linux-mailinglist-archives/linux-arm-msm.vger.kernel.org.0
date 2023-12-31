Return-Path: <linux-arm-msm+bounces-6161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D833820951
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F40283621
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E28223D8;
	Sun, 31 Dec 2023 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGlzT+TZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBAB1873
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7dd8bce8so5033155e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983445; x=1704588245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBWEWQ1lHx25M39T9M547AD4gOAvWiz91uIbsab7PCM=;
        b=ZGlzT+TZqWQdLfotpC2jUMWDUGg0iphoULtfDPcsbR9sFeU0Q8BtbbAgZCptjrRByd
         xWtiNQm69asmaaqbmK7ih30ykV3wLdEfHSyFj49PXcLXUBQPy4ISP6WAt7VslQK2P1pT
         8R3K5APzE1WzAN8YpGjkTJLVmlxWer2HVjdpGu4AYONpzSYNncqKwK4V+US8jVAzLUpJ
         DadEdyzydoez2YZ/KVwH8MqUgjJVMX3I1T4Yq4uaTX0rtHeGtbqcHfjfE92bnEAk9rwY
         LWRfio1JpYQ7Z96wimgRDOLBkAY9fQCquWRcw+fyrfAeSBZaIVOsLPbpMEQ0ZLf8YC7H
         /IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983445; x=1704588245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBWEWQ1lHx25M39T9M547AD4gOAvWiz91uIbsab7PCM=;
        b=jQeHfASBssH3/zPOuwfG/lEb+4SUNEjJpm3uZDOxGKY9CncLrFhK1wv0t/xFtcZx9V
         KwJmDeW0Iadm5cs02pfpdBEKo8Sk95E35PNuwXyieoiQiTZU3pXBnCl04gWjnhjSF+gp
         zmABSfeyfqsJnsjsOj7uIbXFSFYm3aeZHlxrwZtmeOAKgKvjpi3Ymy5whgxnM7ZRqlNb
         cGxU4OhahMyzaBYoK8yKyPdjLMp/cNCSuaJ6zAMENEBI6y70IaljddzCHAreUKz7ARmS
         R3keb2TFU3tY01ORAF3XwmFtItcrP6irzhYTx6c6raSMAQ8pFWfvconsvV4pckEl5pvQ
         ngtg==
X-Gm-Message-State: AOJu0YzBF1gOKfS/liFg4adtrIVVQyDmDrLoBEkD6WiEOURGrO9x2CMM
	GuIQp35uQ7q6Hs1zsCceyKm5asT4Xt8rOA==
X-Google-Smtp-Source: AGHT+IF6+CrY0KegZGrhyQK+eam1f/nMg7Bi30B3i1s0LSz4MQUOMJF8AawDrJx8Jqp/UjsP7mFgJA==
X-Received: by 2002:a05:6512:3282:b0:50e:7314:e79e with SMTP id p2-20020a056512328200b0050e7314e79emr4219919lfe.110.1703983445066;
        Sat, 30 Dec 2023 16:44:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:44:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:58 +0200
Subject: [PATCH v2 11/15] drm/msm/dp: handle PHY directly in dp_ctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-11-fc3e902a6f5b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6372;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wVNyfHlk6qxMhT/7/ZVII3sNHgLBjpEAI4YnszPdTtw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlLVifYbvJJNcxQiZKcI3+qtmEV6O9DtsUYk
 r7DI63Vm9SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SwAKCRCLPIo+Aiko
 1b/zCACHOYolBtPtcPzNNvcL3ff2W1ynA8aJSDzoUn4Y3I9tTQcsXMPx5u4qZ3OMUcIEvYuASkb
 tU8NJ5g2CHpc3MqExkTiCUJwFfibdBYZqtPEGAdfb2HSIr0Qm13HB/jNRCCA9voTB9HVsqoTZhD
 ZBhccf/m1gvVLo1jGrc1kY6vf0tX+oPeYgvkDIX0nKVtsAqVFxBOumXgOBW9LIGt6p09sgblAX7
 2L3GIwAprxU+xhQmphhzgI5M/PYdOzzRBe0Sl4rHoKQ4IBCGykQFURCdGZE1B76EWk9tcDw0c3/
 cEWmtJAjYX7FEDJWpArDJ3RHgiC+xwNBDEU21A2LyUsXoo7i
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is little point in going trough dp_parser->io indirection each
time the driver needs to access the PHY. Store the pointer directly in
dp_ctrl_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 +++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 3 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 4aea72a2b8e8..fc7ce315ae41 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -76,9 +76,10 @@ struct dp_ctrl_private {
 	struct drm_dp_aux *aux;
 	struct dp_panel *panel;
 	struct dp_link *link;
-	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct phy *phy;
+
 	unsigned int num_core_clks;
 	struct clk_bulk_data *core_clks;
 
@@ -1028,7 +1029,7 @@ static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
 	phy_opts->dp.voltage[0] = v_level;
 	phy_opts->dp.pre[0] = p_level;
 	phy_opts->dp.set_voltages = 1;
-	phy_configure(ctrl->parser->io.phy, phy_opts);
+	phy_configure(ctrl->phy, phy_opts);
 	phy_opts->dp.set_voltages = 0;
 
 	return 0;
@@ -1442,7 +1443,7 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct phy *phy = ctrl->parser->io.phy;
+	struct phy *phy = ctrl->phy;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
@@ -1540,12 +1541,10 @@ void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
@@ -1557,12 +1556,10 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
@@ -1587,7 +1584,7 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
-	struct phy *phy = ctrl->parser->io.phy;
+	struct phy *phy = ctrl->phy;
 	int ret = 0;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
@@ -1617,11 +1614,9 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
-	struct dp_io *dp_io;
 	struct phy *phy;
 
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2047,12 +2042,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	/* set dongle to D3 (power off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
@@ -2080,12 +2073,10 @@ void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2103,12 +2094,10 @@ void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2225,7 +2214,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_catalog *catalog,
-			struct dp_parser *parser)
+			struct phy *phy)
 {
 	struct dp_ctrl_private *ctrl;
 	int ret;
@@ -2259,12 +2248,12 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->parser   = parser;
 	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
+	ctrl->phy      = phy;
 
 	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 023f14d0b021..6e9f375b856a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -28,7 +28,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_catalog *catalog,
-			struct dp_parser *parser);
+			struct phy *phy);
 
 void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c1a51c498e01..b8388e04bd0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -760,7 +760,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       dp->catalog, dp->parser);
+			       dp->catalog,
+			       dp->parser->io.phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);

-- 
2.39.2


