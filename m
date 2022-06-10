Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795FF546D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350473AbiFJTKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350467AbiFJTKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:13 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5B721A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:11 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e4so154917ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MUejcEUBOlGy0+QEeY0SWSm0DJwBNAice3z2nR2K0iQ=;
        b=xMsL7t1PafQsJrvk7ePusx+RWVDKRd1/pNR8rYc7fx+OzthY0xWdH6sBjMHtyoW/Bw
         YB0ifpyA3prZxg0mGFNnE12boDNzgluUDuRf3Cow71c+sKlTPNaXqehX2Fx1gpFHuQbb
         mHmEDpXiTrP2ghgZAF+/26E6478sq6/bAsif/NGiQny9Sm5oJAJdd0w4HE2GYLrCVeNW
         gOyMu7fdig2jEOBhw1th5hMU3lDTOTkDUHGAkheBrUXtW7QfJ3HJ88DmgkfllarnYWq4
         tMrDfrbta6PKZdfN4vLiAGsKXXvbw3lBNuvqWxpE9snWg5J1t5fO5CQLn+njID69L7Ep
         wkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MUejcEUBOlGy0+QEeY0SWSm0DJwBNAice3z2nR2K0iQ=;
        b=jBu6IL1QcM1/QuhZ6bOqFg7YxMtSzkwTjPQfM5L0EpJpLb+SwF9+uJmATSKQbq0jKN
         G6WK/+uh9znEUI7iEoPX7nilapHm+jYm3bx+Z1buhNULDVskJ0HUTENQ01JVfsDTCK2M
         OflyW7YA6EGfTzPbKr6mxymNmA/VrBOIAuC5P4hUf6IgVBlIJ64Trw10KDzSKG2RL9OR
         2vKH3iceFdvV4rZi094l9UbsM3PD6u2jyFyfSJK1k/bOt7XBMT/Xo4bl4gBfspJt9drO
         Ky8/vvreH8qH+XGJOyb14FHsFnd0Hg6qMabt/gkmqAggfBcaw0WUdLcpSuSTCADN2a1H
         jKHw==
X-Gm-Message-State: AOAM531Vm31ea2YcQ4X180OLflM2WDUU09EYxk4ZVPROnIdnOo11O5hT
        e6/8V29xOu4P6Dkrivpl/CzAuA==
X-Google-Smtp-Source: ABdhPJygjKFTxDyKxnOzhsykwtb0KxMxOAZ9q6BnbTQeskIFS42cZQRBr7u7izFbY9F5SL003HDDuA==
X-Received: by 2002:a05:651c:1a13:b0:256:39d4:f630 with SMTP id by19-20020a05651c1a1300b0025639d4f630mr7056286ljb.84.1654888211385;
        Fri, 10 Jun 2022 12:10:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:10:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 26/28] phy: qcom-qmp: pcs-pcie-v4: add missing registers
Date:   Fri, 10 Jun 2022 22:09:23 +0300
Message-Id: <20220610190925.3670081-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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

