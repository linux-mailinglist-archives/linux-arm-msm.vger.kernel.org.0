Return-Path: <linux-arm-msm+bounces-1914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BD7F8731
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 01:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 267821C20D39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 00:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BBC38E;
	Sat, 25 Nov 2023 00:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPqCne8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E2C173D;
	Fri, 24 Nov 2023 16:35:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332e3ad436cso1232351f8f.3;
        Fri, 24 Nov 2023 16:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872520; x=1701477320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03wonMi6/ThM2gO3QCZn24JsXK7jMYiMUg0Bft7Hcig=;
        b=QPqCne8jDezXZ7k7Y760MTwPH0y9dgENWHdqMucf/cbM6WyS0ZBZGUdtPLvvTqhapB
         HonowiaHGmBdE4nYW9RdaV4sINlas0NGpdfhTwbx+T+oE/5xV34nmnIS4SPSmIoykX4O
         Phek3ytuG+1swrjN3i1/hItieMmhTqYrsDQON7MBmVgb8uBBe0a/L+B4KnZXrXffpA9w
         VKfGWipRzIfkjpUpf9P46UkjE8VmnbHLzdz70IuROIAJCiN1ef+HbePj+AEZ4TwEmesd
         ho+ZFj3p4xTUR/l9Q/eFSZygxU1ilozTZKF8hbnVMqpBh47e2WqkqCGHegfewbq7/OwH
         xV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872520; x=1701477320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03wonMi6/ThM2gO3QCZn24JsXK7jMYiMUg0Bft7Hcig=;
        b=ZMWgyG99Sv+vLRN4Vm+Dn4UfjVkdg84B8LuZZslz5vFnCI/7I+KoFx/20W1zb19fZG
         0IlHF1/9RIuR3HDng6cTRUxk1lQUj6cR3xGsCVfxv2TCxOVV0R9DfKVzImv7YVY2zoni
         Y5kneEt4rUvM8Cjzh03wfg41KrhsF3qs3SBFB9N8HT51nge3mMWrtLjUzBx3KmVIh1DR
         AOoMpiGFERjex1yrfRXGr4eaS2Pw/c3xAVvwqGS1s16YjnQLNw13C1Eaok4SNkIRBAYx
         aQGzsQ3tr63yLmsPooVgVrjYMLyPHDhAZ7fOkyhv7mlnnoj4zS2z62esskSbDNtBL5Ab
         oqdA==
X-Gm-Message-State: AOJu0YwvjNbrhWAIW32z8LdxVsO4BcRWhNh+68/ogLkOJW2QcqZYaP1B
	2Y/xfqnMiqOnQSDCCjfuiwY=
X-Google-Smtp-Source: AGHT+IHEXCiKhc3oIX7bfHnHDv4+GrDV+EmGNkZQq6BamuJtr7wYxNTmW7a5qF0Rt8heIN6J/MZhxw==
X-Received: by 2002:a5d:6605:0:b0:332:e31b:1f3 with SMTP id n5-20020a5d6605000000b00332e31b01f3mr3398583wru.31.1700872519970;
        Fri, 24 Nov 2023 16:35:19 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:19 -0800 (PST)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 02/11] dt-bindings: net: document ethernet PHY package nodes
Date: Sat, 25 Nov 2023 01:11:18 +0100
Message-Id: <20231125001127.5674-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document ethernet PHY package nodes used to describe PHY shipped in
bundle of 4-5 PHY. These particular PHY require specific PHY in the
package for global onfiguration of the PHY package.

Example are PHY package that have some regs only in one PHY of the
package and will affect every other PHY in the package, for example
related to PHY interface mode calibration or global PHY mode selection.

The PHY package node MUST declare the base address used by the PHY driver
for global configuration by calculating the offsets of the global PHY
based on the base address of the PHY package.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-phy-package.yaml    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
new file mode 100644
index 000000000000..943952749b40
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Package Common Properties
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com
+
+select:
+  properties:
+    $nodename:
+      pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  required:
+    - $nodename
+
+properties:
+  $nodename:
+    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  reg:
+    minimum: 0
+    maximum: 31
+    description:
+      The ID number for the PHY.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: /schemas/net/ethernet-phy.yaml#
+
+required:
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
+        ethernet-phy-package@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            ethernet-phy@0 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <0>;
+            };
+
+            phy4: ethernet-phy@4 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <4>;
+            };
+        };
+    };
-- 
2.40.1


