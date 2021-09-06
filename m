Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC32D4020B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 22:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243722AbhIFU1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 16:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237410AbhIFU1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 16:27:02 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BBFC061575;
        Mon,  6 Sep 2021 13:25:56 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8B8533E7F1;
        Mon,  6 Sep 2021 22:25:54 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in poll_for_ready
Date:   Mon,  6 Sep 2021 22:25:51 +0200
Message-Id: <20210906202552.824598-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The downstream driver models this PLL lock check as an if-elseif-else.
The only way to reach the else case where pll_locked=true [1] is by
succeeding both readl_poll_timeout_atomic calls (which return zero on
success) in the if _and_ elseif condition.  Hence both the "lock" and
"ready" bit need to be tested in the SM_READY_STATUS register before
considering the PLL locked and ready to go.

Tested on the Sony Xperia XA2 Ultra (nile-discovery, sdm630).

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/clk/qcom/mdss/mdss-dsi-pll-14nm-util.c?h=LA.UM.9.2.1.r1-08000-sdm660.0#n302

Fixes: f079f6d999cb ("drm/msm/dsi: Add PHY/PLL for 8x96")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8905f365c932..789b08c24d25 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -110,14 +110,13 @@ static struct dsi_pll_14nm *pll_14nm_list[DSI_MAX];
 static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 				    u32 nb_tries, u32 timeout_us)
 {
-	bool pll_locked = false;
+	bool pll_locked = false, pll_ready = false;
 	void __iomem *base = pll_14nm->phy->pll_base;
 	u32 tries, val;
 
 	tries = nb_tries;
 	while (tries--) {
-		val = dsi_phy_read(base +
-			       REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
+		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
 		pll_locked = !!(val & BIT(5));
 
 		if (pll_locked)
@@ -126,23 +125,24 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 		udelay(timeout_us);
 	}
 
-	if (!pll_locked) {
-		tries = nb_tries;
-		while (tries--) {
-			val = dsi_phy_read(base +
-				REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
-			pll_locked = !!(val & BIT(0));
+	if (!pll_locked)
+		goto out;
 
-			if (pll_locked)
-				break;
+	tries = nb_tries;
+	while (tries--) {
+		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
+		pll_ready = !!(val & BIT(0));
 
-			udelay(timeout_us);
-		}
+		if (pll_ready)
+			break;
+
+		udelay(timeout_us);
 	}
 
-	DBG("DSI PLL is %slocked", pll_locked ? "" : "*not* ");
+out:
+	DBG("DSI PLL is %slocked, %sready", pll_locked ? "" : "*not* ", pll_ready ? "" : "*not* ");
 
-	return pll_locked;
+	return pll_locked && pll_ready;
 }
 
 static void dsi_pll_14nm_config_init(struct dsi_pll_config *pconf)
-- 
2.33.0

