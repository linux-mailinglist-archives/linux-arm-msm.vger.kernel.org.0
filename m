Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E336753B426
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbiFBHJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiFBHJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB70AE51
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t25so6381404lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UAKyR81ddNuP6637Lad2Iz2FIhX299nucXwl0deW0aw=;
        b=z3Ta3fOk2Y/GamJd95ZtWJIO99IEWoBF8eJoq8+7M5DRpylf930pph2EG4q3ACoDfm
         /DIWBCj2w6Upbitcywlhxp8IFFraTZRY/wS3weLQPzXcuH8qGjoKyYQfvTEFyzrAJKnG
         n7fxO1lsRXUoNsh0GOskKhnHBFdT59mffXNoJ0p1hV/1QM2Q6kCvnM1k1pw3YYRtVZ33
         lrH/QOhej+rlXWj0j9opCe6a9aTogzbfY6S2iLHPgf52Ul5xmszjd14FEg4nkD17iSFX
         nsQGUO99cSdQkWc3THZT2Rn7C8bVX83EnTITumaz3XL0ZVCs5zWZzPppz2a6iEUCD3HN
         7FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAKyR81ddNuP6637Lad2Iz2FIhX299nucXwl0deW0aw=;
        b=rXjKTWuwAowvf7jXOeUQ3UDPFmhLqD2yFSjl+hEaKZp0Dx81m5XjU7GFLVqMmLXH2A
         tsrrEFbxnJZJTGXwLN95Qps3eXzsZxkp4WdLxgBUWuJHNnikQ/Mw260KvQRrBOtONjGn
         l5ZQhO6KAk0aZynBK1CilFuY9No4LBOa3nVXAB0RPzLM8xCuSEc3kIoUTGABKze3t8mG
         Ymkkay0NqWhri3RZnqz1AdTMWcRSJZ4vUqQ3xTR95MpYxBAdJp7hKCphfDZdQwn7+ICa
         ahMxXgyYFN1JgDQfv8G4T3tEtPLL9yW6IEfulik5VOeLyPUEMOCE+FRCf40aq+2GDw2V
         061Q==
X-Gm-Message-State: AOAM533yA613qt1/L/WSwshxBBktGQUBQVWXKWEEqVFTsRT0r274m4U9
        oQ3ROWyWPpEcEn4pwiMa6jRF7A==
X-Google-Smtp-Source: ABdhPJzttC7oSsr5xT5K+iyqYJKYlL7tjx44F2JOlbA9KLrQLZ5JVq7qOdtWSKTRN0Ykt7ZfXIM9/Q==
X-Received: by 2002:a05:6512:2807:b0:477:b906:81af with SMTP id cf7-20020a056512280700b00477b90681afmr51334953lfb.299.1654153778905;
        Thu, 02 Jun 2022 00:09:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 30/30] phy: qcom-qmp-usb: use bulk reset_control API
Date:   Thu,  2 Jun 2022 10:09:09 +0300
Message-Id: <20220602070909.1666068-31-dmitry.baryshkov@linaro.org>
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

Switch qcom-qmp-usb driver to use reset_control_bulk_assert / _deassert
functions rather than hardcoding the loops in the driver itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 49 +++++++++----------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 969253e7bdd9..aebe5ed4e4e3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1446,7 +1446,7 @@ struct qcom_qmp {
 	void __iomem *dp_com;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -2009,7 +2009,7 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
-	int ret, i;
+	int ret;
 
 	/* turn on regulator supplies */
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -2018,22 +2018,16 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
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
@@ -2074,8 +2068,7 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -2086,10 +2079,8 @@ static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int i = cfg->num_resets;
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -2376,23 +2367,19 @@ static int qcom_qmp_phy_usb_reset_init(struct device *dev, const struct qmp_phy_
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

