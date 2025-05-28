Return-Path: <linux-arm-msm+bounces-59706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD4AC6C11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92213B8C7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407D828B3F3;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhXEuso1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAFB1C5485;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443552; cv=none; b=WjQ8oyXPmcdjmisUvVS7WfBKW0Fi2vzsbo8WClfkPifVati9rLrLJRluA1sra3GgxNhXD5BLETl0QmN+FcWzeFbx4/RGBsMEp8UFl26rHO3OJYB8d9Of47IcbQNHgw/GDdgDZCi7FfjZzur4cvwMge8Vm4NJrOJfSJF8t7976lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443552; c=relaxed/simple;
	bh=5pMjgztKFg6Bo3bS0LIzfpMDgWFo5t3faxUx133uLyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bltFRWVzzVDueKrf8N71I5GG/apgDIY2D9wDjG6wHywOqj4Weo1KfVU4MtBgiK53qcusDSZGuNPQztvQYJNxzRqL9M6PyyLx3/aqOk8fBuY7q4mu8ZaQCWIjntWTEp4Y0OEIvtljpzTDtrQn3WfBklrWmcBxSeOvXq73CxflvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhXEuso1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E718C4CEED;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443551;
	bh=5pMjgztKFg6Bo3bS0LIzfpMDgWFo5t3faxUx133uLyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PhXEuso1uBib7KZOBvQ5Y2w2bZqEYGg64LV0+kmO4Ts0in1b1KiyUdgB/2/jxxAU7
	 bThl9Ap7di5zzQy5CDwkN4APnOalu8ZlZoIVme9dPxjL+cFWZ8wnny2ohMr4Ms7RG+
	 7jBZScUGkwCmRDo7szamrQf57vkZXQp1jNXpgfggNilHSQKkkMOwTdE90709Qd5mRZ
	 FQ3VBA2qQc/uNWzmb7pdCUOw5ZKfrDNxhTGpkZGKNc1vvzUKs8E2sp8Uc+SDng66lP
	 KcadRqtDyD1KCzGSb/MlMUrie25vPusI16qWbhd/PyTk944IwmbIZRCX/2mhKBt4IO
	 dCZfW0aBmBvHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C868C5AD49;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 28 May 2025 18:45:48 +0400
Subject: [PATCH v2 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com>
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748443549; l=3491;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=P7wjTTsDWLxWFS7rhrkYINOQIR4qqqVUnnCYcf/iIyE=;
 b=YDiV2+Np/ub7nIMfml1CMK3k00v32bjdZk0DkA+kEO4xd8+B98bc0gPkH4YDPmDwV0YLmK3rV
 2+4k2SIyP5HCdVcmHkiGZyu/xNMB4FBXV3X08FuX579lCTpvfafeuL+
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
there is provision in the mdio-4019 driver. In addition, the PHY needs
to take itself out of reset and enable the RX and TX clocks.

Two common archictures across IPQ5018 boards are:
1. IPQ5018 PHY --> MDI --> RJ45 connector
2. IPQ5018 PHY --> MDI --> External PHY
In a phy to phy architecture, DAC values need to be set to accommodate
for the short cable length. As such, add an optional boolean property so
the driver sets the correct register values for the DAC accordingly.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/net/qca,ar803x.yaml        | 52 +++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 3acd09f0da863137f8a05e435a1fd28a536c2acd..de0c26f59babf0b7020d7a1d54229005822d5472 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -14,10 +14,41 @@ maintainers:
 description: |
   Bindings for Qualcomm Atheros AR803x PHYs
 
-allOf:
+oneOf:
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
+        clocks:
+          items:
+            - description: RX clock
+            - description: TX clock
+        resets:
+          items:
+            - description:
+                GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.
+        qcom,dac-preset-short-cable:
+          description:
+            Set if this phy is connected to another phy to adjust the values for
+            MDAC and EDAC to adjust amplitude, bias current settings, and error
+            detection and correction algorithm to accommodate for short cable length.
+            If not set, it is assumed the MDI output pins of this PHY are directly
+            connected to an RJ45 connector and default DAC values will be used.
+          type: boolean
 
 properties:
+  compatible:
+    enum:
+      - ethernet-phy-id004d.d0c0
+
   qca,clk-out-frequency:
     description: Clock output frequency in Hertz.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -132,3 +163,22 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
+    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
+        ge_phy: ethernet-phy@7 {
+            compatible = "ethernet-phy-id004d.d0c0";
+            reg = <7>;
+
+            clocks = <&gcc GCC_GEPHY_RX_CLK>,
+                     <&gcc GCC_GEPHY_TX_CLK>;
+
+            resets = <&gcc GCC_GEPHY_MISC_ARES>;
+        };
+    };

-- 
2.49.0



