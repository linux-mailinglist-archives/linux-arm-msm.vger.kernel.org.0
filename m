Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6404F1A884D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 20:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503270AbgDNSCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 14:02:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:58880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503197AbgDNSBc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 14:01:32 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70FB92076C;
        Tue, 14 Apr 2020 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586887292;
        bh=UTBAO5piq1/s3nB033VauXWhFRTLMI4S3acdrACpLhI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Bu9QOgm3zDfw4ZsRNfjVLMKZW+kzcs/2+0SmCGfqDF83Z2mkhCwE77fAHIS9P2VI6
         ocV/iTUZim+XOMagzfjBR1L4ko3xTsrHLz8jifUwWFo+Epe4GxcXy7zfMJnAPVAJHW
         8XL1a/daiTh9Gr1vroAFFIOpt3Fe2k10ckYkygsc=
Date:   Tue, 14 Apr 2020 19:01:29 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: Document bindings for max77826" to the regulator tree
In-Reply-To:  <20200414172250.2363235-3-iskren.chernev@gmail.com>
Message-Id:  <applied-20200414172250.2363235-3-iskren.chernev@gmail.com>
X-Patchwork-Hint: ignore
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: Document bindings for max77826

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 78f022d08006b4a641351ec74aef9b084ad50964 Mon Sep 17 00:00:00 2001
From: Iskren Chernev <iskren.chernev@gmail.com>
Date: Tue, 14 Apr 2020 20:22:49 +0300
Subject: [PATCH] regulator: Document bindings for max77826

Add device tree binding information for max77826 regulator driver.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Link: https://lore.kernel.org/r/20200414172250.2363235-3-iskren.chernev@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/maxim,max77826.yaml    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
new file mode 100644
index 000000000000..d4f0f958385a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max77826.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77826 PMIC
+
+maintainers:
+  - Iskren Chernev <iskren.chernev@gmail.com>
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]{1,2}"
+  compatible:
+    enum:
+      - maxim,max77826
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    allOf:
+      - $ref: regulator.yaml#
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts LDO[1-15], BUCK and BUCKBOOST
+
+    patternProperties:
+      "^LDO([1-9]|1[0-5])$":
+        type: object
+        allOf:
+          - $ref: regulator.yaml#
+
+      "^BUCK|BUCKBOOST$":
+        type: object
+        allOf:
+          - $ref: regulator.yaml#
+
+      additionalProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@69 {
+            compatible = "maxim,max77826";
+            reg = <0x69>;
+
+            regulators {
+                LDO2 {
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3587500>;
+                };
+            };
+       };
+     };
+...
-- 
2.20.1

