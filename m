Return-Path: <linux-arm-msm+bounces-57149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11296AAE1D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971471C42E39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A7C28D8CC;
	Wed,  7 May 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aQ0hLmqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB7C28CF7C;
	Wed,  7 May 2025 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626032; cv=none; b=HPPHIBlVgIv6R/0Rp3IxVK6jaJfpeFc9bQ44BJasa4rODf9gk1sie+3auaCZ2S4N6dbX5OoJ3z33alVwBvd+8B2E6iJFKLCG6HAwWNav2sfBfQlM3g6a8sZGaFXhzjl21j1RUU2aS/Vr/IwGhGBKxHYdjHY7CbFUH+e4u4LC++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626032; c=relaxed/simple;
	bh=/YUwI53dosQIhwUovqL95lld3GbM/D3wUmaepMD7Uic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxWUOb2IJrtUHFs/5LifRict6KZBSH+GCkmhiI108bp60mntz+hFNc0w0uOLKToP77OJDu/nh6ecmgYvh7klIH0FSA79R+/PA39CWh4f7lfV0mLcnDZ+ZK+JO1aJtaMDVVW0UgGzftPrOaC7tEuu8qJz0F33Ocfr2cjwdSwyQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aQ0hLmqh; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9715E43B65;
	Wed,  7 May 2025 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746626022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8gtIHzPbiNzUqeVLb3f4EK2VjKBqelEK4wxn9hCfz8=;
	b=aQ0hLmqh/YOPYW05bpAc/agiqUj3iYhQdpGLjInHbbndGlVSKGTAwoDEpkOFwedPm1m7nT
	3VwNQK5NYd7w4U/wSr++uiTxO4cXzRjCxqgHprXuwNPqixm+VT8CY7JUaL2u3incOTt/cm
	0EAg/apNWgwBiFgHKo5b4P3bczkhNu3gCq63QsVtrsvxv8fYcJrt386lJzbpO7xwORi/sS
	pgcmpepklTNaJaip8xHgepRiuATDuLGH/1/D/CCpc2hK1jTwoVl5KD+9lyjcUiS5DgsLde
	xhAb1YdLmT7e7I6G82mF1TtMgGkf+WjCUhxFx1b666qndBs+l7vsLYXyiKwFYA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v6 01/14] dt-bindings: net: Introduce the ethernet-connector description
Date: Wed,  7 May 2025 15:53:17 +0200
Message-ID: <20250507135331.76021-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueelgfdvtdfhkeekudegieekuedukefhkefghefgleekkeekkefhjeekgfevhfeinecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepvdgrtddvmeekgeegtdemfhehtdgsmeefvdehmegrieegfeemudhfiegumehfvggrgeemgegsudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeegtdemfhehtdgsmeefvdehmegrieegfeemudhfiegumehfvggrgeemgegsudeipdhhvghlohepvdgrtddvqdekgeegtddqfhehtdgsqddtfedvhedqrgeigeefqddufheiugdqfhgvrgegqdegsgduiedrrhgvvhdrshhfrhdrnhgvthdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtr
 dhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

The ability to describe the physical ports of Ethernet devices is useful
to describe multi-port devices, as well as to remove any ambiguity with
regard to the nature of the port.

Moreover, describing ports allows for a better description of features
that are tied to connectors, such as PoE through the PSE-PD devices.

Introduce a binding to allow describing the ports, for now with 2
attributes :

 - The number of lanes, which is a quite generic property that allows
   differentating between multiple similar technologies such as BaseT1
   and "regular" BaseT (which usually means BaseT4).

 - The media that can be used on that port, such as BaseT for Twisted
   Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
   ethernet, etc. This allows defining the nature of the port, and
   therefore avoids the need for vendor-specific properties such as
   "micrel,fiber-mode" or "ti,fiber-mode".

The port description lives in its own file, as it is intended in the
future to allow describing the ports for phy-less devices.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../bindings/net/ethernet-connector.yaml      | 47 +++++++++++++++++++
 .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
new file mode 100644
index 000000000000..2aa28e6c1523
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Ethernet Connector
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description:
+  An Ethernet Connectr represents the output of a network component such as
+  a PHY, an Ethernet controller with no PHY, or an SFP module.
+
+properties:
+
+  lanes:
+    description:
+      Defines the number of lanes on the port, that is the number of physical
+      channels used to convey the data with the link partner.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  media:
+    description:
+      The mediums, as defined in 802.3, that can be used on the port.
+    items:
+      enum:
+        - BaseT
+        - BaseK
+        - BaseS
+        - BaseC
+        - BaseL
+        - BaseD
+        - BaseE
+        - BaseF
+        - BaseV
+        - BaseMLD
+        - BaseX
+
+required:
+  - lanes
+  - media
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index 71e2cd32580f..6bf670beb66f 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -277,6 +277,17 @@ properties:
 
     additionalProperties: false
 
+  mdi:
+    type: object
+
+    patternProperties:
+      '^connector-[a-f0-9]+$':
+        $ref: /schemas/net/ethernet-connector.yaml#
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - reg
 
@@ -313,5 +324,12 @@ examples:
                     default-state = "keep";
                 };
             };
+
+            mdi {
+              connector-0 {
+                lanes = <2>;
+                media = "BaseT";
+              };
+            };
         };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c31814c9687..b59a9209fcb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8777,6 +8777,7 @@ R:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-net-phydev
+F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
-- 
2.49.0


