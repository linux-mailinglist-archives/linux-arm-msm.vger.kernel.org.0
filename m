Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16036566670
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiGEJnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiGEJnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:49 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CD0B1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id bx13so13827101ljb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MUejcEUBOlGy0+QEeY0SWSm0DJwBNAice3z2nR2K0iQ=;
        b=y9Ffw2V7fTW3OArwYj7dZbyMXE/nzfYsz8V1+vQNB6cXHNUc2rRoMjbRgZz53wfOty
         WoS101BUGGKiMJjJsfbNWj2fWKVA1aCKu3zFgPRcmSxV/As5y++kDwKUjLzd86ahhQ1Q
         od/scxspAhRUKDIFVGZ2F6HM/1joR+KOj8zlE3jO4wP6oyy5YG5B5Fi7HEPp64Xu83hg
         k78m8dhzDrDfdc+m8FSFHHz8N09vKtzbQsuz46Ts5pvEDe6ycgNOnu1FDSfgxdLIFytV
         yQjOc/zSGHOWds9uBxNXP+iG/CNHOmS+knSD/yfEsNMoeReVbusWSB9eMsT7l/4orrEO
         us7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MUejcEUBOlGy0+QEeY0SWSm0DJwBNAice3z2nR2K0iQ=;
        b=BkSoh0B/wWtdsJRdWLU6DBfeVJfwrn+Yjg6HKQ2fjzIucE/Y9/7Xwlf1NVs4WM8iNV
         Q5PgjB2Yd+r3os496buOB9Jy40VWCBWH5eVKf9nrUMLj/cM+04BOwiXjwiEcPLcDL919
         SXtTTOlnxP5Mgrx8gP+UOubGuHPGX+zZx664gIgdJKt/EGJViDqntV01566x6GQLRYMW
         Oti9qXrfg3cMXvgcFe/fFiNHZORCmD8PkPDX/SQjxFyJCh8tg6R99eanrxEaAI9nDiPK
         3LxZG+5THclRtCJ3KHhJuGROFtLVLG4NPs1Ep531dp9MPCUYvNIpfTjhSvCQICJ4xt+G
         sDrw==
X-Gm-Message-State: AJIora/1Q9W+MYnPCmL0UH5JTsXIjMv9MIuf1rf3FbnnlPNHmKgdo5jN
        CnHGyWPkixtqnQ9FjLJw6kbzqw==
X-Google-Smtp-Source: AGRyM1tD1BR5vHB1UcIsIoMHtm/yqmy50qXzO/CbESzFC1/63+M3qM6tRqB78RUwpcmqNLShgyCVKg==
X-Received: by 2002:a2e:bc18:0:b0:25d:3049:4d69 with SMTP id b24-20020a2ebc18000000b0025d30494d69mr2144750ljf.362.1657014223097;
        Tue, 05 Jul 2022 02:43:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 26/28] phy: qcom-qmp: pcs-pcie-v4: add missing registers
Date:   Tue,  5 Jul 2022 12:43:18 +0300
Message-Id: <20220705094320.1313312-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing registers, verified against:
- msm-4.19's qcom,kona-qmp-usb3.h

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
index 5a97867c5ba6..4cc02288d418 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
@@ -7,17 +7,66 @@
 #define QCOM_PHY_QMP_PCS_PCIE_V4_H_
 
 /* Only for QMP V4 PHY - PCS_PCIE registers (same as PCS_MISC?) */
+#define QPHY_V4_PCS_PCIE_INT_AUX_CLK_STATUS		0x00
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_STATUS		0x04
+#define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG1		0x08
 #define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2		0x0c
+#define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG3		0x10
 #define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4		0x14
+#define QPHY_V4_PCS_PCIE_PCS_TX_RX_CONFIG		0x18
 #define QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x1c
+#define QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_CNTRL		0x20
+#define QPHY_V4_PCS_PCIE_EPCLK_PRE_PLL_LOCK_DLY_AUXCLK	0x24
+#define QPHY_V4_PCS_PCIE_EPCLK_DLY_COUNT_VAL_L		0x28
+#define QPHY_V4_PCS_PCIE_EPCLK_DLY_COUNT_VAL_H		0x2c
+#define QPHY_V4_PCS_PCIE_RX_IDLE_DTCT_CNTRL1		0x30
+#define QPHY_V4_PCS_PCIE_RX_IDLE_DTCT_CNTRL2		0x34
+#define QPHY_V4_PCS_PCIE_SIGDET_CNTRL			0x38
+#define QPHY_V4_PCS_PCIE_SIGDET_LOW_2_IDLE_TIME		0x3c
 #define QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L	0x40
+#define QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H	0x44
 #define QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L	0x48
+#define QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H	0x4c
 #define QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x50
+#define QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG2		0x54
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG1		0x58
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG2		0x5c
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG3		0x60
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG4		0x64
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG5		0x68
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG6		0x6c
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG7		0x70
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG1		0x74
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG2		0x78
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG3		0x7c
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG4		0x80
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5		0x84
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG6		0x88
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG7		0x8c
 #define QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS		0x90
+#define QPHY_V4_PCS_PCIE_LOCAL_FS			0x94
+#define QPHY_V4_PCS_PCIE_LOCAL_LF			0x98
+#define QPHY_V4_PCS_PCIE_LOCAL_FS_RS			0x9c
 #define QPHY_V4_PCS_PCIE_EQ_CONFIG1			0xa0
 #define QPHY_V4_PCS_PCIE_EQ_CONFIG2			0xa4
+#define QPHY_V4_PCS_PCIE_PRESET_P0_P1_PRE		0xa8
+#define QPHY_V4_PCS_PCIE_PRESET_P2_P3_PRE		0xac
+#define QPHY_V4_PCS_PCIE_PRESET_P4_P5_PRE		0xb0
 #define QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE		0xb4
+#define QPHY_V4_PCS_PCIE_PRESET_P8_P9_PRE		0xb8
 #define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
+#define QPHY_V4_PCS_PCIE_PRESET_P1_P3_PRE_RS		0xc0
+#define QPHY_V4_PCS_PCIE_PRESET_P4_P5_PRE_RS		0xc4
+#define QPHY_V4_PCS_PCIE_PRESET_P6_P9_PRE_RS		0xc8
+#define QPHY_V4_PCS_PCIE_PRESET_P0_P1_POST		0xcc
+#define QPHY_V4_PCS_PCIE_PRESET_P2_P3_POST		0xd0
+#define QPHY_V4_PCS_PCIE_PRESET_P4_P5_POST		0xd4
+#define QPHY_V4_PCS_PCIE_PRESET_P6_P7_POST		0xd8
+#define QPHY_V4_PCS_PCIE_PRESET_P8_P9_POST		0xdc
 #define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
+#define QPHY_V4_PCS_PCIE_PRESET_P1_P3_POST_RS		0xe4
+#define QPHY_V4_PCS_PCIE_PRESET_P4_P5_POST_RS		0xe8
+#define QPHY_V4_PCS_PCIE_PRESET_P6_P9_POST_RS		0xec
+#define QPHY_V4_PCS_PCIE_RXEQEVAL_TIME			0xf0
 
 #endif
-- 
2.35.1

