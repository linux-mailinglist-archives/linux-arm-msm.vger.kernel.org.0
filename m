Return-Path: <linux-arm-msm+bounces-25404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EE928F52
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 00:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9E61F2429C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 22:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528E5144D11;
	Fri,  5 Jul 2024 22:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="yeT9dNlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8713A26F;
	Fri,  5 Jul 2024 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720218310; cv=none; b=O+fFfxSyN7X0rnphR1a5zR/oOeYowNENjhXtBnYYEdkYFRJUXguvyKxGpSvPw+JJi5RGnRIBNSb90Ne8TvYbP7Dv6MjsT2IIa74davP5v94VJakgcD4Tdftnri0jSchcTEpLpqbSatcRC7rLav994PioM7TSJu6S5YuFm+XRIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720218310; c=relaxed/simple;
	bh=d1yZIouSBqqxapBWs13uhJKBC/eMQZms7oI5ikpU1pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYQLuf2firSX1Wir5MT4bdu/iRRX48aKCRVx22ORqMTQ160+ONzG453x4Ge/ZfWP5ytbBJcRMOC3KtvqXRr1OR5KcKRNY3/H0fuJJGr4+cy/hh6dPfDCJb/fY6FdXuoOPNjHwhVPGYVCqnA3vQXROUDUW1EkJ2Dwgg5T6m8fyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=yeT9dNlH; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.attlocal.net (76-224-187-148.lightspeed.sntcca.sbcglobal.net [76.224.187.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 89CEC161864;
	Sat,  6 Jul 2024 00:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1720217753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/5iA57uBQQ3o9hvM8vAkCuG7sA783V6Sv/iGfXjUAyM=;
	b=yeT9dNlHqmtzsP6g0TztmDKwksy6uvd5oO7DFqUtbZY6ldSORIr3sTKKuVzSeduKrHBeq2
	8AJ1vY5sp022hjIx18+aKU6sXD8qAKLtq6JS/9zqz5nBww3Nfnta8YtvzLiPrz5Y6f07yE
	Qg1wYsP+eEhgm9CgfkoXi4xexKvCess=
From: David Heidelberg <david@ixit.cz>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7] dt-bindings: iommu: Convert msm,iommu-v0 to yaml
Date: Fri,  5 Jul 2024 15:14:54 -0700
Message-ID: <20240705221520.109540-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Qualcomm IOMMU v0 implementation to yaml format.

iommus part being ommited for the other bindings, as mdp4 one.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
v7:
 - change maintainer to myself
 - define NCB range (thx @Rob)
v6:
 - clean iommu-cells description (thx @Robin)
v5:
 - updated example (thx @Konrad)
 - ordering of requirements + dropped > and | and reformatted (thx @Konrad)
v4:
 - renamed to qcom,apq8064-iommu as Rob requested
 - changed title to Qualcomm APQ8064 IOMMU
 - dropped quotes around URLs
 - dropped mdp node
 - dropped unused mdp_port0 label

v3:
 - I kept the name as -v0, since we have other binding -v1 and it look
   good, I can change thou in v4 if requested.
 - dropped non-existent smmu_clk part (and adjusted example, which was
   using it)
 - dropped iommu description
 - moved iommu-cells description to the property #iommu-cells

v2:
 - fix wrong path in binding $id
 - comment qcom,mdp4 node example (we don't want to validate it yet)
Signed-off-by: David Heidelberg <david@ixit.cz>

 .../bindings/iommu/msm,iommu-v0.txt           | 64 ---------------
 .../bindings/iommu/qcom,apq8064-iommu.yaml    | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/msm,iommu-v0.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml

diff --git ./Documentation/devicetree/bindings/iommu/msm,iommu-v0.txt ./Documentation/devicetree/bindings/iommu/msm,iommu-v0.txt
deleted file mode 100644
index 20236385f26e..000000000000
--- ./Documentation/devicetree/bindings/iommu/msm,iommu-v0.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* QCOM IOMMU
-
-The MSM IOMMU is an implementation compatible with the ARM VMSA short
-descriptor page tables. It provides address translation for bus masters outside
-of the CPU, each connected to the IOMMU through a port called micro-TLB.
-
-Required Properties:
-
-  - compatible: Must contain "qcom,apq8064-iommu".
-  - reg: Base address and size of the IOMMU registers.
-  - interrupts: Specifiers for the MMU fault interrupts. For instances that
-    support secure mode two interrupts must be specified, for non-secure and
-    secure mode, in that order. For instances that don't support secure mode a
-    single interrupt must be specified.
-  - #iommu-cells: The number of cells needed to specify the stream id. This
-		  is always 1.
-  - qcom,ncb:	  The total number of context banks in the IOMMU.
-  - clocks	: List of clocks to be used during SMMU register access. See
-		  Documentation/devicetree/bindings/clock/clock-bindings.txt
-		  for information about the format. For each clock specified
-		  here, there must be a corresponding entry in clock-names
-		  (see below).
-
-  - clock-names	: List of clock names corresponding to the clocks specified in
-		  the "clocks" property (above).
-		  Should be "smmu_pclk" for specifying the interface clock
-		  required for iommu's register accesses.
-		  Should be "smmu_clk" for specifying the functional clock
-		  required by iommu for bus accesses.
-
-Each bus master connected to an IOMMU must reference the IOMMU in its device
-node with the following property:
-
-  - iommus: A reference to the IOMMU in multiple cells. The first cell is a
-	    phandle to the IOMMU and the second cell is the stream id.
-	    A single master device can be connected to more than one iommu
-	    and multiple contexts in each of the iommu. So multiple entries
-	    are required to list all the iommus and the stream ids that the
-	    master is connected to.
-
-Example: mdp iommu and its bus master
-
-                mdp_port0: iommu@7500000 {
-			compatible = "qcom,apq8064-iommu";
-			#iommu-cells = <1>;
-			clock-names =
-			    "smmu_pclk",
-			    "smmu_clk";
-			clocks =
-			    <&mmcc SMMU_AHB_CLK>,
-			    <&mmcc MDP_AXI_CLK>;
-			reg = <0x07500000 0x100000>;
-			interrupts =
-			    <GIC_SPI 63 0>,
-			    <GIC_SPI 64 0>;
-			qcom,ncb = <2>;
-		};
-
-		mdp: qcom,mdp@5100000 {
-			compatible = "qcom,mdp";
-			...
-			iommus = <&mdp_port0 0
-				  &mdp_port0 2>;
-		};
diff --git ./Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml ./Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
new file mode 100644
index 000000000000..9f83f851e61a
--- /dev/null
+++ ./Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/iommu/qcom,apq8064-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APQ8064 IOMMU
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+description:
+  The MSM IOMMU is an implementation compatible with the ARM VMSA short
+  descriptor page tables. It provides address translation for bus masters
+  outside of the CPU, each connected to the IOMMU through a port called micro-TLB.
+
+properties:
+  compatible:
+    const: qcom,apq8064-iommu
+
+  clocks:
+    items:
+      - description: interface clock for register accesses
+      - description: functional clock for bus accesses
+
+  clock-names:
+    items:
+      - const: smmu_pclk
+      - const: iommu_clk
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Specifiers for the MMU fault interrupts.
+    minItems: 1
+    items:
+      - description: non-secure mode interrupt
+      - description: secure mode interrupt (for instances which supports it)
+
+  "#iommu-cells":
+    const: 1
+    description: Each IOMMU specifier describes a single Stream ID.
+
+  qcom,ncb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The total number of context banks in the IOMMU.
+    minimum: 1
+    maximum: 4
+
+required:
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - qcom,ncb
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    iommu@7500000 {
+            compatible = "qcom,apq8064-iommu";
+            reg = <0x07500000 0x100000>;
+            interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk SMMU_AHB_CLK>,
+                     <&clk MDP_AXI_CLK>;
+            clock-names = "smmu_pclk",
+                          "iommu_clk";
+            #iommu-cells = <1>;
+            qcom,ncb = <2>;
+    };
-- 
2.45.2


