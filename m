Return-Path: <linux-arm-msm+bounces-24173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4139173DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEA011C211F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 21:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D7517F4F1;
	Tue, 25 Jun 2024 21:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qa1EKwMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37217E8EC;
	Tue, 25 Jun 2024 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719352572; cv=none; b=EDVlxe6apCZK+T7xrlTN7RytsOa3NqXMA3xGsHa1rSdg7mNCGeMZRwHdCd22uG5GrL4+kBesG43RNLxdPmPZ3OIWLB/MqOEHX3cBBr5313ADN10dNJliy5UfWAxvL+hrU/2x3T15P9R9oxIC8KWqZHYrJVA+/+IEN0xHrMlsDN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719352572; c=relaxed/simple;
	bh=K11oj0mpuiJIpnSwm951vDCz0rxmDAGitZS/Kht8+BI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S701NPLOgKRXX2TgwGqPps4VBar4xnO51JMeSrdgtve/PledlzyrkgH2ut91YJ/n6/Gox12wUZFVRksoygwCbJytzAvsKDeEKnCl1caIn2QXWD3f67oWXzzMUZK6yoqEBiIL6rQCeJT1uKVx42fllG52Q45mtyb791L1LVZbk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qa1EKwMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2FEC32781;
	Tue, 25 Jun 2024 21:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719352571;
	bh=K11oj0mpuiJIpnSwm951vDCz0rxmDAGitZS/Kht8+BI=;
	h=From:To:Cc:Subject:Date:From;
	b=qa1EKwMJcV/aUJojPxmYqAbh2FsUSFrsVTAGePBLcNRsVgU6LOmgyD4/sUPB0nXX/
	 kSVZAQTdoZlRL7O0SOSayMt+FYQXENyZABcqPkkX05YJRsYBVPxZVme7CGcSisP0zI
	 oiaZHsGiztbVzbbtEF4eN/uGl//4QJjUgJiahuNDCKVg8mez7WBudax3owXTUtOlSw
	 F8AB/TtNqQMqY/XzZzkM0MRUI6zUCbHR/ma+HbkkkLzc1yhu4y5OvC06cwuVeedDJP
	 jLzIIFhR8lFrmIvR/1bcXrl8tOvgglPIeh+ZiAjWpleMny0ipv/77yds55NlH9ka5s
	 HpfFk8QvXbX8Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: qcom,nandc: Define properties at top-level
Date: Tue, 25 Jun 2024 15:56:05 -0600
Message-ID: <20240625215605.192260-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convention is DT schemas should define all properties at the top-level
and not inside of if/then schemas. That minimizes the if/then schemas
and is more future proof.

There were 2 "if" schemas for "qcom,ipq806x-nand" and the
"qcom,boot-partitions: true" unnecessary, so the conditional schemas
can be simplified a bit.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 38 +++++++------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 4ada60fbf81d..35b4206ea918 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -31,6 +31,18 @@ properties:
       - const: core
       - const: aon
 
+  qcom,cmd-crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Must contain the ADM command type CRCI block instance number specified for
+      the NAND controller on the given platform
+
+  qcom,data-crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Must contain the ADM data type CRCI block instance number specified for
+      the NAND controller on the given platform
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
@@ -83,18 +95,6 @@ allOf:
           items:
             - const: rxtx
 
-        qcom,cmd-crci:
-          $ref: /schemas/types.yaml#/definitions/uint32
-          description:
-            Must contain the ADM command type CRCI block instance number
-            specified for the NAND controller on the given platform
-
-        qcom,data-crci:
-          $ref: /schemas/types.yaml#/definitions/uint32
-          description:
-            Must contain the ADM data type CRCI block instance number
-            specified for the NAND controller on the given platform
-
   - if:
       properties:
         compatible:
@@ -119,19 +119,9 @@ allOf:
             - const: rx
             - const: cmd
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq806x-nand
+        qcom,cmd-crci: false
+        qcom,data-crci: false
 
-    then:
-      patternProperties:
-        "^nand@[a-f0-9]$":
-          properties:
-            qcom,boot-partitions: true
-    else:
       patternProperties:
         "^nand@[a-f0-9]$":
           properties:
-- 
2.43.0


