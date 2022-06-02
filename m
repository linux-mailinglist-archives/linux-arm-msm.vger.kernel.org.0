Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4EA53B41D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiFBHJk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiFBHJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:38 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C563BBDA
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id m25so993988lji.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3y6uxL9GWMiIU5MJAD/kaZnxjYJSgwQ2CdF81MUFk8=;
        b=Kg1K4zTLvzUNEjpElrfNZbI6MtnUXCTox19zjg3A/YUHA8CfNtLHgfMeXL0RXN21co
         DdQPEP12IS59j7UwqTa4i8fSBI8DuOpUU9nEtR11LwjrADqfHcWaalKWBHhBU0lIbCka
         c3C3w5rbQt7ZMePIw8p5CoWDJkEPTXgp87W4kdT7fJHpQ+xY3vy1Y4DMp3mvxHCx8G05
         iDTTm764I2B5AaqjNyM95xAH9dVm9QuqeJz2wWQsZkF87uFOE/RsfU3hQtYzxbJ1w/TG
         7jpUsSE6DgmhipxGKJWsyEkKRdKc4ArPoqIZNAD6K9hEKCTUjO/Pw7sqO5puQBIWH9Pc
         HBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3y6uxL9GWMiIU5MJAD/kaZnxjYJSgwQ2CdF81MUFk8=;
        b=aSVrZTGJVMqbj3BgATZACM4RdNWzbQ8Ut5akDm58yDzteLKEthNquOVwU9IDxP/ykz
         Gd2d2DvHO97jDCBNa7+0H8zEmPpldL06CjPHM39lfquaKJ1fDMvEc+jFTQTubxmwRFI6
         f3GyARuApz9R8ox2fui4+xOcjo/3NiQWXmFPtVQcE87CtvbdfkPkX0iPeF4UGpu6xVrm
         BEHiLkhcUuYkN8sg5vMpsB9eRUalj7/syJ6nLZvtIiIeAJ/pWq9lcCl4nA2HzjD8MZpL
         vpWfRtRPLV/YBuaR1dRr1RzT5BlYSrBqjvzqYzD12kTIJsxtIH9ZNKBxzUXIIA1UNfHH
         RFgw==
X-Gm-Message-State: AOAM533hfqQznFdR7ZxlEp38VffwppFt6+ospHCdt8WS++w/zRUuMbvh
        Te2lCTQCEgLcK1xZdJSM6/8WUmg74ioCreOB
X-Google-Smtp-Source: ABdhPJz65js20LKHzgFUkIDnOm2dLEtBsXPFiNhEUzdxMnAWRide8zmZeDWRG/zw6nFnbKG0Qexc0Q==
X-Received: by 2002:a2e:b88d:0:b0:253:ee2a:6b70 with SMTP id r13-20020a2eb88d000000b00253ee2a6b70mr30005757ljp.247.1654153773267;
        Thu, 02 Jun 2022 00:09:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 24/30] phy: qcom-qmp-pcie: drop multi-PHY support
Date:   Thu,  2 Jun 2022 10:09:03 +0300
Message-Id: <20220602070909.1666068-25-dmitry.baryshkov@linaro.org>
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

Each PCIe QMP PHY device provides just a single PCIe PHY. Drop support
for handling multiple child PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 33 +++---------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d9e8a3e88890..0676b67d3ff6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1329,8 +1329,6 @@ struct qmp_phy {
  * @vregs: regulator supplies bulk data
  *
  * @phys: array of per-lane phy descriptors
- * @phy_mutex: mutex lock for PHY common block initialization
- * @init_count: phy common block initialization count
  */
 struct qcom_qmp {
 	struct device *dev;
@@ -1340,9 +1338,6 @@ struct qcom_qmp {
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
-
-	struct mutex phy_mutex;
-	int init_count;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -1796,17 +1791,11 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 	void __iomem *pcs = qphy->pcs;
 	int ret, i;
 
-	mutex_lock(&qmp->phy_mutex);
-	if (qmp->init_count++) {
-		mutex_unlock(&qmp->phy_mutex);
-		return 0;
-	}
-
 	/* turn on regulator supplies */
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
-		goto err_unlock;
+		return ret;
 	}
 
 	for (i = 0; i < cfg->num_resets; i++) {
@@ -1839,8 +1828,6 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 
 err_assert_reset:
@@ -1848,8 +1835,6 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 		reset_control_assert(qmp->resets[i]);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-err_unlock:
-	mutex_unlock(&qmp->phy_mutex);
 
 	return ret;
 }
@@ -1860,12 +1845,6 @@ static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	int i = cfg->num_resets;
 
-	mutex_lock(&qmp->phy_mutex);
-	if (--qmp->init_count) {
-		mutex_unlock(&qmp->phy_mutex);
-		return 0;
-	}
-
 	while (--i >= 0)
 		reset_control_assert(qmp->resets[i]);
 
@@ -1873,8 +1852,6 @@ static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 }
 
@@ -2334,7 +2311,7 @@ static int qcom_qmp_phy_pcie_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
 	const struct qmp_phy_cfg *cfg = NULL;
-	int num, id, expected_phys;
+	int num, id;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -2354,10 +2331,6 @@ static int qcom_qmp_phy_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(serdes))
 		return PTR_ERR(serdes);
 
-	expected_phys = cfg->nlanes;
-
-	mutex_init(&qmp->phy_mutex);
-
 	ret = qcom_qmp_phy_pcie_clk_init(dev, cfg);
 	if (ret)
 		return ret;
@@ -2376,7 +2349,7 @@ static int qcom_qmp_phy_pcie_probe(struct platform_device *pdev)
 
 	num = of_get_available_child_count(dev->of_node);
 	/* do we have a rogue child node ? */
-	if (num > expected_phys)
+	if (num > 1)
 		return -EINVAL;
 
 	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
-- 
2.35.1

