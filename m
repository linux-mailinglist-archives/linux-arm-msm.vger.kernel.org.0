Return-Path: <linux-arm-msm+bounces-60728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0237AD309E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7932916CF94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7584D280CE7;
	Tue, 10 Jun 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6XOO5JL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6527FB35;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544687; cv=none; b=XvdsrHBtBSkpV0I7GtICxUSCw+UNWZHWHYgxQzflH/s5E0L6BQfAeOeq5Yaqzc2PuqCnaOskmXKsJG80f8/BuEMv7cHIpar9wJcsmUoIvvs2bj7MstN4HUuXtYZp5fs+f7FDzx0lzKlN06a72gorIeZsLC89ZxhiuY9fnjk+mnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544687; c=relaxed/simple;
	bh=w9+uhG8mukFv3LUxt/Camybk60EdgO3KKFcvGpshaz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHv5AsYqM0zl+SYBGWohRhyypwGtDhuosMw7jnRte/JSgb8Bhjn1cmDP3mDmRPy27jsFxLdiuYcCFE+MWX5fngfGX9NeH6Jzp31BOKebiDWiJzj2GI9YtTEJfVs5YeL6qmVemoM5WfYF745u4PzyO4BImNql0EV4KQQo18bBXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6XOO5JL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A21C0C4CEF0;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749544686;
	bh=w9+uhG8mukFv3LUxt/Camybk60EdgO3KKFcvGpshaz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q6XOO5JLgAc5J7fGCjxS636vtasYi3TaxN6Z1oXeWMjw32pEirFdljFUVHY9BjD9J
	 XU2GtiCFIiVuAH8H6BSWYo2IonyRLETqd8aUj9i8yKkeSlh8Mzg8w+EPxA09sEEH3S
	 E9uQ5ufyB76wvMBlNB+8biWEi2XZjRxVb923sOS4bpI5oC5CkvYCbkb60HATvSmLP1
	 epy2eyf2TXxEm3CF8b0odB2KhzXHN/pLZhLdc97iFKaW18JtlAvXLLPUhpYgalltWz
	 L9/W1beybLTEsc2ih+8HyHhtlDqOW5YZQSiCYtTaKmkBDBhyYkxn20HCXkB7Z2/LaC
	 krlMOvdNZ1Ymg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9249AC5B543;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 10 Jun 2025 12:37:56 +0400
Subject: [PATCH v5 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-ipq5018-ge-phy-v5-2-daa9694bdbd1@outlook.com>
References: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
In-Reply-To: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749544683; l=2960;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=MSreklj9uhNRgsWlk9VY//Ue1TwD7d3ZsG5R6DaH9lo=;
 b=9IY8hBnqBK66IfR9ksjn9U/xrjA039Q0Su+/dBpWDHfG6NYfIGjc6/C+NfvBtBumkrpq7/rBm
 GofmxHJ+vHsDXR51n31vDlKGIGWv7KzOwUx+UvR9osDICyLpngYcYvk
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



