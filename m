Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935FE542245
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbiFHC4P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 22:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448540AbiFHCy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 22:54:27 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E463C37625F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:40 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m25so17341517lji.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21UlWUVeGuL5Wj0QV2P26fpJU80guRGyg/45XMfVZDA=;
        b=v0j8Zn3sbf/JlpIydZ47h1nMqkqIHiKhs8P8qH4VQy96KRMcgXe2E6iVh/rGiQhJJF
         lyDHhXo0VnhElj14FzPllr0ap86Sic9ApgQy7p/EF+MTMvrFWGFh7VrSbUlY54tcp3Me
         U7X2echMIG8PWNPrBCkYU7kHPonEVi3/WUNeqJnf50nxik7LDqS5cOwVvbSba70RRNUi
         ddya5JqViprDLaZYtDS+Q7A3Vz2jb6Nt8sHz/OF2FdMXmbxujjky4vojFsB/kO1+176m
         jxPWMdjYqAd7bPXBRVUQK8tW+P31yILW4GgDE+uouVblQKo1++HScO/mm+Vu9tGv3uJE
         /g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21UlWUVeGuL5Wj0QV2P26fpJU80guRGyg/45XMfVZDA=;
        b=x1rFM+5uygqmo9NOVL7WidtypUK483iPeaUZ5iEKcvb36j/KDFMD2Jzc0WK35sjblv
         VKa5cwNS5GPyl+7Q8HbpSn+9Q3F04CeG79sqAVWOKaE3haIUsm2JXzYe6CiVn5orTn6u
         cbC8zCdLwmUz6w8k67IRDM9ZlLpUdgzp/cyt94mXgxDBfvbzTqwZTIt3Zuxj8I6D4Uhk
         NbsE8TwUW+Yi5hA9nRPA1KJLqO3gkLs+KViA7vKATYeHBQtN2O3x+tun28zIxWwlQpZq
         elU7y/R1dBMdV4cINn0GWjwiVFcze6MgXrYQdFh5Jxxtn088PotRUI69ifysjs3KNH4V
         uSSA==
X-Gm-Message-State: AOAM53145vG8Ezhkf7ed4Jut9wDWjq3igRPkjHTpgyNlyxeAgeDezJKB
        GfgwNxMoJ6Db5u8NsApxWkG5Vg==
X-Google-Smtp-Source: ABdhPJx/pczHjfq0pnIh8oTbYtU8nwj+nIILdqcSlkYeM0HTzx4AFrNDVmgYTGB4sbj2gyqdgqbmyQ==
X-Received: by 2002:a2e:a374:0:b0:255:67e7:24a5 with SMTP id i20-20020a2ea374000000b0025567e724a5mr20026086ljn.58.1654637560263;
        Tue, 07 Jun 2022 14:32:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 26/30] phy: qcom-qmp-usb: drop multi-PHY support
Date:   Wed,  8 Jun 2022 00:31:59 +0300
Message-Id: <20220607213203.2819885-27-dmitry.baryshkov@linaro.org>
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

Each USB QMP PHY device provides just a single UFS PHY. Drop support
for handling multiple child PHYs. Use phy->init_count to check if the
PHY was initialized rather than duplicating this count.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
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

