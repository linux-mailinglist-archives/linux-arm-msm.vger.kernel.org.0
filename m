Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1399F49102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfFQUNU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:20 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38470 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:20 -0400
Received: by mail-qt1-f196.google.com with SMTP id n11so12400533qtl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oZYBTzCjKl2+1Vgv9NNnipN1E2J5Z7VwpWjiIbQjaNw=;
        b=GWOBQ419n5oF+8HQsviBMRPtRatpWMfyes95hd9YGvJdinh/P+2Tx/qitZdSyKi9FR
         eRnhgBUJJ38ZcpGaZnrAX8w+tZQqICIT1txV7cDsnB/KVEQr79kY17KQr8vzijzj1UTt
         Gc6bvxWExOhAsh8x/y7s2U4fWS7gwWwGj5iNTmP8HQ9EGb35vd+SXD39GoXki/54Ktk9
         Vvr4LUsL5OuVVy/m4MdtVnuG63Sr6g4hrEPqUtKM61+KfViYf0vblSExVsUFEqCxJvY9
         76dDFoG3j0v37Bq59696fjsuZ3TTKTPMTT6Tnc7t8RXvxSCFg72tIMiglK718Q+muePY
         Am8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oZYBTzCjKl2+1Vgv9NNnipN1E2J5Z7VwpWjiIbQjaNw=;
        b=CM0zMLokxT7a0Oi8fWNIfKQSPfxEzpdT9I2E4VZZycOtx3JXMJsHsd9OqZdggLZt5h
         cpEvAVTNPO2NNxBeEBdc+k/WCOvgm/cEZZhxMCO9gi0eIXhEXAlf37TDq0QedqSoJ9ID
         08xaow942jKvG/MY95G79mR1Glob3aBL+w7VP0+TJxi2F4MTNrVEh6yCx1V7iZ+qY/4n
         J31IB+mwCfCfsR5UV0fSfwrFNC22Ztdl1CyaG3Pp/EtEpyTheZZqFkXo62vrTerBxRkB
         byKldsoDPPRcplOGr+Rxky6zEyMBoiah+26lystaL6VdqsCQnSPkDysJXtsG5qtRUBCK
         5EZg==
X-Gm-Message-State: APjAAAUsuusKVJf1qGWWi+rIf7W7S4VnMDY8v7AacdXfmt+vdQtprus9
        dzL1RVqLXYJqH/fdo81K0jUCtOEDmVY=
X-Google-Smtp-Source: APXvYqwr1QbLxwuGqTLwnzoQMv5ob2tdJ8f6VUT6NfVZIIQQojxgAuLnnyVAWJhOKSWNGNY7YKALKg==
X-Received: by 2002:ac8:5297:: with SMTP id s23mr59148485qtn.230.1560802398810;
        Mon, 17 Jun 2019 13:13:18 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:17 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 04/13] drm/msm/dsi_pll_10nm: Release clk hw on destroy and failure
Date:   Mon, 17 Jun 2019 16:12:49 -0400
Message-Id: <20190617201301.133275-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617200405.131843-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The 10nm pll driver didn't have any failure-path cleanup in register,
and the destroy function didn't unregister any of the hardware. This
patch adds both.

The reason things haven't been blowing up horribly is that msm_drv has a
reference count issue that keeps devices alive, so the destroy function
was never called. That will be fixed in a follow-up patch.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 103 +++++++++++++++------
 1 file changed, 73 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index aabab6311043..618b49838293 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -104,8 +104,13 @@ struct dsi_pll_10nm {
 	struct dsi_pll_regs reg_setup;
 
 	/* private clocks: */
-	struct clk_hw *hws[NUM_DSI_CLOCKS_MAX];
-	u32 num_hws;
+	struct clk_hw *out_div_clk_hw;
+	struct clk_hw *bit_clk_hw;
+	struct clk_hw *byte_clk_hw;
+	struct clk_hw *by_2_bit_clk_hw;
+	struct clk_hw *post_out_div_clk_hw;
+	struct clk_hw *pclk_mux_hw;
+	struct clk_hw *out_dsiclk_hw;
 
 	/* clock-provider: */
 	struct clk_hw_onecell_data *hw_data;
@@ -617,8 +622,19 @@ static int dsi_pll_10nm_get_provider(struct msm_dsi_pll *pll,
 static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct device *dev = &pll_10nm->pdev->dev;
 
 	DBG("DSI PLL%d", pll_10nm->id);
+	of_clk_del_provider(dev->of_node);
+
+	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
+	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
+	clk_hw_unregister_fixed_factor(pll_10nm->post_out_div_clk_hw);
+	clk_hw_unregister_fixed_factor(pll_10nm->by_2_bit_clk_hw);
+	clk_hw_unregister_fixed_factor(pll_10nm->byte_clk_hw);
+	clk_hw_unregister_divider(pll_10nm->bit_clk_hw);
+	clk_hw_unregister_divider(pll_10nm->out_div_clk_hw);
+	clk_hw_unregister(&pll_10nm->base.clk_hw);
 }
 
 /*
@@ -639,10 +655,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
 	struct device *dev = &pll_10nm->pdev->dev;
-	struct clk_hw **hws = pll_10nm->hws;
 	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
-	int num = 0;
 	int ret;
 
 	DBG("DSI%d", pll_10nm->id);
@@ -660,8 +674,6 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	if (ret)
 		return ret;
 
-	hws[num++] = &pll_10nm->base.clk_hw;
-
 	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->id);
 
@@ -670,10 +682,12 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 				     pll_10nm->mmio +
 				     REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
 				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_base_clk_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->out_div_clk_hw = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
@@ -685,10 +699,12 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 				     REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 				     0, 4, CLK_DIVIDER_ONE_BASED,
 				     &pll_10nm->postdiv_lock);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_out_div_clk_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->bit_clk_hw = hw;
 
 	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
@@ -696,10 +712,12 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  CLK_SET_RATE_PARENT, 1, 8);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_bit_clk_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->byte_clk_hw = hw;
 	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
@@ -707,20 +725,24 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 
 	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_byte_clk_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->by_2_bit_clk_hw = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
 
 	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 4);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_by_2_bit_clk_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->post_out_div_clk_hw = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
@@ -734,10 +756,12 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 				 }, 4, 0, pll_10nm->phy_cmn_mmio +
 				 REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 				 0, 2, 0, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_post_out_div_clk_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->pclk_mux_hw = hw;
 
 	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->id);
@@ -748,14 +772,14 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 					REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 				     4, 4, CLK_DIVIDER_ONE_BASED,
 				     &pll_10nm->postdiv_lock);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_pclk_mux_hw;
+	}
 
-	hws[num++] = hw;
+	pll_10nm->out_dsiclk_hw = hw;
 	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
 
-	pll_10nm->num_hws = num;
-
 	hw_data->num = NUM_PROVIDED_CLKS;
 	pll_10nm->hw_data = hw_data;
 
@@ -763,10 +787,29 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 				     pll_10nm->hw_data);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
+		goto err_dsiclk_hw;
 	}
 
 	return 0;
+
+err_dsiclk_hw:
+	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
+err_pclk_mux_hw:
+	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
+err_post_out_div_clk_hw:
+	clk_hw_unregister_fixed_factor(pll_10nm->post_out_div_clk_hw);
+err_by_2_bit_clk_hw:
+	clk_hw_unregister_fixed_factor(pll_10nm->by_2_bit_clk_hw);
+err_byte_clk_hw:
+	clk_hw_unregister_fixed_factor(pll_10nm->byte_clk_hw);
+err_bit_clk_hw:
+	clk_hw_unregister_divider(pll_10nm->bit_clk_hw);
+err_out_div_clk_hw:
+	clk_hw_unregister_divider(pll_10nm->out_div_clk_hw);
+err_base_clk_hw:
+	clk_hw_unregister(&pll_10nm->base.clk_hw);
+
+	return ret;
 }
 
 struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

