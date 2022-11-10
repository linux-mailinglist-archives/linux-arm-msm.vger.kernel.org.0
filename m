Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04408624A95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiKJTXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiKJTXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:23:00 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD67C45A35
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:58 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id b9so2070072ljr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9UNEaxniJOxIl+QL6sNoKeigaRuo2rRI7gSKa+ok2k=;
        b=o72ve42icHxLDj5FZwq+pKY/ukybh2Nu8l07aSzB+BUAoSOSAL426WT3GomtmXe/ny
         1GI2gafHQlG88aDv73/Aik1BP5J5q+mvN0KSMDmtazuxOA/uubGD8cXu1txuElZ33SgR
         NxwfBYRojMA3qSODkhBqw6hXbsdoPjIBfI6WJPhgdp/loGPjAyCFCdQ55ss/2vS4LB8e
         laVQeC/CJ9RWetpZsSIvCai1Gkk9Ios3ZVNPBpG/LEgfkbSCVLZ3dNblXdkGCiUbdjhL
         sJZzMpKJ4HRRmKBHIv6sqWAVaOv6es+/K4NA9g2NsbzaPGO/unIxeSpN43pmt6d77mOX
         qQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9UNEaxniJOxIl+QL6sNoKeigaRuo2rRI7gSKa+ok2k=;
        b=dLuACVT/QEBJx3TCNi105eDv4PgIqMfKU4SevkVnkcXdSZPpfuZbTT1shS5w47Vgyv
         XnykDsv14zsmkACapl5Gq6mv3WmQT9UXxpPapf7n2Ing9Ad+q7UI3MJLe/jFeddzbIhY
         j8dcW68uMUuGWWivsoXxKuK4YAlB6nWqRURvkz5cKexfVtmRzTMVT7hSMo/BpkxpHPTm
         ZLFgtsmAOfYcOGzQdOhiuO8AS4XWoPBl/hp65Xohw78uZVk+KEcEum4I/sy2uLQahHLe
         6rSO5SiObZGWIRZnzezqYN36ne9oN68WPlwsxvaRNv22ws93/7ltk1xOz7qrg26MtRIG
         iwzA==
X-Gm-Message-State: ACrzQf3movgPWMSzsCmenubR0ghTcKSxBak36H7IAMj0xQoZzPGI0yM+
        NyZHL3bUUtvHU91WnMO7cSH52Oei7bvSqA==
X-Google-Smtp-Source: AMsMyM5degi54WIP7HEpBXlWnCtt9i8SZcMzy3L8X1MChmcxnRhCILlYG+NheM4IBorsQA2JoRGzmA==
X-Received: by 2002:a2e:2e0a:0:b0:26d:cfc6:d6f7 with SMTP id u10-20020a2e2e0a000000b0026dcfc6d6f7mr9503834lju.34.1668108177276;
        Thu, 10 Nov 2022 11:22:57 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 12/13] phy: qcom-qmp-usb: fix regs layout arrays
Date:   Thu, 10 Nov 2022 22:22:47 +0300
Message-Id: <20221110192248.873973-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop qcm2290_usb3phy_regs_layout, it is a duplicate of
qmp_v3_usb3phy_regs_layout. Introduce qmp_v5_usb3phy_regs_layout to be
used for sm8350 and sc8280xp.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index aa6db5b679c0..74c04cb497f8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -127,13 +127,15 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 };
 
-static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
-	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
-	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
+static const unsigned int qmp_v5_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 };
 
 static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
@@ -1662,7 +1664,7 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v5_usb3phy_regs_layout,
 };
 
 static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
@@ -1878,7 +1880,7 @@ static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v5_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x300,
 
 	.has_pwrdn_delay	= true,
@@ -1904,7 +1906,7 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v5_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x1000,
 
 	.has_pwrdn_delay	= true,
@@ -1927,7 +1929,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qcm2290_usb3phy_regs_layout,
+	.regs			= qmp_v3_usb3phy_regs_layout,
 };
 
 static void qmp_usb_configure_lane(void __iomem *base,
-- 
2.35.1

