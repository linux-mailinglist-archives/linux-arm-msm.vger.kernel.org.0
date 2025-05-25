Return-Path: <linux-arm-msm+bounces-59343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4FAC360E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213EF3B4210
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E9225C837;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgX9reo1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11624A058;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195768; cv=none; b=CWRQiyi7Fknk/TJ81gSDQSLJGZPGLdwxvyomAamCaMINAPo9eQhTWB9sayh5dkgTbSj1rdiliOwLquoDAiI12yzGPBubh5ezb7JBqAlEiTpABHeV77vW/Zdh4zp8ywMccWhq68aVI3Pxh2I1vO007g+XphIEjjxrPfDe7uK86Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195768; c=relaxed/simple;
	bh=PgQd1WmItZOq2615uJLVmRncCuiX7cIc+Tm0tdKHp2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDMw2efctdJ2X8kM97hQFw+5RB1NcW1I9jhGnHOIWM+QDIZwQpTGaqS5l7CISGxPqfDQJuLc4sySXUy8UdCNwdpa6HIeysbBfWotwMFE14/My/6uHNR9f1HvWqXE5eSxbfertI6fCJUCE1E+uqGOMWqO6bKy5HjnhQlrJmSeK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgX9reo1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CAE4C4CEEF;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195768;
	bh=PgQd1WmItZOq2615uJLVmRncCuiX7cIc+Tm0tdKHp2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lgX9reo1HYSJFPN/qSxBu13wKB1wrVcpcqec2FRHKvZ3wn915OrwjGLGav6EgwEqV
	 0BfDT0avqordh2DcrfG9yAAwjiICipUuqvleXe6OaNxWyocLZLP1iTAlSppQzZeoyW
	 f6PJe9d9D9b7YVGzdrS5amAzRYzz4C+6m9ybccnUtLs+CHYaeassk40ahzzTjHJ6Df
	 DHXpjQNPVktIFNK029SrV72hrM++4B/r8Ztx74q2mOOvz4dDmdFzGF99X24p4136+R
	 a3EqmgyYYfEx5PCTd6utMOiV/EcLlEVAujAqRshAFTmsKwdlxSlCRtA7Fa2TU02gCB
	 cegayybgv2Fmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC8BC54FB3;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 25 May 2025 21:56:04 +0400
Subject: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748195765; l=2331;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=ayUL3wYd9rvR/ur2nGKYm+iV8WIysnk8OxJFKcrz/ig=;
 b=Aekb7yvWZ5o9Vu+/YejmG2dcGjSGGiy0sUVTXRtXoAARJBX9e0Yh53Df5khsfiuiuTzfUWXMp
 7UerUABr5A2AgqMJGulb8w/DKe1Rhx1gyp/R1pqYNddLikeBxoT0d9b
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
SoC. Its output pins provide an MDI interface to either an external
switch in a PHY to PHY link scenario or is directly attached to an RJ45
connector.

In a phy to phy architecture, DAC values need to be set to accommodate
for the short cable length. As such, add an optional property to do so.

In addition, the LDO controller found in the IPQ5018 SoC needs to be
enabled to driver low voltages to the CMN Ethernet Block (CMN BLK) which
the GE PHY depends on. The LDO must be enabled in TCSR by writing to a
specific register. So, adding a property that takes a phandle to the
TCSR node and the register offset.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/net/qca,ar803x.yaml        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 3acd09f0da863137f8a05e435a1fd28a536c2acd..a9e94666ff0af107db4f358b144bf8644c6597e8 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -60,6 +60,29 @@ properties:
     minimum: 1
     maximum: 255
 
+  qca,dac:
+    description:
+      Values for MDAC and EDAC to adjust amplitude, bias current settings,
+      and error detection and correction algorithm. Only set in a PHY to PHY
+      link architecture to accommodate for short cable length.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - items:
+          - description: value for MDAC. Expected 0x10, if set
+          - description: value for EDAC. Expected 0x10, if set
+      - maxItems: 1
+
+  qca,eth-ldo-enable:
+    description:
+      Register in TCSR to enable the LDO controller to supply
+      low voltages to the common ethernet block (CMN BLK).
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of TCSR syscon
+          - description: offset of TCSR register to enable the LDO controller
+      - maxItems: 1
+
   vddio-supply:
     description: |
       RGMII I/O voltage regulator (see regulator/regulator.yaml).

-- 
2.49.0



