Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0A953B425
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiFBHJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiFBHJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA03755BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:39 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id l13so6357128lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/mC2ab4egIvRd54WAnllrEiQZ9AIOTgJQtdTx/MY40=;
        b=XmmfanbshclpFvDaJ0Lon3sjDrtIMvi0S/pf1TpF33XZXhPdn/K3joDUjr8nUZ+TpR
         9v/6+Jbi79PpSciJzWiley4/Pntz0OEvE20P8iZMhQ691C7ENatLw6MagEW2373cl6mf
         hq+vgIZFY2v8XGHAl+7nBSRXZA3YP1HdQ4O0cXETckzkiiC8m/PVXZxkHyIA9T54UiP8
         Kby00OZVMXxPQ3AUJgrV0D7o9v8TN5vzVaq1rM6r3wWq7MTC+k1ajZsdJ0KVQoORD0tV
         fRc+p4XSGj3EmTL8hKY5PTVtOBItfUct5IupaFEN8dckZwrmUaYESJH27eJRX5opHVR7
         AgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/mC2ab4egIvRd54WAnllrEiQZ9AIOTgJQtdTx/MY40=;
        b=46PTFT+7V1eh30JN7uecd2tOJAts6kJ0/ahdPUBlN50CWIy3R8dKea/IoF69OHusHM
         xHmYWVQRbo+WqtxiN14DFh90/9lyOaEaCqglGk7IEUVb5WRbr6kvQtSw3R44BbYq69Wx
         sQ2A3P55esHh/o+LT+5tj4ArrIvXMR+TSuKwmgmHph2aBRX5khHksPgnNK+f6/NPLyoI
         YgReFNx4WBgwCEctYLEjEXzZo9JdGhRdFtJXGPgZv4sLGxzEuAhB10bb6rmvKU0e7YJ+
         AmiCiuneWvFxmM01ZUwh3I9tiQ/vbcfApF56nq5MPePuyb+37IH/+psPx+2CVPI9o5ic
         cC/w==
X-Gm-Message-State: AOAM530rl1ckIIt4N8gUcgg5L2hASJSa4/mVdj9z0IXPVCJZGX88Z9x9
        XLtaQDOCRJC1HTJiPqIoWm4wdWWiyEMgH2JE
X-Google-Smtp-Source: ABdhPJy3NFC2kUkTNxqWKI6qiKJxCtyA1gsKiCV6Jbmzr9/IeK2EcqmxoZLatMqG5OdltJaaPExS0Q==
X-Received: by 2002:ac2:4c15:0:b0:479:cb6:f8da with SMTP id t21-20020ac24c15000000b004790cb6f8damr2115184lfq.484.1654153778084;
        Thu, 02 Jun 2022 00:09:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 29/30] phy: qcom-qmp-pcie-msm8996: use bulk reset_control API
Date:   Thu,  2 Jun 2022 10:09:08 +0300
Message-Id: <20220602070909.1666068-30-dmitry.baryshkov@linaro.org>
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

Switch qcom-qmp-pcie-msm8996 driver to use reset_control_bulk_assert /
_deassert functions rather than hardcoding the loops in the driver
itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 49 +++++++------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 51da3a3a199e..48ea1de81d7c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -340,7 +340,7 @@ struct qcom_qmp {
 	struct device *dev;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -489,7 +489,7 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	int ret, i;
+	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (qmp->init_count++) {
@@ -504,22 +504,16 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 		goto err_unlock;
 	}
 
-	for (i = 0; i < cfg->num_resets; i++) {
-		ret = reset_control_assert(qmp->resets[i]);
-		if (ret) {
-			dev_err(qmp->dev, "%s reset assert failed\n",
-				cfg->reset_list[i]);
-			goto err_disable_regulators;
-		}
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset assert failed\n");
+		goto err_disable_regulators;
 	}
 
-	for (i = cfg->num_resets - 1; i >= 0; i--) {
-		ret = reset_control_deassert(qmp->resets[i]);
-		if (ret) {
-			dev_err(qmp->dev, "%s reset deassert failed\n",
-				qphy->cfg->reset_list[i]);
-			goto err_assert_reset;
-		}
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset deassert failed\n");
+		goto err_disable_regulators;
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
@@ -534,8 +528,7 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_unlock:
@@ -549,7 +542,6 @@ static int qcom_qmp_phy_pcie_msm8996_com_exit(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (--qmp->init_count) {
@@ -564,8 +556,7 @@ static int qcom_qmp_phy_pcie_msm8996_com_exit(struct qmp_phy *qphy)
 	qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
 		     SW_PWRDN);
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -769,23 +760,19 @@ static int qcom_qmp_phy_pcie_msm8996_reset_init(struct device *dev, const struct
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
+	int ret;
 
 	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < cfg->num_resets; i++) {
-		struct reset_control *rst;
-		const char *name = cfg->reset_list[i];
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
 
-		rst = devm_reset_control_get_exclusive(dev, name);
-		if (IS_ERR(rst)) {
-			dev_err(dev, "failed to get %s reset\n", name);
-			return PTR_ERR(rst);
-		}
-		qmp->resets[i] = rst;
-	}
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get resets\n");
 
 	return 0;
 }
-- 
2.35.1

