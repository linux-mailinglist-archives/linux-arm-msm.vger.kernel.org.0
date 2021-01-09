Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78322F003C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbhAINwR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:52:17 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:35969 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbhAINwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:52:12 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 65DDB1F570;
        Sat,  9 Jan 2021 14:51:15 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 5/5] drm/msm/dsi_pll_10nm: Convert pr_err prints to DRM_DEV_ERROR
Date:   Sat,  9 Jan 2021 14:51:12 +0100
Message-Id: <20210109135112.147759-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DRM_DEV_ERROR should be used across this entire source: convert the
pr_err prints to the first as a cleanup.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index df3e4584dfd7..f1091c023836 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -342,6 +342,7 @@ static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 {
+	struct device *dev = &pll->pdev->dev;
 	int rc;
 	u32 status = 0;
 	u32 const delay_us = 100;
@@ -354,8 +355,8 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 				       delay_us,
 				       timeout_us);
 	if (rc)
-		pr_err("DSI PLL(%d) lock failed, status=0x%08x\n",
-		       pll->id, status);
+		DRM_DEV_ERROR(dev, "DSI PLL(%d) lock failed, status=0x%08x\n",
+			      pll->id, status);
 
 	return rc;
 }
@@ -402,6 +403,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct device *dev = &pll_10nm->pdev->dev;
 	int rc;
 
 	dsi_pll_enable_pll_bias(pll_10nm);
@@ -410,7 +412,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 
 	rc = dsi_pll_10nm_vco_set_rate(hw,pll_10nm->vco_current_rate, 0);
 	if (rc) {
-		pr_err("vco_set_rate failed, rc=%d\n", rc);
+		DRM_DEV_ERROR(dev, "vco_set_rate failed, rc=%d\n", rc);
 		return rc;
 	}
 
@@ -427,7 +429,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	/* Check for PLL lock */
 	rc = dsi_pll_10nm_lock_status(pll_10nm);
 	if (rc) {
-		pr_err("PLL(%d) lock failed\n", pll_10nm->id);
+		DRM_DEV_ERROR(dev, "PLL(%d) lock failed\n", pll_10nm->id);
 		goto error;
 	}
 
-- 
2.29.2

