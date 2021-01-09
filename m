Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E302F0035
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbhAINv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:51:57 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:47095 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbhAINv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:51:57 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 249841F56E;
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
Subject: [PATCH 4/5] drm/msm/dsi_pll_10nm: Fix variable usage for pll_lockdet_rate
Date:   Sat,  9 Jan 2021 14:51:11 +0100
Message-Id: <20210109135112.147759-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
directly, but the same value was also being specified in the
dsi_pll_regs struct pll_lockdet_rate variable: let's use it!

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 5be562dfbf06..df3e4584dfd7 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -302,7 +302,8 @@ static void dsi_pll_commit(struct dsi_pll_10nm *pll)
 		  reg->frac_div_start_mid);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
 		  reg->frac_div_start_high);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1,
+		  reg->pll_lockdet_rate);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
-- 
2.29.2

