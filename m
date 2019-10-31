Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB59EB015
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 13:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfJaMWB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 08:22:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38658 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 08:22:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B03A960D51; Thu, 31 Oct 2019 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524520;
        bh=7HRerb7h7vfw1Mr/nGP7WdqPq832QH2zCz5LpuSLfnk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LUopUAz0vLM9agCucCgaZHqImOTv5OrznFyCftu2t8MmbyzTI7COQxarTdgryhjXt
         euQksAQfnjzZvgyVbhDyOmWvPudFtoxx6CCM1kqeDU+xj3vvJGcUQuB3Ro+rUqh4vl
         0KlQU8iG0fYydCRLbVYY2ekXBGmLDN501Alk8/uU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB42C60D37;
        Thu, 31 Oct 2019 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524519;
        bh=7HRerb7h7vfw1Mr/nGP7WdqPq832QH2zCz5LpuSLfnk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jRHcE92imjy+2pXXHx2pjBQSvV4PNKBJ8dKzBpTU/9JtvyCezMFN0s8m8hFpaj5NW
         mlxRAPzrRbSyY0r/jx5/IHwcpRamhb44stxx1+MnHgrXGFIKRzGzX2XUuss/Djg95+
         wo9zxfCXoFPcr8BcrdqNYoEYs0d018gmRdn7nuDM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB42C60D37
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 5/7] dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock bindings
Date:   Thu, 31 Oct 2019 17:51:11 +0530
Message-Id: <1572524473-19344-6-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The VIDEOCC clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,videocc.txt     | 18 -------
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 61 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.txt b/Documentation/devicetree/bindings/clock/qcom,videocc.txt
deleted file mode 100644
index 8a8622c..0000000
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Qualcomm Video Clock & Reset Controller Binding
------------------------------------------------
-
-Required properties :
-- compatible : shall contain "qcom,sdm845-videocc"
-- reg : shall contain base register location and length
-- #clock-cells : from common clock binding, shall contain 1.
-- #power-domain-cells : from generic power domain binding, shall contain 1.
-- #reset-cells : from common reset binding, shall contain 1.
-
-Example:
-	videocc: clock-controller@ab00000 {
-		compatible = "qcom,sdm845-videocc";
-		reg = <0xab00000 0x10000>;
-		#clock-cells = <1>;
-		#power-domain-cells = <1>;
-		#reset-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
new file mode 100644
index 0000000..fc3fcca
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller Binding
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm video clock control module which supports the clocks, resets and
+  power domains.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdm845-videocc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xo
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+examples:
+  # Example of VIDEOCC with clock node properties for SDM845:
+  - |
+    clock-controller@ab00000 {
+      compatible = "qcom,sdm845-videocc";
+      reg = <0xab00000 0x10000>;
+      clocks = <&rpmhcc 0>;
+      clock-names = "xo";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+     };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

