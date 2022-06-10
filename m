Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F22A546D07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350461AbiFJTKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350473AbiFJTKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:13 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C46EDF7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:11 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id d18so141746ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=27r7fm24HH5e9SqiJoIarL14kYY0+23g/ojTmHV1I9U=;
        b=YX95DABx5s7kCy6eYkbvTnZifQAs1b9MyGFy9dTIVS6UhUZly//IQnpAHf7mQHQmcg
         Op6ShO3pgbbpxgvYFTA+82E22nlH3Fr3SLNrPziEYiTHqQ0rm7Cj2rFK3CnbuSUg7hwz
         6DZ7Br940TNYPMEK/3WPhvI8Q22+sL71RblhTFh/ZsOVqnTJCZffFUE1Voa1G/pJhPhQ
         vamXxjBg9HWnTqY56FGaDPro0p8HBx2JLjvW5Ph93GoZ4uEBjpqdgpN0b0/Vj/Vcx0vh
         ZBZ0/Rvo84l84wwfEfLFT+W2FHswnPgv+4ZFRGNmV/uRRo8MjIndTravcv1ks4XcDBrZ
         NlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=27r7fm24HH5e9SqiJoIarL14kYY0+23g/ojTmHV1I9U=;
        b=RNqEDrchcTbsFCVPC9AhjMn98z1glAMnvV5pM9Vf9XYYnggDEpMHP7hNuSW8xPT4Mt
         IZvdnbIF/fB+jQuZDP7XVqKpPzjcqrIz4Gpfyv17qd37yeRE5FAKLV6DJ8dPp6QtEZju
         YXkqEhYZlaTBW8BM4HLZwUlNAUWq3Pasp9sLdMakxe1grfBy/F/iU/NVDwK+hcasPAS9
         MjJEopDLZasYpqi6SS7H9p8BhRQyFL5LtaQKV8SYwzcholK+kTczss3IBaz7nxZ7yhLM
         pmUx/TFWo6O+fcYbeh0c2os/1cNFR+yzn3tV/QEPuZE56P3RIaSj485vTqupOzgnX9ae
         2yfQ==
X-Gm-Message-State: AOAM530BSceMV+KATJEHrbholkfoC0pqdOVwzGclHw8XVKIlBKMEL0BI
        QpGtM3GtJ4HoBxRKmSiClqs0oK3x3lV9KVfw
X-Google-Smtp-Source: ABdhPJwYtS+cuot5KxiOKkBLufCMSJ77ATNWt18bYXRScQlZ43o9CSx3YXjD+YjYqhMl0I6dZNMOOA==
X-Received: by 2002:a05:651c:1506:b0:255:affc:33f2 with SMTP id e6-20020a05651c150600b00255affc33f2mr9908951ljf.265.1654888209575;
        Fri, 10 Jun 2022 12:10:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:10:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 25/28] phy: qcom-qmp: pcs-v3: add missing registers
Date:   Fri, 10 Jun 2022 22:09:22 +0300
Message-Id: <20220610190925.3670081-26-dmitry.baryshkov@linaro.org>
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
- msm-4.19's qcom,usb3-11nm-qmp-combo.h

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
index ac13f2989a73..10dbbb006201 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
@@ -7,7 +7,9 @@
 #define QCOM_PHY_QMP_PCS_V3_H_
 
 /* Only for QMP V3 PHY - PCS registers */
+#define QPHY_V3_PCS_SW_RESET				0x000
 #define QPHY_V3_PCS_POWER_DOWN_CONTROL			0x004
+#define QPHY_V3_PCS_START_CONTROL			0x008
 #define QPHY_V3_PCS_TXMGN_V0				0x00c
 #define QPHY_V3_PCS_TXMGN_V1				0x010
 #define QPHY_V3_PCS_TXMGN_V2				0x014
@@ -31,6 +33,7 @@
 #define QPHY_V3_PCS_RATE_SLEW_CNTRL			0x05c
 #define QPHY_V3_PCS_POWER_STATE_CONFIG1			0x060
 #define QPHY_V3_PCS_POWER_STATE_CONFIG2			0x064
+#define QPHY_V3_PCS_POWER_STATE_CONFIG3			0x068
 #define QPHY_V3_PCS_POWER_STATE_CONFIG4			0x06c
 #define QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L		0x070
 #define QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H		0x074
@@ -40,24 +43,103 @@
 #define QPHY_V3_PCS_LOCK_DETECT_CONFIG2			0x084
 #define QPHY_V3_PCS_LOCK_DETECT_CONFIG3			0x088
 #define QPHY_V3_PCS_TSYNC_RSYNC_TIME			0x08c
+#define QPHY_V3_PCS_SIGDET_LOW_2_IDLE_TIME		0x090
+#define QPHY_V3_PCS_BEACON_2_IDLE_TIME_L		0x094
+#define QPHY_V3_PCS_BEACON_2_IDLE_TIME_H		0x098
+#define QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_SYSCLK		0x09c
 #define QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x0a0
 #define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK		0x0a4
 #define QPHY_V3_PCS_PLL_LOCK_CHK_DLY_TIME		0x0a8
+#define QPHY_V3_PCS_LFPS_DET_HIGH_COUNT_VAL		0x0ac
 #define QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK		0x0b0
+#define QPHY_V3_PCS_LFPS_TX_END_CNT_P2U3_START		0x0b4
 #define QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME		0x0b8
 #define QPHY_V3_PCS_RXEQTRAINING_RUN_TIME		0x0bc
+#define QPHY_V3_PCS_TXONESZEROS_RUN_LENGTH		0x0c0
 #define QPHY_V3_PCS_FLL_CNTRL1				0x0c4
 #define QPHY_V3_PCS_FLL_CNTRL2				0x0c8
 #define QPHY_V3_PCS_FLL_CNT_VAL_L			0x0cc
 #define QPHY_V3_PCS_FLL_CNT_VAL_H_TOL			0x0d0
 #define QPHY_V3_PCS_FLL_MAN_CODE			0x0d4
+#define QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL		0x0d8
+#define QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR		0x0dc
+#define QPHY_V3_PCS_ARCVR_DTCT_EN_PERIOD		0x0e0
+#define QPHY_V3_PCS_ARCVR_DTCT_CM_DLY			0x0e4
+#define QPHY_V3_PCS_ALFPS_DEGLITCH_VAL			0x0e8
+#define QPHY_V3_PCS_INSIG_SW_CTRL1			0x0ec
+#define QPHY_V3_PCS_INSIG_SW_CTRL2			0x0f0
+#define QPHY_V3_PCS_INSIG_SW_CTRL3			0x0f4
+#define QPHY_V3_PCS_INSIG_MX_CTRL1			0x0f8
+#define QPHY_V3_PCS_INSIG_MX_CTRL2			0x0fc
+#define QPHY_V3_PCS_INSIG_MX_CTRL3			0x100
+#define QPHY_V3_PCS_OUTSIG_SW_CTRL1			0x104
+#define QPHY_V3_PCS_OUTSIG_MX_CTRL1			0x108
+#define QPHY_V3_PCS_CLK_DEBUG_BYPASS_CTRL		0x10c
+#define QPHY_V3_PCS_TEST_CONTROL			0x110
+#define QPHY_V3_PCS_TEST_CONTROL2			0x114
+#define QPHY_V3_PCS_TEST_CONTROL3			0x118
+#define QPHY_V3_PCS_TEST_CONTROL4			0x11c
+#define QPHY_V3_PCS_TEST_CONTROL5			0x120
+#define QPHY_V3_PCS_TEST_CONTROL6			0x124
+#define QPHY_V3_PCS_TEST_CONTROL7			0x128
+#define QPHY_V3_PCS_COM_RESET_CONTROL			0x12c
+#define QPHY_V3_PCS_BIST_CTRL				0x130
+#define QPHY_V3_PCS_PRBS_POLY0				0x134
+#define QPHY_V3_PCS_PRBS_POLY1				0x138
+#define QPHY_V3_PCS_PRBS_SEED0				0x13c
+#define QPHY_V3_PCS_PRBS_SEED1				0x140
+#define QPHY_V3_PCS_FIXED_PAT_CTRL			0x144
+#define QPHY_V3_PCS_FIXED_PAT0				0x148
+#define QPHY_V3_PCS_FIXED_PAT1				0x14c
+#define QPHY_V3_PCS_FIXED_PAT2				0x150
+#define QPHY_V3_PCS_FIXED_PAT3				0x154
+#define QPHY_V3_PCS_COM_CLK_SWITCH_CTRL			0x158
+#define QPHY_V3_PCS_ELECIDLE_DLY_SEL			0x15c
+#define QPHY_V3_PCS_SPARE1				0x160
+#define QPHY_V3_PCS_BIST_CHK_ERR_CNT_L_STATUS		0x164
+#define QPHY_V3_PCS_BIST_CHK_ERR_CNT_H_STATUS		0x168
+#define QPHY_V3_PCS_BIST_CHK_STATUS			0x16c
+#define QPHY_V3_PCS_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x170
+#define QPHY_V3_PCS_PCS_STATUS				0x174
+#define QPHY_V3_PCS_PCS_STATUS2				0x178
+#define QPHY_V3_PCS_PCS_STATUS3				0x17c
+#define QPHY_V3_PCS_COM_RESET_STATUS			0x180
+#define QPHY_V3_PCS_OSC_DTCT_STATUS			0x184
+#define QPHY_V3_PCS_REVISION_ID0			0x188
+#define QPHY_V3_PCS_REVISION_ID1			0x18c
+#define QPHY_V3_PCS_REVISION_ID2			0x190
+#define QPHY_V3_PCS_REVISION_ID3			0x194
+#define QPHY_V3_PCS_DEBUG_BUS_0_STATUS			0x198
+#define QPHY_V3_PCS_DEBUG_BUS_1_STATUS			0x19c
+#define QPHY_V3_PCS_DEBUG_BUS_2_STATUS			0x1a0
+#define QPHY_V3_PCS_DEBUG_BUS_3_STATUS			0x1a4
 #define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1a8
 #define QPHY_V3_PCS_OSC_DTCT_ACTIONS			0x1ac
 #define QPHY_V3_PCS_SIGDET_CNTRL			0x1b0
+#define QPHY_V3_PCS_IDAC_CAL_CNTRL			0x1b4
+#define QPHY_V3_PCS_CMN_ACK_OUT_SEL			0x1b8
+#define QPHY_V3_PCS_PLL_LOCK_CHK_DLY_TIME_SYSCLK	0x1bc
+#define QPHY_V3_PCS_AUTONOMOUS_MODE_STATUS		0x1c0
+#define QPHY_V3_PCS_ENDPOINT_REFCLK_CNTRL		0x1c4
+#define QPHY_V3_PCS_EPCLK_PRE_PLL_LOCK_DLY_SYSCLK	0x1c8
+#define QPHY_V3_PCS_EPCLK_PRE_PLL_LOCK_DLY_AUXCLK	0x1cc
+#define QPHY_V3_PCS_EPCLK_DLY_COUNT_VAL_L		0x1d0
+#define QPHY_V3_PCS_EPCLK_DLY_COUNT_VAL_H		0x1d4
 #define QPHY_V3_PCS_RX_SIGDET_LVL			0x1d8
 #define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
 #define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
+#define QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL2		0x1e4
+#define QPHY_V3_PCS_RXTERMINATION_DLY_SEL		0x1e8
+#define QPHY_V3_PCS_LFPS_PER_TIMER_VAL			0x1ec
+#define QPHY_V3_PCS_SIGDET_STARTUP_TIMER_VAL		0x1f0
+#define QPHY_V3_PCS_LOCK_DETECT_CONFIG4			0x1f4
+#define QPHY_V3_PCS_RX_SIGDET_DTCT_CNTRL		0x1f8
+#define QPHY_V3_PCS_PCS_STATUS4				0x1fc
+#define QPHY_V3_PCS_PCS_STATUS4_CLEAR			0x200
+#define QPHY_V3_PCS_DEC_ERROR_COUNT_STATUS		0x204
+#define QPHY_V3_PCS_COMMA_POS_STATUS			0x208
 #define QPHY_V3_PCS_REFGEN_REQ_CONFIG1			0x20c
 #define QPHY_V3_PCS_REFGEN_REQ_CONFIG2			0x210
+#define QPHY_V3_PCS_REFGEN_REQ_CONFIG3			0x214
 
 #endif
-- 
2.35.1

