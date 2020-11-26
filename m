Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471E32C4F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 08:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388505AbgKZHYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 02:24:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:41954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388477AbgKZHYQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 02:24:16 -0500
Received: from localhost.localdomain (unknown [157.49.218.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F48B2068D;
        Thu, 26 Nov 2020 07:23:56 +0000 (UTC)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 5/6] dt-bindings: clock: Add GDSC in SDX55 GCC
Date:   Thu, 26 Nov 2020 12:51:45 +0530
Message-Id: <20201126072146.34842-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
References: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add GDSC instances in SDX55 GCC block.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sdx55.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-bindings/clock/qcom,gcc-sdx55.h
index c372451b3461..fb9a5942f793 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdx55.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
@@ -109,4 +109,9 @@
 #define GCC_USB3PHY_PHY_BCR					13
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
 
+/* GCC power domains */
+#define USB30_GDSC						0
+#define PCIE_GDSC						1
+#define EMAC_GDSC						2
+
 #endif
-- 
2.25.1

