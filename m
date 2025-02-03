Return-Path: <linux-arm-msm+bounces-46825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1458A2659D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 22:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB3C1885E35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 21:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921482116F6;
	Mon,  3 Feb 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjOS3fBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556AF2116E6;
	Mon,  3 Feb 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618178; cv=none; b=cUV+0glG3Nd11C4kO+vqQZg4lqS/RplNYmYh0Ru0eZw/9Y7/gj8CRbuLkIWVj1vTlc6edMgfWYfIbIjKNo4oAH9Rheg6Xtwse9Ah/CHSqH/kYdxHncyVUFPKgVojoQw/fHCg71XxxBWGFjdlN3jJMjng/ZrkZsUcXRe8/C4ilWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618178; c=relaxed/simple;
	bh=RF8z5IkLWRWlkl8kiu4Ok3ly//aRtzCNoqKbBGSPoZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUG2ANQSIay2PStyR4LANFY8up6td0dPSW7EekTLJBysuBotQ2jHZt1pCGYH44m8yKJG6cKdJMtyWsRDqnJRas9DumGeRswJdNkO6N1CYPEyoO90armao11GGLi0jSTyYuMQYDVJySZbMoiM0QU+4Chc1LqH7TedRgXoRNw6jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjOS3fBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08E0C4CED2;
	Mon,  3 Feb 2025 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618178;
	bh=RF8z5IkLWRWlkl8kiu4Ok3ly//aRtzCNoqKbBGSPoZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sjOS3fBun6gJfTunSEIpUzeHTTH1z6nualUxXNGopDLxaNuLTyGD1PTwU7RqLk8Qz
	 y46xROZwOOXfauiUtxcGQ5wYu5IUpEt3Uh5uNCrtwabyAtVsg7ULXsGs409bHTOPof
	 goq3qqzEf3S9Hl9MuyC2hMK8iHGSRubR8GmI8JXQE9r9Pm7RZeqmp6rsXau/vQVwdm
	 H4n7ZF8F/gxIJXZejKAalPJYIy+/sAOd2399+iG83srbx+o9jKLA11UtlNRAoyKoF5
	 I/s/iGaFqFkwyEDzI0MgpvdCdGWA7kpIllSkbaeeaOMGHLPrm3LHpnGPfBTwaW1wmO
	 eCS4k1dHSUOYw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:15 -0600
Subject: [PATCH 3/4] dt-bindings: memory-controllers:
 samsung,exynos4210-srom: Split out child node properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-3-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev

In order to validate devices in child nodes, the device schemas need to
reference any child node properties. In order to do that, the properties
for child nodes need to be included in mc-peripheral-props.yaml.

"reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
how many reg entries they have.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/memory-controllers/exynos-srom.yaml   | 35 ----------------------
 .../memory-controllers/mc-peripheral-props.yaml    |  1 +
 .../samsung,exynos4210-srom-peripheral-props.yaml  | 35 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
index a5598ade399f..2267c5107d60 100644
--- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
@@ -39,49 +39,14 @@ patternProperties:
   "^.*@[0-3],[a-f0-9]+$":
     type: object
     additionalProperties: true
-    description:
-      The actual device nodes should be added as subnodes to the SROMc node.
-      These subnodes, in addition to regular device specification, should
-      contain the following properties, describing configuration
-      of the relevant SROM bank.
 
     properties:
-      reg:
-        description:
-          Bank number, base address (relative to start of the bank) and size
-          of the memory mapped for the device. Note that base address will be
-          typically 0 as this is the start of the bank.
-        maxItems: 1
-
       reg-io-width:
         enum: [1, 2]
         description:
           Data width in bytes (1 or 2). If omitted, default of 1 is used.
 
-      samsung,srom-page-mode:
-        description:
-          If page mode is set, 4 data page mode will be configured,
-          else normal (1 data) page mode will be set.
-        type: boolean
-
-      samsung,srom-timing:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 6
-        maxItems: 6
-        description: |
-          Array of 6 integers, specifying bank timings in the following order:
-          Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs.
-          Each value is specified in cycles and has the following meaning
-          and valid range:
-          Tacp: Page mode access cycle at Page mode (0 - 15)
-          Tcah: Address holding time after CSn (0 - 15)
-          Tcoh: Chip selection hold on OEn (0 - 15)
-          Tacc: Access cycle (0 - 31, the actual time is N + 1)
-          Tcos: Chip selection set-up before OEn (0 - 15)
-          Tacs: Address set-up before CSn (0 - 15)
-
     required:
-      - reg
       - samsung,srom-timing
 
 required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
index 11bc8a33d022..73a6dac946b7 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
@@ -37,6 +37,7 @@ allOf:
   - $ref: ingenic,nemc-peripherals.yaml#
   - $ref: intel,ixp4xx-expansion-peripheral-props.yaml#
   - $ref: qcom,ebi2-peripheral-props.yaml#
+  - $ref: samsung,exynos4210-srom-peripheral-props.yaml#
   - $ref: ti,gpmc-child.yaml#
   - $ref: fsl/fsl,imx-weim-peripherals.yaml
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos4210-srom-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos4210-srom-peripheral-props.yaml
new file mode 100644
index 000000000000..c474f90846e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos4210-srom-peripheral-props.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/samsung,exynos4210-srom-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Peripheral Properties for Samsung Exynos SoC SROM Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  samsung,srom-page-mode:
+    description:
+      If page mode is set, 4 data page mode will be configured,
+      else normal (1 data) page mode will be set.
+    type: boolean
+
+  samsung,srom-timing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+    description: |
+      Array of 6 integers, specifying bank timings in the following order:
+      Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs.
+      Each value is specified in cycles and has the following meaning
+      and valid range:
+      Tacp: Page mode access cycle at Page mode (0 - 15)
+      Tcah: Address holding time after CSn (0 - 15)
+      Tcoh: Chip selection hold on OEn (0 - 15)
+      Tacc: Access cycle (0 - 31, the actual time is N + 1)
+      Tcos: Chip selection set-up before OEn (0 - 15)
+      Tacs: Address set-up before CSn (0 - 15)
+
+additionalProperties: true

-- 
2.47.2


