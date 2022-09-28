Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E63055EE9FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234173AbiI1XKn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbiI1XKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8E94C61C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q17so15903575lji.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=a7EqG/1VYfnHhAxJfXc3Dru7bP2iZl5ghSTkhGzgxos=;
        b=lWNlIFMziG4oYKmPgbm1C+wmuIF9M1PXDOEfhKfxFV0Cm2/C6/wXmCQoGbfCQSaIhu
         eRe/yp+RAu4vHjSDfd168wNPnlxNStdxKTdxgusowy0DPPb/Ws3YnVpxtF+0UY4tRzdd
         kG+igkVgYumiI7FgoLnfAF2O/ROX9DdV9Rq0RLEL1WUWMQtbkQUTO2o9tFRMfzQ6reOG
         GxkBLUZqLygmloieBsHdZpfsoE6XLOOFSkNXp/rYSsVlqzpuO//4hpa+oFNLEGYAPayp
         8WE/j4+j1y1mD3MHWwysKk8OeqIdT1v3kGg94Z8lfIzZBCXF/7uqr0+hRTHXNr2Fg38g
         VRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=a7EqG/1VYfnHhAxJfXc3Dru7bP2iZl5ghSTkhGzgxos=;
        b=ABhmumy1xNgzC3AkV61FJAdMtD3d4wLJnnNiiFUVutzu2T4xxo/obdP33nxR0k/QLC
         tB6sYw9nGUePPA4dji67JKzid8vZFH/dQp2/tikpl1NQWNKl8dI5gj8WioyFRY1aimDw
         bI0GvGTB6+AYkCWrg0QCN6u42ZbGYEHtp7ipRr4wi+soVFBSxlM4BxCV7zevldmCZofp
         UWIUsPPvYOIIU8I/fvMUybMwWhaot6gu8NPYYPMpbKfxCKF1VDJkw9ti+MC85zF1/sUq
         wbPgLdlcJ1IiNC6U4D81ixu2G9Hiuad5CNAeqEtZr62ADpsmsuvMaFSKc8IX2tZHLpNA
         cITw==
X-Gm-Message-State: ACrzQf1sxRKkehetAYBv2Z6TkVv+pKP1NG8hAwzkEhQUKI3ve5n65xXo
        Lk2S+mA/wRK20XEzxUJnqKt9yQ==
X-Google-Smtp-Source: AMsMyM75yM+rQzz3RDnnBhWsmktro9/Vk1Zk65IuLrip/eTLsRBqz/7hL5cHjXSl9K47zUGkF9Vlvw==
X-Received: by 2002:a2e:9644:0:b0:26d:a785:f5ba with SMTP id z4-20020a2e9644000000b0026da785f5bamr61693ljh.364.1664406631600;
        Wed, 28 Sep 2022 16:10:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 17/18] phy: qcom-qmp-usb: rework regs layout arrays
Date:   Thu, 29 Sep 2022 02:10:13 +0300
Message-Id: <20220928231014.455201-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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

Use symbolic names for the values inside reg layout arrays. New register
names are added following the PCS register layout that is used by the
particular PHY.

Note: ipq8074 tables appear to use a mixture of v2 and v3 registers.
This might need additional fixes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 64cf43901d64..7cc53765b300 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -114,23 +114,23 @@ enum qphy_reg_layout {
 };
 
 static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
+	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
 };
 
 static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x44,
-	[QPHY_PCS_STATUS]		= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_POWER_DOWN_CONTROL,
 
 	/* In PCS_USB */
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x008,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x014,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
-- 
2.35.1

