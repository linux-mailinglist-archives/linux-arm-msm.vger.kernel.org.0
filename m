Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CA953B424
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbiFBHJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbiFBHJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA70DF9F
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id l13so6357063lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUi1GRDCzbQz4WRL2Z8raunDlEwEnLD1WyZsTIqHcSs=;
        b=movyFdz0seUuiwUeYHGAMTdXWumEnM/SCLVjU61kqTg1Cm5Lw21ticVQT08tocWl7C
         AJV9iini/uB1jvdX32G2OKAUPT31zm0+Jhv408gB3DEsmoDFD8yKOxT+fRjfTcNgOBWj
         dtGXBkUFnxYnOtUSZT+HSGSGPyJ8Ox2A+2CYP9+Anf8hC75ZgY7KrQXFDpWikWwujzj6
         8JLTpIzPs4Z2yIZqZL7Pyz6p0d+9X8ISroS0/y3WRdfB2bNxVX2LmRVUNZ2iPUUf/ujh
         +lj33C/62ZDNaJxIuP+zduGOgUI4O7+rxW5RmF+D0TCYHpwJ6bH0ydLlYXPoUeMOiCwz
         GrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUi1GRDCzbQz4WRL2Z8raunDlEwEnLD1WyZsTIqHcSs=;
        b=vlIDyV7/chW15AA3DLIEW87fYeu2M5UDxhO8Uh5uJ+i0v1Q5bZkdvzhVIJNV/HZhHw
         kE0ekp1jX/U6jZY2g3GVVZsV6KHS4KbPH2os3wgU63rXWXwdo6dy9xOmGZtEMK+H/8vv
         OedhkPYzsmPsaaQTsSFQRC7OWkRlaOBQ91AsRCHkxj8ylBj6Bugzh2S2tmIFH8sJtEl1
         P/tqEeTptz8gYq2uGa+sO/dUDofGSvWOMLhI6vTxBVmL4g2yptmxw/9jgVKECznRX+46
         xjkIHO3NRbkAnnDidy7lXL2pY7fdN3Q2JTjKG2Pamo0azugFLomHeetwpMAnCKFcXc1M
         qbMw==
X-Gm-Message-State: AOAM5300Q3qF4GYHlYJv+dMnFDRumqi8i6QWUP/5aVJMrCFCDom99B3A
        dj6K0QCOpjnht/feyg7OIX66IA==
X-Google-Smtp-Source: ABdhPJwafDWA/nTwCYFnhq7m6YxICMafBcii6APlAw7vopjjTp0g6m+hQ5Zk8OpB/FC4VOgbS4lDeA==
X-Received: by 2002:a05:6512:3b09:b0:478:66dd:3081 with SMTP id f9-20020a0565123b0900b0047866dd3081mr2528327lfv.107.1654153776875;
        Thu, 02 Jun 2022 00:09:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 28/30] phy: qcom-qmp-pcie: use bulk reset_control API
Date:   Thu,  2 Jun 2022 10:09:07 +0300
Message-Id: <20220602070909.1666068-29-dmitry.baryshkov@linaro.org>
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

Switch qcom-qmp-pcie driver to use reset_control_bulk_assert / _deassert
functions rather than hardcoding the loops in the driver itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 49 +++++++++---------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 0676b67d3ff6..bd9f71456e32 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1334,7 +1334,7 @@ struct qcom_qmp {
 	struct device *dev;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -1789,7 +1789,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
-	int ret, i;
+	int ret;
 
 	/* turn on regulator supplies */
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -1798,22 +1798,16 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 		return ret;
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
@@ -1831,8 +1825,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -1843,10 +1836,8 @@ static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int i = cfg->num_resets;
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -2056,23 +2047,19 @@ static int qcom_qmp_phy_pcie_reset_init(struct device *dev, const struct qmp_phy
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

