Return-Path: <linux-arm-msm+bounces-55656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F61A9CB4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B4B9E7C35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40BB258CE5;
	Fri, 25 Apr 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CSQwZd0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461642A96;
	Fri, 25 Apr 2025 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745590528; cv=none; b=e99/8uPcjIV8JXbvbvJPrQlheponcI3upJiIySIG6CCf1UNcwHbw2n/pIcezgTOPkSn79T48EUMc17fPN4cYFt/Z8ypUrrfz/y8my3tlEH0BHhNn7efPD4uE5Qpsh3n8dNrDZYq7d5OvtEtNIzhTMBMrP8GKSm0MJzuUnNz4hcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745590528; c=relaxed/simple;
	bh=BMb7B5hhR1Jf9OxI7j18SO0PfAg6EO2cmDfv+EQ8Zf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLxZNdKmxM7fj0NgYbe9/lyxCYmryI9UaArZWLM0UvQrCqOMH/VbhgArjBVO6yUdL+iakzdqkWqrpHxJHGbmis/UKTmo7FZZFmp5KvEx8qkdrcp56oGRqF20D1x8JoGWI8qxAN1S342JAu99Bpgw/ND5pSOcdIfm3rQgl7w3xaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CSQwZd0r; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E106439CA;
	Fri, 25 Apr 2025 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745590517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kp67ZW4VcxmgHTrtBfgJeiGeHmwYCxCqWvLs7V5/pwk=;
	b=CSQwZd0rzUkioacYVX8POLUlhoDsX2VhebrVJu1Vkuiww3zFnwZ3UHCtPnEDLHloU+C80c
	R9EXGAzvRg0UNV9aVdMwiF3sxVr2VtGvNlQoLKdKIVxenSSbrHj23AzmRIZ6qi0sqFdhmS
	uIbHTPIVu9JX4m3DWR2aBuBXVzwfvMAcHlBse1X5b0vlpgHvWWsmo5DYJa7/w4FvHnL9V9
	us6G9+UbIwXqdieMd2yXqg8Tr3E2GMEhlveOgUk9XPBIuovnz82szbDxqke159Kb8qUE39
	xfmhlXAXj59VsaeEvBQplOTbYrYh5AOIyPmzyigyUA7BmznFZMYWwY73CrozyA==
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
Subject: [PATCH net-next v5 01/14] dt-bindings: net: Introduce the ethernet-connector description
Date: Fri, 25 Apr 2025 16:14:54 +0200
Message-ID: <20250425141511.182537-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueelgfdvtdfhkeekudegieekuedukefhkefghefgleekkeekkefhjeekgfevhfeinecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
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
index 82e4b96030df..0a400524e578 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8769,6 +8769,7 @@ R:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-net-phydev
+F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
-- 
2.49.0


