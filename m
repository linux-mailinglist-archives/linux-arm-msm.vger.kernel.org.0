Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B161615D7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 09:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiKBISw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 04:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiKBISu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 04:18:50 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B9520BC7
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 01:18:47 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso1242419pjc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uz5rAU9ELZXUhQKdgWYW63dEr04gx2RZSGlNehPa+N8=;
        b=lb8jMkTcXaHJTitiyBxQbSrcZWiZz5kx5p6cbMUPZH6oCszvVJInkTYfFqjzN8I2WM
         qqTuRWb1vYrSFD+j2nZfvJ8qQ3JfnBhJPyTDUnfFambe2spQjs0FYhIJkaZtw4nwixFD
         dHKH10Z+JrcObhTp35cJabwQR977rAFw9epn0wWXjt0+TQWuSz5gaQPWCfrGjDF/O/fH
         dnPHvbRvASZlBkr1wyoDRLhRObbntYWt//sg+1o/lqRncs8h8vdLLj/arNyPcTLNIxRN
         buct0YDRX0dB/U33RxXePscMRkSOoBtGfaobjLB1zV1+CEqYaQEkUbpxbSU6DrYJk9un
         bDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uz5rAU9ELZXUhQKdgWYW63dEr04gx2RZSGlNehPa+N8=;
        b=id8rMIPG+JwVwyRQGmn1KgV1WISF+IqvN5vVuZYESeahzx9CdYTYcGG2ghi0xn8+Ax
         iLljbRt7/i7DNgu9bRRX/FxtJlhgxAHmgJvdrTlPVEJ7y6BnwOTpZq+Wk2ycMqTUQwik
         Dhfgbpd8Jpzi6z5kYVxUgP5Q1c/X9uqiS0xeK16Gd31ApAcuHvrDE7ukfojRQ5V81Cfb
         TUF69qgGYHGtYbe75vNoR316bsY6tGGaq5CIDe7HJ7uWBymHkLoCUyEoPLKMhZQBGbHu
         rTtsKImQAAbpyzCQYiiMGRdk342BqhoJ979rmSPi6j6ZOJwNxYjEMzMGre4Ftpxx2LyU
         4sPw==
X-Gm-Message-State: ACrzQf0jl7iQCyi9bu0QtpcMHurJXqEjtdoG6eY2erk46+EVt6t+OGbG
        E81OjRR+qatdoXmcAvBGqkN2QFBu7UI3
X-Google-Smtp-Source: AMsMyM7UxrZC+2KKOSCG7ffJJkbSLuBDA+h4rihKC7yQbTlTPUM4lLxutHEw5Yyv3WkQ1DZwOQt3yQ==
X-Received: by 2002:a17:90a:b792:b0:212:ea82:bbb with SMTP id m18-20020a17090ab79200b00212ea820bbbmr12253622pjr.171.1667377126628;
        Wed, 02 Nov 2022 01:18:46 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id v18-20020a170902ca9200b00186e8526790sm7635119pld.127.2022.11.02.01.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:18:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vkoul@kernel.org
Cc:     andersson@kernel.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/2] phy: qcom-qmp-pcie: Fix high latency with 4x2 PHY when ASPM is enabled
Date:   Wed,  2 Nov 2022 13:48:34 +0530
Message-Id: <20221102081835.41892-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCIe QMP 4x2 RC PHY generates high latency when ASPM is enabled. This
seem to be fixed by clearing the QPHY_V5_20_PCS_PCIE_PRESET_P10_POST
register of the pcs_misc register space.

Fixes: 2c91bf6bf290 ("phy: qcom-qmp: Add SM8450 PCIe1 PHY support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2

* Dropped the changes to PCS_PCIE_EQ_CONFIG{2/3} registers and added
a new PCS_PCIE_PRESET_P10_POST register

 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index f3f75eda01a6..9473f63d2c1c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1305,6 +1305,7 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
 static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_rc_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_PRESET_P10_POST, 0x00),
 };
 
 static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_ep_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
index c9fa90b45475..3d9713d348fe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
@@ -11,6 +11,7 @@
 #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5	0x084
 #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
 #define QPHY_V5_20_PCS_PCIE_EQ_CONFIG1			0x0a0
+#define QPHY_V5_20_PCS_PCIE_PRESET_P10_POST		0x0e0
 #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
 #define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
 #define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
-- 
2.25.1

