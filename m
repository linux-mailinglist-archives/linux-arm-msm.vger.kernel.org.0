Return-Path: <linux-arm-msm+bounces-63136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC3AEEAE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 01:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E536F3E05B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 23:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E992E7198;
	Mon, 30 Jun 2025 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4yxuYQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4378F39;
	Mon, 30 Jun 2025 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325982; cv=none; b=tLiu/BUEVjeKuwC6wQoepQeK4JryPKYiMERLA1a1dWn0yGYlnKPA1Vipqp582/ieiiRKoU6BiSdYTcIOYcMoVQZEBfQq+WxRMtsIhZKVda+k48ih8gHvglvIBwRhBaRoG6Xx7Xbf2le4kZAcSDAQJGKFmfoMYwsdleQtabc2YlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325982; c=relaxed/simple;
	bh=8o/Sf9HN1QFa7M7TAq4jD8YhW/o+EnAaa7zlra7A08c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MgKf9G0LR7fKLk7ocfzib2QxeA/MjG1uVzmuj7WSHl3IIrB7+QfMuPCDr+pQ8rON0gFOiWL4VzC4UMHVoaYJmGtKKACTEHpo6+Q66edoTG988UDgNMOsHYdNDA2sfwuTRZBanXeaRBFoBeM21MS6N7HgQX8dbqQ/MupwKypycXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4yxuYQc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9074C4CEE3;
	Mon, 30 Jun 2025 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751325982;
	bh=8o/Sf9HN1QFa7M7TAq4jD8YhW/o+EnAaa7zlra7A08c=;
	h=From:To:Cc:Subject:Date:From;
	b=u4yxuYQcz5lz9Wxfh+0+f/STB/P3dimYz0/7RTH0KT+kVed9F6VYYtlIttKOVw8Hn
	 HwFopOXA4E30VfaRErHkzjsIg378cAJMUYPFGqTK0JD4c25BhQhzba1S30JsST927R
	 t2rZ4fujNyAe7fE++UAGrJDcyvmmPBylMrPP4y/Z0ZO1ZtHxfJs9Jm8Hjoi9D89JHR
	 4QFonkmuTl5pn+3wzwG9xjFmsJ/vlp5rMvYLjAr94Y5MPI6AKmiDK95giTIfGA3clF
	 znTABfdzXxPObmVSTpJurafCbX9eRk7z2idWGcyvxF0Qtrsxdzn2BBUw84Rmi3K12g
	 yZ/Ki3iqTi8/Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert qcom,krait-cc to DT schema
Date: Mon, 30 Jun 2025 18:26:16 -0500
Message-ID: <20250630232617.3699954-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/qcom,krait-cc.txt          | 34 ---------------
 .../bindings/clock/qcom,krait-cc.yaml         | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,krait-cc.txt b/Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
deleted file mode 100644
index 030ba60dab08..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Krait Clock Controller
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-			"qcom,krait-cc-v1"
-			"qcom,krait-cc-v2"
-
-- #clock-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 1
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the clock parents of hfpll, secondary muxes.
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb".
-
-Example:
-
-	kraitcc: clock-controller {
-		compatible = "qcom,krait-cc-v1";
-		clocks = <&hfpll0>, <&hfpll1>, <&acpu0_aux>, <&acpu1_aux>, <qsb>;
-		clock-names = "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb";
-		#clock-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml b/Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml
new file mode 100644
index 000000000000..a53e929d2a1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,krait-cc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Krait Clock Controller
+
+maintainers:
+  - Stephen Boyd <sboyd@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,krait-cc-v1
+      - qcom,krait-cc-v2
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: Parent clock phandle for hfpll0
+      - description: Parent clock phandle for hfpll1
+      - description: Parent clock phandle for acpu0_aux
+      - description: Parent clock phandle for acpu1_aux
+      - description: Parent clock phandle for qsb
+
+  clock-names:
+    items:
+      - const: hfpll0
+      - const: hfpll1
+      - const: acpu0_aux
+      - const: acpu1_aux
+      - const: qsb
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
-- 
2.47.2


