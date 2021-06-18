Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DCE3ACD64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 16:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhFROVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 10:21:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234469AbhFROVG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 10:21:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AB9E6120A;
        Fri, 18 Jun 2021 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624025937;
        bh=+Fh0ldymQFISgV5PqHN/8VE9z+BKB9DrGyd8hRYlQyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b7qp/NcZDhsMeF5ws43GgAKBY/CXprdCuBcle1uJYFDMOnpHh6ORDIILyMd9xRpZL
         +zt9ZwPMW/Zzlkdwh2Ki82oBBZWk6IYPpya1NgH9pgtUUcX5+AdZ1tutgozd0wKAof
         HZQ4p34r8YNW9QiPrOIGONNauajPbAXn89R1VN2PeEG5z0ND1d7X3cmRsIrTnomalG
         5IWDHrjPKlZaybeOFW/yZTbxnPgHm8zuWxIjDA5XppsEGxU8isPQeAbYsgtoF1l1A6
         p8ZjfIMFnVp6d3KJumIxr3aV/IzkN3uyALEpLJi4d1S5oVillbrHDiUiA2UK4Rsxbu
         GFBsao2PcnOkg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] soc: qcom: geni: move struct geni_wrapper to header
Date:   Fri, 18 Jun 2021 19:48:38 +0530
Message-Id: <20210618141839.3777270-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210618141839.3777270-1-vkoul@kernel.org>
References: <20210618141839.3777270-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SPI & I2C geni driver needs to access struct geni_wrapper, so move it to
header. The drivers needs this header to find the geni device and use it
in dma mapping.

Using this method works for both DT and ACPI systems

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 14 --------------
 include/linux/qcom-geni-se.h    | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index fe666ea0c487..08d645b90ed3 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -78,20 +78,6 @@
  */
 
 #define MAX_CLK_PERF_LEVEL 32
-#define NUM_AHB_CLKS 2
-
-/**
- * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
- * @dev:		Device pointer of the QUP wrapper core
- * @base:		Base address of this instance of QUP wrapper core
- * @ahb_clks:		Handle to the primary & secondary AHB clocks
- * @to_core:		Core ICC path
- */
-struct geni_wrapper {
-	struct device *dev;
-	void __iomem *base;
-	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
-};
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index 5114e2144b17..5fda675c5cfe 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -38,6 +38,20 @@ struct geni_icc_path {
 	unsigned int avg_bw;
 };
 
+#define NUM_AHB_CLKS 2
+
+/**
+ * @struct geni_wrapper - Data structure to represent the QUP Wrapper Core
+ * @dev:		Device pointer of the QUP wrapper core
+ * @base:		Base address of this instance of QUP wrapper core
+ * @ahb_clks:		Handle to the primary & secondary AHB clocks
+ */
+struct geni_wrapper {
+	struct device *dev;
+	void __iomem *base;
+	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
+};
+
 /**
  * struct geni_se - GENI Serial Engine
  * @base:		Base Address of the Serial Engine's register block
-- 
2.31.1

