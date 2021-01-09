Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B682F0037
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbhAINwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbhAINv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:51:56 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA07C0617A3
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 05:51:16 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 955431F562;
        Sat,  9 Jan 2021 14:51:14 +0100 (CET)
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
Subject: [PATCH 2/5] drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits assignment
Date:   Sat,  9 Jan 2021 14:51:09 +0100
Message-Id: <20210109135112.147759-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of fractional registers bits is known and already set in
the frac_bits variable of the dsi_pll_config struct here in 10nm:
remove the TODO by simply using that variable.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 2c1fcf092ab8..8b66e852eb36 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -481,6 +481,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_config *config = &pll_10nm->pll_configuration;
 	void __iomem *base = pll_10nm->mmio;
 	u64 ref_clk = pll_10nm->vco_ref_clk_rate;
 	u64 vco_rate = 0x0;
@@ -501,9 +502,8 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	/*
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
-	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
 	 */
-	multiplier = 1 << 18;
+	multiplier = 1 << config->frac_bits;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
-- 
2.29.2

