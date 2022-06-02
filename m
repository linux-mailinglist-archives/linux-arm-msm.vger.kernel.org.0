Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32E453B416
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiFBHJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbiFBHJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE15C35849
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i10so6457570lfj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zYcitJ1Sg+TZTXOBOYlQfiwhC36WAkqzKMnaXw+/jKs=;
        b=E+kf4FVBvZ0giJfS2BBoAnAR2zyZ9RWPTpAAJtqk/LXfl/RzDvMAhL7qDDqImogikM
         Zyb3glGepVNPB1hAG23KmnYyY2fMxl51nDSbwncj+rfKFaw6riypLx2h/zEceM5rPTCh
         3q19Vwv+aoM4ybXNB7TeWA9cTlaGK/Wtj2ItxyLjfSd8qKX9uGUs+S/hLuALef3ADeUI
         dRmdC5oOyzKJgsUFQgyED5FVv5fz96Ozl3rg9ryEnUOcmPnit66Zhg4YlMEy/vEQwtlV
         5D+Th1RB/RY/bzm6SLR5MB/V31X7CDZ3AZUaaLZtgIa9IgnXynSp8lM+gAAhoEjs+geo
         ZyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zYcitJ1Sg+TZTXOBOYlQfiwhC36WAkqzKMnaXw+/jKs=;
        b=p+wG5vHe7p3X2mHRCf6JvtO6XFP+xeQw7wvn6rzZboCW0NcNOsbD0lEUnI7TK38cHN
         EbcJ4/qhg/5bMjjvMer6VHJbaA8F2LvFAMc2Lr5sRaHRCuAnBOUiW4cCpFeawumo00KX
         lERRwk/FlRNYOUDchBnu+A2hUMOh+5Oy9+aOl1AIciBSBMkcGZCXcAh/AtLPeoXH3HzC
         6Vmi5qqZln5/oQXaaacRpQQwmh19bBJUAUq82hhMGmyAYgsZ96twyNiaTFuGESxzc+7q
         hynfERoVaB2MqlA/i6A6aXbi0I9cylv03FxU25QTnNohxFhgRn/wBymvFcTMzIz9mbrn
         EZ+w==
X-Gm-Message-State: AOAM530y4K0rvXrWA0qfdXgsW8/Fzf+KmjAco1+IC7IWrT+cS9ChYOVV
        BkNbhyQxa6l0DZ6LlTmIyBCniw==
X-Google-Smtp-Source: ABdhPJwTP94Q/tV+6qbUb2FUURe4jmTqLIGVdyTkeDJ/3Jprr0l+GjpQB1i2i1bi6+geFZr/pLXrJg==
X-Received: by 2002:ac2:4642:0:b0:479:130c:68f2 with SMTP id s2-20020ac24642000000b00479130c68f2mr246754lfo.221.1654153764252;
        Thu, 02 Jun 2022 00:09:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 14/30] phy: qcom-qmp-combo: drop support for PCIe,UFS PHY types
Date:   Thu,  2 Jun 2022 10:08:53 +0300
Message-Id: <20220602070909.1666068-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop remaining support for unused PHY types (PCIe, UFS).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 102 +++++++++-------------
 1 file changed, 41 insertions(+), 61 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 734e62393c5e..68f630e07111 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1887,13 +1887,6 @@ static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 		qcom_qmp_phy_combo_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
-	/*
-	 * Pull out PHY from POWER DOWN state.
-	 * This is active low enable signal to power-down PHY.
-	 */
-	if(cfg->type == PHY_TYPE_PCIE)
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
-
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
@@ -1904,15 +1897,9 @@ static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 		/* start SerDes and Phy-Coding-Sublayer */
 		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
-		if (cfg->type == PHY_TYPE_UFS) {
-			status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
-			mask = PCS_READY;
-			ready = PCS_READY;
-		} else {
-			status = pcs + cfg->regs[QPHY_PCS_STATUS];
-			mask = cfg->phy_status;
-			ready = 0;
-		}
+		status = pcs + cfg->regs[QPHY_PCS_STATUS];
+		mask = cfg->phy_status;
+		ready = 0;
 
 		ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
 					 PHY_INIT_COMPLETE_TIMEOUT);
@@ -2426,7 +2413,7 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
-static const struct phy_ops qcom_qmp_phy_combo_gen_ops = {
+static const struct phy_ops qcom_qmp_phy_combo_usb_ops = {
 	.init		= qcom_qmp_phy_combo_enable,
 	.exit		= qcom_qmp_phy_combo_disable,
 	.set_mode	= qcom_qmp_phy_combo_set_mode,
@@ -2444,13 +2431,6 @@ static const struct phy_ops qcom_qmp_phy_combo_dp_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
-	.power_on	= qcom_qmp_phy_combo_enable,
-	.power_off	= qcom_qmp_phy_combo_disable,
-	.set_mode	= qcom_qmp_phy_combo_set_mode,
-	.owner		= THIS_MODULE,
-};
-
 static void qcom_qmp_reset_control_put(void *data)
 {
 	reset_control_put(data);
@@ -2530,8 +2510,7 @@ int qcom_qmp_phy_combo_create(struct device *dev, struct device_node *np, int id
 	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
 	qphy->pipe_clk = devm_get_clk_from_child(dev, np, prop_name);
 	if (IS_ERR(qphy->pipe_clk)) {
-		if (cfg->type == PHY_TYPE_PCIE ||
-		    cfg->type == PHY_TYPE_USB3) {
+		if (cfg->type == PHY_TYPE_USB3) {
 			ret = PTR_ERR(qphy->pipe_clk);
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev,
@@ -2556,12 +2535,10 @@ int qcom_qmp_phy_combo_create(struct device *dev, struct device_node *np, int id
 			return ret;
 	}
 
-	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
-		ops = &qcom_qmp_pcie_ufs_ops;
-	else if (cfg->type == PHY_TYPE_DP)
+	if (cfg->type == PHY_TYPE_DP)
 		ops = &qcom_qmp_phy_combo_dp_ops;
 	else
-		ops = &qcom_qmp_phy_combo_gen_ops;
+		ops = &qcom_qmp_phy_combo_usb_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
@@ -2638,23 +2615,19 @@ static int qcom_qmp_phy_combo_probe(struct platform_device *pdev)
 		return PTR_ERR(serdes);
 
 	/* per PHY dp_com; if PHY has dp_com control block */
-	if (combo_cfg || cfg->has_phy_dp_com_ctrl) {
+	if (cfg->has_phy_dp_com_ctrl) {
 		qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(qmp->dp_com))
 			return PTR_ERR(qmp->dp_com);
 	}
 
-	if (combo_cfg) {
-		/* Only two serdes for combo PHY */
-		dp_serdes = devm_platform_ioremap_resource(pdev, 2);
-		if (IS_ERR(dp_serdes))
-			return PTR_ERR(dp_serdes);
+	/* Only two serdes for combo PHY */
+	dp_serdes = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(dp_serdes))
+		return PTR_ERR(dp_serdes);
 
-		dp_cfg = combo_cfg->dp_cfg;
-		expected_phys = 2;
-	} else {
-		expected_phys = cfg->nlanes;
-	}
+	dp_cfg = combo_cfg->dp_cfg;
+	expected_phys = 2;
 
 	mutex_init(&qmp->phy_mutex);
 
@@ -2696,38 +2669,45 @@ static int qcom_qmp_phy_combo_probe(struct platform_device *pdev)
 		if (of_node_name_eq(child, "dp-phy")) {
 			cfg = dp_cfg;
 			serdes = dp_serdes;
+
+			/* Create per-lane phy */
+			ret = qcom_qmp_phy_combo_create(dev, child, id, serdes, cfg);
+			if (ret) {
+				dev_err(dev, "failed to create lane%d phy, %d\n",
+					id, ret);
+				goto err_node_put;
+			}
+
+			ret = phy_dp_clks_register(qmp, qmp->phys[id], child);
+			if (ret) {
+				dev_err(qmp->dev,
+					"failed to register DP clock source\n");
+				goto err_node_put;
+			}
 		} else if (of_node_name_eq(child, "usb3-phy")) {
 			cfg = usb_cfg;
 			serdes = usb_serdes;
-		}
 
-		/* Create per-lane phy */
-		ret = qcom_qmp_phy_combo_create(dev, child, id, serdes, cfg);
-		if (ret) {
-			dev_err(dev, "failed to create lane%d phy, %d\n",
-				id, ret);
-			goto err_node_put;
-		}
-
-		/*
-		 * Register the pipe clock provided by phy.
-		 * See function description to see details of this pipe clock.
-		 */
-		if (cfg->type == PHY_TYPE_USB3 || cfg->type == PHY_TYPE_PCIE) {
-			ret = phy_pipe_clk_register(qmp, child);
+			/* Create per-lane phy */
+			ret = qcom_qmp_phy_combo_create(dev, child, id, serdes, cfg);
 			if (ret) {
-				dev_err(qmp->dev,
-					"failed to register pipe clock source\n");
+				dev_err(dev, "failed to create lane%d phy, %d\n",
+					id, ret);
 				goto err_node_put;
 			}
-		} else if (cfg->type == PHY_TYPE_DP) {
-			ret = phy_dp_clks_register(qmp, qmp->phys[id], child);
+
+			/*
+			 * Register the pipe clock provided by phy.
+			 * See function description to see details of this pipe clock.
+			 */
+			ret = phy_pipe_clk_register(qmp, child);
 			if (ret) {
 				dev_err(qmp->dev,
-					"failed to register DP clock source\n");
+					"failed to register pipe clock source\n");
 				goto err_node_put;
 			}
 		}
+
 		id++;
 	}
 
-- 
2.35.1

