Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411B02C4F56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 08:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388461AbgKZHXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 02:23:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:41616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727468AbgKZHXh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 02:23:37 -0500
Received: from localhost.localdomain (unknown [157.49.218.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF2D92075A;
        Thu, 26 Nov 2020 07:23:16 +0000 (UTC)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/6] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
Date:   Thu, 26 Nov 2020 12:51:43 +0530
Message-Id: <20201126072146.34842-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
References: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add compatible for SDX55 RPMHCC and DT include.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a46a3a799a70..a54930f111ba 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,sc7180-rpmh-clk
       - qcom,sdm845-rpmh-clk
+      - qcom,sdx55-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
 
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 2e6c54e65455..cd806eccb7dd 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -21,5 +21,6 @@
 #define RPMH_IPA_CLK				12
 #define RPMH_LN_BB_CLK1				13
 #define RPMH_LN_BB_CLK1_A			14
+#define RPMH_QPIC_CLK				15
 
 #endif
-- 
2.25.1

