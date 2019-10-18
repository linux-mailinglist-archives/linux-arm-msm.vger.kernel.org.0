Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E01DC22B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 12:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407966AbfJRKJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 06:09:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42998 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404942AbfJRKJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 06:09:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6E55960FF2; Fri, 18 Oct 2019 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571393389;
        bh=/0Dz44/ipdspQz9Z0mNW1xzHnho4Ca6WcBeVW8rWPJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S/GYhgOfFFnLTZvmaHqPXERTwwrRuBL0jlsjQJD8r07ai70JBQkQrqAD4mg6ASOpw
         er0/J3HJGXwooGpUuEnUvmQUMWE8uzDgWQSmfgRqb7EVLPXk5scYWNvYMp8qlOUb7u
         pfqHCmndn0dsTTUtiUvkLKzuRYzroBi/hssU2O5E=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77BDD60FF2;
        Fri, 18 Oct 2019 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571393386;
        bh=/0Dz44/ipdspQz9Z0mNW1xzHnho4Ca6WcBeVW8rWPJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mPuNxUkW/lUT83sNBlGMJnd3ASaAScnXD5PArI5tY/SQQgmgWFP4/A8LedvIl9XPx
         RNYz591gXsx3mJ9JPZmuHUQrhLTR53+ZJT8PgnsFZWhF9/AwwkQf6cKLVlTNldc6B9
         OEp4zifC2kufB7o7SwrNTx6A0OYoF6jajKxjnFBo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77BDD60FF2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM RPMHCC clock bindings
Date:   Fri, 18 Oct 2019 15:39:22 +0530
Message-Id: <1571393364-32697-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571393364-32697-1-git-send-email-tdas@codeaurora.org>
References: <1571393364-32697-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RPMHCC clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,rpmh-clk.txt    | 27 ------------
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 49 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
deleted file mode 100644
index 365bbde..0000000
--- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Qualcomm Technologies, Inc. RPMh Clocks
--------------------------------------------------------
-
-Resource Power Manager Hardened (RPMh) manages shared resources on
-some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
-other hardware subsystems via RSC to control clocks.
-
-Required properties :
-- compatible : must be one of:
-	       "qcom,sdm845-rpmh-clk"
-	       "qcom,sm8150-rpmh-clk"
-
-- #clock-cells : must contain 1
-- clocks: a list of phandles and clock-specifier pairs,
-	  one for each entry in clock-names.
-- clock-names: Parent board clock: "xo".
-
-Example :
-
-#include <dt-bindings/clock/qcom,rpmh.h>
-
-	&apps_rsc {
-		rpmhcc: clock-controller {
-			compatible = "qcom,sdm845-rpmh-clk";
-			#clock-cells = <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
new file mode 100644
index 0000000..326bfd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,rpmhcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. RPMh Clocks Bindings
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Resource Power Manager Hardened (RPMh) manages shared resources on
+  some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
+  other hardware subsystems via RSC to control clocks.
+
+properties:
+  compatible :
+    enum:
+       - qcom,sdm845-rpmh-clk
+       - qcom,sm8150-rpmh-clk
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+    items:
+      - const: xo
+
+  '#clock-cells':
+      const: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+
+examples:
+  # Example for GCC for SDM845: The below node should be defined inside
+  # &apps_rsc node.
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    rpmhcc: clock-controller {
+      compatible = "qcom,sdm845-rpmh-clk";
+      clocks = <&xo_board>;
+      clock-names = "xo";
+      #clock-cells = <1>;
+    };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

