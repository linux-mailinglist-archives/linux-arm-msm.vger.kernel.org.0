Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73241542239
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236948AbiFHCDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 22:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442302AbiFHCAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 22:00:08 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BBD377B17
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id be31so30301516lfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2imGqpmmUYIL/vBXDX4AMR6VhO9AAPmsJkl/66iJTZA=;
        b=wgyLw1ukIv27Jr7FA2UHBVDIW9I5o/409G8LQ9nro6bXSfsSl/TFXOinq21vCTFEeI
         cF5dvLd3L6VAc703EkdJdX9GVWHqFj3hZbWFwTQV10hHlty6g3Kaf5fRv3p2xAmVbOrw
         3m34tcLZ/6n6kh9uBNEoLUItkQAj1XntUTJosrpGAmypdiNRU5WQxAPtD/8aZpIGbCWH
         p6euAtnd9cuvFYP557qQBIPPd6kQIsUX3Bk1psVeid/+6UBZPBrasL01eA10tgyJuNxi
         6FaktP3dtytm4v/GCTwC1lPhe85rjV+WpRnUyYBwaeP4m+rxv3yyoyJzhPsbyjcOAc/e
         bTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2imGqpmmUYIL/vBXDX4AMR6VhO9AAPmsJkl/66iJTZA=;
        b=B8oolDZDOhC84+ZHNsrLq7Ddy2jgUgdkGHv0dz5rfnrMtvhxYgBab5NENu74xdGI6P
         HV6MSr5Mer6SqjKHbfmRpVUKtKXpURWCX3LFqnx4GSq1KoMQjGIQvEBxj6E1aVDOWaec
         +0r2PRsyczUGOSTukkrOIvKvx+D+aPGIDgEuWvFmfrUfj3ImmoCMFLlCH1VgiDGyDL1A
         5tyD2YykzHXdcHr7YdO/BRqefoHrVCMd/mrN3DiFxjq4HwyIkAo7X/X+6NuQWyifHm9Z
         dF6qVBRHUyHI5HBrJziZG4Q4HM8ZWniBcyQigVI6dRjo4H8zoh0ki3F5kYJrwKPu1FTm
         0tPQ==
X-Gm-Message-State: AOAM532ADbDBoXU6DJOhSs/+ZUFBxRBuaoHEtyw8e/L6KLJoJB5BGQTW
        hADpemII/qAzoThUCpsUAXQIQw==
X-Google-Smtp-Source: ABdhPJwFMyzjnfwFMJTEVGamo8VIoOOTzr7r22uif+Mr+AFqfKxBSwM8n6+HCBp/2K2axHKxLqqKBw==
X-Received: by 2002:a05:6512:1052:b0:479:1f92:13b4 with SMTP id c18-20020a056512105200b004791f9213b4mr13089936lfb.200.1654637559197;
        Tue, 07 Jun 2022 14:32:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 25/30] phy: qcom-qmp-ufs: drop multi-PHY support
Date:   Wed,  8 Jun 2022 00:31:58 +0300
Message-Id: <20220607213203.2819885-26-dmitry.baryshkov@linaro.org>
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

Each UFS QMP PHY device provides just a single UFS PHY. Drop support
for handling multiple child PHYs.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
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

