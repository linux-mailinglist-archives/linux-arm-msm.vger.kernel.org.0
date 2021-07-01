Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194983B8B0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 02:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236517AbhGAACu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 20:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhGAACs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 20:02:48 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F70C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 17:00:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k10so8272268lfv.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eAmFKeCfkBrGj9sGlPMlMBljPTZNyMpy6Rq9bQdBGEw=;
        b=rhy3+VWT3Ngutvw+LPCiFR0kDw1e3bd9ZTGWOLQCgmUPBOyX9xWx2F8hL/R/SYbl11
         0nwszCsxwqEqBYc4mk0gkANE0ZgiCCA6trS4HW8+VVBtdoWb4WyxUKAcbkT+R+WUz8UU
         S6f6s5AeCAL6kbtb7fDf5Yn5Pe9LNZGyOXg7m+AJzCEeCwCB/WA0rnnNCnE54uxB2FTF
         v58AwRvhd2dc6jZiBCG42TdMkgWg5VdL4u+fYmrax6HS4+S8/A1OTj7HovB5IH9bpcaX
         bSAWFTMK1lBJKar9tH94xSXNtEIZ9r9EWhQLRlq1CmD0r6JunfFnj+jDi/yaHYSjKj3V
         3yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eAmFKeCfkBrGj9sGlPMlMBljPTZNyMpy6Rq9bQdBGEw=;
        b=kGoK+kTvYqaYZJGaVv5jGIENeQ74p3vWMf6KaD58Tvl9C41YxgSlX/YIdltGxkP4F1
         Cnob6iXlLeEbB94msA+Opx/FJ/HXWoc6EDjEV+sJS11y6FTww6JJUPHw+9q59JdiiBad
         o/Mu55j/BieppSV8x/zESSzX8jCOEfc2zec+VBsOORiOHE7m0k1TUpWR6nOm+9fCU3+L
         xlvsLzu5T2wA9iPXlAsbOjvyQzt2HGBBTU/9hHGkWwhPopmZbcOUWoPBHT67TdmZ72hN
         QQ5m/azyf2KOzL9VRsb3VrUoFyQNo7iNkdKmjfk1+T7qaJzYRjFu6xsrgGlpPfrujJOv
         j4ag==
X-Gm-Message-State: AOAM531MmdeuhryYB0iLhqdYnxR7UD7RmUlL5pIPZhJKInED9pQxG835
        dLXjBNO6ObUqN+2NmjaZ50yU1A==
X-Google-Smtp-Source: ABdhPJx9dGodM/43P/RMFAKwYhVCOXeL46b+R5KWtcJ/r79KzPf4ma6qhYyv0hsEj0zL3a5P6YX7Ww==
X-Received: by 2002:ac2:5e86:: with SMTP id b6mr29737245lfq.241.1625097616333;
        Wed, 30 Jun 2021 17:00:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a12sm2059539lfi.286.2021.06.30.17.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 17:00:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: drop gdsc regulator handling
Date:   Thu,  1 Jul 2021 03:00:15 +0300
Message-Id: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

None of supported devies uses "gdsc" regulator for DSI. GDSC support is
now implemented as a power domain. Drop old code and config handling
gdsc regulator requesting and enabling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 12 ++++--------
 drivers/gpu/drm/msm/dsi/dsi_host.c | 22 +++-------------------
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index f3f1c03c7db9..32c37d7c2109 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -32,9 +32,8 @@ static const char * const dsi_6g_bus_clk_names[] = {
 static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 4,
+		.num = 3,
 		.regs = {
-			{"gdsc", -1, -1},
 			{"vdd", 150000, 100},	/* 3.0 V */
 			{"vdda", 100000, 100},	/* 1.2 V */
 			{"vddio", 100000, 100},	/* 1.8 V */
@@ -53,9 +52,8 @@ static const char * const dsi_8916_bus_clk_names[] = {
 static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 3,
+		.num = 2,
 		.regs = {
-			{"gdsc", -1, -1},
 			{"vdda", 100000, 100},	/* 1.2 V */
 			{"vddio", 100000, 100},	/* 1.8 V */
 		},
@@ -73,9 +71,8 @@ static const char * const dsi_8976_bus_clk_names[] = {
 static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 3,
+		.num = 2,
 		.regs = {
-			{"gdsc", -1, -1},
 			{"vdda", 100000, 100},	/* 1.2 V */
 			{"vddio", 100000, 100},	/* 1.8 V */
 		},
@@ -89,9 +86,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
 static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 7,
+		.num = 6,
 		.regs = {
-			{"gdsc", -1, -1},
 			{"vdda", 100000, 100},	/* 1.25 V */
 			{"vddio", 100000, 100},	/* 1.8 V */
 			{"vcca", 10000, 100},	/* 1.0 V */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ed504fe5074f..66c425d4159c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -203,35 +203,22 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 {
 	const struct msm_dsi_cfg_handler *cfg_hnd = NULL;
 	struct device *dev = &msm_host->pdev->dev;
-	struct regulator *gdsc_reg;
 	struct clk *ahb_clk;
 	int ret;
 	u32 major = 0, minor = 0;
 
-	gdsc_reg = regulator_get(dev, "gdsc");
-	if (IS_ERR(gdsc_reg)) {
-		pr_err("%s: cannot get gdsc\n", __func__);
-		goto exit;
-	}
-
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);
-		goto put_gdsc;
+		goto exit;
 	}
 
 	pm_runtime_get_sync(dev);
 
-	ret = regulator_enable(gdsc_reg);
-	if (ret) {
-		pr_err("%s: unable to enable gdsc\n", __func__);
-		goto put_gdsc;
-	}
-
 	ret = clk_prepare_enable(ahb_clk);
 	if (ret) {
 		pr_err("%s: unable to enable ahb_clk\n", __func__);
-		goto disable_gdsc;
+		goto runtime_put;
 	}
 
 	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
@@ -246,11 +233,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 disable_clks:
 	clk_disable_unprepare(ahb_clk);
-disable_gdsc:
-	regulator_disable(gdsc_reg);
+runtime_put:
 	pm_runtime_put_sync(dev);
-put_gdsc:
-	regulator_put(gdsc_reg);
 exit:
 	return cfg_hnd;
 }
-- 
2.30.2

