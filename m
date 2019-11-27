Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E9610B1F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 16:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfK0PNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 10:13:34 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:37917 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727146AbfK0PNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 10:13:34 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 20:43:26 +0530
IronPort-SDR: Mrr8pzJRttAqRBb6qEd/CjLW/5UMAD7dpEY1sqvKTamw65QKMh2vZrMgO6gx1VxqLgPKyjNmFv
 pzmU/mc3cJjWKcFtNxo+A1cryfEH32ZoqLJ8LlJ2PPHX0EtyaE4bUdEmdFQ/MD+xJsaWqEVzIl
 Jh0F9ha4T4Niu3EcklSGQeyKHnWl2k3melSjQL7xgF626bEcLcMRJJYYwk17tuzVmjgIXgbdHa
 f+EmADD2tJnfqXKzcYjsYIOkeOcXaa2dl2r+9bjckxYqulbhz+fu3AE6GF+Z2u55ihb9d61Jj3
 NTY8+LmQedw1Lp/rIxLPtx7n
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Nov 2019 20:42:58 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id F1BFD398A; Wed, 27 Nov 2019 20:42:55 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V3 06/10] dt-bindings: clock: qcom: Add reset for WCSSAON
Date:   Wed, 27 Nov 2019 20:42:50 +0530
Message-Id: <1574867574-2216-7-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
References: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
index 4de4811..04e1f57 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
@@ -362,5 +362,6 @@
 #define GCC_PCIE1_AXI_SLAVE_ARES		128
 #define GCC_PCIE1_AHB_ARES			129
 #define GCC_PCIE1_AXI_MASTER_STICKY_ARES	130
+#define GCC_WCSSAON_RESET			131
 
 #endif
-- 
1.9.1

