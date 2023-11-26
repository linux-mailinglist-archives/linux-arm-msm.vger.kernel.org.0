Return-Path: <linux-arm-msm+bounces-2013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F49D7F90B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 02:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22CFE28135A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 01:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1101138F;
	Sun, 26 Nov 2023 01:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHnxkXPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFDE110;
	Sat, 25 Nov 2023 17:53:56 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332c0c32d19so2137456f8f.3;
        Sat, 25 Nov 2023 17:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963634; x=1701568434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PuPfc3pKT54jXiYQ8Ndfth4/oA2Qy9PCNWIdvTn7YQ=;
        b=dHnxkXPmL0O4KCmluUFo6KG/o+8ZsE9Yb92g10wZpMIKCPkCmzIBEGo4GAzakK606v
         1T5JqmVKjDiSui7Lvz3h7UsZ01TKDSkig9moQcpnvicbuN8jQ+vgD6QefxDwRuLDoR3B
         x4r0j3BZfyKOSyhKfZcsH+ei5ipR/E5ekQvLNpj9fPjUYdzy97pl2AG3q6CblTcA6NGB
         DtYCykrzZAmomS7bmDNQqUkavHIW0ob1uPG6DbMix6goShISZplxtduKt9eKYrPkr/3+
         6RnF7Fx8u8DcmFPCl/C1Moi3/Q1QfescGLaow/eAb5xxrWzQq1uf9Q2RuqnNJRZb16vU
         hv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963634; x=1701568434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PuPfc3pKT54jXiYQ8Ndfth4/oA2Qy9PCNWIdvTn7YQ=;
        b=sy+OXw4YRsaO98r1juLaNPWAfruHEnC9/FleY/glkup93afNRYwITWV1ykrEb+TABc
         Tofviat2iCzIJ4aVJctY2UCqXcJEpQB/iVlpn+KNULrdYnlTnVDA++mL15vT4MR0GiS4
         hM7bDV+v/is0eX561W65hrzLi5hXy9m8l9eS9aeqCwf8WDdiUVzXRGhieKBHs0xjNBsu
         /WVG0xIaDIAj5JuWPJ869ZXLU3aw9KA1gJhZRu7qzfhLbNLnLuDSzPS6unRW4NSKYXuF
         y0y+5J8CmbNXGcQIDDLhgAkBlopLnTBRvuCGtJIz8HWGFIxhNMY1gY4TnAWWN+w8eR4I
         +O1w==
X-Gm-Message-State: AOJu0Yzgv9cYpvmh7+gbRD7jbOv6Payd+3N/c5eC3/Rt/bmrhtMbGVP0
	FrHyg/tBG9XBC7oRT+wUMiI=
X-Google-Smtp-Source: AGHT+IGT3kVk/Y70H/CEAP1Ju5gLlYhiOA1oBECCTELXr6jvCovt5uh7h4dHEkHO63rUGI9WO9Z/HA==
X-Received: by 2002:a05:600c:4e8e:b0:405:7b92:453e with SMTP id f14-20020a05600c4e8e00b004057b92453emr5936349wmq.37.1700963634259;
        Sat, 25 Nov 2023 17:53:54 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:54 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet PHY package nodes
Date: Sun, 26 Nov 2023 02:53:39 +0100
Message-Id: <20231126015346.25208-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document ethernet PHY package nodes used to describe PHY shipped in
bundle of 4-5 PHY. The special node describe a container of PHY that
share common properties. This is a generic schema and PHY package
should create specialized version with the required additional shared
properties.

Example are PHY package that have some regs only in one PHY of the
package and will affect every other PHY in the package, for example
related to PHY interface mode calibration or global PHY mode selection.

The PHY package node MUST declare the base address used by the PHY driver
for global configuration by calculating the offsets of the global PHY
based on the base address of the PHY package and declare the
"ethrnet-phy-package" compatible.

Each reg of the PHY defined in the PHY package node is absolute and will
reference the real address of the PHY on the bus.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
new file mode 100644
index 000000000000..244d4bc29164
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Package Common Properties
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  This schema describe PHY package as simple container for
+  a bundle of PHYs that share the same properties and
+  contains the PHYs of the package themself.
+
+  Each reg of the PHYs defined in the PHY package node is
+  absolute and describe the real address of the PHY on the bus.
+
+properties:
+  $nodename:
+    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  compatible:
+    const: ethernet-phy-package
+
+  reg:
+    minimum: 0
+    maximum: 31
+    description:
+      The base ID number for the PHY package.
+      Commonly the ID of the first PHY in the PHY package.
+
+      Some PHY in the PHY package might be not defined but
+      still exist on the device (just not attached to anything).
+      The reg defined in the PHY package node might differ and
+      the related PHY might be not defined.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: ethernet-phy.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@16 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ethernet-phy-package";
+            reg = <0x16>;
+
+            ethernet-phy@16 {
+              reg = <0x16>;
+            };
+
+            phy4: ethernet-phy@1a {
+              reg = <0x1a>;
+            };
+        };
+    };
-- 
2.40.1


