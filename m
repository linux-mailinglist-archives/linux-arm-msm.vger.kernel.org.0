Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D63A66A511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjAMVVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjAMVVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:21:07 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D6088DDC
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:06 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j17so34863412lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpyz2dI2IEWxtPn5OOZkau5aG7TwHghPb62KuzuT3OU=;
        b=PqMeNQKeM1Wd8enwt9bNqCoOzBGJiiN+Del6b8f7S/4Z+N72qacvgMiRiUWAj7mMmH
         uX5mLDbIYC2+eoSmEgDqAYpmtllkjChOVFvi4yL1IiO9PN5zXV3D7wyiDxLoAimLmXZX
         MXRQrkIQokGNq3uSbUUNV09nJMXLMM9cJ6lWw/usQcrhimIXLKB3gVo8Bmf7eAsRIYiq
         T2zm5NkW9Oc50KB/uR6IPJpsgxzyJBshfVltBlJ/VVNS69QGDWhf7Lq8tzLjVu0Bkrgj
         zxe0tVBAaQMS/fOluPjMDbZRTFNGC16u1sCqYB9c8wJ67bRrDKtGqDL/gT4r/QOHOIIQ
         JRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpyz2dI2IEWxtPn5OOZkau5aG7TwHghPb62KuzuT3OU=;
        b=ypgKV7vt4ZGfFum6rlcJWGmylDpZ9zEyjV9tTFlq4ynO+xKF8qygfrO+h3e0Vu3j1v
         VQlPRbKlIiFmuM+WsM0zaZ9g1BUM6Ps2fUITYDnE/Y6nEoaQGKBq2ZZlD0l6BEOmCJJf
         XgNw2i0temK7G4XyBDmADjZlBKYyfWYdjuyBmDnPbxcvLrqgcVmLzte7j4JCdCoaLisv
         WdYYcFdxoXAa4nQbS/p8FmSclgbENdkbvyBvWvrJIxQu2BR69beYqTLal0ACJ/F/LBSj
         SfsgT5tp0VTly1+TyEEqBpB6U+4r2PRraE5CM7jPs0zWGHR4IWhf789Wry6TT16I7Ygy
         7eSQ==
X-Gm-Message-State: AFqh2krcTyEUsMzp1gUwpjCWBvWSUGKJJ0+s9jkE5tX/S5zW8l0H4040
        ozjeyW3wIblkKKd73GuwGQiwfQ==
X-Google-Smtp-Source: AMrXdXsbuIaRUET/eHo42N9cM6jodSQvlXKjhMYJ+pU3c/InTbqAwHuB1ZBuEdCszUbOtS8xLeQ66g==
X-Received: by 2002:a05:6512:1688:b0:4ca:fa75:a64a with SMTP id bu8-20020a056512168800b004cafa75a64amr24280429lfb.0.1673644864594;
        Fri, 13 Jan 2023 13:21:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t24-20020ac25498000000b004d39af98b04sm80602lfk.19.2023.01.13.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:21:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 2/2] phy: qcom-qmp-combo: rework regs layout arrays
Date:   Fri, 13 Jan 2023 23:21:02 +0200
Message-Id: <20230113212102.421491-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113212102.421491-1-dmitry.baryshkov@linaro.org>
References: <20230113212102.421491-1-dmitry.baryshkov@linaro.org>
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
index ee35bcd2bdb5..1f022e580407 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -102,23 +102,23 @@ enum qphy_reg_layout {
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
2.39.0

