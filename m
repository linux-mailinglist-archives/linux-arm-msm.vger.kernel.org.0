Return-Path: <linux-arm-msm+bounces-38115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA319CFEA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 12:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 499EBB2ABA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3262A191F9B;
	Sat, 16 Nov 2024 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o89VX3P8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18EF28FF;
	Sat, 16 Nov 2024 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731757220; cv=none; b=reJcTpHmgnjylQ1IIY59fbfNIrHRrzr94mtOpAJDe0tSnBSQOSo6fIk2uFRd/owCfN+fV9JQOWFRU/Bwyw8bjV/0CItBfK2g092/5+eWrxlBWL8LAdMNLI4j4Fl2HlLp1NdzAbZ/S+CQtSjvkNk1RNATqmYuwVRPlPlswwMQCAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731757220; c=relaxed/simple;
	bh=60OKvHXhdre1WdESOhl4PN0wFXXZX9ys+VzQSc8Ckvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Et+VduYsGd6H1D9KOnhfggAoY9GDIInubqyE8woK8acV1pmP9E88Ei/BqBBMS0Exhg6dL0/ikPXj0a/Ofd8oGZqSwWe9f+zsYNaVfOmCPv3uIF8ED5PUlCHQQaFebkUdFW6x1GHq12aEwQLqFcM2wFQzLvOC9lJ5Kehz32PfhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o89VX3P8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACAEC4CEC3;
	Sat, 16 Nov 2024 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731757218;
	bh=60OKvHXhdre1WdESOhl4PN0wFXXZX9ys+VzQSc8Ckvo=;
	h=From:Date:Subject:To:Cc:From;
	b=o89VX3P8gIX/OLjjFWG7M8lFeQDKC8NDBK02ozvjc3IC8h80unwcsuRp2OT5VaNZy
	 dzR4byuw5+bBxkSnfP8pbCkA9tSgjdJ8BMTAe9N3W9ViBpXTm4GjPUD9iyaGv7bclq
	 R8UNZEzB8dm1ZydAHAw8qGP9MqM+Pb62jI6WUg/GEsrhpXV5QgmpqSRWGq6Dhpf9Lk
	 L3gD8ZXRSpi1pbgdbetLQqA1uqVm5I3wpLt4uGx45LGBTsX0m2p8NFvHD5S6ZQcl6U
	 LL8SAON+UhKpK+aVRY2i9IwDFlT688nGhQ3dYAYIyAg4iYz+LRs1UMsWRodEdQOK4t
	 eOtGXwUbLThVg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 16 Nov 2024 12:40:04 +0100
Subject: [PATCH] dt-bindings: remoteproc: Consolidate SC8180X and SM8150
 PAS files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-topic-sc8180x_rproc_bindings-v1-1-ae5d3f7ab261@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJOEOGcC/x3MwQqDMAwA0F+RnFdonBPZr4whTcxcLm1JxhDEf
 7d4fJe3g4upODy7HUz+6lpyA9464G/KqwRdmqGP/YCIY/iVqhycJ5ziNlu1wjNpXjSvHsZ7TOl
 BxAMRtKKafHS7+tf7OE7I4nw0bgAAAA==
X-Change-ID: 20241116-topic-sc8180x_rproc_bindings-630aa5bbc4bb
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731757214; l=4789;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Ote622R1lsChP50GYMobPReGO2KWFh19mtnf6zeHaqA=;
 b=1AkvhDBUkPfaYdiv0YYNTl8mHDbWivLaoVNs6UgnQxwHzvoLnX19T9ZEnk4BJ+8jaDMVLMmj6
 Oelh11NfvoRCE9e6elTcgBOv0uOFp1XZxdICEjqcAl/vbNAelp5aYsf
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SC8180X PAS bindings are plain wrong, resulting in false-positive
dt checker errors. SC8180X's remoteprocs happen to be identical to
SM8150's from the kernel point of view, so reuse that binding instead.

Fixes: 4865ed136045 ("dt-bindings: remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sc8180x-pas.yaml      | 96 ----------------------
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  7 ++
 2 files changed, 7 insertions(+), 96 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
deleted file mode 100644
index 45ee9fbe09664ac93ab697d73d84ea55127a219b..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
+++ /dev/null
@@ -1,96 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SC8180X Peripheral Authentication Service
-
-maintainers:
-  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-
-description:
-  Qualcomm SC8180X SoC Peripheral Authentication Service loads and boots
-  firmware on the Qualcomm DSP Hexagon cores.
-
-properties:
-  compatible:
-    enum:
-      - qcom,sc8180x-adsp-pas
-      - qcom,sc8180x-cdsp-pas
-      - qcom,sc8180x-mpss-pas
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: XO clock
-
-  clock-names:
-    items:
-      - const: xo
-
-  qcom,qmp:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: Reference to the AOSS side-channel message RAM.
-
-  smd-edge: false
-
-  memory-region:
-    maxItems: 1
-    description: Reference to the reserved-memory for the Hexagon core
-
-  firmware-name:
-    maxItems: 1
-    description: Firmware name for the Hexagon core
-
-required:
-  - compatible
-  - reg
-  - memory-region
-
-allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sc8180x-adsp-pas
-            - qcom,sc8180x-cdsp-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-    else:
-      properties:
-        interrupts:
-          minItems: 6
-        interrupt-names:
-          minItems: 6
-
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sc8180x-adsp-pas
-            - qcom,sc8180x-cdsp-pas
-    then:
-      properties:
-        power-domains:
-          items:
-            - description: LCX power domain
-            - description: LMX power domain
-        power-domain-names:
-          items:
-            - const: lcx
-            - const: lmx
-    else:
-      properties:
-        # TODO: incomplete
-        power-domains: false
-        power-domain-names: false
-
-unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index d67386c50fa4d6e4f9b844b36e17ffa1db613adb..56ff6386534ddfa76cd42d84569ddfcf847e9178 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -60,6 +60,9 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sc8180x-adsp-pas
+            - qcom,sc8180x-cdsp-pas
+            - qcom,sc8180x-slpi-pas
             - qcom,sm8150-adsp-pas
             - qcom,sm8150-cdsp-pas
             - qcom,sm8150-slpi-pas
@@ -83,6 +86,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sc8180x-adsp-pas
+            - qcom,sc8180x-cdsp-pas
             - qcom,sm8150-adsp-pas
             - qcom,sm8150-cdsp-pas
             - qcom,sm8250-cdsp-pas
@@ -99,6 +104,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sc8180x-mpss-pas
             - qcom,sm8150-mpss-pas
     then:
       properties:
@@ -115,6 +121,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sc8180x-slpi-pas
             - qcom,sm8150-slpi-pas
             - qcom,sm8250-adsp-pas
             - qcom,sm8250-slpi-pas

---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241116-topic-sc8180x_rproc_bindings-630aa5bbc4bb

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


