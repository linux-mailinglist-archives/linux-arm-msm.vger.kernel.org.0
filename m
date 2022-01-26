Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B5C49D53D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 23:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbiAZWSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 17:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbiAZWSb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 17:18:31 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC316C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:27 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id i30so917188pfk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NhtQdk8q5SXLHFlgFWNWtWzRrPQhAgDGiyA1NEvtJBY=;
        b=IRiuLMMrE8xO54Vu13p08A8VB4kFWkxDqOEu1FN4kcp+ekdAwiyjMx8UsTQVPwmLv9
         LC8G5ACUfrvH4ZCYrqpazmQ41smLGtTQd+Omepssbi7dMq5u7BHeHirwQ9kQBpG7qQf2
         iL96AU1n/aF279rMySL3WvvfgJBgbXpjE6v+StBu68gBEzE7T1qn/soVWZ4GEq1RHQE/
         nVsu/J6jPImA7ZgMk33SPWktVP7FN8WB0tCj8iS8GmsoGZVjgYLn4qJwUpRhPLxh1oLI
         P+9JFTcoQrws0f4Tb2omsV45Gy9MsNdf8/+2+U+NLLugtppFF1lE2JUyfhlLm6q2DSI2
         pUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NhtQdk8q5SXLHFlgFWNWtWzRrPQhAgDGiyA1NEvtJBY=;
        b=d0jaubpkAPj4xEaSXDT6YCytd/+lOF3z/45d2PFQnheXSPAhZYerDsCcBZ3PVXTw3o
         dL4im9KRP91UHeh+TiCzLbeY0+O/gvTgzFK+6L9iB44Ff78Vw6e01lF5Qxe9C5PCgoMO
         t4jygLwcLrA6lPpXmp/pNtpW4trlMdifrN8W/78rIshcqHVVYbS6WoTDoa/mKePOJO3P
         FfCmF8jNG4rcpHZsbOJthmjjCxVqfwPtRSmltzVq2Y8ku8ItSkTPV8GQlcIJoHBUT7QO
         py8LQk8gCQErlL4TOnb65kanfoGJnv188hC7QpgJX9tNWT2zwLaGW42xjMfEtTjm42sI
         +p+A==
X-Gm-Message-State: AOAM5311BzSQQRVNlN3wt605uMWlpL0Mg2wlzxTvC2fAKrWwBtNDp1+4
        3rsOfwCrChu46LuOwuMlphGkM3ZPr+JuvoV5
X-Google-Smtp-Source: ABdhPJz8cLgbeLCgqEO2TeOrJz20u+wTYr0rpZGVy6QmetXqtrrN54C1KZWoXp2EX3pXFMm7dNrh+Q==
X-Received: by 2002:a63:d54:: with SMTP id 20mr717502pgn.442.1643235507283;
        Wed, 26 Jan 2022 14:18:27 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:26 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org
Subject: [PATCH 3/8] clk: qcom: gcc: Add PCIe, EMAC and UFS GDSCs for SM8150
Date:   Thu, 27 Jan 2022 03:47:20 +0530
Message-Id: <20220126221725.710167-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the PCIe, EMAC and UFS GDSC structures for
SM8150. The GDSC will allow the respective system to be
brought out of reset.

Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c               | 74 +++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  9 ++-
 2 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 245794485719..ada755ad55f7 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3448,22 +3448,67 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };
 
+static struct gdsc emac_gdsc = {
+	.gdscr = 0x6004,
+	.pd = {
+		.name = "emac_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc pcie_0_gdsc = {
+	.gdscr = 0x6b004,
+	.pd = {
+		.name = "pcie_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc pcie_1_gdsc = {
+	.gdscr = 0x8d004,
+	.pd = {
+		.name = "pcie_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ufs_card_gdsc = {
+	.gdscr = 0x75004,
+	.pd = {
+		.name = "ufs_card_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ufs_phy_gdsc = {
+	.gdscr = 0x77004,
+	.pd = {
+		.name = "ufs_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
 static struct gdsc usb30_prim_gdsc = {
-		.gdscr = 0xf004,
-		.pd = {
-			.name = "usb30_prim_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb30_sec_gdsc = {
-		.gdscr = 0x10004,
-		.pd = {
-			.name = "usb30_sec_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0x10004,
+	.pd = {
+		.name = "usb30_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *gcc_sm8150_clocks[] = {
@@ -3714,6 +3759,11 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
 };
 
 static struct gdsc *gcc_sm8150_gdscs[] = {
+	[EMAC_GDSC] = &emac_gdsc,
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[PCIE_1_GDSC] = &pcie_1_gdsc,
+	[UFS_CARD_GDSC] = &ufs_card_gdsc,
+	[UFS_PHY_GDSC] = &ufs_phy_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
 };
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
index 3e1a91876610..35d80ae411a0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -241,7 +241,12 @@
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR				28
 
 /* GCC GDSCRs */
-#define USB30_PRIM_GDSC                     4
-#define USB30_SEC_GDSC						5
+#define EMAC_GDSC						0
+#define PCIE_0_GDSC						1
+#define	PCIE_1_GDSC						2
+#define UFS_CARD_GDSC						3
+#define UFS_PHY_GDSC						4
+#define USB30_PRIM_GDSC						5
+#define USB30_SEC_GDSC						6
 
 #endif
-- 
2.34.1

