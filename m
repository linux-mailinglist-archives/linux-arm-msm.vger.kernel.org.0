Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8DF787A29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243506AbjHXVUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243473AbjHXVUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7B11BDF
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:19:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ffa01fc987so1592068e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911997; x=1693516797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7mOGTx5+h4i0NdOspjuoR2EZoV3NOPl1+DrGOJBMv8=;
        b=qLuIYON7kk1Wj2SPSg/jJy3l2vC3R0pj3A/nxqIjDIvoNBjyeH46lPVBsdRaDs4m/o
         WrnX0/udPBqVMGxX8LGTyICQT1ejoj1+9efVjwlbYUP4use1NMLN8dZ8peNwPvn3G6Fx
         dSX7UZZH486vUFCkca5YFgc7egAhYIm3k9svOP3H2xIyw51PLnM6l82i4Idm0oWln9sv
         yIOv6Eov6RTfMINCHAGJtZ5uINh0s4DiTFgRmhn4eM9KpNgylu46g15vePC4+TyaGIFm
         bX2Dc6w24o9cCAEt5TtwB0yA6Uh1ES9ojtP5GpAYUQoYLecJ8nEm7j97YfO6gcclA/54
         EN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911997; x=1693516797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7mOGTx5+h4i0NdOspjuoR2EZoV3NOPl1+DrGOJBMv8=;
        b=PtnZ8jlcp+PWl5rrYog9Sf9w07ag6fleauOMvcGpQaNuTXeO+04HjdDCsL0JvAuBTr
         PnsnV3swakNF6W4Vx5lt1UTgyqrAnptNdeZ/bUxmCDWjLJMOD/AJtA2d6RGpQXnPnjet
         xasp4P59Z5x5WHjV9pGkmlL4h5+t29ueefw3paqhbfjVlkxKxWnSFrYs1n/LjGeWuJlw
         U2UxvNXog/gJ6CusPSOiRRIsMq9+TMvKwVoQosR+URyTImjO23RzbpN6f4OTdnhnVwz1
         avSGfgSzF6lJUkhugSN3ycC88BS78ZM9jRIyayFiQUwRG5Kie97XIE5IVYIalAOTw8+W
         Tafg==
X-Gm-Message-State: AOJu0YwOgNw2eyEIycQMzTujBwcANVVvgFCJb5sxvWGlgWLyuSReT0FV
        ghKeJIm6W7qdQIZKkrwHNHDeOw==
X-Google-Smtp-Source: AGHT+IFRuQrwJgRDifaO6K4IPZdHUqV/YZ4NaVNPEDSTQxpBSMkDUHFsqFap7AYt/6DQEPcRiWHYCA==
X-Received: by 2002:a05:6512:1294:b0:4f9:6adf:3981 with SMTP id u20-20020a056512129400b004f96adf3981mr6904271lfs.33.1692911997635;
        Thu, 24 Aug 2023 14:19:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:19:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 04/16] phy: qcom-qmp-usb: make QPHY_PCS_MISC_CLAMP_ENABLE access conditional
Date:   Fri, 25 Aug 2023 00:19:40 +0300
Message-Id: <20230824211952.1397699-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The register QPHY_V[34]_PCS_MISC_CLAMP_ENABLE is present only on some
SoC families. Other platforms (qcm2290) can have PCS_MISC region, but do
not have this register. Add it to the register layout table and check
that it is defined before toggling CLAMP settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 8f43de20fb8c..411cf0ae148d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -94,6 +94,7 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
+	QPHY_PCS_MISC_CLAMP_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -114,6 +115,16 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
+	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
+};
+
+static const unsigned int qmp_v3_usb3phy_regs_layout_qcm2290[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -125,6 +136,7 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	/* In PCS_USB */
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
 };
 
 static const unsigned int qmp_v5_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -1523,7 +1535,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v3_usb3phy_regs_layout,
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
 static void qmp_usb_configure_lane(void __iomem *base,
@@ -1761,8 +1773,8 @@ static void qmp_usb_enable_autonomous_mode(struct qmp_usb *qmp)
 	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
 
 	/* Enable i/o clamp_n for autonomous mode */
-	if (pcs_misc)
-		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+	if (pcs_misc && cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE])
+		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
 }
 
 static void qmp_usb_disable_autonomous_mode(struct qmp_usb *qmp)
@@ -1772,8 +1784,8 @@ static void qmp_usb_disable_autonomous_mode(struct qmp_usb *qmp)
 	void __iomem *pcs_misc = qmp->pcs_misc;
 
 	/* Disable i/o clamp_n on resume for normal mode */
-	if (pcs_misc)
-		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+	if (pcs_misc && cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE])
+		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
 
 	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
 		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
-- 
2.39.2

