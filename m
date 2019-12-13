Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09B411DD3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 05:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731963AbfLMExm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 23:53:42 -0500
Received: from m228-5.mailgun.net ([159.135.228.5]:34635 "EHLO
        m228-5.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731911AbfLMExm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 23:53:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576212821; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=No4NrS8RZKo/+qzd4kS2FzUPDmPkdbcL6unu08f9QF0=; b=IDpjysbtP2e338ES0M5543G+ArlqrS8GuPkjT7LIxcP/ey/FO1YRTz1eZa4MXfiUGT2EfY9Q
 vI8/Z38nFsvpJdh4a4RuBH4NVYwxOFhQQUyF1QPC+raJS7CYlYX0LeSUwaQ6RS/sXldUwVkm
 Ce7uC9a58qE4XTvoK5+ew8LU7mk=
X-Mailgun-Sending-Ip: 159.135.228.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df31950.7f659ef9dd50-smtp-out-n02;
 Fri, 13 Dec 2019 04:53:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C9FE4C433CB; Fri, 13 Dec 2019 04:53:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88E18C43383;
        Fri, 13 Dec 2019 04:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88E18C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 1/3] dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
Date:   Fri, 13 Dec 2019 10:23:18 +0530
Message-Id: <0b095b65496073a2ddf9de120f7809619b42cd1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert QCOM watchdog timer bindings to DT schema format using
json-schema.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
 .../bindings/watchdog/qcom-wdt.yaml           | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
deleted file mode 100644
index 41aeaa2ff0f8..000000000000
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Qualcomm Krait Processor Sub-system (KPSS) Watchdog
----------------------------------------------------
-
-Required properties :
-- compatible : shall contain only one of the following:
-
-			"qcom,kpss-wdt-msm8960"
-			"qcom,kpss-wdt-apq8064"
-			"qcom,kpss-wdt-ipq8064"
-			"qcom,kpss-wdt-ipq4019"
-			"qcom,kpss-timer"
-			"qcom,scss-timer"
-			"qcom,kpss-wdt"
-
-- reg : shall contain base register location and length
-- clocks : shall contain the input clock
-
-Optional properties :
-- timeout-sec : shall contain the default watchdog timeout in seconds,
-                if unset, the default timeout is 30 seconds
-
-Example:
-	watchdog@208a038 {
-		compatible = "qcom,kpss-wdt-ipq8064";
-		reg = <0x0208a038 0x40>;
-		clocks = <&sleep_clk>;
-		timeout-sec = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
new file mode 100644
index 000000000000..4a42f4261322
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,kpss-timer
+      - const: qcom,kpss-wdt
+      - const: qcom,kpss-wdt-apq8064
+      - const: qcom,kpss-wdt-ipq4019
+      - const: qcom,kpss-wdt-ipq8064
+      - const: qcom,kpss-wdt-msm8960
+      - const: qcom,scss-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  timeout-sec:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Contains the watchdog timeout in seconds. If unset, the
+      default timeout is 30 seconds.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    watchdog@208a038 {
+      compatible = "qcom,kpss-wdt-ipq8064";
+      reg = <0x0208a038 0x40>;
+      clocks = <&sleep_clk>;
+      timeout-sec = <10>;
+    };
---

I have added Andy as the maintainer here since the get_maintainer script
showed him. If he is not happy, then I can change it to Bjorn probably and
again if he is not happy ;-) then I will add myself or whoever they suggest.

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
