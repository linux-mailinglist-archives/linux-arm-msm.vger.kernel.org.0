Return-Path: <linux-arm-msm+bounces-8472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A770D83E14A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AE80B242A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7220DF8;
	Fri, 26 Jan 2024 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I5jZCYeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75520DD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293597; cv=none; b=ehTAS5CLD3YIX2VLmGKpU03Mkxai+Ljfg37L+xlWuG/1tZ41De7s2cbfcvzFg/2wBilPNsSU7DQzOxggJnze4ZRWrqJqgPS6Cr+46zmD/YAsWBGGaT6Vx1l4Jght/h1owxmXpOdnHHXJPHri5+A9u87JUDCnq1nlThXUFlQtkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293597; c=relaxed/simple;
	bh=wVNyfHlk6qxMhT/7/ZVII3sNHgLBjpEAI4YnszPdTtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4NtAP4eimfTlFsQSKROCkRgbZttjwJo89e4HB8W5xNt/0DyVbUrVM0LdPrHkoFRbiJHWv4tkc4LNYnztbe4DZF7WS19NQ4MeDv9XdBPMOBqRKs1OZ63/ynqCuiD+IiX/NpgnUAvzrKzaRoXYc8eG2uOQ6e7OsDqQMX/YSVPcKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I5jZCYeT; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cf1c3b23aeso6292711fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293594; x=1706898394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBWEWQ1lHx25M39T9M547AD4gOAvWiz91uIbsab7PCM=;
        b=I5jZCYeTXmNth84e+rSe0+ihaT4wi1BzArlKAWZxUWzDpsdo/Yjlvb7C4Ngs9GbVQW
         s/ebg+QdNIchLJ6YSpoIZEB/j9BVtN5uHz03wrTFH+v6Wi9HG0bWl3VtC9FIwyD2mzv6
         G4PtEUP0VLD3gnZ5o3PMRvlBnx5Z+gjA3M9IzjclqDKlBV4GZNzLIjkGCMbPXJ8CaUQo
         rjr9XSo83LO7/8yaVDXOcnjIkiixycdkKoZf5KVUIdFBgzXsJHY3HV8Kreb0tMYZf27G
         rjYDzIaA6RaCIRXeDm8U7x8iXxmLDqP7NS7Z8bXd6rH4iLcatHC1UKHc4wdnzL55PEPz
         8nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293594; x=1706898394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBWEWQ1lHx25M39T9M547AD4gOAvWiz91uIbsab7PCM=;
        b=SHMKwNU/t5kbqYA1wWib7dU43KhIGpx87epEyQFmtTgGyU8tWjn/XDsqOVYaNudbzO
         ov8y7barAz83Krb2x1k4QkbCUTWvFND45KWDM/F13KgLd2J+oVTZ0lUToJLGvw5f+erU
         XXmvBXFp6hDgG/wE4zycBcUuVUwM80hBQuMCkPcq2e7N0Ix5FOqZF7ARxGqdvGW1yFz+
         4xDnjDDR9LjiLFx3hYr2uG8TqTyB4nsY41vFmqxCpHrk3oJhws6nA7cXJHnbMYrxcdCL
         VXHt9ftEDuwkHXoKR+lqpSBKzfusXC9uGYMicHA4SsMnnvD/EnRQpmmWJGuwm6YNABJ6
         Intg==
X-Gm-Message-State: AOJu0YzlmBIzK50UUIvHYmDqUXjgvX5LWKRLneZyRRd4RjvZmCKbIAV5
	5fljKsrXiR1P7IqMIZ7CskNEun9OJ2J7Q5SgsESnJrLh4QB5UxjlYYc4y971C+g=
X-Google-Smtp-Source: AGHT+IE4CClqK4p7NoDUAQmR3krsIxOn0JGUEeJTvbfHgeZnwSSRyskcds0Fr6o7B/4LrrIXyGjhBg==
X-Received: by 2002:a2e:b166:0:b0:2cd:a68b:f5c7 with SMTP id a6-20020a2eb166000000b002cda68bf5c7mr141667ljm.9.1706293594107;
        Fri, 26 Jan 2024 10:26:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:30 +0200
Subject: [PATCH RESEND v3 11/15] drm/msm/dp: handle PHY directly in dp_ctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-11-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lRDPb8v3+I2P8bo8fCasslScdBIjyqaRNrv
 jBvfVt58dmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UQAKCRCLPIo+Aiko
 1Zd3B/40v9Iu0VQML+VtpxKqNDC55RhFx18caCGUs8An5Cit8lMWAUIupPWD1/TSjawOMI+joy9
 WHsQKvDEcVdMCx+TAurQrqlvUbthkR6sx6BAv0tw7fa1CH/25QmdmgIcZmTDKIYmbWcMGyNKJdV
 akY7uyGK8jEmNDSx7OVcbxoy/Usg/l0V16HKV7Y/iQcxIiXZ3rTxFmlBw6yxFB1As7vvlai1Ref
 k1U0e+YfqTkuetLIGYMFXv7dYjzRjUEWREB1UBMNNnIadFnbLuPKu9VAzfbGSjkDK11oqfVpgxp
 GmjZsHb3OLeA4IEwGkMtx/3xqc51ICpCoRyy1eMguO9ln2xI
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


