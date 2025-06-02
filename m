Return-Path: <linux-arm-msm+bounces-60046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48FACAC10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 11:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 775307A9433
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3EC1E8855;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWer+feN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56321E3DFA;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858005; cv=none; b=Do4DS5ER7QQE2EUti4OrMJ9pKUWF5UZ3rv4QJg2SAQThoxW9dojiYMD5QvD35JN0YpGPgzIfpaIsTa+CalJK8ahm0TbKNSPjlYv5t2P5gu1a46y+VrHdc1LtgUjiI5h2qia5ESTP3oQjQmwR1ftLLoiOweTujJws+KriVmWnDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858005; c=relaxed/simple;
	bh=fVctS97OJmoSSqGiLs9Cd6dSp+7xO3b3gQPaAh6v7E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvtnFGXU8l0/oqik7gbwMcyM0ZVj7lCH5fDMHYvfn31hv2ws0quI4ULQgLIDx4lJwVi4LFXVkSn1zhelgPoQS/5kh0dTEBzzvPpERyoMhQWVKtOt32E3NG74xaRNO/AIx752+9ri8hWQyqllvpfxD5RbyuVPQYSxN1jtErx19bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWer+feN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 621B4C4AF0C;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858005;
	bh=fVctS97OJmoSSqGiLs9Cd6dSp+7xO3b3gQPaAh6v7E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UWer+feNx4d/j92SK3sDBs/6LKTsuy3GNIFGkqxb6/TPk/i3xzQP8Pf/Kbx26bRzA
	 haiTIhluTU1GGJzB4MgtMSFZ5cKP2JxDs+WKgitQSremWMJkpL5PTHtYiZDmTX5qv/
	 Jrv6u2cKcbvmEL3mJDgRaMP63L62xjUwWzm32UqV+M0GmUpFKQVgkFUS7VkHJQg/o4
	 djxJIv80ObWozQLOR10WrWAZu+rm4OKlq+FBlEGxEN6KcdK/DuRDHWBMT0Mc/V2gcn
	 /LairMF2fVlK15CqnJR46eUkxVl6NixkDUpbga4nHmJZFGcb1lTpGtCIgJmfd0DCFU
	 l6eO6kSxmmo7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528CCC5B559;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 02 Jun 2025 13:53:14 +0400
Subject: [PATCH v3 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ipq5018-ge-phy-v3-2-421337a031b2@outlook.com>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
In-Reply-To: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748858002; l=2979;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=I1imHb1fBZfRCiC+EjS8oo2zUnv/w8RwXOYxT/Ymdy8=;
 b=5MvFeNyKnfj8noeucwmXIfpOlLsooSsex0B8FFxDR6toKJzsESIfEqjuGvyFV4SRabwTc7GWi
 M5aRqphy7XJAqTEajzYXVRDRl3kbcPGYQt8EnY232PSN2XkZkwbAMkg
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
 .../devicetree/bindings/net/qca,ar803x.yaml        | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 3acd09f0da863137f8a05e435a1fd28a536c2acd..fce167412896edbf49371129e3e7e87312eee051 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -16,8 +16,32 @@ description: |
 
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
+
   qca,clk-out-frequency:
     description: Clock output frequency in Hertz.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -132,3 +156,18 @@ examples:
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
+        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
+        ge_phy: ethernet-phy@7 {
+            compatible = "ethernet-phy-id004d.d0c0";
+            reg = <7>;
+
+            resets = <&gcc GCC_GEPHY_MISC_ARES>;
+        };
+    };

-- 
2.49.0



