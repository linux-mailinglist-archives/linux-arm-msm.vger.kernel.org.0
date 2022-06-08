Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12FF5423C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiFHDGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 23:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240594AbiFHDDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 23:03:03 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33F6174282
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 17:31:54 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id v9so20976445lja.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 17:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9MGv6IyB1L5mu7VLeRV9tquByEyT+sp+41ahlI9F4EE=;
        b=fWl0cpDQkNqevyWPzASipVNityB1KjuX9jTlByMvlMMJWjgIscZQN6H6+23Iop8MOn
         lcjhv+1qj/QIhsB2FUT7/ej448lONWu6L9c2mYUwRjCilj6gy06EHx9/fp/7AR5e+REi
         h04VulMUdBz8oRORac4Now3cQv3JLzpOaWhot7l0bdVyE7xzZ8ykapT7yEFozZexmvie
         3SjlyJqlkvPzx/OqpYj74+IPPmWr5TyLMBbyDfBOkvO3DmZ3ezQRRBHDbLjooofHFbgE
         hPsuPa8lVJuMpwIUO3OoNWrsu1kK95zs+CD4+gNOSdr2qLaLc486dYr4oJ7bmsF0dpmg
         Hvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9MGv6IyB1L5mu7VLeRV9tquByEyT+sp+41ahlI9F4EE=;
        b=TG9HeZh0SEvvNuZ4jer5k6m27cm/xpmOw3DLJueeJz+2poUzY9y76q4uZ1p7Y01S0u
         /5qRn59eUdLa19zKmjSK0tSuV/kTKmzcQeK8YiO2X8Y9q2hkHBftPrhj0L/EAi8/bXJT
         6LdhvgHZ5ZNqEFtvun7k6/S4wlZOtuuUgP0zp+BoPYanstiIiXukkcalyw04f71lFfWM
         mouI9RMUUsIFzy1+JHlED+3w59ZjIjB6nrMLu/k66KEOCeoHof/M6D4sVjFm9vM5W9JB
         j8wEWFDKY/hqfSlKB79kFU6A5sfxDSrLmofAvRCbg/aPO23iM4gDK3J2JCkdRaWx6CAh
         M7YQ==
X-Gm-Message-State: AOAM531Wk2AYjNZ7buRA3b1Y1u30Mmku/JXmhnZFiPpiJQ2POWFxSV4d
        oLeSVPKbesL1B77Ozbf8rQzSmg==
X-Google-Smtp-Source: ABdhPJzKxQOsc+sTDWBkvjfgo3SED+f/UgG8Bg6yKNNtKMAM655HLJsxtR3AGm98Q+icncTnLq2ZBw==
X-Received: by 2002:a05:651c:233:b0:255:58b9:1f53 with SMTP id z19-20020a05651c023300b0025558b91f53mr23134700ljn.143.1654648264790;
        Tue, 07 Jun 2022 17:31:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b00478635ebdccsm3464569lfp.251.2022.06.07.17.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:31:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 1/2] phy: qcom-qmp: fix the QSERDES_V5_COM_CMN_MODE register
Date:   Wed,  8 Jun 2022 03:30:58 +0300
Message-Id: <20220608003059.2910252-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Change QSERDES_V5_COM_CMN_MODE to be defined to 0x1a0 rather than 0x1a4.
The only user of this register name (sm8450_qmp_gen4x2_pcie_serdes_tbl)
should use the 0x1a0 register, as stated in the downstream dtsi tree.

Fixes: 2c91bf6bf290 ("phy: qcom-qmp: Add SM8450 PCIe1 PHY support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 06b2556ed93a..b9a91520439c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1116,7 +1116,8 @@
 #define QSERDES_V5_COM_CORE_CLK_EN			0x174
 #define QSERDES_V5_COM_CMN_CONFIG			0x17c
 #define QSERDES_V5_COM_CMN_MISC1			0x19c
-#define QSERDES_V5_COM_CMN_MODE				0x1a4
+#define QSERDES_V5_COM_CMN_MODE				0x1a0
+#define QSERDES_V5_COM_CMN_MODE_CONTD			0x1a4
 #define QSERDES_V5_COM_VCO_DC_LEVEL_CTRL		0x1a8
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
-- 
2.35.1

