Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD476C7598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCXCZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXCZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:23 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73777298CB
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z42so286820ljq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYtDfQWx10YO17Wnn1ggV4D8R2RJGN5uqiLMueHHXec=;
        b=J3Jl4mSgedwERrEmVpNgYAV9VCsALiC6fMl5WYv0iM5EtKafuS8ukW0r03qXWEjZig
         RYJZr7rUceQUVQeB9OZBeijOQp04E2EANXcKTSLvxYSLZ6l2kZiBDWKmJGVGGB0zkFHh
         4jO30CncCfuHNeganl96XbBmwmEE1qWpZAjNFadBJcMRdtDaegXxXr32fEH6d+Dto1LT
         fa3f2wCnF0YXgpBmUURZHweca6pgFD5PAGT1ZuKtMgvQZV28d8Vjhvmhky65wSaFRafw
         ymZCvIzWzzvwtzvUi0mjx6SpvPNULNt+g7rpkdRxaDnBn0hKvtDlNSMSmX/dBm1l2V9F
         EQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYtDfQWx10YO17Wnn1ggV4D8R2RJGN5uqiLMueHHXec=;
        b=Z4UihiqBvpz3+NZUq+GKk52LyTuNu4o4YauhvDUmiR/SjNt7FOlyl/MQUm7ayeAJGv
         aytPIosBp9NFGoZoqk04fSwC6+jI6aPYQrJYUuBIdqCqfsBl4aqGZ3z1WhKlm8NJMafF
         h2r2ib49oykLPq5TNOwgZdJpT2irHsKA5vhhOHxqDbpu8f260KpCTL8Rufk2T0Q5Qjjq
         OqXLfYiCQobVIxLByrfvouqBMdc7yRirQ8GBGUyJk9eN69A7l1R6r8b/30Eb1sqdaYBH
         W+WZnKEi2Vn4rstVd7TyVoGFfyf1ErjW+55vE2duK1OeyktAUVCzr35XAs0sZK3ZL71/
         azog==
X-Gm-Message-State: AAQBX9fn75PwCQloTjm2m9jh2gHUbLm4VLx0TMxbFLimYd2iAuDH7mBR
        nplm/rIMMOK7/QIWi0gDGsklyg==
X-Google-Smtp-Source: AKy350YdJ6dqlQlucGROPOEgXCKIMWwxg+ZMKqJ/8GKjjS9wXtybKPSwYHMqWAzeQ3peGMRYROdXnw==
X-Received: by 2002:a2e:b0c8:0:b0:298:8782:e5f with SMTP id g8-20020a2eb0c8000000b0029887820e5fmr289817ljl.43.1679624720837;
        Thu, 23 Mar 2023 19:25:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 05/41] phy: qcom-qmp-usb: make QPHY_PCS_MISC_CLAMP_ENABLE access conditional
Date:   Fri, 24 Mar 2023 05:24:38 +0300
Message-Id: <20230324022514.1800382-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index a49711c5a63d..269350687259 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -95,6 +95,7 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
+	QPHY_PCS_MISC_CLAMP_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -115,6 +116,16 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
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
@@ -126,6 +137,7 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	/* In PCS_USB */
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
 };
 
 static const unsigned int qmp_v5_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -1936,7 +1948,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v3_usb3phy_regs_layout,
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
 static void qmp_usb_configure_lane(void __iomem *base,
@@ -2198,8 +2210,8 @@ static void qmp_usb_enable_autonomous_mode(struct qmp_usb *qmp)
 	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
 
 	/* Enable i/o clamp_n for autonomous mode */
-	if (pcs_misc)
-		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+	if (pcs_misc && cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE])
+		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
 }
 
 static void qmp_usb_disable_autonomous_mode(struct qmp_usb *qmp)
@@ -2209,8 +2221,8 @@ static void qmp_usb_disable_autonomous_mode(struct qmp_usb *qmp)
 	void __iomem *pcs_misc = qmp->pcs_misc;
 
 	/* Disable i/o clamp_n on resume for normal mode */
-	if (pcs_misc)
-		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+	if (pcs_misc && cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE])
+		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
 
 	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
 		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
-- 
2.30.2

