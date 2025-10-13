Return-Path: <linux-arm-msm+bounces-77017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F1BD389D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB70B4F2700
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98C321930A;
	Mon, 13 Oct 2025 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NKhpB3Dp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0A25487B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365943; cv=none; b=HkuaANMOkd2uHOyH2M0ELp7G2s2rGqBmGfb1xJqke4OtgfSTaB8mxGTBx9IL9zxoqONHrDJN67Vejh9Du6BFZPGSPrdTLYQdVbYOFrqrVbFSbDXFuOCt7/OUs6uK+5QqtcBPR3YCn4b3eajTD8j1npoq9/YzkJ4S3yo3GVOacvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365943; c=relaxed/simple;
	bh=g8KAItMxqGh58fKhDH9zXyPtCIQXOhVV82SeN3YxuRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8mbCWXV52wA6bIF/Nixa9dbhtQR59Esz1XiX8QSN7rB4QX1YTyyiUIT5yaEeYMlZC9Nj2bs28qfscbUazI02kXIOOA27aPRKr3DKwS6eegd794Y3pEREkDfuTVUGJ+9FdobmfJ3NjKwYPyNGm8HxpB+0p9WBTBxkKK2NV/gzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NKhpB3Dp; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BF3DFC0939E;
	Mon, 13 Oct 2025 14:32:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE221606C6;
	Mon, 13 Oct 2025 14:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83623102F226E;
	Mon, 13 Oct 2025 16:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760365936; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QKx/9Kg9WdG4BqQHrTLy+3ecam/VdZlfXnFTJynxmHg=;
	b=NKhpB3DpEkCIZEU1rjC7qLfVG4+A0k7Rqr0SICicaHTpTSKnw8wqjSVhv9WK0uWUdNh6CL
	FLwBriMDYyrFWtUTOngpSKj4UclZtg67G4bijqg/PPaFI7ek92xEN+mYLFFfkgDz4/i2N0
	g1oiJiGIMS07m2bKVrkGMOomQXG2EUCY0Xhi2LzyVD0B8KsLFFja9zCluZWytFUcGr1gl0
	W0bHZKP/aJnDp9Is60D1eAOL+wKuvI7zDyaHvWu0+vY1PzqGUREaOeVFS1XWVrliZd4lCY
	OGavY7BxmyjxRQ+LP/nB2bYfb3bgKm7nZJYN8FIaRRtC+JOFrFZWHFHKscGZLw==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the ethernet-connector description
Date: Mon, 13 Oct 2025 16:31:27 +0200
Message-ID: <20251013143146.364919-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../bindings/net/ethernet-connector.yaml      | 45 +++++++++++++++++++
 .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
new file mode 100644
index 000000000000..32ae9f45b0e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
@@ -0,0 +1,45 @@
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
+  An Ethernet Connector represents the output of a network component such as
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
+    enum:
+      - BaseT
+      - BaseK
+      - BaseS
+      - BaseC
+      - BaseL
+      - BaseD
+      - BaseE
+      - BaseF
+      - BaseV
+      - BaseMLD
+
+required:
+  - lanes
+  - media
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index 2ec2d9fda7e3..5ba04170a503 100644
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
+            /* Fast Ethernet port, with only 2 pairs wired */
+            mdi {
+                connector-0 {
+                    lanes = <2>;
+                    media = "BaseT";
+                };
+            };
         };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a27901781c2..2f8a5ae66314 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9268,6 +9268,7 @@ R:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-net-phydev
+F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
-- 
2.49.0


