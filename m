Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3C3221BF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 07:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgGPFdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 01:33:16 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:30429 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbgGPFdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 01:33:16 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jul 2020 22:33:15 -0700
Received: from kathirav-linux.qualcomm.com ([10.201.2.228])
  by ironmsg01-sd.qualcomm.com with ESMTP; 15 Jul 2020 22:33:09 -0700
Received: by kathirav-linux.qualcomm.com (Postfix, from userid 459349)
        id 81F512181E; Thu, 16 Jul 2020 11:03:07 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH] clk: qcom: ipq8074: Add correct index for PCIe clocks
Date:   Thu, 16 Jul 2020 11:02:50 +0530
Message-Id: <1594877570-9280-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCIe clocks GCC_PCIE0_AXI_S_BRIDGE_CLK, GCC_PCIE0_RCHNG_CLK_SRC,
GCC_PCIE0_RCHNG_CLK are wrongly added to the gcc reset group.

Move them to the gcc clock group.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
index e3e018565add..8e2bec1c91bf 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
@@ -230,6 +230,9 @@
 #define GCC_GP1_CLK				221
 #define GCC_GP2_CLK				222
 #define GCC_GP3_CLK				223
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK		224
+#define GCC_PCIE0_RCHNG_CLK_SRC			225
+#define GCC_PCIE0_RCHNG_CLK			226
 
 #define GCC_BLSP1_BCR				0
 #define GCC_BLSP1_QUP1_BCR			1
@@ -363,8 +366,5 @@
 #define GCC_PCIE1_AHB_ARES			129
 #define GCC_PCIE1_AXI_MASTER_STICKY_ARES	130
 #define GCC_PCIE0_AXI_SLAVE_STICKY_ARES		131
-#define GCC_PCIE0_AXI_S_BRIDGE_CLK		132
-#define GCC_PCIE0_RCHNG_CLK_SRC			133
-#define GCC_PCIE0_RCHNG_CLK			134
 
 #endif
-- 
2.7.4

