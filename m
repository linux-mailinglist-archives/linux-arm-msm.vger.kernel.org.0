Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E38053B423
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbiFBHJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbiFBHJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:39 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF29065DE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:36 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s13so4306397ljd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7STra2ppWviST4fEmSbxheGWkzqe4bH+WhSd88tTfjc=;
        b=Rz1eR8d99I4lLfQxw+GFRNA8ElX/Yz5npKMK4pPBDeR+8YLJUgknHiuJJBjevI4lJX
         EFGRmqcCMbY3K7gcjVpg7jd+TvmTySM6Ji32YFSK163o0zgjTGlwCTbGkQKZDfWI6uN/
         Q8vYX8onW4xK87P6NAiHDqa9Fokd/xgRGwOn5pqTKj/l/batfasTGbCyCTBhLlvLqn0F
         TT3pCQoeZHMWffhh5x1szvRQd3WQAGFCX96lQ/geSmH96j8KfK0gTQW2Mb+8qsFo9C9e
         eTPaCOX1fhbUb+NsGBA3VWuybpx76u9IFlvCSWAc6+qdw4YpWNq5nsvidXyBlVFpaUjO
         86wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7STra2ppWviST4fEmSbxheGWkzqe4bH+WhSd88tTfjc=;
        b=c/nn9ZKERUN3i+xmi+fGpNv64bI3Hy8R/bUq1VkwtTZScVwuya2XrR6luiuy9c4mLz
         azxYIv1+nXWSbjfNgUM9OlVT5YKED5KTrL7N+MkmYuCMQUb4CsOx4wtc7dIv/KP2NZ6S
         9/x5FjXq7x+dzJbJGxSx4kznmJFOMTTM6e3jCFOypPpGgbLDferZsfgoCJTL0aHdvx80
         kOXPLxxjWbw09cemHXeznxeoKhC/Jg+tspUGCDy3bCy7/QljAc+OwYxGDk8tF2QJjmLE
         DA7eSkxVy/Fi6bobt3YXDXBLmB4/YRagCTrya+YP5FOfT4uzSUVytWNmbSFlHqlGkgXy
         TtrQ==
X-Gm-Message-State: AOAM530FtAd5ZiFyOHCey6Wove9HgP3yLw++5J2RGI4sFGvhqjLyESvb
        kyF8GiYFmxauRhesKf3iTVpgfQ==
X-Google-Smtp-Source: ABdhPJyftYaXzst5H4OBZYD60Ot3bDQJTl2v5xDd0u8DrJ9AdTEkACJTUPDNQZK9qeaIR3FK2JYReQ==
X-Received: by 2002:a05:651c:98d:b0:24d:b554:7d18 with SMTP id b13-20020a05651c098d00b0024db5547d18mr40675355ljq.87.1654153775065;
        Thu, 02 Jun 2022 00:09:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 26/30] phy: qcom-qmp-usb: drop multi-PHY support
Date:   Thu,  2 Jun 2022 10:09:05 +0300
Message-Id: <20220602070909.1666068-27-dmitry.baryshkov@linaro.org>
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

Each USB QMP PHY device provides just a single UFS PHY. Drop support
for handling multiple child PHYs. Use phy->init_count to check if the
PHY was initialized rather than duplicating this count.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 37 ++++---------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index a633263c900d..969253e7bdd9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1440,8 +1440,6 @@ struct qmp_phy {
  * @vregs: regulator supplies bulk data
  *
  * @phys: array of per-lane phy descriptors
- * @phy_mutex: mutex lock for PHY common block initialization
- * @init_count: phy common block initialization count
  */
 struct qcom_qmp {
 	struct device *dev;
@@ -1452,9 +1450,6 @@ struct qcom_qmp {
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
-
-	struct mutex phy_mutex;
-	int init_count;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -2016,17 +2011,11 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 	void __iomem *dp_com = qmp->dp_com;
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
@@ -2082,8 +2071,6 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
 			     cfg->pwrdn_ctrl);
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 
 err_assert_reset:
@@ -2091,8 +2078,6 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 		reset_control_assert(qmp->resets[i]);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-err_unlock:
-	mutex_unlock(&qmp->phy_mutex);
 
 	return ret;
 }
@@ -2103,12 +2088,6 @@ static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
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
 
@@ -2116,8 +2095,6 @@ static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 }
 
@@ -2332,7 +2309,7 @@ static int __maybe_unused qcom_qmp_phy_usb_runtime_suspend(struct device *dev)
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
-	if (!qmp->init_count) {
+	if (!qphy->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -2358,7 +2335,7 @@ static int __maybe_unused qcom_qmp_phy_usb_runtime_resume(struct device *dev)
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
-	if (!qmp->init_count) {
+	if (!qphy->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -2673,7 +2650,7 @@ static int qcom_qmp_phy_usb_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
 	const struct qmp_phy_cfg *cfg = NULL;
-	int num, id, expected_phys;
+	int num, id;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -2700,10 +2677,6 @@ static int qcom_qmp_phy_usb_probe(struct platform_device *pdev)
 			return PTR_ERR(qmp->dp_com);
 	}
 
-	expected_phys = cfg->nlanes;
-
-	mutex_init(&qmp->phy_mutex);
-
 	ret = qcom_qmp_phy_usb_clk_init(dev, cfg);
 	if (ret)
 		return ret;
@@ -2722,7 +2695,7 @@ static int qcom_qmp_phy_usb_probe(struct platform_device *pdev)
 
 	num = of_get_available_child_count(dev->of_node);
 	/* do we have a rogue child node ? */
-	if (num > expected_phys)
+	if (num > 1)
 		return -EINVAL;
 
 	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
-- 
2.35.1

