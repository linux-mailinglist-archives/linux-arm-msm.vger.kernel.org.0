Return-Path: <linux-arm-msm+bounces-61165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CB1AD80AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 03:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3C01E2FDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8823C1E7C18;
	Fri, 13 Jun 2025 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/iEYGIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BEF1DFD86;
	Fri, 13 Jun 2025 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779723; cv=none; b=LteK6WA7Lxo07Hcoy9z2yY91dAB2OeU6dB7fEkoN6w/o50jWFXU+OtSoVxV5075KR0mXrQvRRdJLl6kbkIlM75PcfJ1F/86yMHwjY3qwcOxdNucPOvUNHaoPyQ6Qm5Sf6PZ+XhziU2XdfslBfAhTupFdjJ+iD3iG4hNotvC/2VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779723; c=relaxed/simple;
	bh=w9+uhG8mukFv3LUxt/Camybk60EdgO3KKFcvGpshaz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP7YqNziT5XYVobsYMN0br8ocIQzJ3kka1eTJ5ppIWQs0XbN7klT00cWdnHY/Li7T+IhJesma8KatXobPX4bmi8401Y+e+EYfbQlhj0ca701Opgpx3cfB086SysONJ7t8EoqpfzPTJaemftt7VMQJkGuRlSz2LqcB6EcEgyyr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/iEYGIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD62DC4CEF0;
	Fri, 13 Jun 2025 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749779723;
	bh=w9+uhG8mukFv3LUxt/Camybk60EdgO3KKFcvGpshaz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P/iEYGIapK6CORVhx0aBzk4QJQljMwwpVF4iWrUH7B14Bwxic4YBKR//yM4pBLk4i
	 jW6Ov/HxAPmMbewZtk5AuVpbmvnYrPxOY3khiMe1mb5gC/UAzyXj0Jc3wUnx8ROILF
	 VYbVnZ8oRaj2X0em9dBUfMSpwHKh0+jXo6XExersUPeFLz3tnZp6CWuklY9aLZLgcS
	 27yoYrinXUSXdO+W3wMaDw6Odr8rMMqkrn4BfscZVhYI6OqmW5Pfk5R6aEyb2AWb86
	 L9EYGnof7OnX7V+YEHs6xWSg1nyfj0XXMSSpVj7d+hL0WdsU733GfhPrq7+/hcnppD
	 xInu61qEJXX8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C0DC71148;
	Fri, 13 Jun 2025 01:55:22 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 13 Jun 2025 05:55:07 +0400
Subject: [PATCH RESEND net-next v5 1/2] dt-bindings: net: qca,ar803x: Add
 IPQ5018 Internal GE PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-ipq5018-ge-phy-v5-1-9af06e34ea6b@outlook.com>
References: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
In-Reply-To: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749779719; l=2960;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=MSreklj9uhNRgsWlk9VY//Ue1TwD7d3ZsG5R6DaH9lo=;
 b=kVQ8JntaLhMiRoj//SVbfu2GsOyZi18OCEamIWjZA5JsVyeYZ8fVi6oMLMNnUX19H+Y7gaWpm
 l3cJY01QEajAT9EuDjDupBQ/UqFAIiV748uTU7r7K2VFIoGn1jxDag7
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

The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
802.3az EEE.

For operation, the LDO controller found in the IPQ5018 SoC for which
there is provision in the mdio-4019 driver.

Two common archictures across IPQ5018 boards are:
1. IPQ5018 PHY --> MDI --> RJ45 connector
2. IPQ5018 PHY --> MDI --> External PHY
In a phy to phy architecture, the DAC needs to be configured to
accommodate for the short cable length. As such, add an optional boolean
property so the driver sets preset DAC register values accordingly.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/net/qca,ar803x.yaml        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 3acd09f0da863137f8a05e435a1fd28a536c2acd..7ae5110e7aa2cc97498a0ec46b67d8ed8440f3f2 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -16,8 +16,37 @@ description: |
 
 allOf:
   - $ref: ethernet-phy.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ethernet-phy-id004d.d0c0
+
+    then:
+      properties:
+        reg:
+          const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC
+
+        resets:
+          items:
+            - description:
+                GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.
+
+        qcom,dac-preset-short-cable:
+          description:
+            Set if this phy is connected to another phy to adjust the values for
+            MDAC and EDAC to adjust amplitude, bias current settings, and error
+            detection and correction algorithm to accommodate for short cable length.
+            If not set, DAC values are not modified and it is assumed the MDI output pins
+            of this PHY are directly connected to an RJ45 connector.
+          type: boolean
 
 properties:
+  compatible:
+    enum:
+      - ethernet-phy-id004d.d0c0
+
   qca,clk-out-frequency:
     description: Clock output frequency in Hertz.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -132,3 +161,17 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ge_phy: ethernet-phy@7 {
+            compatible = "ethernet-phy-id004d.d0c0";
+            reg = <7>;
+
+            resets = <&gcc GCC_GEPHY_MISC_ARES>;
+        };
+    };

-- 
2.49.0



