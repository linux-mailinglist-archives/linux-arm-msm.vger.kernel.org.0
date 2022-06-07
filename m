Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B11054272D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbiFHCQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 22:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446309AbiFHCOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 22:14:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7424374ED7
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:38 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so24152430lfg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YY4e9Zz6bSkVs/V4IICJ8QehkpKPV/jM41pR0vmkc5Y=;
        b=uRvNN6JE8tTPx4g4seOzbpZryedm+vUSwKntcpxwS0emOkQEX53bdo2T/xn7QejuLO
         rRm9ZMphcwCyQwGNGcrOPAWlCvmTaWLvbzHUZG6vOvaq4nBFdCHoHoKydEFnATvYnv8y
         oCRH2AGPLznI6sWdjhdbaox8U1dHWFvyqhAPblsK9fESobM7kKmwhEx2YzuxsafKUpm9
         fN8DuzBCpwsIDnb0kmCND1UT3oxfuvLlC9iIELLAhKC4SuwjRUYlpPdD1WjyFegdRDck
         +m3Zv8UD34CznBX/bH+sdHx5JlssezNYGLogu8goqFrMz5ItGfN6UKc6mRyJDghBl9h9
         MMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YY4e9Zz6bSkVs/V4IICJ8QehkpKPV/jM41pR0vmkc5Y=;
        b=GMDn3xVEmau4Zo7p7EgxC6fS2LJufEWLjCtD5W0dnOjtYdGzU9CtJCn+mmLuu+uPQO
         rqeob6ZidnVos7Z1rnfPCfwinFCrGbOi85kBWjG8Ny0ktHoZkg9o8ULWsGkIv/N7/zBF
         jbfEuw8lpgIlWGNGuZeDICa45o//sfgrdcHKQz/4gRVCpk/3UWSyUQ4CopsWVKXaEk9j
         fpynOzEylPRVQHit77cefXLIMM5TfRKbfIIit3Vmb9gg387Mn3OsokexLvYDTlojlVoV
         IzaxP1XyQPAjU0i73wpGY5MyAhETm6/iaoPpkwLQjUyCz/MRcO91/pQ0+GA9X56UvdOe
         C4zA==
X-Gm-Message-State: AOAM533o1Bkq2LGyu/HNTclZk9oAhT4i+qxprrtYnUDcCcii7qu+10Bk
        lOnu1hA2ZwJfsdf65TORnBRyAA==
X-Google-Smtp-Source: ABdhPJyINP9p/K5UAIREx8rrVmL+ILhnLyhPaicwrF2HxwaVYESOd24rjOrHB7NOm7mcA115nVDdDA==
X-Received: by 2002:a05:6512:1327:b0:479:392d:aa0b with SMTP id x39-20020a056512132700b00479392daa0bmr9892956lfu.168.1654637558254;
        Tue, 07 Jun 2022 14:32:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 24/30] phy: qcom-qmp-pcie: drop multi-PHY support
Date:   Wed,  8 Jun 2022 00:31:57 +0300
Message-Id: <20220607213203.2819885-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
References: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
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

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
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

