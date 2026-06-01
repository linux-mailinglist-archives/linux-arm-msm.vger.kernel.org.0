Return-Path: <linux-arm-msm+bounces-110602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEkGKtSGHWrAbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:19:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518E61FE50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7CE6300D1CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF3C37FF48;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smBOMuy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F036165E;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319953; cv=none; b=ipwvmk3bPbJdifAJFoDgF9Jvl4IkYxOkfvxatpNKmaBmfR/S3Ba1HiPhvdupSzc9/pea3eAbKhPi/j6Maat/6JyejL5/ad1KDv4dUIzEa2EQAkW4jyk+sOimA2y3c/hsjqXTEwnjodKWriH9ydYzJKSGHNYyXMmc7FBUO72wiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319953; c=relaxed/simple;
	bh=xmmXh5VfQ03Uq105T8eVuLJq94x7v2GCR2zR/xJLGgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPMUTChhxGPhXOkWz7SFMNNqd4JWdrB0riDeIY1gpu1AochFMUa8qS9HlVWXcMznmCp1gUD3P4oHe5mQAHCcfJFoyqWDqL9i9W+j6o+IRXaLsHVCXA17CKWauwxicVJ3rpP8Y+edStE4GQZ/z9UA9wQ6w5Yp4lTV3q+HY9VWsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smBOMuy4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E025AC2BCC6;
	Mon,  1 Jun 2026 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780319953;
	bh=xmmXh5VfQ03Uq105T8eVuLJq94x7v2GCR2zR/xJLGgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=smBOMuy4q7WXgh4FSqbZnETpAV9FUCBQNuLhbrSrjddK+FAjCe5KM3oNYmEoDo3t1
	 VBffP6eUoyssbRwsSdEBbEXdh0xVjv469LPstwJK/Ckb7Zl8NLpBD8wtHkfEGGLk4t
	 f5B253PZ9QTaNtkR01MGr3NvzNuU24aSG0M/muW5OR04KSxDUAIqPEO+CI1h0jTuf8
	 o6z3kTFpUIQoH6pZ4wl6IyeDSjdhWMizC36JwJ6GxeXn1qI91b7K/qVkF1yltJR+s3
	 kXilCMleLyZotxRG1UrlUTpF0oIqoI97FfxNPMxVes1IyfroaR3dQ+H5pZjdxd9MFM
	 1jw218qIvA2wQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D40CD6E57;
	Mon,  1 Jun 2026 13:19:12 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 01 Jun 2026 17:19:08 +0400
Subject: [PATCH 1/3] dt-bindings: net: qca,ipq5018: Split IPQ5018 PHY
 bindings from ar803x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-ipq5018-gephy-clocks-v1-1-2df8287712c3@outlook.com>
References: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
In-Reply-To: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780319950; l=4946;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=zsshv5XwQ6s+2bhZxuItk5jzaYFbE1IDzznh2Ip/hvg=;
 b=l/HtaEnkoaMuqY27S6XK3iW/CtF8Y5Lumxm6quNMv57kyg72AeNvJssVOdckwf8TZ//qPOpPg
 Gn8NB0CNlcaAQ/G/6m2dgIUeOTeHsdvwjsTLLT3rghcKnQIOF4OHipd
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110602-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email,devicetree.org:url,0.0.0.7:email]
X-Rspamd-Queue-Id: 4518E61FE50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

Move the definition for the Qualcomm IPQ5018 Internal PHY out of the
qca,ar803x.yaml binding file and isolate them in a dedicated
qca,ipq5018.yaml file. This is necessary due to the restriction of max
one clock in ethernet-phy.yaml which ar803x references as further
testing revealed that the RX and TX clocks of the IPQ5018 PHY need to
be explicitly enabled.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/net/qca,ar803x.yaml        | 43 -------------
 .../devicetree/bindings/net/qca,ipq5018.yaml       | 75 ++++++++++++++++++++++
 2 files changed, 75 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 7ae5110e7aa2..3acd09f0da86 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -16,37 +16,8 @@ description: |
 
 allOf:
   - $ref: ethernet-phy.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - ethernet-phy-id004d.d0c0
-
-    then:
-      properties:
-        reg:
-          const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC
-
-        resets:
-          items:
-            - description:
-                GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.
-
-        qcom,dac-preset-short-cable:
-          description:
-            Set if this phy is connected to another phy to adjust the values for
-            MDAC and EDAC to adjust amplitude, bias current settings, and error
-            detection and correction algorithm to accommodate for short cable length.
-            If not set, DAC values are not modified and it is assumed the MDI output pins
-            of this PHY are directly connected to an RJ45 connector.
-          type: boolean
 
 properties:
-  compatible:
-    enum:
-      - ethernet-phy-id004d.d0c0
-
   qca,clk-out-frequency:
     description: Clock output frequency in Hertz.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -161,17 +132,3 @@ examples:
             };
         };
     };
-  - |
-    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
-
-    mdio {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        ge_phy: ethernet-phy@7 {
-            compatible = "ethernet-phy-id004d.d0c0";
-            reg = <7>;
-
-            resets = <&gcc GCC_GEPHY_MISC_ARES>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/net/qca,ipq5018.yaml b/Documentation/devicetree/bindings/net/qca,ipq5018.yaml
new file mode 100644
index 000000000000..7cdc96f6d389
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qca,ipq5018.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qca,ipq5018.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Atheros IPQ5018 Internal PHY
+
+maintainers:
+  - George Moussalem <george.moussalem@outlook.com>
+
+description: |
+  The IPQ5018 PHY is part of the IPQ5018 SoC and is always wired to GMAC0.
+  The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
+  802.3az EEE.
+
+properties:
+  compatible:
+    const: ethernet-phy-id004d.d0c0
+
+  reg:
+    const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC
+
+  clocks:
+    items:
+      - description: RX clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: rx
+      - const: tx
+
+  resets:
+    items:
+      - description:
+          GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.
+
+  qcom,dac-preset-short-cable:
+    description: |
+      Set if this phy is connected to another phy to adjust the values for
+      MDAC and EDAC to adjust amplitude, bias current settings, and error
+      detection and correction algorithm to accommodate for short cable length.
+      If not set, DAC values are not modified and it is assumed the MDI output pins
+      of this PHY are directly connected to an RJ45 connector.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
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
+            clocks = <&gcc GCC_GEPHY_RX_CLK>,
+                     <&gcc GCC_GEPHY_TX_CLK>;
+            clock-names = "rx", "tx";
+            resets = <&gcc GCC_GEPHY_MISC_ARES>;
+        };
+    };

-- 
2.53.0



