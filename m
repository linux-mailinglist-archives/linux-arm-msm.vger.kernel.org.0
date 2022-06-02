Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3B853B41E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbiFBHJk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbiFBHJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB59455BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so6404189lfc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XFd4kCE85Pc/CVtzGL4uufUv957n+EtJyEGy4RFKWqo=;
        b=Jbe2q+C/zgKFJbrD1wXTCTOgO9hxBgEg1lsgcM/Tfn+fK+0lJPXsdCnNTR0rTEZsev
         mr9KK3F7MtJXdBBpCYD4BXOoJS7PZCZ7BKS2k7MASNTXswFYqMZna1UqLwOH5e7YhzrN
         ezTv0DppNcIST6TilPKyiLiI6ZtbiIsYu44B/ZnzXSkYei6rIcMooJrHjzZzQndW1QYU
         HOsSS9rluVWca98z2L0I/uYmpf4HDPjjG9ohoYGmxc/4vVL+4fCXvG2I84akBSqIHmKZ
         erpWWHfZ/F/2mhTJo3EdP0yDbFGloyI6lu3iIg5pGT07wZ6P+uVlgMHflxDD4rbTQyV8
         YuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFd4kCE85Pc/CVtzGL4uufUv957n+EtJyEGy4RFKWqo=;
        b=aFmNX9TzId5tzjuG24pOuZjjnihcto+OImwSi8c203DUjqhyiEHuV3JZClMDIODWXe
         886BcLvhEAl/oz1t7gdb7iIEDwoMoNGYkAIsoBjd25/FeT72/Z7rfLDofzPg8WtYUAQF
         O1KhkQd0miNrZxng0dhYP+o9aO1C3ptrTCEr1sctptqo/apwqw/Zo7ZSFHKHBj2UyqBK
         GXqVExdyPH9Ac4AyIsc1MmvmsT+h5rSNzOyEL1E2DBx75fpYu7LGTfC0Z2uIHtkrE9xI
         EnRFjlx3h/sr+j1RdFukbgEOP856fKSFW+X9F34JZaLa5b78SfuuBQ9bOd3fHygIEXwk
         XRAQ==
X-Gm-Message-State: AOAM532l6uIkwGYdADkS2d1J8hTXY86Ar8+k7ugU5ihECaIlz35B74dS
        vu6r+rnqwaaLYgzzQ76xv0yN/w==
X-Google-Smtp-Source: ABdhPJwFrpODjo39JB4MMNSCL9vyix1beuQecykseKS3SQojCWyDHcoUeEHn7e5sxKTT6+5LQLGTlQ==
X-Received: by 2002:a19:f24e:0:b0:479:1376:793c with SMTP id d14-20020a19f24e000000b004791376793cmr123862lfk.526.1654153774254;
        Thu, 02 Jun 2022 00:09:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 25/30] phy: qcom-qmp-ufs: drop multi-PHY support
Date:   Thu,  2 Jun 2022 10:09:04 +0300
Message-Id: <20220602070909.1666068-26-dmitry.baryshkov@linaro.org>
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

Each UFS QMP PHY device provides just a single UFS PHY. Drop support
for handling multiple child PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 33 +++----------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index e9b32a3d5adb..a2526068232b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -669,8 +669,6 @@ struct qmp_phy {
  * @vregs: regulator supplies bulk data
  *
  * @phys: array of per-lane phy descriptors
- * @phy_mutex: mutex lock for PHY common block initialization
- * @init_count: phy common block initialization count
  * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
@@ -681,9 +679,6 @@ struct qcom_qmp {
 
 	struct qmp_phy **phys;
 
-	struct mutex phy_mutex;
-	int init_count;
-
 	struct reset_control *ufs_reset;
 };
 
@@ -931,17 +926,11 @@ static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 	void __iomem *pcs = qphy->pcs;
 	int ret;
 
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
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
@@ -956,14 +945,10 @@ static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
 			     cfg->pwrdn_ctrl);
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-err_unlock:
-	mutex_unlock(&qmp->phy_mutex);
 
 	return ret;
 }
@@ -973,20 +958,12 @@ static int qcom_qmp_phy_ufs_com_exit(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
-	mutex_lock(&qmp->phy_mutex);
-	if (--qmp->init_count) {
-		mutex_unlock(&qmp->phy_mutex);
-		return 0;
-	}
-
 	reset_control_assert(qmp->ufs_reset);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 }
 
@@ -1322,7 +1299,7 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
 	const struct qmp_phy_cfg *cfg = NULL;
-	int num, id, expected_phys;
+	int num, id;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -1342,10 +1319,6 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 	if (IS_ERR(serdes))
 		return PTR_ERR(serdes);
 
-	expected_phys = cfg->nlanes;
-
-	mutex_init(&qmp->phy_mutex);
-
 	ret = qcom_qmp_phy_ufs_clk_init(dev, cfg);
 	if (ret)
 		return ret;
@@ -1360,7 +1333,7 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 
 	num = of_get_available_child_count(dev->of_node);
 	/* do we have a rogue child node ? */
-	if (num > expected_phys)
+	if (num > 1)
 		return -EINVAL;
 
 	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
-- 
2.35.1

