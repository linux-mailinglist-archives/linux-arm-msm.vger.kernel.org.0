Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D9E613CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiJaSDB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiJaSCv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:02:51 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4B913D73
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:02:50 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d24so11441807pls.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhOaUl9F/HsZmg2/HeXQifMc3FhrE3vEJ6lXoXELXXM=;
        b=MNbG+bAinnYs9+4/IBl6ndbLalqDQMyy4xFZtzZXTueMsg0rPrmsnbpUtj4lUJA7Go
         4z+7Q85NuJ2KkN2JUfWtAwNKRG8IChg4HMIq/HeuJPezH5TwakwmkbLGlBkNK2QsIU8e
         dFoTOJ9HgsRuL0j9vo9AcVmaQAGOj4MbfU+TJIhh8WS1H983ZCVIHvk3rzv4L6x79PHA
         DQm97JnN+g+YNr+1yFA17B/u9u84Ne0blasrnWRL/l57KrECSbI3S62ozBhL2v+2djqZ
         ohnUxAB0REzf+ZRXCs8vJXmyrx6qTCmGMSclX3wgidmJ+/SlMwkCeGhHHIWV27o/H7w7
         J6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhOaUl9F/HsZmg2/HeXQifMc3FhrE3vEJ6lXoXELXXM=;
        b=1myyh/ayHczszYCJstEK3TsHN/CUBJfVqX06WvrMa7bK1bq/r11YRXJwqT1K09H+VU
         PKjasyrFoRUPLmyocPJAhoOLhODBMXl3rsusryg74i5QCSYs5X6ntW8MLO7CWmu23OCK
         Vf2629YvrG7KMKfhJbMpiq1H5TrsAp4WNEsWzjWxRxNMWwRBe3pbj/+xogLLsf+exQkz
         AGCz0QCZF5vIjY5RA9vM/XU02l1+qq5XGOkiAXXFCzZf6y6TNvL98SZvvFgmIcmYf6Ek
         KgejgzZi6RGBCZ6q10XjCyoxaS9V81OJXEsyy/L4fUAExQ7Q4iQmNW0fRD+/SUScXIjm
         E1VQ==
X-Gm-Message-State: ACrzQf1kVf7C1IJ60ZD9oD3jHcypFdDO8LEMSjh0g+vhYpO5D8jXDclB
        NiTkc+TVzep2o9P+XOv7He5O
X-Google-Smtp-Source: AMsMyM7puVGfFdPsAIycm2nf5Bn6We9BuL6hxuAuM6QV5Pk6jrkLpY6K2cwvfABjtn50Ck1a6v0Leg==
X-Received: by 2002:a17:902:6bc8:b0:179:fef9:b2fa with SMTP id m8-20020a1709026bc800b00179fef9b2famr15640210plt.96.1667239370349;
        Mon, 31 Oct 2022 11:02:50 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.221])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b00186c6d2e7e3sm4742224plb.26.2022.10.31.11.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:02:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 02/15] phy: qcom-qmp-ufs: Add support for configuring PHY in HS Series B mode
Date:   Mon, 31 Oct 2022 23:32:04 +0530
Message-Id: <20221031180217.32512-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
References: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add separate tables_hs_b instance to allow the PHY driver to configure the
PHY in HS Series B mode. The individual SoC configs need to supply the
serdes register setting in tables_hs_b and the UFS driver can request the
Series B mode by calling phy_set_mode() with mode set to PHY_MODE_UFS_HS_B.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index cdfda4e6d575..4c6a2b5afc9a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -20,6 +20,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include <ufs/unipro.h>
+
 #include <dt-bindings/phy/phy.h>
 
 #include "phy-qcom-qmp.h"
@@ -549,6 +551,8 @@ struct qmp_phy_cfg {
 
 	/* Main init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_cfg_tables tables;
+	/* Additional sequence for HS Series B */
+	const struct qmp_phy_cfg_tables tables_hs_b;
 
 	/* clock ids to be requested */
 	const char * const *clk_list;
@@ -582,6 +586,7 @@ struct qmp_phy_cfg {
  * @rx2: iomapped memory space for second lane's rx (in dual lane PHYs)
  * @pcs_misc: iomapped memory space for lane's pcs_misc
  * @qmp: QMP phy to which this lane belongs
+ * @mode: PHY mode configured by the UFS driver
  */
 struct qmp_phy {
 	struct phy *phy;
@@ -594,6 +599,7 @@ struct qmp_phy {
 	void __iomem *rx2;
 	void __iomem *pcs_misc;
 	struct qcom_qmp *qmp;
+	u32 mode;
 };
 
 /**
@@ -983,6 +989,8 @@ static int qmp_ufs_power_on(struct phy *phy)
 	int ret;
 
 	qmp_ufs_serdes_init(qphy, &cfg->tables);
+	if (qphy->mode == PHY_MODE_UFS_HS_B)
+		qmp_ufs_serdes_init(qphy, &cfg->tables_hs_b);
 
 	qmp_ufs_lanes_init(qphy, &cfg->tables);
 
@@ -1070,6 +1078,15 @@ static int qmp_ufs_disable(struct phy *phy)
 	return qmp_ufs_exit(phy);
 }
 
+static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	qphy->mode = mode;
+
+	return 0;
+}
+
 static int qmp_ufs_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -1105,6 +1122,7 @@ static int qmp_ufs_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 static const struct phy_ops qcom_qmp_ufs_ops = {
 	.power_on	= qmp_ufs_enable,
 	.power_off	= qmp_ufs_disable,
+	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.25.1

