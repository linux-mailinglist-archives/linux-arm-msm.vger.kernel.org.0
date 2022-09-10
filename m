Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0F85B44B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 08:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiIJGjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 02:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiIJGjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 02:39:12 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B75A9E8B1
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 23:39:11 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id c11so6566147wrp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=K+R864MMNrO2cPNjMkmAS7jKfMoXiY8NdWAl+fB+eGQ=;
        b=Ta3M7TMOo18hZLLz/HdVlxCgCxesGB8wcCY8DDlufzHFedqX/LO2nYzWP5u3dSndfm
         HAouPQ+uhreEbDJ+WuRgjLGibnDOye6fDRdrESgZj5UpQyiFd/eG1Y6vNwSb1Si31F5O
         YOJSXAly6uf9L9RdWBaFJM0ilJQPbMllyDJ7Ocq2s3KW0pic/qqudNO6HYb9i2GPaEVa
         tU6/aXPukfVPHjJjYsPWDWRkIttshBgw8kCfVUactwXUco0AaTRqfhEzE8KIDgzsrKlI
         P/RVQNNW3Czzi0Y2t8dBgSUp+0mZJaBsTZ98lnIIrDBjRUnE2MCd48AblL1MXQRlA8AI
         PKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=K+R864MMNrO2cPNjMkmAS7jKfMoXiY8NdWAl+fB+eGQ=;
        b=Ef9F4ZrNRC6pLCzVYsC1bcxO542aIIQAQ6ymxmwwQyt+cZ0uQDKtVOSvCItrX/TXKO
         9RC8Gs1fuRBlZJkNmSMJBac8Hh2m5SY1q8LODzfFgHJhtua1lw7aI348MXO8qEAqHsdm
         Htxw0I3yw/5VNEZZHg+f4n2Hp4aY4XWJxDGcpeuHBbnYSNjdgslriPjCYF0NuuOqEMJr
         rvdauTHJ3DmMfL7K9YYghK6StWSW+Tcdtj/3kWC3TNhkpPKlCUEt83ugZKqv/00KgDpC
         U2bjDnDC3YQ5SBDw+s9L5OExhlpbipM/slOeMlfaUXfWxN5Nn8I8kJDuH43GYXjMbGTk
         ZcMQ==
X-Gm-Message-State: ACgBeo3fQt4muRwnKg9VKBnZ6HzPd9iB1olz9ZwmZyuHkwevEWErUVG4
        rQR4xCphzVF1NsVLRbsZgJMw
X-Google-Smtp-Source: AA6agR6QAj/SfJNU9CxBdKX4kBZXqHVDvjDJBdHU1uD66ll37WGHTQO4n1qpphh1QfGPqgefg9npmQ==
X-Received: by 2002:adf:e4ca:0:b0:228:d8b7:48a7 with SMTP id v10-20020adfe4ca000000b00228d8b748a7mr9426556wrm.300.1662791949868;
        Fri, 09 Sep 2022 23:39:09 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.47])
        by smtp.gmail.com with ESMTPSA id c17-20020a05600c4a1100b003a61306d79dsm2825371wmp.41.2022.09.09.23.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 23:39:09 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vkoul@kernel.org, andersson@kernel.org
Cc:     kishon@ti.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] phy: qcom-qmp-pcie: Fix the SM8450 PCS registers
Date:   Sat, 10 Sep 2022 12:08:57 +0530
Message-Id: <20220910063857.17372-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

In the PCS region, registers QPHY_V5_PCS_EQ_CONFIG4 and
QPHY_V5_PCS_EQ_CONFIG5 should be used instead of QPHY_V5_PCS_EQ_CONFIG2
and QPHY_V5_PCS_EQ_CONFIG3.

This causes high latency when ASPM is enabled, so fix it!

Fixes: 2c91bf6bf290 ("phy: qcom-qmp: Add SM8450 PCIe1 PHY support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 4 ++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 4648467d5cac..b508903d77d0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1332,8 +1332,8 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG2, 0x16),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG3, 0x22),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG4, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG5, 0x22),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_G3S2_PRE_GAIN, 0x2e),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0x99),
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
index 61a44519f969..cca6455ec98c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
@@ -11,7 +11,7 @@
 #define QPHY_V5_PCS_G3S2_PRE_GAIN			0x170
 #define QPHY_V5_PCS_RX_SIGDET_LVL			0x188
 #define QPHY_V5_PCS_RATE_SLEW_CNTRL1			0x198
-#define QPHY_V5_PCS_EQ_CONFIG2				0x1e0
-#define QPHY_V5_PCS_EQ_CONFIG3				0x1e4
+#define QPHY_V5_PCS_EQ_CONFIG4				0x2e0
+#define QPHY_V5_PCS_EQ_CONFIG5				0x2e4
 
 #endif
-- 
2.25.1

